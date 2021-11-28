from flask import Flask,render_template,request,flash
from flask.wrappers import Request
import pymysql
from pymysql import ROWID, cursors

app = Flask(__name__)

connection =pymysql.connect(host="localhost",user="root",passwd="",database="test")
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


if __name__ == "__main__":
    app.run(debug=True)