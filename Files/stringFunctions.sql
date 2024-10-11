SELECT BIT_LENGTH(username) FROM users;

SELECT CHAR_LENGTH(username) FROM users;

SELECT * FROM users
WHERE CHAR_LENGTH(username) > 5;

SELECT CHAR_LENGTH('زينة');

SELECT CONCAT(username, last_login)
FROM users;

SELECT CONCAT_WS(' ','Name:', username, 'Last login:', last_login)
FROM users;

SELECT ELT(1, 'Sherouk', 'Kholoud', 'Ohoud');

SELECT FIELD('Zeina', 'Sherouk', 'Kholoud', 'Ohoud', 'Zeina');

SELECT TO_BASE64('Zeina');

SELECT FROM_BASE64('WmVpbmE=');

SELECT INSTR('football', 'ball');

SELECT LOWER('ZEINA');

SELECT UPPER('zeina');