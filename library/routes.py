from flask import render_template, request, redirect, url_for, session, flash
from flask_mysqldb import MySQL
from library import app,mydb
from library.forms import *
from datetime import datetime
import os

class SQLTriggerError(Exception):
    pass

# Route for the first page
@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == "POST":
        print("HI")
        school_name = request.form['school_name']
        session['school_name'] = school_name
        print(school_name)
        #query για να πάρω το school_id
        query = "SELECT school_id from school where school_name = %s" 
        cur = mydb.connection.cursor()
        cur.execute(query,(school_name,))
        school_id = cur.fetchone() # με την fetchall() πιάνω όλα όσα ηρθαν απο το execute που έγινε!!
        cur.close()
        session['school_id'] = school_id
        print(school_id)
        return redirect(url_for('login'))
    else:
        # Read the query from queries.sql
        #with open('/home/george/Workshop/uni/dblab/project/library/sql/queries.sql', 'r') as file:
         #   queries = file.read().split(';')
        #query = queries[0]
        query = "SELECT school_name from school WHERE pending_flag IS NULL ORDER BY school_name"
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
        school_id = session['school_id']
        
        # Query the database to validate the user's credentials
        cur = mydb.connection.cursor()
        query = "SELECT * FROM lib_user WHERE user_name = %s AND user_pwd = %s AND user_pending_flag IS NULL AND school_id=%s"
        cur.execute(query, (username, password,school_id))
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
            error_message = "Invalid username or password or selected school"
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
        """ query = "SELECT school_id FROM lib_user WHERE user_id = %s"
        cur.execute(query, (user_id,))
        school_id_tuple = cur.fetchone()
        school_id = school_id_tuple[0] if school_id_tuple else None
        session['school_id'] = school_id
        print(school_id) """
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
        try:
            cur.execute(query, values)
            mydb.connection.commit()
        except Exception:
            flash("Λαθος στην εισαγωγή στοιχείων")
            return render_template("signup.html")

        cur.close()
        flash("Η αιτηση για εγγραφη σας πραγματοποιηθηκε. Βρισκεται Υπο εγκριση")
        return render_template("signup.html")
    else:
        return render_template("signup.html")

#route για την αρχική σελίδα του σχολείου -> ολα τα βιβλία
@app.route('/school', methods=['GET', 'POST'])
def school():
    no_results = False
    school_id = session['school_id']
    if request.method == "POST":
        search_text = request.form['search_text']
        search_type = request.form['search_type']
        cur = mydb.connection.cursor()

        if search_type == 'title':
            query = """ SELECT b.title, b.ISBN, b.book_image, b.book_id,
        GROUP_CONCAT(ba.author SEPARATOR ',') AS authors
        FROM book b
        JOIN book_author ba ON b.book_id = ba.book_id
        WHERE b.school_id = %s AND b.title = %s
        GROUP BY b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, b.summary, b.book_image, b.book_id"""
            cur.execute(query, (school_id,str(search_text),))
        elif search_type == 'category':
            print("category")
            query = """ SELECT b.title, b.ISBN, b.book_image, b.book_id,
        GROUP_CONCAT(ba.author SEPARATOR ',') AS authors,
        GROUP_CONCAT(bt.theme SEPARATOR ',') AS themes
        FROM book b
        JOIN book_author ba ON b.book_id = ba.book_id
        LEFT JOIN book_theme bt ON b.book_id = bt.book_id
        WHERE b.school_id = %s AND bt.theme = %s
        GROUP BY b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, b.summary, b.book_image, b.book_id;
        """
            cur.execute(query, (school_id,str(search_text),))
        elif search_type == 'author':
            query = """SELECT b.title, b.ISBN, b.book_image, b.book_id,
        GROUP_CONCAT(ba.author SEPARATOR ',') AS authors
        FROM book b
        JOIN book_author ba ON b.book_id = ba.book_id
        WHERE b.school_id = %s AND ba.author = %s
        GROUP BY b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, b.summary, b.book_image, b.book_id """
            cur.execute(query, (school_id,str(search_text),))
        books = cur.fetchall()
        cur.close()
        print(len(books))
        if len(books) != 0:
            return render_template('schooltry2.html',books = books ,no_results=False)
        else:
            no_results = True
    
    cur = mydb.connection.cursor()
    query = """ SELECT b.title, b.ISBN, b.book_image, b.book_id,
    GROUP_CONCAT(ba.author SEPARATOR ',') AS authors
    FROM book b
    JOIN book_author ba ON b.book_id = ba.book_id
    WHERE b.school_id = %s 
    GROUP BY b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, b.summary, b.book_image, b.book_id """
    cur.execute(query,(school_id,))
    books = cur.fetchall()
    cur.close()
    return render_template('schooltry2.html',books = books ,no_results=no_results) 


