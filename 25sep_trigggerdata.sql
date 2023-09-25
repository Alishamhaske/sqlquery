use trigggerdata
use employeequery
select  * from emp

create table employeetrack
(
id int primary key identity(1,1),
description varchar(500)
)

select * from employeetrack

create trigger trig_employee
on emp after insert
as begin
declare @eid int  
declare @ename varchar(20)
declare @salary numeric(12,2)
declare @dept_name varchar(20)
declare @gender char(2)
declare @E_location varchar(30)
declare @Position varchar(30)
declare @age int

select @eid=eid,@ename=ename,@salary=salary,@dept_name=dept_name,@gender=gender,@E_location=E_location,
@Position=Position,@age=age from inserted
insert into employeetrack values('new record details'+cast(@eid as varchar)+'name'+
@ename +cast(@salary as varchar)+'dept name '+@dept_name + 'gender' + cast(@gender as varchar) + 'elocation ' +@E_location
+' postion' + @Position +cast (@age as varchar)  +'added')
end

insert into emp values('kiran',65667,'hr','m','nagar','senoir',25)


create trigger trig_emp_delete
on emp after delete
as begin
declare @eid int
declare @ename varchar(30)
declare @salary numeric(12,2)
declare @dept_name varchar(20)
declare @gender char(2)
declare @E_location varchar(30)
declare @Position varchar(30)
declare @age int
select @eid=eid,@ename=ename,@salary=salary ,@dept_name=dept_name,@gender=gender,@E_location=E_location,
@Position=Position,@age=age from deleted
insert into employeetrack values ('record with details' +cast(@eid as varchar)+'name'+
@ename +cast(@salary as varchar) +'dept name '+@dept_name + 'gender' + cast(@gender as varchar) + 'elocation ' +@E_location
+' postion' + @Position +cast (@age as varchar) + 'removed')
end

select * from emp
select * from employeetrack




