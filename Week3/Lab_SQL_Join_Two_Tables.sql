USE sakila;

#1
SELECT film_actor.actor_id,actor.first_name,actor.last_name,count(film_id)
FROM film_actor
JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor_id, actor.first_name,actor.last_name
ORDER BY count(film_id) DESC
LIMIT 1;

#2
SELECT customer.first_name,customer.last_name,count(rental_id)
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
GROUP BY rental.customer_id
ORDER BY count(rental_id) DESC
LIMIT 1;

#3
SELECT category.name,count(film_id)
FROM category
JOIN film_category on category.category_id = film_category.category_id
GROUP BY name;

#4
SELECT staff.first_name,staff.last_name,address.address
FROM staff
JOIN address on staff.address_id = address.address_id;

#5
SELECT film.title, language.name
FROM film
JOIN language ON film.language_id = language.language_id
WHERE (language.name = "English" OR language.name = "italian") AND film.title LIKE 'M%'
ORDER BY film.title DESC;

#6
SELECT staff.first_name,staff.last_name,sum(payment.amount) AS SUM 
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
WHERE monthname(payment.payment_date)="August" AND year(payment.payment_date)=2005
GROUP BY staff.staff_id
ORDER BY sum(payment.amount) DESC;

#7
SELECT film.title, count(film_actor.actor_id) AS nb_of_actors
FROM film
JOIN film_actor ON film_actor.film_id = film.film_id
GROUP BY film.film_id
ORDER BY count(film_actor.actor_id) DESC
LIMIT 10;

#8
SELECT customer.first_name,customer.last_name, sum(payment.amount) AS total_amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY customer.last_name
LIMIT 10;

#9
SELECT actor.first_name,actor.last_name,count(film_actor.film_id) AS Nb_films_acted
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
HAVING count(film_actor.film_id)=0;

## OR

SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id
WHERE film_actor.actor_id IS NULL;

#10
SELECT address
FROM address
WHERE address_id NOT IN (SELECT address_id FROM customer) AND address LIKE "%e";

## OR 

SELECT address
FROM address
LEFT JOIN customer ON address.address_id = customer.address_id
WHERE customer.customer_id IS NULL AND address.address LIKE '%e';


#OPTIONAL
SELECT title
FROM film AS f
JOIN inventory AS inv
ON f.film_id = inv.film_id
JOIN rental as r
ON inv.inventory_id = r.inventory_id
GROUP BY inv.film_id
ORDER BY count(inv.film_id) DESC
LIMIT 1;


 
