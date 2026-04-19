--CZESC I
--1
SELECT ProductName, UnitPrice, Address
FROM Products 
INNER JOIN Suppliers
	ON Products.SupplierID = Suppliers.SupplierID
WHERE UnitPrice BETWEEN 20 and 30;

--2
SELECT ProductName, UnitsInStock
FROM Products
INNER JOIN Suppliers
	ON Products.SupplierID = Suppliers.SupplierID
WHERE CompanyName = 'Tokyo Traders';

--3
SELECT Customers.CustomerID, Address
FROM Customers
LEFT JOIN Orders
	ON Customers.CustomerID = Orders.CustomerID AND YEAR(Orders.OrderDate) != 1997
WHERE Orders.CustomerID IS NULL;

--4
SELECT CompanyName, Phone
FROM Suppliers
LEFT JOIN Products
	ON Suppliers.SupplierID = Products.SupplierID
WHERE Products.UnitsInStock = 0;

--CZESC II
--1
SELECT ProductName, UnitPrice, Address
FROM Products 
INNER JOIN Suppliers
	ON Products.SupplierID = Suppliers.SupplierID
	INNER JOIN Categories
		ON Products.CategoryID = Categories.CategoryID
WHERE UnitPrice BETWEEN 20 and 30 AND CategoryName = 'Meat/Poultry';

--2
SELECT ProductName, UnitPrice, CompanyName
FROM Products 
INNER JOIN Suppliers
	ON Products.SupplierID = Suppliers.SupplierID
	INNER JOIN Categories
		ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName = 'Confections';

--3
SELECT Customers.CompanyName, Customers.Phone
FROM Customers
INNER JOIN Orders
 ON Customers.CustomerID = Orders.CustomerID
 INNER JOIN Shippers
	ON Orders.ShipVia = Shippers.ShipperID
WHERE YEAR(OrderDate) = 1997 AND Shippers.CompanyName = 'United Package'

--4
SELECT DISTINCT C.CompanyName, C.Phone, CategoryName
FROM Customers AS C
INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
	INNER JOIN [Order Details] AS OD On O.OrderID = OD.OrderID
		INNER JOIN Products AS P ON P.ProductID = OD.ProductID
			INNER JOIN Categories AS CA ON P.CategoryID = CA.CategoryID
WHERE CategoryName = 'Confections'


--czesc III
--1
SELECT E1.EmployeeID, E1.LastName, E1.FirstName, E1.ReportsTo, E2.FirstName, E2.LastName
FROM Employees AS E1
LEFT JOIN Employees AS E2
	ON E1.ReportsTo = E2.EmployeeID

--2
SELECT E1.*
FROM Employees AS E1
LEFT JOIN Employees AS E2
	ON E1.EmployeeID = E2.ReportsTo
WHERE E2.EmployeeID IS NULL;

--3
SELECT E1.FirstName + ' ' + E1.LastName AS 'Pracownik',
round(sum( UnitPrice * Quantity*(1-Discount)),2) AS 'Wartosc'
FROM Employees AS E1
INNER JOIN Orders
	ON E1.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details]
	ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Employees AS E2
	ON E1.EmployeeID = E2.ReportsTo
GROUP BY E1.FirstName + ' ' + E1.LastName;

--czesc IV
--1/2
SELECT  CompanyName, SUM(Quantity) AS 'laczna ilosc zamowien'
FROM [Order Details] AS OD
INNER JOIN Orders AS O
	ON OD.OrderID = O.OrderID
INNER JOIN Customers AS C
	ON O.CustomerID = C.CustomerID
GROUP BY CompanyName
HAVING SUM(Quantity) > 250;

--3/4
SELECT  CompanyName, 
	UnitPrice*Quantity*(1-Discount) AS 'wartosc_zamowien'
FROM [Order Details] AS OD
INNER JOIN Orders AS O
	ON OD.OrderID = O.OrderID
INNER JOIN Customers AS C
	ON O.CustomerID = C.CustomerID
WHERE UnitPrice*Quantity*(1-Discount) > 1000;

--5
SELECT  CompanyName, 
	UnitPrice*Quantity*(1-Discount) AS 'wartosc_zamowien', 
E.FirstName + ' ' + E.LastName AS 'Pracownik'
FROM [Order Details] AS OD
INNER JOIN Orders AS O
	ON OD.OrderID = O.OrderID
INNER JOIN Customers AS C
	ON O.CustomerID = C.CustomerID
INNER JOIN Employees AS E
	ON O.EmployeeID = E.EmployeeID
WHERE UnitPrice*Quantity*(1-Discount) > 1000;


--czesc V
--1
SELECT CompanyName, COUNT(OD.OrderID) AS 'Liczba Zamowieñ'
FROM Orders AS O
INNER JOIN Shippers
	ON ShipVia = ShipperID
INNER JOIN [Order Details] AS OD
	ON O.OrderID = OD.OrderID
WHERE YEAR(ShippedDate) = 1997
GROUP BY CompanyName;

--2
SELECT E.FirstName + ' ' + E.LastName AS Pracownik,
	ROUND(SUM(UnitPrice*Quantity*(1-Discount)),2) AS Wartoœæ_zamówieñ
FROM Employees AS E
INNER JOIN Orders AS O
	ON E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] AS OD
	ON O.OrderID = OD.OrderID
GROUP BY FirstName + ' ' + LastName;

--3
SELECT TOP 1 E.FirstName + ' ' + E.LastName AS Pracownik,
	COUNT(OD.OrderID) AS Liczba_obsluzonych_zamowien
FROM Employees AS E
INNER JOIN Orders AS O
	ON E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] AS OD
	ON O.OrderID = OD.OrderID
GROUP BY FirstName + ' ' + LastName
ORDER BY COUNT(OD.OrderID) DESC;


