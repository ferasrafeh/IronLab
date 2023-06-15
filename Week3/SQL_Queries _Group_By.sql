USE sakila;

#1
SELECT last_name
FROM actor
GROUP BY last_name
HAVING count(last_name)=1;

#2
SELECT last_name
FROM actor
GROUP BY last_name
HAVING count(last_name)>1;

#3
SELECT staff_id, count(rental_id)
FROM rental
GROUP BY staff_id;

#4
SELECT rating,count(film_id)
FROM film
GROUP  BY rating;

#5
SELECT rating, round(avg(length),2)
FROM film
GROUP BY rating;

#6
SELECT rating
FROM film
GROUP BY rating
HAVING avg(length)>120;
