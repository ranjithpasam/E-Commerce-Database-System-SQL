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

---------------------------------------------------
-- Customers Table
---------------------------------------------------

CREATE TABLE Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    RegistrationDate DATE DEFAULT GETDATE()
);
GO

---------------------------------------------------
-- Addresses Table
---------------------------------------------------

CREATE TABLE Addresses
(
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    AddressLine VARCHAR(255) NOT NULL,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    PostalCode VARCHAR(20),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);
GO

