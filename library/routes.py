from flask import render_template, request, redirect, url_for, session, flash
from flask_mysqldb import MySQL
from library import app,mydb
from library.forms import *
from datetime import datetime


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
#!! Χρειάζεται αλλαγή για να μπαίνει o super_admin

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
        query = "SELECT * FROM lib_user WHERE user_name = %s AND user_pwd = %s AND user_pending_flag IS NULL"
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
            ## Ελεγχος αν ειναι καποιος admin
            print("login -> ",role_name)
            if (role_name[0]=='admin'):
                    print("admin -> ",role_name)
                    return redirect(url_for('school_admin'))
            return redirect(url_for('dashboard'))  # Redirect to the dashboard page after successful login
        else:
            # Invalid credentials, show an error message
            error_message = "Invalid username or password"
            return render_template('login.html', error_message=error_message)
    
    # Render the template for the login page with the form
    return render_template('login.html')

@app.route('/super_admin_login', methods=['GET', 'POST'])
def super_admin_login():
    if request.method == "POST":
        # Get the entered username and password from the form
        username = request.form['username']
        password = request.form['password']
        session['username'] = username
        session['password'] = password
        cur = mydb.connection.cursor()
        query = "SELECT * FROM lib_user WHERE user_name = %s AND user_pwd = %s AND user_id=1"
        cur.execute(query, (username, password))
        super_admin = cur.fetchone()
        cur.close()
        school_id = user_id =1
        session['school_id'] = school_id
        session['user_id'] = user_id
        session['role_name'] = 'super_admin'
        if super_admin:
            return render_template("super_admin.html")
        else:
            # Invalid credentials, show an error message
            error_message = "Invalid username or password"
            return render_template('super_admin_login.html', error_message=error_message)
    return render_template('super_admin_login.html')

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
    school_name = session['school_name']
    print(school_name)
    cur = mydb.connection.cursor()
    query = "SELECT school_id FROM school WHERE school_name = %s"
    cur.execute(query, (school_name,))
    school_id = cur.fetchone()[0]
    print (school_id)
    if request.method == "POST":
        newusername = request.form['newusername']
        newpassword = request.form['newpassword']
        fname = request.form['fname']
        lname = request.form['lname']
        email = request.form['email']
        date_of_birth = request.form['dob']
        role_name = request.form['role_name']
        cur = mydb.connection.cursor()
        query = "INSERT INTO lib_user (user_name, user_pwd, user_firstname,user_date_of_birth, user_lastname, user_email, school_id,role_name,user_pending_flag) VALUES (%s, %s,%s, %s, %s,%s, %s,%s,'waiting')"
        values = (newusername, newpassword, fname, date_of_birth ,lname, email,school_id,role_name)
        cur.execute(query, values)
        mydb.connection.commit()
        cur.close()
        return redirect(url_for('login'))
    else:
        return render_template("signup.html")

#route για την αρχική σελίδα του σχολείου -> ολα τα βιβλία
@app.route('/school', methods=['GET', 'POST'])
def school():
    if request.method == "POST":
        ISBN = request.form['ISBN'] 
        book_id = request.form['book_id'] 
        session['ISBN'] = ISBN  
        session['book_id'] = book_id  
        return redirect(url_for('book_display'))
    else:
        cur = mydb.connection.cursor()
        school_id = session['school_id']
        query = "SELECT title, ISBN, book_image, book_id FROM book WHERE school_id = %s" 
        cur.execute(query,(school_id,))
        books = cur.fetchall()
        cur.close()
        return render_template('schooltry2.html',books = books ) 

@app.route('/request_library_form', methods=['GET', 'POST'])
def request_library_form():
    if request.method == "POST":
   #     newusername = request.form['newusername']
   #     newpassword = request.form['newpassword']
    #    fname = request.form['fname']
    #    lname = request.form['lname']
    #    email = request.form['email']
   #     phone = request.form['phone']
    #    school_name = request.form['schoolname']
    #    cur = mydb.connection.cursor()
     #   query1 = "INSERT INTO users_applications (username, password, first_name, last_name, email, phone) VALUES (%s, %s, %s, %s, %s, %s)"
     #   query2 = "INSERT INTO school_applications (username, first_name, last_name, email, phone, school_name) VALUES (%s, %s, %s, %s, %s, %s)"
      #  values = (newusername, newpassword, fname, lname, email, phone, school_name)
       # cur.execute(query1, values)
        #cur.execute(query2, values)
       # mydb.connection.commit()
        #cur.close()
        return redirect(url_for('waiting'))
    else:
        return render_template("request_library_form.html")

@app.route("/waiting")
def waiting():
    return render_template("waiting.html")

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

