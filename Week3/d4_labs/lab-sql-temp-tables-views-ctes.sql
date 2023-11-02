/*
In this exercise, you will create a customer summary report that summarizes key information about customers in the Sakila database, 
including their rental history and payment details. 
The report will be generated using a combination of views, CTEs, and temporary tables.
*/
USE sakila;
/*
Step 1: Create a View
First, create a view that summarizes rental information for each customer. 
The view should include the customer's ID, name, email address, and total number of rentals (rental_count).
*/
DROP VIEW customer_info;

CREATE VIEW customer_info AS
SELECT customer.customer_id, CONCAT(first_name,' ', last_name) AS `name`, email, COUNT(rental_id) AS total_number_rentals
FROM customer, rental
GROUP BY customer_id
;
SELECT * FROM customer_info LIMIT 10; -- checking if it worked
/*
Step 2: Create a Temporary Table
Next, create a Temporary Table that calculates the total amount paid by each customer (total_paid). 
The Temporary Table should use the rental summary view created in Step 1 to join with the payment table and calculate the total amount paid by each customer.
*/
DROP TABLE cus_total_paid;

CREATE TEMPORARY TABLE cus_total_paid AS
SELECT customer_info.customer_id, SUM(amount) AS total_paid
FROM payment, customer_info
GROUP BY customer_info.customer_id
;

SELECT * FROM cus_total_paid LIMIT 10; -- checking if it worked

/*
Step 3: Create a CTE and the Customer Summary Report
Create a CTE that joins the rental summary View with the customer payment summary Temporary Table created in Step 2. 
The CTE should include the customer's name, email address, rental count, and total amount paid.
*/

/*
Next, using the CTE, create the query to generate the final customer summary report, which should include: 
customer name, email, rental_count, total_paid and average_payment_per_rental, 
this last column is a derived column from total_paid and rental_count.
*/

WITH csr AS (
SELECT ci.customer_id, ci.`name`, ci.email, ci.total_number_rentals AS rental_count, ctp.total_paid
FROM customer_info ci, cus_total_paid ctp

)
SELECT `name`, email, rental_count, total_paid, (total_paid / rental_count) AS average_payment_per_rental
FROM csr
GROUP BY `name`
LIMIT 10
;
