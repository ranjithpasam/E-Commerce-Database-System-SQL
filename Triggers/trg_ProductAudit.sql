USE ECommerceDB;
GO

CREATE TRIGGER trg_ProductAudit
ON Products
AFTER UPDATE
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
        'Products',
        'UPDATE',
        ProductID,
        SYSTEM_USER,
        GETDATE()
    FROM inserted;
END;
GO

-------------------------
Test
-----------------------------
UPDATE Products
SET Price = Price + 100
WHERE ProductID = 1;
-----------------------------
