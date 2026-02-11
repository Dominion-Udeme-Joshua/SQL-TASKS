--DAY 04 ASSIGNMENT: PostgreSQL JOINS (dvdrental)
--Q1: List all customers along with their total payment amount
SELECT c.first_name || ' ' || c.last_name as full_name, SUM(p.amount) as total_amount
FROM customer as c
LEFT JOIN payment as p
ON c.customer_id = p.customer_id
GROUP BY full_name
ORDER BY total_amount;

--Q2: Retrieve the top 10 customers by total amount spent.
SELECT c.first_name || ' ' || c.last_name as full_name, SUM(p.amount) as total_amount
FROM customer as c
LEFT JOIN payment as p
ON c.customer_id = p.customer_id
GROUP BY full_name
ORDER BY total_amount DESC;

--Q3: Display all films and their corresponding categories.
SELECT f.title as film, c_a.name as film_category, f.description 
FROM film as f
LEFT JOIN film_category as f_c
	ON f.film_id = f_c.film_id
LEFT JOIN category as c_a
	ON f_c.category_id = c_a.category_id 
ORDER BY f.title;

--Q4: Find the number of rentals made by each customer.
SELECT c.first_name || ' ' || c.last_name as full_name,  COUNT(r.rental_id) as total_rentals
FROM customer as c
LEFT JOIN rental as r
	ON c.customer_id = r.customer_id 
GROUP BY full_name
ORDER BY full_name, total_rentals;

--Q5: List customers who have never made a payment.
SELECT c.first_name || ' ' || c.last_name as full_name, p.amount
FROM customer as c
LEFT JOIN payment as p
	ON c.customer_id = p.customer_id
WHERE p.amount = '0'
ORDER BY full_name;

--Q6: Show total revenue generated per store.
SELECT s_o.address_id as store , s_a.first_name || ' ' || s_a.last_name as full_name, SUM(p.amount) as total_revenue
FROM payment as p
INNER JOIN staff as s_a
	ON p.staff_id = s_a.staff_id
INNER JOIN store as s_o
	ON s_o.store_id = s_a.store_id
GROUP BY store, full_name
ORDER BY total_revenue;

--Q7: Identify the top 5 most rented movies.
SELECT  f.title as film_title, COUNT(r.rental_id) as rental_count
FROM film as f
INNER JOIN inventory as i
	ON f.film_id = i.film_id
FULL OUTER JOIN rental as r
	ON i.inventory_id = r.inventory_id
GROUP BY film_title
ORDER BY rental_count DESC;

--Q8 (BONUS): Find customers who rented more than 30 films.
SELECT  c.first_name || ' ' || c.last_name as full_name, COUNT(r.rental_id) as rental_count
FROM customer as c
LEFT JOIN rental as r
	ON c.customer_id = r.customer_id
GROUP BY full_name
HAVING COUNT(r.rental_id) > '30'
ORDER BY rental_count;