@app.route('/request_library_form', methods=['GET', 'POST'])
def request_library_form(): 
    if request.method == "POST":
        newusername = request.form['newusername']
        newpassword = request.form['newpassword']
        fname = request.form['fname']
        lname = request.form['lname']
        email = request.form['email']
        dob = request.form['dob']
        school_name = request.form['school_name']
        city = request.form['city']
        street = request.form['street']
        street_number = request.form['street_number']
        postal_code = request.form['postal_code']
        school_email = request.form['school_email']
        pfname = request.form['pfname']
        plname = request.form['plname']
        phone = request.form['phone']
        phone2 =  request.form['phone2']
        cur = mydb.connection.cursor()
        school_query = """ INSERT INTO school (school_name, city, street,street_number, postal_code, email, principal_lastname, principal_firstname, school_admin_lastname, school_admin_firstname,pending_flag)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,'pending')"""
        school_values = (school_name, city, street,street_number, postal_code, school_email, plname, pfname, lname, fname)
        try:
            cur.execute(school_query,school_values)  # Execute your INSERT statement here
            mydb.connection.commit()
        except Exception as e:
            flash("Υπαρχει λάθος στα στοιχεία του σχολείου")
            return redirect(url_for("request_library_form"))
        school_id = cur.lastrowid
        print(school_id)
        admin_query = """INSERT INTO lib_user (user_pwd, user_name, school_id, role_name, user_email,user_firstname,user_lastname,user_date_of_birth,user_pending_flag) 
        VALUES (%s, %s, %s, 'admin', %s, %s,%s,%s,'waiting')"""
        admin_values = (newpassword, newusername, school_id,email,fname,lname,dob)
        try:
            cur.execute(admin_query,admin_values)  # Execute your INSERT statement here
            mydb.connection.commit()
        except Exception as e:
            flash("Υπαρχει λάθος στα στοιχεία του Υπευθυνου χειριστή")
            delete_query = "DELETE FROM school WHERE school_id = %s"
            cur.execute(delete_query, (school_id,))
            mydb.connection.commit()
            return redirect(url_for("request_library_form"))
        phone1_query = """INSERT INTO school_phone (school_id,phone,phone_flag) 
        VALUES (%s,%s,'pending')"""
        phone1_values = (school_id,phone)
        print(phone)
        try:
            cur.execute(phone1_query,phone1_values)  # Execute your INSERT statement here
            mydb.connection.commit()
        except Exception as e:
            flash("Υπαρχει λάθος στα στοιχεία του 1ου τηλεφώνου")
            delete_query = "DELETE FROM school WHERE school_id = %s"
            cur.execute(delete_query, (school_id,))
            mydb.connection.commit()
            return redirect(url_for("request_library_form"))
        if len(phone2)> 0:
            phone2_query = """INSERT INTO school_phone (school_id,phone,phone_flag) 
            VALUES (%s,%s,'pending')"""
            phone2_values = (school_id,phone2)
            print(phone2)
            try:
                cur.execute(phone2_query,phone2_values)  # Execute your INSERT statement here
                mydb.connection.commit()
            except Exception as e:
                flash("Υπαρχει λάθος στα στοιχεία του 2ου τηλεφώνου")
                delete_query = "DELETE FROM school WHERE school_id = %s"
                cur.execute(delete_query, (school_id,))
                mydb.connection.commit()
                return redirect(url_for("request_library_form"))
        flash("Η αίτηση για εγγραφή νεας βιβλιοθήκης εχει καταχωρηθεί")
        return redirect(url_for("request_library_form"))
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

#Route για τα βιβλία του χρήστη
@app.route('/mybooks', methods=['GET', 'POST'])
def mybooks():
    school_id = session['school_id']
    user_id = session['user_id']
    if request.method == 'POST':
        book_status_id = request.form['book_status_id']
        book_id = request.form['book_id']
        print(book_status_id)
        cur = mydb.connection.cursor()
        query = "DELETE FROM book_status WHERE book_status_id = %s"
        cur.execute(query,(book_status_id,))
        mydb.connection.commit()
        query = "Select check_book_update(%s) as update_occured;"
        cur.execute(query,(book_id,))
        update_occured = cur.fetchone()
        print(update_occured)
        if update_occured[0]==0:
            query = "CALL increase_available_books(%s)"
            cur.execute(query,(book_id,))
            mydb.connection.commit()
        mydb.connection.commit()
        cur.close()

    cur = mydb.connection.cursor()
    query = """ SELECT bs.book_id, b.title, b.book_language, b.ISBN, bs.approval_date, bs.book_status_id, bs.return_date
        FROM book_status bs
        JOIN book b ON bs.book_id = b.book_id
        WHERE bs.user_id = %s AND bs.status = 'borrowed' """

    cur.execute(query,(user_id,))
    borrowed_books = cur.fetchall()
    query = """ SELECT bs.book_id, b.title, b.book_language, b.ISBN, bs.request_date, bs.book_status_id
        FROM book_status bs
        JOIN book b ON bs.book_id = b.book_id
        WHERE bs.user_id = %s AND bs.status = 'reserved' """
    cur.execute(query,(user_id,))
    reserved_books = cur.fetchall()
    query = """ SELECT bs.book_id, b.title,b.book_language, b.ISBN, bs.request_date, bs.book_status_id
        FROM book_status bs
        JOIN book b ON bs.book_id = b.book_id
        WHERE bs.user_id = %s AND bs.status = 'queue' """
    cur.execute(query,(user_id,))
    queued_books = cur.fetchall()
    cur.close()
    role_name = session['role_name']
    is_admin = role_name == 'admin'

    return render_template("mybooks.html",borrowed_books=borrowed_books,reserved_books=reserved_books,queued_books=queued_books,is_admin=is_admin)

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

