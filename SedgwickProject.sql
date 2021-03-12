-- Course Table

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
select * from course;
-- Instructor Table
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
select * from instructor;

-- Students Table
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
select * from students;
/*--------------------------- START OF PROJECT -------------------------------*/
/* Part A */
-- 1
select c.topic, count(stu_id) as "STUDENT COUNT"
from course c, students s
where c.course_id = s.course_id
group by c.topic
order by c.topic;

--2
select distinct(c.last_name) as instructor,
       s.stu_first_name || ' ' || s.stu_last_name as student, 
       s.topic_course, s.type_id, s.course_id
from course c, students s
where c.course_id = s.course_id
order by instructor, s.topic_course, s.type_id, student;

-- 3
select c.last_name as instructor, count(s.stu_last_name) as "STUDENT COUNT"
from course c join students s on c.course_id = s.course_id
group by c.last_name
order by instructor;

/* select instructor, count(instructor) as "STUDENT COUNT"
from (select course_id,
      case 
        when course_id in (1, 4) then 'Pappas'
        when course_id in (2, 3) then 'Stein'
        when course_id = 5 then 'Logan'
        when course_id = 6 then 'Manners'
        when course_id = 7 then 'Morley'
      end as instructor
      from students)
group by instructor
order by instructor; */


-- 4 
select order_id, order_date, stu_last_name, stu_first_name, stu_id, topic_course, type_id, 
       course_id, fee, discount, to_char((1-discount/100)*fee, '$999.99') as must_pay
from students;

-- unnecessary self-join method (USM)
select s1.order_id, s1.order_date, s1.stu_last_name, s1.stu_first_name, 
       s1.stu_id, s1.topic_course, s1.type_id, s1.course_id, s1.fee,
       s1.discount, s2.must_pay as "MUST PAY"
from (select order_id, discount, fee, 
      case
        when discount = 0 then to_char(fee, '$999.99')
        when discount <> 0 then to_char((1-discount/100)*fee, '$999.99')
        end as must_pay
        from students) s2, students s1
where s1.order_id = s2.order_id;

-- 5
select course_id, topic_course, to_char(sum(must_pay), '$999.99') as "TOTAL FEES"
from (select order_id, order_date, stu_last_name, stu_first_name, stu_id, topic_course, type_id, 
             course_id, fee, discount, (1-discount/100)*fee as must_pay
      from students)
group by course_id, topic_course
order by course_id;

-- 6 
select to_char(sum(must_pay), '$9999.99') as "GRAND TOTAL FEES"
from (select order_id, order_date, stu_last_name, stu_first_name, stu_id, topic_course, type_id, 
             course_id, fee, discount, (1-discount/100)*fee as must_pay
      from students);

-- 7
select course_id, topic, type_id
from course
where type_id <> 'A';

/* Part B */
-- 1
begin
    update students
    set fee = 1.05 * fee;
end;

select * from students;

-- 2
begin
    insert into instructor
    values(112, 'Hacker', 'Harry', 'III');
    insert into course
    values(8, 'SQL', 'C', 'Hacker', '22-MAR-06', '6:00pm', 250, 200);
    insert into students
    values(121, '13-NOV-05', 'Katchup', 'Kit', 'K1001', 'SQL', 'C', 8, 250, 0);
    commit;
end;

select * from instructor;
select * from course;
select * from students;

-- 3
create or replace function get_instr_student_count
    (v_instr_last_name in varchar2)
    return number
is
    v_student_count number;
begin
    select count(s.stu_last_name)
    into v_student_count
    from course c join students s on c.course_id = s.course_id
    where c.last_name = v_instr_last_name
    group by c.last_name;
    
    return v_student_count;
end;

-- confirm function works
select get_instr_student_count('Pappas') from dual;

-- procedure to call function - must enclose name in ''
set serveroutput on
set verify off
declare 
    v_student_count number(3);
    v_instructor varchar2(20):=&sv_instructor;
