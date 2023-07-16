# IS 456 IT Database Systems Management

## Programming Exercise 3

```text
4/13/2021 Developed by Farzin Bahadori </br>
School of Technology & Computing @ City University of Seattle (CityU)
```

- [IS 456 IT Database Systems Management](#is-456-it-database-systems-management)
  - [Programming Exercise 3](#programming-exercise-3)
    - [Task 1](#task-1)
    - [Task 2](#task-2)
    - [Task 3](#task-3)

- Use the Chinook Database

### Task 1

- Write a `SELECT` statement to return the `Invoiceid`, `Customerid` and `Invoicedate` _columns_ from the `invoices` **table**
- Use the `ORDER BY` clause to sort `invoicedate` in `ASC` order.

    ```sql
    SELECT InvoiceId,
           CustomerId,
           InvoiceDate
    FROM invoices
    ORDER BY InvoiceDate ASC;
    ```

    ![Results](./Result_1.png)

---

### Task 2

- Write a `SELECT` statement that will remove the duplicate records from the `city` _column_ from the `customers` **table**.

    ```SQL
    SELECT DISTINCT(city)
    FROM customers
    ORDER BY city DESC;
    ```

    ![Results](./result_2.png)

---

### Task 3

- Write a `SELECT` statement to return `name`, `composer` and `albumid` from `tracks` **table**
- Write a `SELECT` statement to return `albums` with `id number` `higher than 5`.
- `Order` the results by `Order Value descending`.

    ```SQL
    --Task 3-1
    SELECT name, composer, AlbumId
    FROM tracks;
    ```

    ![Results](./result_3_1.png)

    ```sql
    -- Task 3-2
    SELECT *
    FROM albums
    JOIN tracks
        ON albums.AlbumId = tracks.AlbumId
    WHERE tracks.AlbumId > 5
    GROUP BY albums.AlbumId
    ORDER BY albums.AlbumId DESC;
    ```

    ![Results](./result_3_2.png)
