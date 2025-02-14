
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


CREATE DATABASE EmployeeDB;

USE EmployeeDB;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY, 
    emp_name VARCHAR(50), 
    department VARCHAR(50)
);

INSERT INTO Employees (emp_id, emp_name, department)  
VALUES 
(1, 'Amit', 'IT'),  
(2, 'Ravi', 'HR'),  
(3, 'Sita', 'Finance'),  
(4, 'Rohan', 'IT');

CREATE TABLE Salaries (
    salary_id INT IDENTITY(1,1) PRIMARY KEY,  
    emp_id INT, 
    salary_amount INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

INSERT INTO Salaries (emp_id, salary_amount)  
VALUES  
(1, 50000),  
(2, 60000),  
(4, 55000);

SELECT Employees.emp_name, Employees.department, Salaries.salary_amount  
FROM Employees  
INNER JOIN Salaries  
ON Employees.emp_id = Salaries.emp_id;


SELECT Employees.emp_name, Employees.department, Salaries.salary_amount  
FROM Employees  
LEFT JOIN Salaries  
ON Employees.emp_id = Salaries.emp_id;

SELECT Employees.emp_name, Employees.department, Salaries.salary_amount  
FROM Employees  
RIGHT JOIN Salaries  
ON Employees.emp_id = Salaries.emp_id;

SELECT Employees.emp_name, Employees.department, Salaries.salary_amount  
FROM Employees  
FULL JOIN Salaries  
ON Employees.emp_id = Salaries.emp_id;

SELECT E1.emp_id AS Emp1_ID, 
       E1.emp_name AS Emp1_Name, 
       E2.emp_id AS Emp2_ID, 
       E2.emp_name AS Emp2_Name, 
       E1.department
FROM Employees E1  
JOIN Employees E2  
ON E1.department = E2.department  
AND E1.emp_id < E2.emp_id;

SELECT Employees.emp_id, Employees.emp_name, Employees.department, 
       Salaries.salary_id, Salaries.salary_amount
FROM Employees  
CROSS JOIN Salaries;




CREATE TABLE Attendance (
    attendance_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    status VARCHAR(10),  -- Present / Absent
    date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Attendance (student_id, status, date)  
VALUES  
(1, 'Present', '2024-02-01'),  
(2, 'Absent', '2024-02-01'),  
(3, 'Present', '2024-02-01');

SELECT Students.name, Marks.subject, Marks.marks, Attendance.status, Attendance.date  
FROM Students  
INNER JOIN Marks ON Students.student_id = Marks.student_id  
INNER JOIN Attendance ON Students.student_id = Attendance.student_id;

SELECT Students.name, Marks.subject, Marks.marks, Attendance.status, Attendance.date  
FROM Students  
LEFT JOIN Marks ON Students.student_id = Marks.student_id  
LEFT JOIN Attendance ON Students.student_id = Attendance.student_id;

SELECT Students.name, Marks.subject, Marks.marks, Attendance.status, Attendance.date  
FROM Students  
RIGHT JOIN Marks ON Students.student_id = Marks.student_id  
RIGHT JOIN Attendance ON Students.student_id = Attendance.student_id;

SELECT Students.name, Marks.subject, Marks.marks, Attendance.status, Attendance.date  
FROM Students  
FULL JOIN Marks ON Students.student_id = Marks.student_id  
FULL JOIN Attendance ON Students.student_id = Attendance.student_id;

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
       Marks.mark_id, Marks.subject, Marks.marks,
       Attendance.attendance_id, Attendance.status, Attendance.date
FROM Students  
CROSS JOIN Marks  
CROSS JOIN Attendance;

