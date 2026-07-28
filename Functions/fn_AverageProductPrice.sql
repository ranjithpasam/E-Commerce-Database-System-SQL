USE ECommerceDB;
GO

CREATE FUNCTION fn_AverageProductPrice()
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @AveragePrice DECIMAL(18,2);

    SELECT @AveragePrice = AVG(Price)
    FROM Products;

    RETURN ISNULL(@AveragePrice, 0);
END;
GO


--------------------------------------
Test
-----------------------------------------
SELECT dbo.fn_AverageProductPrice() AS AveragePrice;
---------------------------------------
