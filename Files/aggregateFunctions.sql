CREATE TABLE expenses_types(
	id TINYINT(2) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(50) NOT NULL
);

CREATE TABLE expenses_transactions(
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	expense_type TINYINT(2) UNSIGNED NOT NULL,
	description VARCHAR(100) NOT NULL,
	created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	amount DECIMAL(5, 2) NOT NULL,
	CONSTRAINT fk_expense_type FOREIGN KEY (expense_type) REFERENCES expenses_types (id)
);

INSERT INTO expenses_types SET type = 'Electricity Fee';
INSERT INTO expenses_types SET type = 'Water Fee';
INSERT INTO expenses_types SET type = 'Home Fee';
INSERT INTO expenses_types SET type = 'Phone Bill';
INSERT INTO expenses_types SET type = 'Mobile Bill';
INSERT INTO expenses_types SET type = 'Beverages';

SELECT * FROM expenses_types;

INSERT INTO expenses_transactions
SET expense_type = 1,
	description = 'This is the electricity bill of the current month',
	amount = 34.25;
INSERT INTO expenses_transactions
SET expense_type = 1,
	description = 'The bill was at a high rate this month',
	amount = 102.56;
INSERT INTO expenses_transactions
SET expense_type = 1,
	description = 'I have complained against the service',
	amount = 27.50;

UPDATE expenses_transactions
SET created = 20160123215038
WHERE id = 1;

UPDATE expenses_transactions
SET created = 20160329215038
WHERE id = 3;

SELECT * FROM expenses_transactions;

INSERT INTO expenses_transactions
SET expense_type = 2,
	description = 'The bill is reasonable after all',
	amount = 30.98,
	created = 20160111120000;
INSERT INTO expenses_transactions
SET expense_type = 2,
	description = 'The bill is at high rate this month',
	amount = 75.61,
	created = 20160212120000;
INSERT INTO expenses_transactions
SET expense_type = 2,
	description = 'I was discussing some situation with my neighbour',
	amount = 25.71,
	created = 20160311131250;

SELECT AVG(amount) FROM expenses_transactions
WHERE expense_type = 1;

SELECT expense_type, AVG(amount) FROM expenses_transactions
GROUP BY expense_type;

SELECT expense_type, SUM(amount) FROM expenses_transactions
GROUP BY expense_type;

SELECT expense_type, AVG(amount) FROM expenses_transactions
WHERE created BETWEEN 20160101 AND 20160301
GROUP BY expense_type;

SELECT expense_type, COUNT(amount)
FROM expenses_transactions
WHERE expense_type = 1;

SELECT expense_type,
       SUM(amount),
	   GROUP_CONCAT(description SEPARATOR ' | ')
FROM expenses_transactions
GROUP BY expense_type;
