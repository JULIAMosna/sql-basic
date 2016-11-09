--
-- Structure for table city (OID = 17058) : 
--
CREATE TABLE public.city (
    id integer NOT NULL,
    city_name varchar(10) NOT NULL
)
WITH (oids = false);
--
-- Structure for table person (OID = 17061) : 
--
CREATE TABLE public.person (
    name varchar(10) NOT NULL,
    id_city integer
)
WITH (oids = false);

--
-- Data for table public.city (OID = 17058) (LIMIT 0,3)
--
INSERT INTO city (id, city_name)
VALUES (2, 'Киев');

INSERT INTO city (id, city_name)
VALUES (1, 'Харьков');

INSERT INTO city (id, city_name)
VALUES (3, 'Одесса');

--
-- Data for table public.person (OID = 17061) (LIMIT 0,4)
--
INSERT INTO person (name, id_city)
VALUES ('Иван', 1);

INSERT INTO person (name, id_city)
VALUES ('Сергей', 2);

INSERT INTO person (name, id_city)
VALUES ('Николай', 1);

INSERT INTO person (name, id_city)
VALUES ('Дмитрий', 4);

--
-- Definition for index person_pkey (OID = 17064) : 
--
ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey
    PRIMARY KEY (name);
--
-- Definition for index city_pkey (OID = 17066) : 
--
ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey
    PRIMARY KEY (id);