begin 
    v_student_count := get_instr_student_count(v_instructor);
    dbms_output.put_line(v_instructor || ' has ' || v_student_count 
        || ' students.');
end;

-------------------------------------------------------------------------------
-- attempt of function w/ array
/*create or replace function get_instr_student_count
    (v_instr_last_name in varchar2)
    return number
    
IS 
    v_student_count number:=0;
    --type varray_type1 is varray(2) of students.course_id%type;
    varray_course_ids varray_type1;    
    
BEGIN
    if v_instr_last_name = 'Papas' then 
        varray_course_ids:= varray_type1(1,4);
        -- varray_type1 varray_course_ids := varray_type1(1,4)
    elsif v_instr_last_name = 'Stein' then
        varray_course_ids := varray_type1(2,3);
    elsif v_instr_last_name = 'Logan' then
        varray_course_ids := varray_type1(5);
    elsif v_instr_last_name = 'Manners' then
        varray_course_ids := varray_type1(6);
    elsif v_instr_last_name = 'Morley' then 
        varray_course_ids := varray_type1(7);
    end if; 
    
    select count(*)
    into v_student_count
    from students
    where course_id in varray_course_ids;
    
    return v_student_count;

end;

-- need join to call
set serveroutput on
set verify off
declare 
    student_count number(3);

begin 
    student_count := get_instr_student_count('Pappas');
    dbms_output.put_line('Studnet Count: ' || student_count);
end;
*/

/* Part C */
-- 1
-- create views using info from instructor and course tables
create or replace view logan_view
as select i.emp_id, i.instr_last_name, i.instr_first_name, i.level_id,
          c.course_id, c.topic, c.type_id, c.date_course, c.time_course, c.fee,
          c.room
   from instructor i join course c on i.instr_last_name = c.last_name
   where instr_last_name = 'Logan'
   with read only;
   
select * from logan_view;

-- create views using only instructor info by emp_id
create or replace view morley_view
as select *
   from instructor
   where instr_last_name = 'Morley'
   with read only;
create or replace view pappas_view
as select *
   from instructor
   where instr_last_name = 'Pappas'
   with read only;
create or replace view stein_view
as select *
   from instructor
   where instr_last_name = 'Stein'
   with read only;
create or replace view logan_view
as select *
   from instructor
   where instr_last_name = 'Logan'
   with read only;
create or replace view arthur_view
as select *
   from instructor
   where instr_last_name = 'Arthur'
   with read only;   
create or replace view leonard_view
as select *
   from instructor
   where instr_last_name = 'Leonard'
   with read only;
create or replace view zalman_view
as select *
   from instructor
   where instr_last_name = 'Zalman'
   with read only;
create or replace view bronson_view
as select *
   from instructor
   where instr_last_name = 'Bronson'
   with read only;
create or replace view manners_view
as select *
   from instructor
   where instr_last_name = 'Manners'
   with read only;
create or replace view richards_view
as select *
   from instructor
   where instr_last_name = 'Richards'
   with read only;
create or replace view hacker_view
as select *
   from instructor
   where instr_last_name = 'Hacker'
   with read only;

select * from morley_view;
select * from pappas_view;
select * from stein_view;
select * from logan_view;
select * from arthur_view;
select * from leonard_view;
select * from zalman_view;
select * from bronson_view;
select * from manners_view;
select * from richards_view;
select * from hacker_view;

drop sequence students_orderid_seq;
drop sequence course_courseid_seq;
-- 2
-- order_id sequence
create sequence students_orderid_seq increment by 1
    start with 101
    nomaxvalue
    minvalue 101
    nocycle
    nocache;
-- course_id sequence
create sequence course_courseid_seq increment by 1
    start with 1
    nomaxvalue
    minvalue 1
    nocache
    nocycle;
commit;
-- view sequences' information
select *
from user_sequences
where sequence_name = 'STUDENTS_ORDERID_SEQ';
select *
from user_sequences
where sequence_name = 'COURSE_COURSEID_SEQ';









