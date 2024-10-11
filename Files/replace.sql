USE store;

TRUNCATE TABLE `users2`;
SELECT * FROM `users2`;

INSERT INTO `users` 
SET username = 'Sherouk',
	password = MD5('Hello'),
    last_login = NOW(),
    privilage = 2;

INSERT INTO `users` 
SET username = 'Kholoud',
	password = MD5('Welocme'),
    last_login = NOW(),
    privilage = 1;

REPLACE INTO `users`
SET username = 'Hana',
	password = MD5('Hello'),
    last_login = NOW(),
    privilage = 2;

SELECT * FROM `users`;

REPLACE INTO `users`
SET username = 'Zeina2',
	password = MD5('123456'),
    last_login = NOW();
    
REPLACE INTO `users2`
SELECT * FROM `users`
WHERE user_id = 8; 

SELECT * FROM `users2`;

REPLACE INTO `users2` 
SET username = 'Zeina2',
	password = md5('123456');
    
SELECT * FROM `users2`;

UPDATE `users2` 
SET username = 'Zeina',
	last_login = NOW()
WHERE user_id = 9;

UPDATE `users` 
SET username = 'Zeina',
	last_login = NOW()
WHERE user_id = 8;

SELECT * FROM `users`;

UPDATE `users2`, `users` 
SET users2.password = users.password
WHERE users.user_id = 8;