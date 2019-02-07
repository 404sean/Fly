import sqlite3

DATABASE = 'database.db'
SCHEMA = './conf/schema.sql'

class db_handler:
    """
        Handle connection and queries to SQLite
    """
    
    def __init__(self):
        """
            Constructor
        """
        try:
            # connect to the DB
            self.conn = sqlite3.connect(DATABASE)
            self.conn.row_factory = sqlite3.Row
        except (Exception) as error:
            print(error)

    def query(self, query, args=(), one=False):
        """
            Query the DB
        """
        cur = self.conn.execute(query, args)
        if one:
            rv = cur.fetchone()
        else:
            rv = cur.fetchall()
        cur.close()
        return rv
    
    def edit(self, query, args=()):
        """
            Insert in the DB
        """
        self.conn.execute(query, args)
        self.conn.commit()

    def init(self):
        """
            Init DB schema
        """
        with open(SCHEMA, 'r') as f:
            self.conn.cursor().executescript(f.read())
        self.conn.commit()

    def close(self):
        """
            Close DB connection
        """
        if self.conn is not None:
            self.conn.close()
    
    # queries
    def get_user_password(self, username):
        row = self.query('SELECT passwd_hash FROM user WHERE username=?', (username,), True)
        return row['passwd_hash'] if row else None

