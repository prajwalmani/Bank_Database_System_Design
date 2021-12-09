from types import MethodDescriptorType
from flask import Flask,render_template,request,flash,url_for,redirect
from flask.templating import render_template_string
from flask.wrappers import Request
import pymysql
from pymysql import DATE, ROWID, cursors
import json
import os 
import time
import uuid
import datetime
from datetime import date


app = Flask(__name__)

app.secret_key = "super secret key"


connection =pymysql.connect(host="localhost",user="root",passwd="",database="bank")
cursor=connection.cursor()

global_ssn=[]

@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method=='POST':
        customerbutton=request.form.get('customerbutton')
        employeebutton=request.form.get('employeebutton')
        if customerbutton=='cb':
            return redirect(url_for("customerauth"))
        elif employeebutton=='eb':
            return redirect(url_for("employeeauth"))
        else:
            pass
    return render_template('home.html')

@app.route('/customerlogin.html', methods=['GET', 'POST'])
def customerauth():
    if request.method == 'POST':
        email=request.form['email']
        password=request.form['password']

        sql="SELECT * FROM `auth`;"
        cursor.execute(sql)
        rows=cursor.fetchall()
        for row in rows:
            if email==row[0] and password==row[1]:
                    global_ssn.append(row[2])
                    return redirect(url_for('customeraccountsdisp'))
        else:
            flash("Wrong credentials! Try again... ")
            return  render_template("customerlogin.html")
    return render_template("customerlogin.html")

@app.route("/employeelogin.html",methods=['GET',"POST"])
def employeeauth():
    if request.method == 'POST':
        email=request.form['email']
        password=request.form['password']

        sql="SELECT * FROM `auth`;"
        cursor.execute(sql)
        rows=cursor.fetchall()
        for row in rows:
            if email==row[0] and password==row[1]:
                return render_template("employeedisp.html")
        else:
            flash("Wrong credentials! Try again... ")
            return  render_template("employeelogin.html")
    return  render_template("employeelogin.html")

@app.route('/employeeregister.html',methods=['GET', 'POST'])
def employeeregister():
    if request.method == 'POST':
        ssn=request.form['SSN']
        email=request.form['email']
        branchid=request.form['Branch']
        password=request.form['Password']
        repassword=request.form['CPassword']
    
        if password!=repassword:
            flash("Passwords dont match!.")
            return render_template("employeeregister.html")

        sql="select ESSN,Branch_ID from employee where ESSN={0} and Branch_ID={1}".format(ssn,branchid)
        cursor.execute(sql)
        rows=cursor.fetchall()
        for row in rows:
            sql=("""INSERT INTO `auth`(`email`, `password`, `SSN`) VALUES (%s,%s,%s)""")
            values=(email,password,ssn)
            cursor.execute(sql,values)
            connection.commit()
            return redirect(url_for('employee'))
        else:
            flash("Employee not found!")
    return render_template("employeeregister.html")

@app.route('/customerregister.html',methods=['GET', 'POST'])
def customerregister():
    if request.method == 'POST':
        ssn=request.form['SSN']
        email=request.form['email']
        password=request.form['Password']
        repassword=request.form['CPassword']
        if password!=repassword:
                flash("Passwords dont match!.")
                return render_template("customerregister.html")
        sql="select CSSN from customer where CSSN={0}".format(ssn)
        cursor.execute(sql)
        rows=cursor.fetchall()
        for row in rows:
            sql=("""INSERT INTO `auth`(`email`, `password`, `SSN`) VALUES (%s,%s,%s)""")
            values=(email,password,ssn)
            cursor.execute(sql,values)
            connection.commit()
            return redirect(url_for('customerlogin'))
        else:
            flash("Customer not found!")
    return render_template("customerregister.html")


