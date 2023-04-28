from flask import Flask, render_template, request, flash, redirect, url_for, abort, request
from flask_mysqldb import MySQL
from test_folder import app,db  # initially created by __init__.py, need to be used here
from test_folder import *


# home page

@app.route("/")
def index():
    try:
        return render_template("landing.html", pageTitle = "Welcome!")
    except Exception as e:
        print(e)
        return render_template("landing.html", pageTitle = "Welcome!")