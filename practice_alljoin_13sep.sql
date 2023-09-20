use innerjoin_12sep
create table usertable
(
userid int primary key,
username  varchar(20),
city varchar(20)

)


insert into usertable(userid,username,city)
values
(1,'tanuja','nagar'),
(2,'alisha','pune'),
(3,'payal','kolhapur')
insert into usertable(userid,username) values(5,'sandesh')
select * from usertable

create table producttable
(
pid int primary key,
pname varchar(20),
price numeric(10,2)
)

insert into producttable(pid,pname,price)
values
(2,'mobile',6765),
(3,'laptop',8643),
(4,'keyboard',7763)

insert into producttable(pid,pname) values(5,'tab')

select * from producttable

create table ordertable
(
oid int,
qunity int,
userid int,
pid int,
constraint fk_usidkey foreign key (userid) references usertable(userid),
constraint fk_proidkey foreign key (pid) references producttable(pid)
)
--drop table ordertable 

insert into ordertable(oid,qunity,userid,pid) values(1,2,3,3)

insert into ordertable values(3,4,3,3)
insert into ordertable values(4,5,3,4)
insert into ordertable values(5,3,3,2)
insert into ordertable(oid,qunity) values(3,4)
insert into ordertable(oid,qunity) values(2,1)

select * from usertable
select * from producttable
select * from ordertable

--innear join
select o.*,p.*,u.*
from ordertable o
inner join producttable p on p.pid=o.pid
inner join usertable u on u.userid=o.userid

--innear join only product and order
select o.*,p.*
from ordertable o
inner join producttable p on p.pid=o.pid


--innear join only user and order
select o.*,u.*
from ordertable o
inner join usertable u on u.userid=o.userid


---left join for order is left and user is right
--display all record for order and only match data for  user
select o.*,u.*
from ordertable o
left join usertable u on u.userid=o.userid

---left join for order is left and product is right
--display all record for order and only match data for  product
select o.*,p.*
from ordertable o
left join producttable p on p.pid=o.pid

--left join
select o.*,p.*,u.*
from ordertable o
left join producttable p on p.pid=o.pid
left join usertable u on u.userid=o.userid

--right join
--right table is product .display all record for product and match data for order
select o.*,p.*
from ordertable o
right join producttable p on p.pid=o.pid


--right join
--right table is user .display all record for user and match data for order
select o.*,u.*
from ordertable o
right join usertable u on u.userid=o.userid

--right join
select o.*,u.*,p.*
from ordertable o
right join usertable u on u.userid=o.userid
right join producttable p on p.pid=o.pid

--full join
--display all data
select o.*,u.*,p.*
from ordertable o
full join usertable u on u.userid=o.userid
full join producttable p on p.pid=o.pid

---group by
--find total number of order by each user
select userid , count(oid) 
from ordertable
group by userid


select userid, count(oid)
from ordertable
group by userid
having count(oid)>5