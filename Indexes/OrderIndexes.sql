USE ECommerceDB;
GO

---------------------------------------------------
-- Index on CustomerID
---------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Order_CustomerID
ON Orders(CustomerID);
GO

---------------------------------------------------
-- Index on OrderDate
---------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Order_OrderDate
ON Orders(OrderDate);
GO
