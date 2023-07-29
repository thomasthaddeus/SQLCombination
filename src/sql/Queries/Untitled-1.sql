SELECT  a.AlbumId AS AlbumId, a.Title AS Title
FROM albums a
	JOIN tracks t
		ON a.AlbumId = t.AlbumId
	JOIN invoice_items ii
		ON t.TrackId = ii.TrackId
	JOIN invoices i
		ii.InvoiceId = i.InvoiceId
	JOIN customers c
		ON i.CustomerId = c.CustomerId