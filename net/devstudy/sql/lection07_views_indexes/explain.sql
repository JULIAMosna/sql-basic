CREATE TABLE test (id integer, value text);
INSERT INTO test
SELECT i, md5(random()::text)
FROM generate_series(1, 2000000) AS i;

SELECT * FROM test WHERE id = 500;

SELECT * FROM test WHERE id = 500;

ANALYZE test;
EXPLAIN SELECT * FROM test WHERE id = 500;
EXPLAIN ANALYZE SELECT * FROM test WHERE id = 500;
EXPLAIN ANALYZE SELECT * FROM test WHERE id > 500;
EXPLAIN ANALYZE SELECT * FROM test WHERE id < 500;

ANALYZE contact;
ANALYZE contact_value;
EXPLAIN ANALYZE SELECT * FROM contact WHERE age = 20;
EXPLAIN ANALYZE SELECT * FROM contact c, contact_value cv WHERE c.id =
cv.id_contact AND cv.id_contact = 2;