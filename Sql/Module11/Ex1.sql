USE AdventureWorks
GO

CREATE TABLE Production.ProductAudit(
ProductID int NOT NULL,
UpdateTime datetime2(7) NOT NULL,
ModifyingUser nvarchar(100) NOT NULL,
OriginalListPrice money NOT NULL,
NewListPrice money NULL
)
Go

CREATE TRIGGER Production.trProductListPrice
ON Production.Product
AFTER UPDATE
AS BEGIN
	SET NOCOUNT ON;
	INSERT INTO Production.ProductAudit(ProductID, UpdateTime, ModifyingUser, OriginalListPrice,NewListPrice)
	SELECT Inserted.ProductID,SYSDATETIME(),ORIGINAL_LOGIN(),deleted.ListPrice, inserted.ListPrice FROM deleted
	INNER JOIN inserted
	ON deleted.ProductID = inserted.ProductID
	WHERE deleted.ListPrice > 1000 OR inserted.ListPrice > 1000;
END;
GO

UPDATE Production.Product
SET ListPrice=3000.00
WHERE ProductID BETWEEN 1 and 4;
GO

SELECT * FROM Production.ProductAudit