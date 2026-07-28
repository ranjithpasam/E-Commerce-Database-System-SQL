USE ECommerceDB;
GO

CREATE PROCEDURE usp_UpdateInventory
(
    @ProductID INT,
    @Quantity INT
)
AS
BEGIN
    UPDATE Inventory
    SET
        QuantityAvailable = @Quantity,
        LastUpdated = GETDATE()
    WHERE ProductID = @ProductID;
END;
GO

---------------------------------------------
Test
-------------------------------------------------
EXEC usp_UpdateInventory
    @ProductID = 1,
    @Quantity = 45;
------------------------------------
