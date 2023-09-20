use [18sep_subQempdept]
create table dept
(
did int primary key,
dep_name varchar(20),
dlocation varchar(20)
)
insert into dept values(10,'hR','pune'),(11,'manager','nagar'),(12,'HR','senoir'),
(13,'employee','mumbai'),(14,'manager','satara')
---------------------------------------------------------------------
create table emp
(
eid int identity(1,1) ,
ename varchar(30),
salary numeric(12,2),
did int,
constraint fk_didkey foreign key(did) references dept(did)
)

insert into emp (ename,salary,did)
values
('shubham',25000,12),
('Bhakti',23000,13),
('alisha',26000,14),
('tanuja',22000,10),
('prasad',31000,11),
('sandesh',25000,12),
('payal',25000,10)

-----------------------------------------------------------------
select * from dept
select * from emp

------------------------------------------------------------------------
-- --find the max salary in employee table
select max(salary) from Emp

--subquery
-- 1.display the emp details who has max salary in emp table                     
select * from Emp where salary=(select max(salary) from Emp)

--2. display emp details who work in HR dept
select * from emp where did=
(
select did from dept where dep_name='employee' 
)

--3.display emp details who has less salary than Rahul

select * from emp where salary <
(
select salary from emp where ename='prasad'
)


--4  display the emp details who has less salary than the avg salary of all emps
select * from emp where salary<
(
select avg(salary) from emp
)

--5.display the emp from hr dept who has less salary 
--then the avg salary of employee dept
select * from emp where salary<
(
select avg(salary) from emp where did=(select did from dept where dep_name='employee')
)
and did=(select did from Dept where dep_name='senoir')


--6 display the emp details who has 2nd highest salary
select * from emp where salary=
(
select max(salary) from emp where salary<>
(
select max(salary) from emp 
)
)

--7 update the salary by 2000rs for emp who work in hr dept
update emp set salary=salary+2000 where did in
(
select did from dept where dep_name='HR'
)


--8 delete the emp who work in admin dept
delete from emp where did in
(
select did from dept where dep_name='manager'
)



