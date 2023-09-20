use alljoin_13sep
create table dept1
(
did int primary key,
dname varchar(20),
dlocation varchar(20) 
)

insert into dept1(did,dname,dlocation)
values
(1,'A','nagar'),
(2,'B','nagar'),
(3,'C','nagar'),
(4,'D','nagar'),
(5,'E','nagar'),
(6,'F','nagar'),
(7,'G','nagar')

--Add one dept extra in dept table do not add emp against it
insert into dept1(did,dname,dlocation) values (10,'sales','pune')
select * from dept1
--drop table dept
-----------------------------------------------------------------------------------------------
create table emp1
(
eid int,
ename varchar(20),
salary numeric(10,2),
did int,
constraint fk_key_did_emp foreign key(did) references dept1(did)

)


insert into emp1(eid,ename,salary,did)
values
(1,'alisha',77766,2),
(2,'rutu',77766,3),
(3,'tanu',77766,2),
(4,'tanuja',77766,1),
(5,'arti',77766,2),
(6,'bhakti',77766,6),
(7,'payal',77766,5)
--Add  emp without did
insert into emp1(eid,ename,salary) values(11,'sakshi',5677)
insert into emp1(eid,ename,salary) values(12,'shubham',567)
select * from emp1

-----------------
--cross join'
select * from dept1 cross join emp1

----full join
select d.did,d.dlocation,d.dname,e.did,e.did,e.ename,e.salary
from dept1 d
full join emp1 e on e.did=d.did

--full join =display all record
select *
from emp1 e full join dept1 d on e.did=d.did

---innear join
select *
from emp1 e inner join dept1 d  on e.did=d.did

--left join
--left join=left table is emp and right is dept
select d.did,d.dlocation,d.dname,e.did,e.ename,e.salary
from dept1 d
left join emp1 e on e.did=d.did



-----right join=right table is emp and right is dept
select d.did,d.dlocation,d.dname,e.did,e.ename,e.salary
from dept1 d
right join emp1 e on e.did=d.did


---simple way
--left
select *
from emp1 e left join dept1 d  on e.did=d.did
--right
select *
from emp1 e right join dept1 d  on e.did=d.did
