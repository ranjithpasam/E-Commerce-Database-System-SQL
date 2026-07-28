USE ECommerceDB;
GO

---------------------------------------------------
-- Unique Index on Product Name
---------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX IX_Product_ProductName
ON Products(ProductName);
GO

---------------------------------------------------
-- Composite Index on Category and Brand
---------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Product_Category_Brand
ON Products(CategoryID, BrandID);
GO

---------------------------------------------------
-- Covering Index for Product Search
---------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Product_Price
ON Products(Price)
INCLUDE (ProductName, StockQuantity);
GO
