# SQL Commands

## Glossary of commonly used SQL commands

### Background

SQL, Structured Query Language, is a programming language designed to manage data stored in relational databases. \
SQL operates through simple, declarative statements. \
This keeps data accurate and secure, and it helps maintain the integrity of databases, regardless of size.

Here's an appendix of commonly used commands.

### Commands

1. `ALTER TABLE`
   ALTER TABLE lets you add columns to a table in a database.

   ```sql
   ALTER TABLE table_name
   ADD column_name datatype;
   ```

1. `AND`
   AND is an operator that combines two conditions. Both conditions must be true for the row to be included in the result set.

   ```sql
   SELECT column_name(s)
   FROM table_name
   WHERE column_1 = value_1
     AND column_2 = value_2;
   ```

1. `AS`
   AS is a keyword in SQL that allows you to rename a column or table using an alias.

   ```sql
   SELECT column_name AS 'Alias'
   FROM table_name;
   ```

1. `AVG()`
   AVG() is an aggregate function that returns the average value for a numeric column.

   ```sql
   SELECT AVG(column_name)
   FROM table_name;
   ```

1. `BETWEEN`
   The BETWEEN operator is used to filter the result set within a certain range. The values can be numbers, text or dates.

   ```sql
   SELECT column_name(s)
   FROM table_name
   WHERE column_name BETWEEN value_1 AND value_2;
   ```

1. `CASE`
   CASE statements are used to create different outputs (usually in the SELECT statement). It is SQL’s way of handling if-then logic.

   ```sql
   SELECT column_name,
     CASE
       WHEN condition THEN 'Result_1'
       WHEN condition THEN 'Result_2'
       ELSE 'Result_3'
     END
   FROM table_name;
   ```

1. `COUNT()`
   COUNT() is a function that takes the name of a column as an argument and counts the number of rows where the column is not NULL.

   ```sql
   SELECT COUNT(column_name)
   FROM table_name;
   ```

1. `CREATE TABLE`
   CREATE TABLE creates a new table in the database. It allows you to specify the name of the table and the name of each column in the table.

   ```sql
   CREATE TABLE table_name (
     column_1 datatype,
     column_2 datatype,
     column_3 datatype
   );
   ```

1. `DELETE`
   DELETE statements are used to remove rows from a table.

   ```sql
   DELETE FROM table_name
   WHERE some_column = some_value;
   ```

1. `GROUP BY`
   GROUP BY is a clause in SQL that is only used with aggregate functions. It is used in collaboration with the SELECT statement to arrange identical data into groups.

   ```sql
   SELECT column_name, COUNT(*)
   FROM table_name
   GROUP BY column_name;
   ```

1. `HAVING`
   HAVING was added to SQL because the WHERE keyword could not be used with aggregate functions.

   ```sql
   SELECT column_name, COUNT(*)
   FROM table_name
   GROUP BY column_name
   HAVING COUNT(*) > value;
   ```

1. `INNER JOIN`
   An inner join will combine rows from different tables if the join condition is true.

   ```sql
   SELECT column_name(s)
   FROM table_1
   JOIN table_2
     ON table_1.column_name = table_2.column_name;
   ```

1. `INSERT`
   INSERT statements are used to add a new row to a table.

   ```sql
   INSERT INTO table_name (column_1, column_2, column_3)
   VALUES (value_1, 'value_2', value_3);
   ```

1. `IS NULL` / `IS NOT NULL`
   IS NULL and IS NOT NULL are operators used with the WHERE clause to test for empty values.

   ```sql
   SELECT column_name(s)
   FROM table_name
   WHERE column_name IS NULL;
   ```

1. `LIKE`
   LIKE is a special operator used with the WHERE clause to search for a specific pattern in a column.

   ```sql
   SELECT column_name(s)
   FROM table_name
   WHERE column_name LIKE pattern;
   ```

1. `LIMIT`
   LIMIT is a clause that lets you specify the maximum number of rows the result set will have.

   ```sql
   SELECT column_name(s)
   FROM table_name
   LIMIT number;
   ```

1. `MAX()`
   MAX() is a function that takes the name of a column as an argument and returns the largest value in that column.

   ```sql
   SELECT MAX(column_name)
   FROM table_name;
   ```

1. `MIN()`
   MIN() is a function that takes the name of a column as an argument and returns the smallest value in that column.

   ```sql
   SELECT MIN(column_name)
   FROM table_name;
   ```

1. `OR`
   OR is an operator that filters the result set to only include rows where either condition is true.

   ```sql
   SELECT column_name
   FROM table_name
   WHERE column_name = value_1
      OR column_name = value_2;
   ```

1. `ORDER BY`
   ORDER BY is a clause that indicates you want to sort the result set by a particular column either alphabetically or numerically.

   ```sql
   SELECT column_name
   FROM table_name
   ORDER BY column_name ASC | DESC;
   ```

1. `OUTER JOIN`
   An outer join will combine rows from different tables even if the join condition is not met. Every row in the left table is returned in the result set, and if the join condition is not met, then NULL values are used to fill in the columns from the right table.

   ```sql
   SELECT column_name(s)
   FROM table_1
   LEFT JOIN table_2
     ON table_1.column_name = table_2.column_name;
   ```

1. `ROUND()`
   ROUND() is a function that takes a column name and an integer as arguments. It rounds the values in the column to the number of decimal places specified by the integer.

   ```sql
   SELECT ROUND(column_name, integer)
   FROM table_name;
   ```

1. `SELECT`
   SELECT statements are used to fetch data from a database. Every query will begin with SELECT.

   ```sql
   SELECT column_name
   FROM table_name;
   ```

1. `SELECT DISTINCT`
   SELECT DISTINCT specifies that the statement is going to be a query that returns unique values in the specified column(s).

   ```sql
   SELECT DISTINCT column_name
   FROM table_name;
   ```

1. `SUM`
   SUM() is a function that takes the name of a column as an argument and returns the sum of all the values in that column.

   ```sql
   SELECT SUM(column_name)
   FROM table_name;
   ```

1. `UPDATE`
   UPDATE statements allow you to edit rows in a table.

   ```sql
   UPDATE table_name
   SET some_column = some_value
   WHERE some_column = some_value;
   ```

1. `WHERE`
   WHERE is a clause that indicates you want to filter the result set to include only rows where the following condition is true.

   ```sql
   SELECT column_name(s)
   FROM table_name
   WHERE column_name operator value;
   ```

1. `WITH`
   WITH clause lets you store the result of a query in a temporary table using an alias. You can also define multiple temporary tables using a comma and with one instance of the WITH keyword.
   The WITH clause is also known as common table expression (CTE) and subquery factoring.

   ```sql
   WITH temporary_name AS (
      SELECT *
      FROM table_name)
   SELECT *
   FROM temporary_name
   WHERE column_name operator value;
   ```
