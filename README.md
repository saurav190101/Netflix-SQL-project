# Netflix movies series and TV shows Data Analyst project

![netfix logo](https://github.com/saurav190101/Netflix-SQL-project/blob/main/download.jpeg)

overview

These projects involve analysis Netflix TV shows,web series, and movie data using SQL. 
The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

Objectives

.Analyze most preferred tv shows and movies
.Explore Actors who have appeared in the highest number of movies produced in India.
.Analyze content based on release years, countries, and durations.

Dataset from Kaggle

link :https://www.kaggle.com/datasets/rahulvyasm/netflix-movies-and-tv-shows

Schema


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




