"""Sqlite 3 implementation in python"""

import sqlite3

ins_x = 0

connection = sqlite3.connect('test.db')

cur = connection.cursor()

# cur.execute('CREATE TABLE test (id INTEGER PRIMARY KEY, data TEXT)')

while True:
    i = cur.executemany("INSERT INTO test ( data ) VALUES ( 'this is a good sized line of text.' )")
    ins_x += 1
    for i in range(1000):
        if ins_x <= 1000:
            continue
    else:
        break

connection.commit()

connection.close()
