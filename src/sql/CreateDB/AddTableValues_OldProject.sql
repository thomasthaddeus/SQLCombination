--------------------------------
--------------------------------
--Add values to tables
SET IDENTITY_INSERT dbo.Person ON;
INSERT INTO dbo.Person
(PersonId, FirstName, LastName, CreatedDate)
VALUES
(1,  CURRENT_TIMESTAMP);
INSERT INTO dbo.Person
(PersonId, FirstName, LastName, CreatedDate)
VALUES
(2, , CURRENT_TIMESTAMP);
INSERT INTO dbo.Person
(PersonId, FirstName, LastName, CreatedDate)
VALUES
(3, , CURRENT_TIMESTAMP);
SET IDENTITY_INSERT dbo.Person OFF; --------------------------------
SET IDENTITY_INSERT dbo.Box ON;
INSERT INTO dbo.Box
(
BoxId,
PersonId,
BoxNo,
QRCode,
ContainerType,
BoxWeight,
BoxPicInside,
BoxPicOutside,
CreatedDate
)
VALUES
(
1,
2,
1,
NULL,
'Cardboard Box',
5.20,
NULL,
NULL,
CURRENT_TIMESTAMP
);
INSERT INTO dbo.Box
(
BoxId,
PersonId,
BoxNo,
QRCode,
ContainerType,
BoxWeight,
BoxPicInside,
BoxPicOutside,
CreatedDate
)
VALUES
(
2,
2,
2,
NULL,
'Cardboard Box',
1.33,
NULL,
NULL,
CURRENT_TIMESTAMP
);
INSERT INTO dbo.Box
(
BoxId,
PersonId,
BoxNo,
QRCode,
ContainerType,
BoxWeight,
BoxPicInside,
BoxPicOutside,
CreatedDate
)
VALUES
(
3,
2,
3,
NULL,
'Plastic Bin',
4.28,
NULL,
NULL,
CURRENT_TIMESTAMP
);
INSERT INTO dbo.Box
(
BoxId,
PersonId,
BoxNo,
QRCode,
ContainerType,
BoxWeight,
BoxPicInside,
BoxPicOutside,
CreatedDate
)
VALUES
(
4,
3,
1,
NULL,
'Cardboard Box',
6.00,
NULL,
NULL,
CURRENT_TIMESTAMP
);
SET IDENTITY_INSERT dbo.Box OFF;
--------------------------------
SET IDENTITY_INSERT dbo.Item ON;
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(1, 1, 'Pants', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(2, 1, 'Shirts', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(3, 1, 'Socks', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(4, 2, 'Makeup', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(5, 2, 'Towels', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(6, 2, 'Bathroom Mat', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(7, 3, 'Cups', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(8, 3, 'Plates', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(9, 3, 'Silverware', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(10, 4, 'Pants', CURRENT_TIMESTAMP);
INSERT INTO dbo.Item
(ItemId, BoxId, ItemName, CreatedDate)
VALUES
(11, 4, 'Shirts', CURRENT_TIMESTAMP);
SET IDENTITY_INSERT dbo.Item OFF;
