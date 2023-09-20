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
select s.s_id,s.sname,s.scity ,e.marks,s1.maxmark,s1.passmark from stud s,subject1 s1, exam e
--other way




----------------------------------------------
--group by
--1.find sum of mark
select s_id ,sum(marks) from exam
group by s_id

--2.find avg of mark 
select s_id ,avg(marks) as 'total' from exam
group by s_id