@app.route('/edit_book',methods=['GET', 'POST'])
def edit_book():
    book_id = session['book_id']
    ISBN = session['ISBN']
    school_id = session['school_id']
    cur = mydb.connection.cursor()
    if request.method == 'POST':
        # Retrieve the updated book attributes from the form
        title = request.form['title']
        publisher = request.form['publisher']
        pages = request.form['pages']
        isbn = request.form['isbn']
        summary = request.form['summary']
        number_of_books = request.form['number_of_books']
        number_of_available_books = request.form['number_of_available_books']
        book_image = request.form['book_image']
        book_language = request.form['book_language']
        authors_modified = request.form['authors']
        authors_modified_list = authors_modified.split(",")
        print(authors_modified_list)
        themes_modified = request.form['themes']
        themes_modified_list = themes_modified.split(",")
        keywords_modified = request.form['keywords']
        keywords_modified_list = keywords_modified.split(",")

        # Perform the necessary database update query using the new information
        #cur = mydb.connection.cursor()
        query = "UPDATE book SET title = %s, publisher = %s, pages = %s, ISBN = %s, summary = %s, " \
                "number_of_books = %s, number_of_available_books = %s, book_image = %s, book_language = %s " \
                "WHERE book_id = %s"
        cur.execute(query, (title, publisher, pages, isbn, summary, number_of_books, number_of_available_books,
                            book_image, book_language, book_id,))
        mydb.connection.commit()
        # delete previous authors
        query = "DELETE FROM book_author WHERE book_id = %s "
        cur.execute(query, (book_id,))
        mydb.connection.commit()
        # insert new authors
        for author_modified in authors_modified_list:
            query = "INSERT INTO book_author (author,book_id) VALUES (%s,%s)"
            cur.execute(query,(author_modified,book_id,))  # Execute your INSERT statement here
            mydb.connection.commit()
        # delete previous themes
        query = "DELETE FROM book_theme WHERE book_id = %s "
        cur.execute(query, (book_id,))
        mydb.connection.commit()
        # insert new themes
        print(themes_modified_list)
        for themes_modified in themes_modified_list:
            print(themes_modified)
            try:
                query = "INSERT INTO book_theme (theme,book_id) VALUES (%s,%s)"
                cur.execute(query,(themes_modified,book_id,))  # Execute your INSERT statement here
                mydb.connection.commit()
            except Exception:
                flash("Wrong Themes Info")
                return redirect(url_for("edit_book"))
        # delete previous keywords
        query = "DELETE FROM book_keywords WHERE book_id = %s "
        cur.execute(query, (book_id,))
        mydb.connection.commit()
        # insert new authors
        for keywords_modified in keywords_modified_list:
            query = "INSERT INTO book_keywords (keywords,book_id) VALUES (%s,%s)"
            cur.execute(query,(keywords_modified,book_id,))  # Execute your INSERT statement here
            mydb.connection.commit()
        cur.close()
        # Redirect the user to the updated profile page or any other desired page
        return redirect(url_for('book_display'))
    cur = mydb.connection.cursor()
    #print("ISBN is ", type(ISBN))
    #print(int(ISBN))
    query = """SELECT b.book_id, b.title, b.publisher, b.pages,b.ISBN, b.summary,b.number_of_books,b.number_of_available_books,b.book_image,
        b.book_language,GROUP_CONCAT(ba.author SEPARATOR ',') AS authors
        FROM book b
        JOIN book_author ba ON b.book_id = ba.book_id
        WHERE b.school_id = %s AND b.ISBN = %s AND b.book_id = %s
        GROUP BY b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, b.summary, b.book_image, b.book_id
        """
    cur.execute(query,(school_id, int(ISBN),book_id))
    book_info = cur.fetchone()
    query = """SELECT GROUP_CONCAT(ba.author SEPARATOR ',') AS authors
        FROM book b
        JOIN book_author ba ON b.book_id = ba.book_id
        WHERE b.school_id = %s AND b.ISBN = %s AND b.book_id = %s
        GROUP BY b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, b.summary, b.book_image, b.book_id
        """
    cur.execute(query,(school_id, int(ISBN),book_id))
    authors = cur.fetchall()
    query = """SELECT GROUP_CONCAT(bt.theme SEPARATOR ',') AS themes
        FROM book b
        JOIN book_theme bt ON b.book_id = bt.book_id
        WHERE b.school_id = %s AND b.ISBN = %s AND b.book_id = %s
        GROUP BY b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, b.summary, b.book_image, b.book_id
        """
    cur.execute(query,(school_id, int(ISBN),book_id))
    themes = cur.fetchall()
    query = """SELECT GROUP_CONCAT(bk.keywords SEPARATOR ',') AS keywords
        FROM book b
        JOIN book_keywords bk ON b.book_id = bk.book_id
        WHERE b.school_id = %s AND b.ISBN = %s AND b.book_id = %s
        GROUP BY b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, b.summary, b.book_image, b.book_id
        """
    cur.execute(query,(school_id, int(ISBN),book_id))
    keywords = cur.fetchall()
    cur.close()
    return render_template('edit_book.html',book_info = book_info,authors=authors,themes=themes,keywords=keywords)

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

@app.route('/delete_book',methods=['GET', 'POST'])
def delete_book():
    book_id = session['book_id']
    cur = mydb.connection.cursor()
    delete_query = "DELETE FROM book WHERE book_id = %s"
    cur.execute(delete_query, (book_id,))
    mydb.connection.commit()
    cur.close()
    session.pop('book_id', None)
    return redirect(url_for('school_admin'))


#route για το βιβλίο που ο χρηστης επέλεξε
@app.route('/book_display',methods=['GET', 'POST'])
def book_display():
    if request.method == "POST":
        # Ο χρηστης πατησε το βιβλίο που θέλει
        ISBN = request.form['ISBN'] 
        book_id = request.form['book_id'] 
        session['ISBN'] = ISBN  
        session['book_id'] = book_id  
        return redirect(url_for('book_display'))
    # Εμφανιζει το βιβλίο που επέλεξε ο χρήστης
    ISBN = session['ISBN']
    book_id = session['book_id']
    school_id = session['school_id']
    cur = mydb.connection.cursor()
    print("ISBN is ", type(ISBN))
    print(int(ISBN))
    query = """SELECT b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, 
        GROUP_CONCAT(DISTINCT ba.author SEPARATOR ',') AS authors,
        b.summary, b.book_image, b.book_id,
        GROUP_CONCAT(DISTINCT bk.keywords SEPARATOR ',') AS keywords
        FROM book b
        JOIN book_author ba ON b.book_id = ba.book_id
        JOIN book_keywords bk ON b.book_id = bk.book_id
        WHERE b.school_id = %s AND b.ISBN = %s AND b.book_id = %s
        GROUP BY b.ISBN, b.title, b.publisher, b.number_of_available_books, b.pages, b.book_language, b.summary, b.book_image, b.book_id
        """
    cur.execute(query,(school_id, int(ISBN),book_id))
    book_info = cur.fetchone()
    print(book_id)
    cur.close()

    
    role_name = session['role_name']
    is_admin = role_name == 'admin'

    return render_template("book_display.html", book_info=book_info, is_admin= is_admin)

