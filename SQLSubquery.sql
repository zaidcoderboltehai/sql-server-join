/*
create database zaid

use zaid

create table zaid
(
name varchar(100),
number int
);

insert into zaid values
('pallavi',1),
('Rohan',2),
('Karan',3);

select * from zaid
*/

-------subquery

create database subquery_type
use subquery_type

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT,
    SupplierID INT NULL
);

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 75000, 20, 101),
(2, 'Mobile Phone', 'Electronics', 45000, 50, 102),
(3, 'Headphones', 'Accessories', 2000, 100, 103),
(4, 'Refrigerator', 'Appliances', 50000, 15, 101),
(5, 'Air Conditioner', 'Appliances', 55000, 10, 104),
(6, 'Smartwatch', 'Electronics', 15000, 30, 102);

----Types of Subqueries
----Single Row Subquery

SELECT ProductName, Price 
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);

----Multiple Row Subquery

SELECT ProductName, Price 
FROM Products
WHERE Price > ANY (SELECT DISTINCT TOP 2 Price FROM Products ORDER BY Price ASC);

----Correlated Subquery 
SELECT ProductName, Category, Price 
FROM Products P1
WHERE Price > (SELECT AVG(Price) FROM Products P2 WHERE P1.Category = P2.Category);

----Nested Subquery

SELECT ProductName, SupplierID 
FROM Products
WHERE SupplierID IN (SELECT SupplierID FROM Products WHERE Price > 50000);


