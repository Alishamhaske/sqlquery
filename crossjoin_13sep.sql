use crossjoin_13sep
create table color
(
cid int primary key,
cname varchar(20)
)

insert into color(cid,cname)
values
(1,'red'),
(2,'pink'),
(3,'yellow'),
(4,'dark red'),
(5,'black'),
(6,'blue'),
(7,'white')



create table size
(
s_id int,
s_size varchar(20)
constraint fk_sid_size foreign key(s_id) references color(cid)

)
insert into size(s_id,s_size)
values
(1,'xl'),
(2,'m'),
(3,'X'),
(4,'XL'),
(5,'L'),
(6,'M')

insert into size(s_size) values('L'),('XL')

select *from color
select * from size

select * from color cross join size