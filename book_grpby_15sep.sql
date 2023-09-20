use groupby_14sep
-----------1. author table


create table author1
(
a_id int ,
a_name varchar(30),
ph_no varchar(10),
a_email varchar(30) unique ,
a_city varchar(20) 
constraint au_id primary key(a_id)
)
--drop table author
select * from author1
insert into author1 values(101,'r.s.mehta',98765432,'mehta@gmail.com','pune')
insert into author1 values(102,'s.more',944532,'more@gmail.com','pune')
insert into author1 values(103,'A.despande',55565432,'despande@gmail.com','pune')
insert into author1 values(104,'dr.kumar',98765432,'kumar@gmail.com','pune')

insert into author1(a_id,a_name,ph_no) values(105,'r.prasad',8998765432)

----------------------------------------------------------------------------------------------------------------------------

--2.awardmaster  tabel

create table award_master1
(
aw_type_id int primary key,
aw_name varchar(20) unique,
a_price int


)

select * from award_master1
--drop award_master

insert into award_master1 values(222,'Dashing',8000)

insert into award_master1 values(223,'Valuable',9000)

insert into award_master1 values(224,'perfect',9000)
insert into award_master1(aw_type_id,aw_name) values(225,'perfect')


-----------------------------------------------------------------------------------------------------------------------------
--- 3. book table

create table book1
(
b_id int ,
bname varchar(20) not null,
a_id int,
price numeric(10,2) 
constraint book_id primary key(b_id),
constraint fk_book_id foreign key (a_id) references author1(a_id),


)
--alter table book drop constraint fk_book_id
--drop table book
select * from book1
insert into book1 values(1,'python',102,8000)
insert into book1 values(2,'java',103,9000)
insert into book1 values(3,'dbms',102,8000)
insert into book1 values(4,'csharp',104,8000)
insert into book1(b_id,bname,a_id) values(5,'csharp',104)
insert into book1(b_id,bname) values(6,'java')
---------------------------------------------------------------------------------------------------------------------------


create table  award1
(
aw_id int ,
aw_type_id  int,
a_id int,
b_id int ,
yr int
constraint aw_type_id foreign key(aw_type_id) references award_master1(aw_type_id),
constraint award_id foreign key (a_id) references author1(a_id),
constraint bo_id foreign key(b_id) references book1(b_id),

)
insert into award1 values(90,222,101,2,4)
insert into award1 values(91,223,101,4,5)
insert into award1 values(92,224,102,3,6)
insert into award1 values(93,222,103,2,5)
insert into award1 values(94,223,104,5,2)
insert into award1(aw_id,aw_type_id,a_id) values(92,224,101)
insert into award1(aw_type_id,a_id) values(224,104)

select * from award1
--drop table award

---inner join
select au.*,awm.*,b.*,aw.*
from award1 aw
inner join award_master1 awm on awm.aw_type_id=aw.aw_type_id
inner join author1 au on au.a_id=aw.a_id
inner join book1 b on b.b_id=aw.b_id

select * from author1
select * from award_master1
select * from book1
select * from award1

-----query
--1.select the book which is written by s.more
select bname from book1 b 
inner join author1 a on b.a_id=a.a_id
where a.a_name='s.more'

--2.find the author name for book 'java'
select a_name from author1 a 
inner join book1 b on a.a_id=b.a_id
where b.bname='java'

--3 find author name who got on awrd yr in 4
select a_name from author1 a 
 join award1 aw on a.a_id=aw.a_id
where aw.yr=4

--4 find the book got an awrad
select bname  from book1 b
inner join award1 a on a.b_id=b.b_id
--
--5 find out the author wise book count
select a_name ,count(b_id) as 'count'
from author1 a
inner join book1 b on a.a_id=b.a_id 
group by a.a_name


--6 find the author name who got only one award
select a_name, count(aw_id) as 'author name'
from author1 a 
inner join award1 a1 on a1.a_id=a.a_id
group by a_name
having count(aw_id)=1

--7 find the author name who got perfect award
select a_name 
from author1 a 
inner join award1 aw on a.a_id= aw.a_id
inner join award_master1 awm on awm.aw_type_id=aw.aw_type_id
where awm.aw_name='PERFECT'
group by a_name



--8 FIND THE AUTHOR who got awrdprice more than 8000
select a_name
from author1 a
inner join award1 aw on aw.a_id=a.a_id
inner join award_master1 am on am.aw_type_id=aw.aw_type_id
where am.a_price>8000
--group by a_name

--9 find the author who got maximum award
select  a_name , count(aw_id) as 'max award'
from author1 a
inner join award1 aw  on aw.a_id=a.a_id
group by a_name
order by count(aw_id) desc
offset 0 rows
fetch next 1 row only

--other way
select  top 1 a_name ,count(aw_id) as 'max award'
from author1 a
inner join award1 aw  on aw.a_id=a.a_id
group by a_name
order by count(aw_id) desc




