USE ECommerceDB;
GO

CREATE FUNCTION fn_TotalSales()
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TotalSales DECIMAL(18,2);

    SELECT @TotalSales = SUM(TotalAmount)
    FROM Orders;

    RETURN ISNULL(@TotalSales, 0);
END;
GO


-----------------------------------
Test
------------------------------------
SELECT dbo.fn_TotalSales() AS TotalSales;
-------------------------------
