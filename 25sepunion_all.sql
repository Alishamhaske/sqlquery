use [25sepunion_all]
--unoin and unoin all
create table customer
(
id int,
name varchar(20),
city varchar(20),
state_name varchar(20)
)
insert into customer values(11,'kiran','nagar','MH'),
(12,'sandesh','pune','MP'),
(13,'sakshi','satara','UP'),
(14,'payl','nagpur','panjb'),
(15,'alisha','nagar','jammu')

create table suplier
(
id int,
name varchar(20),
city varchar(20),
state_name varchar(20)
)
insert into suplier values(12,'tanuja','nagar','MH'),
(3,'atul','pune','MP'),
(4,'riya','satara','UP'),
(5,'bhakti','nagpur','panjb'),
(16,'alisha','nagar','jammu')
insert into customer values(11,'kiran','nagar','MH')

select * from customer
select * from suplier

select * from customer
union 
select * from suplier

select * from customer
union  all
select * from suplier

create table emp
(
id int,
name varchar(20),
city varchar(20),
state_name varchar(20)
)

insert into emp select * from customer

select * from emp