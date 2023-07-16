/* Author: Tessa Hughes
   Created Date: 04/26/2022
   Last Updated Date: 05/23/2022
   Description: Script to create "Storage Helper" Database
   Version: 2
*/

USE master;

-- Drop database
IF DB_ID('StorageHelper') IS NOT NULL DROP DATABASE StorageHelper;

-- If database could not be created due to open connections, abort
IF @@ERROR = 3702 
   RAISERROR('Database cannot be dropped because there are still open connections.', 127, 127) WITH NOWAIT, LOG;

-- Create database
CREATE DATABASE StorageHelper;
GO

USE StorageHelper;
GO

-- Create tables
CREATE TABLE dbo.Person
	(PersonId 		INT 			NOT NULL IDENTITY,
	 FirstName 		NVARCHAR(50) 	NOT NULL,
	 LastName 		NVARCHAR(50) 	NOT NULL,
	 CreatedDate 	DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	 CONSTRAINT PK_PERSON PRIMARY KEY(PersonId),
	 CONSTRAINT UQ_PERSON UNIQUE (PersonId),
	 CONSTRAINT CHK_PERSONCREATEDT CHECK(CreatedDate >= CURRENT_TIMESTAMP)
	);
	

CREATE TABLE dbo.Box
	(BoxId 			INT 			NOT NULL IDENTITY,
	 PersonId 		INT 			NOT NULL,
	 BoxNo 			INT 			NOT NULL DEFAULT 1,
	 QRCode 		VARBINARY(MAX) 	NULL,
	 ContainerType 	NVARCHAR(50) 	NULL DEFAULT 'Cardboard Box',
	 BoxWeight 		DECIMAL(13,2) 	NULL,
	 BoxPicInside 	VARBINARY(MAX) 	NULL,
	 BoxPicOutside 	VARBINARY(MAX) 	NULL,
	 CreatedDate 	DATETIME NOT 	NULL DEFAULT CURRENT_TIMESTAMP,
	 CONSTRAINT PK_BOX PRIMARY KEY(BoxId),
	 CONSTRAINT FK_BOX_PERSON FOREIGN KEY(PersonId)
		REFERENCES dbo.Person(PersonId)
		ON DELETE CASCADE,
	 CONSTRAINT UQ_BOX UNIQUE (BoxId),
	 CONSTRAINT CHK_BOXCREATEDT CHECK(CreatedDate >= CURRENT_TIMESTAMP),
	 CONSTRAINT CHK_BOXWGT CHECK(BoxWeight >= 0.00)
	);

CREATE TABLE dbo.Item
	(ItemId 		INT 			NOT NULL IDENTITY,
	 BoxId 			INT 			NOT NULL,
	 ItemName 		NVARCHAR(200) 	NOT NULL,
	 CreatedDate 	DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	 CONSTRAINT PK_ITEM PRIMARY KEY(ItemId),
	 CONSTRAINT FK_ITEM_BOX FOREIGN KEY(BoxId)
		REFERENCES dbo.Box(BoxId)
		ON DELETE CASCADE,
	 CONSTRAINT UQ_ITEM UNIQUE (ItemId),
	 CONSTRAINT CHK_ITEMCREATEDT CHECK(CreatedDate >= CURRENT_TIMESTAMP)
	);

--Add values to tables
SET IDENTITY_INSERT dbo.Person ON;
INSERT INTO dbo.Person(PersonId,FirstName,LastName,CreatedDate) 
VALUES (1,'Tessa','Hughes',CURRENT_TIMESTAMP);
INSERT INTO dbo.Person(PersonId,FirstName,LastName,CreatedDate)  
VALUES (2,'Shelby','Lynch',CURRENT_TIMESTAMP);
INSERT INTO dbo.Person(PersonId,FirstName,LastName,CreatedDate)  
VALUES (3,'Thaddeus','Thomas',CURRENT_TIMESTAMP);
SET IDENTITY_INSERT dbo.Person OFF;

SET IDENTITY_INSERT dbo.Box ON;
INSERT INTO dbo.Box(BoxId,PersonId,BoxNo,QRCode,ContainerType,BoxWeight,BoxPicInside,BoxPicOutside,CreatedDate)  
VALUES (1,2,1,NULL,'Cardboard Box',5.20,NULL,NULL,CURRENT_TIMESTAMP);
INSERT INTO dbo.Box(BoxId,PersonId,BoxNo,QRCode,ContainerType,BoxWeight,BoxPicInside,BoxPicOutside,CreatedDate) 
VALUES (2,2,2,NULL,'Cardboard Box',1.33,NULL,NULL,CURRENT_TIMESTAMP);
INSERT INTO dbo.Box(BoxId,PersonId,BoxNo,QRCode,ContainerType,BoxWeight,BoxPicInside,BoxPicOutside,CreatedDate) 
VALUES (3,2,3,NULL,'Plastic Bin',4.28,NULL,NULL,CURRENT_TIMESTAMP);
INSERT INTO dbo.Box(BoxId,PersonId,BoxNo,QRCode,ContainerType,BoxWeight,BoxPicInside,BoxPicOutside,CreatedDate) 
VALUES (4,3,1,NULL,'Cardboard Box',6.00,NULL,NULL,CURRENT_TIMESTAMP);
SET IDENTITY_INSERT dbo.Box OFF;

SET IDENTITY_INSERT dbo.Item ON;
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate)
VALUES (1,1,'Pants',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate) 
VALUES (2,1,'Shirts',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate) 
VALUES (3,1,'Socks',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate)
VALUES (4,2,'Makeup',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate) 
VALUES (5,2,'Towels',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate) 
VALUES (6,2,'Bathroom Mat',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate)
VALUES (7,3,'Cups',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate) 
VALUES (8,3,'Plates',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate) 
VALUES (9,3,'Silverware',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate)
VALUES (10,4,'Pants',CURRENT_TIMESTAMP);
INSERT INTO dbo.Item(ItemId,BoxId,ItemName,CreatedDate) 
VALUES (11,4,'Shirts',CURRENT_TIMESTAMP);
SET IDENTITY_INSERT dbo.Item OFF;

GO
-- Create Views
CREATE VIEW dbo.NumBoxesByPerson AS
select concat(p.FirstName,' ',p.LastName) as FullName, 
p.PersonId,
count(b.BoxId) as NumBoxes,
sum(b.BoxWeight) as TotalWeightAllBoxes
from dbo.Person p
left join dbo.Box b on b.PersonId = p.PersonId
group by p.PersonId, p.FirstName, p.LastName;
GO
CREATE VIEW dbo.NumItemsByPerson AS
(select concat(p.FirstName,' ',p.LastName) as FullName, 
p.PersonId,
count(i.ItemId) as NumItems
from dbo.Person p
left join dbo.Box b on b.PersonId = p.PersonId
left join dbo.Item i on i.BoxId = b.BoxId
group by p.PersonId, p.FirstName, p.LastName);
GO
-- Create Stored PROCEDURES

CREATE PROCEDURE dbo.BoxesItemsByPerson (@personid as int)
AS
BEGIN
(select nb.FullName, nb.NumBoxes, ni.NumItems
from dbo.NumBoxesByPerson nb
join dbo.NumItemsByPerson ni on ni.PersonId = nb.PersonId
where nb.PersonId = @personid)
END;
GO
CREATE PROCEDURE dbo.RemoveWhiteSpace
AS
BEGIN
update dbo.Person 
set FirstName = trim(FirstName), LastName = trim(LastName) 
END;