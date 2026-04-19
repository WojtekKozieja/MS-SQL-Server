-- 1/2
SELECT TOP 10 OrderID, SUM(UnitPrice) AS Cena
FROM [Order Details]
GROUP BY OrderID
ORDER BY Cena DESC;

--1/2
SELECT ProductID, SUM(Quantity) AS liczba_zamowionych_jednostek
FROM [Order Details]
--WHERE ProductID < 3
GROUP BY ProductID;

--3
SELECT OrderID, SUM(UnitPrice)
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 250;


--1
SELECT EmployeeID, COUNT(OrderID) AS liczba_obslugiwanych_zamowien
FROM Orders
GROUP BY EmployeeID;

--2/3
SELECT ShipVia, SUM(Freight) AS suma_oplat_za_przesylki
FROM Orders
WHERE YEAR(OrderDate) between 1996 and 1997 
GROUP BY ShipVia

--1
SELECT EmployeeID, YEAR(OrderDate) AS Rok, MONTH(OrderDate) AS Miesiac, COUNT(OrderID) AS 'Liczba obslugiwanych zamowien'
FROM Orders
GROUP BY EmployeeID, YEAR(OrderDate), MONTH(OrderDate)

--2
SELECT CategoryID, MAX(UnitPrice) AS 'Max Price', MIN(UnitPrice) AS 'Min Price'
FROM Products
GROUP BY CategoryID

--3
SELECT City
FROM Customers
WHERE Country = 'Brazil'
GROUP BY City

--1
SELECT Title, Country, COUNT(EmployeeID)
FROM Employees
GROUP BY Title, Country

--2
SELECT 
		Title, 
		Country,
		AVG(YEAR(GETDATE())-YEAR([BirthDate])) AS 'œredni wiek', 
		MIN(YEAR(GETDATE())-YEAR([BirthDate])) AS 'Min wiek',
		MAX(YEAR(GETDATE())-YEAR([BirthDate])) AS 'Max wiek'
FROM Employees
GROUP BY Title, Country


