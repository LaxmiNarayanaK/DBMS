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
select * from movie;
select * from movie order by date1;
set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select * from movie group by genre having rating >7;
select avg(rating) from movie where left(date1,4)=2020;
select * from movie where title like 't%';
create table songs(film_id int,song_name varchar(50),singer varchar(45),composer varchar(50),foreign key(film_id) references movie(film_id));
insert into songs values(1,'vaathi coming','anirudh','anirudh');
insert into songs values(2,'hello','haricharan','anup rubens');
insert into songs values(3,'holy','justin beiber','justin beiber');
insert into songs values(4,'memories','vineeth','sudhu');
insert into songs values(1,'shape of you','ed sheran','ed sheran');
select  movie.film_id,movie.title from movie where movie.film_id in
												(select songs.film_id from songs where songs.singer='anirudh');
select * from songs where songs.film_id in
									(select movie.film_id from movie where movie.genre='action');
select concat(m.title,",", s.song_name,",", s.singer) as song_details from songs s, movie m where m.film_id in( select m.film_id where m.film_id=s.film_id and m.title in(select m.title where m.title="Master"));select concat(m.title,",", s.song_name,",", s.singer,",",composer) as artist_involved_in_action_movies from songs s, movies1 m where m.movie_id in(select m.movie_id where m.movie_id=s.movie_id and m.genre in(select m.genre where m.genre="Action"));
select concat(m.title,",", s.song_name,",", s.singer,",",composer) as artist_involved_in_action_movies from songs s, movie m where m.film_id in
																			(select m.film_id where m.film_id=s.film_id and m.genre in
																												(select m.genre where m.genre="Action");
                                                                                                                