# Programmer: James Aniciete
# Course No.: CSC 157
# Lab 07: Object Oriented Programming with Classes

class Student :
    Scores = {} 
    Ranges = {}
    Averages = {}
    Grades = []

    # initializing the constructor method
    def __init__(self, name, grade) : 
        self.name = name
        self.grade = grade
        
    def getScores(self) :
        # begin function to obtain scores # 
        answer_key = []
        # read into answer_key list, the answer key from file
        answer_key = [line.strip() for line in open("answers.txt", 'r')]

        student_answers = []
        # read into student_answers list, student answers from file
        student_answers = \
            [line.strip().split(',') for line in open("data.txt", 'r')]

        total_score = 100

        # outer loop: figures out which sublist the student is in
        # inner loop: grades the student's paper by checking each answer with the answer key,
        # where each incorrect answer is a 10 pt deduction
        for i in range(len(student_answers)):
            if self.getName() == student_answers[i][0]:
                for j in range(len(student_answers[0])-1):
                    if student_answers[i][j+1] != answer_key[j]:
                        total_score -= 10
        # add dictionary entry for (key,value) = (student name, student's score)
        Student.Scores[self.getName()] = total_score
        return Student.Scores[self.getName()]

    def getName(self) :
        return self.name; 

    def getGrade(self):
        return self.grade

    def putGradeInList(self):
        Student.Grades.append(self.grade)
        return Student.Grades

    # static method to sort each dictionary
    @staticmethod
    def sortScores() :
        return sorted(Student.Scores.items());
    @staticmethod
    def sortRanges():
        return sorted(Student.Ranges.items());
    @staticmethod
    def sortAverages():
        return sorted(Student.Averages.items());
    # static method that calculates average of all students' scores on the new quiz
    @staticmethod
    def getClassAverage():
        total = 0
        average = 0.0
        for key in Student.Scores:
            total += Student.Scores[key]
        average = total/len(Student.Scores)
        return average

    # static method to calc overall average of students' grades (both old and new quiz grades)
    @staticmethod
    def getOverallClassAverage():
        total = 0
        average = 0.0
        i = 0 # counter to iterate over Grades list
        for key in Student.Scores:
            total += (Student.Scores[key] + Student.Grades[i])
            i += 1
        average = total/(2*len(Student.Scores)) # multiply by 2 since using 2 grades per student
        return average

    # method to get a student's average quiz grade
        # old grade = self.grade
        # new grade = corresponding value in Student.Scores dictionary
    def getAverages(self):
        average = 0
        average = (self.grade + Student.getScores(self))/2
        Student.Averages[self.getName()] = average
        return Student.Averages[self.getName()]

    # here, grade range is assumed to be |self.grade - Student's score|
    # i.e. |old quiz grade - new quiz grade|
    def getRanges(self):
        student_range = abs(self.getScores() - self.grade)
        Student.Ranges[self.getName()] = student_range
        return Student.Ranges[self.getName()]
    
    # static method to get class average range
    @staticmethod
    def getClassRange():
        class_average = 0.0
        range_total = 0
        for key in Student.Ranges:
            range_total += Student.Ranges[key]
        class_average = range_total/len(Student.Ranges)
        return class_average
    #---end the class definition#

# initialize class objects into a list
student_objs = [
    Student('Sammy Student',65), 
    Student('Betty Sanchez', 45),
    Student('Alice Brown', 100),
    Student('Tom Schulz', 50),
    Student('James Aniciete', 100)  # I guess "a" for each question
    ]

# call methods to get corresponding values
for index in range(len(student_objs)):
   student_objs[index].getScores()
   student_objs[index].getRanges()
   student_objs[index].getAverages()
   student_objs[index].putGradeInList()

# sort dictionaries
sortList = Student.sortScores();
sortAverages = Student.sortAverages();
sortRanges = Student.sortRanges();

# print each student's score, quiz grade, and grade range
i = 0
for k, v in sortList:
    print(k, "has score:", v, "\taverage quiz grade: %s \tgrade range: %s" % (str(sortAverages[i][1]), str(sortRanges[i][1])))
    i+=1
# call methods to print class averages
print("\n") # spacing
print("Class has new quiz average: {} \toverall quiz average: {} \tgrade range average: {}".format(Student.getClassAverage(), \
    Student.getOverallClassAverage(), Student.getClassRange()))

""" Alternative getScores method code and call to that method
        # calculate each students score with two for loops
        for i in range(4):  # number of list items in student_answers
            for j in range(len(student_answers[0]-1): # number of answers to check
                # if answer is incorrect, deduct 10 points from student's score
                if student_answers[i][j+1] != answer_key[j]:
                    total_score -= 10
            # add dictionary entry for (key,value) = (student name, student's score)
            Student.Scores[student_answers[i][0]] = total_score
            # reset score variable for next student
            total_score = 100
                # display dictionary key-value pairs sorted by student's first name
        for key in sorted(Student.Scores):
            print("%s has score: %s" % (key, Student.Scores[key]))

# call method to get students' scores
Student.getScores(Student)
"""







