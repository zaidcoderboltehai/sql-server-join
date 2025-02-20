----Views 


create database viewqueries
use viewqueries

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employees (emp_id, emp_name, department, salary) VALUES
(1, 'Amit', 'IT', 60000),
(2, 'Ravi', 'HR', 50000),
(3, 'Sita', 'Finance', 55000),
(4, 'Rohan', 'IT', 62000);

--simple view
CREATE VIEW Employee_View AS
SELECT emp_name, department, salary
FROM Employees;

SELECT * FROM Employee_View;

--complex view 

CREATE VIEW High_Salary_Employees AS  
SELECT emp_id, emp_name, department, salary,  
       CASE  
           WHEN salary > 60000 THEN 'High Salary'  
           WHEN salary BETWEEN 50000 AND 60000 THEN 'Medium Salary'  
           ELSE 'Low Salary'  
       END AS salary_category,  
       salary * 0.10 AS yearly_bonus  
FROM Employees  
WHERE department = 'IT' OR department = 'Finance';  

SELECT * FROM High_Salary_Employees;

--indexed view

DROP VIEW IF EXISTS Employee_Salary_View;  

CREATE VIEW Employee_Salary_View  
WITH SCHEMABINDING  
AS  
SELECT emp_id, emp_name, department, salary,  
       COUNT_BIG(*) AS total_employees  
FROM dbo.Employees  
GROUP BY emp_id, emp_name, department, salary;  

CREATE UNIQUE CLUSTERED INDEX idx_emp_salary  
ON Employee_Salary_View(emp_id, emp_name, department, salary);

SELECT * FROM Employee_Salary_View;

--partitioned view 

CREATE TABLE IT_Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50) CHECK (department = 'IT'),
    salary DECIMAL(10,2)
);

CREATE TABLE HR_Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50) CHECK (department = 'HR'),
    salary DECIMAL(10,2)
);

CREATE TABLE Finance_Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50) CHECK (department = 'Finance'),
    salary DECIMAL(10,2)
);

INSERT INTO IT_Employees VALUES (1, 'Amit', 'IT', 60000);
INSERT INTO HR_Employees VALUES (2, 'Ravi', 'HR', 50000);
INSERT INTO Finance_Employees VALUES (3, 'Sita', 'Finance', 55000);
INSERT INTO IT_Employees VALUES (4, 'Rohan', 'IT', 62000);

CREATE VIEW Employee_Partitioned_View  
AS  
SELECT * FROM IT_Employees  
UNION ALL  
SELECT * FROM HR_Employees  
UNION ALL  
SELECT * FROM Finance_Employees;

SELECT * FROM Employee_Partitioned_View;
