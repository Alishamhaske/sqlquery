use practice1alter
create table Employee
(
id int primary key,
name varchar(20) not null,
email varchar(40) unique,
age int check(age>=18),
salary numeric(12,2)
)
-- select cmmand is called as DQL command -> to fetch data we use select

select * from Employee  

--DML --> insert
alter table employee drop column salary 
alter table employee add  salary numeric(12,2)
insert into Employee values(1,'Suraj','suraj@gmail.com',22,25000.45),
(2,'sandesh','sandesh@gmail.com',22,25000.45),
(3,'tanuja','tanja@gmail.com',22,25000.45),
(4,'alisha','alisha@gmail.com',22,25000.45),
(5,'tanu','tanu@gmail.com',22,25000.45)

update employee set salary=76667 where id=4 
update employee set salary=876878 where name='sandesh'
update employee set salary=876878 where age>20
update employee set salary=6578 where age<20

select * from employee