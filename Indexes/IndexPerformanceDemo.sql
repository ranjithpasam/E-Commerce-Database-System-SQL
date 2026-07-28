USE ECommerceDB;
GO

---------------------------------------------------
-- Product Search
---------------------------------------------------

SELECT ProductName, Price
FROM Products
WHERE ProductName = 'iPhone 16';
GO

---------------------------------------------------
-- Customer Search
---------------------------------------------------

SELECT *
FROM Customers
WHERE Email = 'ranjith@gmail.com';
GO

---------------------------------------------------
-- Orders by Customer
---------------------------------------------------

SELECT *
FROM Orders
WHERE CustomerID = 1;
GO

---------------------------------------------------
-- Recent Orders
---------------------------------------------------

SELECT *
FROM Orders
WHERE OrderDate >= '2026-07-01';
GO
