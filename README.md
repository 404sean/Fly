### Flymybird

```

source .env/bin/activate 

python 

import app.db as db
db = db.db_handler()
db.query('select * from user')

vi app/routes.py



