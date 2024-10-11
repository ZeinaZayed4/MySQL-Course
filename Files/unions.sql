USE store;

CREATE TABLE mailing_list (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE subscriber LIKE mailing_list;

ALTER TABLE subscriber 
ADD COLUMN name VARCHAR(50) NOT NULL AFTER id;

RENAME TABLE subscriber TO subscribers;

INSERT INTO mailing_list 
SET email = 'zeina@gmail.com';
INSERT INTO mailing_list 
SET email = 'zeina1@gmail.com';
INSERT INTO mailing_list 
SET email = 'zeina2@gmail.com';
INSERT INTO mailing_list 
SET email = 'zeina3@gmail.com';

INSERT INTO subscribers 
SET name = 'Ohoud',
	email = 'ohoud@gmail.com';
INSERT INTO subscribers 
SET name = 'Ohoud1',
	email = 'ohoud1@gmail.com';
INSERT INTO subscribers 
SET name = 'Ohoud2',
	email = 'ohoud2@gmail.com';
INSERT INTO subscribers 
SET name = 'Ohoud3',
	email = 'ohoud3@gmail.com';
    
SELECT * FROM mailing_list;
SELECT * FROM subscribers;

SELECT email FROM mailing_list 
UNION SELECT email FROM subscribers;