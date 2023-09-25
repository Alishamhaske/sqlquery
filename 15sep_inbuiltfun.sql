use DP

create table employee1
(
eid int,
ename varchar(20),
did int,
email varchar(20)
)
insert into employee1 values(1,'tanu',33,'dhgsys@gmail.com'),
(2,'tanuja',33,'jsj3@gmail.com'),
(3,'alisha',33,'alisha2@gmail.com')
insert into employee1 values(4,'rutu',36,'ali@gmail.com','10/23/2022')
insert into employee1 values(5,'payal',37,'ali@gmail.com','06/13/2021')


select * from employee1
alter table employee1 add BOD date
--len
select ename, len(ename)as'length' from employee1

--uppear to lower
select UPPER(ename) as 'emp name ' ,lower(ename) as 'lower case' from employee1

--substring
select SUBSTRING(email,0,5) as 'substring' from employee1

--trim=remove spaces
select trim('  hdhjsgg ') from employee1-- remove both side whitespace
select trim(ename) from employee1
--ltrim=remove left side space and 
--rtrim==remove right side space
select LTRIM(ename) from employee1
select RTRIM(ename) from employee1

--concat
select CONCAT('emp name ',' = ',ename,' email',' = ', email) from employee1

--replace
select REPLACE(email,'@','#') from Employee1

--cast conversation
select cast(email as varchar(10))as 'string email' from Employee1

-- returns the system date & time
select getdate()

--date
select cast(GETDATE() as date)

select cast (getdate() as time) 
--year
select year (cast(getdate() as date))
--month
select  month(cast(GETDATE() as date))
select  month(cast(GETDATE() as date)) 

-- find the birth year of each employee
--current year-age

--select year(cast(GETDATE() as date))-year(cast(getdate() as BOD) from Employee1



