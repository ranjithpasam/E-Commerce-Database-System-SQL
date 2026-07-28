USE ECommerceDB;
GO

CREATE PROCEDURE usp_GetSalesReport
AS
BEGIN
    SELECT
        YEAR(OrderDate) AS SalesYear,
        MONTH(OrderDate) AS SalesMonth,
        COUNT(OrderID) AS TotalOrders,
        SUM(TotalAmount) AS TotalSales
    FROM Orders
    GROUP BY
        YEAR(OrderDate),
        MONTH(OrderDate)
    ORDER BY
        SalesYear,
        SalesMonth;
END;
GO


----------------------------
Test
------------------------------
EXEC usp_GetSalesReport;
-------------------------------
