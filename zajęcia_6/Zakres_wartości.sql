SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice NOT BETWEEN 10 AND 20;

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice between 20 and 30;

SELECT OrderID, OrderID
FROM Orders
WHERE YEAR(OrderDate) = 1997