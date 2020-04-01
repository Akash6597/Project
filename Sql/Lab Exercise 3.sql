---------------------------------------------------------------------
-- LAB 02
--
-- Exercise 3

---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
Create Table DirectMarketing.Competitor(
CompetitorCode INT PRIMARY KEY IDENTITY (1, 1),
	 CompetitorName VARCHAR(30) NOT NULL,
	 CompetitorAddress VARCHAR(MAX),
	 CompetitionBrand VARCHAR(50) NOT NULL,
	 DateofEntered DATETIME ,
	 StrengthOfCompetition VARCHAR(10) NOT NULL,
	 Comments VARCHAR(MAX)
)
-- Write a script to create a table to store the Competitor data.
---------------------------------------------------------------------





---------------------------------------------------------------------
-- Task 2
CREATE TABLE DirectMarketing.TVAdvertisement(
	TVAdvertisementId INT PRIMARY KEY IDENTITY (1, 1),
	TVStation nvarchar(15) NOT NULL,
   CostPerAdvertisement float NOT NULL,
   TotalCostOfAllAdvertisements float,
   NumberOfAdvertisements varchar(4) NOT NULL,
   DateOfAdvertisement varchar(12) NOT NULL,
   TimeOfAdvertisement int NOT NULL
);

-- Write a script to create a table to store the TVAdvertisement data.
---------------------------------------------------------------------






---------------------------------------------------------------------
-- Task 3
	CREATE TABLE DirectMarketing.CampaignResponse(
	CampaignId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ResponseOccurredWhen datetime NOT NULL,
	RelevantProspect int NOT NULL,
    RespondedHow VARCHAR(8) NOT NULL,
	ChargeFromReferrer float NOT NULL,
    RevenueFromResponse float NOT NULL,
    ResponseProfit float NOT NULL
);
-- Write a script to create a table to store the CampaignResponse data.
---------------------------------------------------------------------


