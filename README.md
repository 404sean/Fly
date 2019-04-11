### Flymybird

```

source .env/bin/activate 

python 

import app.db as db
db = db.db_handler()
db.query('select * from user')

vi app/routes.py

### Setup (Part 1)
```
# https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
pip install virtualenv --user

# create virtual environment
cd $BASE_FOLDER
mkdir project
virtualenv .env

# Cours du 11.04



