from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config["DB_ADMIN_USERNAME"] = 'root'
app.config["DB_ADMIN_PASSWORD"] = 'george'
app.config["DB_ADMIN_FIRSTNAME"] = 'Manos'
app.config["DB_ADMIN_LASTNAME"] = 'Neofotistos'

# Αυτά συσχετίζουν την βάση με την εφαρμογή που φτιάξαμε με το Flask
# Δεν ξέρω ακριβώς πως λειτουργούν
app.config['MYSQL_HOST'] = '127.0.0.1' # μαλλον το IP address την εφαρμογής
app.config['MYSQL_USER'] = 'root' 
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'library'
app.config["SECRET_KEY"] = 'ggg' ## secret key for sessions (signed cookies). Flask uses it to protect the contents of the user session against tampering.

mysql = MySQL(app)

from library import routes