#route για τον χρήστη που θέλει να δανειστεί το βιβλίο
@app.route('/rent',methods=['GET', 'POST'])
def rent():
    ISBN = session['ISBN']
    school_id = session['school_id']
    user_id = session['user_id']
    role_name = session['role_name'] 
    book_id = session['book_id']
    print(book_id)
    print(user_id)
    #5 Ελεγχος για εκπροθεσμο
    cur = mydb.connection.cursor()
    query = """ SELECT bs.book_id
        FROM book_status bs
        WHERE bs.status = 'borrowed'
        AND bs.return_date IS NULL
        AND bs.approval_date <= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
        AND bs.user_id = %s"""

    cur.execute(query,(user_id,)) # Επιστρεφει ολα τα εκπροσθεσμα βιβλία για εναν χρήστη
    ekprothesma = cur.fetchall()
    print("ekprothesma = ", ekprothesma)
    if (ekprothesma==()):
        print("mesa")
        # Ελεγχος αν αυτο που διαλεξες το εχεις δανεισμένο ή κρατημένο
        query = """ SELECT book_id FROM book_status WHERE user_id = %s AND book_id = %s AND (return_date IS NULL OR status = 'reserved') """
        cur.execute(query,(user_id, book_id,))
        exei_daneistei = cur.fetchone()
        if exei_daneistei:
            flash("Εχετε ήδη δανειστει/κρατήσει αυτο το βιβλίο")
            return redirect(url_for("book_display"))
        else:    
            query = """ SELECT number_of_available_books FROM book WHERE book_id = %s"""
            cur.execute(query,(book_id,))
            diathesima_antitipa = cur.fetchone()
            print(diathesima_antitipa)
            if (int(diathesima_antitipa[0])>0):
                try:
                    query = "INSERT INTO book_status (book_id, user_id, status, request_date) VALUES (%s, %s, 'reserved', CURDATE())"
                    ## ΑΛΛΑΓΗ ΝΑ ΒΑΛΛΩ ΤΟ book_status_id
                    cur.execute(query,(book_id,user_id,))  # Execute your INSERT statement here
                except Exception as e:
                    error_message = str(e)
                    flash("Εχετε περάσει τον αριθμό δανεισμών")
                    return redirect(url_for("book_display"))
                mydb.connection.commit()
                query = "CALL decrease_available_books(%s)"
                cur.execute(query,(book_id,))
                mydb.connection.commit()
                cur.close()
                flash("H Κρατηση για το βιβλίο επιβεβαιωθηκε.Μπορειτε να την δείτε στην καρτελα Mybooks. Μπορειτε να πατε να παρετε το βιβλίο σας")
                return redirect(url_for("book_display"))
            else:
                flash('Δεν υπαρχουν διαθέσιμα αντιτυπα μπορείτε ομως να κανετε <a href ="'+url_for('queue')+'">κράτηση</a>','info')
                return redirect(url_for("book_display"))

    else:
        flash("Δεν εχετε επιστρεψει καποιο βιβλίο")
        return redirect(url_for("book_display"))

    # ΓΕΝΙΚΑ ΕΔΩ ΠΡΕΠΕΙ ΝΑ ΚΑΝΟΥΜΕ ΠΟΛΛΑ QUERIES ΚΑΙ ΝΑ ΕΚΤΕΛΕΣΟΥΜΕ ΟΛΟΥΣ ΤΟΥΣ ΕΛΕΓΧΟΥΣ
    #1. 2 ΔΑΝΕΙΣΜΟΙ ΤΗΝ ΒΔΟΜΑΔΑ ΑΝΑ ΒΔΟΜΑΔΑ ΓΙΑ ΤΟΝ ΜΑΘΗΤΗ -> 1 εως 4 σε trigger
    #2. 1 ΔΑΝΕΙΣΜΟΣ ΤΗΝ ΕΒΔΟΜΑΔΑ ΑΝΑ ΒΔΟΜΑΔΑ ΓΙΑ ΤΟΝ ΚΑΘΗΓΗΤΗ
    #3. 2 ΚΡΑΤΗΣΕΙΣ ΤΗΝ ΕΒΔΟΜΑΔΑ ΑΝΑ ΕΒΔΟΜΑΔΑ ΓΙΑ ΤΟ ΜΑΘΗΤΗ
    #4. 1 ΚΡΑΤΗΣΗ ΤΗΝ ΕΒΔΟΜΑΔΑ ΑΝΑ ΕΒΔΟΑΜΔΑ ΓΙΑ ΤΟΝ ΚΑΘΗΓΗΤΗ
    #5. ΔΕΝ ΕΠΙΤΡΕΠΕΤΑΙ ΚΡΑΤΗΣΗ ΑΝ ΧΡΩΣΤΑΕΙ ΝΑ ΕΠΙΣΤΡΕΨΕΙ ΕΚΠΡΟΘΕΣΜΟ ΒΙΒΛΙΟ -> ΠΡΟΘΕΣΜΙΑ = 1 ΒΔΟΜΑΔΑ
    #6. ΔΕΝ ΕΠΙΤΡΕΠΕΤΑΙ ΚΡΑΤΗΣΗ ΑΝ ΕΧΕΙ ΉΔΗ ΔΑΝΕΙΣΤΕΙ ΑΥΤΟ ΤΟ ΒΙΒΛΙΟ / Η ΕΧΕΙ ΚΑΝΕΙ ΚΡΑΤΗΣΗ ΑΥΤΟ ΤΟ ΒΙΒΛΊΟ

