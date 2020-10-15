show databases;
drop  database movies1;
use  movies;
alter table movie add (director_id int,producer_id int,actor_id int);
show tables;
select * from movie;
update movie set producer_id=501,actor_id=1001 where film_id=1;
update movie set director_id=135,producer_id=502,actor_id=1002 where film_id=2;
update movie set director_id=143,producer_id=503,actor_id=1003 where film_id=3;
update movie set director_id=121,producer_id=504,actor_id=1004 where film_id=4;
update movie set director_id=168,producer_id=505,actor_id=1005 where film_id=5;
update movie set director_id=122,producer_id=506,actor_id=1006 where film_id=6;
select * from movie;
create table production(producer_id int primary key,
producer_name  varchar(50) not null ,
production_company varchar(50) not null,
budget int not null);
insert into production values(501,'karthick','lyca',100000);
insert into production values(502,'laxminarayana','sitara',150000);
insert into production values(503,'vineeth','universal pictures',200000);
insert into production values(504,'raghavan','sony pictures',250000);
insert into production values(505,'aditya','dreamworks',300000);
insert into production values(506,'lokesh','miramax',350000);
alter table movie add foreign key(producer_id) references production(producer_id);
drop table direction;
create table direction( director_id int primary key,
 director_name varchar(45) not null, 
 noofhits int ,
 noofflops int,
 noofmovies int as (noofhits + noofflops));
 insert into direction(director_id,director_name,noofhits,noofflops)
 values(101,'rajamouli',16,4);
  insert into direction(director_id,director_name,noofhits,noofflops)
 values(135,'sukumar',9,2);
 insert into direction(director_id,director_name,noofhits,noofflops)
 values(143,'trivikram',11,3);
  insert into direction(director_id,director_name,noofhits,noofflops)
 values(121,'shankar',7,2);
  insert into direction(director_id,director_name,noofhits,noofflops)
 values(168,'mrmax',13,5);
  insert into direction(director_id,director_name,noofhits,noofflops)
 values(122,'atli',5,1);
 select * from direction;
 alter table movie add constraint fk_producer_id foreign key(producer_id) references production(producer_id);
 alter table movie add constraint fk_director_id foreign key(director_id) references direction(director_id);
create table actors(actor_id int primary key,
actor_name varchar(50) not null,
typeofrole varchar(50) not null,
character_name varchar(50) not null);
insert into actors values(1001,'prabhas','hero','bahu');
insert into actors values(1002,'anushka','heroine','bagamathi');
insert into actors values(1003,'raviteja','villain','raju');
insert into actors values(1004,'brahmanandhan','comedian','brahmi');
insert into actors values(1005,'alluarjun','hero','lucky');
insert into actors values(1006,'mahesbabu','hero','pokiri');
drop table actors;
alter table movie add constraint fk_actor_id foreign key(actor_id) references actors(actor_id);
desc movie;
use movies;
select m.title,m.genre,m.rating,d.director_name,d.noofmovies 
from movie m inner join direction d
on m.director_id=d.director_id where noofhits>8;
select * from actors;
select m.title,p.producer_name,m.genre,m.rating
from movie m inner join production p
on m.producer_id = p.producer_id where
p.budget =(select max(budget) from production);

select * from production;
select title,actor_name,director_name,producer_name 
from (((movie inner join actors on movie.actor_id=actors.actor_id and actors.actor_name like 'a%')
inner join direction on movie.director_id= direction.director_id )
inner join production on movie.producer_id= production.producer_id);
select distinct* from production;
insert into movie values(7,'bahubali','2018-12-07','history',8.5,143,502,1004);
use movies;
delete from movie where film_id=7;
insert into actors values(1007,'tamanna','heroine','karti');
insert into actors values(1008,'bharat','comedian','jilebi');
select  actor_name,typeofrole,title,genre
from actors left join movie 
on actors.actor_id = movie.actor_id order by actor_name;

select title,producer_name,director_name
from movie left join production on 
movie.producer_id = production.producer_id and budget> 180000
left join direction on 
movie.director_id=direction.director_id and noofmovies > 10;

insert into songs values(1,'rava rava','sandeep','anu');
insert into songs values(1,'karthiiii','hemanth','mohan');

select distinct title, song_name,actor_name,director_name
from(((movie left outer join songs on 
movie.film_id=songs.film_id and songs.film_id =1)
left outer join actors on movie.actor_id=actors.actor_id)
left outer join direction on movie.director_id=direction.director_id);

insert into production values(507,'gireesh','vimbar','220000');
insert into production values(508,'chaitanya','yashu','190000');
select producer_name,production_company,budget,title from 
movie right join production on production.producer_id= movie.producer_id
and budget between 150000 and 300000;

select * from movie;
select title,actor_name,typeofrole,producer_name from 
((movie right join actors on actors.actor_id = movie.actor_id and typeofrole = 'hero' )
right join production on movie.producer_id = production.producer_id);

select distinct title,song_name,actor_name,director_name,producer_name 
from(((( movie right outer join songs on movie.film_id=songs.film_id )
right outer join actors on movie.actor_id=actors.actor_id )
right outer join direction on direction.director_id = movie.director_id and genre in ('action','drama'))
right outer join production on production.producer_id= movie.producer_id);
















 
 


