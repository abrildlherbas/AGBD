SELECT * FROM crime_scene_report
WHERE type = "murder" AND city like "sql city" AND date = 20180115

SELECT * FROM person
WHERE name like "Annabel%" AND address_street_name like "Franklin Ave"

SELECT * FROM person
WHERE address_street_name like "Northwestern Dr" order by address_number desc limit 1
 id	name	license_id	address_number	address_street_name	ssn
 14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949

 