USE sakila;

# 1
SHOW TABLES;
# 2
SELECT * 
FROM actor;
SELECT *
FROM film;
SELECT *
FROM customer;

#3
SELECT title
FROM film;

SELECT DISTINCT(NAME) AS language
FROM language;

SELECT first_name 
FROM staff;

#4
SELECT DISTINCT(release_year) AS unique_release_years
FROM film;

#5
SELECT count(store_id) AS Number_of_Stores
FROM store;

SELECT count(staff_id) AS Number_of_Employees
FROM staff;

#5.3
SELECT count(rental.rental_id) AS nb_films_rented, count(DISTINCT inventory_id) AS available
FROM rental;

#5.4
SELECT count(DISTINCT(last_name)) 
FROM ACTOR;

#6
SELECT *
FROM film
ORDER BY length DESC
LIMIT 10;

#7
SELECT *
FROM actor
WHERE first_name = "SCARLETT";

SELECT *
FROM film
WHERE title LIKE "%ARMAGEDDON%" AND length>100;

SELECT count(film_id) 
FROM film
WHERE special_features LIKE "%behind the scenes";