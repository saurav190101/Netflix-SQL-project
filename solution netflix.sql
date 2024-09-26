 create table netflix (
 show_id varchar(10),	
type varchar (10),
title varchar(105 ),
director varchar(208),
casts varchar(750),
country varchar(150),
date_added varchar(50),
release_year int,
rating varchar(10),
duration	varchar(20),
listed_in varchar(79),
description varchar(250)
);

select count(*) from netflix
alter table netflix
alter column casts type varchar(800);

--15 Business problems Easy to Advance .

1.Select all records where the type is ‘Movie’.

select *
from netflix
where type = 'Movie'

2.Select all records where the rating is ‘TV-MA’.
 
 select *
 from netflix 
 where rating ='TV-MA'


3.Count the number of Movies vs TV Shows.
  Select 
    type ,count(title)
      from netflix 
    group by type;


4.List all TV shows with more than 5 seasons.

select title , duration 
from netflix 
where type ='TV Show' and duration = '5 seasons'


5.Group the records by country and count the number of entries for each country.

Select country ,count(country)
from netflix 
group by country

6.Select all records and order them by release_year in descending order

select * 
from netflix
order by release_year desc;


7.Count the Number of Content Items in Each Genre.

select count(title)as no_of_content, 
listed_in from 
netflix group by listed_in ;


8.List All Movies that are Documentaries

select title ,listed_in 
from netflix 
where listed_in='Documentaries'

9.Find each year and the average numbers of content release in India on netflix.

select extract( year from TO_DATE(date_added,'month-dd-yyy'))
as year ,count(*)as total_content,
count(*) /  (select COUNT(*) from netflix where country = 'India') *100
as average_content
from netflix
group by year
order by year desc


10.List Titles with the Longest Descriptions.

select title ,description from netflix
 order by  length(description )desc
limit 1


11.Identify the Most Frequent Director.

select distinct director,count(*) 
from netflix where director is not null
group by director 
order by count desc
limit 1


12.Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years.


select *
from netflix 
where casts like '%Salman Khan%'
and release_year > extract (year from current_date) -10


13.Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India.

select
unnest (string_to_array(casts,',')) as actors,
count(*)
from netflix
where country = 'India'
group  by 1
order by count desc 
limit 10;


14.Find All Content Without a Director.

select * 
from netflix
where director is null

15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.

with cte as (
select *,
     case
	     when description ilike '%kill%' or description ilike '%violence%' then 'A_rated'
		 else 'U/A_rated' end  as category
		 from netflix
		 )
		select category ,count(*)  from cte
		group by category


	


  
