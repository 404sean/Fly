from utils import hash_sha1
from db import db_handler

USER = 'test'
PASSWD = 'passwd'
PASSWD_HASH = hash_sha1(PASSWD)

db = db_handler()

db.edit('INSERT INTO user (username, passwd_hash) VALUES (?, ?)', (USER, PASSWD_HASH,) )

res = db.query("SELECT * FROM user")
print(res[0]['username'])

res = db.get_user_password(USER)
print(res)

res = db.get_user_password('test2')
print(res)

db.close()
 
