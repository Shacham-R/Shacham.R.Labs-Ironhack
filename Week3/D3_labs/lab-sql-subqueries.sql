USE sakila;

-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT COUNT(film_id) AS copies
FROM inventory
WHERE film_id = (SELECT film_id
							  FROM film
							  WHERE title = "Hunchback Impossible")
;
-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT title, length
FROM film
WHERE length > (SELECT AVG(length)
								FROM film)					
;
-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".

-- Finding the id of the given film
SELECT film_id 
FROM film
WHERE title = "Alone Trip"
;
-- Finding the ids of actors who appeared in a given film id
SELECT actor_id
FROM film_actor
WHERE film_id = 17
;
-- All together now
SELECT first_name, last_name, actor_id
FROM actor
WHERE actor_id IN (SELECT actor_id
								FROM film_actor
								WHERE film_id = (	SELECT film_id 
																FROM film
																WHERE title = "Alone Trip")
								)
;

-- 4. Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films.

-- Getting the category id of familiy
SELECT category_id
FROM category
WHERE name = "Family"
;
-- Getting the category id of a given film id
SELECT film_id
FROM film_category
WHERE category_id = 8
;

-- All together now

SELECT title
FROM film
WHERE film_id IN (SELECT film_id
								FROM film_category
								WHERE category_id =   (SELECT category_id
																		FROM category
																		WHERE name = "Family")
                                )
;

-- 5. Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins, you will need to identify the relevant tables and their primary and foreign keys.

-- 6. Determine which films were starred by the most prolific actor in the Sakila database. A prolific actor is defined as the actor who has acted in the most number of films. First, you will need to find the most prolific actor and then use that actor_id to find the different films that he or she starred in.

-- 7. Find the films rented by the most profitable customer in the Sakila database. You can use the customer and payment tables to find the most profitable customer, i.e., the customer who has made the largest sum of payments.
SELECT customer_id , SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id
HAVING total_amount > (SELECT AVG(total_amount_spent)
										FROM  (SELECT SUM(amount) AS total_amout_spent -- TODO finish it
                                        
                                        )
)
;

SELECT AVG(SUM(amount))
FROM payment
;


;
-- 8. Retrieve the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client. You can use subqueries to accomplish this.




