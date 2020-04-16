USE AdventureWorks2016;
GO

CREATE VIEW Production.OnlineProducts
AS
SELECT p.ProductID, p.Name, p.ProductNumber, ISNULL(p.Color, 'N/A'),
CASE p.DaysToManufacture
WHEN 0 THEN 'In stock' 
WHEN 1 THEN 'Overnight'
WHEN 2 THEN '2 to 3 days delivery'
ELSE 'Call us for a quote'
END ,
p.Size, p.SizeUnitMeasureCode , p.ListPrice , p.Weight
FROM Production.Product AS p
WHERE p.SellEndDate IS NULL AND p.SellStartDate IS NOT NULL;
GO

SELECT * FROM Production.OnlineProducts;

CREATE VIEW Production.AvailableModels
AS
SELECT p.ProductID, p.Name, pm.ProductModelID, pm.Name
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS pm
ON p.ProductModelID = pm.ProductModelID
WHERE p.SellEndDate IS NULL
AND p.SellStartDate IS NOT NULL;
GO

SELECT * FROM Production.AvailableModels;