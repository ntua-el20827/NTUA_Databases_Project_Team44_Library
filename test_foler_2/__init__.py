from flask import Flask

app = Flask(__name__)
app.config['SECRET_KEY'] = 'mysecretkey'
app.config['DEBUG'] = True

from test_foler_2 import routes
