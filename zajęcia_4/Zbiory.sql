--1
SELECT CompanyName
FROM Customers
UNION
SELECT CompanyName
FROM Suppliers;

--2
SELECT City
FROM Customers
UNION
SELECT City
FROM Suppliers

--3
SELECT City
FROM Customers
INTERSECT
SELECT City
FROM Suppliers

--4
SELECT City
FROM Customers
EXCEPT
SELECT City
FROM Suppliers

--5
SELECT Country
FROM Customers
WHERE Country LIKE 'U%'
UNION
SELECT Country
FROM Suppliers
WHERE Country LIKE 'U%'

