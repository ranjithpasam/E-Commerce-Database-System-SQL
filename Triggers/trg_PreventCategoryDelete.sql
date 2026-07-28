USE ECommerceDB;
GO

CREATE TRIGGER trg_PreventCategoryDelete
ON Categories
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR('Deleting categories is not allowed.', 16, 1);
END;
GO


----------------------------
Test
----------------------------
DELETE FROM Categories
WHERE CategoryID = 1;
-------------------------------
