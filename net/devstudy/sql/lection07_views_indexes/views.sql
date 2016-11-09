CREATE VIEW contact_info AS
SELECT cat.name as category, c.first_name,
c.middle_name, c.last_name, c.age, ct.protocol, ct.name
as contact_type, cv.value FROM contact c, contact_value
cv, category cat, contact_type ct WHERE
c.id_category=cat.id AND cv.id_contact = c.id AND
cv.id_contact_type = ct.id;

SELECT * FROM contact_info;
SELECT * FROM contact_info WHERE age = 20;
SELECT age, count(*) AS cnt FROM contact_info GROUP BY age ORDER BY cnt DESC;

CREATE MATERIALIZED VIEW contact_info2 AS
SELECT cat.name as category, c.first_name, c.middle_name,
c.last_name, c.age, ct.protocol, ct.name as contact_type, cv.value
FROM contact c, contact_value cv, category cat, contact_type ct
WHERE c.id_category=cat.id AND cv.id_contact = c.id AND
cv.id_contact_type = ct.id;

SELECT * FROM contact_info2;
SELECT * FROM contact_info2 WHERE age = 20;
SELECT age, count(*) AS cnt FROM contact_info2 GROUP BY age ORDER BY cnt DESC;

INSERT INTO contact_value VALUES (nextval('contact_value_seq'), 3, 4, 'skype2', now(), NULL, true);
SELECT * FROM contact_info;
SELECT * FROM contact_info WHERE age = 20;
SELECT age, count(*) AS cnt FROM contact_info GROUP BY age ORDER BY cnt DESC;
SELECT * FROM contact_info2;
SELECT * FROM contact_info2 WHERE age = 20;
SELECT age, count(*) AS cnt FROM contact_info2 GROUP BY age ORDER BY cnt DESC;

REFRESH MATERIALIZED VIEW contact_info2;

DROP VIEW contact_info;
DROP MATERIALIZED VIEW contact_info2;