@app.route('/contact_super_admin')
def contact_super_admin():
    school_id = session['school_id']
    # info for admin
    cur = mydb.connection.cursor()
    query = "SELECT user_firstname, user_lastname, user_email FROM lib_user WHERE  role_name = 'super_admin'" 
    cur.execute(query)
    admin = cur.fetchone()
    cur.close()
    return render_template('contact_super_admin.html',admin=admin)

@app.route('/contact_index')
def contact_index():
    return render_template("contact_creators.html")

@app.route('/contact_index_super_admin')
def contact_index_super_admin():
    super_admin_statement = True
    return render_template("contact_creators.html", super_admin_statement = super_admin_statement)

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
    if (role_name == 'admin'):
        can_edit = True
        return render_template('school_admin_profile.html',user_info = user_info,school_info=school_info,can_edit=can_edit)
    if (role_name == 'teacher'):
        can_edit = True
        print("can edit = true")
    if (role_name == 'super_admin'):
        can_edit = True
        return render_template('super_admin_user_profile.html',user_info = user_info,school_info=school_info,can_edit=can_edit)
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

@app.route('/edit_password',methods=['GET', 'POST'])
def edit_password():
    if request.method == 'POST':
        # Retrieve the updated user information from the form
        user_new_password = request.form['user_new_password']

        # Perform the necessary database update query using the new information
        cur = mydb.connection.cursor()
        query = "UPDATE lib_user SET user_pwd = %s WHERE user_id = %s"
        cur.execute(query, (user_new_password, session['user_id']))
        mydb.connection.commit()
        cur.close()
        # Redirect the user to the updated profile page or any other desired page
        return redirect(url_for('user_profile'))
    school_id = session['school_id']
    user_id = session['user_id']
    # info for user
    cur = mydb.connection.cursor()
    query = "SELECT user_pwd FROM lib_user WHERE user_id = %s" 
    cur.execute(query,(user_id,))
    user_info = cur.fetchone()
    cur.close()
    return render_template('edit_password.html',user_info = user_info)
#route για το βιβλίο που ο χρηστης επέλεξε
@app.route('/book_display')
def book_display():
    ISBN = session['ISBN']
    book_id = session['book_id']
    school_id = session['school_id']
    cur = mydb.connection.cursor()
    print("ISBN is ", type(ISBN))
    print(int(ISBN))
    query = "SELECT ISBN, title, publisher, number_of_available_books, pages,book_language,summary,book_image,book_id FROM book WHERE school_id = %s AND ISBN = %s AND book_id=%s" 
    cur.execute(query,(school_id, int(ISBN),book_id))
    book_info = cur.fetchone()
    print(book_id)
    cur.close()
    return render_template("book_display.html",book_info= book_info)

