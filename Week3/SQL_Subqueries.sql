USE sakila;
#1
SELECT title, COUNT(*) AS 'Number of Copies'
FROM film 
JOIN inventory USING (film_id)
WHERE title = 'Hunchback Impossible';

#2
SELECT title
FROM film
WHERE length > (SELECT AVG(length) FROM film);

#3 

SELECT actor.first_name,actor.last_name
FROM actor
WHERE actor_id IN 
(SELECT film_actor.actor_id 
FROM film_actor 
WHERE film_id = 
(SELECT film_id
FROM film 
WHERE title = "Alone Trip"));

#4
SELECT title
FROM film
WHERE film_id IN 
(SELECT film_id
FROM film_category
WHERE category_id IN
(SELECT category_id 
FROM category 
WHERE name = "Family"));

#5
SELECT first_name,last_name,email
FROM customer
WHERE address_id IN
(SELECT address_id 
FROM address
WHERE city_id IN
(SELECT city_id
FROM city
JOIN country USING (country_id)
WHERE country="Canada"));

#6
SELECT film.title
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id = 
(SELECT actor_id
FROM film_actor
GROUP BY actor_id
ORDER BY count(actor_id) DESC
LIMIT 1);

#7
SELECT film.title
FROM film
JOIN inventory USING(film_id)
JOIN rental USING (inventory_id)
JOIN customer USING (customer_id)
WHERE customer.customer_id =
(SELECT customer.customer_id
FROM customer
JOIN payment USING(customer_id)
GROUP BY customer_id
ORDER BY sum(payment.amount) DESC
LIMIT 1);

#8
SELECT payment.customer_id,sum(payment.amount) AS "Amount Spent"
FROM payment
GROUP BY payment.customer_id
HAVING sum(payment.amount) > 
(SELECT avg(customer_total)
FROM 	(
			SELECT sum(amount) as customer_total 
            FROM payment 
            GROUP BY customer_id
            ) AS a
);

