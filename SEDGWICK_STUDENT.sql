DROP TABLE Students;
/
CREATE TABLE Students
(order_id number(3)PRIMARY KEY NOT NULL,
 order_date date,
 stu_last_name varchar2(20),
 stu_first_name varchar2(20),
 stu_id varchar2(10),
 topic_course varchar2(20),
 type_id char(1),
 course_id number(3),
 fee number(5),
 discount number(2))
/

INSERT INTO Students
VALUES (101, '10-Nov-11','Stevens','Steve','S1000','UNIX','C',7,200,0)
/
INSERT INTO Students
VALUES (102, '10-Nov-11','Richards','Roger','R1000','Visual Basic','B',2,150,0)
/
INSERT INTO Students
VALUES (103, '10-Nov-11','Andrews','Arthur','A1000','Windows','A',1,125,0)
/
INSERT INTO Students
VALUES (104, '11-Nov-11','Jeffries','Joyce','J1000','Finance','B',4,150,10)
/
INSERT INTO Students
VALUES (105, '11-Nov-11','Conners','Carol','C1000','Windows','A',5,125,0)
/
INSERT INTO Students
VALUES (106, '11-Nov-11','Tance','Terrence','T1000','Marketing','C',6,200,0)
/
INSERT INTO Students
VALUES (107, '11-Nov-11','Benson','Bobby','B1000','UNIX','C',7,200,10)
/
INSERT INTO Students
VALUES (108, '12-Nov-11','Stevens','Steve','S1000','Windows','A',5,125,0)
/
INSERT INTO Students
VALUES (109, '12-Nov-11','Boyce','Barbara','B1001','Visual Basic','A',3,125,0)
/
INSERT INTO Students
VALUES (110, '12-Nov-11','Norwood','Norman','N1000','Visual Basic','B',2,150,0)
/
INSERT INTO Students
VALUES (111, '12-Nov-11','Munson','Michael','M1000','Visual Basic','A',3,125,20)
/
INSERT INTO Students
VALUES (112, '12-Nov-11','Penn','Peter','P1000','UNIX','C',7,200,0)
/
INSERT INTO Students
VALUES (113, '12-Nov-11','Barlett','Betty','B1002','Finance','B',4,150,10)
/
INSERT INTO Students
VALUES (114, '12-Nov-11','Lords','Lance','L1000','Marketing','C',6,200,0)
/
INSERT INTO Students
VALUES (115, '13-Nov-11','Daniels','Denise','D1000','Marketing','C',6,200,0)
/
INSERT INTO Students
VALUES (116, '13-Nov-11','Benson','Bobby','B1000','Visual Basic','B',2,150,10)
/
INSERT INTO Students
VALUES (117, '13-Nov-11','Landers','Louise','L1001','Finance','B',4,150,0)
/
INSERT INTO Students
VALUES (118, '13-Nov-11','Orion','Orlando','O1000','Windows','A',1,125,0)
/
INSERT INTO Students
VALUES (119, '14-Nov-11','Reynolds','Randy','R1001','Finance','B',4,150,20)
/
INSERT INTO Students
VALUES (120, '14-Nov-11','Summers','Sandy','S1001','Visual Basic','A',3,125,0)
/
commit
/