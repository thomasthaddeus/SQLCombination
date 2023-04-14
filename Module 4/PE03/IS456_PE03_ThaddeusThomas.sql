--Task 1
SELECT InvoiceId,
       CustomerId,
       InvoiceDate
  FROM invoices
 ORDER BY InvoiceDate ASC;
 

-- Task 2
SELECT DISTINCT (city) 
  FROM customers
  ORDER BY city DESC;


-- Task 3
SELECT name, composer, AlbumId
  FROM tracks;
  

-- Task 3-2
SELECT *
  FROM albums
  JOIN tracks
    ON albums.AlbumId = tracks.AlbumId
  WHERE tracks.AlbumId > 5
  GROUP BY albums.AlbumId
  ORDER BY albums.AlbumId DESC;