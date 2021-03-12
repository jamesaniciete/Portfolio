# Programmer: James Aniciete
# Course No.: CSC 157
# Lab No.: 15
# Date: 5/9/2020

import sqlite3
from contacts import * # for contactlist

# open a db connection
db = sqlite3.connect("contacts.db")
# get a cursor object to execute SQLite statements in Python
c = db.cursor()

tblName = "James"

# if table already exists, uncomment this
c.execute(f"DROP TABLE {tblName}")

# function to create a "James" table and import data from contacts.py from the end of Lab 8
def createTable():
    # try to create the table
    try:
        c.execute(f"CREATE TABLE IF NOT EXISTS {tblName}(name TEXT, phone TEXT)")
        print(f"Table {tblName} has been created.")
        # insert contactlist data from contacts.py into the contacts table
        for row in contactlist:
            c.execute(f"INSERT INTO {tblName} VALUES('{row[0]}', '{row[1]}')")
        print(f"Importing data from contacts.py into the table '{tblName}'")
        db.commit()
    # display exception message if table already exists
    except:
        print(f"Table {tblName} already exists.")

# insert function
def insert(name, phone):
    # put the commits before the modifications to allow a rollback
    db.commit()
    c.execute(f"INSERT INTO {tblName} VALUES ('{name}', '{phone}')")
    print(f"A contact has been added with:\n\t Name: {name}\n\t Phone: {phone}")

# update function
def update(oName, oPhone, nName, nPhone):   # o = old / n = new
    db.commit()
    c.execute(f"UPDATE {tblName} \
                SET name = '{nName}', phone = '{nPhone}'\
                WHERE name = '{oName}' AND phone = '{oPhone}'")
    print(f"A contact has been updated:\n\tOriginal: {oName} and {oPhone}\n\tUpdated: {nName} and {nPhone}")

# delete function
def delete(name, phone):
    db.commit()
    c.execute(f"DELETE FROM {tblName}\
                WHERE name = '{name}' OR phone = '{phone}'")
    print(f"A contact has been deleted for:\n\t Name: {name}\n\t Phone: {phone}")

# function to select * from table
def selectAll():
    c.execute(f"SELECT * FROM {tblName}")
    return c.fetchall()

# function to rollback
def rollback():
    db.rollback()
    print("The last action was rolled back.")