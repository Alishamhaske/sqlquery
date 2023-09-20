use employeequery
create table employee2
(
eid int unique,
ename varchar(20),
email varchar (20),
esalary numeric(12,2),
eage int,
city varchar(20)
)

select* from employee2

insert into employee2 values (1,'alisha','alisha@gmail.com',45353.33,22,'pune')
insert into employee2 values (2,'alisha','alisha12@gmail.com',45353.33,22,'pune')
insert into employee2 values (3,'tanu','tanu@gmail.com',45353.33,22,'nagar')
insert into employee2 values (4,'arti','arti@gmail.com',45353.33,22,'nagar')

select ename ,email from employee2
-- alias to the column & to the table
select ename as 'empname' ,email as 'em_email' from employee2

select emp.ename as 'emp name',emp.email,emp.esalary from employee2 emp


select emp.* from employee2 emp

-- select with where clause  where clause check for match data

-- get the data  id is 2 
--select * from emp where eid=3
select * from employee2 where eid=1



select * from employee2 where city='Pune'
select * from employee2 where city='nagar'







