--Cursor '

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

-- Step 1: Declare Cursor
DECLARE emp_cursor CURSOR FOR  
SELECT emp_name, salary FROM Employees;

-- Step 2: Declare Variables to Store Data
DECLARE @emp_name VARCHAR(50);
DECLARE @salary DECIMAL(10,2);

-- Step 3: Open Cursor
OPEN emp_cursor;

-- Step 4: Fetch First Row into Variables
FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;

-- Step 5: Loop through all rows
WHILE @@FETCH_STATUS = 0  
BEGIN  
    -- Print Employee Details
    PRINT 'Employee: ' + @emp_name + ', Salary: ' + CAST(@salary AS VARCHAR);
    
    -- Fetch Next Row
    FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;  
END;

-- Step 6: Close and Deallocate Cursor
CLOSE emp_cursor;  
DEALLOCATE emp_cursor;  

--1.Static Cursor

-- Step 1: Declare Static Cursor
DECLARE emp_cursor CURSOR STATIC FOR  
SELECT emp_name, salary FROM Employees;

-- Step 2: Declare Variables
DECLARE @emp_name VARCHAR(50);
DECLARE @salary DECIMAL(10,2);

-- Step 3: Open Cursor
OPEN emp_cursor;

-- Step 4: Fetch First Row
FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;

-- Step 5: Loop Through Rows
WHILE @@FETCH_STATUS = 0  
BEGIN  
    PRINT 'Employee: ' + @emp_name + ', Salary: ' + CAST(@salary AS VARCHAR);
    
    -- Fetch Next Row
    FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;  
END;

-- Step 6: Close and Deallocate Cursor
CLOSE emp_cursor;  
DEALLOCATE emp_cursor;

--2.Dynamic Cursor

-- Step 1: Declare Dynamic Cursor
DECLARE emp_cursor CURSOR DYNAMIC FOR  
SELECT emp_name, salary FROM Employees;

-- Step 2: Declare Variables
DECLARE @emp_name VARCHAR(50);
DECLARE @salary DECIMAL(10,2);

-- Step 3: Open Cursor
OPEN emp_cursor;

-- Step 4: Fetch First Row
FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;

-- Step 5: Loop Through Rows
WHILE @@FETCH_STATUS = 0  
BEGIN  
    PRINT 'Employee: ' + @emp_name + ', Salary: ' + CAST(@salary AS VARCHAR);
    
    -- Fetch Next Row
    FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;  
END;

-- Step 6: Close and Deallocate Cursor
CLOSE emp_cursor;  
DEALLOCATE emp_cursor;

--3.Keyset-Driven Cursor:

-- Step 1: Declare Keyset-Driven Cursor
DECLARE emp_cursor CURSOR KEYSET FOR  
SELECT emp_name, salary FROM Employees;

-- Step 2: Declare Variables
DECLARE @emp_name VARCHAR(50);
DECLARE @salary DECIMAL(10,2);

-- Step 3: Open Cursor
OPEN emp_cursor;

-- Step 4: Fetch First Row
FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;

-- Step 5: Loop Through Rows
WHILE @@FETCH_STATUS = 0  
BEGIN  
    PRINT 'Employee: ' + @emp_name + ', Salary: ' + CAST(@salary AS VARCHAR);
    
    -- Fetch Next Row
    FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;  
END;

-- Step 6: Close and Deallocate Cursor
CLOSE emp_cursor;  
DEALLOCATE emp_cursor;

--4.Fast-Forward Only Cursor (Read-Only):

-- Step 1: Declare Fast-Forward Cursor
DECLARE emp_cursor CURSOR FAST_FORWARD FOR  
SELECT emp_name, salary FROM Employees;

-- Step 2: Declare Variables
DECLARE @emp_name VARCHAR(50);
DECLARE @salary DECIMAL(10,2);

-- Step 3: Open Cursor
OPEN emp_cursor;

-- Step 4: Fetch First Row
FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;

-- Step 5: Loop Through Rows
WHILE @@FETCH_STATUS = 0  
BEGIN  
    PRINT 'Employee: ' + @emp_name + ', Salary: ' + CAST(@salary AS VARCHAR);
    
    -- Fetch Next Row
    FETCH NEXT FROM emp_cursor INTO @emp_name, @salary;  
END;

-- Step 6: Close and Deallocate Cursor
CLOSE emp_cursor;  
DEALLOCATE emp_cursor;
