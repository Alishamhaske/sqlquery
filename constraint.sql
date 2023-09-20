use practice1alter
create table student1
(
roll_no int identity(1,1) primary key ,
sname varchar(20)  ,
per numeric(5,2),
city varchar(10),
dob date,
email varchar(20) 
--constraint email unique (email)
)
drop table student1

--Not null  --unique
--Primary key    Foreign key
--Check   --Default   ---Index


--constraint with alter command
alter table student1 alter column sname varchar(20) not null
alter table student1 add constraint email  unique(email)
---alter table student1 add constraint pk_keyroll primary key(roll_no)

--remove the constraint on the column 
alter table student1 drop constraint email


insert into student1 values('alisha',77,'nagar','06/20/2001','alisha@gmail.com'),
('kiran',77,'pune','06/20/2001','alisha@gmail.com'),
('tanu',77,'nagar','06/20/2001','alisha@gmail.com')

select * from  student1

insert into student1 values('alisha',77,'nagar','06/20/2001','alisha@gmail.com',66),
('sandesh',77,'pune','06/20/2001','alisha@gmail.com',55),
('rutu',77,'nagar','06/20/2001','alisha@gmail.com',3)
---------------------------------------------------------------------
create table student2
(
stdroll int,
city varchar(20)
--constraint fk_keystdroll foreign key (stdroll) references student1(stdroll)

)
alter table student2 add constraint  fk_keystdroll foreign key (stdroll)
references student1(roll_no)  

insert into student2 values(1,'pune'),(3,'satara'),(2,'pune'),(3,'nashik')

insert into  student2(stdroll) values(3)
insert into  student2(city) values('nagar')

select * from student2

----------------------------------------------------------------
alter table student1 add age int

insert into student1 values('alisha',77,'nagar','06/20/2001','alisha@gmail.com',66),
('sandesh',77,'pune','06/20/2001','alisha@gmail.com',55),
('rutu',77,'nagar','06/20/2001','alisha@gmail.com',3)
select * from student1
---------------------------------------------------------------------------
--check
alter table student2 add constraint check_roll check(stdroll<>0)

--default
alter table student1 add school varchar(20)


-- set default school of is VACOE
alter table student1 add constraint de_school default 'VACOE' for school


-- to remove the constraint
alter table student1 drop constraint de_school
alter table student1 drop column school
select * from student1

