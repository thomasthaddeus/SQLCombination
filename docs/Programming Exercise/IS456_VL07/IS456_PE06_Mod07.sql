--Task 1
SELECT a.ArtistId, al.AlbumId
FROM artists a
LEFT JOIN albums al
ON a.ArtistId = al.ArtistId
;

--Task 2
SELECT T.trackid, T.name, A.title
FROM albums A
INNER JOIN tracks T
        ON A.AlbumId = T.AlbumId
;

--Task 3
SELECT *
FROM albums A
CROSS JOIN tracks T
        ON A.AlbumId = T.AlbumId
CROSS JOIN media_types M
        ON T.MediaTypeId = M.MediaTypeId
;

--Task 4
SELECT m.FirstName || ' ' || m.LastName AS Manager,
       e.FirstName || ' ' || e.LastName AS Employee
FROM employees E
INNER JOIN employees M
        ON M.EmployeeId = E.ReportsTo
ORDER BY Manager
;