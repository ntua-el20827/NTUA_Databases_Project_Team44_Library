from flask import Flask, render_template, request, flash, redirect, url_for, abort, request
from flask_mysqldb import MySQL
from . import test_folder


global is_admin #for login
is_admin=False

# home page

@test_folder.route("/")
def index():
    try:
        return render_template("landing.html", pageTitle = "Welcome!")
    except Exception as e:
        print(e)
        return render_template("landing.html", pageTitle = "Welcome!")