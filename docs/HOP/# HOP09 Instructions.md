# HOP09 Instructions

Find the Docker App and double-click
Open your terminal / command prompt and type the following:
    mysql -h 127.0.0.1 -P 3307 -p -u root
    passwd
    USE classicmodels;
 
The WHERE clause

SELECT contactFirstName, city FROM customers WHERE country = 'USA';
SELECT customerNumber, amount FROM payments WHERE amount >= 50000;
SELECT contactFirstName, city FROM customers WHERE city LIKE 's%';

Technical: What is the command for? Why would you use the command?
Knowledge: Would a business user understand this data?

---

SQL JOIN

SELECT productCode, productName, textDescription FROM products t1 INNER JOIN productlines t2 ON t1.productline = t2.productline;

Questions you can answer for submission:
Technical: What is the command for? Why would you use the command?
Knowledge: Would a business user understand this data?
 
INNER JOIN, GROUP BY, and SUM

This query returns order number, order status and total sales from the orders and orderdetails tables using the INNER JOIN clause with the GROUP BY clause:


Source: https://www.mysqltutorial.org/mysql-inner-join.aspx

Extract records that matches in both tables and group by
SELECT t1.orderNumber, t1.status, SUM(quantityOrdered * priceEach) total FROM orders t1 INNER JOIN orderdetails t2 ON t1.orderNumber = t2.orderNumber GROUP BY orderNumber;

+-------------+------------+----------+
| orderNumber | status     | total    |
+-------------+------------+----------+
|       10100 | Shipped    | 10223.83 |
|       10101 | Shipped    | 10549.01 |
|       10102 | Shipped    |  5494.78 |
|       10103 | Shipped    | 50218.95 |
|       10104 | Shipped    | 40206.20 |

Questions you can answer for submission:
Technical: What is the command for? Why would you use the command?
Knowledge: Would a business user understand this data?
 

INNER JOIN 3 Tables





Source: https://www.mysqltutorial.org/mysql-inner-join.aspx

Join 3 tables
SELECT orderNumber, orderDate, orderLineNumber, productName, quantityOrdered, priceEach FROM orders INNER JOIN orderdetails USING (orderNumber) INNER JOIN products USING (productCode) ORDER BY orderNumber, orderLineNumber;

+-------------+------------+-----------------+---------------------------------------------+-----------------+-----------+
| orderNumber | orderDate  | orderLineNumber | productName                                 | quantityOrdered | priceEach |
+-------------+------------+-----------------+---------------------------------------------+-----------------+-----------+
|       10100 | 2003-01-06 |               1 | 1936 Mercedes Benz 500k Roadster            |              49 |     35.29 |
|       10100 | 2003-01-06 |               2 | 1911 Ford Town Car                          |              50 |     55.09 |
|       10100 | 2003-01-06 |               3 | 1917 Grand Touring Sedan                    |              30 |    136.00 |
|       10100 | 2003-01-06 |               4 | 1932 Alfa Romeo 8C2300 Spider Sport         |              22 |     75.46 |
|       10101 | 2003-01-09 |               1 | 1928 Mercedes-Benz SSK                      |              26 |    167.06 |

Questions you can answer for submission:
Technical: What is the command for? Why would you use the command?
Knowledge: Would a business user understand this data?
 

INNER JOIN using operators





Source: https://www.mysqltutorial.org/mysql-inner-join.aspx

So far, you have seen that the join condition used the equal operator (=) for matching rows.
In addition to the equal operator (=), you can use other operators such as greater than ( >), less than ( <), and not-equal ( <>) operator to form the join condition.
The following query uses a less-than ( <) join to find sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product.

SELECT orderNumber, productName, msrp, priceEach FROM products p INNER JOIN orderdetails o ON p.productcode = o.productcode AND p.msrp > o.priceEach WHERE p.productcode = 'S10_1678';

+-------------+---------------------------------------+-------+-----------+
| orderNumber | productName                           | msrp  | priceEach |
+-------------+---------------------------------------+-------+-----------+
|       10107 | 1969 Harley Davidson Ultimate Chopper | 95.70 |     81.35 |
|       10121 | 1969 Harley Davidson Ultimate Chopper | 95.70 |     86.13 |
|       10134 | 1969 Harley Davidson Ultimate Chopper | 95.70 |     90.92 |
|       10145 | 1969 Harley Davidson Ultimate Chopper | 95.70 |     76.56 |
|       10159 | 1969 Harley Davidson Ultimate Chopper | 95.70 |     81.35 |

Questions you can answer for submission:
Technical: What is the command for? Why would you use the command?
Knowledge: Would a business user understand this data?

LEFT JOIN

The LEFT JOIN allows you to query data from two or more tables. Similar to the INNER JOIN clause, the LEFT JOIN is an optional clause of the SELECT statement, which appears immediately after the FROM clause.
Suppose that you want to join two tables t1 and t2.

Syntax: SELECT column/s FROM table1 LEFT JOIN table2 ON join_condition;




Source: https://www.mysqltutorial.org/mysql-left-join.aspx

SELECT customers.customerNumber, customerName, orderNumber, status FROM customers LEFT JOIN orders ON orders.customerNumber = customers.customerNumber;

+----------------+------------------------------------+-------------+------------+
| customerNumber | customerName                       | orderNumber | status     |
+----------------+------------------------------------+-------------+------------+
|            103 | Atelier graphique                  |       10123 | Shipped    |
|            103 | Atelier graphique                  |       10298 | Shipped    |
|            103 | Atelier graphique                  |       10345 | Shipped    |
|            112 | Signal Gift Stores                 |       10124 | Shipped    |
In this example:
•	The customers is the left table and orders is the right table.
•	The LEFT JOIN clause returns all customers including the customers who have no order. If a customer has no order, the values in the column orderNumber and status are NULL.
Questions you can answer for submission:
Technical: What is the command for? Why would you use the command?
Knowledge: Would a business user understand this data?
 
RIGHT JOIN

Suppose that you want to join two tables t1 and t2. MySQL RIGHT JOIN is similar to LEFT JOIN, except that the treatment of the joined tables is reversed.

Syntax: SELECT column/s FROM table1 RIGHT JOIN table2 ON join_condition;


Source: https://www.mysqltutorial.org/mysql-right-join/

SELECT employeeNumber, customerNumber FROM customers RIGHT JOIN employees ON salesRepEmployeeNumber = employeeNumber ORDER BY employeeNumber;

+----------------+----------------+
| employeeNumber | customerNumber |
+----------------+----------------+
|           1002 |           NULL |
|           1056 |           NULL |
|           1076 |           NULL |
|           1088 |           NULL |
|           1102 |           NULL |
|           1143 |           NULL |
|           1165 |            124 |
|           1165 |            129 |
In this example:
•	The RIGHT JOIN returns all rows from the table employees whether rows in the table employees have matching values in the column salesRepEmployeeNumber of the table customers.
•	If a row from the table employees has no matching row from the table customers , the RIGHT JOIN uses NULL for the customerNumber column.
Questions you can answer for submission:
Technical: What is the command for? Why would you use the command?
Knowledge: Would a business user understand this data?
