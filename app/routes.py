from app import app
from flask import g, render_template, redirect, url_for, request, session
from app.db import db_handler
from app.utils import hash_sha1

# constants
TITLE = "My App Title"

def get_db():
    if 'db' not in g:
        g.db = db_handler()
    return g.db

@app.teardown_appcontext
def teardown_db(exception):
    db = g.pop('db', None)
    if db is not None:
        db.close()

@app.route('/')
@app.route('/index')
def index():
    user = {'username': 'Test'}
    posts = [
        {
            'author': {'username': 'Rambo'},
            'body': 'Beautiful day in Geneva!'
        },
        {
            'author': {'username': 'Susan'},
            'body': 'The Avengers movie was so cool!'
        }
    ]
    return render_template('index.html', title=TITLE, user=user, posts=posts)

@app.route('/login', methods=['POST', 'GET'])
def login():
    error = None
    if request.method=='POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = hash_sha1(password) 
        db = get_db()
        stored_password = db.get_user_password(username)
        if stored_password != hashed_password:
            error = 'Invalid Credentials. Please try again.'
        else:
            session['username'] = username
            return redirect(url_for('index'))
    return render_template('login.html', error=error)

@app.route('/logout')
def logout():
    g.username = None
    session['username'] = None
    return render_template('logout.html')

