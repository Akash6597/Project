USE [AdventureWorksDW]
GO

ALTER TABLE [dbo].[FactInternetSalesReason] DROP CONSTRAINT [FK_FactInternetSalesReason_FactInternetSales]
GO

/****** Object:  Table [dbo].[OldFactInternetSales] ******/
DROP TABLE [dbo].[OldFactInternetSales]
GO
