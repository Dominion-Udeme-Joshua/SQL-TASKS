--Retrieve all unique customer first names from the customer table.
SELECT DISTINCT first_name 
FROM customer
ORDER BY first_name asc;

--Find the top 5 customers who have spent the most money.
SELECT customer_id, amount
FROM payment 
ORDER BY amount desc
LIMIT 5;

--List all films with a rental rate greater than 4.00.
SELECT *
FROM film
WHERE rental_rate > 4.00
ORDER BY title asc;

--Count the number of payments per customer and display only customers with more than 15 payments.
SELECT customer_id, COUNT(payment_id) as nos_of_payments
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) > 15
ORDER BY nos_of_payments;

--Retrieve the first 10 films alphabetically using FETCH.
SELECT *
FROM film
ORDER BY title asc
FETCH FIRST 10 ROW ONLY;

--Find the total amount paid per staff member.
SELECT staff_id, SUM(amount) as total_amount
FROM payment
GROUP BY staff_id
ORDER BY total_amount desc;

--List customers whose email ends with .org.
SELECT *
FROM customer
WHERE email LIKE '%.org'
ORDER BY first_name;


--Using DISTINCT ON, retrieve the latest payment record per customer.
SELECT DISTINCT ON (customer_id) customer_id, amount, payment_date
FROM payment
ORDER BY customer_id, payment_date desc;

--Display the average payment amount per customer, ordered from highest to lowest.
SELECT customer_id, round(AVG(amount),2) as avg_amount
FROM payment
GROUP BY customer_id
ORDER BY avg_amount desc;

--Retrieve all payments made between $2.99 and $5.99.
SELECT *
FROM payment
WHERE amount BETWEEN 2.99 AND 5.99
ORDER BY amount;
