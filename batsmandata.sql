---country id , country name (e.g. 1 India , 2 Australia
use batsman
create table country
(
cid int,
cname varchar(20),
constraint pk_keycid  primary key(cid),

)



select*from  country
------------------------------------------------------------------------------------------------------------------------
--( format id , format name ) ( e.g. 1. T20 , 2 ODI , 3
---format table
create  table format1
(
fid int,
fname varchar(20),
constraint pk_keyid  primary key(fid)
)



select*from  format1

----------------------------------------------------------------------------------------------------------------------------
--player id , Player name , age , country id , total runs ,total50s , total100s , player grade
--palyer table
create table player
(
pl_id int,
pl_name varchar(20),
pl_age int,
cid int,
constraint pk_key_plid primary key(pl_id),
constraint fk_key_cid  foreign key (cid) references country(cid),


)

select*from  player



------------------------------------------------------------------------------------------------------------------------------
--B-_F_Mapping id , player id , format id

create table b_f_mapping
(
b_f_mapping_id int,
pl_id int,
fid int,
constraint fk_key_pl foreign key (pl_id) references player(pl_id),
constraint fk_key_fid foreign key (fid) references format1(fid)
)

select*from  b_f_mapping

exec sp_help country
exec sp_help format1
exec sp_help  player
exec sp_help b_f_mapping

