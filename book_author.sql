-----------1. author table
use book_author

create table author
(
a_id int ,
a_name varchar(30),
ph_no varchar(10),
a_email varchar(30) unique ,
a_city varchar(20) 
constraint au_id primary key(a_id)
)
--drop table author
select * from author

-----------------------------------------------------------------------------------------------------------------------------
--- 2. book table

create table book
(
b_id int ,
bname varchar(20) not null,
a_id int,
constraint book_id primary key(b_id),
constraint fk_book_id foreign key (a_id) references author(a_id),
price numeric(10,2) 

)
--alter table book drop constraint fk_book_id
--drop table book
select * from book


----------------------------------------------------------------------------------------------------------------------------

--3.awardmaster  tabel

create table award_master
(
aw_type_id int primary key,
aw_name varchar(20) unique,
a_price int


)

--drop award_master

---------------------------------------------------------------------------------------------------------------------------


create table  award
(
aw_id int ,
aw_type_id  int,
a_id int,
b_id int ,
constraint bo_id foreign key(b_id) references book(b_id),
constraint aw_type_id foreign key(aw_type_id) references award_master(aw_type_id),
constraint award_id foreign key (a_id) references author(a_id),
yr int
)
--drop table award

