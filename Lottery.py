# Programmer: James Aniciete
# Course No.: CSC 157
# Lab 05: Lottery Game
# Date: 2/20/2020

'''
# import random module
import random

# use seed of 0 to allow correct answer output
#random.seed(0)

# variable initializations & declarations
    # integers
num1 = 0
num2 = 0
num3 = 0
    # lists 
numbers = []
winners = []
sortedNumbers = []
sortedWinners = []

# ask user for 3 numbers
print("Enter 3 different integers [0, 9] to play.")
num1 = int(input("Enter first number: "))
num2 = int(input("Enter second number: "))
num3 = int(input("Enter third number: "))
print("\n")

# while loop to ensure unique numbers are entered
while (num1 == num2) or (num1 == num3) or (num2==num3):
    print("The three numbers must be unique. Try again.")
    num1 = int(input("Enter first number: "))
    num2 = int(input("Enter second number: "))
    num3 = int(input("Enter third number: "))
    print("\n")

# append numbers into a list with a for loop
for i in [num1, num2, num3]:
    numbers.append(i)

# generate the unique winning numbers
winners = list(random.sample(range(0,10), 3))

# use function to sort numbers & winners
sortedNumbers = sorted(numbers)
sortedWinners = sorted(winners)

# display message to tell user if they won
if sortedNumbers == sortedWinners:
    print("Congratulations, you have won $100!")
else:
    print("Nice try, better luck next time around!")

# display the sorted entered numbers & winning numbers
print("The winning numbers were: ", winners[0], winners[1], winners[2])
print("Your numbers were: ", numbers[0], numbers[1], numbers[2])
'''

#####################################################################################################################
##### Extra Credit ######

# import random module
import random

# use seed of 0 to allow correct answer output
random.seed(0)

# display welcome message 
print("Welcome, you have three chances to Pick 3 and win.")

#give the user 3 attempts to guess the winning numbers correctly
for i in range(3):
    # variable initializations & declarations
        # string for playing Fireball or not
    style = ""
        # integers
    num1 = 0
    num2 = 0
    num3 = 0
    fireball = 0
        # lists
    numbers = []
    choices = [] # stores all choices for a winning combination
    winners = [] # contains 3 winning numbers
    sortedNumbers = []
    sortedChoices = []
            # four possible combinations for winning with Fireball number
    combos = [] # will contain winners1-4 as sublists
    winners1 = []
    winners2 = []
    winners3 = []
    winners4 = []
            # stores winning combination
    winningCombo = []
        # Boolean
    fireballWinner = False 

    # ask user if playing Fireball
    style = input("Would you like to play Fireball (Y/N)? ")
    print("\n")

    # ensure entry was valid
    while (style != "Y") and (style != "N"):
        style = input("Invalid entry. Would you like to play Fireball (Y/N)? ")
        print("\n")

    # ask user for 3 numbers
    print("Enter 3 different integers [0, 9] to play.")
    num1 = int(input("Enter first number: "))
    num2 = int(input("Enter second number: "))
    num3 = int(input("Enter third number: "))
    print("\n")

    # while loop to ensure unique numbers were entered
    while (num1 == num2) or (num1 == num3) or (num2 == num3):
        print("The three numbers must be unique. Try again.")
        num1 = int(input("Enter first number: "))
        num2 = int(input("Enter second number: "))
        num3 = int(input("Enter third number: "))
        print("\n")
    # append numbers into a list with a for loop
    for i in [num1, num2, num3]:
        numbers.append(i)
    # sort the numbers list
    sortedNumbers = sorted(numbers)

    if style == "Y":
        # generate list of unique winning numbers and the fireball number, the 4th number from the sample
        choices = list(random.sample(range(0,10), 4))
        # make list of winning numbers
        # slice uses an interval similar to range
        winners = choices[slice(0,4)]
        # store fireball number
        fireball = choices[3]
        # sort choices
        sortedChoices = sorted(choices)

        # make a list containing each possible combination of winning numbers
            # sublist containing elements 1-3
        winners1 = sortedChoices[0:3]    
            # contains elements 2-4
        winners2 = sortedChoices[1:4]
            # contains elements 1, 2, 4
        winners3.extend(sortedChoices[0:2])
        winners3.append(sortedChoices[3])
            # contains elements 1, 3, 4
        winners4.append(sortedChoices[0])
        winners4.extend(sortedChoices[2:4])

            # put sublists into a list
        combos = [winners1, winners2, winners3, winners4]
        print("Your possible combinations: ", sep ="")
        print(*combos, sep =", ")

        # if there is a winning combo, set Boolean variable to True & assign it to winningCombo
        for i in combos:
            if sortedNumbers == i:
                fireballWinner = True
                winningCombo = i

        # if user won, display the sorted entered numbers & winning numbers
        if fireballWinner == True:
            print("Congratulations! You have won $150 for playing Fireball Pick 3!")
            print("You won with the combination: ", winningCombo[0], winningCombo[1], winningCombo[2])
        else:
            print("Nice try, better luck next time around!")
        print("The winning numbers were: ", winners[0], winners[1], winners[2])
        print("The Fireball number was: ", fireball)
        print("Your numbers were: ", numbers[0], numbers[1], numbers[2])
    else:
        # generate the unique winning numbers
        winners = list(random.sample(range(0,10), 3))
        # use function to sort numbers & winners
        sortedNumbers = sorted(numbers)
        sortedWinners = sorted(winners)
        # display message to tell user if they won
        if sortedNumbers == sortedWinners:
            print("Congratulations, you have won $100 playing Pick 3!")
        else:
            print("Nice try, better luck next time around!")
        # display the sorted entered numbers & winning numbers
        print("The winning numbers were: ", winners[0], winners[1], winners[2])
        print("Your numbers were: ", numbers[0], numbers[1], numbers[2])
    print("\n")