#route για τον χρήστη που θέλει να δανειστεί το βιβλίο
@app.route('/rent',methods=['GET', 'POST'])
def rent():
    ISBN = session['ISBN']
    school_id = session['school_id']
    user_id = session['user_id']
    role_name = session['role_name'] 
    book_id = session['book_id']

    #5 
    cur = mydb.connection.cursor()
    query = """ SELECT bs.book_id
FROM book_status bs
WHERE bs.status = 'Borrowed'
  AND bs.return_date IS NULL
  AND bs.approval_date <= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
  AND bs.user_id = %s"""
    cur.execute(query,(user_id,))
    oxi_ekprothesmo = cur.fetchall()
    if oxi_ekprothesmo:
        query = """ SELECT book_id FROM book_status WHERE user_id = %s AND book_id %s AND status='borrowed' AND returned_date = NULL """
        cur.execute(query,(user_id, book_id,))
        exei_daneistei = cur.fetchone()
        if exei_daneistei:
            error_message = "Εχετε δανειστεί ηδη αυτό το βιβλίο"
            return render_template('non_valid_borrowing.html',error_message)
        else:    
            query = "INSERT INTO book_status (book_id, user_id, status, request_date, approval_date, return_date) VALUES (%s, %s, 'reserved', %s)"
            cur.execute(query,(book_id,user_id,datetime.time.now()))  # Execute your INSERT statement here

            # Fetch the MESSAGE_TEXT from the last executed statement
            cur.execute("SELECT MESSAGE_TEXT FROM mysql_error_info")
            error_info = cur.fetchone()

            if error_info:
                error_message = "Εχετε περάσει τον αριθμό δανεισμών/κρατήσεων"
                return render_template('non_valid_borrowing.html',error_message)
            else:
                mydb.connection.commit()
                query = "CALL increase_available_books(%s)"
                cur.execute(query,(book_id,))
                mydb.connection.commit()
                cur.close()
                return render_template('reserved_test.html')

    else:
        error_message = "Δεν εχετε επιστρεψει καποιο βιβλίο"
        return render_template('non_valid_borrowing.html',error_message)

    # ΓΕΝΙΚΑ ΕΔΩ ΠΡΕΠΕΙ ΝΑ ΚΑΝΟΥΜΕ ΠΟΛΛΑ QUERIES ΚΑΙ ΝΑ ΕΚΤΕΛΕΣΟΥΜΕ ΟΛΟΥΣ ΤΟΥΣ ΕΛΕΓΧΟΥΣ
    #1. 2 ΔΑΝΕΙΣΜΟΙ ΤΗΝ ΒΔΟΜΑΔΑ ΑΝΑ ΒΔΟΜΑΔΑ ΓΙΑ ΤΟΝ ΜΑΘΗΤΗ -> 1 εως 4 σε trigger
    #2. 1 ΔΑΝΕΙΣΜΟΣ ΤΗΝ ΕΒΔΟΜΑΔΑ ΑΝΑ ΒΔΟΜΑΔΑ ΓΙΑ ΤΟΝ ΚΑΘΗΓΗΤΗ
    #3. 2 ΚΡΑΤΗΣΕΙΣ ΤΗΝ ΕΒΔΟΜΑΔΑ ΑΝΑ ΕΒΔΟΜΑΔΑ ΓΙΑ ΤΟ ΜΑΘΗΤΗ
    #4. 1 ΚΡΑΤΗΣΗ ΤΗΝ ΕΒΔΟΜΑΔΑ ΑΝΑ ΕΒΔΟΑΜΔΑ ΓΙΑ ΤΟΝ ΚΑΘΗΓΗΤΗ
    #5. ΔΕΝ ΕΠΙΤΡΕΠΕΤΑΙ ΚΡΑΤΗΣΗ ΑΝ ΧΡΩΣΤΑΕΙ ΝΑ ΕΠΙΣΤΡΕΨΕΙ ΕΚΠΡΟΘΕΣΜΟ ΒΙΒΛΙΟ -> ΠΡΟΘΕΣΜΙΑ = 1 ΒΔΟΜΑΔΑ
    #6. ΔΕΝ ΕΠΙΤΡΕΠΕΤΑΙ ΚΡΑΤΗΣΗ ΑΝ ΕΧΕΙ ΉΔΗ ΔΑΝΕΙΣΤΕΙ ΑΥΤΟ ΤΟ ΒΙΒΛΙΟ / Η ΕΧΕΙ ΚΑΝΕΙ ΚΡΑΤΗΣΗ ΑΥΤΟ ΤΟ ΒΙΒΛΊΟ

#route για επαναφορά στην σχολική βιβλιοθήκη
@app.route('/back_to_school')
def back_to_school():
    session.pop('ISBN', None)
    session.pop('book_id', None)
    #print("from back to school ", session['ISBN']  )
    if session['role_name'] == 'admin':
        return redirect(url_for('school_admin'))
    return redirect(url_for('school'))

#route για καταχώρηση αξιολόγησης απο τον χρήστη
@app.route('/review',methods=['GET', 'POST'])
def review():
    school_id = session['school_id']
    user_id = session['user_id']
    book_id = session['book_id']
    if request.method == 'POST':
        ISBN = request.form['ISBN']
        review_text = request.form['review-text']
        rating = request.form['rating']
        print(f"ISBN: {ISBN}")
        print(f"Review Text: {review_text}")
        print(f"Rating: {rating}")
        cur = mydb.connection.cursor()
        # query που στελνει το review στον ΥΧ για να το κάνει accept
        # θελουμε ενα view με τις αιτήσεις για καταχώρηση αξιολόγησης
        cur.close()
        return redirect(url_for("back_to_school"))
    # Ελεγχος αν έχει στο παρελθον δανειστει βιβλίο για να μπορεί να το κάνει review
    cur = mydb.connection.cursor()
    query = "SELECT book_status_id FROM book_status WHERE user_id = %s AND book_id = %s AND status = 'borrowed'" 
    cur.execute(query,(user_id,book_id))
    been_rented = cur.fetchone()
    cur.close()
    if been_rented:
        #ελεγχος αν έχει ξανακάνει review
        cur = mydb.connection.cursor()
        query = "SELECT review_id FROM book_status WHERE user_id = %s AND book_id = %s" 
        cur.execute(query,(user_id,book_id))
        been_rented = cur.fetchone()
        cur.close()
        return render_template("review.html")
    # σε κάθε αλλή περίπτωση sorry δεν μπορεις να κάνεις review
    return render_template("review_test2.html")

@app.route('/review_users_test')
def review_users_test():
    return render_template("review_users_test.html")

#Route για την αρχική του super_admin
@app.route('/super_admin')
def super_admin():
    return render_template('super_admin.html')

#Route για την αρχική των queries του super_admin
@app.route('/super_admin_queries')
def super_admin_queries():
    return render_template("super_admin_queries.html")

