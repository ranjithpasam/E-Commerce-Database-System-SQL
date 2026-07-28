USE ECommerceDB;
GO

CREATE VIEW vw_InventoryStatus
AS
SELECT
    P.ProductID,
    P.ProductName,
    I.QuantityAvailable,
    S.SupplierName,
    I.LastUpdated
FROM Inventory I
INNER JOIN Products P
    ON I.ProductID = P.ProductID
INNER JOIN Suppliers S
    ON I.SupplierID = S.SupplierID;
GO
