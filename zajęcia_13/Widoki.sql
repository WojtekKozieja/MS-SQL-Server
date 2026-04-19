--CZÊŒÆ 1
--zad 1
CREATE VIEW InfCustomer AS
SELECT  C.CompanyName, OrderDate, ShippedDate
FROM Orders AS O
INNER JOIN Customers AS C
ON C.CustomerID = O.CustomerID;

--zad 2
CREATE VIEW InfEmployee AS
SELECT E.EmployeeID, E.FirstName, E.LastName, O.OrderID
FROM Employees AS E
INNER JOIN Orders O
ON E.EmployeeID = O.EmployeeID;

--zad 3
CREATE VIEW SalesSummary AS
SELECT CategoryName, 
		SUM(OD.UnitPrice * OD.Quantity) AS Suma, 
		AVG(OD.UnitPrice * OD.Quantity) AS Œrednia,
		MIN(OD.UnitPrice * OD.Quantity) AS 'Min',
		MAX(OD.UnitPrice * OD.Quantity) AS 'Max'
FROM Categories AS C
INNER JOIN Products AS P ON C.CategoryID = P.CategoryID
INNER JOIN [Order Details] AS OD ON P.ProductID = OD.ProductID
GROUP BY C.CategoryName

--CZÊŒÆ 2
--zad 1
CREATE VIEW vw_products_ok AS
SELECT *
FROM Products
WHERE Discontinued = 0;

--zad 2
CREATE VIEW InfWarehouse AS
SELECT *
FROM Products
WHERE UnitsInStock > 0;

SELECT COUNT(ProductID)
FROM InfWarehouse;