# Route for Query 3.1.1
@app.route('/super_admin/Q1',methods=['GET', 'POST'])
def super_admin_Q1():
    if request.method == 'POST':
        # Get the selected year and month from the form
        year = request.form.get('year')
        month = request.form.get('month')

        # Connect to the database
        cur = mydb.connection.cursor()
        #Το query θα ερθει απο ιωάννα
        query = """SELECT 
        school.school_name,
        COUNT(*) AS borrow_count
        FROM 
        book_status
        INNER JOIN book ON book_status.book_id = book.book_id
        INNER JOIN school ON book.school_id = school.school_id
        WHERE 
        book_status.status = 'borrowed' AND
        YEAR(book_status.approval_date) = %s AND
        MONTH(book_status.approval_date) = %s
        GROUP BY 
        school.school_name
        ORDER BY 
        borrow_count DESC;"""
        cur.execute(query, (year, month))
        results = cur.fetchall()
        cur.close()

        # Render the template with the query results
        return render_template('super_admin_Q1.html', results=results)

    # Render the template initially without results
    return render_template('super_admin_Q1.html', results=None)

# Route for Query 3.1.2
@app.route('/super_admin/Q2',methods=['GET', 'POST'])
def super_admin_Q2():
    # Get the list of book themes from the database
    themes = ['Fiction', 'Non-fiction','Dystopia','Gothic','Science Fiction', 'Science','Drama', 'Adventure','Mystery', 'Romance','War', 'Classic','Thriller', 'Horror', 'Fantasy', 'Biography', 'Autobiography', 'History', 'Poetry', 'Comics', 'Cookbooks', 'Travel', 'Religion', 'Self-help', 'Art', 'Music','Coming of Age', 'Sports', 'Humor', 'Children','Reference']

    if request.method == 'POST':
        # Get the selected book theme from the form
        selected_theme = request.form.get('theme')

        # Execute the query to retrieve authors for the selected book theme
        cur = mydb.connection.cursor()
        author_query = "SELECT DISTINCT book_author.author FROM book_theme INNER JOIN book_author ON book_theme.book_id = book_author.book_id WHERE book_theme.theme = %s "
        cur.execute(author_query, (selected_theme,))
        authors = cur.fetchall()

        # Execute the query to retrieve teachers who borrowed books of the selected theme last year
        teacher_query = "SELECT DISTINCT lib_user.user_name FROM book_theme INNER JOIN book ON book_theme.book_id = book.book_id INNER JOIN book_status ON book.book_id = book_status.book_id INNER JOIN lib_user ON book_status.user_id = lib_user.user_id WHERE book_theme.theme = %s AND book_status.status = 'borrowed' AND book_status.approval_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 YEAR) AND NOW() AND lib_user.role_name = 'teacher'"
        cur.execute(teacher_query, (selected_theme,))
        teachers = cur.fetchall()
        cur.close()

        # Render the template with the query results
        return render_template('super_admin_Q2.html', themes=themes, selected_theme=selected_theme, authors=authors, teachers=teachers)

    # Render the template initially without results
    return render_template('super_admin_Q2.html', themes=themes, selected_theme=None, authors=None, teachers=None)

# Route for Query 3.1.3
@app.route('/super_admin/Q3')
def super_admin_Q3():
    cur = mydb.connection.cursor()
    query = """
        SELECT lib_user.user_name, COUNT(*) AS num_borrowings
        FROM book_status
        INNER JOIN lib_user ON book_status.user_id = lib_user.user_id
        WHERE lib_user.role_name = 'teacher'
        AND lib_user.user_date_of_birth > UNIX_TIMESTAMP(DATE_SUB(NOW(), INTERVAL 40 YEAR))
        AND book_status.status = 'borrowed'
        GROUP BY lib_user.user_id
        ORDER BY num_borrowings DESC
        LIMIT 1;
        """
    cur.execute(query)
    results = cur.fetchall()
    cur.close()

    # Render the template with the query results
    return render_template('super_admin_Q3.html', results=results)

# Route for Query 3.1.4
@app.route('/super_admin/Q4')
def super_admin_Q4():
    cur = mydb.connection.cursor()
    query = """
                SELECT DISTINCT book_author.author
        FROM book_author
        LEFT JOIN book_status ON book_author.book_id = book_status.book_id
        WHERE book_status.book_id IS NULL;
    """
    cur.execute(query)
    results = cur.fetchall()
    cur.close()

    # Render the template with the query results
    return render_template('super_admin_Q4.html', results=results)

