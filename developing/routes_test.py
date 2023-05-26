from flask import render_template, request, redirect, url_for, app
from flask_mysqldb import MySQL
from library import app,mysql
from library.forms import  LoginForm

#route for the first login page
@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html')

#route for checking the username and password the user gave
@app.route("/check_superadmin", methods=["POST"])
def check_superadmin():
    #for the super_admin we check the initialization of the app
    username = request.form["username"]
    password = request.form["password"]
    if username == app.config.get('DB_ADMIN_USERNAME') and password == app.config.get('DB_ADMIN_PASSWORD'):
        return redirect(url_for('super_admin'))
    else:
        # code for checking the other users (basic_user or admin)
        # I have to check the database
        return render_template("index.html", error="Invalid username or password")


#route for the page of the super_admin
@app.route("/super_admin")
def super_admin():
    #We want to print his name 
    fname = app.config.get('DB_ADMIN_FIRSTNAME')
    lname = app.config.get('DB_ADMIN_LASTNAME') 
    # code for a list of all schools and admins
    # \/\/\/
    cur = mysql.connection.cursor()
    cur.execute('''SELECT school_id, school_name FROM school''') # ισως σε τέτοιου είδους εντολές χρειαζόμαστε τα queries
    schools = cur.fetchall()
    #print(schools)
    cur.close()
    #return render_template('admin.html', schools=schools)
    # /\/\/\
    return render_template("super_admin.html", super_admin_fname = fname, super_admin_lname = lname, schools=schools)

@app.route("/admin")
def admin():
    return render_template("admin.html")

@app.route("/mybooks")
def mybooks():
    school_id  =session
    return render_template("mybooks.html")