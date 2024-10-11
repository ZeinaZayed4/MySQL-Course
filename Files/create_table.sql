CREATE DATABASE IF NOT EXISTS company CHARACTER SET utf8 COLLATE utf8_general_ci;

USE company;

CREATE TABLE employess (
	emp_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	dob DATE NOT NULL,
    address VARCHAR(50) NOT NULL,
    salary DECIMAL(7, 2) DEFAULT 1500.00,
    gender ENUM('Male', 'Female') NOT NULL DEFAULT 'Male',
    position VARCHAR(20) NOT NULL,
    serial_num CHAR(30) NOT NULL
);

ALTER TABLE employess RENAME employees;
SHOW TABLES;
DESCRIBE employees;

CREATE TABLE salary_transactions (
	rec_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    emp_id SMALLINT UNSIGNED NOT NULL,
    paid_salary DECIMAL(7, 2) NOT NULL,
	last_updated TIMESTAMP NOT NULL,
    applied_salary DECIMAL(3, 2)
);
SHOW TABLES;
DESCRIBE salary_transactions;

CREATE TABLE emp_reports (
	rec_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    emp_id SMALLINT UNSIGNED NOT NULL,
    content TEXT CHARACTER SET latin1 NOT NULL,
    created DATETIME DEFAULT NOW(),
    last_updated TIMESTAMP NOT NULL
);

CREATE TABLE fax_copies (
	rec_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    emp_id SMALLINT UNSIGNED NOT NULL,
	scan_copy BLOB NOT NULL
);

CREATE TABLE company_customers (
	customer_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,
    address VARCHAR(50) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    phone_number VARCHAR(10)
);

SHOW TABLES;
SHOW CREATE TABLE emp_reports;

CREATE TABLE emp_reports_min LIKE emp_reports;
SHOW TABLES;
SHOW CREATE TABLE emp_reports_min;