# Route for Query 3.1.5
@app.route('/super_admin/Q5')
def super_admin_Q5():
    cur = mydb.connection.cursor()
    query = """
        SELECT lib_user.user_name
        FROM book_status
        INNER JOIN lib_user ON book_status.user_id = lib_user.user_id
        WHERE lib_user.role_name = 'admin'
        AND book_status.approval_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 YEAR) AND NOW()
        GROUP BY lib_user.user_id
        HAVING COUNT(*) >= 20;
    """
    cur.execute(query)
    results = cur.fetchall()
    cur.close()

    # Render the template with the query results
    return render_template('super_admin_Q5.html', results=results)

# Route for Query 3.1.6
@app.route('/super_admin/Q6')
def super_admin_Q6():
    cur = mydb.connection.cursor()
    query = """
        SELECT 
        CONCAT(bt1.theme,',',bt2.theme) AS theme_pair, 
        COUNT(*) AS borrow_count
        FROM 
        book_theme bt1
        INNER JOIN book_theme bt2 ON bt1.book_id = bt2.book_id AND bt1.theme < bt2.theme
        INNER JOIN book_status ON bt2.book_id = book_status.book_id
        WHERE 
        book_status.status = 'borrowed'
        GROUP BY 
        theme_pair
        ORDER BY 
        borrow_count DESC
        LIMIT 3;
    """
    cur.execute(query)
    results = cur.fetchall()
    cur.close()

    # Render the template with the query results
    return render_template('super_admin_Q6.html', results=results)

# Route for Query 3.1.7
@app.route('/super_admin/Q7')
def super_admin_Q7():
    cur = mydb.connection.cursor()
    query = """
    SELECT book_author.author, (max_books.num_books - COUNT(*)) AS book_diff
    FROM book_author
    INNER JOIN (
    SELECT book_author.book_id, COUNT(*) AS num_books
    FROM book_author
    GROUP BY book_author.book_id
    ORDER BY num_books DESC
    LIMIT 1
    ) AS max_books ON book_author.book_id = max_books.book_id
    GROUP BY book_author.author
    HAVING book_diff >= 5;
    """
    cur.execute(query)
    results = cur.fetchall()
    cur.close()

    # Render the template with the query results
    return render_template('super_admin_Q7.html', results=results)

# Exra route για να ελεγξει αιτήσεις σχολείων
@app.route('/super_admin_school_applications', methods=['GET', 'POST'])
def super_admin_school_applications():
    if request.method == 'POST':
        school_name = request.form.get('school_name')
        application_id = request.form.get('application_id')
        session['application_id'] = application_id

        if school_name and application_id:
            return redirect(url_for('verify_school_application', school_name=school_name, application_id=application_id))

    # Connect to the database to fetch the data
    cur = mydb.connection.cursor()

    # Fetch data from the 'library_applications' view
    query = "SELECT application_id, school_name FROM library_applications"
    cur.execute(query)
    applications = cur.fetchall()
    cur.close()

    # Render the template with the data
    return render_template('library_applications.html', applications=applications)

@app.route('/verify_school_application/<int:application_id>', methods=['GET', 'POST'])
def verify_school_application(application_id):
    if request.method == 'POST':
        action = request.form.get('action')

        if action == 'accept':
            # Connect to the database to perform database operations
            cur = mydb.connection.cursor()
            # Get application details from the database
            query = "SELECT * FROM library_applications "
            cur.execute(query)
            application = cur.fetchone()

            if application:
                # Insert the school into the 'school' table
                insert_query = "INSERT INTO school (school_name) VALUES (%s)"
                cur.execute(insert_query, (application[1],))
                mydb.commit()

                # Get the school_id of the inserted school
                school_id = cur.lastrowid

                # Insert a user into the 'lib_user' table for the new school
                insert_user_query = "INSERT INTO lib_user (user_firstname, user_lastname, school_id) VALUES (%s, %s, %s)"
                cur.execute(insert_user_query, (application[2], application[3], school_id))
                mydb.commit()

            cur.close()

        elif action == 'delete':
            # Connect to the database to perform database operations
            cur = mydb.connection.cursor()
            # Delete the application from the 'library_applications' table
            delete_query = "DELETE FROM library_applications WHERE application_id = %s"
            cur.execute(delete_query, (application_id,))
            mydb.commit()
            cur.close()
        # Redirect back to the library applications page
        return redirect(url_for('library_applications'))

    # Connect to the database to fetch the application details
    cur = mydb.connection.cursor()
    # Get application details from the database
    query = "SELECT * FROM library_applications WHERE application_id = %s"
    cur.execute(query, (application_id,))
    application = cur.fetchone()
    cur.close()

    # Render the template with the application details
    return render_template('verify_school_application.html', application=application)

