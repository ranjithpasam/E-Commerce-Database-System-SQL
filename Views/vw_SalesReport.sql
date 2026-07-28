USE ECommerceDB;
GO

CREATE VIEW vw_SalesReport
AS
SELECT
    YEAR(OrderDate) AS SalesYear,
    MONTH(OrderDate) AS SalesMonth,
    COUNT(OrderID) AS TotalOrders,
    SUM(TotalAmount) AS TotalSales,
    AVG(TotalAmount) AS AverageOrderValue
FROM Orders
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate);
GO
