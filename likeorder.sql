
create table customer1
(
cid int,
cname varchar(20),
country varchar(10),
salary int

)
--drop table customer1

insert into customer1 (cid,cname,country,salary)
values
(1,'rahul','india',9118),
(2,'sandesh','Us',9111),
(3,'prasad','china',6263),
(4,'riya','japan',918),
(5,'tanuja','america',218),
(6,'tanu','nepal',662),
(7,'pradnya','pakistan',228),
(8,'alisha','rashiya',348),
(9,'chinmay','ukren',8918),
(10,'kolhapur','rus',678);

select * from customer1

--like clause in SQL 
--start with s end with any letters

select * from customer1 where cname like('s%')

--start with any end with a letters
select * from customer1 where cname like('a%')

---start and end with any letter, name contains a
select * from customer1 where cname like('%a%')
select * from customer1 where cname not like('%a')

--name end with a or y or r
select * from customer1 where cname like ('%[ayr]')

--name end start a or y or r 
select * from customer1 where cname like ('[ayr]%')

---- range [a-g], [h-z]
--start with a-g
select * from customer1 where cname like('[a-g]%')

--end with h-z
select * from customer1 where cname like('%[h-z]')

--underscore is used to define specific letters 
--start with r and 4 underscore
select * from customer1 where cname like('r____')
--start with 5 underscore and end with a
select * from customer1 where cname like('_____a')

-- start 2 underscore middle h and  end with2 underscore
select * from customer1 where cname like('__h__')
--chinmay
select * from customer1 where cname not like(' ___n___')
select * from customer1 where cname not like('__h__')


---------------------------------------------------------------------------------------------------------------
--order by

--sort by asending
select * from customer1  order by cname
--sort by descending
select * from customer1 order by cname desc

select * from customer1 order by country 
select * from customer1 order by country desc

select * from customer1 order by salary
select * from customer1 order by salary desc

----limiting the records in SQL using TOP, Offset & Fetch

select  top 5 *  from customer1 order by cname
select top 5 * from customer1 order by cname desc

--
select top 5 * from customer1 order by cid
select top 5 * from customer1 order by cid desc

--- last 5 country
select top 5  * from customer1 order by country desc

-----------------------------------------------------------------------------------------
--ties
-- ties  --> match data based on column that we specify in order by
select top 3 with ties * from customer1 order by cid desc
select top 3 with ties * from customer1 order by cid 

-----------------------------------------------------------------------------------------------
--fetch --> select the records
--offset --> to skip records
-- order by clause is must in the query

-- display custom who have 3rd highest salary in he table 
select * from customer1 order by salary
offset 2 rows
fetch next 1 row only



--display 5th highest salary
select * from customer1 order by salary desc
offset 4 rows
fetch next 1 row only

--display 5th lowest salary
select * from customer1 order by salary 
offset 4 rows
fetch next 1 row only

----display emp who have 3rd, 4th highest salary in he table 
select * from customer1 order by salary desc
offset 2 rows
fetch next 2 rows only



--display 4rd  and 5th lowest salary emp
select * from customer1 order by salary 
offset 3 rows
fetch next 2 rows only


--display 4rd  5th 6th lowest salary emp
select * from customer1 order by salary 
offset 3 rows
fetch next 3 rows only

select max(salary) as 'max salary' from customer1
select min(salary) as 'min salary' from customer1
select max(cid) as 'max id' from customer1
select sum(salary) as 'sum salary' from customer1
--select sum(cid) as 'sum id' from customer1
select avg(salary) as 'avg salary' from customer1
select count(cname) as 'count cname' from customer1