#Route for school admin
@app.route('/school_admin')
def school_admin():
    user_id = session['user_id']
    cur = mydb.connection.cursor()
    query = "SELECT school_id FROM lib_user WHERE user_id = %s"
    cur.execute(query, (user_id,))
    school_id_tuple = cur.fetchone()
    school_id = school_id_tuple[0] if school_id_tuple else None
    session['school_id'] = school_id
    cur.close()
    if request.method == "POST":
        ISBN = request.form['ISBN']  
        session['ISBN'] = ISBN  
        return redirect(url_for('book_display'))
    else:
        cur = mydb.connection.cursor()
        school_id = session['school_id']
        query = "SELECT title, ISBN, book_image,book_id FROM book WHERE school_id = %s" 
        cur.execute(query,(school_id,))
        books = cur.fetchall()
        cur.close()
        return render_template('school_admin.html',books = books )


#Route για την αρχική των queries του school_admin
@app.route('/school_admin_queries')
def school_admin_queries():
    return render_template("school_admin_queries.html")

#Routes for school admin queries   
#3.2.1 OK
@app.route('/school_admin_Q1', methods=['GET', 'POST'])
def school_admin_Q1():
    school_id = session['school_id']
    cur = mydb.connection.cursor()
    query = """ SELECT b.title, GROUP_CONCAT(ba.author) AS authors
FROM book AS b
JOIN book_author AS ba ON b.book_id = ba.book_id
WHERE b.school_id = %s
GROUP BY b.book_id;
 """
    cur.execute(query, (school_id,))
    
    if request.method == 'POST':
        search_text = request.form['search_text']
        search_type = request.form['search_type']
        print(search_text)

        # Connect to the database and execute the query based on the search type
        cur = mydb.connection.cursor()

        if search_type == 'title':
            query = """ SELECT b.title, GROUP_CONCAT(ba.author) AS authors
FROM book AS b
JOIN book_author AS ba ON b.book_id = ba.book_id
WHERE b.school_id = %s AND b.title = %s
GROUP BY b.book_id """
            cur.execute(query, (school_id,str(search_text),))
        elif search_type == 'category':
            print("category")
            query = """ SELECT book.title, GROUP_CONCAT(DISTINCT book_author.author SEPARATOR ', ') AS authors, GROUP_CONCAT(DISTINCT book_theme.theme SEPARATOR ', ') AS themes, book.number_of_books 
FROM book 
LEFT JOIN book_author ON book.book_id = book_author.book_id 
LEFT JOIN book_theme ON book.book_id = book_theme.book_id 
WHERE book.school_id = %s AND book_theme.theme = %s
GROUP BY book.book_id
"""
            cur.execute(query, (school_id,str(search_text),))
        elif search_type == 'author':
            query = """SELECT book.title, GROUP_CONCAT(DISTINCT book_author.author SEPARATOR ', ') AS authors, GROUP_CONCAT(DISTINCT book_theme.theme SEPARATOR ', ') AS themes, book.number_of_books 
FROM book 
LEFT JOIN book_author ON book.book_id = book_author.book_id 
LEFT JOIN book_theme ON book.book_id = book_theme.book_id 
WHERE book.school_id = %s AND book_author.author = %s
GROUP BY book.book_id
"""
            cur.execute(query, (school_id,str(search_text),))
        elif search_type == 'copies':
            query =""" SELECT b.title, GROUP_CONCAT(ba.author) AS authors
FROM book AS b
JOIN book_author AS ba ON b.book_id = ba.book_id
WHERE b.school_id = %s AND b.number_of_books = %s
GROUP BY b.book_id
"""
            cur.execute(query, (school_id,str(search_text),))

    books = cur.fetchall()
    cur.close()

    if len(books) == 0:
        # Render the template with no results message
        return render_template('school_admin_Q1.html', no_results=True)

    # Render the template with the query results
    return render_template('school_admin_Q1.html', books=books)

#3.2.2 OK
@app.route('/school_admin_Q2', methods=['GET', 'POST'])
def school_admin_Q2():
    school_id = session['school_id']
    cur = mydb.connection.cursor()
    query = """ SELECT u.user_id, u.user_firstname, u.user_lastname,DATEDIFF(NOW(), bs.approval_date)
FROM lib_user u
JOIN book_status bs ON u.user_id = bs.user_id
WHERE bs.status = 'borrowed' AND bs.return_date IS NULL AND u.school_id = %s AND (DATEDIFF(NOW(), bs.approval_date) > 7)
            """
    cur.execute(query, (school_id,))
    if request.method == 'POST':
        search_text = request.form['search_text']
        search_type = request.form['search_type']
        print(search_text)

        # Connect to the database and execute the query based on the search type
        
        q1 = """ SELECT u.user_id, u.user_firstname, u.user_lastname,DATEDIFF(NOW(), bs.approval_date)
FROM lib_user u
JOIN book_status bs ON u.user_id = bs.user_id
WHERE bs.status = 'borrowed' AND bs.return_date IS NULL AND u.school_id = %s AND (DATEDIFF(NOW(), bs.approval_date) > 7)"""
        if search_type == 'first_name':
            query = q1+"AND u.user_firstname LIKE %s"
            cur.execute(query,(school_id,search_text,))
        elif search_type == 'last_name':
            query = q1+"AND u.user_lastname LIKE %s"
            cur.execute(query,(school_id,search_text,))
        elif search_type == 'days_of_delay':
            query = q1+"AND (DATEDIFF(NOW(), bs.approval_date) >= %s); "
            cur.execute(query,(school_id,search_text,))

    users = cur.fetchall()
    cur.close()

    if len(users) == 0:
        # Render the template with no results message
        return render_template('school_admin_Q2.html', no_results=True)

    # Render the template with the query results
    return render_template('school_admin_Q2.html', users=users)

