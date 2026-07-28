USE ECommerceDB;
GO

---------------------------------------------------
-- Insert Categories
---------------------------------------------------

INSERT INTO Categories (CategoryName, Description)
VALUES
('Electronics', 'Electronic Devices'),
('Mobiles', 'Smartphones and Accessories'),
('Laptops', 'Laptops and Computers'),
('Fashion', 'Clothing and Accessories'),
('Home Appliances', 'Home and Kitchen Products');
GO

---------------------------------------------------
-- Insert Brands
---------------------------------------------------

INSERT INTO Brands (BrandName, Country)
VALUES
('Apple', 'USA'),
('Samsung', 'South Korea'),
('Dell', 'USA'),
('HP', 'USA'),
('Sony', 'Japan');
GO

---------------------------------------------------
-- Insert Customers
---------------------------------------------------

INSERT INTO Customers
(
    FirstName,
    LastName,
    Email,
    Phone
)
VALUES
('Ranjith','Kumar','ranjith@gmail.com','9876543210'),
('Rahul','Sharma','rahul@gmail.com','9876543211'),
('Priya','Reddy','priya@gmail.com','9876543212'),
('Arjun','Kumar','arjun@gmail.com','9876543213'),
('Sneha','Patel','sneha@gmail.com','9876543214');
GO

---------------------------------------------------
-- Insert Addresses
---------------------------------------------------

INSERT INTO Addresses
(
    CustomerID,
    AddressLine,
    City,
    State,
    Country,
    PostalCode
)
VALUES
(1,'12 MG Road','Bengaluru','Karnataka','India','560001'),
(2,'45 Banjara Hills','Hyderabad','Telangana','India','500034'),
(3,'78 Anna Salai','Chennai','Tamil Nadu','India','600002'),
(4,'22 Park Street','Kolkata','West Bengal','India','700016'),
(5,'101 FC Road','Pune','Maharashtra','India','411005');
GO

---------------------------------------------------
-- Insert Suppliers
---------------------------------------------------

INSERT INTO Suppliers
(
    SupplierName,
    ContactPerson,
    Email,
    Phone,
    City
)
VALUES
('Tech Distributors','Amit Shah','amit@techdist.com','9876500001','Mumbai'),
('Global Electronics','Ravi Kumar','ravi@globalelec.com','9876500002','Hyderabad'),
('Smart Devices Ltd','John Peter','john@smartdevices.com','9876500003','Bengaluru'),
('NextGen Supplies','Suresh Rao','suresh@nextgen.com','9876500004','Chennai'),
('Digital World','Akash Singh','akash@digitalworld.com','9876500005','Delhi');
GO

---------------------------------------------------
-- Insert Products
---------------------------------------------------

INSERT INTO Products
(
    CategoryID,
    BrandID,
    ProductName,
    Description,
    Price,
    StockQuantity
)
VALUES
(1,1,'iPhone 16','Apple Smartphone',999.99,50),
(2,2,'Galaxy S26','Samsung Smartphone',899.99,60),
(3,3,'Dell Inspiron 15','Dell Laptop',749.99,40),
(3,4,'HP Pavilion','HP Laptop',699.99,35),
(1,5,'Sony Headphones','Wireless Headphones',199.99,100);
GO

---------------------------------------------------
-- Insert Inventory
---------------------------------------------------

INSERT INTO Inventory
(
    ProductID,
    SupplierID,
    QuantityAvailable
)
VALUES
(1,1,50),
(2,2,60),
(3,3,40),
(4,4,35),
(5,5,100);
GO

---------------------------------------------------
-- Insert Roles
---------------------------------------------------

INSERT INTO Roles
(
    RoleName,
    Description
)
VALUES
('Admin','System Administrator'),
('Customer','Registered Customer'),
('Manager','Store Manager');
GO

---------------------------------------------------
-- Insert Users
---------------------------------------------------

INSERT INTO Users
(
    CustomerID,
    RoleID,
    Username,
    PasswordHash
)
VALUES
(1,2,'ranjith','Password@123'),
(2,2,'rahul','Password@123'),
(3,2,'priya','Password@123'),
(4,2,'arjun','Password@123'),
(5,1,'admin','Admin@123');
GO

---------------------------------------------------
-- Insert Orders
---------------------------------------------------

INSERT INTO Orders
(
    CustomerID,
    TotalAmount,
    OrderStatus
)
VALUES
(1,999.99,'Delivered'),
(2,899.99,'Shipped'),
(3,749.99,'Processing'),
(4,699.99,'Delivered'),
(5,199.99,'Pending');
GO

---------------------------------------------------
-- Insert OrderItems
---------------------------------------------------

INSERT INTO OrderItems
(
    OrderID,
    ProductID,
    Quantity,
    UnitPrice
)
VALUES
(1,1,1,999.99),
(2,2,1,899.99),
(3,3,1,749.99),
(4,4,1,699.99),
(5,5,1,199.99);
GO

---------------------------------------------------
-- Insert Payments
---------------------------------------------------

INSERT INTO Payments
(
    OrderID,
    PaymentMethod,
    PaymentStatus
)
VALUES
(1,'Credit Card','Paid'),
(2,'UPI','Paid'),
(3,'Debit Card','Pending'),
(4,'Net Banking','Paid'),
(5,'Cash on Delivery','Pending');
GO

---------------------------------------------------
-- Insert Shipping
---------------------------------------------------

INSERT INTO Shipping
(
    OrderID,
    ShippingAddress,
    ShippingDate,
    DeliveryDate,
    ShippingStatus
)
VALUES
(1,'12 MG Road, Bengaluru','2026-07-01','2026-07-03','Delivered'),
(2,'45 Banjara Hills, Hyderabad','2026-07-02','2026-07-05','In Transit'),
(3,'78 Anna Salai, Chennai','2026-07-03',NULL,'Processing'),
(4,'22 Park Street, Kolkata','2026-07-04','2026-07-06','Delivered'),
(5,'101 FC Road, Pune',NULL,NULL,'Pending');
GO

---------------------------------------------------
-- Insert ProductReviews
---------------------------------------------------

INSERT INTO ProductReviews
(
    ProductID,
    CustomerID,
    Rating,
    ReviewText
)
VALUES
(1,1,5,'Excellent product'),
(2,2,4,'Very good smartphone'),
(3,3,5,'Great laptop for office work'),
(4,4,4,'Good performance'),
(5,5,5,'Amazing sound quality');
GO

---------------------------------------------------
-- Insert Coupons
---------------------------------------------------

INSERT INTO Coupons
(
    CouponCode,
    DiscountPercentage,
    ExpiryDate
)
VALUES
('WELCOME10',10,'2027-12-31'),
('SAVE20',20,'2027-10-31'),
('FESTIVE15',15,'2027-11-15'),
('NEWUSER5',5,'2027-09-30'),
('BIGSALE25',25,'2027-12-15');
GO
