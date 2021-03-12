# Programmer: James Aniciete
# Course No.: CSC 157
# Lab No.: 12
# Date: 4/21/2020

import pickle
from flights import *   # imports the flights class

# store the list of flights in a variable named fl
fl = pickle.load(open("target.p", "rb"))
# initialize variables
response = "Y"      # to continue/end search program
matches = 0         # counts matches per search
alts = 0            # counts alternative flights per search
altIndices = []     # stores indices of alternative flights

# function to convert military time to regular time
def regTime(militaryTime):
    time = ""
    newTime = 0
    if int(militaryTime[0:2]) - 12 > 0:
        newTime = int(militaryTime[0:2])-12
        if newTime < 10:
            time = "0" + str(newTime) + ":" + militaryTime[3:5] + " PM"
        else:
            time = militaryTime[0:2] + ":" + militaryTime[3:5] + " PM"
    else:
        time = militaryTime[0:2] + ":" + militaryTime[3:5] + " AM"
    return time

# based on user inputs, search for available flights + possible alternative bookings
while response == "Y" or response == "y":
    # ask user to choose a sorting option
    answer = input("How would you like to sort the available flights?"
                   "\n\t1) Date"
                   "\n\t2) Airport Code (Destination)"
                   "\n\t3) Cost"
                   "\n\t4) Airline"
                   "\n\t5) All of the Above\n"
                   )
    # sort by date
    if answer == "1":
        date = input("\nPlease enter a date (MM/YY): ")
        print("")
        for i in range(flights.flightCount):
            if (date == fl[i].date):
                # increment match counter
                matches += 1
                # display initial result header and flight info
                if matches == 1:
                    print("Result(s): ")
                print ("\t",
                    fl[i].date, fl[i].dow, regTime(fl[i].time),
                    fl[i].destination, fl[i].airline, "$", "%.2f" % fl[i].cost)
            elif (date < fl[i].date):
                alts += 1
                altIndices.append(i)
        # display alternative flights on later dates
        if alts > 0:
            # message for no matches
            if matches == 0:
                print("No flights meet that condition.")
            # if there were matches, reset the counter
            else:
                matches = 0
            print("\nAlternative booking(s) for later dates: ")
            for i in altIndices:
                print ("\t",
                    fl[i].date, fl[i].dow, regTime(fl[i].time),
                    fl[i].destination, fl[i].airline, "$", "%.2f" % fl[i].cost)
            # reset alternative variables
            alts = 0
            altIndices = []
        # message for no matches or alternatives
        elif matches == 0:
            print("No flights scheduled for dates past and including {}.".format(date))
        # reset match counter if necessary
        else:
            matches = 0

    # sorted by US airport code
    elif answer == "2":
        dest = input("Please enter a US airport code: ")
        print("")
        for i in range(flights.flightCount):
            if (dest == fl[i].destination):
                matches += 1
                if matches == 1:
                    print("Result(s): ")
                print ("\t",
                    fl[i].date, fl[i].dow, regTime(fl[i].time),
                    fl[i].destination, fl[i].airline, "$", "%.2f" % fl[i].cost)
        if matches == 0:
            print("No flights found for {}.".format(dest))
        else:
            matches = 0

    # sort by max cost
    elif answer == "3":
        cost = float(input("Please enter a maximum cost: $"))
        print("")
        for i in range(flights.flightCount): 
            if (cost >= fl[i].cost):
                matches += 1
                if matches == 1:
                    print("Result(s): ")
                print ("\t",
                    fl[i].date, fl[i].dow, regTime(fl[i].time),
                    fl[i].destination, fl[i].airline, "$", "%.2f" % fl[i].cost)
            # alternative bookings that are up to $50 more
            elif (cost < fl[i].cost) and (cost < fl[i].cost + 50):
                alts += 1
                altIndices.append(i)
        if alts > 0:
            if matches == 0:
                print("No flights meet that condition.")
            else:
                matches = 0
            print("Alternative booking(s) within $50: ")
            for i in altIndices:
                print ("\t",
                    fl[i].date, fl[i].dow, regTime(fl[i].time),
                    fl[i].destination, fl[i].airline, "$", "%.2f" % fl[i].cost)
            alts = 0
            altIndices = []
        elif matches == 0:
            print("All flights cost more than $%.2f." % (cost+50))
        else:
            matches = 0

    # sort by airline
    elif answer == "4":
        airline = input("Please enter an airline: ")
        print("")
        for i in range(flights.flightCount):
            if (airline == fl[i].airline):
                matches += 1
                if matches == 1:
                    print("Result(s): ")
                print ("\t",
                    fl[i].date, fl[i].dow, regTime(fl[i].time),
                    fl[i].destination, fl[i].airline, "$", "%.2f" % fl[i].cost)
        if matches == 0:
            print("No flights found for {} Airlines.".format(airline))
        else:
            matches = 0

    # sort by date, destination, and max cost    
    elif answer == "5":
        date = input("Please enter a date (MM/YY): ")
        dest = input("Please enter a US airport code: ")
        cost = float(input("Please enter a maximum cost: $"))
        print("")
        # for loop to find exact match searches
        for i in range(flights.flightCount):
            if (date == fl[i].date) and (dest == fl[i].destination) and (cost >= fl[i].cost):
                matches += 1
                if matches == 1:
                    print("Result(s): ")
                print ("\t",
                    fl[i].date, fl[i].dow, regTime(fl[i].time),
                    fl[i].destination, fl[i].airline, "$", "%.2f" % fl[i].cost)
            # alternatives = flights that match two criteria
            elif (date == fl[i].date and dest == fl[i].destination) or (date == fl[i].date and cost >= fl[i].cost) or \
                 (dest == fl[i].destination and cost >= fl[i].cost):
                alts += 1
                altIndices.append(i)
        if alts > 0:
            if matches == 0:
                print("No flights meet all of those conditions.")
            else:
                matches = 0
            print("Alternative booking(s) that satisfy two conditions: ")
            for i in altIndices:
                print ("\t",
                    fl[i].date, fl[i].dow, regTime(fl[i].time),
                    fl[i].destination, fl[i].airline, "$", "%.2f" % fl[i].cost)
            alts = 0
            altIndices = []
        elif matches == 0:
            print("No flights found that match at least two of those conditions.")
        else:
            matches = 0 
    # invalid search option entered
    else:
        print("Invalid response.")
    
    # search again or quit program
    response = input("\nWould you like to search again (Y/N)? ")
    print("")