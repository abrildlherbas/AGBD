select * from film
SELECT * FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN store s ON  s.store_id = i.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.address_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id

WHERE f.title = "ALLEY EVOLUTION"

ejercicio 2:

SELECT title, length, f.rating, c.name, l.name FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON c.category_id = fc.category_id
INNER JOIN language l ON l.language_id = f.language_id
WHERE length BETWEEN 60 AND 120

ejercicio 3: 
SELECT s.first_name,s.last_name,a.address,c.city ,co.country FROM staff s 
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id= c.city_id
INNER JOIN country co ON c.country_id = co.country_id
