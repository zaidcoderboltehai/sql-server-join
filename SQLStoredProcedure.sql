create database stored_procedure
use stored_procedure

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO Customers VALUES
(1, 'Zaid', 'Mumbai'),
(2, 'Amit', 'Delhi'),
(3, 'Pallavi', 'Pune');

INSERT INTO Orders VALUES
(101, 1, '2024-02-01', 5000),
(102, 2, '2024-02-05', 7000),
(103, 3, '2024-02-10', 8000);

----Stored Procedure to Get All Customers

CREATE PROCEDURE GetAllCustomers
AS
BEGIN
    SELECT * FROM Customers;
END;

EXEC GetAllCustomers;

----Stored Procedure to Insert a New Customer
CREATE PROCEDURE InsertCustomer
    @CustomerID INT,
    @CustomerName VARCHAR(50),
    @City VARCHAR(50)
AS
BEGIN
    INSERT INTO Customers VALUES (@CustomerID, @CustomerName, @City);
END;

EXEC InsertCustomer 4, 'Ashish', 'Bangalore';
SELECT * FROM Customers;

----Stored Procedure to Update Customer's City
CREATE PROCEDURE UpdateCustomerCity
    @CustomerID INT,
    @NewCity VARCHAR(50)
AS
BEGIN
    UPDATE Customers SET City = @NewCity WHERE CustomerID = @CustomerID;
END;

EXEC UpdateCustomerCity 2, 'Chennai';
SELECT * FROM Customers;

----Stored Procedure to Delete an Order
CREATE PROCEDURE DeleteOrder
    @OrderID INT
AS
BEGIN
    DELETE FROM Orders WHERE OrderID = @OrderID;
END;

EXEC DeleteOrder 102;
SELECT * FROM Orders;

----Stored Procedure to Get Orders by CustomerID
CREATE PROCEDURE GetOrdersByCustomer
    @CustomerID INT
AS
BEGIN
    SELECT * FROM Orders WHERE CustomerID = @CustomerID;
END;
EXEC GetOrdersByCustomer 1;
