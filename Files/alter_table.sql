USE company;

DESCRIBE employees;

ALTER TABLE employees ADD COLUMN phone VARCHAR(12) AFTER address;
DESCRIBE employees;

ALTER TABLE employees MODIFY COLUMN position VARCHAR(15) NOT NULL;
DESCRIBE employees;

ALTER TABLE employees ADD COLUMN code CHAR(20);
ALTER TABLE employees CHANGE COLUMN code sec_code CHAR(30) NOT NULL;

ALTER TABLE employees ADD COLUMN dummy TEXT;
ALTER TABLE employees DROP COLUMN dummy;

DESCRIBE employees;