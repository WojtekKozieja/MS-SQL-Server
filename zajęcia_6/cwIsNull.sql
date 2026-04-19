SELECT OrderID, OrderDate, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry = 'Argentina' and ShippedDate IS NULL;