#3.2.3 OK
@app.route('/school_admin_Q3', methods=['GET', 'POST'])
def school_admin_Q3():
    school_id = session['school_id']
    cur = mydb.connection.cursor()
    query = """ SELECT CONCAT(u.user_firstname, ' ', u.user_lastname) AS borrower_name, bt.theme, AVG(r.rating) AS avg_rating
FROM lib_user u
INNER JOIN review r ON u.user_id = r.user_id
INNER JOIN book b ON r.book_id = b.book_id
INNER JOIN book_theme bt ON b.book_id = bt.book_id
WHERE u.school_id = %s
GROUP BY u.user_id, bt.theme
            """
    cur.execute(query, (school_id,))
    if request.method == 'POST':
        search_text = request.form['search_text']
        search_type = request.form['search_type']
        print(search_text)

        # Connect to the database and execute the query based on the search type
        
        q1 = """  SELECT CONCAT(u.user_firstname, ' ', u.user_lastname) AS borrower_name, bt.theme, AVG(r.rating) AS avg_rating
FROM lib_user u
INNER JOIN review r ON u.user_id = r.user_id
INNER JOIN book b ON r.book_id = b.book_id
INNER JOIN book_theme bt ON b.book_id = bt.book_id
WHERE u.school_id = %s"""
        if search_type == 'Full name':
            query = q1+" AND borrower_name = %s GROUP BY u.user_id, bt.theme"
            cur.execute(query,(school_id, search_text, ))
        elif search_type == 'Category':
            query = q1+" AND bt.theme = %s GROUP BY u.user_id, bt.theme"
            cur.execute(query,(school_id, search_text, ))
    ratings = cur.fetchall()
    cur.close()

    if len(ratings) == 0:
        # Render the template with no results message
        return render_template('school_admin_Q3.html', no_results=True)

    # Render the template with the query results
    return render_template('school_admin_Q3.html', ratings=ratings)

# Extra Route για να ελεγξει αιτήσεις αξιολόγησης 
@app.route('/school_admin_reviews', methods=['GET', 'POST'])
def school_admin_reviews():
    if request.method == 'POST':
        application_id = request.form['application_id']
        action = request.form['action']

        # Connect to the database
        cur = mydb.connection.cursor()

        if action == 'accept':
            # Insert the review application into the 'review' table
            query = "INSERT INTO review (application_id) VALUES (%s)"
            cur.execute(query, (application_id,))
            mydb.commit()
        elif action == 'deny':
            # Delete the review application from the 'review_applications' view
            query = "DELETE FROM review_applications WHERE application_id = %s"
            cur.execute(query, (application_id,))
            mydb.commit()

        cur.close()
        mydb.close()

    # Connect to the database to fetch the review applications
    cur = mydb.connection.cursor()

    # Fetch the review applications from the 'review_applications' view
    query = "SELECT * FROM review_applications"
    cur.execute(query)
    review_applications = cur.fetchall()
    cur.close()

    # Render the template with the review applications
    return render_template('school_admin_reviews.html', review_applications=review_applications)

# Extra Route για να ελεγξει κρατήσεις -> να τις κανει δανεισμους [ΟΚ]
@app.route('/school_admin_reservations', methods=['GET', 'POST'])
def school_admin_reservations():
    if request.method == 'POST':
        item_id = request.form['item_id']
        user_id = request.form['user_id']
        action = request.form['action']

        # Connect to the database
        cur = mydb.connection.cursor()
        print(type(item_id))
        if action == 'accept':
            # Change the status to 'borrowed' in the 'book_status' table
            query = "UPDATE book_status SET status = 'borrowed', approval_date = %s WHERE book_id = %s AND user_id = %s "
            cur.execute(query, (datetime.now(),item_id, user_id,))
            mydb.connection.commit()

            # Να βάλλουμε και current date το rent_date
        elif action == 'deny':
            # Delete the item from the 'book_status' table
            query = "DELETE FROM book_status WHERE item_id = %s"
            cur.execute(query, (int(item_id),))
            mydb.connection.commit()
            query = "CALL increase_available_books(%s)"
            cur.execute(query,(int(item_id),))
            mydb.connection.commit()

        cur.close()

    # Connect to the database to fetch the data
    cur = mydb.connection.cursor()

    # Fetch data from the 'book_status' table with status='reserved'
    query = "SELECT b.book_id, b.title, u.user_id, u.user_lastname FROM book_status bs JOIN book b ON bs.book_id = b.book_id JOIN lib_user u ON bs.user_id = u.user_id WHERE bs.status = 'reserved'"
    cur.execute(query)
    reserved_items = cur.fetchall()
    cur.close()

    # Render the template with the data
    return render_template('school_admin_reservations.html', reserved_items=reserved_items)

