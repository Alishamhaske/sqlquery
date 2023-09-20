use innerjoin_12sep
create table user11
(
userid int not null,
username varchar(20),
city  varchar(20),
contact varchar(10),
)
--drop table user11
insert into user11(userid,username,city,contact)
values
(1,'alisha','nagar','9865432445'),
(2,'tanuja','nagar','12332445'),
(3,'payal','nagar','9865432445'),
(4,'bhakti','nagar','9865432445')

select * from user11

alter table user11 add constraint pk_user_id primary key(userid)

create table product1
(
productid int not null,
productname varchar(20),
price int,

)
--drop table product
insert into product1(productid,productname,price)
values
(1,'mobile',7665),
(2,'laptop',677),
(3,'keyboard',775),
(4,'mouse',677),
(5,'mobile',7665),
(7,'laptop',677)

select * from product1
alter table product1 add constraint pk_product_id primary key(productid)

create table order11
(
orderid int ,
quntity  int,
userid int,
productid int,
constraint fkey_us_id foreign key(userid) references user11(userid),
constraint fk_prod_id foreign key(productid) references product1(productid)
)
--drop table order11
 

insert into order11 values(1,2,1,1)
insert into order11 values(2,3,2,2)
insert into order11 values(3,4,3,3)
insert into order11 values(4,5,3,4)
insert into order11 values(5,3,3,2)
select * from user11
select * from product1
select * from order11

select * from user11 cross join product1

--
select userid,productname,price
from product1 p
inner join user11 on p.productid=user11.userid


---inner join
select o.*,u.*,p.*
from order11 o
inner join user11 u on u.userid=o.userid
inner join product1 p on p.productid=o.productid




--right join = product is right table and order is left 
select o.*,u.*,p.*
from order11 o
right join product1 p on p.productid=o.productid
right join user11 u on u.userid=o.userid

---left join
select o.*,u.*,p.*
from order11 o
left join product1 p on p.productid=o.productid
left join user11 u on u.userid=o.userid


--full join order and product
select o.*,p.*
from order11 o
full join product1 p on p.productid=o.productid



--full join order and user
select o.*,u.*
from order11 o
full join user11 u on u.userid=o.userid


--full join with product user with order
select o.*,u.*,p.*
from order11 o
full join user11 u on u.userid=o.userid
full join product1 p on p.productid=o.productid