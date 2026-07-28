USE ECommerceDB;
GO

CREATE FUNCTION fn_ProductStock
(
    @ProductID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Stock INT;

    SELECT @Stock = QuantityAvailable
    FROM Inventory
    WHERE ProductID = @ProductID;

    RETURN @Stock;
END;
GO


---------------------------------
Test
---------------------------------
SELECT dbo.fn_ProductStock(1) AS AvailableStock;
--------------------------------