# Extra Route για να εισάγει κατευθειαν δανεισμό
@app.route('/school_admin_new_booking', methods=['GET', 'POST'])
def school_admin_new_booking():
    school_id = session['school_id']
    if request.method == 'POST':
        user_id = request.form['user_id']
        book_id = request.form['book_id']

        if not user_id or not book_id:
            flash('Please fill in all the required fields', 'error')
        else:
            # Connect to the database
            cur = mydb.connection.cursor()
            query = "SElECT * FROM lib_user WHERE user_id = %s"
            cur.execute(query,(user_id,))
            user = cur.fetchone()
            cur.close()
            if user:
                # Insert a new booking into the 'book_status' table
                cur = mydb.connection.cursor()
                insert_query = "INSERT INTO book_status (book_id, status, rent_date, user_id) VALUES (%s, %s, CURDATE(), %s)"
                cur.execute(insert_query, (book_id, 'borrowed', user_id))
                mydb.commit()
                cur.close()

                flash('Booking successful', 'success')

                # Redirect to the same page to refresh with blank texts
                return redirect(url_for('school_admin_new_booking'))
            else:
                flash('Wrong User ID', 'failure')

    # Connect to the database to fetch the data
    cur = mydb.connection.cursor()

    # Fetch data from the 'book' table
    query = "SELECT book_id, title FROM book WHERE school_id = %s AND number_of_available_books > 0"
    cur.execute(query,(school_id,))
    books = cur.fetchall()
    cur.close()

    # Render the template with the data
    return render_template('school_admin_new_booking.html', books=books)

# Extra Route Αιτήσεις εγγραφής χρηστών [ΟΚ]
@app.route('/school_admin_users_application', methods=['GET', 'POST'])
def school_admin_users_application():
    if request.method == 'POST':
        user_id = request.form['user_id']
        action = request.form['action']

        # Connect to the database
        cur = mydb.connection.cursor()

        if action == 'accept':
            # Update the user application details into the 'lib_user' table
            insert_query = "UPDATE lib_user SET user_pending_flag = NULL WHERE user_id = %s "
            cur.execute(insert_query, (user_id,))
            mydb.connection.commit()

        elif action == 'deny':
            # Delete the user application from the view
            delete_query = "DELETE FROM lib_user WHERE user_id = %s AND user_pending_flag = 'waiting'"
            cur.execute(delete_query, (user_id,))
            mydb.connection.commit()

        cur.close()

    # Connect to the database to fetch the data
    cur = mydb.connection.cursor()

    # Fetch data from the 'users_application' view
    query = "SELECT * FROM lib_user WHERE user_pending_flag = 'waiting'"
    cur.execute(query)
    user_applications = cur.fetchall()

    cur.close()

    # Render the template with the data
    return render_template('school_admin_users_application.html', user_applications=user_applications)

# Extra Route για να δηλώσει επιστροφή ενος βιβλίου
@app.route('/school_admin_book_return', methods=['GET', 'POST'])
def school_admin_book_return():
    if request.method == 'POST':
        item_id = request.form['item_id']
        user_id = request.form['user_id']

        # Connect to the database
        cur = mydb.connection.cursor()

        # Update the 'return_date' to the current date in the 'book_status' table
        current_date = datetime.date.today()
        query = "UPDATE book_status SET return_date = %s WHERE item_id = %s AND  user_id = %s"
        cur.execute(query, (current_date, item_id))
        mydb.connection.commit()
        query = "CALL increase_available_books(%s)"
        cur.execute(query,(int(item_id),))
        mydb.connection.commit()
        cur.close()

    # Connect to the database to fetch the data
    cur = mydb.connection.cursor()

    # Fetch data from the 'book_status' table with status='booked' and return_date=NULL
    query = "SELECT * FROM book_status WHERE status = 'borrowed' AND retdurn_date IS NULL"
    cur.execute(query)
    booked_items = cur.fetchall()
    cur.close()

    # Render the template with the data
    return render_template('school_admin_book_return.html', booked_items=booked_items)
