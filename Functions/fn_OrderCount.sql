USE ECommerceDB;
GO

CREATE FUNCTION fn_OrderCount
(
    @CustomerID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @OrderCount INT;

    SELECT @OrderCount = COUNT(*)
    FROM Orders
    WHERE CustomerID = @CustomerID;

    RETURN @OrderCount;
END;
GO


-----------------------------
Test
-----------------------------
SELECT dbo.fn_OrderCount(1) AS TotalOrders;
-----------------------------
