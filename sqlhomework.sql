
use sqlhomework


create table customer
(
cid int,
city varchar(20),
country varchar(10),
postalcode int

)
--drop table customer 


insert into customer (cid,city,country,postalcode)
values
(1,'pune','india',9118),
(2,'nagar','Us',9111),
(3,'ahmednagar','china',6263),
(4,'bid','japan',918),
(5,'jalna','america',218),
(6,'satara','nepal',662),
(7,'mumbai','pakistan',228),
(8,'sambhajinagar','rashiya',348),
(9,'nagapur','ukren',8918),
(10,'kolhapur','rus',678);

--------------------------------------------------------------------------------------
create table product
(
pid int,
pname varchar(20),
price int

)
--drop table product

insert into product(pid,pname,price)
values
(1,'pen',66),
(2,'mobile',7655),
(3,'pendrive',66),
(4,'laptop',7655),
(5,'mouse',66),
(6,'keyboard',7655),
(7,'projector',66),
(8,'botel',7655),
(9,'book',66),
(10,'notebook',7655)

select* from product











insert into customer(cid,city, country) values(11,'abc ','ghhhh')
select * from customer

--1.	Write a statement that will select the City column from the Customers table
select city from customer

--2 Select all the different values from the Country column in the Customers table.
select distinct country from customer

---3.	Select all records where the City column has the value 'pune'
select  * from customer where city ='pune'



--4.	Use the NOT keyword to select all records where City is NOT "satara".
--select * from customer where city<>'satara'
select * from customer where city not in ('satara')

--5.	Select all records where the CustomerID column has the value 10.
select * from customer where cid=10

--6.	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from customer where city='nagapur' and postalcode=8918

--7.	Select all records where the City column has the value 'nagapur' or 'pune'.
select * from customer where city='nagapur'  and city='pune'

--8.	Select all records from the Customers table, sort the result alphabetically by the column City.
select * from customer order by city

--9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select * from customer order by city desc


--10.	Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from customer order by country,city

--11.	Select all records from the Customers where the PostalCode column is empty.
select * from customer where postalcode is null

--12.	Select all records from the Customers where the PostalCode column is NOT empty.
select * from customer where postalcode is not null

--13.	Set the value of the City columns to 'pune', but only the ones where the Country column has the value "india".

--select * from customer where city='pune' and country='china'
select * from customer where city ='pune' and country='india'

--14.	Delete all the records from the Customers table where the Country value is 'japan'.

delete from customer where country = 'japan'



--15.	Use the MIN function to select the record with the smallest value of the Price column.
select min(price) as 'min price' from product

--16.	Use an SQL function to select the record with the highest value of the Price column.
select max(price) as 'max price' from product

--17.	Use the correct function to return the number of records that have the Price value set to 66

select * from product where price='66'

--18.	Use an SQL function to calculate the average price of all products.
select avg(price) as 'avg price' from product

--19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(price) as 'sum price' from product

--20.	Select all records where the value of the City column starts with the letter "a".
select * from customer where city like('a%')

--21.	Select all records where the value of the City column ends with the letter "a".
select * from customer where city like('%a')

--22.	Select all records where the value of the City column contains the letter "a".
select * from customer where city like('%a%')

--23.	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from customer where city like('n%%r')

--24.	Select all records where the value of the City column does NOT start with the letter "a".
select * from customer where city not like('a%')

--25.	Select all records where the second letter of the City is an "a".
select * from customer where city like('_a%')

--26.	Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from customer where city like('[acs]%')

--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from customer where city like('%[a-f]')

--28.	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from customer where city not like('[acf]%')

--29.	Use the IN operator to select all the records where the Country is either "china" or "india".

select * from customer where country in ('china','india')

--30.	Use the IN operator to select all the records where Country is NOT "india" and NOT "china".
select * from customer where country not in ('china','india')


--31 	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from product where price between 66 and 7655


--32.	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from product where price not between 88 and 7655

--33.	Use the BETWEEN operator to select all the records where the value of the ProductName
--column is alphabetically between 'pen' and 'laptop'.


--34.	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select postalcode as ptcode
FROM customer;

--35.	When displaying the Customers table, refer to the table as Consumers instead of Customers.




--36.	List the number of customers in each country.

select count(country) as 'count country' from customer


--38.	Write the correct SQL statement to create a new database called testDB.

--39.	Write the correct SQL statement to delete a database named testDB

--40.	Add a column of type DATE called Birthday in Persons table
alter table customer add  birthday date

--41.	Delete the column Birthday from the Persons table
alter table customer drop column birthday