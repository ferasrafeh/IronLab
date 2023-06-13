USE sakila;

#1
SELECT count(film_category.film_id) AS nb_of_films ,category.name
FROM film_category 
JOIN category 
ON film_category.category_id = category.category_id
GROUP BY category.name;

#2
SELECT store.store_id, city.city, country.country
FROM store
JOIN address
ON store.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id;

#3
SELECT store.store_id, sum(payment.amount) AS Total_Revenue 
FROM store
JOIN staff
ON store.store_id = staff.store_id
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;

#4
SELECT cat.name,avg(film.length) AS avg_length
FROM film
JOIN film_category as fcat
ON fcat.film_id = film.film_id
JOIN category as cat
ON cat.category_id = fcat.category_id
GROUP BY cat.name;

#5
SELECT cat.name AS Categories_Top5_Longest
FROM film
JOIN film_category as fcat
ON fcat.film_id = film.film_id
JOIN category as cat
ON cat.category_id = fcat.category_id
GROUP BY cat.name
ORDER BY avg(film.length) DESC
LIMIT 5;

#6
SELECT title
FROM film AS f
JOIN inventory AS inv
ON f.film_id = inv.film_id
JOIN rental as r
ON inv.inventory_id = r.inventory_id
GROUP BY inv.film_id
ORDER BY count(inv.film_id) DESC
LIMIT 10;

#7
SELECT * 
from inventory
JOIN film
ON film.film_id = inventory.film_id
WHERE film.title="Academy Dinosaur" AND inventory.store_id = 1;
 
# Yes it can be rented from Store 1.
