USE ECommerceDB;
GO

CREATE PROCEDURE usp_DeleteCustomer
(
    @CustomerID INT
)
AS
BEGIN
    DELETE FROM Customers
    WHERE CustomerID = @CustomerID;
END;
GO


-------------------------
Test
-------------------------
EXEC usp_DeleteCustomer
    @CustomerID = 6;
---------------------
