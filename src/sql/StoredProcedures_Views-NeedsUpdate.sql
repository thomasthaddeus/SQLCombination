--------------------------------
-- Create Views
CREATE VIEW dbo.NumBoxesByPerson
AS
(SELECT concat(p.FirstName,' ',p.LastName) as FullName,
p.PersonId,
count(b.BoxId) as NumBoxes,
sum(b.BoxWeight) as TotalWeightAllBoxes
from dbo.Person p
left join dbo.Box b on b.PersonId = p.PersonId
group by p.PersonId, p.FirstName, p.LastName;
CREATE VIEW dbo.NumItemsByPerson
AS
(SELECT concat(p.FirstName,' ',p.LastName) as FullName,
p.PersonId,
count(i.ItemId) as NumItems
from dbo.Person p
left join dbo.Box b on b.PersonId = p.PersonId
left join dbo.Item i on i.BoxId = b.BoxId
group by p.PersonId, p.FirstName, p.LastName);
--------------------------------
-- Create Stored PROCEDURES
CREATE PROCEDURE dbo.BoxesItemsByPerson
(@personid as int)
AS
BEGIN
(SELECT nb.FullName, nb.NumBoxes, ni.NumItems
from dbo.NumBoxesByPerson nb
join dbo.NumItemsByPerson ni on ni.PersonId = nb.PersonId
where nb.PersonId = @personid)
END;
CREATE PROCEDURE dbo.RemoveWhiteSpace
AS
BEGIN
update dbo.Person
set FirstName = trim(FirstName), LastName = trim(LastName)
END;