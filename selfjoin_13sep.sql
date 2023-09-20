use crossjoin_13sep
create table emp3
(
eid int,
ename varchar(20),
salary numeric(10,2),
managerid int

)

insert into emp3(eid,ename,salary,managerid)
values
(1,'alisha',77766,3),
(2,'rutu',7666,2),
(3,'tanu',777662,2),
(4,'tanuja',8271,3),
(5,'arti',78282,1),
(6,'bhakti',92886,7),
(7,'payal',9087,3),
(8,'prasad',9087,10),
(9,'chinmay',9087,6),
(10,'andesh',9087,7)


--self join

--compare high less salary
select e1.ename as 'high salary ' ,e1.salary,e2.ename as 'less salary' ,e2.salary
from emp3 e1,emp3 e2
where e1.salary>e2.salary

-------------------
--display emp name and  its manager nmae
select e1.ename 'employee', e2.ename as 'manager'
from emp3 e1,emp3 e2
where e1.managerid=e2.eid