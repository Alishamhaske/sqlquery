use [22sep_function]
--user defined function
--scaler function
--addition 2 number


create function addition(@a int,@b int)
returns int
as begin
--declare variable
declare @c int
set @c=@a+@b
return @c
end
--------------------
--dbo =database object
select dbo.addition(20,20) as 'sum'


--------------------------------------------------------
create table dept
(
did int not null,
d_name varchar(10),
constraint pk_dept primary key(did)
)

select * from dept
insert into dept values(22,'hr'),(23,'manager'),(24,'senoir')
---------------------------------------------------
create table emp4
(
empid int,
ename varchar(20),
did int ,
dname varchar(20),
mid int
constraint fk_did foreign key(did) references dept(did)
)
insert into emp4 values(1,'alisha',22,'hr',2)
insert into emp4 values(2,'tanuja',23,'hr',3)

select * from dept
select * from emp4

--scalar function
create function GetEmpName(@empid int)
returns varchar(20)
as begin
return (select ename from emp4 where empid=@empid)
end

------
select dbo.GetEmpName(2) as 'emp name'

------------------------------------------------------------------
-- multi value function begin & end keyword not need to write
create function getempbydept(@did int)
returns table
as 
return(select * from emp4 where did=@did)

----
select * from dbo.GetEmpByDept(22)



------------------------------------------
create table product
(
pid int,
pname varchar(20),
pprice int,
)
insert into product values(1,'laptop',66334),(2,'mobile',6566),(3,'pen',555)
select * from product

-----------fun
create function discountprice(@pprice int)
returns decimal
as begin
declare @dp decimal
set @dp= @pprice-(@pprice*0.1)
return @dp
end
---

select pprice,dbo.discountprice(3443) as 'discount price' from product
select pprice,dbo.discountprice(3443) as 'discount price' from product


------------------------------------
--find discount pass paramater
create function dstprice1(@price int)
returns decimal
as begin
declare @dp decimal
set @dp=@price-(@price * 0.2)
return @dp
end

select dbo.dsctprice1(65656) as 'discount price' 
-----------------------------


