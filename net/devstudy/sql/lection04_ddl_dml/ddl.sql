CREATE TABLE test (
id INTEGER NOT NULL,
id_category SMALLINT NOT NULL,
first_name VARCHAR(50) NOT NULL,
middle_name VARCHAR(50),
last_name VARCHAR(50) NOT NULL,
age SMALLINT DEFAULT 20 NOT NULL,
created TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT now() NOT NULL,
updated TIMESTAMP(0) WITHOUT TIME ZONE,
active BOOLEAN DEFAULT true NOT NULL,
CONSTRAINT test_pkey PRIMARY KEY(id),
CONSTRAINT test_fk FOREIGN KEY (id_category)
REFERENCES category(id)
ON DELETE RESTRICT
ON UPDATE CASCADE
NOT DEFERRABLE
)
WITH (oids = false);

ALTER TABLE test ADD COLUMN address varchar(30);
ALTER TABLE test RENAME COLUMN address TO city;
ALTER TABLE test DROP COLUMN city RESTRICT;
ALTER TABLE test RENAME TO suppliers;

DROP TABLE suppliers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS suppliers CASCADE;
DROP TABLE suppliers CASCADE;