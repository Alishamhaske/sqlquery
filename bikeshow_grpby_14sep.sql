use bikeshow_grpby_14sep
create table model
(
m_id int primary key,
m_name varchar(20),
mcost numeric(10,2)
)
insert into model values(1,'bmw',98000),(2,'mercedes',8999888),(3,'ktm',877876),
(4,'thar',787676),(5,'swift',767678)

select * from model
----------------------------------------------------------------------
--Customer	Cust_id,first_name,last_name ,mobile_no,gender,email
create table customer
(
c_id int primary key,
f_cname varchar(20),
l_cname varchar(20),
m_no varchar(10),
gender varchar(10),
email varchar(10)
)
alter table customer alter column email varchar(20)
--drop table customer

insert into customer values(101,'chinmay','sable',87976555,'male','chinu@gmail.com'),
(102,'prasad','cheke',876543278,'male','prasad@gmail.com'),
(103,'shakil','shaikh',7896789654,'male','shakil@gmail.com'),
(104,'sandesh','kshirsagar',66789654,'male','sandesh@gmail.com'),
(105,'tanu','gaygoye',7896789654,'female','tanu@gmail.com')

select * from customer
--------------------------------------------------------------------------
--Payment_mode	Payment_id,payment_type(11-online,22-cash,33-cheque)
create table payment
(
pay_id int primary key,
pay_type varchar(20),

)
insert into payment values(202,'online'),(203,'cash'),(204,'cheque'),(205,'online'),(206,'cash')
select * from payment
-------------------------------------------------------------------------
create table feed_rate
(
rate_id int primary key,
rating varchar(20)
)
---excellent,4-good,3-average,2-bad,1-complaint
insert into feed_rate values(401,'excellent'),(402,'good'),(403,'average'),(404,'bad'),(405,'complaint')
select * from feed_rate
insert into feed_rate(rate_id) values(406)

-------------------------------------------------------------------------
select * from model
select * from customer
select * from payment
select * from feed_rate

create table purchase
(
pur_id int,
c_id int,
m_id int,
booking_amount numeric,
pay_id int,
pur_date date,
rate_id int,

constraint fk_m_idkey foreign key (m_id) references model(m_id),
constraint fk_c_idkey foreign key(c_id) references customer(c_id),
constraint fk_pay_idkey foreign key(pay_id) references payment(pay_id),
constraint fk_rate_idkey foreign key(rate_id) references  feed_rate(rate_id)
)
insert into purchase values(1,102,2,98077,202,'06/20/2001',401),
(2,103,3,68077,203,'11/22/2002',402),
(3,104,4,88077,204,'08/05/2003',403),
(4,103,5,98077,203,'02/03/2004',404),
(5,102,2,28077,202,'10/12/2002',402)

insert into purchase(pur_id,c_id,m_id,booking_amount,pay_id,pur_date)
values(1,102,2,98077,202,'06/20/2001')


---------------------------------------------------------------------

select * from model
select * from customer
select * from payment
select * from feed_rate
select * from purchase
--Model= 	Model_id ,model_name,cost
--Customer=	Cust_id,first_name,last_name ,mobile_no,gender,email
--Purchase=	Purchase_id,cust_id,model_id,booking_amount,payment_id,purchase_date,rating_id
--Payment_mode=	Payment_id,payment_type(11-online,22-cash,33-cheque)
--Feedback_rating=	Rating_id,rating(5-excellent,4-good,3-average,2-bad,1-complaint)

---------------------------------------------------------------------------------
--1.	WAQ to get the balance amount for customers who made cash payment 
select   (m.mcost-p1.booking_amount)   count (*)  from model m 
 join purchase p1 on p1.m_id=m.m_id
 join customer c on c.c_id = p1.c_id
 join payment p on p.pay_id=p1.pay_id
where p.pay_type='cash'






--2.	Delete all the records of customer who have paid complete amount as that of bike cost.


--3 	Create an index to have faster retrival of data on the basis of booking_amount.

--4.	WAQ to change payment mode to cash for ‘activa5g’ purchased by
--customer with id 11. 
select p.pay_type from payment p
inner join purchase p1  on p1.pay_id=p.pay_id
inner join customer c on c.c_id=p1.c_id
update payment set pay_type='activa5g' 
where pay_type='cash' 


--5 	Map where key is modelName and value is arraylist of ids of
--customers who purchased that model.



--6 	Create a stored procedure to get the full name of customer
--whose cust_id is provided as input.



--7.	WAQ to get the number of complaints registered for model activa 5G.

--8.	WAQ to get all customer names who haven’t given ratings yet. 
select c.c_id,c.f_cname from customer c
join purchase p on p.c_id=c.c_id
where p.rate_id is null

select * from purchase




--9.	Delete all complaint records from purchase. 

--10.	Update ratings given by Mr Vaibhav from good to excellent.
--11.	Reduce cost of all bikes for which rating is bad by 10%. 
--12.	Write a to display highest selling model along with name and count 


