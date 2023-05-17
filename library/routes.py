from flask import render_template, request, redirect, url_for, session, flash
from flask_mysqldb import MySQL
from library import app,mydb
from library.forms import *


# Route for the first page
@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == "POST":
        print("HI")
        school_name = request.form['school_name']
        session['school_name'] = school_name
        #print(school_name)
        #query για να πάρω το school_id
        #query = "SELECT school_id from school where shcool_name = %s"
        #cur = mydb.connection.cursor()
        #cur.execute(query,school_name)
        #school_id = cur.fetchone() # με την fetchall() πιάνω όλα όσα ηρθαν απο το execute που έγινε!!
        #cur.close()
        #session['shcool_id'] = school_id
        return redirect(url_for('login'))
    else:
        # Read the query from queries.sql
        #with open('/home/george/Workshop/uni/dblab/project/library/sql/queries.sql', 'r') as file:
         #   queries = file.read().split(';')
        #query = queries[0]
        query = "SELECT school_name from school"
        # Execute the query to get a list of all schools from the database
        cur = mydb.connection.cursor()
        cur.execute(query)
        schools = cur.fetchall() # με την fetchall() πιάνω όλα όσα ηρθαν απο το execute που έγινε!!
        cur.close()
        #schools.strip("(),")
        print(schools)
        first_values = [t[0] for t in schools]
        # Render the template for the first page
        return render_template('index.html',schools=first_values)


# Route for the login page
@app.route('/login', methods=['GET', 'POST'])
def login():
    #return render_template("hello.html")
    if request.method == "POST":
        # Get the entered username and password from the form
        username = request.form['username']
        password = request.form['password']
        session['username'] = username
        session['password'] = password
        #school_id = session['school_id']
        
        # Query the database to validate the user's credentials
        cur = mydb.connection.cursor()
        query = "SELECT * FROM lib_user WHERE user_name = %s AND user_pwd = %s"
        cur.execute(query, (username, password))
        user = cur.fetchone()
        cur.close()
        
        if user:
            # User exists in the database and credentials are valid
            session['user_id'] = user[0]  # Store user ID in session for future use
            #print(user[0])
            return redirect(url_for('dashboard'))  # Redirect to the dashboard page after successful login
        else:
            # Invalid credentials, show an error message
            error_message = "Invalid username or password"
            return render_template('login.html', error_message=error_message)
    
    # Render the template for the login page with the form
    return render_template('login.html')


# Route for the dashboard page
@app.route('/dashboard')
def dashboard():
    # Check if the user is authenticated and retrieve their information from the database
 
    if 'user_id' in session:
        user_id = session['user_id']
        cur = mydb.connection.cursor()
        query = "SELECT * FROM lib_user WHERE user_id = %s"
        cur.execute(query, (user_id,))
        user = cur.fetchone()
        cur.close()
        
        if user:
            # User exists, render the template for the dashboard page
            return render_template("hello.html")

    # User is not authenticated, redirect to the login page
    return render_template("hello.html")

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == "POST":
        newusername = request.form['newusername']
        newpassword = request.form['newpassword']
        fname = request.form['fname']
        lname = request.form['lname']
        email = request.form['email']
        phone = request.form['phone']
        cur = mydb.connection.cursor()
        query = "INSERT INTO users_applications (username, password, first_name, last_name, email, phone) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (newusername, newpassword, fname, lname, email, phone)
        cur.execute(query, values)
        mydb.connection.commit()
        cur.close()
        return redirect(url_for('login'))
    else:
        return render_template("signup.html")


@app.route('/school', methods=['GET', 'POST'])
def school():
    if request.method == "POST":
        print("hi")
    else:
        cur = mydb.connection.cursor()
        school_id = session['school_id']
        query = "SELECT title, ISBN, book_image FROM book WHERE shcool_id = %s" 
        cur.execute(query,school_id)
        books = cur.fetchall()
        cur.close()
        return render_template('school.html',books = books ) 


""" @app.route('/superadmin', methods=['GET', 'POST'])
def superadmin():

@app.route('/student', methods=['GET', 'POST'])
def student():

@app.route('/teacher', methods=['GET', 'POST'])
def teacher():

@app.route('/schooladmin', methods=['GET', 'POST'])
def schooladmin(): """