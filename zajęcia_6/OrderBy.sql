SELECT CompanyName, Country
FROM Customers
ORDER BY Country, CompanyName;

SELECT CompanyName, Country
FROM Customers
WHERE Country = 'Spain' or Country = 'France'
ORDER BY Country, CompanyName;

SELECT OrderID
FROM Orders
WHERE YEAR(OrderDate) = 1997
ORDER BY MONTH(OrderDate) DESC, Freight