@app.route('/customeraccountsdisp.html',methods=['POST','GET'])
def customeraccountsdisp():
    ssn=global_ssn[-1]
    f = open("phpdata.txt", "w")
    f.write(ssn)
    f.close()
    sql='select account,balance,last_accessed_date,account_type from `account`where cssn={0};'.format(ssn)
    cursor.execute(sql)
    rows=cursor.fetchall()
    jsondata={}
    for row in rows:
        account_type=row[3]
        if account_type=='s':
            savings_account=row[0]
            savings_sql="select * from `savings` where savingsaccount={0};".format(savings_account)
            cursor.execute(savings_sql)
            rows=cursor.fetchall()
            for row in rows:
                buff_dict={
                    "s":{
                        "savingsaccount":row[0],
                        "last_accessed_data":row[1],
                        "savings_interset_rate":row[2]
                    }
                }
                jsondata.update(buff_dict)

        if account_type=='l':
            loan_account=row[0]
            loan_sql="SELECT * FROM `loan` where loan#={0};".format(loan_account)
            cursor.execute(loan_sql)
            rows=cursor.fetchall()
            for row in rows:
                buff_dict={
                    "l":{
                        "loanaccount":row[0],
                        "amount":row[1],
                        "repaymentamount":row[2],
                        "interesetrate":row[3],
                        "account":row[4]
                    }
                }
                jsondata.update(buff_dict)

        if account_type=='c':
            checking_account=row[0]
            checkingsql="SELECT * FROM `checking` where checkingaccount={0}".format(checking_account)
            cursor.execute(checkingsql)
            rows=cursor.fetchall()
            for row in rows:
                buff_dict={
                    "c":{
                        "checkingaccount":row[0],
                        "overdraftedamount":row[1],
                        "overdraftedaccount":row[2],
                        "date":row[3]
                    }
                }
                jsondata.update(buff_dict)

        if account_type=='m':
            money_market_account=row[0]
            money_market_sql="SELECT * FROM `moneymarket` where marketaccount={0}".format(money_market_account)
            cursor.execute(money_market_sql)
            rows=cursor.fetchall()
            for row in rows:
                buff_dict={
                    "m":{
                        "marketaccount":row[0],
                        "updateddate":row[1],
                        "marketinterestrate":row[2]
                    }
                }
                jsondata.update(buff_dict)
        
    return render_template("customeraccountsdisp.html",data=jsondata)

@app.route('/contactus.html')
def contactus():
    return render_template("contactus.html")


