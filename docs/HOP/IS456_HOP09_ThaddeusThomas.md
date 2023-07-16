# HOP09 Instructions

Find the Docker App and double-click
Open your terminal / command prompt and type the following:

```go
mysql -h 127.0.0.1 -P 3307 -p -u root
passwd
```

```SQL
USE classicmodels;
```

## The WHERE clause

```SQL
SELECT contactFirstName, city FROM customers WHERE country = 'USA';
SELECT customerNumber, amount FROM payments WHERE amount >= 50000;
SELECT contactFirstName, city FROM customers WHERE city LIKE 's%';
```

1. Technical: What is the command for? Why would you use the command?
    1. Narrowing the focus of the results returned
1. Knowledge: Would a business user understand this data?
    1. If they didn't understand it they should choose a new line of work.

---

## SQL JOIN

```SQL
SELECT productCode, productName, textDescription
FROM products t1
INNER JOIN productlines t2
ON t1.productline = t2.productline;
```

### Questions you can answer for submission:

1. Technical: What is the command for? Why would you use the command?
    1. Correlation of data on two different tables
1. Knowledge: Would a business user understand this data?
    1. They should understand it. Will they is a different question.
---

## INNER JOIN, GROUP BY, & SUM 

```SQL
SELECT t1.orderNumber, t1.status, SUM(quantityOrdered * priceEach) total
FROM orders t1
INNER JOIN orderdetails t2 ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;
```

### Questions you can answer for submission:

1. Technical: What is the command for? Why would you use the command?
    1. This query returns order number, order status and total sales from the orders and orderdetails tables using the INNER JOIN clause with the GROUP BY clause:
1. Knowledge: Would a business user understand this data?
    1. can they read?

---

## INNER JOIN 3 Tables

```SQL
SELECT orderNumber, orderDate, orderLineNumber, productName, quantityOrdered, priceEach
FROM orders
INNER JOIN orderdetails USING (orderNumber)
INNER JOIN products USING (productCode)
ORDER BY orderNumber, orderLineNumber;
```

### Questions you can answer for submission:

1. Technical: What is the command for? Why would you use the command?
    1. Returns what the two tables have thats alike and only that.
1. Knowledge: Would a business user understand this data?
    1. Maybe. Of course the world is full of people who got somewhere without knowing anything. So sure They could fake understand this!
---

## INNER JOIN using operators

```SQL
SELECT orderNumber, productName, msrp, priceEach
FROM products p
INNER JOIN orderdetails o
    ON p.productcode = o.productcode
    AND p.msrp > o.priceEach
WHERE p.productcode = 'S10_1678';
```

### Questions you can answer for submission:

1. Technical: What is the command for? Why would you use the command?
    1. What command? Specifics? These moronic questions exacerbate my my low tolerance for stupidity.
2. Knowledge: Would a business user understand this data?
   1. No

---

## LEFT JOIN

```SQL
SELECT customers.customerNumber, customerName, orderNumber, status
FROM customers
LEFT JOIN orders
ON orders.customerNumber = customers.customerNumber;
```

### Questions you can answer for submission:

1. Technical: What is the command for? Why would you use the command?
    1. The LEFT JOIN clause returns all customers including the customers who have no order. If a customer has no order, the values in the column orderNumber and status are NULL.
1. Knowledge: Would a business user understand this data?
    1. No

---
 
## RIGHT JOIN

```SQL
SELECT employeeNumber, customerNumber
FROM customers
RIGHT JOIN employees
ON salesRepEmployeeNumber = employeeNumber
ORDER BY employeeNumber;
```

### Questions you can answer for submission:

1. Technical: What is the command for? Why would you use the command?
   1. RIGHT JOIN is for when you want to see whether two tables have something not in common with each other.
2. Knowledge: Would a business user understand this data?
   1. No
