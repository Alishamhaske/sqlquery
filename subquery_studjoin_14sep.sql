use sqlhomework
create table stud
(
s_id int primary key,
sname varchar(20),
scity varchar(20)
)
--drop table stud
select* from stud
insert into stud values(1,'alisha','pune'),(2,'tanu','nagar'),(3,'sandesh','nagar')
---------------------------------------------------------------------------
create table subject1 
(
subid int ,
subname varchar(20),
maxmark int,
passmark int
constraint pk_subid primary key(subid) 

)
insert into subject1 values(1,'python',80,40),(3,'java',89,34),(2,'csharp',90,40)
insert into subject1(subid,subname,maxmark) values(5,'html','90')
select* from subject1
-----------------------------------------------------------------------------------------



create table exam
(
s_id int,
subid int,
marks int,
constraint fk_s_id foreign key(s_id) references stud(s_id),
constraint fk_subid foreign key(subid) references subject1(subid)
)

insert into exam values(2,3,90)
insert into exam(s_id,subid,marks) values(2,2,90)
insert into exam(s_id,subid) values(1,2)
insert into exam(s_id,marks) values(3,82)


select* from exam


--------------------------------------------------------
select * from stud
select * from subject1
select * from exam

------------------------------------------------------------
--inner join 
select s.*,su.*,e.*
from exam e
inner join stud s on s.s_id=e.s_id  
inner join subject1 su on su.subid=e.subid

--------left join

select s.*,su.*,e.*
from exam e
left join stud s on s.s_id=e.s_id
left join subject1 su on su.subid=e.subid

---right join
select s.*,su.*,e.*
from exam e
right join stud s on s.s_id=e.s_id
right join subject1 su on su.subid=e.subid

--cross
select * from stud cross join subject1 cross join exam

--full join
select s.*,su.*,e.*
from exam e
full join stud s on s.s_id =e.s_id
full join subject1 su on su.subid=su.subid
---------------query-----------------------
--1 insert a new student(sid=5,name=ramesh,city=hyderabad) 
insert into stud values(5,'ramesh','hyderabad')
select * from stud

--2  change city of sid=3 to sanngli
update stud set scity='sangli' where s_id=3 

--3. return list of all student with column sid,name and city --2 ways
select s.s_id,s.sname,s.scity from stud s
select * from stud


---4 return the conating column sid,name,sub name,marks,maxmark,passmark

select e.marks,su.maxmark,su.passmark,s.s_id,s.sname,s.scity
from exam e
inner join stud s on s.s_id=e.s_id
inner join subject1 su on su.subid=e.subid



----------------------------------------------
--group by
--1.find sum of mark student
select s_id ,sum(marks) from exam
group by s_id

--2.find avg of mark  stufent
select s_id ,avg(marks) as 'total' from exam
group by s_id


