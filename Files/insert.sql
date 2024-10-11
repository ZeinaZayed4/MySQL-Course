USE store;

SHOW TABLES;
DESCRIBE users;

INSERT INTO users (username, password, last_login, privilage)
VALUES ('Zeina', md5('Hello'), NOW(), 1);

SELECT * FROM users;

INSERT INTO `users` 
SET username = 'Ohoud',
	password = MD5('welcome'),
    last_login = NOW(),
    privilage = 2;
    
ALTER TABLE `users` MODIFY username VARCHAR(30) NOT NULL UNIQUE;

INSERT INTO `users` 
SET username = 'Zeina',
	password = MD5('123456')
ON DUPLICATE KEY UPDATE 
	username = CONCAT(username, 2);
    
CREATE TABLE `users2` LIKE `users`;

INSERT INTO `users2`
SELECT * FROM `users`
WHERE user_id = 1;	

SELECT * FROM `users2`;