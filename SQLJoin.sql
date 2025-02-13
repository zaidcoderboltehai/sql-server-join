create database sqljoin

use sqljoin

CREATE TABLE Students (
    student_id INT PRIMARY KEY, 
    name VARCHAR(50), 
    class VARCHAR(10)
);

INSERT INTO Students (student_id, name, class)  
VALUES 
(1, 'Amit', '10th'),  
(2, 'Ravi', '10th'),  
(3, 'Sita', '9th'),  
(4, 'Rohan', '10th');


CREATE TABLE Marks (
    mark_id INT IDENTITY(1,1) PRIMARY KEY,  
    student_id INT, 
    subject VARCHAR(50), 
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Marks (student_id, subject, marks)  
VALUES  
(1, 'Maths', 85),  
(2, 'Science', 90),  
(4, 'Maths', 88);


SELECT Students.name, Marks.subject, Marks.marks  
FROM Students  
INNER JOIN Marks  
ON Students.student_id = Marks.student_id;


SELECT Students.name, Marks.subject, Marks.marks  
FROM Students  
LEFT JOIN Marks  
ON Students.student_id = Marks.student_id;


SELECT Students.name, Marks.subject, Marks.marks  
FROM Students  
RIGHT JOIN Marks  
ON Students.student_id = Marks.student_id;

SELECT Students.name, Marks.subject, Marks.marks  
FROM Students  
FULL JOIN Marks  
ON Students.student_id = Marks.student_id;

SELECT S1.student_id AS Student1_ID, 
       S1.name AS Student1_Name, 
       S2.student_id AS Student2_ID, 
       S2.name AS Student2_Name, 
       S1.class
FROM Students S1  
JOIN Students S2  
ON S1.class = S2.class  
AND S1.student_id < S2.student_id;  

SELECT Students.student_id, Students.name, Students.class, 
       Marks.mark_id, Marks.subject, Marks.marks
FROM Students  
CROSS JOIN Marks;

