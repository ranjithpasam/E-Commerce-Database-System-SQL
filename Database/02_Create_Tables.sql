USE ECommerceDB;
GO

---------------------------------------------------
-- Categories Table
---------------------------------------------------

CREATE TABLE Categories
(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);
GO

---------------------------------------------------
-- Brands Table
---------------------------------------------------

CREATE TABLE Brands
(
    BrandID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName VARCHAR(100) NOT NULL,
    Country VARCHAR(100)
);
GO

---------------------------------------------------
-- Products Table
---------------------------------------------------

CREATE TABLE Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryID INT,
    BrandID INT,
    ProductName VARCHAR(150) NOT NULL,
    Description VARCHAR(500),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT DEFAULT 0,

    FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID),

    FOREIGN KEY (BrandID)
        REFERENCES Brands(BrandID)
);
GO

