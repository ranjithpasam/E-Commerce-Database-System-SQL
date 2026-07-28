USE ECommerceDB;
GO

---------------------------------------------------
-- 1. View All Products
---------------------------------------------------

SELECT *
FROM Products;
GO

---------------------------------------------------
-- 2. View All Customers
---------------------------------------------------

SELECT *
FROM Customers;
GO

---------------------------------------------------
-- 3. Products with Price Greater Than 500
---------------------------------------------------

SELECT ProductName,
       Price
FROM Products
WHERE Price > 500;
GO

---------------------------------------------------
-- 4. Customers from Hyderabad
---------------------------------------------------

SELECT C.FirstName,
       C.LastName,
       A.City
FROM Customers C
JOIN Addresses A
ON C.CustomerID = A.CustomerID
WHERE A.City = 'Hyderabad';
GO

---------------------------------------------------
-- 5. List All Orders
---------------------------------------------------

SELECT *
FROM Orders;
GO

---------------------------------------------------
-- 6. Products Sorted by Price
---------------------------------------------------

SELECT ProductName,
       Price
FROM Products
ORDER BY Price DESC;
GO

---------------------------------------------------
-- 7. Count Total Customers
---------------------------------------------------

SELECT COUNT(*) AS TotalCustomers
FROM Customers;
GO

---------------------------------------------------
-- 8. Average Product Price
---------------------------------------------------

SELECT AVG(Price) AS AveragePrice
FROM Products;
GO

---------------------------------------------------
-- 9. Total Inventory
---------------------------------------------------

SELECT SUM(QuantityAvailable) AS TotalStock
FROM Inventory;
GO

---------------------------------------------------
-- 10. Products with Brand Names
---------------------------------------------------

SELECT
P.ProductName,
B.BrandName,
P.Price
FROM Products P
JOIN Brands B
ON P.BrandID = B.BrandID;
GO

