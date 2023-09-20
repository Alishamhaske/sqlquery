use [18sep_subQempdept]
create table doctor
(
d_id int primary key,
df_name varchar(20),
dl_name varchar(20),
speciality varchar(20)
)
insert into doctor values(10,'chinmay','sable','Pathology'),
(11,'sandesh','kshirsagar','Cardiology'),
(12,'tanuja','nimse','Pathology'),
(13,'tanu','sable','Radiology'),
(14,'chinmay','sable','Pediatrician'),
(15,'prasad','cheke','Radiology')

insert into doctor(d_id,df_name,dl_name) values(16,'aboli','kasar')
insert into doctor(d_id,df_name) values(17,'payal')

select * from doctor
-----------------------------------------------------------------
create table provience_names
(
provience_id char(2) primary key,
provience_name varchar(20)

)
insert into provience_names values('BA','BUENOS AIRES'),('CF','CAPITAL FEDERAL'),('IN','india'),('US','state'),
('uk','kingdom'),('MH','maharashtra')
insert into provience_names(provience_id) values('MP')

select* from provience_names
------------------------------------------
create table patient
(
p_id int primary key identity(1,1),
pf_name varchar(20),
pl_name varchar(20),
genter char(1),
BOD date,
city varchar(20),
provience_id char(2) ,
allergies varchar(20),
height decimal(3,0),
wgt decimal(4,0)

constraint fk_provienceid foreign key(provience_id) references provience_names(provience_id)

)

insert into patient values('shubham','dalvi','M','06/10/2002','pune','BA','Drug Allergy',123.3,43.2),
('payal','dalvi','F','12/10/2002','nashik','IN','skin Allergy',167.3,42.2),
('suraj','fulsundar','M','10/12/2002','nagar','Us','Asthma.',144.3,77.2),
('shakil','shaikh','M','03/12/2002','pune','UK','Drug Allergy',193.3,43.2)

insert into patient(pf_name,BOD,city,height) values('pradhnya','06/10/2002','pune',123.3)


select * from patient
-------------------------------------------------------------
create table admissions
(
p_id int,
admission_date date,
discharge_date date,
diagnosis varchar(50),
attending_did int,

constraint fk_patient_id foreign key(p_id) references patient(p_id),
constraint fk_attending_did foreign key(attending_did) references doctor(d_id)
)

insert into admissions values(4,'03/12/2002','04/12/2002','Food Allergy',11),
(5,'10/12/2002','11/12/2002','Food Allergy',12),
(6,'03/12/2002','10/12/2002','hearing loss',11),
(5,'02/12/2002','06/12/2002','cancer',13),
(7,'1/12/2002','08/12/2002','sugar',14)


insert into admissions(p_id,diagnosis,attending_did) values(4,'Food Allergy',11)
-----------------------------------------

select * from doctor
select* from provience_names
select * from patient
select * from admissions

--query
--1 Show the first name, last name and gender of patients who’s gender is ‘M’
select p.pf_name,p.pl_name   from patient p
 where genter='M'

 --2.	Show the first name & last name of patients who does not have any allergies
 select p.pf_name,p.pl_name from patient p
 where allergies = null

 --3.	Show the patients details that start with letter ‘S’
 select * from patient 
 where pf_name like 's%'

 --4. Show the patients details that height range 100 to 200
 select * from patient
 where height between 100 and 150

 --5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
 update  patient set allergies='NKA' where allergies=null 

 --6 	Show how many patients have birth year is 2002
  select count(*) as'patient count' from patient where year(BOD)=2002;

   --only find year, month
select p.BOD, month(p.BOD) as 'month' from patient p
select p.BOD, year(p.BOD) as 'year' from patient p
 

  select * from patient
 

  --7	Show the patients details who have greatest height
  select * from patient where height=
  (
  select max(height) as 'max height' from patient
  )
---other way
  select top 1 * from patient order by height desc

  --8.	Show the total amount of male patients and the total amount of female patients
  --in the patients table.
  select COUNT(genter) as'gender count',p.genter from patient p
  group by genter

  --9.	Show first and last name, allergies from patients which have allergies to either 'drug allergies' 
  --or 'skin'. Show results ordered ascending by allergies then by first_name then by last_name.
  select * from patient

  select p.pf_name,p.pl_name,p.allergies  from patient p
  where allergies= 'drug allergy' or allergies= 'skin allergy'
  order by allergies,pf_name,pl_name

  --10.	Show first_name, last_name, and the total number of admissions attended for each doctor.
--Every admission has been attended by a doctor.
 select CONCAT(d.df_name , ' ',d.dl_name ) 'doctorname' , count(d.d_id) as 'attened'
from doctor d
join admissions a on a.attending_did=d.d_id
join patient p on p.p_id=a.p_id
group by CONCAT(d.df_name , ' ',d.dl_name), d_id


--11 For every admission, display the patient's full name, their admission diagnosis,
--and their doctor's full name who diagnosed their problem.
select concat(p.pf_name,' ',p.pl_name) as 'patient name' ,a.diagnosis ,
CONCAT(d.df_name, ' ',d.dl_name) as 'doctor name'
from patient p
join admissions a on a.p_id=p.p_id
join doctor d on d.d_id=a.attending_did


