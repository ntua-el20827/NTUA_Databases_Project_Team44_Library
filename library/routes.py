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


@app.route('/home')
def home():
    return redirect(url_for('logout')) # θελει αλλαγή

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
            # i want to find the role_name\
            print(user[0])
            cur = mydb.connection.cursor()
            query = "SELECT role_name FROM lib_user WHERE user_id = %s" 
            cur.execute(query,(user[0],))
            role_name = cur.fetchone()
            session['role_name'] = role_name[0]
            cur.close()
            print("login -> ",role_name)
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
        query = "SELECT school_id FROM lib_user WHERE user_id = %s"
        cur.execute(query, (user_id,))
        school_id_tuple = cur.fetchone()
        school_id = school_id_tuple[0] if school_id_tuple else None
        session['school_id'] = school_id
        print(school_id)
        query = "SELECT * FROM lib_user WHERE user_id = %s"
        cur.execute(query, (user_id,))
        user = cur.fetchone()
        cur.close()
        
        if user:
            # User exists, render the template for the dashboard page
            return redirect(url_for('school'))

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
        query = "SELECT title, ISBN, book_image FROM book WHERE school_id = %s" 
        cur.execute(query,(school_id,))
        books = cur.fetchall()
        cur.close()
        return render_template('schooltry2.html',books = books ) 

@app.route('/contact')
def contact():
    school_id = session['school_id']
    # info for admin
    cur = mydb.connection.cursor()
    query = "SELECT user_firstname, user_lastname, user_email FROM lib_user WHERE school_id = %s AND role_name = 'admin'" 
    cur.execute(query,(school_id,))
    admin = cur.fetchone()
    cur.close()
    # info for school
    cur = mydb.connection.cursor()
    query = "SELECT email,principal_lastname,principal_firstname FROM school WHERE school_id = %s" 
    cur.execute(query,(school_id,))
    school_info = cur.fetchall()
    cur.close()
    return render_template('contact.html',admin=admin,school_info = school_info)


@app.route('/logout', methods=['GET', 'POST'])
def logout():
    #πρεπει να μηδενίζω τα session
    session.clear()
    return redirect(url_for('index'))

@app.route('/user_profile')
def user_profile():
    school_id = session['school_id']
    user_id = session['user_id']
    role_name = session['role_name']
    can_edit = False
    # info for user
    cur = mydb.connection.cursor()
    query = "SELECT user_firstname, user_lastname, user_name, user_email,user_date_of_birth FROM lib_user WHERE user_id = %s" 
    cur.execute(query,(user_id,))
    user_info = cur.fetchone()
    cur.close()
    # info for school
    cur = mydb.connection.cursor()
    query = "SELECT principal_lastname,principal_firstname,school_name FROM school WHERE school_id = %s" 
    cur.execute(query,(school_id,))
    school_info = cur.fetchone()
    cur.close()
    # if statement -> true if user_role == teacher
    #print("user_profile ", role_name)
    if (role_name == 'teacher'):
        can_edit = True
        print("can edit = true")
    return render_template('profile.html',user_info = user_info,school_info=school_info,can_edit=can_edit)

@app.route('/edit_profile',methods=['GET', 'POST'])
def edit_profile():
    if request.method == 'POST':
        # Retrieve the updated user information from the form
        user_firstname = request.form['user_firstname']
        user_lastname = request.form['user_lastname']
        user_username = request.form['user_username']
        user_email = request.form['user_email']

        # Perform the necessary database update query using the new information
        cur = mydb.connection.cursor()
        query = "UPDATE lib_user SET user_firstname = %s, user_lastname = %s, user_name = %s, user_email = %s WHERE user_id = %s"
        cur.execute(query, (user_firstname, user_lastname, user_username, user_email, session['user_id']))
        mydb.connection.commit()
        cur.close()
        # Redirect the user to the updated profile page or any other desired page
        return redirect(url_for('user_profile'))
    school_id = session['school_id']
    user_id = session['user_id']
    # info for user
    cur = mydb.connection.cursor()
    query = "SELECT user_firstname, user_lastname, user_name, user_email,user_date_of_birth FROM lib_user WHERE user_id = %s" 
    cur.execute(query,(user_id,))
    user_info = cur.fetchone()
    cur.close()
    # info for school
    cur = mydb.connection.cursor()
    query = "SELECT principal_lastname,principal_firstname,school_name FROM school WHERE school_id = %s" 
    cur.execute(query,(school_id,))
    school_info = cur.fetchone()
    cur.close()
    return render_template('edit_profile.html',user_info = user_info,school_info=school_info)