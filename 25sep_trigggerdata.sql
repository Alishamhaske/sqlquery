use trigggerdata
use employeequery
select  * from emp

create table employeetrack
(
id int primary key identity(1,1),
description varchar(255)
)
insert into employeetrack values('employee is manager'),('employee is hr')
select * from employeetrack

create trigger tri_employee
on emp after insert
as begin
declare @eid int  
declare @ename varchar(20)
declare @dept_name varchar(20)
declare @gender char(2)
declare @E_location varchar(30)
declare @Position varchar(30)
declare @age int

select @eid=eid,@ename=ename,@dept_name=dept_name,@gender=gender,@E_location=E_location,
@Position=Position,@age=age from inserted
insert into employeetrack values('new record details'+cast(@eid as varchar)+'name'+
@ename +'dept name '+@dept_name + 'gender' + cast(@gender as varchar) + 'elocation ' +@E_location
+' postion' + @Position +cast (@age as varchar)  +'added')
end


create trigger tri_emp_delete
on emp after delete
as begin
declare @eid int
declare @ename varchar(30)
declare @dept_name varchar(20)
declare @gender char(2)
declare @E_location varchar(30)
declare @Position varchar(30)
declare @age int
select @eid=eid,@ename=ename ,@dept_name=dept_name,@gender=gender,@E_location=E_location,
@Position=Position,@age=age from deleted
insert into employeetrack values ('record with details' +cast(@eid as varchar)+'name'+
@ename  +'dept name '+@dept_name + 'gender' + cast(@gender as varchar) + 'elocation ' +@E_location
+' postion' + @Position +cast (@age as varchar) + 'removed')
end

select * from employeetrack
select * from emp

