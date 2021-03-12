# Programmer: James Aniciete
# Course No.: CSC 157
# Lab No.: 08 - GUI Programming with Tkinter

from tkinter import *
from tkinter import messagebox # for exit button's messagebox
from contacts  import *
import os # for exiting the app

# Prints the ListBox selection's index and the length of the contact list
def selection () :
    print ("At %s of %d" % (select.curselection(), len(contactlist)))
        # returns index of a tuple
    return int(select.curselection()[0])

# adds a new contact to the contact list
def addContact () :
    contactlist.append ([nameVar.get(), phoneVar.get()])
    setList ()

# update selected contact in the contact list w/ the nameVar and phoneVar
def updateContact() :
    contactlist[selection()]=[nameVar.get(), phoneVar.get()]
    setList ()

# delete selected contact from the contact list
def deleteContact() :
    del contactlist[selection()]
    setList ()

# load the selected contact's data into the name & phone variables
def loadContact  () :
    # put name and phone selections into a tuple 
    name, phone = contactlist[selection()]
    # use tuple to assign values to name and phone variables
    nameVar.set(name)
    phoneVar.set(phone)

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
    btn5 = Button(frame1,text=" Save ",command=saveContact)
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
    select = Listbox(frame1, yscrollcommand=scroll.set, height=7)
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
def setList () :
    contactlist.sort()
    select.delete(0,END)
    for name,phone in contactlist :
        select.insert (END, name)

# save the updated contactList
def saveContact():
    fobj = open("contacts.py", "w")
    fobj.write("contactlist = [")
    for items in contactlist:
        fobj.write(str(items))
        fobj.write(",")
        fobj.write("\n")
    fobj.write("]")

# display MessageBox entitled Contacts, providing option to exit the app
def exitContact():
    app_title = "Contacts"
    if messagebox.askokcancel(title = app_title, message = "Do you want to exit, OK or Cancel") == 1:
        os._exit(1)

root = buildFrame()
setList ()

# set size of window (width x height)
root.geometry("300x225")

root.mainloop()