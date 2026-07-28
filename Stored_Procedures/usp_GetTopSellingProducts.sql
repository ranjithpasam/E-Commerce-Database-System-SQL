USE ECommerceDB;
GO

CREATE PROCEDURE usp_GetTopSellingProducts
AS
BEGIN
    SELECT TOP 5
        P.ProductName,
        SUM(OI.Quantity) AS TotalSold
    FROM Products P
    INNER JOIN OrderItems OI
        ON P.ProductID = OI.ProductID
    GROUP BY P.ProductName
    ORDER BY TotalSold DESC;
END;
GO


---------------------------------------
Test    
-----------------------------------------
EXEC usp_GetTopSellingProducts;
-------------------------------------
