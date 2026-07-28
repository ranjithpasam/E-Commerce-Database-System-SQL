USE ECommerceDB;
GO

CREATE PROCEDURE usp_SearchProducts
(
    @ProductName VARCHAR(100)
)
AS
BEGIN
    SELECT
        ProductID,
        ProductName,
        Price,
        StockQuantity
    FROM Products
    WHERE ProductName LIKE '%' + @ProductName + '%';
END;
GO


-----------------------------------------
Test
--------------------------------------------
EXEC usp_SearchProducts @ProductName = 'iPhone';
------------------------------------------
