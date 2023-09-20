
use Dptitan1
create  table   Constraint_emp
 (
 emp_name varchar(20) not null,
 e_mob int,
 e_salary numeric(10,2)

 )
 --unique
 alter table Constraint_emp add constraint e_name unique( emp_name)

 alter table Constraint_emp add constraint salary unique (e_salary)

 --primarey key
 alter table Constraint_emp add constraint emp_name primary key (e_salary)
 alter table Constraint_emp drop constraint salary
 --alter table Constraint_emp add constraint mob not null (e_mob)
 drop table Constraint_emp


