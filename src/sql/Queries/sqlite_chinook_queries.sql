SELECT *
FROM tracks
WHERE name LIKE 'Wild%';


SELECT *
FROM tracks
WHERE name GLOB '*Man';


SELECT trackid,
       albumid,
       name
FROM tracks
WHERE albumid = (
        SELECT albumid
        FROM albums
        WHERE title = 'Let There Be Rock'
);

SELECT 
    customerid,
    firstname,
    lastname
FROM customers
WHERE supportrepid IN (
           SELECT employeeid AS 'empId'
             FROM employees
            WHERE country = 'Canada'
       );