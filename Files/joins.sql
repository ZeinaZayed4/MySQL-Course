DROP DATABASE test;

CREATE DATABASE test
CHARACTER SET utf8 
COLLATE utf8_general_ci;

USE test;

CREATE TABLE students (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    course_id INT UNSIGNED NOT NULL
);

CREATE TABLE courses(
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL
);

INSERT INTO courses 
SET title = 'Web Design';
INSERT INTO courses 
SET title = 'Web Develoment';
INSERT INTO courses 
SET title = 'HTML5 Technical Preview';
INSERT INTO courses 
SET title = 'CSS3 Beyond the Basics';
INSERT INTO courses 
SET title = 'JavaScript, An Introduction';

SELECT * FROM courses;

INSERT INTO students
SET name = 'Zeina Zayed', course_id = 3;

ALTER TABLE students
ADD CONSTRAINT fk_course_id
FOREIGN KEY (course_id)
REFERENCES courses(id);

INSERT INTO students
SET name = 'Sherouk Zayed', course_id = 2;

INSERT INTO students
SET name = 'Kholoud Zayed', course_id = 1;

ALTER TABLE students 
MODIFY course_id INT UNSIGNED;

INSERT INTO students
SET name = 'Ohoud Zayed', course_id = 4;

INSERT INTO students 
SET name = 'Hana Atef';

SELECT * FROM students;

SELECT students.*, courses.title 
FROM students
INNER JOIN courses
ON students.course_id = courses.id;

SELECT students.id, students.name, courses.title 
FROM students
INNER JOIN courses
ON students.course_id = courses.id;

SELECT students.id, students.name, courses.title 
FROM students
LEFT JOIN courses
ON students.course_id = courses.id;

SELECT students.id, students.name, courses.title 
FROM students
RIGHT JOIN courses
ON students.course_id = courses.id;