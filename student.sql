--create database Dptitan1
use [Dptitan]




CREATE TABLE  student
(

rollno int,
name varchar(20),
percentage numeric(6,2),
city varchar(20),
dob date

)
--modify the data type and size 
alter table student alter column name varchar(25)

--add column
alter table student add country varchar(20)

--remove column
alter table student drop column country
--rename column name
exec sp_rename 'student.name',studname


------------------
create table employee
(
id int,
name varchar(20),
salary int,
dept varchar(25)

)
---modify size 
alter table employee alter column name varchar(30)

---add column
alter table employee add mobile numeric

--remove column
alter table employee drop column mobile

--rename 
exec sp_rename 'employee.id','emp_id'


