/*
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age BETWEEN 18 AND 65),
    Salary DECIMAL(10,2) DEFAULT 30000
);

select * from Employees;
*/

/*
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);


DROP TABLE Employees;


CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE
);

/*
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    StockQuantity INT DEFAULT 10
);
*/

drop table products

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0)
);

CREATE TABLE Customers (
    CustomerID UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    PhoneNumber CHAR(10) NOT NULL CHECK (LEN(PhoneNumber) = 10 AND PhoneNumber NOT LIKE '%[^0-9]%'),
    DateOfBirth DATE NOT NULL
);
*/


CREATE TABLE Locations (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    LocationName VARCHAR(100) NOT NULL,
    Area FLOAT
);

INSERT INTO Locations (LocationName, Area)
VALUES ('Location A', 123.456789),
       ('Location B', 456.789012);

SELECT 
    CAST(Area AS DECIMAL(10,2)) AS AreaDecimal,
    CAST(LocationID AS VARCHAR(20)) AS LocationID_Text,
    LocationName
FROM Locations;


CREATE TABLE Meetings (
    MeetingID INT IDENTITY(1,1) PRIMARY KEY,
    MeetingDate DATE NOT NULL,
    MeetingTime TIME NOT NULL
);

/*
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,  
    CONSTRAINT FK_Department FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);
*/

CREATE TABLE EmployeeRecords (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

INSERT INTO EmployeeRecords (FirstName, LastName, Salary)
VALUES ('Amit', 'Sharma', 40000),
       ('Pooja', 'Verma', 55000),
       ('Rahul', 'Kumar', 45000);


UPDATE EmployeeRecords
SET Salary = Salary * 1.10
WHERE Salary < 50000;


CREATE TABLE EmployeeDetails (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL
);

INSERT INTO EmployeeDetails (FirstName, LastName, Age)
VALUES ('Amit', 'Sharma', 58),
       ('Pooja', 'Verma', 62),
       ('Rahul', 'Kumar', 65),
       ('Sneha', 'Patel', 45);


DELETE FROM EmployeeDetails
WHERE Age > 60;

CREATE TABLE StaffMembers (
    StaffID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

INSERT INTO StaffMembers (FirstName, LastName, Salary)
VALUES ('Rohan', 'Singh', 48000),
       ('Priya', 'Mehta', 52000),
       ('Vikram', 'Gupta', 55000),
       ('Sonia', 'Patel', 47000),
       ('Karan', 'Sharma', 60000);

SELECT * FROM StaffMembers
WHERE Salary > 50000;



CREATE TABLE EmployeeProfiles (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);


INSERT INTO EmployeeProfiles (FirstName, LastName, Salary)
VALUES ('Aman', 'Kumar', 48000),
       ('Neha', 'Sharma', 52000),
       ('Rohan', 'Verma', 55000),
       ('Sita', 'Rao', 47000),
       ('Vijay', 'Singh', 60000);

SELECT * FROM EmployeeProfiles
WHERE Salary > 50000;

