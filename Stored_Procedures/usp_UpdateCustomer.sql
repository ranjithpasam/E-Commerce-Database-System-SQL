USE ECommerceDB;
GO

CREATE PROCEDURE usp_UpdateCustomer
(
    @CustomerID INT,
    @Phone VARCHAR(20),
    @Email VARCHAR(100)
)
AS
BEGIN
    UPDATE Customers
    SET
        Phone = @Phone,
        Email = @Email
    WHERE CustomerID = @CustomerID;
END;
GO


------------------
Test
---------------
EXEC usp_UpdateCustomer
    @CustomerID = 1,
    @Phone = '9999999999',
    @Email = 'ranjith_new@gmail.com';
-------------------------
