/************************************************************************
 * Step 1 - Only execute one step at a time								*
 *																		*
 * Use the sp_spaceused function and note the size of the current table.*
 *																		*
 * e.g. data = 45,552 KB												*
 *																		*
 ************************************************************************/
SET STATISTICS TIME OFF
GO
USE AdventureWorksDW
GO

sp_spaceused 'dbo.FactProductInventory';
GO

-------- end of Step 1 --------

/************************************************************************
 * Step 2 - Only execute one step at a time								*
 *																		*
 * Execute the script below. Have Include Actual Execution Plan On      *
 * Note the execution time.	                                            *
 *																		*
 * e.g. CPU time = 2436 ms,  elapsed time = 4414 ms.			
 * SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.
SQL Server parse and compile time: 
   CPU time = 21 ms, elapsed time = 21 ms.

(93744 rows affected)

(1 row affected)

 SQL Server Execution Times:
   CPU time = 469 ms,  elapsed time = 1213 ms.
SQL Server parse and compile time: 
   CPU time = 0 ms, elapsed time = 0 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.

Completion time: 2020-04-13T01:01:38.8289884+05:30
 ************************************************************************/

SET STATISTICS TIME ON
GO

SELECT p.EnglishProductName
		,d.WeekNumberOfYear
		,d.CalendarYear
		,AVG(fpi.UnitCost) AvgCost
		,SUM(fpi.UnitsOut) TotalUnits
		,MAX(fpi.UnitCost) HighestPrice
FROM dbo.FactProductInventory as fpi
INNER JOIN dbo.DimProduct as p ON fpi.ProductKey = p.ProductKey
INNER JOIN dbo.DimDate as d ON fpi.DateKey = d.DateKey
GROUP BY p.EnglishProductName,
		d.WeekNumberOfYear,
		d.CalendarYear
ORDER BY p.EnglishProductName,
		d.CalendarYear,
		d.WeekNumberOfYear;
GO