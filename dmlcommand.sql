
use Dptitan1
create table employee11
(
id int unique,
ename varchar(20) not null,
email varchar(25) unique,
salary numeric(12,2),
age int check(age>=18),
phone_no numeric not null

)
  --drop table employee11
select * from employee11

insert into employee11 values(1,'alisha','aaa@gmail.com',7665675.443,44,8765589998)
insert into employee11 values(2,'tanu','tanu@gmail.com',66632.33, 52,873927362)
insert into employee11 values(3,'arti','bhhhs22@gmail.com',76357632.33, 22,873927362)
insert into employee11 values(4,'prasad','ddsnu@gmail.com',76357632.33, 42,873927362)
insert into employee11 values(5,'chinu','hhhh@gmail.com',76357632.33, 62,873927362)
insert into employee11 values(6,'aboli','abli@gmail.com',76357632.33, 22,873927362)
insert into employee11 values(7,'shakil','shakil@gmail.com',76357632.33, 22,873927362)
insert into employee11 values(8,'bhakti','bhakti@gmail.com',76357632.33, 62,873927362)
insert into employee11 values(9,'muskan','muskan@gmail.com',76357632.33, 62,873927362)
insert into employee11 values(10,'prandhnya','pra@gmail.com',76357632.33, 72,873927362)
insert into employee11 values(11,'rutuja','rutu@gmail.com',76357632.33, 82,73927362)
insert into employee11 values(12,'pooja','pooja@gmail.com',76357632.33, 44,873927362)
insert into employee11 values(13,'tanu','tanu1@gmail.com',76357632.33, 72,873927362)
insert into employee11 values(14,'tanu','tanu56@gmail.com',76357632.33, 82,873927362)
insert into employee11 values(15,'tanu','tanu88@gmail.com',76357632.33, 92,873927362)




