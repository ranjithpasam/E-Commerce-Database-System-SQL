USE ECommerceDB;
GO

CREATE VIEW vw_OrderSummary
AS
SELECT
    O.OrderID,
    C.FirstName + ' ' + C.LastName AS CustomerName,
    O.TotalAmount,
    P.PaymentStatus,
    S.ShippingStatus
FROM Orders O
INNER JOIN Customers C
    ON O.CustomerID = C.CustomerID
LEFT JOIN Payments P
    ON O.OrderID = P.OrderID
LEFT JOIN Shipping S
    ON O.OrderID = S.OrderID;
GO
