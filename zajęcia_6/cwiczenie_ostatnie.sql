SELECT ProductID, (UnitPrice-Discount)*Quantity AS wartosc_kazdej_pozycji
FROM [Order Details]
WHERE OrderID = 10250

SELECT CompanyName, Phone + ', ' + Fax
FROM Suppliers

