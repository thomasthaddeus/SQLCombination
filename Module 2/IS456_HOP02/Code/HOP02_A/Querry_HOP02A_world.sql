-- 03 The SELECT statement
-- world.db

SELECT 'Hello, World';
SELECT 'Hello, World' AS Result;
SELECT * FROM Country;
SELECT * FROM Country ORDER BY Name;
SELECT Name, LifeExpectancy FROM Country ORDER BY Name;
SELECT Name, LifeExpectancy AS "Life Expectancy" FROM Country ORDER BY Name;



-- 04 Selecting Rows
-- world.db

SELECT Name, Continent, Region FROM Country;
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Europe';
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Europe' ORDER BY Name;
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Europe' ORDER BY Name LIMIT 5;
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Europe' ORDER BY Name LIMIT 5 OFFSET 5;

-- 05 Selecting Columns
-- world.db

SELECT * from Country;
SELECT Name, Continent, Region from Country;
SELECT Name AS Country, Continent, Region from Country;
SELECT Name AS Country, Region, Continent from Country;

-- 06 Counting Rows
-- world.db

SELECT COUNT(*) FROM Country;
SELECT COUNT(*) FROM Country WHERE Population > 1000000;
SELECT COUNT(*) FROM Country WHERE Population > 100000000;
SELECT COUNT(*) FROM Country WHERE Population > 100000000 AND Continent = 'Europe' ;

SELECT COUNT(*) FROM Country;
SELECT COUNT(LifeExpectancy) FROM Country;
