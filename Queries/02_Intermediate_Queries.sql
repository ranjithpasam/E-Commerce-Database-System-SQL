USE ECommerceDB;
GO

---------------------------------------------------
-- 1. Customer Order Details
---------------------------------------------------

SELECT
    C.FirstName,
    C.LastName,
    O.OrderID,
    O.OrderDate,
    O.TotalAmount,
    O.OrderStatus
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID;
GO

---------------------------------------------------
-- 2. Product Sales Report
---------------------------------------------------

SELECT
    P.ProductName,
    SUM(OI.Quantity) AS TotalSold
FROM Products P
INNER JOIN OrderItems OI
    ON P.ProductID = OI.ProductID
GROUP BY P.ProductName;
GO

---------------------------------------------------
-- 3. Total Sales by Customer
---------------------------------------------------

SELECT
    C.FirstName,
    C.LastName,
    SUM(O.TotalAmount) AS TotalSpent
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.LastName;
GO

---------------------------------------------------
-- 4. Orders with Payment Status
---------------------------------------------------

SELECT
    O.OrderID,
    O.OrderStatus,
    P.PaymentMethod,
    P.PaymentStatus
FROM Orders O
INNER JOIN Payments P
    ON O.OrderID = P.OrderID;
GO

---------------------------------------------------
-- 5. Customers Who Have Not Placed Orders
---------------------------------------------------

SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName
FROM Customers C
LEFT JOIN Orders O
    ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL;
GO

---------------------------------------------------
-- 6. Average Product Price by Brand
---------------------------------------------------

SELECT
    B.BrandName,
    AVG(P.Price) AS AveragePrice
FROM Brands B
INNER JOIN Products P
    ON B.BrandID = P.BrandID
GROUP BY B.BrandName;
GO

---------------------------------------------------
-- 7. Customers Spending More Than 800
---------------------------------------------------

SELECT
    C.FirstName,
    C.LastName,
    SUM(O.TotalAmount) AS TotalSpent
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.LastName
HAVING SUM(O.TotalAmount) > 800;
GO

---------------------------------------------------
-- 8. Order Status using CASE
---------------------------------------------------

SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN OrderStatus = 'Delivered' THEN 'Completed'
        WHEN OrderStatus = 'Shipped' THEN 'On the Way'
        WHEN OrderStatus = 'Processing' THEN 'In Progress'
        ELSE 'Pending'
    END AS StatusDescription
FROM Orders;
GO

---------------------------------------------------
-- 9. Most Expensive Product
---------------------------------------------------

SELECT *
FROM Products
WHERE Price =
(
    SELECT MAX(Price)
    FROM Products
);
GO

---------------------------------------------------
-- 10. Products Never Ordered
---------------------------------------------------

SELECT
    ProductName
FROM Products
WHERE ProductID NOT IN
(
    SELECT ProductID
    FROM OrderItems
);
GO

