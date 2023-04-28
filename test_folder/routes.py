from flask import Blueprint, render_template, request, redirect, url_for

bp = Blueprint("routes", __name__)

@bp.route("/")
def index():
    return render_template("index.html")

@bp.route("/check_username", methods=["POST"])
def check_username():
    username = request.form["username"]
    if username == "george":
        return redirect(url_for("routes.admin"))
    else:
        return render_template("index.html", error="Invalid username")

@bp.route("/admin")
def admin():
    return render_template("admin.html")
