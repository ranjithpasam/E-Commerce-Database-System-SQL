USE ECommerceDB;
GO

CREATE PROCEDURE usp_ProcessOrder
(
    @OrderID INT
)
AS
BEGIN
    UPDATE Orders
    SET OrderStatus = 'Processing'
    WHERE OrderID = @OrderID;
END;
GO


---------------------------------------
Test
------------------------------------
EXEC usp_ProcessOrder @OrderID = 3;
------------------------------------