#Route για ουρα αναμονης
@app.route('/queue',methods=['GET', 'POST'])
def queue():
    ISBN = session['ISBN']
    school_id = session['school_id']
    user_id = session['user_id']
    role_name = session['role_name'] 
    book_id = session['book_id']
    cur = mydb.connection.cursor()
    try:
        query = "INSERT INTO book_status (book_id, user_id, status, request_date) VALUES (%s, %s, 'queue', CURDATE())"
        ## ΑΛΛΑΓΗ ΝΑ ΒΑΛΛΩ ΤΟ book_status_id
        cur.execute(query,(book_id,user_id,))  # Execute your INSERT statement here
    except SQLTriggerError as e:
        error_message = str(e)
        flash("Εχετε περάσει τον αριθμό κρατήσεων")
        return redirect(url_for("book_display"))
    mydb.connection.commit()
    cur.close()
    flash("H Κρατηση για το βιβλίο επιβεβαιωθηκε.Μπορειτε να την δείτε στην καρτελα Mybooks. Εκει θα μπορείτε να δείτε ποτε θα μπορείτε να πάτε να πάρετε το βιβλίο σας ")
    return redirect(url_for("book_display"))

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
@app.route('/review', methods=['GET', 'POST'])
def review():
    school_id = session['school_id']
    user_id = session['user_id']
    book_id = session['book_id']
    
    if request.method == 'POST':
        review_text = request.form['review-text']
        rating = request.form['likert']

        # Store the review and rating in the database
        cur = mydb.connection.cursor()
        insert_query = """ INSERT INTO review (user_id, book_id, review_text, rev_date, rating,review_pending_flag) VALUES (%s, %s, %s, CURDATE(), %s,'pending') """
        cur.execute(insert_query, (user_id,book_id,review_text,rating,))
        mydb.connection.commit()
        cur.close()

        flash("Η αξιολόγηση σας ειναι υπο έγκριση")
        return redirect(url_for("book_display"))
    
    # Ελεγχος αν εχει δανειστει το βιβλίο για να μπροεί να κάνει αξιολογηση
    cur = mydb.connection.cursor()
    print(user_id)
    print(book_id)
    query = "SELECT book_status_id FROM book_status WHERE user_id = %s AND book_id = %s AND status = 'borrowed'"
    cur.execute(query, (user_id, book_id))
    existing_borrowing = cur.fetchone()
    cur.close()
    if existing_borrowing == None:
        flash("Δεν εχετε δανειστει αυτο το βιβλίο για να μπορείτε να το αξιολογήσετε")
        return redirect(url_for("book_display"))
    # Ελεγχος αν εχει ήδη αξιολογήσει το βιβλίο
    cur = mydb.connection.cursor()
    #Αν ειναι pending
    query = "SELECT * FROM review WHERE user_id = %s AND book_id = %s AND review_pending_flag='pending'"
    cur.execute(query, (user_id, book_id))
    existing_review = cur.fetchone()
    cur.close()
    if existing_review:
        flash("Η αξιολογηση σας ειναι υπο εγκριση")
        return redirect(url_for("book_display"))
    # Check if the user has already reviewed the book
    cur = mydb.connection.cursor()
    query = "SELECT * FROM review WHERE user_id = %s AND book_id = %s"
    cur.execute(query, (user_id, book_id))
    existing_review = cur.fetchone()
    cur.close()
    if existing_review:
        flash("Εχετε ηδη αξιολογήσει αυτό το βιβλίο")
        return redirect(url_for("book_display"))
    role_name = session['role_name']
    is_admin = role_name == 'admin' 
    return render_template("review_test2.html", is_admin=is_admin)

@app.route('/review_users_test')
def review_users_test():
    school_id = session['school_id']
    book_id = session['book_id']
    # Connect to the database to fetch the review applications
    cur = mydb.connection.cursor()

    # Fetch the review applications from the 'review_applications' view
    query = """ SELECT u.user_name, r.review_text, r.rating, u.user_id, r.book_id
        FROM review r
        JOIN lib_user u ON r.user_id = u.user_id
        WHERE r.review_pending_flag IS NULL AND u.school_id = %s and r.book_id = %s"""
    cur.execute(query,(school_id,book_id,))
    review_applications = cur.fetchall()
    cur.close()
    role_name = session['role_name']
    is_admin = role_name == 'admin'

    # Render the template with the review applications
    return render_template("review_users_test.html", review_applications = review_applications,is_admin = is_admin)

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
    themes = ['Fiction','Non-fiction','Dystopia','Gothic','Science Fiction', 'Science','Drama', 'Adventure','Mystery', 'Romance','War', 'Classic','Thriller', 'Horror', 'Fantasy', 'Biography', 'Autobiography', 'History', 'Poetry', 'Comics', 'Cookbooks', 'Travel', 'Religion', 'Self-help', 'Art', 'Music','Coming of Age', 'Sports', 'Humor', 'Children','Reference']
    print(themes)
    if request.method == 'POST':
        # Get the selected book theme from the form
        selected_theme = request.form['theme']
        print(selected_theme)

        # Execute the query to retrieve authors for the selected book theme
        cur = mydb.connection.cursor()
        author_query = "SELECT DISTINCT book_author.author FROM book_theme INNER JOIN book_author ON book_theme.book_id = book_author.book_id WHERE book_theme.theme = %s "
        cur.execute(author_query, (str(selected_theme),))
        authors = cur.fetchall()
        print('authors = ' ,authors)

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
        SELECT u.user_id, u.user_firstname, u.user_lastname,u.user_date_of_birth, s.school_name, COUNT(*) as num_books_borrowed
FROM lib_user u
JOIN school s ON u.school_id = s.school_id
JOIN book_status bs ON u.user_id = bs.user_id
WHERE u.role_name = 'teacher' AND u.user_date_of_birth > DATE_SUB(CURDATE(), INTERVAL 40 YEAR) AND bs.status = 'borrowed'
GROUP BY u.user_id
ORDER BY num_books_borrowed DESC
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
    bt1.theme AS theme1,
    bt2.theme AS theme2,
    COUNT(*) AS borrow_count
    FROM
    book_theme bt1
    INNER JOIN book_theme bt2 ON bt1.book_id = bt2.book_id AND bt1.theme < bt2.theme
    INNER JOIN book_status ON bt2.book_id = book_status.book_id
    WHERE
    book_status.status = 'borrowed'
    GROUP BY
    bt1.theme, bt2.theme
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
   SELECT ba.author, COUNT(DISTINCT b.book_id) AS book_count
   FROM book_author ba
   JOIN book b ON ba.book_id = b.book_id
   GROUP BY ba.author
   HAVING book_count <= (SELECT MAX(author_book_count) - 5 FROM
   (SELECT COUNT(DISTINCT b2.book_id) AS author_book_count
   FROM book_author ba2
   JOIN book b2 ON ba2.book_id = b2.book_id
   GROUP BY ba2.author) AS author_book_counts)
   ORDER BY book_count DESC
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
        school_id_to_review = request.form['school_id']
        session['school_id_to_review'] = school_id_to_review
        return redirect(url_for('verify_school_application'))

    # Connect to the database to fetch the data
    cur = mydb.connection.cursor()

    # Fetch data from the 'library_applications' view
    query = "SELECT school_id, school_name, user_id, user_firstname, user_lastname FROM school_applications"
    cur.execute(query)
    applications = cur.fetchall()
    cur.close()

    # Render the template with the data
    return render_template('library_applications.html', applications=applications)

