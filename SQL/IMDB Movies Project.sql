use project_movie_database;
show tables;
describe directors;
describe movies;

-- Question A:Can you get all data about movies?
select*from movies;

-- Question B:How do you get all data about directors?
select*from directors;

-- Question C:Check how many movies are present in IMBD.
select count(*) as Totalmovies
from movies;

-- Question D:Find these 3 directors: James Cameron; Luc Besson; John Woo.
select*from directors
where name in ('James Cameron','Luc Besson','John Woo');

-- Question E:Find all directors with name starting with S.
select*from directors
where name like 's%';

-- Question F:Count female directors
select count(*) as Femaledirectors from directors
where gender='female';

-- Question G:Find the name of the 10th  first women directors.
select name from directors
where gender='female'
order by name asc
limit 1 offset 9;

-- Question H:What are the 3 most popular movies?
select original_title,popularity from movies
order by popularity desc
limit 3;

-- Question I:What are the 3 most bankable movies?
select original_title,revenue from movies
order by revenue desc
limit 3;

-- Question J:What is the most awarded average vote since the January 1st,2000?
select original_title,vote_average,release_date from movies
where release_date>='2000-01-01'
order by vote_average desc
limit 1;

-- Question K:Which movie(s) were directed by Brenda Chapman?
select d.name,m.original_title
from directors d join movies m
on d.id=m.director_id
where name like 'Brenda Chapman';

-- Question L:Which director made the most movies?
select d.name,count(m.id) as total_movies
from directors d join movies m
on d.id=m.director_id
group by d.id,d.name
order by total_movies desc
limit 1;

-- Question M::Which director is the most bankable?
select d.name,sum(m.revenue) as total_revenue
from directors d join movies m
on d.id=m.director_id
group by d.id,d.name
order by total_revenue desc
limit 1;


