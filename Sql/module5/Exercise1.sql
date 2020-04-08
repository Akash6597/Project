Use AdventureWorks;
Go


CREATE TABLE Sales.MediaOutlet(
	MediaOutletId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	MediaOutletName nvarchar(40) NULL,
	PrimaryContact nvarchar(50) NULL,
	City nvarchar(50) NULL
);

CREATE TABLE Sales.PrintMediaPlacement(
	PrintMediaPlacementId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	MediaOutletId int NULL,
	PlacementDate datetime NULL,
	PublicationDate datetime NULL,
		RelatedProductId int NULL,
	PlacementCost decimal(18, 2) NULL,

);