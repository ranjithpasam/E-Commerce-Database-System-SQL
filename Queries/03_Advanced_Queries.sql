USE ECommerceDB;
GO

---------------------------------------------------
-- 1. Row Number by Product Price
---------------------------------------------------

SELECT
    ProductName,
    Price,
    ROW_NUMBER() OVER (ORDER BY Price DESC) AS RowNum
FROM Products;
GO

---------------------------------------------------
-- 2. Rank Products by Price
---------------------------------------------------

SELECT
    ProductName,
    Price,
    RANK() OVER (ORDER BY Price DESC) AS ProductRank
FROM Products;
GO

---------------------------------------------------
-- 3. Dense Rank Products by Price
---------------------------------------------------

SELECT
    ProductName,
    Price,
    DENSE_RANK() OVER (ORDER BY Price DESC) AS DenseRank
FROM Products;
GO

---------------------------------------------------
-- 4. Running Total of Sales
---------------------------------------------------

SELECT
    OrderID,
    TotalAmount,
    SUM(TotalAmount)
        OVER (ORDER BY OrderID) AS RunningTotal
FROM Orders;
GO

---------------------------------------------------
-- 5. Common Table Expression (CTE)
---------------------------------------------------

WITH CustomerSales AS
(
    SELECT
        CustomerID,
        SUM(TotalAmount) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
)
SELECT *
FROM CustomerSales;
GO

---------------------------------------------------
-- 6. Transaction Example
---------------------------------------------------

BEGIN TRANSACTION;

UPDATE Products
SET StockQuantity = StockQuantity - 1
WHERE ProductID = 1;

COMMIT TRANSACTION;
GO

---------------------------------------------------
-- 7. TRY...CATCH Example
---------------------------------------------------

BEGIN TRY

    SELECT 100 / 0;

END TRY

BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;

END CATCH;
GO

---------------------------------------------------
-- 8. Top 3 Most Expensive Products
---------------------------------------------------

SELECT TOP 3
    ProductName,
    Price
FROM Products
ORDER BY Price DESC;
GO

---------------------------------------------------
-- 9. Monthly Sales Report
---------------------------------------------------

SELECT
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(TotalAmount) AS MonthlySales
FROM Orders
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate);
GO

---------------------------------------------------
-- 10. Customer Purchase History
---------------------------------------------------

SELECT
    C.FirstName,
    C.LastName,
    O.OrderID,
    O.OrderDate,
    O.TotalAmount
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID
ORDER BY
    C.FirstName,
    O.OrderDate;
GO

