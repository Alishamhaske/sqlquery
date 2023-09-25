use [21sep_procedure]
create table emp1
(
eid int identity(1,1) ,
ename varchar(30),
salary numeric(12,2),
did int
)
--drop table emp
select * from emp1
alter table emp1 add city varchar(10)
insert into emp1 (ename,salary,did)
values
('shubham',25000,12),
('Bhakti',23000,13),
('alisha',26000,14),
('tanuja',22000,10),
('prasad',31000,11),
('sandesh',25000,12),
('payal',25000,10)

----------------
--create
create proc sp_emp_select
as begin
select * from emp1
return
end

--fetch
exec sp_emp_select

---with parametr
create proc sp_emp_city(@city varchar(10))
as begin
select * from emp1 where city=@city
return
end

exec sp_emp_city
@city='pune'

---with parametr ename is bhakti
create proc sp_emp_name(@ename varchar(30))
as begin
select * from emp1 where ename=@ename
return
end

exec sp_emp_name
@ename='bhakti'


--dml command
create proc SP_Insert_Emp
(
@eid int,
@ename varchar(30),
@salary numeric(12,2),
@did int,
@city varchar(10)
)
as begin
insert into emp1 values(@ename,@salary,@did,@city)
return
end

exec SP_Insert_Emp
@eid =7,
@ename='Test',
@salary=3456766.45,
@did=103,
@city='pune'

--
create proc SP_Update_Emp
(
@eid int,
@ename varchar(30),
@salary numeric(12,2),
@did int,
@city varchar(10)
)
as begin
update emp1 set  ename=@ename,salary=@salary,did=@did
where eid=@eid
return
end



exec  SP_Update_Emp
@eid=4,
@ename='tanuja',
@salary=34567.45,
@did=103,
@city='pune'

--fecth
exec sp_emp_select

--upadte name
create proc SP_Update_name
(@ename varchar(30), @eid int)
as begin
update emp1 set ename=@ename where eid=@eid
return 
end

--
exec SP_Update_name
@eid=5,
@ename='nikita'

--fetch
exec sp_emp_select

--delte 
create proc sp_delete_emp
(@eid int)
as begin
delete from emp1 where eid=@eid
return
end
---
exec Sp_Delete_Emp
@eid=8

--fetch
exec sp_emp_select







































