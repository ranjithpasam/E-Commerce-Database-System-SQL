USE ECommerceDB;
GO

---------------------------------------------------
-- Unique Index on Email
---------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX IX_Customer_Email
ON Customers(Email);
GO

---------------------------------------------------
-- Index on Last Name
---------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Customer_LastName
ON Customers(LastName);
GO
