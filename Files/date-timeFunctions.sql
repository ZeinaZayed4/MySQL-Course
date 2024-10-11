SELECT NOW();

SELECT ADDDATE('2024-09-10', INTERVAL 1 YEAR);

SELECT ADDDATE('2024-09-10 5:56:40', INTERVAL '1 4' DAY_HOUR);

SELECT ADDTIME('06:00:00', '1:12:13');

SELECT CURDATE();

SELECT CURTIME();

SELECT DATE(20241010);

SELECT TIME(060400);

SELECT DATE(NOW());

SELECT DATE_SUB('2025-10-10', INTERVAL 1 YEAR);

CREATE TABLE dfunctions (
	start_date DATE NOT NULL,
	end_date DATE NOT NULL
);

INSERT INTO dfunctions
SET start_date = 20251010,
	end_date = 20251012;

INSERT INTO dfunctions
SET start_date = NOW(),
	end_date = ADDDATE(NOW(), INTERVAL 4 DAY);

SELECT * FROM dfunctions;

SELECT * FROM dfunctions
WHERE DATEDIFF(end_date, start_date) > 2;

ALTER TABLE dfunctions
ADD COLUMN course_name VARCHAR(100) NOT NULL;

UPDATE dfunctions
SET course_name = 'Web Design'
WHERE start_date = 20251010;

UPDATE dfunctions
SET course_name = 'Web Development'
WHERE start_date = 20241010;

SELECT * FROM dfunctions;

SELECT * FROM dfunctions
WHERE DATEDIFF(end_date, start_date) >= 4;

SELECT DAYNAME(start_date),
       DAYNAME(end_date)
FROM dfunctions
WHERE DATEDIFF(end_date, start_date) >= 4;

SELECT CONCAT(DAYNAME(start_date), ', ', start_date),
       CONCAT(DAYNAME(end_date), ', ', end_date)
FROM dfunctions
WHERE DATEDIFF(end_date, start_date) >= 4;

SELECT DAYOFMONTH(NOW());

SELECT DAYOFYEAR(NOW());

SELECT TIMEDIFF('17:43:12', '10:56:12');

SELECT MINUTE(TIMEDIFF('17:43:12', '10:56:12'))
AS Minute_Difference;

SELECT WEEKOFYEAR(NOW());