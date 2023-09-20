
use Dptitan
create table  dept
(
did int not null,
d_name varchar(10)
constraint pk_dept primary key(did)

)
--alter table dept add constraint id primary key(did)
----------------
create table emp
(
id int,
name varchar(20),
did int

constraint pkemp primary key (id),
constraint fk_emp_did foreign key (did) references dept(did)

)
alter table emp add emp_salary int
alter table emp add emp_phone int
alter table emp add constraint phone unique (emp_phone)

exec sp_help emp






---check- check is used to apply certain condition ,

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