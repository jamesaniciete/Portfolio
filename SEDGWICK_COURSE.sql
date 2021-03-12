DROP TABLE course;
/
CREATE TABLE course
(course_id number(3)PRIMARY KEY NOT NULL,
 topic varchar2(20),
 type_id char(1),
 last_name varchar2(20),
 date_course date,
 time_course varchar2(10), 
 fee number(4),
 room number(4))
/
INSERT INTO course
VALUES(1,'Windows','A','Pappas','20-Mar-12','9:00am',125,300)
/
INSERT INTO course
VALUES(2,'Visual Basic','B','Stein','20-Mar-12','12:00pm',150,400)
/
INSERT INTO course
VALUES(3,'Visual Basic','A','Stein','24-Mar-12','9:00am',125,500)
/
INSERT INTO course
VALUES(4,'Finance','B','Pappas','24-Mar-12','12:00pm',150,500)
/
INSERT INTO course
VALUES(5,'Windows','A','Logan','28-Mar-12','6:00pm',125,400)
/
INSERT INTO course
VALUES(6
,'Marketing','C','Manners','28-Mar-12','9:00am',200,600)
/
INSERT INTO course
VALUES(7,'UNIX','C','Morley','04-Apr-12','12:00pm',200,300)
/
commit
/