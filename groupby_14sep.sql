use groupby_14sep
create table emp2
(
eid int  ,
ename varchar(30),
salary numeric(12,2),
dept_name varchar(20),
dept_id int,
age int,
)

--drop table emp2
insert into emp2 (eid,ename,salary,dept_name,dept_id,Age)
values
(1,'alisha',90990,'manager',101,23),
(2,'tanu',33990,'Hr',102,13),
(3,'alisha',4090,'A',103,33),
(4,'sandesh',87990,'A',104,33),
(5,'prasad',9390,'manager',103,33),
(6,'chinmay',90990,'manager',102,33),
(7,'alisha',90660,'manager',101,33),
(8,'alisha',90990,'hr',103,33)



select * from emp2

select dept_id ,sum(salary) from emp2
group by dept_id

-- create summary of dept & based on that display the count of emp in each dept


-- summary of dept
select eid,dept_id from emp2

----count emp of each dept
select dept_id,count(eid)as 'count' from  emp2 
group by dept_id
