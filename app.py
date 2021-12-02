from flask import Flask,render_template,request,flash,url_for,redirect
from flask.wrappers import Request
import pymysql
from pymysql import ROWID, cursors

app = Flask(__name__)

app.secret_key = "super secret key"


connection =pymysql.connect(host="localhost",user="root",passwd="",database="bank")
cursor=connection.cursor()

@app.route('/')
def home():
    return "Home"

@app.route('/customerlogin.html')
def customerlogin():
    return render_template("customerlogin.html")



@app.route('/customerlogin.html', methods=['GET', 'POST'])
def userauth():
    email=request.form['email']
    password=request.form['password']

    sql="SELECT * FROM `userresgister`;"
    cursor.execute(sql)
    rows=cursor.fetchall()
    for row in rows:
        if email==row[0] and password==row[1]:
                return render_template("accountsdisp.html")
    else:
        flash("Wrong credentials! Try again... ")
        return  render_template("customerlogin.html")

@app.route("/employeelogin.html",methods=['GET',"POST"])
def employeeauth():
    return render_template("employeelogin.html")
    

@app.route('/employeeregister.html',methods=['GET', 'POST'])
def employeeregister():
    if request.method == 'POST':
        ssn=request.form['SSN']
        branchid=request.form['Branch']
        password=request.form['Password']
        repassword=request.form['CPassword']
        if ssn=='' or branchid=='' or password=='' or repassword=='':
            flash("All the fields should be filled")
            return render_template("employeeregister.html")


        if password!=repassword:
            flash("Passwords dont match!.")
            return render_template("employeeregister.html")

        sql="select ESSN,Branch_ID from employee where ESSN={0} and Branch_ID={1}".format(ssn,branchid)
        cursor.execute(sql)
        rows=cursor.fetchall()
        for row in rows:
            return redirect(url_for('employee'))
        else:
            flash("Employee not found!")
    return render_template("employeeregister.html")

@app.route('/customerregister.html',methods=['GET', 'POST'])
def customerregister():
    if request.method == 'POST':
        ssn=request.form['SSN']
        password=request.form['Password']
        repassword=request.form['CPassword']
        if password!=repassword:
                flash("Passwords dont match!.")
                return render_template("customerregister.html")
        sql="select CSSN from customer where CSSN={0}".format(ssn)
        cursor.execute(sql)
        rows=cursor.fetchall()
        for row in rows:
            return redirect(url_for('customerlogin'))
        else:
            flash("Customer not found!")
    return render_template("customerregister.html")




@app.route('/accountsdisp.html',methods=['POST','GET'])
def accountsdisp():
    pass

@app.route('/employee')
def employee():
    return "Success"

if __name__ == "__main__":
    app.run(debug=True)