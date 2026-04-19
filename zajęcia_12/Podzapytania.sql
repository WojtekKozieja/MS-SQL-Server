--Czesc 1
--zad 1
SELECT C.CompanyName, C.Phone
FROM Customers AS C
WHERE C.CustomerID IN ( SELECT O.CustomerID
						FROM Orders AS O
						WHERE YEAR(ShippedDate) = 1997 AND ShipVia = ( SELECT ShipperID
																		FROM Shippers AS S
																		WHERE CompanyName = 'United Package' ))
--zad 2
SELECT DISTINCT CompanyName, Phone
FROM Customers
WHERE CustomerID IN ( Select CustomerID
					FROM Orders AS O
					INNER JOIN [Order Details] AS OD
					ON O.OrderID = OD.OrderID
					INNER JOIN Products AS P
					ON OD.ProductID = P.ProductID
					INNER JOIN Categories AS C
					ON P.CategoryID = C.CategoryID
					WHERE CategoryName = 'Seafood' );

--zad 3
SELECT DISTINCT CompanyName, Phone
FROM Customers
WHERE CustomerID NOT IN ( Select CustomerID
					FROM Orders AS O
					INNER JOIN [Order Details] AS OD
					ON O.OrderID = OD.OrderID
					INNER JOIN Products AS P
					ON OD.ProductID = P.ProductID
					INNER JOIN Categories AS C
					ON P.CategoryID = C.CategoryID
					WHERE CategoryName = 'Seafood' );


--CZÊŒÆ 2
--zad 1
SELECT *
FROM Products
WHERE UnitPrice < ( SELECT AVG(UnitPrice) 
					FROM Products );


--zad 2
SELECT *
FROM Products AS P1
WHERE P1.UnitPrice < ( SELECT AVG(P2.UnitPrice)
						FROM Products AS P2
						GROUP BY P2.CategoryID
						HAVING P2.CategoryID = P1.CategoryID );


--CZÊŒÆ 3
--zad 1
SELECT OrderID, Freight + (SELECT SUM(UnitPrice*Quantity)
							FROM [Order Details] AS OD
							WHERE OD.OrderID = O.OrderID)
FROM [Orders] AS O
WHERE O.OrderID = 10250;

--zad 2
SELECT OrderID, Freight + (SELECT SUM(UnitPrice*Quantity)
							FROM [Order Details] AS OD
							WHERE OD.OrderID = O.OrderID)
FROM [Orders] AS O;

--zad 3
SELECT C.CustomerID, C.Address
FROM Customers AS C
WHERE C.CustomerID NOT IN ( SELECT O.CustomerID
							FROM Orders AS O
							WHERE YEAR(ShippedDate) = 1997 );

--CZÊŒÆ 4
--zad 1
SELECT ProductName, ProductID
FROM Products
WHERE UnitPrice > ALL ( SELECT UnitPrice
						FROM Products AS P
						INNER JOIN Categories AS C
						ON P.CategoryID = C.CategoryID
						WHERE CategoryName = 'Beverages' );

--zad 2
SELECT ProductID, MAX(Quantity*UnitPrice)
FROM [Order Details]
GROUP BY ProductID;


SELECT DISTINCT ProductID, Quantity*UnitPrice
FROM [Order Details] AS OD1
WHERE (Quantity*UnitPrice) >= ALL ( Select Quantity*UnitPrice
									FROM [Order Details] AS OD2
									WHERE OD1.ProductID = OD2.ProductID)
ORDER BY ProductID;

--CZÊŒÆ 5
--zad 1
SELECT OrderID, OrderDate, (SELECT COUNT(ProductID)
							FROM [Order Details] AS OD
							WHERE OD.OrderID = O.OrderID) AS 'Liczba Pozycji'
FROM Orders AS O;

--zad 2
SELECT CompanyName
FROM Customers AS C
WHERE EXISTS ( SELECT 1
				FROM Orders AS O
				WHERE O.CustomerID = C.CustomerID
					AND YEAR(OrderDate) = 1998 );

--zad 3
SELECT ProductName
FROM Products AS P
WHERE EXISTS (SELECT 1
				FROM [Order Details] AS OD
				WHERE OD.Quantity > 100
					AND P.ProductID = OD.ProductID);