CREATE DATABASE CoDb
USE CoDb
CREATE TABLE Details(user_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
                     user_name VARCHAR(50) NOT NULL,
					 user_age INT NOT NULL)
SELECT * FROM Details

INSERT INTO DETAILS(user_name,user_age) VALUES('Zaid',10)

UPDATE Details
SET user_age = 40
WHERE user_id=2

DELETE FROM Details WHERE user_id=1
select * from Details 