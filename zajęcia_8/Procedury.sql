--CZESC 1
--zad 1
CREATE OR ALTER PROCEDURE p_AddNewOrder
	@CustomerID NCHAR(5),
	@EmployeeID INT,
	@ShipVia INT
AS
BEGIN
	DECLARE @OrderDate DATETIME = GETDATE()
	INSERT INTO Orders (CustomerID, EmployeeID, ShipVia, OrderDate, RequiredDate)
		VALUES (@CustomerID, @EmployeeID, @ShipVia, @OrderDate, @OrderDate + 7);
	PRINT 'Zamówienie zosta³o dodane';
END;


EXEC p_AddNewOrder
	@CustomerID = 'ALFKI',
	@EmployeeID = 5,
	@ShipVia = 1;

--CZÊŒÆ 2
--zad 1
CREATE PROC p_UnitslnStockUpdate
	@ProductID INT,
	@Nowailosc SMALLINT
AS
BEGIN
	UPDATE Products
		SET UnitsInStock = @Nowailosc
		WHERE ProductID = @ProductID;
	PRINT 'Iloœæ produktów Zosta³a zaktualizowana';
END;

EXEC p_UnitslnStockUpdate
	@ProductID = 1,
	@Nowailosc = 27;

SELECT *
FROM Products
WHERE ProductID = 1


--zad 2
CREATE PROC p_ProductSales
	@ProductID INT
AS
BEGIN
	SELECT ProductName, (SELECT SUM(Quantity*UnitPrice)
						FROM [Order Details]
						GROUP BY ProductID
						HAVING ProductID = @ProductID)
	FROM Products
	WHERE ProductID = @ProductID
END;

EXEC p_ProductSales 5;

--CZÊŒÆ 3
--zad 1
CREATE OR ALTER PROC p_AddCustomer
	@CustomerID NCHAR(5),
	@CompanyName NVARCHAR(40),
	@ContactName NVARCHAR(30),
	@City NVARCHAR(15)
AS
BEGIN
	IF NOT EXISTS (SELECT 1
				FROM Customers
				WHERE CustomerID = @CustomerID)
		INSERT INTO Customers (CustomerID, CompanyName, ContactName, City)
			VALUES  (@CustomerID, @CompanyName, @ContactName, @City);
	ELSE
		PRINT 'Klient o podanym ID ju¿ istnieje';
END;

EXEC p_AddCustomer
	'PIWOO',
	'Piwo Mocny Full',
	'Ferdynant Kiepski',
	'Berlin'

SELECT * FROM Customers
WHERE CustomerID = 'PIWOO'


--CZÊŒÆ 4
--zad 1
CREATE OR ALTER PROC InfProduct
	@CategoryName NVARCHAR(15)
AS
BEGIN
	SELECT ProductName, UnitPrice, UnitsInStock
	FROM Products AS P
	WHERE CategoryID = (SELECT CategoryID
						FROM Categories
						WHERE CategoryName = @CategoryName);
END;

EXEC InfProduct 'Confections'

--zad 2
CREATE OR ALTER PROC EmployeeStatistic
	@EmployeeID INT,
	@Year SMALLINT
AS
BEGIN
	SELECT 
		EmployeeID, 
		COUNT(DISTINCT O.OrderID) AS 'Liczba wys³anych zamówieñ', --przy z³¹czeniu z Order Details Wystêpujê wiêcej OrderID (bo do jednego OrderID jest pare ProductID)
		SUM(Quantity*UnitPrice) AS 'Wartoœæ wys³anych zamówieñ'
	FROM Orders AS O
	INNER JOIN [Order Details] AS OD
		ON O.OrderID = OD.OrderID
	WHERE EmployeeID = @EmployeeID
		AND YEAR(OrderDate) = @Year
	GROUP BY EmployeeID
END;

EXEC EmployeeStatistic 5, 1998

	