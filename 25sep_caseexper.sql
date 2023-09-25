use [25sep_caseexper]
use employeequery
create table product
(
pname varchar(20),
price numeric(10)
)
insert into product values('laptop',65656),('phone',5567),('pendrive',65656)
insert into product values('laptop',6000)


select pname,price,
case
when price > 6000 then 'expensive'
when price < 6000 then 'not expensive'
else 'average'
end as 'remark'
from product


--emp table in empquery database 
select ename,salary,
case
when salary > 40000 and salary< 90000 then 'high salary'
when  salary >25000 and  salary< 40000 then 'average salary '
else 'low salary'
end as 'remark'
from emp

select * from emp