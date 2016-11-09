SELECT * FROM person p INNER JOIN city c ON p.id_city = c.id;
(SELECT * FROM person p, city c WHERE p.id_city = c.id);

SELECT * FROM person p CROSS JOIN city c;
(SELECT * FROM person p, city c);

SELECT * FROM person p LEFT OUTER JOIN city c ON p.id_city = c.id;
(SELECT * FROM person p, city c WHERE p.id_city = c.id UNION
SELECT p.*, NULL as id, NULL as city_name FROM person p WHERE id_city NOT IN (SELECT id FROM city));

SELECT * FROM person p LEFT OUTER JOIN city c ON p.id_city = c.id WHERE c.id IS NULL;
(SELECT p.*, NULL as id, NULL as city_name FROM person p WHERE id_city NOT IN (SELECT id FROM city));

SELECT * FROM person p RIGHT OUTER JOIN city c ON p.id_city = c.id;
(SELECT * FROM person p, city c WHERE p.id_city = c.id UNION
SELECT NULL as name, NULL as id_city, c.* FROM city c WHERE id NOT IN (SELECT id_city FROM person));

SELECT * FROM person p FULL OUTER JOIN city c ON p.id_city = c.id;
(SELECT * FROM person p, city c WHERE p.id_city = c.id UNION
SELECT p.*, NULL as id, NULL as city_name FROM person p WHERE id_city NOT IN (SELECT id FROM city) UNION
SELECT NULL as name, NULL as id_city, c.* FROM city c WHERE id NOT IN (SELECT id_city FROM person));

SELECT * FROM person p FULL OUTER JOIN city c ON p.id_city = c.id WHERE c.id IS NULL OR p.id_city IS NULL;
SELECT p.*, NULL as id, NULL as city_name FROM person p WHERE id_city NOT IN (SELECT id FROM city) UNION
SELECT NULL as name, NULL as id_city, c.* FROM city c WHERE id NOT IN (SELECT id_city FROM person);

SELECT cat.* FROM category cat LEFT OUTER JOIN contact c ON cat.id = c.id_category WHERE c.id_category IS NULL;
SELECT * FROM category WHERE id NOT IN (SELECT id_category FROM contact);

SELECT DISTINCT cat.* FROM category cat, contact c WHERE cat.id = c.id_category;
SELECT DISTINCT cat.* FROM category cat INNER JOIN contact c ON cat.id = c.id_category;
SELECT DISTINCT cat.* FROM category cat CROSS JOIN contact c WHERE cat.id = c.id_category;
SELECT * FROM category WHERE id IN (SELECT id_category FROM contact);