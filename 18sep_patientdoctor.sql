use [18sep_subQempdept]
create table doctor
(
d_id int primary key,
df_name varchar(20),
dl_name varchar(20),
speciality varchar(20)
)

-----------------------------------------------------------------
create table patient
(
p_id int primary key,
pf_name varchar(20),
pl_name varchar(20),
genter char(1),
BOD date,
city varchar(20),
provience_id char(2) ,
allergies varchar(20),
height decimal(3,0),
wgt decimal(4,0)

)

-------------------------------------------------------------
create table admissions
(
patient_id int,
admission_date date,
discharge_date date,
diagnosis varchar(50),
attending_did int,
)

create table provience_names
(
provience_id char(2),
provience_name varchar(20)

)