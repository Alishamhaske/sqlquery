use [50_Q_worker_bonus]


CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY identity(1,1) ,
	FIRST_NAME varchar(25),
	LAST_NAME varchar(25),
	SALARY numeric(15),
	JOINING_DATE DATE,
	DEPARTMENT varchar(25)
)
--drop table Worker
INSERT INTO Worker 
	(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		( 'Monika', 'Arora', 100000, '04/12/2020' , 'HR'),
		( 'Niharika', 'Verma', 80000, '11/11/2011' , 'Admin'),
		( 'Vishal', 'Singhal', 300000, '01/11/2016', 'HR'),
		('Amitabh', 'Singh', 500000, '06/12/2021', 'Admin'),
		('Vivek', 'Bhati', 500000, '09/11/2022', 'Admin'),
		( 'Vipul', 'Diwan', 200000, '09/21/2022', 'Account'),
		( 'Satish', 'Kumar', 75000, '08/11/2022', 'Account'),
		('bhakti', 'jare', 90000, '02/11/2023', 'Admin')
		
select * from Worker
-------------------------------------------------------
CREATE TABLE Bonus (
	WORKER_ID INT,
	BONUS_AMOUNT numeric(10),
	BONUS_DATE DATE,
	FOREIGN KEY (WORKER_ID) REFERENCES Worker(WORKER_ID)
        
)

INSERT INTO Bonus 
	(WORKER_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(1, 5000, '09/11/2022'),
		(2, 3000, '05/18/2023'),
		(3, 4000, '10/17/2022'),
		(1, 4500, '11/16/2023'),
		(2, 3500, '06/23/2022')

INSERT INTO Bonus 
	(WORKER_ID, BONUS_AMOUNT) VALUES
		(1, 5000)
INSERT INTO Bonus (WORKER_ID ) VALUES(3)

select * from Bonus
--------------------------------------------------------------
CREATE TABLE Title (
	WORKER_ID INT,
	WORKER_TITLE VARCHAR(25),
	AFFECTED_FROM date,
	FOREIGN KEY (WORKER_ID) REFERENCES Worker(WORKER_ID)
      
)

INSERT INTO Title 
	(WORKER_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (1, 'Manager', '06/23/2022'),
 (2, 'Executive', '07/22/2022'),
 (8, 'Executive', '08/23/2023'),
 (5, 'Manager', '05/13/2021'),
 (4, 'Asst. Manager', '06/02/2021'),
 (7, 'Executive', '02/23/2023'),
 (6, 'Lead', '10/15/2020'),
 (3, 'Lead', '01/11/2022')

 
INSERT INTO Title 
	(WORKER_ID, WORKER_TITLE) VALUES
 (1, 'Manager')
 INSERT INTO Title (WORKER_ID,  AFFECTED_FROM) VALUES
 (1, '06/23/2022')
 select * from Title

 ---------------------------------------------------------
 --Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker
 --table using the alias name <WORKER_NAME>.

-- select w.FIRST_NAME from Worker w
 select FIRST_NAME as 'first name' from Worker 

 --Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
 select UPPER(FIRST_NAME) as 'first name of worker' from Worker

 --Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
 select  distinct DEPARTMENT  from Worker

 --Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from 
 --the Worker table.
 select SUBSTRING( FIRST_NAME,1,3) from Worker

 --Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name
 --column ‘Amitabh’ from the Worker table.

 --not support instr 
--Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh';

--Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after 
--removing white spaces from the right side.

Select RTRIM(FIRST_NAME) from Worker;

--Q.7.  Write an SQL query to print the DEPARTMENT from the Worker table after
--removing white spaces from the left side.
select LTRIM(FIRST_NAME) from Worker;

--Q8 Write an SQL query that fetches the unique values of DEPARTMENT from the
--Worker table and prints its length.
Select distinct len(DEPARTMENT) as 'Length' from Worker;

--Q9 Write an SQL query to print the FIRST_NAME from the 
--Worker table after replacing ‘a’ with ‘A’.

select REPLACE(FIRST_NAME,'a', 'A') from Worker

--Q 10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table
--into a single column COMPLETE_NAME. A space char should separate them. 
select Concat(FIRST_NAME,' ', LAST_NAME ) as 'COMPLETE NAME' 
from Worker

--Q-11. Write an SQL query to print all Worker details from the Worker table
--order by FIRST_NAME Ascending.
select *from Worker 
order by FIRST_NAME

--Q-12. Write an SQL query to print all Worker details from the Worker 
--table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select *from Worker 
order by FIRST_NAME, DEPARTMENT DESC

--Q-13. Write an SQL query to print details for Workers with the first names “Vipul”
-- and “Satish” from the Worker table.
select *
from Worker
where FIRST_NAME in('vipul', 'satish')

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul”
--and “Satish” from the Worker table.
select *
from Worker
where FIRST_NAME not in ('vipul', 'satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select *from Worker
where DEPARTMENT = 'Admin'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME
--contains ‘a’.
select * from Worker
where FIRST_NAME like '%a%'

--Q-17. Write an SQL query to print details of the Workers 
--whose FIRST_NAME ends with ‘a’.
select * from Worker 
where FIRST_NAME like '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends
--with ‘h’ and contains six alphabets.

select *from Worker where FIRST_NAME like '_____h'

--Q-19. Write an SQL query to print details of the Workers 
--whose SALARY lies between 100000 and 500000.
select *from Worker where SALARY between 100000 and 5000000

--Q-20. Write an SQL query to print details of the Workers who joined in Feb’2014.
select *from Worker where year(JOINING_DATE) = 2014 and MONTH(JOINING_DATE) = 2

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(WORKER_ID) as 'employee in admin'
from worker
where DEPARTMENT = 'admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select salary, CONCAT(FIRST_NAME,' ', LAST_NAME) as 'worker name'
from Worker
where SALARY between 50000 and 100000

----Q-23. Write an SQL query to fetch the no. of workers for
--each department in descending order.
select count(DEPARTMENT) as 'department count', DEPARTMENT
from worker
group by DEPARTMENT 
order by [department count] desc

--Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_ID
AND T.WORKER_TITLE in ('Manager');

----Q-25. Write an SQL query to fetch duplicate records having matching data in
--some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

--Q-26. Write an SQL query to show only odd rows from a table.


--Q-27. Write an SQL query to show only even rows from a table.

--Q-28. Write an SQL query to clone a new table from another table.
 

--Q-29. Write an SQL query to fetch intersecting records of two tables.

--Q-30. Write an SQL query to show records from one table that another table
--does not have.


 --Q-31. Write an SQL query to show the current date and time.
 select GETDATE()

 ----Q-32. Write an SQL query to show the top n (say 10) records of a table.

 --Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

 --Q-34. Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
 select *from worker 
  order by SALARY desc 
 offset 4 rows 
 fetch next 1 row only

 --Q-35. Write an SQL query to fetch the list of employees with the same salary.
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

--Q-36. Write an SQL query to show the second-highest salary from a table.
 select *from worker order by SALARY desc 
 offset 1 row
 fetch next 1 rows only

 ----Q-37. Write an SQL query to show one row twice in the results from a table.
 select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR';



 --Q-38. Write an SQL query to fetch intersecting records of two tables.


 --Q-39. Write an SQL query to fetch the first 50% of records from a table.
 

 --Q-40. Write an SQL query to fetch the departments that have less than five people in them.
 select count(w.WORKER_ID) as 'num of people', w.DEPARTMENT 
 from worker w
 group by w.DEPARTMENT
 having count(w.WORKER_ID) < 5


  --Q-41. Write an SQL query to show all departments along with the number of people in there.
 select count(*) as 'DEP wise cnt',  w.DEPARTMENT
 from worker w
 group by DEPARTMENT

 --Q-42. Write an SQL query to show the last record from a table.
 select top 1 *from worker order by WORKER_ID desc

 --Q-43. Write an SQL query to fetch the first row of a table.
 select top 1 *from worker

 --Q-44. Write an SQL query to fetch the last five records from a table.
 select top 5 *from worker w order by WORKER_ID desc


 --Q-45. Write an SQL query to print the name of employees having the highest 
 --salary in each department.
 SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary 
 from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT)
 as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;

 
 --Q-46. Write an SQL query to fetch three max salaries from a table.
 select top 3 *from worker order by SALARY desc
  

   --Q-47. Write an SQL query to fetch three min salaries from a table.
 select top 3 *from Worker order by SALARY 

 --Q-48. Write an SQL query to fetch nth max salaries from a table.

  --Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
 select sum(SALARY) as 'department wise salary sum', DEPARTMENT
 from Worker
 group by DEPARTMENT

--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
 select top 1 with ties *from Worker order by SALARY desc
