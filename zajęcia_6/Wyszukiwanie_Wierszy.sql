SELECT ContactName, Address
FROM Customers
WHERE City = 'London';


SELECT ContactName, Address
FROM Customers
WHERE Country = 'Spain' or Country = 'France';

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice between 20 and 30;

SELECT ProductName
FROM Products
WHERE UnitsInStock = 0;