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

---------------------------------------------------
-- Suppliers Table
---------------------------------------------------

CREATE TABLE Suppliers
(
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(150) NOT NULL,
    ContactPerson VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(100)
);
GO

---------------------------------------------------
-- Inventory Table
---------------------------------------------------

CREATE TABLE Inventory
(
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    SupplierID INT,
    QuantityAvailable INT DEFAULT 0,
    LastUpdated DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID),

    FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID)
);
GO

---------------------------------------------------
-- Orders Table
---------------------------------------------------

CREATE TABLE Orders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    OrderStatus VARCHAR(50),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);
GO

---------------------------------------------------
-- OrderItems Table
---------------------------------------------------

CREATE TABLE OrderItems
(
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);
GO

---------------------------------------------------
-- Payments Table
---------------------------------------------------

CREATE TABLE Payments
(
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(50),
    PaymentDate DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);
GO

---------------------------------------------------
-- Shipping Table
---------------------------------------------------

CREATE TABLE Shipping
(
    ShippingID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ShippingAddress VARCHAR(255),
    ShippingDate DATE,
    DeliveryDate DATE,
    ShippingStatus VARCHAR(50),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);
GO

---------------------------------------------------
-- ProductReviews Table
---------------------------------------------------

CREATE TABLE ProductReviews
(
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText VARCHAR(500),
    ReviewDate DATE DEFAULT GETDATE(),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);
GO

---------------------------------------------------
-- Coupons Table
---------------------------------------------------

CREATE TABLE Coupons
(
    CouponID INT IDENTITY(1,1) PRIMARY KEY,
    CouponCode VARCHAR(50) UNIQUE,
    DiscountPercentage DECIMAL(5,2),
    ExpiryDate DATE
);
GO

---------------------------------------------------
-- Roles Table
---------------------------------------------------

CREATE TABLE Roles
(
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(100) NOT NULL UNIQUE,
    Description VARCHAR(255)
);
GO

---------------------------------------------------
-- Users Table
---------------------------------------------------

CREATE TABLE Users
(
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    RoleID INT,
    Username VARCHAR(100) UNIQUE,
    PasswordHash VARCHAR(255),
    IsActive BIT DEFAULT 1,

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (RoleID)
        REFERENCES Roles(RoleID)
);
GO

---------------------------------------------------
-- AuditLog Table
---------------------------------------------------

CREATE TABLE AuditLog
(
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TableName VARCHAR(100),
    ActionType VARCHAR(50),
    RecordID INT,
    ActionBy VARCHAR(100),
    ActionDate DATETIME DEFAULT GETDATE()
);
GO

