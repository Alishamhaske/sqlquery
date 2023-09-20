use innearjoin_13sep
create table dept
(
did int primary key,
dname varchar(20),
dlocation varchar(20) 
)

insert into dept(did,dname,dlocation)
values
(1,'A','nagar'),
(2,'B','nagar'),
(3,'C','nagar'),
(4,'D','nagar'),
(5,'E','nagar'),
(6,'F','nagar'),
(7,'G','nagar')

select * from dept
--drop table dept
---------------------------------------------------------------------------
create table empt
(
eid int,
ename varchar(20),
salary numeric(10,2),
did int
constraint fk_didkey foreign key (did) references dept (did)
)
--drop table emp

insert into empt(eid,ename,salary,did)
values
(1,'alisha',77766,2),
(2,'rutu',77766,3),
(3,'tanu',77766,2),
(4,'tanuja',77766,1),
(5,'arti',77766,2),
(6,'bhakti',77766,6),
(7,'payal',77766,5),
(8,'pradhnya',77766,1),
(9,'alisha',77766,4),
(10,'alisha',77766,3)
insert into empt(eid,ename,salary) values(11,'sakshi',5677)
insert into empt(eid,ename,salary) values(12,'shubham',567)
--insert into emp values(22,'dfdf',77),(66,'hhggh',787)

select* from empt

---cross join

select * from dept cross join empt 

--inner join
select * from empt inner join dept 
on empt.did=dept.did


--left join
--emp is left table
select * from empt left join dept 
on empt.did=dept.did


--left join
--dept is left table
select * from dept left join empt
on dept.did=empt.did

--subquery
--1.find the deptnmae for the emp name
select dname from dept where did=(select did from empt where ename ='tanuja')

--2.find  the emp name ,dept nmae from employee
select   d.dname,ename from empt  e join dept d on e.did=d.did where e.ename='alisha'
--select   d.dname,d.did ,ename,e.did from emp  e join dept d on e.did=d.did where e.ename='alisha'

---3.find the employee who is working in 'B' dept
select ename,did  from empt where did=(select did from dept where dname='B' )

--4.find out the emp salary who is working in dept  'c'
select salary,ename from empt where  did=(select did from dept where dname='c')
--other way
select d.dname,ename,salary from empt e join dept d on e.did=d.did where dname='c'


--5.find out emp name, emp salary  who is not working in dept B
select ename, salary from empt e ,dept d where   e.did=d.did and dname<>'B'
--other way
select salary,ename from empt where not did=(select did from dept where dname='B')

--6 find the employee from  dept id is null 
select e.ename from empt e left join
dept d on e.did=d.did
where d.dname is null






--6.find highest salary from employee
select top 1 salary from empt order by salary desc

--select query
select *  from  emp;
select 10+20-2 as rescult;
--change column name
select ename as empname from emp
select ename as ename from emp



--select name from sys.databases
--select name from sys.tables