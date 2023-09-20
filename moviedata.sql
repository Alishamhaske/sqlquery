-----roll id , roll name 

use moiverole
-------------------------------------------------------------------------------------------------------------------------
---role
create table role
(
rid int,
rname varchar(20),
constraint roll_id primary key(rid)
)


-------------------------------------------------------------------------------------------------------------------------
---celebrity id , celebrity name , birthdate , ph no , email
---celebrity
create table celebrity
(
cid int,
cname varchar(20),
bdate date,
phno varchar(10),
email varchar(20) unique,
constraint cele_id primary key(cid)
)


-------------------------------------------------------------------------------------------------------------------------------
--Bollywood Data id , celebrity id , movie id , roll id

create table bollywood 
(
b_data_id int,
cid int,
mid int,
rid int,
constraint movieid primary key(mid),
constraint bolly foreign key(cid) references celebrity(cid),
constraint bollyroll foreign key(rid) references role(rid)
)


-------------------------------------------------------------------------------------------------------------------------------
--Movie id , movie name , release year , box office collectio
create table movie
(
mid int,
mname varchar(20),
yr int,
box_office_col int
constraint movie_id foreign key (mid) references bollywood(mid)
)