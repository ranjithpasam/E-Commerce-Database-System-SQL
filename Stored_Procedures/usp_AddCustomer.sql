USE ECommerceDB;
GO

CREATE PROCEDURE usp_AddCustomer
(
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Phone VARCHAR(20)
)
AS
BEGIN
    INSERT INTO Customers
    (
        FirstName,
        LastName,
        Email,
        Phone
    )
    VALUES
    (
        @FirstName,
        @LastName,
        @Email,
        @Phone
    );
END;
GO




------------
Test
-----------
EXEC usp_AddCustomer
    @FirstName = 'Kiran',
    @LastName = 'Reddy',
    @Email = 'kiran@gmail.com',
    @Phone = '9876543299';
-----------------
