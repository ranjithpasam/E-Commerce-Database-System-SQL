USE ECommerceDB;
GO

CREATE VIEW vw_PaymentSummary
AS
SELECT
    O.OrderID,
    C.FirstName + ' ' + C.LastName AS CustomerName,
    O.TotalAmount,
    P.PaymentMethod,
    P.PaymentStatus,
    P.PaymentDate
FROM Payments P
INNER JOIN Orders O
    ON P.OrderID = O.OrderID
INNER JOIN Customers C
    ON O.CustomerID = C.CustomerID;
GO
