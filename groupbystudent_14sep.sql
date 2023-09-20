use groupby_14sep
create table student
(
s_id int,
sname varchar(20),
cname varchar(20),
fees numeric(10,2)
)
insert into student values(1,'tanuja','csharp',65566)
insert into student 
values
(2,'tanu','java',656),
(3,'alisha','.net',656),
(4,'sandesh','python',656),
(5,'payal','csharp',656)

select * from student
---student table
--1 display count of student in each course
select cname ,count(sname) as 'count'from student group by cname

--2 display count of student for c sharp course 
select cname ,count(s_id) as 'count'from student 
where cname='csharp'
group by cname

--3 display course and count but count is of stud>10
select cname ,count(s_id) as 'count'from student 
group by cname
having count(s_id)>1

--4 sum of fees each course
select cname , sum(fees) as 'sum'from student 
group by cname

--5 display count of std in each course ,std count less than 15 and display in desc
select cname,count(s_id) as 'count' from student
group by cname
having count(s_id)<15
order by  count(s_id)desc
