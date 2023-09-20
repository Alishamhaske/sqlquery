use practice1alter
--clause
create table Employee1
(
id int primary key,
name varchar(20) not null,
email varchar(40) unique,
age int check(age>=18),
salary numeric(12,2)
)

insert into Employee1 values(1,'Suraj','suraj@gmail.com',22,25000.45),
(2,'sandesh','sandesh@gmail.com',22,25000.45),
(3,'tanuja','tanja@gmail.com',22,25000.45),
(4,'alisha','alisha@gmail.com',22,25000.45),
(5,'tanu','tanu@gmail.com',22,25000.45)

select * from Employee1
select name ,email from employee1

-- alias to the column & to the table

select name as 'Employee name', email as 'Email Id' from Employee1

select emp.name as 'Emp name',emp.email,emp.salary from 
Employee1 emp

select e.* from 
Employee1 e


-- where clause check for match data
select * from Employee1 where id=1

select * from Employee1 where salary=null
select * from Employee1 where age <28

select * from Employee1 where age <>34 and age<>26


-- distinct  it is used to get unique record
select  distinct salary from Employee1 
select distinct age from Employee1

--and  both condition true
select * from Employee1 where salary<28000  and age<23
-- OR  --> either one is true
select * from Employee1 where name='suraj' or  age<20
--betwwen= fetch data from between range
select * from Employee1 where salary between 23000 and 25000
select * from Employee1 where age between 20 and 22

-- in caluse  --> match the multiple selection

select * from Employee1 where id in(1,2,3,6,4)
select * from Employee1 where age in(21,22,23,24,26)

-- not in calse --> skip the records

select * from Employee1 where salary not in(32442,3232)

select * from Employee1 where id not in(1,2,3,6,8)

--null  not null
select * from Employee1 where name is null
select * from Employee1 where age is not null




















