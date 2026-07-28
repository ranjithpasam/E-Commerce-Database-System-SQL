USE ECommerceDB;
GO

CREATE VIEW vw_ProductReviews
AS
SELECT
    P.ProductName,
    C.FirstName + ' ' + C.LastName AS CustomerName,
    PR.Rating,
    PR.ReviewText,
    PR.ReviewDate
FROM ProductReviews PR
INNER JOIN Products P
    ON PR.ProductID = P.ProductID
INNER JOIN Customers C
    ON PR.CustomerID = C.CustomerID;
GO
