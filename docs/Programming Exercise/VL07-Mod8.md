# IS 456 IT Database Systems Management

## Programming Exercise 7

> 4/13/2021 Developed by Farzin Bahadori
> School of Technology & Computing @ City University of Seattle (CityU)

Database:
Type: SQLite
Name: Chinook

- You may have to join multiple tables in order to solve these tasks
  **NOTE:** You may find these tasks a little challenging

### Task 1

- Build a query that returns the _person_ who has spent the most _money_
- [use `Invoice`, `InvoiceLine`, and `Customer` tables]

```SQL
SELECT SUM(i.Total), c.CustomerId, (c.FirstName || " " || c.LastName) AS Customer
   FROM invoices i
   JOIN customers c
      ON c.CustomerId = i.CustomerId
   GROUP BY 2
   ORDER BY 1 DESC
   LIMIT 5
   ;
```

### Task 1 Output

![Output](/img/1-1.png)

| SUM(i.Total) | CustomerId | Customer           |
| ------------ | ---------- | ------------------ |
| 49.62        | 6          | Helena Holý        |
| 47.62        | 26         | Richard Cunningham |
| 46.62        | 57         | Luis Rojas         |
| 45.62        | 45         | Ladislav Kovács    |
| 45.62        | 46         | Hugh O'Reilly      |

---

### Task 2

- Use your query to return the `email`, `first name`, `last name`, and Genre of all `Rock Music listeners`.
- Return your list _ordered alphabetically_ by `email address` starting with `A`.
- [`Customer`, `Invoice`, `InvoiceLine`, `Track`, and `Genre` tables]

```SQL
SELECT DISTINCT c.email,
               (c.FirstName || " " || c.LastName) AS Customer,
                g.GenreId,
                g.Name
   FROM customers c
   JOIN invoices i       ON c.CustomerId = i.CustomerId
   JOIN invoice_items ii ON ii.InvoiceId = i.InvoiceId
   JOIN tracks t         ON ii.TrackId = t.TrackId
   JOIN genres g
     ON t.GenreId = g.GenreId
   WHERE g.Name = 'Rock'
   ORDER BY c.email ASC;
```

### Task 2 Output

![Genre](/img/2-1.png)

<details><summary>Full table</summary></details>

| email                           | Customer              | GenreId | Genre |
| ------------------------------- | --------------------- | ------- | ----- |
| `aaronmitchell@yahoo.ca`        | Aaron Mitchell        | 1       | Rock  |
| `alero@uol.com.br`              | Alexandre Rocha       | 1       | Rock  |
| `astrid.gruber@apple.at`        | Astrid Gruber         | 1       | Rock  |
| `bjorn.hansen@yahoo.no`         | Bjørn Hansen          | 1       | Rock  |
| `camille.bernard@yahoo.fr`      | Camille Bernard       | 1       | Rock  |
| `daan_peeters@apple.be`         | Daan Peeters          | 1       | Rock  |
| `diego.gutierrez@yahoo.ar`      | Diego Gutiérrez       | 1       | Rock  |
| `dmiller@comcast.com`           | Dan Miller            | 1       | Rock  |
| `dominiquelefebvre@gmail.com`   | Dominique Lefebvre    | 1       | Rock  |
| `edfrancis@yachoo.ca`           | Edward Francis        | 1       | Rock  |
| `eduardo@woodstock.com.br`      | Eduardo Martins       | 1       | Rock  |
| `ellie.sullivan@shaw.ca`        | Ellie Sullivan        | 1       | Rock  |
| `emma_jones@hotmail.com`        | Emma Jones            | 1       | Rock  |
| `enrique_munoz@yahoo.es`        | Enrique Muñoz         | 1       | Rock  |
| `fernadaramos4@uol.com.br`      | Fernanda Ramos        | 1       | Rock  |
| `fharris@google.com`            | Frank Harris          | 1       | Rock  |
| `fralston@gmail.com`            | Frank Ralston         | 1       | Rock  |
| `frantisekw@jetbrains.com`      | František Wichterlová | 1       | Rock  |
| `ftremblay@gmail.com`           | François Tremblay     | 1       | Rock  |
| `fzimmermann@yahoo.de`          | Fynn Zimmermann       | 1       | Rock  |
| `hannah.schneider@yahoo.de`     | Hannah Schneider      | 1       | Rock  |
| `hholy@gmail.com`               | Helena Holý           | 1       | Rock  |
| `hleacock@gmail.com`            | Heather Leacock       | 1       | Rock  |
| `hughoreilly@apple.ie`          | Hugh O'Reilly         | 1       | Rock  |
| `isabelle_mercier@apple.fr`     | Isabelle Mercier      | 1       | Rock  |
| `jacksmith@microsoft.com`       | Jack Smith            | 1       | Rock  |
| `jenniferp@rogers.ca`           | Jennifer Peterson     | 1       | Rock  |
| `jfernandes@yahoo.pt`           | João Fernandes        | 1       | Rock  |
| `joakim.johansson@yahoo.se`     | Joakim Johansson      | 1       | Rock  |
| `johavanderberg@yahoo.nl`       | Johannes Van der Berg | 1       | Rock  |
| `johngordon22@yahoo.com`        | John Gordon           | 1       | Rock  |
| `jubarnett@gmail.com`           | Julia Barnett         | 1       | Rock  |
| `kachase@hotmail.com`           | Kathy Chase           | 1       | Rock  |
| `kara.nielsen@jubii.dk`         | Kara Nielsen          | 1       | Rock  |
| `ladislav_kovacs@apple.hu`      | Ladislav Kovács       | 1       | Rock  |
| `leonekohler@surfeu.de`         | Leonie Köhler         | 1       | Rock  |
| `lucas.mancini@yahoo.it`        | Lucas Mancini         | 1       | Rock  |
| `luisg@embraer.com.br`          | Luís Gonçalves        | 1       | Rock  |
| `luisrojas@yahoo.cl`            | Luis Rojas            | 1       | Rock  |
| `manoj.pareek@rediff.com`       | Manoj Pareek          | 1       | Rock  |
| `marc.dubois@hotmail.com`       | Marc Dubois           | 1       | Rock  |
| `mark.taylor@yahoo.au`          | Mark Taylor           | 1       | Rock  |
| `marthasilk@gmail.com`          | Martha Silk           | 1       | Rock  |
| `masampaio@sapo.pt`             | Madalena Sampaio      | 1       | Rock  |
| `michelleb@aol.com`             | Michelle Brooks       | 1       | Rock  |
| `mphilips12@shaw.ca`            | Mark Philips          | 1       | Rock  |
| `nschroder@surfeu.de`           | Niklas Schröder       | 1       | Rock  |
| `patrick.gray@aol.com`          | Patrick Gray          | 1       | Rock  |
| `phil.hughes@gmail.com`         | Phil Hughes           | 1       | Rock  |
| `puja_srivastava@yahoo.in`      | Puja Srivastava       | 1       | Rock  |
| `ricunningham@hotmail.com`      | Richard Cunningham    | 1       | Rock  |
| `robbrown@shaw.ca`              | Robert Brown          | 1       | Rock  |
| `roberto.almeida@riotur.gov.br` | Roberto Almeida       | 1       | Rock  |
| `stanisław.wójcik@wp.pl`        | Stanisław Wójcik      | 1       | Rock  |
| `steve.murray@yahoo.uk`         | Steve Murray          | 1       | Rock  |
| `terhi.hamalainen@apple.fi`     | Terhi Hämäläinen      | 1       | Rock  |
| `tgoyer@apple.com`              | Tim Goyer             | 1       | Rock  |
| `vstevens@yahoo.com`            | Victor Stevens        | 1       | Rock  |
| `wyatt.girard@yahoo.fr`         | Wyatt Girard          | 1       | Rock  |