@app.route('/verify_school_application', methods=['GET', 'POST'])
def verify_school_application():
    if request.method == 'POST':
        school_id_to_review = request.form['school_id']
        action = request.form['action']
        user_id = request.form['user_id']
        print(user_id)
        if action == 'accept':
            cur = mydb.connection.cursor()
            query = "UPDATE school SET pending_flag = NULL WHERE school_id = %s"
            cur.execute(query, (school_id_to_review,))
            mydb.connection.commit()
            query = "UPDATE lib_user SET user_pending_flag = NULL WHERE user_id = %s "
            cur.execute(query, (user_id,))
            mydb.connection.commit()
            query = "UPDATE school_phone SET phone_flag = NULL WHERE school_id = %s "
            cur.execute(query, (school_id_to_review,))
            mydb.connection.commit()
            cur.close()
            session.pop('school_id_to_review', None)
            return redirect(url_for('super_admin_school_applications'))

        elif action == 'delete':
            # Connect to the database to perform database operations
            cur = mydb.connection.cursor()
            # Delete the application from the 'library_applications' table
            delete_query = "DELETE FROM school WHERE school_id = %s"
            cur.execute(delete_query, (school_id_to_review,))
            mydb.connection.commit()
            cur.close()
            session.pop('school_id_to_review', None)
            return redirect(url_for('super_admin_school_applications'))
    school_id_to_review = session['school_id_to_review'] 
    print(school_id_to_review)
    # Connect to the database to fetch the application details
    cur = mydb.connection.cursor()
    # Get application details from the database
    query = "SELECT school_id,school_name,school_admin_firstname,school_admin_lastname,user_id FROM school_applications WHERE school_id = %s"
    cur.execute(query, (school_id_to_review,))
    application = cur.fetchone()
    cur.close()

    # Render the template with the application details
    return render_template('verify_school_applications.html', application=application)


@app.route('/super_admin_backup_restore', methods=['GET', 'POST'])
def super_admin_backup_restore():
    if request.method == "POST":
        action = request.form['action']
        if action == 'backup':
            # code for backup
            os.system('mysqldump -u root db2023 > database_backup.sql')
        if action == 'restore':
            # code for restore
            os.system('mysql -u root db2023 < database_backup.sql')
    return render_template("backup.html")


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

@app.route('/school_admin_add_books', methods=['GET', 'POST'])
def school_admin_add_books(): 
    school_id = session['school_id']
    if request.method == "POST":
        title = request.form['title']
        publisher = request.form['publisher']
        pages = request.form['pages']
        isbn = request.form['isbn']
        summary = request.form['summary']
        number_of_books = request.form['number_of_books']
        book_image = request.form['book_image']
        language = request.form['language']
        author = request.form['author']
        author2 =  request.form['author2']
        keywords = request.form['keywords']
        keywords_list = keywords.split(",")
        print(keywords_list)
        cur = mydb.connection.cursor()
        school_query = """ INSERT INTO book (title, publisher, pages, ISBN, summary, number_of_books,number_of_available_books, book_image, book_language, school_id)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"""
        book_values = (title, publisher, pages, isbn, summary, number_of_books,number_of_books, book_image, language,school_id)
        try:
            cur.execute(school_query,book_values)  # Execute your INSERT statement here
            mydb.connection.commit()
        except Exception as e:
            flash("Υπαρχει λάθος στα στοιχεία του βιβλιου")
            return redirect(url_for("school_admin_add_books"))
        book_id = cur.lastrowid
        author1_query = """ INSERT INTO book_author (book_id, author)
        VALUES (%s,%s)"""
        author1_values = (book_id,author)
        print(author)
        try:
            cur.execute(author1_query,author1_values)  # Execute your INSERT statement here
            mydb.connection.commit()
        except Exception as e:
            flash(" Ποιος ειναι ο Συγγραφεας;")
            delete_query = "DELETE FROM book WHERE school_id = %s"
            cur.execute(delete_query, (school_id,))
            mydb.connection.commit()
            return redirect(url_for("school_admin_add_books"))
        if len(author2)> 0:
            author2_query = """INSERT INTO school_phone (book_id,author) 
            VALUES (%s,%s)"""
            author2_values = (school_id,author2)
            print(author2)
            try:
                cur.execute(author2_query,author2_values)  # Execute your INSERT statement here
                mydb.connection.commit()
            except Exception as e:
                flash("Λαθος Phone")
                delete_query = "DELETE FROM book WHERE school_id = %s"
                cur.execute(delete_query, (school_id,))
                mydb.connection.commit()
                return redirect(url_for("school_admin_add_books"))
        for keyword in keywords_list:
            keywords_query = """ INSERT INTO book_keywords (book_id, keywords)
            VALUES (%s,%s)"""
            keywords_values = (book_id, keyword)
            try:
                cur.execute(keywords_query,keywords_values)  # Execute your INSERT statement here
                mydb.connection.commit()
            except Exception as e:
                flash("Λαθος keywords")
                delete_query = "DELETE FROM book WHERE school_id = %s"
                cur.execute(delete_query, (school_id,))
                mydb.connection.commit()
                return redirect(url_for("school_admin_add_books"))

        print(keywords)
        flash("Το βιβλιο Προστεθηκε")
        return redirect(url_for("school_admin_add_books"))
    else:
        return render_template("school_admin_add_books.html")

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
    if request.method == 'POST':
        search_text = request.form['search_text']
        search_type = request.form['search_type']
        if (len(search_text) != 0):
            print(search_type)

            # Connect to the database and execute the query based on the search type
            
            q1 = """  SELECT CONCAT(u.user_firstname, ' ', u.user_lastname) AS borrower_name, bt.theme, AVG(r.rating) AS avg_rating
                FROM lib_user u
                INNER JOIN review r ON u.user_id = r.user_id
                INNER JOIN book b ON r.book_id = b.book_id
                INNER JOIN book_theme bt ON b.book_id = bt.book_id
                WHERE u.school_id = %s"""
            if search_type == "Full_Name":
                # extra info
                
                search_text_list = search_text.split(" ")
                print(search_text_list[0])
                print(search_text_list[1])
                query = q1+" AND u.user_firstname = %s  AND u.user_lastname = %s GROUP BY u.user_id, bt.theme;"
                cur.execute(query,(school_id, str(search_text_list[0]),str(search_text_list[1]), ))
                ratings = cur.fetchall()
                print(ratings)
                if len(ratings) == 0:
                    # Render the template with no results message
                    return render_template('school_admin_Q3.html', no_results=True)
                query = """ SELECT lib_user.user_id, CONCAT(lib_user.user_firstname, ' ', lib_user.user_lastname) as full_name, AVG(review.rating) as avg_rating
                FROM lib_user
                JOIN review ON lib_user.user_id = review.user_id
                WHERE lib_user.school_id = %s AND lib_user.user_firstname = %s  AND lib_user.user_lastname = %s
                GROUP BY lib_user.user_id;
                """
                cur.execute(query,(school_id, str(search_text_list[0]),str(search_text_list[1]), ))
                user_info = cur.fetchall()
                return render_template('school_admin_Q3.html', ratings=ratings,user_info= user_info)
            elif search_type == 'Category':
                # extra info
                query = q1+" AND bt.theme = %s GROUP BY u.user_id, bt.theme"
                cur.execute(query,(school_id, search_text, ))
                ratings = cur.fetchall()
                if len(ratings) == 0:
                    # Render the template with no results message
                    return render_template('school_admin_Q3.html', no_results=True)
                query = """ SELECT bt.theme, AVG(r.rating) as avg_rating
                FROM book_theme bt
                JOIN book b ON bt.book_id = b.book_id
                JOIN review r ON b.book_id = r.book_id
                WHERE b.school_id = %s AND bt.theme = %s
                GROUP BY bt.theme;
                """
                cur.execute(query, (school_id,search_text,))
                theme_info = cur.fetchall()
                return render_template('school_admin_Q3.html', ratings=ratings,theme_info=theme_info)
        
    # Get Method
    query = """ SELECT CONCAT(u.user_firstname, ' ', u.user_lastname) AS borrower_name, bt.theme, AVG(r.rating) AS avg_rating
            FROM lib_user u
            INNER JOIN review r ON u.user_id = r.user_id
            INNER JOIN book b ON r.book_id = b.book_id
            INNER JOIN book_theme bt ON b.book_id = bt.book_id
            WHERE u.school_id = %s
            GROUP BY u.user_id, bt.theme
            """
    cur.execute(query, (school_id,))
    ratings = cur.fetchall()
    #Average by user
    query = """ SELECT lib_user.user_id, CONCAT(lib_user.user_firstname, ' ', lib_user.user_lastname) as full_name, AVG(review.rating) as avg_rating
            FROM lib_user
            JOIN review ON lib_user.user_id = review.user_id
            WHERE lib_user.school_id = %s
            GROUP BY lib_user.user_id;
            """
    cur.execute(query, (school_id,))
    user_info = cur.fetchall()
    #Average by theme
    query = """ SELECT bt.theme, AVG(r.rating) as avg_rating
            FROM book_theme bt
            JOIN book b ON bt.book_id = b.book_id
            JOIN review r ON b.book_id = r.book_id
            WHERE b.school_id = %s
            GROUP BY bt.theme;
            """
    cur.execute(query, (school_id,))
    theme_info = cur.fetchall()
    # Render the template with the query results
    return render_template('school_admin_Q3.html', ratings=ratings,user_info= user_info,theme_info=theme_info)

