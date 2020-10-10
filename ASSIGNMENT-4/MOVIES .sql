show databases;
create database movies;
use movies;
create table movie(film_id int primary key,title varchar(45),date1 date,genre varchar(45),rating float);
insert into movie values(1,'pushpa','2021-07-21','action',8);
insert into movie values(2,'acharya','2021-05-10','drama',9);
insert into movie values(3,'RRR','2022-04-01','action/drama',9.5);
insert into movie values(4,'master','2021-01-05','romance',8);
insert into movie values(5,'Tenet','2020-09-01','action',7.5);
insert into movie values(6,'Trance','2020-07-12','methodological',8);
create table songs(film_id int,song_name varchar(50),singer varchar(45),composer varchar(50),foreign key(film_id) references movie(film_id));
insert into songs values(1,'vaathi coming','anirudh','anirudh');
insert into songs values(2,'hello','haricharan','anup rubens');
insert into songs values(3,'holy','justin beiber','justin beiber');
insert into songs values(4,'memories','vineeth','sudhu');
insert into songs values(1,'shape of you','ed sheran','ed sheran');
select * from movie;
select * from songs;
create table direction(director_id int primary key,
director_name varchar(25) not null ,
numofmovies int not null, numofhits int,
 numofflops int,film_id int not null,foreign key(film_id) references movie(film_id));
insert into direction values(135,'gautham',25,19,6,2);
insert into direction values(121,'rajamouli',16,10,6,4);
insert into direction values(143,'trivikram',12,8,4,3);
insert into direction values(130,'sukumar',7,5,2,1);
insert into direction values(122,'shankar',20,16,4,6);
insert into direction values(168,'shiva',14,8,6,5);

select film_id,title from movie where rating>
(select avg(rating) from movie where genre= 
(select genre from movie where movie.film_id=1))and 
genre= (select genre from movie where movie.film_id=1);

select song_name,singer from songs where songs.film_id in 
(select direction.film_id from direction where numofflops=
(select min(numofflops) from direction));
use movies;
select * from movie order by date1;
set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select * from movie group by genre having rating >7;
select avg(rating) from movie where left(date1,4)=2020;
select count(film_id) from movie where rating>7;
select * from movie where title like 't%';
select film_id,title from movie where film_id in
(select film_id from songs where singer='anirudh');
select * from songs where songs.film_id in
(select movie.film_id from movie where movie.genre='action');
select film_id,title from movie where rating>
(select avg(rating) from movie where genre= 
(select genre from movie where movie.film_id=1))and 
genre= (select genre from movie where movie.film_id=1);

select song_name,singer from songs where songs.film_id in 
(select direction.film_id from direction where numofflops=
(select min(numofflops) from direction));







create database movies1;
drop database movies1;
show databases;
create database movies1;
use movies1;
create table movie(
film_id int primary key,
title varchar(45),
date1 date,
genre varchar(45),
rating float);

create table songs(film_id int,
song_name varchar(50),
singer varchar(45),
composer varchar(50),
foreign key(film_id) references movie(film_id));

create table movie_duplicate as select film_id,title,date1,genre from movie;
drop table movie_duplicate;
desc movie;
show tables;
insert into movie values(1,'pushpa','2021-07-21','action',8);
insert into movie values(2,'acharya','2021-05-10','drama',9);
insert into movie values(3,'RRR','2022-04-01','action/drama',9.5);
insert into movie values(4,'master','2021-01-05','romance',8);
insert into movie values(5,'Tenet','2020-09-01','action',7.5);
insert into movie values(6,'Trance','2020-07-12','methodological',8);
select * from direction;
select title from movie where genre='action'and rating > 7;
select film_id,title from movie where genre ='action' or date1= '2021-01-05';
select title from movie where not genre='drama';
select film_id,title from movie where genre=(select genre like 'a%');










                                                                                                                