---

### Task 3

- **First**, find which _artist_ has earned the most according to the _InvoiceLines_?
- **Second**, use this _artist_ to find which _customer_ spent the most on this _artist_.
- [use the `Invoice`, `InvoiceLine`, `Track`, `Customer`, `Album`, and `Artist` tables.]

```SQL
WITH IronMaiden AS (
SELECT a.Name, SUM(ii.UnitPrice) AS earned
  FROM artists a
  JOIN albums al ON a.ArtistId = al.ArtistId
  JOIN tracks t  ON al.AlbumId = t.AlbumId
  JOIN invoice_items ii ON ii.TrackId = t.TrackId
  JOIN invoices i ON ii.InvoiceId = i.InvoiceId
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 10)
```

![Number one Seller](/img/3_1.png)

```SQL
SELECT (c.CustomerId || "-" || c.FirstName || " " || c.LastName) AS Customer, SUM(ii.UnitPrice*ii.Quantity) AS Units, i.Total
  FROM invoice_items ii
  JOIN invoices i ON ii.Invoiceid = i.Invoiceid
  JOIN customers c ON c.customerid = i.customerid
  GROUP BY Customer
  ORDER BY Units DESC
  LIMIT 1
;
```

![Number one Customer](/img/3-2.png)

---

### Task 4

- Count how many _songs_ based on `genre` `customer 12` bought
- How much did `customer 13` spent across `genre`?
- How much did each `customer` spend per `genre`?

```SQL
--Query 1
Select SUM(ii.UnitPrice * ii.Quantity) as cust13
FROM invoice_items ii
JOIN invoices i On i.InvoiceId = ii.InvoiceId
WHERE i.customerid = 12;
  ;
```

--Query 2

```SQL
Select SUM(ii.UnitPrice * ii.Quantity) as cust13
FROM invoice_items ii
JOIN invoices i On i.InvoiceId = ii.InvoiceId
WHERE i.customerid = 13
;
```

--Query 3

```SQL
SELECT (c.FirstName || " " || c.LastName) AS Customer, g.Name, SUM(ii.UnitPrice * ii.Quantity) AS Money_Spent
FROM genres g, tracks t, invoice_items ii, invoices i, customers c
WHERE g.GenreId=t.GenreId AND t.trackId=ii.trackId AND ii.invoiceid=i.invoiceid AND i.customerid=c.customerid
GROUP BY 1, 2;
```
