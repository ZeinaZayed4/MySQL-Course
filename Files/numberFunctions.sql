CREATE DATABASE learning
CHARACTER SET utf8
COLLATE utf8_general_ci;

USE learning;

CREATE TABLE nfunctions (
	num INT SIGNED NOT NULL
);

INSERT INTO nfunctions SET num = -23;
INSERT INTO nfunctions SET num = -18;
INSERT INTO nfunctions SET num = -3.64;
INSERT INTO nfunctions SET num = 12.64;
INSERT INTO nfunctions SET num = 5.6;
INSERT INTO nfunctions SET num = 5.4;

SELECT * FROM nfunctions;

SELECT ABS(num) FROM nfunctions;

ALTER TABLE nfunctions
MODIFY num DECIMAL(7, 3) SIGNED NOT NULL;

TRUNCATE TABLE nfunctions;

INSERT INTO nfunctions SET num = -23;
INSERT INTO nfunctions SET num = -18;
INSERT INTO nfunctions SET num = -3.64;
INSERT INTO nfunctions SET num = 12.64;
INSERT INTO nfunctions SET num = 5.6;
INSERT INTO nfunctions SET num = 5.4;

SELECT ABS(num) FROM nfunctions;

SELECT CEIL(num) FROM nfunctions;

SELECT num + 2 FROM nfunctions;

SELECT PI();

SELECT POW(12, 2);

SELECT FLOOR(num) FROM nfunctions;

SELECT ROUND(num) FROM nfunctions;

SELECT SQRT(16);