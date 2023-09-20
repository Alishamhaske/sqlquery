use sqlhomework
create table country
(
cid int primary key,
cname varchar(20)
)
insert into  country values(1,'india'),(2,'pakistan'),(3,'us')
insert into country(cid) values(4),(5)

select * from country
--------------------------------------------------------------------------------------
create table state1
(
sid1 int primary key,
sname varchar(20),
cid int,
constraint fk_key_cid foreign key (cid) references country(cid)
)
insert into  state1 values(1,'maharashtra',3),(2,'goa',2),(3,'rajstan',2)
--cid null
insert into state1(sid1,sname) values(4,'maharashtra'),(5,'panjab')


select * from state1

--------------------------------------------------------------------------------------------------
create table city
(
cityid int,
cityname varchar(20),
sid1 int,
constraint fk_key_sid1 foreign key(sid1) references state1(sid1)
)

insert into city(cityid,cityname,sid1) values(1,'nagar',2),(2,'pune',3)
insert into city(cityid,cityname) values(1,'nagpur'),(2,'satara')
select * from city

--1. find the country who state is maharshtra
select cname from country c join state1 s on c.cid=s.cid  where sname='maharashtra'
--other way
select cname from country where cid=(select cid from state1 where sname='maharashtra')

--2.find the country id , country name who state maharashtra and citi pune
select c.cid,c.cname from country c
inner join state1 s on c.cid=s.cid 
inner join city ct on ct.sid1=s.sid1 
where s.sname='maharashtra' and ct.cityname='pune'

--3.find the state for country us
select s.sname from state1 s 
inner join country c on s.cid=c.cid
where c.cname='us'


--4.find the city  name from the country india
select c.cityname from city c
inner join state1 s on c.sid1=s.sid1 
inner join country c1 on c1.cid=s.cid 
where  c1.cname='india'

--5.find state name who city nmae pune
select s.sname from state1 s 
inner join city c on c.sid1=s.sid1
where c.cityname='pune'

---6 find statename who sid =3
select sname from state1 where sid1=3

select * from country
select * from state1
select * from city

--7 find state nmae who cid is 3 
select s.sname from state1 s
inner join country c on c.cid=s.cid
where c.cid=3



--8 find state nmae who  city name is nagar
select s.sname from state1 s
inner join city c on c.sid1=s.sid1
where c.cityname='nagar'

--9 find state nmae who country id is 3 and city name is nagar 
select s.sname from state1 s
inner join country c on c.cid=s.cid
inner join city c1 on c1.sid1=s.sid1
where c.cid=2 and c1.cityname='nagar'