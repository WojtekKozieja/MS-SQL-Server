SELECT EmployeeID, LastName, FirstName, Title
FROM Employees
WHERE EmployeeID = 5;

SELECT LastName, city, country
FROM Employees
WHERE country = 'USA';

SELECT companyname
FROM customers
WHERE companyname like '%restaurant%' 

SELECT productid, productname, supplierid, unitprice 
FROM products 
WHERE (productname like 'T%' or productid = 46) and (unitprice > 16.00) 

SELECT productid, productname, supplierid, unitprice 
FROM products 
WHERE (productname like 'T%') or productid = 46 and (unitprice > 16.00)