@app.route('/transfer.html', methods=['GET', 'POST'])
def transfer():
    flag=0
    ssn=global_ssn[-1]
    # cheque deposit 
    if request.method == 'POST' and "toaccountno" in request.form:
        toaccountno=request.form['toaccountno']
        toamount=request.form['toamount']
        try:
            sql="select `account`,`balance` from `account` where `cssn`={0}".format(ssn)
            cursor.execute(sql)
            rows=cursor.fetchall()
            for row in rows:
                balance=int(row[1])-int(toamount)
                account=row[0]
                update_sql="""UPDATE `account` 
                SET `balance`={0}
                where account={1}""".format(balance,account)
                cursor.execute(update_sql)
                connection.commit()
                insert_quer=("""
                INSERT INTO `transct` (`transactionid`, `account`, `type`, `tname`, `amount`,`balance` ,`time`) VALUES (%s,%s,%s,%s,%s,%s,%s)
                """)
                values=(uuid.uuid1(),account,"CDD","Cheque Deposit Debit",toamount,balance,datetime.datetime.utcnow())
                cursor.execute(insert_quer,values)
                connection.commit()
            sql="select `balance` from `account` where `account`={0}".format(toaccountno)
            cursor.execute(sql)
            rows=cursor.fetchall()
            for row in rows:
                balance=int(row[0])+int(toamount)
                update_sql="""UPDATE `account` 
                SET `balance`={0}
                where account={1}""".format(balance,toaccountno)
                cursor.execute(update_sql)
                connection.commit()
                insert_quer=("""
                INSERT INTO `transct` (`transactionid`, `account`, `type`, `tname`, `amount`,`balance` ,`time`) VALUES (%s,%s,%s,%s,%s,%s,%s)
                """)
                values=(uuid.uuid1(),toaccountno,"CDC","Cheque Depost Credit ",toamount,balance,datetime.datetime.utcnow())
                cursor.execute(insert_quer,values)
                connection.commit()
                flash("Cheque deposited to Account No:{0} worth of ${1}".format(toaccountno,toamount))

        except:
            flash("Failure Cheque not deposited!")
    
    # withdraw money 
    if request.method=="POST" and "waccount" in request.form:
        radio_value=request.form['waccount']
        amount=request.form['amount']
        try:
            if radio_value=='s':
                sql="select `account`,`balance` from `account` where `account_type`= 's' and `cssn`={0}".format(ssn)
            if radio_value=='c':
                sql="select `account`,`balance` from `account` where `account_type`='c' and `cssn`={1}".format(ssn)
            cursor.execute(sql)
            rows=cursor.fetchall()
            for row in rows:
                balance=int(row[1])-int(amount)
                if balance<0 and radio_value=='s':
                    flash("Insufficent Funds")
                if balance<0 and radio_value=='c':
                    flash("Overdrafted But transaction was successfull")
                    overdraftedsql=("""
                    INSERT INTO `checking`(`checkingaccount`, `overdrafted_amount`, `overdrafted_account`, `date`) VALUES (%s,%s,%s,%s)
                    """)
                    today=date.today()
                    values=(row[0],balance,"1234",today)
                    cursor.execute(overdraftedsql,values)
                    connection.commit()
                account=row[0]
                update_sql="""UPDATE `account` 
                SET `balance`={0}
                where account={1}""".format(balance,account)
                cursor.execute(update_sql)
                connection.commit()
                insert_quer=("""
                INSERT INTO `transct` (`transactionid`, `account`, `type`, `tname`, `amount`,`balance` ,`time`) VALUES (%s,%s,%s,%s,%s,%s,%s)
                """)
                values=(uuid.uuid1(),account,"MW","Money Withdraw",amount,balance,datetime.datetime.utcnow())
                cursor.execute(insert_quer,values)
                connection.commit()
                flash("Transcation was successfull")
        except:
            pass
        
    # cash deposit 
    if request.method == 'POST' and "raccount" in request.form:
        ssn=global_ssn[-1]
        radio_value=request.form['raccount']
        eamount=request.form['eamount']
        try:
            if radio_value=='s':
                sql="select `account`,`balance` from `account` where `account_type`= 's' and `cssn`={0}".format(ssn)
            if radio_value=='c':
                sql="select `account`,`balance` from `account` where `account_type`='c' and `cssn`={0}".format(ssn)
            cursor.execute(sql)
            rows=cursor.fetchall()
            for row in rows:
                balance=int(row[1])+int(eamount)
                account=row[0]
                update_sql="""UPDATE `account` 
                SET `balance`={0}
                where account={1}""".format(balance,account)
                cursor.execute(update_sql)
                connection.commit()
                insert_quer=("""
                INSERT INTO `transct` (`transactionid`, `account`, `type`, `tname`, `amount`,`balance` ,`time`) VALUES (%s,%s,%s,%s,%s,%s,%s)
                """)
                values=(uuid.uuid1(),account,"CSD","Cash Deposit",eamount,balance,datetime.datetime.utcnow())
                cursor.execute(insert_quer,values)
                connection.commit()
                flash("TransactionID:{0}\nAccount:{1}\nType:Cash Deposit\nAmount:${2}\nTotal Balance:${3}\n".format(uuid.uuid1(),account,eamount,balance))
        except:
                 flash("Couldn't find any savings/checking account link to this Email id Please contact the branch.")
    return render_template("transfer.html")

# @app.route("acctransactiondisplay.html",methods=['GET', 'POST'])
def acctransdisp():
    return render_template("acctransactiondisplay.html")


if __name__ == "__main__":
    app.run(debug=True)