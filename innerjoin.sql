use joinquery_12sep
--innear join
create table emp2
(
eid int ,
ename varchar(30),
email varchar(20),
age int,
salary numeric(20),
city varchar (30) ,
)



select * from emp2
insert into emp2(eid,ename,email,age,salary,city) 
values
(1,'alisha','alisha@gmail.com',23,76665,'nagar'),
(2,'tanu','alisha@gmail.com',23,76665,'nagar'),
(3,'sandesh','alisha@gmail.com',23,76665,'nagar'),
(4,'payal','alisha@gmail.com',23,76665,'nagar'),
(5,'riya','alisha@gmail.com',23,76665,'nagar'),
(6,'prasad','alisha@gmail.com',23,76665,'nagar'),
(7,'chinay','alisha@gmail.com',23,76665,'nagar'),
(8,'shubham','alisha@gmail.com',23,76665,'nagar'),
(9,'pradhaya','alisha@gmail.com',23,76665,'nagar')

create table Dept
(
did int primary key,
dname varchar(20)
)
--drop table dept
insert into Dept values(101,'HR'),(102,'Admin'),(103,'Development'),(104,'Testing')
,(105,'Sales'),(106,'hr'),(107,'manager') 

insert into dept values(108,'senoir')

select * from dept
select * from emp2

--add did in emp
alter table emp2 add did int

--add constraint
alter table emp2 add constraint fk_dept_emp foreign key(did) references dept(did)

--set did
update emp2 set did=101 where eid in(1,5)
update emp2 set did=102 where eid in(2,4)
update emp2 set did=103 where eid in(3)
update emp2 set did=104 where eid in(6,7)
update emp2 set did=105 where eid in(8)
update emp2 set did=107 where eid in(9)


select * from dept
select * from emp2