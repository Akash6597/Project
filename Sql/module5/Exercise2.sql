Use AdventureWorks;
Go

ALTER TABLE Sales.MediaOutlet
DROP CONSTRAINT [PK__MediaOut__4B132627343B1653]

ALTER TABLE Sales.MediaOutlet ADD CONSTRAINT IX_MediaOutlet UNIQUE CLUSTERED (
MediaOutletID
); 
ALTER TABLE Sales.PrintMediaPlacement
DROP CONSTRAINT [PK__PrintMed__7AF65BA27315909C]

CREATE CLUSTERED INDEX CIX_PRINTMEDIAPLACEMENT 
ON Sales.PrintMediaPlacement (PrintMediaPlacementId ASC);