create table emp4
(
empid int,
ename varchar(20),
did int,
dname varchar(20),
mid int

)
--drop table emp4
insert into emp4 values(1,'alisha',22,'hr',2)
insert into emp4 values(2,'tanuja',23,'hr',3)

insert into emp4
values
(3,'sandesh',12,'manager',3),
(4,'sakshi',12,'hr',3)

insert into emp4(empid,ename,did,dname)values (5,'alisha',23,'hr')

insert into emp4(empid,ename,did)values (5,'alisha',23)

insert into emp4(empid,did,dname)values (5,23,'manager')

select * from emp4
--find total count of emp each dept
select did,count(empid)
from emp4
group by did

select * from emp4
--find count mid from each dept
select did,count(mid)
from emp4
group by did 

select * from emp4
--find sum mid from each dept
select did,sum(mid)
from emp4
group by did