# HOP08

## 1 Creating and Deleting a Database

Open your terminal / command prompt and type the following:
mysql -h 127.0.0.1 -P 3307 -p -u root
When prompted for password: passwd

```sql
USE DATABASE classicmodels;
CREATE SCHEMA test;
SHOW DATABASES;
DROP SCHEMA test;
SHOW DATABASES;
```

### Task_1 Create a schema named zoo

```SQL
USE DATABASE classicmodels;
CREATE SCHEMA zoo;
```

---

## 2 Creating and Deleting a Table

```sql
CREATE TABLE pet (name   VARCHAR(20),
                 owner   VARCHAR(20),
                 species VARCHAR(20),
                 sex     CHAR(1),
                 birth   DATE,
                 death   DATE);
SHOW TABLES;
DESCRIBE pet;
DROP TABLE pet;
```

---

### 2. Questions you can answer for submission:
   1. Knowledge: What does the number in `varchar` do? Why choose number 20?

       ```Plaintext
       Determines how many characters are allowed per cell. 20 is the default
       ```

   1. Knowledge: What does `Null YES` and `Default NULL` do?
       + `NULL YES`
       + `DEFAULT NULL`

---

## 3 Inserting Data Into a Table

### 3.1 Syntax: INSERT INTO table_name VALUES(value_attribute1, value_attribute2 …);

```SQL
INSERT INTO pet VALUES(Papito, Clark, Chihuahua, m, ‘2007-09-30’, NULL);

INSERT INTO pet VALUES ('Papito', 'Clark', 'Chihuahua', 'm', '2007-09-30', NULL);
```

### 3.2 Verify the Inserted Data using SELECT command

```sql
mysql> SELECT * FROM pet;
+--------+-------+-----------+------+------------+-------+
| name   | owner | species   | sex  | birth      | death |
+--------+-------+-----------+------+------------+-------+
| Papito | Clark | Chihuahua | m    | 2007-09-30 | NULL  |
+--------+-------+-----------+------+------------+-------+
1 row in set (0.01 sec)
```

### 3.3 Verify the specific Inserted Data using WHERE command

```sql
mysql> SELECT * FROM pet WHERE name = 'Papito';
+--------+-------+-----------+------+------------+-------+
| name   | owner | species   | sex  | birth      | death |
+--------+-------+-----------+------+------------+-------+
| Papito | Clark | Chihuahua | m    | 2007-09-30 | NULL  |
+--------+-------+-----------+------+------------+-------+
1 row in set (0.00 sec)
```

---

### 3.4 Questions you can answer for submission:

   + Technical: What is the command for? Why would you use the command?
       - I guess I shouldnt be ~~surprised~~ but what command? Is it the ghost command and it works faster than [TRUNCATE] to destroy a table? If its INSERT INTO I imagine its adding something!
   + Knowledge: Can you insert blank values? Why?
       - Yes it will just show up as NULL. Unless the column has a not null constraint
   + Best practice: Why is SELECT * not a good practice for queries? 
       - When you return everything from the database every query It will slow the network and slow the servers on the front end
       - additionally It can cause the data to become corrupted from constantly taxing the memory

---

<details>
    <Summary>Repeated Section</Summary>

## 4_Inserting Data into a Table

### 4.1 Syntax: INSERT INTO table_name VALUES(value_attribute1, value_attribute2 …);

```sql
INSERT INTO pet (Papito, Clark, Chihuahua, m, ‘2007-09-30’, NULL);
mysql> INSERT INTO pet VALUES ('Papito', 'Clark', 'Chihuahua', 'm', '2007-09-30', NULL);mysql> INSERT INTO pet
Query OK, 1 row affected (0.00 sec)
```

### 4.2 Verify the Inserted Data using SELECT command

```SQL
mysql> SELECT * FROM pet;
+--------+-------+-----------+------+------------+-------+
| name   | owner | species   | sex  | birth      | death |
+--------+-------+-----------+------+------------+-------+
| Papito | Clark | Chihuahua | m    | 2007-09-30 | NULL  |
+--------+-------+-----------+------+------------+-------+
1 row in set (0.01 sec)
```

### 4.3 Verify the specific Inserted Data using WHERE command

```SQL
mysql> SELECT * FROM pet WHERE name = 'Papito';
+--------+-------+-----------+------+------------+-------+
| name   | owner | species   | sex  | birth      | death |
+--------+-------+-----------+------+------------+-------+
| Papito | Clark | Chihuahua | m    | 2007-09-30 | NULL  |
+--------+-------+-----------+------+------------+-------+
1 row in set (0.00 sec)
```

1. __Note for submission__: insert `5 pets` in the database and capture that.

### 4.4 Questions you can answer for submission:
__Technical__: What is the command for? Why would you use the command?
__Best practice__: Why is SELECT * not a good practice for queries? 

