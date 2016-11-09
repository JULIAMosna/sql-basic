-- SQL Manager Lite for PostgreSQL 5.8.0.48154
-- ---------------------------------------
-- Host      : localhost
-- Database  : devstudy
-- Version   : PostgreSQL 9.5.5, compiled by Visual C++ build 1800, 64-bit



SET check_function_bodies = false;
--
-- Structure for table category (OID = 16395) : 
--
CREATE TABLE category (
    id smallint NOT NULL,
    name varchar(30) NOT NULL,
    active boolean DEFAULT true NOT NULL
)
WITH (oids = false);
--
-- Structure for table contact_type (OID = 16401) : 
--
CREATE TABLE contact_type (
    id smallint NOT NULL,
    name varchar(20) NOT NULL,
    protocol varchar(10) NOT NULL,
    active boolean DEFAULT true NOT NULL
)
WITH (oids = false);
--
-- Structure for table contact (OID = 16407) : 
--
CREATE TABLE contact (
    id integer NOT NULL,
    id_category smallint NOT NULL,
    first_name varchar(50) NOT NULL,
    middle_name varchar(50),
    last_name varchar(50) NOT NULL,
    age smallint NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated timestamp(0) without time zone,
    active boolean DEFAULT true NOT NULL
)
WITH (oids = false);
--
-- Structure for table contact_value (OID = 16414) : 
--
CREATE TABLE contact_value (
    id integer NOT NULL,
    id_contact integer NOT NULL,
    id_contact_type smallint NOT NULL,
    value varchar(100) NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL,
    updated timestamp(0) without time zone,
    active boolean DEFAULT true NOT NULL
)
WITH (oids = false);
--
-- Data for table public.category (OID = 16395) (LIMIT 0,2)
--
INSERT INTO category (id, name, active)
VALUES (2, 'Коллеги', true);

INSERT INTO category (id, name, active)
VALUES (1, 'Друзья', true);

--
-- Data for table public.contact_type (OID = 16401) (LIMIT 0,4)
--
INSERT INTO contact_type (id, name, protocol, active)
VALUES (1, 'Mobile Phone', 'tel:', true);

INSERT INTO contact_type (id, name, protocol, active)
VALUES (2, 'Phone', 'tel:', true);

INSERT INTO contact_type (id, name, protocol, active)
VALUES (3, 'Email', 'email:', true);

INSERT INTO contact_type (id, name, protocol, active)
VALUES (4, 'Skype', 'skype:', true);

--
-- Data for table public.contact (OID = 16407) (LIMIT 0,4)
--
INSERT INTO contact (id, id_category, first_name, middle_name, last_name, age, created, updated, active)
VALUES (1, 1, 'Иван', 'Иванович', 'Иванов', 20, '2016-11-09 16:02:07', NULL, true);

INSERT INTO contact (id, id_category, first_name, middle_name, last_name, age, created, updated, active)
VALUES (2, 1, 'Петр', NULL, 'Петров', 18, '2016-11-09 16:02:27', NULL, true);

INSERT INTO contact (id, id_category, first_name, middle_name, last_name, age, created, updated, active)
VALUES (3, 2, 'Ирина', 'Викторовна', 'Николаева', 22, '2016-11-09 16:02:50', NULL, true);

INSERT INTO contact (id, id_category, first_name, middle_name, last_name, age, created, updated, active)
VALUES (4, 2, 'Иван', 'Иванович', 'Иванов', 24, '2016-11-09 16:03:55', NULL, true);

--
-- Data for table public.contact_value (OID = 16414) (LIMIT 0,7)
--
INSERT INTO contact_value (id, id_contact, id_contact_type, value, created, updated, active)
VALUES (1, 1, 1, '+38(050) 123-45-67', '2016-11-09 16:05:47', NULL, true);

INSERT INTO contact_value (id, id_contact, id_contact_type, value, created, updated, active)
VALUES (2, 1, 3, 'ivanov@gmail.com', '2016-11-09 16:06:08', NULL, true);

INSERT INTO contact_value (id, id_contact, id_contact_type, value, created, updated, active)
VALUES (3, 1, 4, 'ivan.ivanov', '2016-11-09 16:06:30', NULL, true);

INSERT INTO contact_value (id, id_contact, id_contact_type, value, created, updated, active)
VALUES (4, 2, 1, '+38(066) 159-35-87', '2016-11-09 16:06:47', NULL, true);

INSERT INTO contact_value (id, id_contact, id_contact_type, value, created, updated, active)
VALUES (5, 3, 2, '365-69-69', '2016-11-09 16:07:09', NULL, true);

INSERT INTO contact_value (id, id_contact, id_contact_type, value, created, updated, active)
VALUES (6, 3, 1, '+38(063) 122-22-33', '2016-11-09 16:07:29', NULL, true);

INSERT INTO contact_value (id, id_contact, id_contact_type, value, created, updated, active)
VALUES (7, 3, 4, 'irina.nikolaeva', '2016-11-09 16:07:54', NULL, true);

--
-- Definition for index category_pkey (OID = 16399) : 
--
ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey
    PRIMARY KEY (id);
--
-- Definition for index contact_type_pkey (OID = 16405) : 
--
ALTER TABLE ONLY contact_type
    ADD CONSTRAINT contact_type_pkey
    PRIMARY KEY (id);
--
-- Definition for index contact_pkey (OID = 16412) : 
--
ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey
    PRIMARY KEY (id);
--
-- Definition for index contact_value_pkey (OID = 16419) : 
--
ALTER TABLE ONLY contact_value
    ADD CONSTRAINT contact_value_pkey
    PRIMARY KEY (id);
--
-- Definition for index contact_value_fk (OID = 16426) : 
--
ALTER TABLE ONLY contact_value
    ADD CONSTRAINT contact_value_fk
    FOREIGN KEY (id_contact_type) REFERENCES contact_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;
--
-- Definition for index contact_value_fk1 (OID = 16431) : 
--
ALTER TABLE ONLY contact_value
    ADD CONSTRAINT contact_value_fk1
    FOREIGN KEY (id_contact) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index contact_fk (OID = 16436) : 
--
ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_fk
    FOREIGN KEY (id_category) REFERENCES category(id) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Comments
--
