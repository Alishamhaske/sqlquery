use practice1alter
--drop database dptitans
create table student
(
roll_no int,
sname varchar(20),
per numeric(5,2),
city varchar(10),
dob date
)
--modify the data type or size
alter table student alter column sname varchar(25)
--add colummn from the existing table
alter table student  add country varchar(20) 
--remove column from the existing table
alter table student drop column country
--rename column nmae
exec sp_rename 'student.sname' ,'stdname'

exec sp_help student