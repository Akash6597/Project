USE AdventureWorks2016;
GO

CREATE VIEW Sales.NewCustomer
AS
SELECT CustomerID, FirstName, LastName 
FROM Sales.CustomerPII;
GO

SELECT * FROM Sales.NewCustomer ORDER BY CustomerID

INSERT INTO Sales.NewCustomer
VALUES
(1,'Asd', 'Ac'),
(2, 'Ds', 'Vs');
GO

SELECT * FROM Sales.NewCustomer ORDER BY CustomerID