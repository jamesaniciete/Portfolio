# Programmer: James Aniciete
# Course No.: CSC 157
# Lab No.: 15
# Date: 5/9/2020

from tkinter import *
from tkinter import messagebox # for exit button's messagebox
import os # for exiting the app
import myDatabasefile as dbf
import sqlite3

# create table
dbf.createTable()

# get contactlist
contactlist = dbf.selectAll()

# function to check for valid data entries
def validate(s): # s for string
    if s.strip("") != "":
        return True
    else:
        return False

# function to get the selection from the listbox
def selection():
    return int(select.curselection()[0])

# function to add a contact
def addContact():
    if validate(nameVar.get()) == True and validate(phoneVar.get()) == True:
        dbf.insert(nameVar.get(), phoneVar.get())
        canRoll = True
        # refresh the GUI
        refresh()
    elif validate(nameVar.get()) == False:
       print("Error: Enter a name.")
    elif validate(phoneVar.get()) == False:
        print("Error: Enter a phone number.")
    else:
        print("Error: Contact not added.\nMake sure that the Name and Phone fields are filled.")

# function to update a contact
def updateContact():
    if validate(nameVar.get()) == True and validate(phoneVar.get()) == True:
        dbf.update(oName, oPhone, nameVar.get(), phoneVar.get())
        canRoll = True
        # refresh the GUI
        refresh()
    elif validate(nameVar.get()) == False:
       print("Error: Enter a name.")
    elif validate(phoneVar.get()) == False:
        print("Error: Enter a phone number.")
    else:
        print("Error: Contact not updated.\nMake sure a contact is selected and that the Name and Phone fields are filled.")

# function to delete a contact
def deleteContact():
    try:
        if messagebox.askokcancel(title = "Delete Contact", 
            message = f"Are you sure you want to delete {contactlist[selection()][0]}'s contact information?") == 1:
            dbf.delete(nameVar.get(), phoneVar.get())
            canRoll = True
            refresh()
    except:
        print("Error: Select a contact to be deleted.")

# function to load a contact
def loadContact():
    try:
        # not really sure how this works
        global oName, oPhone
        oName = contactlist[selection()][0]
        oPhone = contactlist[selection()][1]
        # put name and phone selections into a tuple 
        name, phone = contactlist[selection()]
        # use tuple to assign values to name and phone variables
        nameVar.set(name)
        phoneVar.set(phone)
    except:
        print("Error: Select a contact from the list.")

# function to rollback a change
def rollback():
    global canRoll
    if canRoll == True:
        if (messagebox.askokcancel(title = "Rollback", message = "Would you like to undo the previous change?") == 1):
            dbf.rollback()
            refresh()
            canRoll = False

# function to exit the program
def exitContact():
    app_title = "Contacts"
    if messagebox.askokcancel(title = app_title, message = "Do you want to exit, OK or Cancel") == 1:
        # commit and close the database
        dbf.db.commit()
        dbf.db.close()
        os._exit(1)

# function that places all widgets into the frame individually
def buildFrame () :
    # define global variables
    global nameVar, phoneVar, select
    # create the main window widget
    root = Tk()
    # add title to the frame
    root.title("My Contact List")

    # create & pack a frame in the root window
    frame1 = Frame(root)
    frame1.pack()

    # on 1st row of frame:
        # create a label for name
    Label(frame1, text="Name:").grid(row=0, column=0, sticky=W)
        # initialize StringVar for name
    nameVar = StringVar()
        # assign entry button value to the name var
    name = Entry(frame1, textvariable=nameVar)
        # position name var in first row, second column, aligned to the west cell border
    name.grid(row=0, column=1, sticky=W)

    # on 2nd row of the frame:
        # create a label for phone no.
    Label(frame1, text="Phone:").grid(row=1, column=0, sticky=W)
        # create string var for phone no.
    phoneVar= StringVar()
        # assign entry button value to phone var
    phone= Entry(frame1, textvariable=phoneVar)
        # position phone var in second row, second column, aligned to the west
    phone.grid(row=1, column=1, sticky=W)

    # create & pack a frame in the root window
    frame1 = Frame(root)       
    frame1.pack()

    # add a row of buttons to frame1 with respective callback functions
    btn1 = Button(frame1,text=" Add  ",command=addContact)
    btn2 = Button(frame1,text="Update",command=updateContact)
    btn3 = Button(frame1,text="Delete",command=deleteContact)
    btn4 = Button(frame1,text=" Load ",command=loadContact)
    btn5 = Button(frame1,text="Rollback",command=rollback)
        # pack the buttons on the same row to the left
    btn1.pack(side=LEFT)
    btn2.pack(side=LEFT)
    btn3.pack(side=LEFT) 
    btn4.pack(side=LEFT)
    btn5.pack(side=LEFT)

    # allow for selection of names from a ListBox with a scrollbar
    frame1 = Frame(root)  
    frame1.pack()
        # create a vertical bar widget
    scroll = Scrollbar(frame1, orient=VERTICAL)
    # whichever value from the ListBox is clicked is assigned to select
        # height = # of values visible in the Listbox
    select = Listbox(frame1, yscrollcommand=scroll.set, height=8)
    scroll.config (command=select.yview)
    scroll.pack(side=RIGHT, fill=Y)
    select.pack(side=LEFT,  fill=BOTH)
    
    # create frame for Exit button at the bottom of the window
    frame2 = Frame(root)
    frame2.pack()
        # create exit button & pack it
    btn6 = Button(frame2, text = " Exit ", command = exitContact)
    btn6.pack()

    # return root object to allow for the frame to be built
    return root

# sorts the contact list & allows for an update to the ListBox
def setList():
    contactlist.sort()
    # delete all elements from the select element
    select.delete(0, END)
    # insert each name from the list to the end of the select element
    for name, phone in contactlist:
        select.insert(END, name)

# refresh function - used add the end of add, update, delete functions
def refresh():
    global canRoll, contactlist
    canRoll = True
    contactlist = dbf.selectAll()
    setList()

# initialize the application 
root = buildFrame()
setList()

# set size of window (width x height)
root.geometry("300x225")

root.mainloop()


