SELECT * FROM users
WHERE user_id = 6;

SELECT username, password
from users
WHERE user_id > 6;

SELECT * FROM users
WHERE user_id > 6 and user_id < 9;

SELECT * FROM users
WHERE user_id = 3 + 5;

SELECT * FROM users
WHERE user_id % 5 = 0;

SELECT * FROM users
WHERE user_id BETWEEN 6 AND 10;

SELECT GREATEST(1, 2, 3, 4, 6, 8, 2);

SELECT * FROM users
WHERE user_id IN (5, 8, 10);

SELECT * FROM users
WHERE user_id NOT IN (5, 8, 10);

ALTER TABLE user_profiles
MODIFY gender ENUM('male', 'female')
DEFAULT 'male' not null;

INSERT INTO user_profiles
SET profile_id = 2,
	first_name = 'Ohoud',
	gender = 'female',
	address = 'Mansoura';

SELECT * FROM user_profiles;

INSERT INTO user_profiles
SET profile_id = 5,
	first_name = 'Sherouk',
	gender = 'female',
	address = 'Mansoura';

SELECT * FROM user_profiles
WHERE last_name IS NULL;

INSERT INTO user_profiles
SET profile_id = 6,
	first_name = 'Kholoud',
	last_name = 'Zayed',
	gender = 'female',
	address = 'Mansoura';

SELECT * FROM user_profiles
WHERE last_name IS NOT NULL;

SELECT * FROM user_profiles
WHERE last_name IS UNKNOWN;

SELECT * FROM user_profiles
WHERE last_name IS FALSE;

UPDATE user_profiles
SET facebook_url = 0
WHERE profile_id = 2;

SELECT * FROM user_profiles
WHERE facebook_url IS FALSE;

SELECT * FROM user_profiles
WHERE first_name LIKE '%oh%';