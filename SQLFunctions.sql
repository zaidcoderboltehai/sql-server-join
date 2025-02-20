----Functions:

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY IDENTITY(1,1),
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DOJ DATE,
    Department VARCHAR(50)
);

INSERT INTO Employees (EmpName, Salary, DOJ, Department) 
VALUES 
('Amit Sharma', 50000, '2022-06-15', 'IT'),
('Pooja Yadav', 60000, '2021-03-10', 'HR'),
('Rajesh Kumar', 45000, '2023-01-20', 'Finance'),
('Neha Verma', 70000, '2020-07-25', 'IT'),
('Vikas Singh', 55000, '2022-09-05', 'Sales');

----Types of Functions:

----1.	System-Defined (Built-in) Functions: 

----1. String Functions

-- 1. UPPER() and LOWER()
SELECT EmpName, UPPER(EmpName) AS UpperCaseName, LOWER(EmpName) AS LowerCaseName FROM Employees;

-- 2. LEN() - Count string length
SELECT EmpName, LEN(EmpName) AS NameLength FROM Employees;

-- 3. LEFT() and RIGHT()
SELECT EmpName, LEFT(EmpName, 3) AS FirstThreeLetters, RIGHT(EmpName, 3) AS LastThreeLetters FROM Employees;

-- 4. SUBSTRING()
SELECT EmpName, SUBSTRING(EmpName, 2, 4) AS ExtractedPart FROM Employees;

----2. Numeric Functions

-- 5. ROUND() - Round off salary
SELECT EmpName, Salary, ROUND(Salary, 0) AS RoundedSalary FROM Employees;

-- 6. CEILING() and FLOOR()
SELECT Salary, CEILING(Salary) AS CeilingValue, FLOOR(Salary) AS FloorValue FROM Employees;

-- 7. ABS() - Absolute Value
SELECT -150 AS NegativeValue, ABS(-150) AS AbsoluteValue;

----3. Date Functions

-- 8. GETDATE() - Get current system date
SELECT GETDATE() AS CurrentDate;

-- 9. YEAR(), MONTH(), DAY()
SELECT DOJ, YEAR(DOJ) AS JoiningYear, MONTH(DOJ) AS JoiningMonth, DAY(DOJ) AS JoiningDay FROM Employees;

-- 10. DATEDIFF() - Difference in years
SELECT EmpName, DATEDIFF(YEAR, DOJ, GETDATE()) AS YearsOfService FROM Employees;

-- 11. DATEADD() - Add 2 years to DOJ
SELECT EmpName, DOJ, DATEADD(YEAR, 2, DOJ) AS NewJoiningDate FROM Employees;

----4. Aggregate Functions

-- 12. COUNT() - Total Employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- 13. SUM() - Total Salary Expense
SELECT SUM(Salary) AS TotalSalaryExpense FROM Employees;

-- 14. AVG() - Average Salary
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- 15. MIN() and MAX() - Minimum & Maximum Salary
SELECT MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary FROM Employees;

----5. Conversion Functions

-- 16. CAST() - Convert Salary to INT
SELECT EmpName, Salary, CAST(Salary AS INT) AS SalaryAsInt FROM Employees;

-- 17. CONVERT() - Convert Date to VARCHAR
SELECT DOJ, CONVERT(VARCHAR, DOJ, 103) AS FormattedDate FROM Employees;


----2.	User-Defined Functions (UDF):

---Scalar Function Creation

CREATE FUNCTION dbo.GetExperience (@JoinDate DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @JoinDate, GETDATE());
END;

SELECT EmpName, DOJ, dbo.GetExperience(DOJ) AS YearsOfService FROM Employees;

----Inline Table-Valued Function

CREATE FUNCTION dbo.GetEmployeesByDepartment (@DeptName VARCHAR(50))
RETURNS TABLE
AS
RETURN 
(
    SELECT EmpID, EmpName, Salary, DOJ, Department 
    FROM Employees 
    WHERE Department = @DeptName
);

SELECT * FROM dbo.GetEmployeesByDepartment('IT');

----Multi-Statement Table-Valued Function

CREATE FUNCTION dbo.HighSalaryEmployees()
RETURNS @HighSalaryTable TABLE
(
    EmpID INT,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DOJ DATE,
    Department VARCHAR(50)
)
AS
BEGIN
    INSERT INTO @HighSalaryTable
    SELECT EmpID, EmpName, Salary, DOJ, Department 
    FROM Employees 
    WHERE Salary > 55000;

    RETURN;
END;

SELECT * FROM dbo.HighSalaryEmployees();
