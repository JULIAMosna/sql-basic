SELECT * FROM contact;
SELECT * FROM contact WHERE id = 1;
SELECT * FROM contact WHERE id < 3;
SELECT id, last_name, first_name, middle_name FROM contact;
SELECT id, last_name, first_name, middle_name FROM contact WHERE id = 1;
SELECT id, last_name, first_name, middle_name FROM contact WHERE id < 1;
SELECT first_name, last_name, middle_name FROM contact;
SELECT DISTINCT first_name, last_name, middle_name FROM contact;
SELECT first_name, last_name AS surname, 'Hello' AS txt, age + 100 AS age1, age > 18 AS adult FROM contact;
SELECT last_name || ' ' || first_name || ' ' || middle_name as fio, length(last_name) as last_length, pow(age, 2) FROM contact;
SELECT 2+2;
SELECT exp(2);
SELECT sqrt(2);
SELECT last_name || ' ' || first_name || ' ' || middle_name as fio, length(last_name) as last_length, pow(age, 2) FROM contact;
SELECT age(now(), timestamp '1990-08-24');
SELECT date_trunc('hour', now());
SELECT date_trunc('year', now());
SELECT date_trunc('hour', now()), power(2, 8), random(), repeat('Hello', 3) FROM contact;

create table copy as select * from contact;
SELECT * FROM contact UNION SELECT * FROM copy;
SELECT * FROM contact INTERSECT SELECT * FROM copy;
SELECT * FROM contact EXCEPT SELECT * FROM copy;

SELECT * FROM contact WHERE id > 0;
SELECT * FROM contact WHERE id = 1;
SELECT * FROM contact WHERE id <> 1;
SELECT * FROM contact WHERE age < 30;
SELECT * FROM contact WHERE id > 0 AND id < 3;
SELECT * FROM contact WHERE id > 0 AND NOT id < 3;
SELECT * FROM contact WHERE id >=3 OR id <= 1;
SELECT * FROM contact WHERE NOT (id >=3 OR id <= 1);
SELECT * FROM contact WHERE age BETWEEN 18 AND 20;
SELECT * FROM contact WHERE first_name = 'Иван';
SELECT * FROM contact WHERE created < now();
SELECT * FROM contact WHERE updated IS NULL;
SELECT * FROM contact WHERE updated IS NOT NULL;
SELECT * FROM contact WHERE first_name LIKE 'И%';
SELECT * FROM contact WHERE first_name LIKE '_ри%';
SELECT * FROM contact WHERE first_name ILIKE 'и%';
SELECT * FROM contact WHERE id IN (1, 3, 4, 6);

SELECT count(id) FROM contact;
SELECT sum(age) FROM contact;
SELECT avg(age) FROM contact;
SELECT max(first_name) FROM contact;
SELECT min(first_name) FROM contact;
SELECT count(*) FROM contact;
SELECT count(DISTINCT first_name) FROM contact;

SELECT count(*) FROM contact;
SELECT count(*) FROM contact GROUP BY first_name;
SELECT first_name, count(*) FROM contact GROUP BY first_name;
SELECT first_name, age, count(*) FROM contact GROUP BY first_name, age;

SELECT first_name, count(*) FROM contact GROUP BY first_name HAVING count(*) > 1;
SELECT first_name, count(*) FROM contact GROUP BY first_name HAVING first_name LIKE 'И%';
SELECT first_name, count(*) FROM contact WHERE first_name LIKE 'И%' GROUP BY first_name;

SELECT * FROM contact;
SELECT * FROM contact ORDER BY last_name;
SELECT * FROM contact ORDER BY last_name ASC;
SELECT * FROM contact ORDER BY last_name DESC;
SELECT * FROM contact ORDER BY last_name, first_name, middle_name;
SELECT * FROM contact ORDER BY last_name, first_name DESC, middle_name DESC;
SELECT first_name, count(*) as cnt FROM contact GROUP BY first_name ORDER BY cnt DESC;
SELECT * FROM contact ORDER BY middle_name;
SELECT * FROM contact ORDER BY middle_name NULLS FIRST;
SELECT * FROM contact ORDER BY middle_name NULLS LAST;

SELECT * FROM contact LIMIT 2;
SELECT * FROM contact LIMIT 2 OFFSET 2;

SELECT * FROM contact c, contact_value cv, category cat, contact_type ct;
SELECT cat.name as category, c.first_name, c.middle_name, c.last_name, c.age,
	ct.protocol, ct.name as contact_type, cv.value FROM contact c, contact_value cv,
	category cat, contact_type ct WHERE c.id_category=cat.id AND cv.id_contact =
	c.id AND cv.id_contact_type = ct.id;

SELECT c1.id, c2.id FROM contact c1, contact c2 WHERE c1.first_name = c2.first_name AND c1.age <> c2.age;

SELECT
	cat.name as category, c.age, count(*) as cnt
	FROM contact c, contact_value cv, category cat, contact_type ct
	WHERE c.id_category=cat.id AND cv.id_contact = c.id
	GROUP BY category, age
	HAVING count(*) > 4
	ORDER BY cnt ASC, category DESC
	LIMIT 1
	OFFSET 1;