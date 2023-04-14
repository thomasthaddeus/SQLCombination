<h1 style="text-align: center;">IS 456 IT Database Systems Management</h1>
<h2 style="text-align: center;">HOP03 Basic SQLite Functions</h2>
<p style="text-align: center;">4/13/2021 Developed by Farzin Bahadori</p>
<p style="text-align: center;">5/13/2021 Developed by Smita Dutta</p>
<p style="text-align: center;">School of Technology & Computing @ City University of Seattle (CityU)</p>

---

### Before You Start

- The directory path shown in screenshots may be different from yours.
- Some steps are not explained in the tutorial. If you are not sure what to do:
    1. Consult the resources listed below.
    2. If you cannot solve the problem after a few tries, ask a TA for help.

### Learning Outcomes

Students will be able to:

- Understand the SQLite queries.
- Run queries in SQLite.
- Use inbuilt functions.

#### 02 LENGTH

   [world.db]

   ```SQL
   SELECT LENGTH('string');
   SELECT Name, LENGTH(Name) AS Len FROM City ORDER BY Len DESC;
   ```

#### 03 SUBSTR

   [album.db]

   ```SQL
   SELECT SUBSTR('this string', 6);
   SELECT SUBSTR('this string', 6, 3);
   SELECT released,
        SUBSTR(released, 1, 4) AS year,
        SUBSTR(released, 6, 2) AS month,
        SUBSTR(released, 9, 2) AS day
   FROM album
   ORDER BY released;
   ```

#### 04 TRIM

   ```sql
   SELECT TRIM('   string   ');
   SELECT LTRIM('   string   ');
   SELECT RTRIM('   string   ');
   SELECT TRIM('...string...', '.');
   ```

#### 05 UPPER/LOWER

   [world.db]

   ```sql
   SELECT 'StRiNg' = 'string';
   SELECT LOWER('StRiNg') = LOWER('string');
   SELECT UPPER('StRiNg') = UPPER('string');
   SELECT UPPER(Name) FROM City ORDER BY Name;
   SELECT LOWER(Name) FROM City ORDER BY Name;
   ```

#### 02 DATE/TIME functions

   [:memory:]

   ```sql
   SELECT DATETIME('now');
   SELECT DATE('now');
   SELECT TIME('now');
   SELECT DATETIME('now', '+1 day');
   SELECT DATETIME('now', '+3 days');
   SELECT DATETIME('now', '-1 month');
   SELECT DATETIME('now', '+1 year');
   SELECT DATETIME('now', '+3 hours', '+27 minutes', '-1 day', '+3 years');
   ```

#### 02 typeof

   ```sql
   SELECT TYPEOF( 1 + 1 );
   SELECT TYPEOF( 1 + 1.0 );
   SELECT TYPEOF('panda');
   SELECT TYPEOF('panda' + 'koala');
   ```

#### 03 INTEGER division

   ```sql
   SELECT 1 / 2;
   SELECT 1.0 / 2;
   SELECT CAST(1 AS REAL) / 2;
   SELECT 17 / 5;
   SELECT 17 / 5, 17 % 5;
   ```

#### 04 ROUND()

   ```sql
   SELECT 2.55555;
   SELECT ROUND(2.55555);
   SELECT ROUND(2.55555, 3);
   SELECT ROUND(2.55555, 0);
   ```

---

Provide *at least 3* screenshots as part of HOP submission.
![]()
![]()
![]()
![]()
Write a __150-word summary__ to explain your understandings and findings from this lab assignment.
