USE sakila;

#STEP 1

CREATE VIEW rental_summary AS
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, c.email, COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

#STEP 2

CREATE TEMPORARY TABLE total_paid AS
SELECT rs.customer_id, SUM(p.amount) AS total_amount_paid
FROM rental_summary rs
JOIN payment p ON rs.customer_id = p.customer_id
GROUP BY rs.customer_id;

#STEP 3

WITH customer_summary AS 
(
  SELECT rs.customer_name, rs.email, rs.rental_count, tp.total_amount_paid
  FROM rental_summary rs
  JOIN total_paid tp ON rs.customer_id = tp.customer_id
)

SELECT customer_name, email, rental_count, total_amount_paid, total_amount_paid / rental_count AS average_payment_per_rental
FROM customer_summary;