--1
SELECT EmployeeID
FROM Employees
WHERE ReportsTo IS NOT NULL
INTERSECT
SELECT EmployeeID
FROM Orders;

--2
SELECT Country
FROM Customers
UNION
SELECT Country
FROM Suppliers;

--3
SELECT Country
FROM Customers
EXCEPT
SELECT Country
FROM Suppliers;

--4
SELECT City
FROM Customers
UNION
SELECT City
FROM Suppliers
UNION
SELECT City
FROM Employees;

--5
SELECT CustomerID
FROM Customers
Except
SELECT CustomerID
FROM Orders

--6
SELECT EmployeeID, RegionDescription
FROM Employees
CROSS JOIN Region