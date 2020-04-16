USE AdventureWorks2016;
GO

ALTER VIEW
Production.OnlineProducts
AS
SELECT p.ProductID,
p.Name, p.ProductNumber,
ISNULL(p.Color, 'N/A') AS Color,
CASE p.DaysToManufacture
	WHEN 0 THEN 'In Stock' 
	WHEN 1 THEN 'Overnight'
	WHEN 2 THEN '2 to 3 days Delivery'
	ELSE 'Call Us for a quote'
	END AS Availability,
p.Size,
p.SizeUnitMeasureCode,
p.ListPrice,
p.Weight
FROM Production.Product AS p
WHERE p.SellEndDate IS NULL AND p.SellStartDate IS NOT NULL;
GO

select * from Production.OnlineProducts

