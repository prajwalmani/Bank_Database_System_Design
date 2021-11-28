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
    return render_template("home.html")


@app.route('/', methods=['GET', 'POST'])
def auth():
    email=request.form['email']
    password=request.form['password']

    sql="SELECT * FROM `auth`;"

    cursor.execute(sql)
    rows=cursor.fetchall()
    for row in rows:
        if email==row[0] and password==row[1]:
            print("successfull")
        #     return "successful"
    
    return "not found!"

@app.route('/userregister',methods=['GET', 'POST'])
def userregister():
    if request.method == 'POST':
        ssn=request.form['SSN']
        branchid=request.form['Branch']
        password=request.form['Password']
        repassword=request.form['RePassword']
        if password!=repassword:
            flash("Passwords dont match!.")
            return render_template("userregister.html")

        sql="select ESSN,Branch_ID from employee where ESSN={0} and Branch_ID={1}".format(ssn,branchid)
        cursor.execute(sql)
        rows=cursor.fetchall()
        for row in rows:
            return redirect(url_for('employee'))
        else:
            flash("Employee not present in the database!")
    return render_template("userregister.html")

@app.route('/employee')
def employee():
    return "Success"

if __name__ == "__main__":
    app.run(debug=True)