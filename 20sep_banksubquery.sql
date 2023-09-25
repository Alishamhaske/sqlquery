use subquerycode
create table bank
(
bid int primary key,
bname varchar(20),
city varchar(20),
bstate varchar(20)

)
select * from bank
insert into bank values(10,'HDFC','nagar','maharshtra'),
(11,'kotak','nagar','hydrabad'),
(12,'baroda','pune','madhyapradesh'),
(13,'government','nashik','panjab'),
(14,'ICICI','nagar','rajstan')
insert into bank(bid,bname) values(15,'HDFC')
insert into bank(bid,bname,city) values(15,'HDFC','satara')
insert into bank(bid,city) values(15,'nagpur')



--------------------------------------------------------------

create table customer
(
cid int primary key,
bid int,

constraint fk_bid foreign key (bid) references bank(bid)
)
 insert into customer values(1,10),(2,12),(3,11),(4,13),(5,14)
 insert into customer (cid) values(6)
 select * from customer
--------------------------------------------------------------

create table account_type
(
acctype_id int primary key,
acctype varchar(20)
)

insert into account_type values(101,'debit'),(102,'credit'),(103,'debit')
insert into account_type values(106,'saving'),(107,'saving'),(108,'jandhan')
insert into account_type(acctype_id) values(105)
select * from account_type

------------------------------------------------------------
create table account
(
acc_no int primary key,
cid int,
acctype_id int,

constraint fk_cid foreign key (cid) references customer(cid),
constraint fk_acctypeid foreign key (acctype_id) references account_type(acctype_id)
)
insert into account values(51,1,101),(52,2,102),(53,3,103),(54,4,105)
insert into account(acc_no) values(55)
insert into account(acc_no,cid) values(56,4)
insert into account(acc_no,cid,acctype_id) values(58,4,106)
alter table account add  balance numeric(10)
--alter table account drop column  balance


select * from account
-------------------------------------------------------
create table Btransaction
(
tran_id int,
acc_no int,
amt numeric(10),
trans_type varchar(10),
tran_date date

constraint fk_keyaccno foreign key (acc_no) references account(acc_no)
)

insert into Btransaction values(6566,51,5652522,'debit','06/12/2022'),
(8766,52,777822,'credit','05/10/2022'),
(9866,53,878822,'debit','07/12/2022'),
(7566,51,5652522,'credit','10/12/2022')

insert into Btransaction(tran_id,acc_no,amt) values(6566,51,5652522)
insert into Btransaction(tran_id,amt) values(8566,62522)
select * from Btransaction
------------------------------------------------------------
create table cus_master
(
cid  int,
cname varchar(20),
cont numeric(10),
age int,
pan_no numeric(10)

constraint fk_keycid1 foreign key (cid) references customer(cid)
)
insert into cus_master values(1,'atul',7066818442,25,7372572),
(2,'alisha',706681662,26,7372572),
(3,'sandesh',7066818442,26,7376672),
(4,'prasad',876543442,25,7372572)


insert into cus_master(cid,cname,cont) values(1,'atul',7066818442)
insert into cus_master(cid,age) values(2,23)

select * from bank
select * from customer
select * from account_type
select * from account
select * from Btransaction
select * from cus_master
-----------------------------------------------------------
--1.Find the no of accounts in saving account
select a.acc_no ,a1.acctype
from account a
join account_type a1 on a.acctype_id=a1.acctype_id
where a1.acctype='saving'

--2. Display all bank name, cname , city from all  bank in ascending order of bankname  
--and desceding order of city name
select b.bname,b.city ,b.bid,cm.cname
from bank b
join customer c on c.bid=b.bid
join cus_master cm on cm.cid=c.cid
order by b.bname , b.city desc


--3 Find the customer who has perform maximum number of transaction
select  c.cname, count(*) as 'maximum transaction'
from cus_master c
join account a on a.cid=c.cid
join Btransaction b on b.acc_no=a.acc_no
group by c.cname 
order by 'maximum transaction' desc


-- 4.find the customers whose  balance is greater than avg balance of saving accounts.
--incorrect
select cm.cname ,avg(b.amt) as 'avg'
from cus_master cm
join account a on a.cid=cm.cid
join Btransaction b on b.acc_no=a.acc_no
join account_type a1 on a1.acctype_id=a.acctype_id
having a1.acctype='saving'



--5.	find the amount , name of customer whose acc_no is 12345 
select b.amt,cm.cname,a.acc_no
from Btransaction b
join account a on a.acc_no= b.acc_no
join cus_master cm on cm.cid=a.cid
where a.acc_no=53

--6 .display the customer name ,contact of customers whose account type is
--‘saving’ order by descending order of cname .
--incorrect
select  cm.cid, cm.cname ,cm.cont 
from cus_master cm
join account a on a.cid=cm.cid
join account_type a1 on a1.acctype_id=a.acctype_id
where a1.acctype='saving'
order by cm.cname desc

--7 display bank name , total balance of all customers in that bank of all banks in
--descending order of balance.
--incorrect
select b.bname, sum(amt)
from bank b
join customer c on c.bid=b.bid
join account a on a.cid=c.cid
join Btransaction bt on bt.acc_no=a.acc_no


--incorrect0 4,6



