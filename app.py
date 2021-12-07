from flask import Flask,render_template,request,flash,url_for,redirect
from flask.templating import render_template_string
from flask.wrappers import Request
import pymysql
from pymysql import ROWID, cursors
import json

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
    sql='select account,balance,last_accessed_date,account_type from `account`where cssn={0};'.format(ssn)
    cursor.execute(sql)
    rows=cursor.fetchall()
    jsondata={}
    for row in rows:
        account_type=row[3]
        if account_type=='s':
            account=row[0]
            savings_sql="select * from `savings` where savingsaccount={0};".format(account)
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
            print(jsondata)

        if account_type=='l':
            loan_account=row[0]
            buff_dict={}
            jsondata.update(buff_dict)

        if account_type=='c':
            checking_account=row[0]
            buff_dict={}
            jsondata.update(buff_dict)

        if account_type=='m':
            money_market_account=row[0]
            buff_dict={}
            jsondata.update(buff_dict)
        
    return render_template("customeraccountsdisp.html",data=jsondata)

@app.route('/employee')
def employee():
    return "Success"

if __name__ == "__main__":
    app.run(debug=True)