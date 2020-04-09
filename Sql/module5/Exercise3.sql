	/*
Missing Index Details from SalesQuery.sql -  [ReadOnly]DESKTOP-22I7KO5.AdventureWorks (DESKTOP-22I7KO5\akash (65))
The Query Processor estimates that implementing the following index could improve the query cost by 70.801%.
*/

USE [AdventureWorks]
GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Sales].[PrintMediaPlacement] ([PublicationDate],[PlacementCost])
INCLUDE ([MediaOutletId],[PlacementDate],[RelatedProductId])
GO

