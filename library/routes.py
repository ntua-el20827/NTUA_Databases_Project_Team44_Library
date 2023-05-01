from flask import render_template, request, redirect, url_for
from library import app
from library.forms import MyForm

@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html')


@app.route("/check_username", methods=["POST"])
def check_username():
    username = request.form["username"]
    if username == "george":
        return redirect(url_for("routes.admin"))
    else:
        return render_template("index.html", error="Invalid username")

@app.route("/admin")
def admin():
    return render_template("admin.html")