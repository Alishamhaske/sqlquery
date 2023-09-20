use employeequery
create table emp
(
eid int primary key identity(1,1) ,
ename varchar(30),
salary numeric(12,2),
dept_name varchar(20),
gender char(2),
E_Location varchar (30) ,
Position varchar (20),
Age int
)

insert into emp (ename,salary,dept_name,gender,E_Location,Position,Age)
values
('shubham',25000,'HR','M','Pune','Manager',25),
('Bhakti',23000,'Employee','F','nagar','devloper',23),
('alisha',26000,'manager','F','mumbai','web devloper',33),
('tanuja',22000,'Employee','F','nagpur','Sr.Dev',31),
('prasad',31000,'Employee','M','goa','Project Manager',24),
('sandesh',25000,'Employee','M','Pune','dev',26),
('payal',25000,'Employee','F','Pune','.net devloper',26)


select* from emp

--1.find out all employee whose salary is more 25k less 50k
select * from emp where salary>25000 and salary<50000

--2.find out the all employee whose name start with ‘s’
select * from emp where ename like('s%')
--3. find out the number of employee from each dept

select dept_name, count(*) from emp group by dept_name

--4.find out the maximum salary of the employee
select max(salary) as 'max salary' from emp

--5.find out the gender wise employee count
select gender, count(*) from emp  group by gender 

--6. write query to find out the employee whose is working in Mumbai location and salary is more Than 20k.
select * from emp where E_Location='mumbai' and salary>20000

--7. write query to calculate the pf calculation 12%
select ename,salary,salary+(salary*0.12) as pf from emp

--8.write query to update the designation of employee  as a managar whose salary more than 30k
update emp set Position='Manager' where salary>30000

select * from emp

--9. write query to remove the employee whos age is more than 25 and salary is 25k
delete from emp where age>25 and salary=25000



--10 write query find out the records where employee name contain ‘e’

select *from emp where ename like '%e%'
--total count of employee
select count(eid)as 'total count' from emp

--age between 22 and 24
select * from emp where age between 22 and 24

-- waq to find out employees with designation  devloper or manager representative
select * from emp where Position in('devloper','manager');

select * from emp where Position not in('devloper', 'manager')

-- waq to find out those employees whose salary is not yet decided
select * from emp where salary is not null;
select * from emp where salary is  null;

--second last j
select * from emp where ename like '_%j_';

--select name from sys.databases;

create table temp
(
hire_date date
);
alter table temp add  tname varchar(20)
insert into temp  values ('12-9-2023');
insert into temp values('10-6-2023','alisha')
select * from temp

--alter table temp add age int
alter table temp drop column age
alter table temp add age int identity(1,1)
insert into temp values('10-6-2023','alisha')
insert into temp(hire_date,hire_date)
values
('12-3-2023','tanuja'),
('10-5-2023','tanu'),
('11-6-2023','tanuja'),


alter table temp add constraint age check(age>=18)
