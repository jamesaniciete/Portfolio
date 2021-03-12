DROP TABLE INSTRUCTOR;
/
CREATE TABLE INSTRUCTOR
(emp_id number(3)PRIMARY KEY NOT NULL,
 instr_last_name varchar2(20),
 instr_first_name varchar2(20),
 level_id varchar2(4))
/
INSERT INTO INSTRUCTOR
VALUES (101, 'Morley','Michele','III')
/
INSERT INTO INSTRUCTOR
VALUES (102, 'Pappas','Peter','III')
/
INSERT INTO INSTRUCTOR
VALUES (103, 'Stein','Steve','III')
/
INSERT INTO INSTRUCTOR
VALUES (104, 'Logan','Lance','I')
/
INSERT INTO INSTRUCTOR
VALUES (105, 'Arthur','Anthony','II')
/
INSERT INTO INSTRUCTOR
VALUES (106, 'Leonard','Lorraine','II')
/
INSERT INTO INSTRUCTOR
VALUES (107, 'Zalman','Zollie','III')
/
INSERT INTO INSTRUCTOR
VALUES (108, 'Bronson','Beatrice','III')
/
INSERT INTO INSTRUCTOR
VALUES (109, 'Manners','Monique','II')
/
INSERT INTO INSTRUCTOR
VALUES (110, 'Richards','Randy','I')
/
commit
/