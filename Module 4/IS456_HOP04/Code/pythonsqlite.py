"""Python to Sqlite database design"""

import sqlite3
from sqlite3 import Error as e


def create_connection(db_file):
    """Create a Sqlite database connection."""
    conn = None
    try:
        conn = sqlite3.connect(db_file)
        print(sqlite3.version)
    except e:
        print(e)
    finally:
        if conn:
            conn.close()


if __name__ == "__main__":
    create_connection(r"D:/Repositories/Python/Python-SQLite/")
