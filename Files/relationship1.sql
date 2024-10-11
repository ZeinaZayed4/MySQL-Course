CREATE DATABASE store CHARACTER SET utf8 COLLATE utf8_general_ci;

USE store;

CREATE TABLE users (
	user_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(72) NOT NULL,
    last_login DATETIME
);

DESCRIBE users;

ALTER TABLE users ADD COLUMN privilage TINYINT(1) DEFAULT 2;

CREATE TABLE user_profiles (
	profile_id INT UNSIGNED NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20),
    facebook_url VARCHAR(100),
    image VARCHAR(150),
    gender ENUM ('male', 'female') NOT NULL,
    address VARCHAR(100),
    CONSTRAINT fk_profile_id FOREIGN KEY (profile_id) REFERENCES users (user_id)
);

DESCRIBE user_profiles;
