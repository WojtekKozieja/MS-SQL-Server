USE Northwind
GO

--1
SELECT count(*) as LiczbaProduktow
FROM Products
WHERE UnitPrice>20 OR UnitPrice <10

--2
SELECT MAX(UnitPrice) as 'max<20'
FROM Products
WHERE UnitPrice <20;

--3
SELECT MAX(UnitPrice) as CenaMaksymalna, MIN(UnitPrice) as CenaMinimalna, AVG(UnitPrice) as ŒredniaCena
FROM Products
WHERE QuantityPerUnit like '%bottle%';

--4
SELECT *
FROM Products
WHERE UnitPrice >(SELECT AVG(UnitPrice) as ŒredniaCena
					FROM Products)

--5
SELECT OrderID, SUM(UnitPrice) AS 'Suma/Wartosc zamowienia'
FROM [Order Details]
WHERE OrderID = 10250
GROUP BY OrderID

--1
SELECT OrderID, MAX(UnitPrice) AS MaximumPrice, MIN(UnitPrice) AS MinimumPrice
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderID;
--2
SELECT OrderID, MAX(UnitPrice) AS MaximumPrice
FROM [Order Details]
GROUP BY OrderID
ORDER BY MaximumPrice
--3
SELECT ShipName, COUNT(OrderID) AS Liczba_zmówieñ
FROM [Orders]
GROUP BY ShipName

--1
SELECT OrderID, SUM(Quantity) AS liczba_pozycji
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 5


--2
SELECT CustomerID, COUNT(CustomerID) as liczba_zamowien
FROM Orders
WHERE YEAR(OrderDate) = 1998
GROUP BY CustomerID
HAVING COUNT(CustomerID) > 8
ORDER BY  SUM(Freight) DESC;

