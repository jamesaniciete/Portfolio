import pickle

# class file name: flights.py

class flights(object) :
    """ description of class """

    flightCount = 0     # will be the end range of for loops
    
    def __init__(self, date, dow, time, destination, airline, cost) :

        self.date = date
        self.dow = dow
        self.time = time
        self.destination = destination
        self.airline = airline
        self.cost = cost

        flights.flightCount += 1

    """ end class description """

# class file includes these flights objects
    # list of 12 flights from 12/9/2020 to 12/16/2020
myFlight = [ 
            flights("12/12", "Saturday", "07.00", "JFK", "Spirit", 35.00),        # NYC
            flights("12/12", "Saturday", "02.00", "BWI", "Delta", 120.00),        # Baltimore
            flights("12/13", "Sunday", "20.00", "BOS", "JetBlue", 89.00),         # Boston
            flights("12/13", "Sunday", "12.00", "SFO", "American", 170.00),       # San Fran
            flights("12/13", "Sunday", "15.00", "SAT", "United", 220.00),         # San Antonio
            flights("12/14", "Monday", "13.00", "JFK", "Southwest", 150.00),      # NYC
            flights("12/14", "Monday", "23.00", "JFK", "American", 75.00),        # NYC
            flights("12/15", "Tuesday", "11.00", "LAX", "United", 190.00),        # Los Angeles
            flights("12/15", "Tuesday", "12.00", "JNU", "Delta", 550.00),         # Juneau
            flights("12/16", "Wednesday", "08.00", "MSY", "United", 320.00),      # New Orleans
            flights("12/16", "Wednesday", "10.00", "CLE", "Spirit", 10.00),       # Cleveland
            flights("12/16", "Wednesday", "01.00", "ATL", "Southwest", 110.00)    # Atlanta
           ]

# save the data to a file
pickle.dump(myFlight, open("target.p", "wb"))

