# Programmer: James Aniciete
# Course No.: CSC 157
# Lab No.: 13
# Date: 4/30/2020

"""
##### Example Code #####
### Matrices
# declare an array and display its elements
myArray = { 3, 5, 10, 12, 20 }
for i in myArray :
	print (i, "\t", end = "")
print(" ")

# declare an array and transpose its elements
MatA = {}
def showMatrix (MatA, m, n) :
    for i in range(m) :
        for j in range(n) :
            print(MatA[i][j], "\t", end = "")
        print("\n")

def showTranspose(MatA, m, n) :
    for j in range(n):
        for i in range(m) :
            print(MatA[i][j], "\t", end = "")
        print("\n")

MatA = ((32, 43, 62), (94, 17, 27), (57, 67, 82), (93, 70, 18))
print("Original 4 x 3 matrix:")
showMatrix(MatA, 4, 3)
print("Transpose 3 x 4 matrix:")
showTranspose(MatA, 4, 3)

# Question 2 Check
Mat2 = [[18, 33, -41], [-41, -27, 73], [11, 69, 56]]
showMatrix(Mat2, 3, 3)
showTranspose(Mat2, 3, 3)

### Exception Handling
# Python program to handle simple runtime error
a = [10, 20, 30] # an array simulated as a list

try : 
    print("second element in the array = %d" % (a[1]))
    
    # Throws error since there are only 3 elements in array
    print("fourth element in the array = %d" % (a[3])) 

except IndexError :
    print("an exception has occurred")
"""
#######################

### program to add two 3 by 3 matrices using nested loops
import numpy as np  # for matrix algebra

try:
    # original matrices
    matx = [[9, 11, 4], [3, 10, 4], [6, 7, 11]]    
    maty = [[3, 9, 2], [1, 9, 6], [10, 2, 4]]    
    
    # raise an IndexError if a matrix isn't 3x3
    if len(matx) != 3 or len(maty) !=3:
        raise(IndexError)
    for i in range(3):
        if len(matx[i]) !=3 or len(maty[i]) != 3:
            raise(IndexError)

    # print the matrices
        # Matrix X
    print(" ----------------------")
    print("Matrix X")
    print(" ----------------------")
    for i in matx:
        print(i)
    print("")
        # Matrix Y
    print(" ----------------------")
    print("Matrix Y")
    print(" ----------------------")
    for i in maty:
        print(i)
    print("")

    # scalar multiplication
    def ScalarMult(ScaM, scalar):
        for i in range(len(ScaM)):
            for j in range(len(ScaM[0])):
                ScaM[i][j] = scalar * ScaM[i][j]
        return ScaM

    # matrix addition (includes option for subtraction)
    def MatrixAdd(m1, m2, add = True):
        # initialize variable for the sum
        sum = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        # to subtract, use ScalarMult() to reverse the sign of the 2nd matrix
        if add == False:
            m2 = ScalarMult(m2, -1)
        for i in range(len(m1)):
            for j in range(len(m1[0])):
                sum[i][j] += m1[i][j] + m2[i][j]
        return sum

    # matrix multiplication
    def MatrixMult(m1, m2):
        product = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        m1 = np.array(m1)
        m2 = np.array(m2)
        product = np.dot(m1,m2)
        return product

    # transpose
    def MatrixTranspose(m):
        transpose = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        for j in range(len(m[0])):
            for i in range(len(m)):
                transpose[i][j] = m[j][i]
        return transpose

    # Analyze Matrix & its Transpose, i.e. Matrix - Tranpose
    def TransposeAnalysis(m):
        difference = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        transpose = MatrixTranspose(m)
        difference = MatrixAdd(m, transpose, False)
        return difference

    # Matrix Determinant
    def Determinant(m):
        # return the determinant
        return int(round(np.linalg.det(m))) # have to round with numpy.linalg.det()
                                            # int() for formatting

    # Trace of a Square Matrix
    def Trace(m):
        trace = 0
        for i in range(len(m)):
            for j in range(len(m[0])):
                if i == j:
                    trace += m[i][j]
        return trace

    close = "N"
    while close != "Y":
        matrix = input("Which of the matrices would you like to analyze? (X, Y, or Both)\n")
        print("Analysis Options:")

        if matrix == "X" or matrix == "Y":
            data = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
            answer = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
            # assign correct matrix to data
            if matrix == "X":
                data = matx
            else:
                data = maty
            # display options
            print("\t1. Scalar Multiplication")
            print("\t2. Transpose")
            print("\t3. Difference of Matrix and its Transpose")
            print("\t4. Determinant")
            print("\t5. Trace")
            option = int(input("Enter an analysis option: "))
            # based on option, call corresponding function
            if option == 1:
                scalar = int(input("Enter a scalar: "))
                result = ScalarMult(data, scalar)
            elif option == 2:
                result = MatrixTranspose(data)
            elif option == 3:
                result = TransposeAnalysis(data)
            elif option == 4:
                print(Determinant(data))
            elif option == 5:
                print(Trace(data))
            if option in [1,2,3]:
                for i in result:
                    print(i)
        elif matrix == "Both":
            print("\t1. Matrix Addition")
            print("\t2. Matrix Multiplication")
            print("\t3. Transpose of Matrix Sum and Difference Between Originals & Transpose")  # answers Steps 5 & 6
            print("\tNote: Order does not matter for matrix addition and multiplication.")
            option = int(input("Enter an analysis option: "))
            if option == 1:
                result = MatrixAdd(matx, maty)
                for i in result:
                    print(i)
            elif option == 2:
                result = MatrixMult(matx, maty)
                for i in result:
                    print(i)
            elif option == 3:
                # Steps 5 - Transpose of Matrix Sum
                transpose5 = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
                sumxy = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
                diffx = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
                diffy = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

                sumxy = MatrixAdd(matx, maty)
                transpose5 = MatrixTranspose(sumxy)
                print("Tranpose of the Sum of Matrix X & Matrix Y i.e. (X + Y) ^ T")
                for i in transpose5:
                    print(i)
                print("")
                # Step 6 - Difference between original matrices and transpose
                diffx = MatrixAdd(matx, transpose5, False)
                # have to multiply transpose by -1 since False case of MatrixAdd 
                # unintentionally stores the opposite of transpose5
                transpose5 = ScalarMult(transpose5, -1)
                diffy = MatrixAdd(maty, transpose5, False)
                print("X - (X + Y) ^ T")
                for i in diffx:
                    print(i)
                print("")
                print("Y - (X + Y) ^ T")
                for i in diffy:
                    print(i)
        else:
            print("Invalid entry.")
        close = input("Would you like to close the program? (Y/N)\n")
except IndexError:
    print("One or both of the matrices are not 3x3.")

