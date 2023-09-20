use emp_grpbyquery_15sep
create table empinfo
(
empid int primary key,
emp_f_name varchar(20),
emp_L_name varchar(20),
dept varchar(20),
project varchar(10),
eaddress varchar(20),
DOB date,
gender varchar(10)
)

insert into empinfo values(1,'rohit','gupta','admin','p1','delhi','12/02/1979','male')
insert into empinfo values(2,'rahul','mahajan','admin','p2','mumbai','10/10/1986','male')
insert into empinfo values(3,'sonia','benerjee','HR','p3','pune','06/05/1983','female')
insert into empinfo values(4,'ankita','kapoor','HR','p4','chennai','11/28/1983','female')
insert into empinfo values(5,'swati','garg','HR','p5','delhi','04/06/1991','female')


-----------------------------------------------------------------------
create table employeeposition
(
empid int,
emposition varchar(20),
dateofjoining date,
salary numeric(10,2),
constraint fk_empid foreign key (empid) references empinfo(empid)
)

-----------------------------------------------------------------------
insert into EmployeePosition values(1,'Executive','2020/4/1',75000)
insert into EmployeePosition values(2,'Manager','2020/4/3',50000)
insert into EmployeePosition values(3,'Manager','2020/4/2',150000)
insert into EmployeePosition values(2,'Officer','2020/4/2',90000)
insert into EmployeePosition values(1,'Manager','2020/4/3',300000)


select * from empinfo
select * from employeeposition

--1.. Create a query to generate the first records from the EmployeeInfo table.
select top 1  e.* from empinfo e

--2. Create a query to generate the last records from the EmployeeInfo table.
select top 1  e.* from empinfo e
order by e. empid desc

--3. Create a query to fetch the third-highest salary from the EmpPosition table.
select   e1.* from employeeposition e1
order by e1.salary desc
offset 2 rows
fetch next 1 row only


--4 Write a query to find duplicate records from a table.
select e.empid , count(e.empid) as 'count' from empinfo e
inner join employeeposition e1 on e1.empid =e.empid
group by e.empid
having count(e.empid)>1

 select * from EmployeePosition
--other way
select empid,count(empid) as 'count' from EmployeePosition 
group by empId
having count(empid)>1

--5 Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
select e.emposition ,sum(salary) from employeeposition e
group by emposition

--6 .  find the employee who has max salary
select top 1 e1.*,e.salary  from employeeposition e,empinfo e1
order by salary desc

--otherway
select top 1 e1.*, p1.salary from empinfo e1
inner join EmployeePosition p1 on p1.empId=e1.empId
order by p1.salary desc

--7 find the employee who has max salary from admin department
select top 1 * from empinfo e, employeeposition e1
where dept='admin'
order by e1.salary desc


--8 find the age of each employee
select * , year(cast(GETDATE() AS date)) - year(DOB) as 'Age of emp' from empinfo


--9 display only female employee details
select  * from empinfo where gender='female'

--10 display employee whos position is executive
select * from employeeposition e1 
join empinfo e on e.empid=e1.empid
where emposition='executive'

--11 display count of employee in each city
select eaddress, count(empid) from empinfo e
group by e.eaddress