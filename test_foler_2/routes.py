from flask import render_template, request
from test_foler_2 import app
from test_foler_2.forms import MyForm

@app.route('/', methods=['GET', 'POST'])
def index():
    form = MyForm()
    if request.method == 'POST' and form.validate():
        # Do something with the form data
        pass
    return render_template('index.html', form=form)
