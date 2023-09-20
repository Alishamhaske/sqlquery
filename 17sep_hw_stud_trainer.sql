use [17sep_homework]
create table trainer
(
trainerid int primary key,
trainername varchar(20),
joindate date,
email varchar(20),
experienceyr int,
)
insert into trainer values(1, 'tanuja', '07/16/2003', 'tanu@gmail.com', 10),
(2, 'rutuja', '01/17/2001', 'rutu@gmail.com', 12),
(3, 'alisha', '06/20/2001', 'alisha@gmail.com', 08),
(4, 'pooja', '08/06/2005','pooja@gmail.com', 09), 
(5, 'prasad', '09/05/2001', 'prasad@gmail.com', 05)

select *from trainer

create table course
(
courseid int primary key,
coursename varchar(20),
duration int,
trainerid int,
totalfees int,
constraint tid_fk foreign key(trainerid) references trainer(trainerid),
)

insert into course values(11, 'c#', 6, 2, 2000), 
(12, 'c++', 7, 1, 3000),
(13, 'java', 4, 5, 4000),
(14, 'c', 8, 3, 2500),
(15, '.net', 9, 5, 6000)
select *from course

create table student
(
rollno int,
sname varchar(20),
degree varchar(20),
bithdate date,
courseid int,
batchid int,
feespaid int,
remark varchar(20),
isplaced varchar(20),
constraint ci_fk foreign key(courseid) references course(courseid),
)

select * from trainer
select * from course
select *from student


insert into student values(51, 'alisha', 'BE', '07/06/2001', 11, 92, 1000, 'A++','yes'),
(52, 'muskan', 'Btech', '09/22/2002', 12, 93, 2000, 'A', 'no'), 
(53, 'tanuja', 'BA', '04/03/2001', 13, 94, 3000, 'B', 'yes'),
(54, 'payal', 'BE', '04/13/2000', 13, 95, 1500, 'B++', 'no'),
(55, 'sandesh', 'BSC', '04/23/1999', 12, 95, 3500, 'C', 'yes')

insert into student values(51, 'alisha', 'BE', '07/06/2001', 11, 92, 1000, 'A++','yes'),
(53, 'muskan', 'BE', '09/22/2002', 12, 93, 2000, 'A', 'no')


--1.Show list of students. List contains roll no , student name , course name ,
--trainer name in order of course name and student name

select s.rollno, s.sname, c.coursename, t.trainername
from student s 
inner join course c on c.courseid = s.courseid
inner join trainer t on t.trainerid = c.trainerid
order by coursename, sname

--2 Show list of students who have pending fees more than 1000rs . List should have student name ,
--course name , balance fees . Show this list in descending order of balance fees.
select s.sname, c.coursename, c.totalfees, s.feespaid, 
(totalfees - feespaid) as 'remaining fee'
from course c
inner join student s on s.courseid = c.courseid
where (totalfees - feespaid) >1000
order by [remaining fee] desc

--3 . Append letter ‘_spl’ to all batch ids of trainer ‘tanuja’.


--4.Update table student. Update ‘remark’ field. 
--Remark should be ‘Eligible for exam’ if fees paid 
--by student is more than 60%.
update student set remark ='eligible' where feespaid> any
(select totalfees-0.6 from course)

--5. Create a index to make retrieval faster based on course name.
create index a_index on course(coursename)

--6. List name of course for which more than 20 students are enrolled
select coursename from course c
join student s on s.courseid=c.courseid
group by c.coursename
having count(s.courseid)>=2


--7. List name of course for which maximum revenue was generated. ( max fee collection)
select top 1 with ties c.coursename ,sum(s.feespaid) as 'total' from course c
join student s on s.courseid=s.courseid
group by c.coursename
order by total desc




--8. Select name of student who are in same batch as ‘muskan’




--9. Delete all students who are in course which is less than 5 months duration.
delete from  student
where courseid=
(
select courseid from course where duration <5
)

--10. Delete all students for whom is placed is ‘yes’ and 
--who have paid all the fees of their course.
delete from student where isplaced = 'yes'
select *from student

delete from student


--14. Show names of students who have paid all the fees. 
select s.sname from student s
join course c on c.courseid=s.courseid
where (c.totalfees-s.feespaid)=0