</details>

## 5. Updating Data

### 5.1 Syntax: UPDATE table_name SET column_name1 = value WHERE condition;

   ```SQL
   UPDATE pet SET species = 'dog' WHERE name = 'Papito';
   mysql> UPDATE pet SET species = 'dog' WHERE name = 'Papito';
   Query OK, 1 row affected (0.01 sec)
   Rows matched: 1  Changed: 1  Warnings: 0
   ```

### 5.2 Verify the Inserted Data using SELECT command

```SQL
mysql> SELECT * FROM pet;
+--------+-------+---------+------+------------+-------+
| name   | owner | species | sex  | birth      | death |
+--------+-------+---------+------+------------+-------+
| Papito | Clark | dog     | m    | 2007-09-30 | NULL  |
+--------+-------+---------+------+------------+-------+
1 row in set (0.00 sec)
```

### 5.3 Questions you can answer for submission:

__Technical__: What is the command for? Why would you use the command?
__Knowledge__: What happens when you use UPDATE while using a WHERE that satisfies multiple rows?
__Knowledge__: What happens when you use UPDATE without a WHERE clause?
 
## 6. Deleting Data

### 6.1 Syntax: DELETE FROM table_name WHERE condition;

   ```SQL
   DELETE FROM pet WHERE name = ‘Meowser’;
   ```

### 6.2 Before deleting

```SQL
mysql> SELECT * FROM pet;
+---------+-------+---------+------+------------+-------+
| name    | owner | species | sex  | birth      | death |
+---------+-------+---------+------+------------+-------+
| Papito  | Clark | dog     | m    | 2007-09-30 | NULL  |
| Meowser | Jason | cat     | f    | 2001-01-22 | NULL  |
| Dolly   | Jake  | sheep   | f    | 1990-04-15 | NULL  |
+---------+-------+---------+------+------------+-------+
3 rows in set (0.01 sec)
```

### 6.3 Executing the delete operations

```SQL
mysql> DELETE FROM pet WHERE sex = 'm';
Query OK, 1 row affected (0.01 sec)
```

```SQL
mysql> SELECT * FROM pet;
+---------+-------+---------+------+------------+-------+
| name    | owner | species | sex  | birth      | death |
+---------+-------+---------+------+------------+-------+
| Meowser | Jason | cat     | f    | 2001-01-22 | NULL  |
| Dolly   | Jake  | sheep   | f    | 1990-04-15 | NULL  |
+---------+-------+---------+------+------------+-------+
2 rows in set (0.00 sec)
```

---

### 6.4 Questions you can answer for submission:

__Technical__: What is the command for? Why would you use the command?
   - When your cat dies you delete him
__Knowledge__: What happens when you use `DELETE` while using a `WHERE` that satisfies multiple rows?
   - It DELs the rows back to the stone age!
__Knowledge__: What happens when you use `DELETE` without a `WHERE` clause?
   - It DELETES everything that satisfies the Query 

---

## 7 Build a new Database and Tables with Primary and Foreign Keys

1. Create a schema called donut_shop

1. Use the donut_shop database

```SQL
CREATE TABLE Customer
(
CustomerID INT NOT NULL AUTO_INCREMENT,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
StreetAddress varchar(20) NOT NULL,
Apartment varchar(20) NOT NULL,
City varchar(20) NOT NULL,
State varchar(20) NOT NULL,
Zip varchar(7) NOT NULL,
HomePhone varchar(14) NOT NULL,
MobilePhone varchar(14),
OtherPhone varchar(14),
PRIMARY KEY (CustomerID)
);

CREATE TABLE Invoice
(
DonutOrderID INT NOT NULL AUTO_INCREMENT,
CustomerID INT NOT NULL,
OrderDate Date NOT NULL,
Notes varchar(255),
PRIMARY KEY (DonutOrderID),
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID )
);

CREATE TABLE Donut
(
DonutID INT NOT NULL AUTO_INCREMENT,
DonutName varchar(20) NOT NULL,
Description varchar(30) NOT NULL,
UnitPrice decimal(5,2) NOT NULL,
PRIMARY KEY (DonutID)
);

CREATE TABLE InvoiceLineItem
(
DonutOrderID INT NOT NULL,
DonutID INT NOT NULL,
Qty INT NOT NULL,
PRIMARY KEY (DonutOrderID,DonutID),
FOREIGN KEY (DonutOrderID) REFERENCES Invoice (DonutOrderID) ,
FOREIGN KEY (DonutID) REFERENCES Donut (DonutID )
);
```

1. `Show the tables of the database`


### Questions you can answer for submission:

__Technical__: What is the command for? Why would you use the command?
   - So you can thoroughly map out all of the data in your database
__Knowledge__: What’s the use of REFERENCES? Why do you need it?
   - If you want any of your Foreign keys to work you have to reference the table they came from
