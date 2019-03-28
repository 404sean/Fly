### Flymybird

```

source .env/bin/activate 

python 

```
python 
import app.db as db
db = db.db_handler()
db.query('select * from user')


python app/init_db.py

