# MySQL Table Structure

```SQL
SELECT customers.customerNumber, customerName, orderNumber, status
FROM customers
LEFT JOIN orders
ON orders.customerNumber = customers.customerNumber;
```

| customerNumber | customerName       | orderNumber | status  |
| -------------- | ------------------ | ----------- | ------- |
| 103            | Atelier graphique  | 10123       | Shipped |
| 103            | Atelier graphique  | 10298       | Shipped |
| 103            | Atelier graphique  | 10345       | Shipped |
| 112            | Signal Gift Stores | 10124       | Shipped |

| contactFirstName | city          |
| ---------------- | ------------- |
| Jean             | Las Vegas     |
| Susan            | San Rafael    |
| Julie            | San Francisco |

| customerNumber | amount    |
| -------------- | --------- |
| 114            | 82261.22  |
| 121            | 50218.95  |
| 124            | 101244.59 |
| 124            | 85410.87  |
| 124            | 83598.04  |
| 124            | 55639.66  |

| contactFirstName | city          |
| ---------------- | ------------- |
| Jonas            | Stavern       |
| Susan            | San Rafael    |
| Julie            | San Francisco |
| Eric             | Singapore     |
| Wendy            | Singapore     |
