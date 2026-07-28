USE ECommerceDB;
GO

CREATE TRIGGER trg_CustomerAudit
ON Customers
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLog
    (
        TableName,
        ActionType,
        RecordID,
        ActionBy,
        ActionDate
    )
    SELECT
        'Customers',
        'INSERT',
        CustomerID,
        SYSTEM_USER,
        GETDATE()
    FROM inserted;
END;
GO



----------------------
Test
-------------------------
INSERT INTO Customers
(
    FirstName,
    LastName,
    Email,
    Phone
)
VALUES
(
    'Test',
    'User',
    'test@example.com',
    '9876543219'
);
------------------------
