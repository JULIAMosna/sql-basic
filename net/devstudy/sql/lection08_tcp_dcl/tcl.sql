CREATE TABLE account (
    id integer NOT NULL,
    name varchar(30) NOT NULL,
    balance integer NOT NULL
)
WITH (oids = false);

INSERT INTO account (id, name, balance)
VALUES (2, 'Петров Петр Петрович', 20);

INSERT INTO account (id, name, balance)
VALUES (1, 'Иванов Иван Иванович', 30);

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey
    PRIMARY KEY (id);
    
/*SET AUTOCOMMIT TO FALSE*/ 
UPDATE account SET balance = balance + 10 WHERE id = 1;
UPDATE account SET balance = balance - 10 WHERE id = 2;
ROLLBACK;
/*SET AUTOCOMMIT TO FALSE*/
UPDATE account SET balance = balance + 10 WHERE id = 1;
UPDATE account SET balance = balance - 10 WHERE id = 2;
COMMIT;
/*SET AUTOCOMMIT TO FALSE*/
UPDATE account SET balance = balance + 10 WHERE id = 1;
SAVEPOINT sp_name;
UPDATE account SET balance = balance - 10 WHERE id = 2;
ROLLBACK TO SAVEPOINT sp_name;
COMMIT;

INSERT INTO account VALUES (3, 'Тест', 10000);
UPDATE account SET balance = balance - 10 WHERE id = 3;
DELETE FROM account WHERE id=3;
COMMIT;
INSERT INTO account VALUES (3, 'Тест', 10000);
INSERT INTO account VALUES (4, 'Тест', 10000);
SAVEPOINT test;
INSERT INTO account VALUES (5, 'Тест', 10000);
UPDATE account SET balance = balance - 10 WHERE id = 3;
DELETE FROM account WHERE id=3;
ROLLBACK TO SAVEPOINT test;
COMMIT;
DELETE FROM account;
TRUNCATE account;