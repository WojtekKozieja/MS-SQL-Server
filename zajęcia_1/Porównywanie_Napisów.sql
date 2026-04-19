SELECT *
FROM Products

SELECT ProductID, ProductName
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%';

SELECT EmployeeID, FirstName, LastName, Title
FROM Employees
WHERE LastName LIKE '[B-L]%';

SELECT EmployeeID, FirstName, LastName, Title
FROM Employees
WHERE LastName LIKE '[BL]%';

SELECT CategoryName
FROM Categories
WHERE Description LIKE '%,%';

SELECT CustomerID, CompanyName
FROM Customers
WHERE CompanyName LIKE '%Store%';