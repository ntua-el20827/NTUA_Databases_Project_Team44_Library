from flask import Flask

app = Flask(__name__)
app.config["MYSQL_USER"] = 'root'
app.config["MYSQL_PASSWORD"] = ''
app.config["MYSQL_DB"] = 'mydb'
app.config["MYSQL_HOST"] = '127.0.0.1'
app.config["SECRET_KEY"] = 'eee' ## secret key for sessions (signed cookies). Flask uses it to protect the contents of the user session against tampering.

from library import routes
