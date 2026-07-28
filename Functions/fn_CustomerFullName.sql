USE ECommerceDB;
GO

CREATE FUNCTION fn_CustomerFullName
(
    @CustomerID INT
)
RETURNS VARCHAR(150)
AS
BEGIN
    DECLARE @FullName VARCHAR(150);

    SELECT @FullName = FirstName + ' ' + LastName
    FROM Customers
    WHERE CustomerID = @CustomerID;

    RETURN @FullName;
END;
GO


------------------------------------------
Test
------------------------------------
SELECT dbo.fn_CustomerFullName(1) AS CustomerName;
-------------------------------
