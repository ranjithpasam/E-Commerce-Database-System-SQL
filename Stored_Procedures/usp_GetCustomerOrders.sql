USE ECommerceDB;
GO

CREATE PROCEDURE usp_GetCustomerOrders
(
    @CustomerID INT
)
AS
BEGIN
    SELECT
        OrderID,
        OrderDate,
        TotalAmount,
        OrderStatus
    FROM Orders
    WHERE CustomerID = @CustomerID;
END;
GO

--------------------------------------------
Test
---------------------------------------------
EXEC usp_GetCustomerOrders @CustomerID = 1;
----------------------------------------------
