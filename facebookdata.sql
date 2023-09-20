-----user id , user name , email , phone no , total posts
---fb user
create table fbuser
(
us_id int,
us_name varchar(20),
email varchar(25),
phonenum varchar(10),
taotalpost int,
constraint userid primary key(us_id)
)

-------------------------------------------------------------------------------------------------------------------------------------------
---Friendship user id , friend id, friendship status code
create table friendship
(
us_id int,
frd_id int,
frd_status_code int,
constraint frdstatuscode primary key(frd_status_code),
constraint useridfrd foreign key(us_id) references fbuser(us_id)
)

------------------------------------------------------------------------------------------------------------------------------------------
---Post post id , user id , postContent , postImage , PostVideo
create table post
(
post_id int,
us_id int,
ps_content varchar(50),
postimg image,
constraint userpostid foreign key(us_id) references fbuser(us_id)
)



------------------------------------------------------------------------------------------------------------------------------------------
-----Friendship Status code, Status ( 1 family , 2 Friend , 3 colleague , 4
create table frdshipstatus
(
frd_status_code int,

constraint frdstatus foreign key(frd_status_code) references friendship(frd_status_code),
frdstatus image 

)