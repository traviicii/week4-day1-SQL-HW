--// 1. How many actors are there with the last name ‘Wahlberg’?

-- two actors (listed)
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- two actors (counted)
SELECT COUNT(first_name)
FROM actor
WHERE last_name = 'Wahlberg';

--// 2. How many payments were made between $3.99 and $5.99?

-- There are none that I can find, but I believe this would be the code to find them
SELECT amount
FROM payment
WHERE amount >= 3.99 AND amount <= 5.99;

SELECT COUNT(amount)
FROM payment
WHERE amount >= 3.99 AND amount <= 5.99;

--// 3. What film does the store have the most of? (search in inventory)

SELECT film_id
FROM inventory, film;

--// 4. How many customers have the last name ‘William’?

-- 0 although there is one with the last name Williams (listed)
SELECT first_name, last_name
FROM customer
WHERE last_name = 'Williams';

-- (counted)
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'Williams';

--// 5. What store employee (get the id) sold the most rentals?

--correct solution, 
-- Employee #2 made the most sales
SELECT COUNT(DISTINCT payment_id), staff_id
FROM payment
GROUP BY staff_id

-- previously incorrect solution
-- SELECT COUNT(staff_id), staff_id
-- FROM payment
-- GROUP BY staff_id;

--// 6. How many different district names are there?

-- Counted 378 distinct districts
SELECT count(DISTINCT district)
FROM address;

-- Displayed each distinct district in alphabetical order
SELECT DISTINCT district
FROM address
ORDER BY district ASC;


--// 7. What film has the most actors in it? (use film_actor table and get film_id)

-- film #508 has the most actors, with 15 actors
SELECT DISTINCT film_id, count(DISTINCT actor_id) AS number_of_actors
FROM film_actor
GROUP BY film_id
ORDER BY count(DISTINCT actor_id) DESC;

--// 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

-- There are 13 cutomers from store_id 1 with last names ending in 'es', shown
SELECT store_id, customer_id, last_name
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-- counted
SELECT count(last_name)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';


--// 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--// with ids between 380 and 430? (use group by and having > 250)

SELECT *
FROM payment

-- *********
SELECT COUNT(amount)
FROM payment
WHERE rental_id > 250
GROUP BY customer_id >= 380 and customer_id <= 430
--ORDER BY SUM(amount) DESC;

--// 10. Within the film table, how many rating categories are there? And what rating has the most
--// movies total?

-- shows count of how many distinct rating categories there are
SELECT count(DISTINCT rating)
FROM film;

-- show each of the 5 distinct rating categories available
SELECT DISTINCT rating
FROM film

-- number of films per rating
SELECT rating, count(title) AS num_of_films
FROM film
GROUP BY rating
ORDER BY count(DISTINCT title) DESC;