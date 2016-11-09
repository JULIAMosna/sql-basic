INSERT INTO contact VALUES (0, 1, 'Дмитрий', 'Дмитриевич', 'Дмитров', 22, now(), NULL, TRUE);
INSERT INTO contact VALUES (nextval('contact_seq'), 1, 'Илья', 'Ильич', 'Ильин', 22, now(), NULL, TRUE);
INSERT INTO contact VALUES (nextval('contact_seq'), 1, 'Дмитрий', 'Дмитриевич', 'Дмитров', 19, '10/26/2016 11:12:01 AM'::TIMESTAMPTZ, NULL, TRUE);
INSERT INTO contact (id, id_category, first_name, middle_name, last_name) VALUES (nextval('contact_seq'), 1, 'Дмитрий', 'Дмитриевич', 'Дмитров');
INSERT INTO contact VALUES (nextval('contact_seq'), 1, 'Дмитрий', 'Дмитриевич', 'Дмитров', DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO contact (id, id_category, first_name, middle_name, last_name) VALUES
	(nextval('contact_seq'), 1, 'Дмитрий', 'Дмитриевич', 'Дмитров'),
	(nextval('contact_seq'), 1, 'Василий', 'Васильевич', 'Васильев'),
	(nextval('contact_seq'), 1, 'Анатолий', 'Анатольевич', 'Анатольев');

UPDATE contact SET id_category = 2 WHERE id > 3;
UPDATE contact SET id_category = 2, updated = now(), active = false WHERE id > 3;
UPDATE contact SET created = DEFAULT, updated = now(), active = false WHERE id > 3;
UPDATE contact SET first_name = UPPER(first_name), middle_name = UPPER(middle_name),last_name = UPPER(last_name) WHERE id > 3;

DELETE FROM contact WHERE id > 3;