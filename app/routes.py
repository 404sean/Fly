from app import app
from flask import g, render_template, redirect, url_for, request, session
from app.db import db_handler
from app.utils import hash_sha1

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
    title="MyApp - Welcome!"
    return render_template('index.html', title=title)

@app.route('/users')
def users():
    title="MyApp - List users"
    if session['username']:
        db = get_db()
        users = db.query("SELECT * from user")
        return render_template('users.html', title=title, users=users)
    else:
        return redirect(url_for('login'))

@app.route('/adduser', methods=['POST', 'GET'])
def add_user():
    title="MyApp - Add a new user"
    error = None
    msg = None
    if session['username']:
        if request.method=='POST':
            firstname = request.form['firstname']
            lastname = request.form['lastname']
            email = request.form['email']
            username = request.form['username']
            passwd = request.form['password']
            if firstname is None or lastname is None or email is None or username is None or passwd is None:
                error = 'All fields are mandatory.'
            else:
                passwd_hash = hash_sha1(passwd) 
                db = get_db()
                db.add_user(username, passwd_hash, firstname, lastname, email)
                msg = 'User was successfully added!'
        return render_template('adduser.html', title=title, msg=msg, error=error)
    else:
        return redirect(url_for('login'))

@app.route('/login', methods=['POST', 'GET'])
def login():
    title="MyApp - Login"
    error = None
    if request.method=='POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = hash_sha1(password) 
        db = get_db()
	# custom query
        stored_password = db.get_user_password(username)
        if stored_password != hashed_password:
            error = 'Invalid Credentials. Please try again.'
        else:
            session['username'] = username
            return redirect(url_for('index'))
    return render_template('login.html', title=title, error=error)

@app.route('/logout')
def logout():
    title="MyApp - Logout"
    g.username = None
    session['username'] = None
    return render_template('logout.html', title=title)

@app.route('/ex1')
def ex1():
    title = "My App - Example 1"
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
    
    return render_template('ex1.html', title=title, user=user, posts=posts)
    
@app.route('/airports')
def airports():
    title ="List of airports"
    db = get_db()
    airports = db.query("SELECT * from airport")
    return render_template('airports.html', title=title, airports=airports)

@app.route('/company')
def company():
    title ="List of company"
    db = get_db()
    company = db.query("SELECT * from company")
    return render_template('company.html', title=title, company=company)
    
@app.route('/flight')
def flights():
    title ="List of flights"
    db = get_db()
    flight = db.query("SELECT a.destination_id AS did, d.city AS dcity, c.departure_time AS dtime, c.arrival_time AS atime, c.duration AS duration, b.name AS cname, e.plane_model AS pname from flight AS a, company AS b, schedule AS c, airport AS d, plane as e WHERE a.schedule_id = c.id AND a.company_id = b.id AND a.destination_id = d.id AND a.plane_id = e.id ORDER BY dtime")
    return render_template('flight.html', title=title, flight=flight)
 

                                                       
