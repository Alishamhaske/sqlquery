use [21sep_view]


create table dept
(
did int primary key,
dep_name varchar(20),
dlocation varchar(20)
)
insert into dept values(10,'hR','pune'),(11,'manager','nagar'),(12,'HR','senoir'),
(13,'employee','mumbai'),(14,'manager','satara')
----------------------------------------
create table emp1
(
eid int identity(1,1) ,
ename varchar(30),
salary numeric(12,2),
did int,
constraint fk_didkey foreign key(did) references dept(did)
)
--drop table emp

insert into emp1 (ename,salary,did)
values
('shubham',25000,12),
('Bhakti',23000,13),
('alisha',26000,14),
('tanuja',22000,10),
('prasad',31000,11),
('sandesh',25000,12),
('payal',25000,10)


--adding new views
create view employee_view as
select * from emp1

--fetch
select * from employee_view

create view emp_from1_view as
select eid,ename,did from emp1 where did=(select did from dept 
where dep_name='hr' )

--modify
alter view emp_from1_view as
select eid,ename,did from emp1 where did=
(select did from dept   d where dep_name ='manager')


 --drop
 --drop view employee_view

-- order by , group by, having not allowed in the view




--