USE store;

SELECT * FROM `users`;

INSERT INTO `users2` SELECT * FROM `users` 
ON DUPLICATE KEY UPDATE username = 'Zeina';
SELECT * FROM `users2`;

DELETE FROM `users2` WHERE user_id = 7;
DELETE FROM `users` WHERE user_id = 7;

INSERT INTO `users` SET username = 'Hana', password = md5('123456'), last_login = NOW();
INSERT INTO `users` SET username = 'Safa', password = md5('123456'), last_login = NOW();
INSERT INTO `users` SET username = 'Adam', password = md5('123456'), last_login = NOW();
INSERT INTO `users` SET username = 'Taim', password = md5('123456'), last_login = NOW();

SELECT * FROM `users`;
SELECT * FROM `users2`;	