create database movies;
drop database movies;
show databases;
create database movies;
use movies ;
show databases ;
use movies ;
create table movie(
movie_id int PRIMARY KEY,
title VARCHAR(45),
release_date DATE,
genre VARCHAR(45),
director_id VARCHAR(45),
producer_id VARCHAR(45),
rating int,
actor_id int);
create table songs(
movie_id INT ,
song_name VARCHAR(45),
singer VARCHAR(45),
song_composer VARCHAR(45));
desc movie;
create table movie_duplicate as select movie_id,title,release_date,genre from movie;
desc movie_duplicate;
drop  table movie_duplicate;
desc movie_duplicate;
desc movie;
create table production(producer_id int primary key,
producer_name varchar(45),
production_company varchar(45),
budget int);
show tables;
delete from movie where movie_id in(1003,1004,1005,1006,1007);
insert into movie values(1001,'BAHUBALI','2016-12-7','history',2001,3001,10,4001);
insert into movie values(1002,'PUSPA','2017-12-7','action',2002,3002,10,4002);
insert into movie values(1003,'RRR','2018-12-7','adventure',2003,3003,9,4003);
insert into movie values(1004,'SAHOO','2019-12-7','fantacy',2004,3004,8,4004);
insert into movie values(1005,'TENET','2016-12-7','drama',2005,3005,9,4005);
insert into movie values(1006,'ASCHARYA','2014-12-7','epic',2006,3006,7,4006);
insert into movie values(1007,'MASTER','2015-12-7','history',2007,3007,9,4007);
select * from movie;
select title from movie;
select title from movie where release_date<>'2016-12-7'and '2018-12-7';
select title from movie where genre='history'or director_id in(2003,2005);
select title from movie where not genre='history';
drop table songs;
create table songs(
movie_id INT  ,
song_name VARCHAR(45),
singer VARCHAR(45),
song_composer VARCHAR(45),foreign key(movie_id)references movie(movie_id));
select movie_id,title from movie where genre=(select genre  like 'h%');




