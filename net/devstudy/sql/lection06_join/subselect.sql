SELECT cat.name as category, c.first_name, c.middle_name, c.last_name, c.age FROM contact c, category cat WHERE c.id_category=cat.id;
SELECT (SELECT name from category cat where cat.id = c.id_category) as category, c.first_name, c.middle_name, c.last_name, c.age FROM contact c;
SELECT cv.value FROM contact_value cv WHEREcv.id_contact = (SELECT id FROM contact WHERE age=20);
SELECT cv.value FROM contact_value cv WHERE cv.id_contact IN (SELECT id FROM contact WHERE age<>20);
SELECT c.first_name, c.middle_name, c.last_name, c.age FROM contact c WHERE c.age > (SELECT avg(age) FROM contact);