# Extra Route για να ελεγξει αιτήσεις αξιολόγησης 
@app.route('/school_admin_reviews', methods=['GET', 'POST'])
def school_admin_reviews():
    school_id = session['school_id']
    if request.method == 'POST':
        book_id = request.form['book_id']
        user_id = request.form['user_id']
        action = request.form['action']

        # Connect to the database
        cur = mydb.connection.cursor()

        if action == 'accept':
            print("inside sccept")
            # Insert the review application into the 'review' table
            query = "UPDATE review SET review_pending_flag=NULL WHERE user_id = %s AND book_id=%s"
            cur.execute(query, (user_id,book_id))
            mydb.connection.commit()
        elif action == 'deny':
            # Delete the review application from the 'review_applications' view
            query = "DELETE FROM review WHERE user_id = %s AND book_id=%s"
            cur.execute(query, (user_id,book_id))
            mydb.connection.commit()

        cur.close()

    # Connect to the database to fetch the review applications
    cur = mydb.connection.cursor()

    # Fetch the review applications from the 'review_applications' view
    query = """ SELECT u.user_name, r.review_text, r.rating, u.user_id, r.book_id, b.title
        FROM review r
        JOIN lib_user u ON r.user_id = u.user_id
        JOIN book b ON b.book_id = r.book_id
        WHERE r.review_pending_flag = 'pending' AND u.school_id = %s"""
    cur.execute(query,(school_id,))
    review_applications = cur.fetchall()
    cur.close()

    # Render the template with the review applications
    return render_template('school_admin_reviews.html', review_applications=review_applications)

# Extra route για αν διαγράφει χρήστες
@app.route('/delete_users' , methods = ['GET', 'POST'])
def delete_users():
    school_id = session['school_id']
    if request.method == 'POST':
        cur = mydb.connection.cursor()
        user_id = request.form['user_id']
        # Delete the item from the 'book_status' table
        query = "DELETE FROM lib_user WHERE user_id = %s"
        cur.execute(query, (user_id,))
        mydb.connection.commit()
        cur.close()

    # Connect to the database to fetch the data
    cur = mydb.connection.cursor()

    # Fetch data from the 'book_status' table with status='reserved'
    query = """SELECT user_id, user_name, user_firstname, user_lastname, role_name FROM lib_user WHERE school_id = %s AND role_name IN ('student','teacher') 
    ORDER BY user_lastname"""
    cur.execute(query, (school_id,))
    users = cur.fetchall()
    cur.close()

    # Render the template with the data
    return render_template('delete_users.html', users=users)

