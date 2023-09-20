---check- check is used to apply certain condition ,
use DPtitan

create table bank
(
ac_no int,
name varchar(30) not null,
email varchar(30) unique,
balance int,
--branch varchar(20) default('pune'),
constraint ac_num primary key(ac_no),
constraint bal check (balance >0)

)
--add age column 
alter table bank add emp_age int
--applay check constraint
alter table bank add constraint age check (emp_age>18)
alter table bank drop constraint age

alter table bank add branch varchar(20) 
alter table bank add constraint ac_branch default 'pune' for branch
--drop branch constraint
alter table bank drop constraint ac_branch
--drop  branch column
alter table bank drop column branch


exec sp_help bank

--cluster index
create unique index in_bank on bank(email)


--non cluster index
create index in_bank1 on bank(balance)

exec sp_help bank


--truncate = remove record
--truncate table bank


--drop = remove table
--drop table bank