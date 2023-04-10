USE sakila;
/*
In the table actor, which are the actors whose last names are not repeated? 
For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
These three actors have the same last name. So we do not want to include this last name in our output. 
Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
*/
SELECT DISTINCT SUBSTR(last_name,1)  AS last_name
FROM actor
WHERE last_name NOT LIKE 'Arkoyd%'
GROUP BY last_name;

-- Which last names appear more than once?
SELECT SUBSTR(last_name, 1) AS last_name, COUNT(*) as count
FROM actor
GROUP BY last_name
ORDER BY count DESC;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(*) AS rental_count
FROM rental
GROUP BY staff_id;

-- Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(*) AS count
FROM film
GROUP BY release_year
ORDER BY release_year ASC;

-- Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(*) AS count
FROM film
GROUP BY rating
ORDER BY count DESC;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, ROUND(AVG(length), 2) AS avg_length
FROM film
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?

SELECT f.rating, AVG(f.length) AS avg_duration
FROM film f
GROUP BY f.rating
HAVING AVG(f.length) > 120
ORDER BY f.rating;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT title, length
FROM film
WHERE length IS NOT NULL AND length > 0
ORDER BY length DESC;