# Extra Route για να ελεγξει κρατήσεις -> να τις κανει δανεισμους [ΟΚ]
@app.route('/school_admin_reservations', methods=['GET', 'POST'])
def school_admin_reservations():
    if request.method == 'POST':
        item_id = request.form['item_id']
        user_id = request.form['user_id']
        book_status_id = request.form['book_status_id']
        action = request.form['action']

        # Connect to the database
        cur = mydb.connection.cursor()
        print(type(item_id))
        if action == 'accept':
            # Change the status to 'borrowed' in the 'book_status' table
            query = "UPDATE book_status SET status = 'borrowed', approval_date = CURDATE() WHERE book_status_id=%s "
            ## ΑΛΛΑΓΗ ΝΑ ΒΑΛΛΩ ΤΟ book_status_id
            cur.execute(query, (book_status_id,))
            mydb.connection.commit()

            # Να βάλλουμε και current date το rent_date
        elif action == 'deny':
            # Delete the item from the 'book_status' table
            query = "DELETE FROM book_status WHERE book_status_id = %s"
            cur.execute(query, (book_status_id,))
            mydb.connection.commit()
            query = "Select check_book_update(%s) as update_occured;"
            cur.execute(query,(int(item_id),))
            update_occured = cur.fetchone()
            if update_occured[0]==0:
                query = "CALL increase_available_books(%s)"
                cur.execute(query,(int(item_id),))
                mydb.connection.commit()
            mydb.connection.commit()
        elif action == 'deny_queue':
            # Delete the item from the 'book_status' table
            query = "DELETE FROM book_status WHERE book_status_id = %s"
            cur.execute(query, (book_status_id,))
            mydb.connection.commit()
            

        cur.close()

    # Connect to the database to fetch the data
    cur = mydb.connection.cursor()

    # Fetch data from the 'book_status' table with status='reserved'
    query = "SELECT b.book_id, b.title, u.user_id, u.user_lastname, bs.book_status_id FROM book_status bs JOIN book b ON bs.book_id = b.book_id JOIN lib_user u ON bs.user_id = u.user_id WHERE bs.status = 'reserved'"
    cur.execute(query)
    reserved_items = cur.fetchall()
    query = "SELECT b.book_id, b.title, u.user_id, u.user_lastname,bs.book_status_id FROM book_status bs JOIN book b ON bs.book_id = b.book_id JOIN lib_user u ON bs.user_id = u.user_id WHERE bs.status = 'queue'"
    cur.execute(query)
    queued_items = cur.fetchall()
    cur.close()

    # Render the template with the data
    return render_template('school_admin_reservations.html', reserved_items=reserved_items,queued_items=queued_items)

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
            query = """ SELECT bs.book_id
                FROM book_status bs
                WHERE bs.status = 'borrowed'
                AND bs.return_date IS NULL
                AND bs.approval_date <= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
                AND bs.user_id = %s"""

            cur.execute(query,(user_id,)) # Επιστρεφει ολα τα εκπροσθεσμα βιβλία για εναν χρήστη
            ekprothesma = cur.fetchall()
            print("ekprothesma = ", ekprothesma)
            if (ekprothesma==()):
                print("mesa")
                # Ελεγχος αν αυτο που διαλεξες το εχεις δανεισμένο ή κρατημένο
                query = """ SELECT book_id FROM book_status WHERE user_id = %s AND book_id = %s AND (return_date IS NULL OR status = 'reserved') """
                cur.execute(query,(user_id, book_id,))
                exei_daneistei = cur.fetchone()
                if exei_daneistei:
                    flash("Εχετε ήδη δανειστει/κρατήσει αυτο το βιβλίο")
                    return redirect(url_for("school_admin_new_booking"))
                else:    
                    query = """ SELECT number_of_available_books FROM book WHERE book_id = %s"""
                    cur.execute(query,(book_id,))
                    diathesima_antitipa = cur.fetchone()
                    print(diathesima_antitipa)
                    if (int(diathesima_antitipa[0])>0):
                        try:
                            query = "INSERT INTO book_status (book_id, user_id, status, approval_date) VALUES (%s, %s, 'borrowed', CURDATE())"
                            ## ΑΛΛΑΓΗ ΝΑ ΒΑΛΛΩ ΤΟ book_status_id
                            cur.execute(query,(book_id,user_id,))  # Execute your INSERT statement here
                        except Exception as e:
                            error_message = str(e)
                            flash("O χρήστης έχει περάσει τον αριθμό δανεισμών")
                            return redirect(url_for("school_admin_new_booking"))
                        mydb.connection.commit()
                        query = "CALL decrease_available_books(%s)"
                        cur.execute(query,(book_id,))
                        mydb.connection.commit()
                        cur.close()
                        flash("Ο δανεισμός για το βιβλίο επιβεβαιωθηκε")
                        return redirect(url_for("school_admin_new_booking"))
                    else:
                        flash('Δεν υπαρχουν διαθέσιμα αντιτυπα')
                        return redirect(url_for("school_admin_new_booking"))

            else:
                flash("Ο χρήστης δεν εχει επιστρεψει καποιο εκπροθεσμο βιβλίο")
                return redirect(url_for("school_admin_new_booking"))

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
        book_status_id = request.form['book_status_id']

        # Connect to the database
        cur = mydb.connection.cursor()

        # Update the 'return_date' to the current date in the 'book_status' table
    
        query = "Select check_book_update(%s) as update_occured;"
        cur.execute(query,(int(item_id),))
        update_occured = cur.fetchone()
        print(update_occured)
        query = "UPDATE book_status SET return_date = CURDATE() WHERE book_status_id=%s"
        cur.execute(query, (book_status_id,))
        mydb.connection.commit()
        if update_occured[0]==0:
            query = "CALL increase_available_books(%s)"
            cur.execute(query,(int(item_id),))
            mydb.connection.commit()
        cur.close()

    # Connect to the database to fetch the data
    cur = mydb.connection.cursor()

    # Fetch data from the 'book_status' table with status='booked' and return_date=NULL
    query = """SELECT bs.book_id, b.title, bs.user_id, u.user_firstname, u.user_lastname,bs.book_status_id
    FROM book_status bs
    JOIN book b ON bs.book_id = b.book_id
    JOIN lib_user u ON bs.user_id = u.user_id
    WHERE bs.status = 'borrowed' AND bs.return_date IS NULL
    ORDER BY u.user_lastname"""
    cur.execute(query)
    booked_items = cur.fetchall()
    cur.close()

    # Render the template with the data
    return render_template('school_admin_book_return.html', booked_items=booked_items)
