# 1.1
SELECT max(length) AS max_duration, min(length) AS min_duration
FROM film;

#1.2
SELECT floor(avg(length)/60) AS Avg_Hours , floor(avg(length)%60) AS Avg_Minutes
FROM film;

#2.1
SELECT DATEDIFF(max(rental_date),min(rental_date)) AS days_company_operating
FROM rental;

#2.2
SELECT *, monthname(rental_date) AS Rental_Month, dayname(rental_date) as Rental_Weekday
FROM rental
LIMIT 20;

#2.3
SELECT *, 
CASE 
WHEN dayname(rental_date) IN ("Saturday","Sunday") THEN "weekend"
ELSE "workday"
END AS DAY_TYPE
FROM rental;

#3
SELECT title, coalesce(rental_duration,"Not available") AS Rental_Duration
FROM film
ORDER BY title;

#4
select concat(first_name," ",last_name) AS Customer_Name, LEFT(email,3) AS Email
FROM customer
ORDER BY last_name;

# Challenge 2

#1.1
select count(film_id) AS Nb_films_released
FROM film;

#1.2
select count(film_id) AS Nb_films, rating
FROM film
GROUP BY rating;

#1.3
select count(film_id) AS Nb_films, rating
FROM film
GROUP BY rating
ORDER BY count(film_id) DESC;

#2
SELECT staff_id, count(rental_id) AS Count
FROM rental
GROUP BY staff_id;

#3.1
SELECT rating, round(avg(length),2)
FROM film
GROUP BY rating 
ORDER BY avg(length) DESC;

#3.2
SELECT rating, round(avg(length),2)
FROM film
GROUP BY rating 
HAVING avg(length)>120;

#4
SELECT last_name
FROM actor
GROUP BY last_name
HAVING count(last_name)=1;