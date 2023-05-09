from flask import render_template, request, redirect, url_for, app,session
from flask_mysqldb import MySQL
from library import app,mysql
from library.forms import *


# Route for the first page
@app.route('/')
def index():
    # Read the query from queries.sql
    with open('/home/george/Workshop/uni/dblab/project/library/sql/queries.sql', 'r') as file:
        queries = file.read().split(';')
    query = queries[0]
    # Execute the query to get a list of all schools from the database
    cur = mysql.connection.cursor()
    cur.execute(query)
    schools = cur.fetchall()
    cur.close()
    
    # Render the template for the first page
    return render_template('index.html', schools=schools)

# Route for the login page
@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    
    if form.validate_on_submit():
        # Get the entered username and password from the form
        username = form.username.data
        password = form.password.data
        
        # Query the database to validate the user's credentials
        cur = mysql.connection.cursor()
        query = "SELECT * FROM users WHERE username = %s AND password = %s AND school = %s"
        cur.execute(query, (username, password, session['selected_school']))
        user = cur.fetchone()
        cur.close()
        
        if user:
            # User exists in the database and credentials are valid
            session['user_id'] = user[0]  # Store user ID in session for future use
            return redirect(url_for('dashboard'))  # Redirect to the dashboard page after successful login
        else:
            # Invalid credentials, show an error message
            error_message = "Invalid username or password"
            return render_template('login.html', form=form, error_message=error_message)
    
    # Render the template for the login page with the form
    return render_template('login.html', form=form)


# Route for the dashboard page
@app.route('/dashboard')
def dashboard():
    # Check if the user is authenticated and retrieve their information from the database
    if 'user_id' in session:
        user_id = session['user_id']
        
        cur = mysql.connection.cursor()
        query = "SELECT * FROM users WHERE id = %s"
        cur.execute(query, (user_id,))
        user = cur.fetchone()
        cur.close()
        
        if user:
            # User exists, render the template for the dashboard page
            return render_template('dashboard.html', user=user)
    
    # User is not authenticated, redirect to the login page
    return redirect(url_for('login'))