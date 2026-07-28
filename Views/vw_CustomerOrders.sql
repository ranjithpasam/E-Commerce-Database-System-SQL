USE ECommerceDB;
GO

CREATE VIEW vw_CustomerOrders
AS
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    O.OrderID,
    O.OrderDate,
    O.TotalAmount,
    O.OrderStatus
FROM Customers C
INNER JOIN Orders O
    ON C.CustomerID = O.CustomerID;
GO
