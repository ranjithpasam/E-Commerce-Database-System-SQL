USE ECommerceDB;
GO

CREATE VIEW vw_ProductDetails
AS
SELECT
    P.ProductID,
    P.ProductName,
    C.CategoryName,
    B.BrandName,
    P.Price,
    P.StockQuantity
FROM Products P
INNER JOIN Categories C
    ON P.CategoryID = C.CategoryID
INNER JOIN Brands B
    ON P.BrandID = B.BrandID;
GO
