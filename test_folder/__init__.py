from flask import Flask, render_template
from flask_mysqldb import MySQL
from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)

def index():
    return render_template("index.html")


if __name__ == "__main__":
    app.run(port=3000)