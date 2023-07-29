/*--------------
Hands-On Practice 05
SECTION 01:	Aggregate Data
Database:	world.db
---------------*/

-- Query #1
SELECT COUNT(*)
  FROM Country
;

-- Query #2
SELECT 
    Region, 
    COUNT(*)
  FROM Country
  GROUP BY Region
;

-- Query #3
SELECT 
    Region,
    COUNT(*) AS Count
  FROM Country
  GROUP BY Region
  ORDER BY Count DESC, Region
;

/*--------------
----album.db----
---------------*/

-- Query #4
SELECT 
    a.title AS Album, 
    COUNT(t.track_number) as Tracks
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  GROUP BY a.id
  ORDER BY Tracks DESC, Album
;

-- Query #5
SELECT 
    a.title AS Album, 
    COUNT(t.track_number) AS Tracks
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  GROUP BY a.id
  HAVING Tracks >= 10
  ORDER BY Tracks DESC, Album
;

-- Query #6
SELECT a.title AS Album, COUNT(t.track_number) as Tracks
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  WHERE a.artist = 'The Beatles'
  GROUP BY a.id
  HAVING Tracks >= 10
  ORDER BY Tracks DESC, Album
;

/*------------------------
SECTION 02: Aggregate functions
Database:   world.db
--------------------------*/
-- Query #7
SELECT COUNT(*) FROM Country;

-- Query #8
SELECT COUNT(Population) FROM Country;

-- Query #9
SELECT AVG(Population) FROM Country;

-- Query #10
SELECT Region, AVG(Population) FROM Country GROUP BY Region;

-- Query #11
SELECT Region, MIN(Population), MAX(Population) FROM Country GROUP BY Region;

-- Query #12
SELECT Region, SUM(Population) FROM Country GROUP BY Region;

/*------------------------
SECTION 03: DISTINCT Aggregates
Database:   world.db
--------------------------*/
-- Query #13
SELECT COUNT(HeadOfState) FROM Country;

-- Query #14
SELECT HeadOfState FROM Country ORDER BY HeadOfState;

-- Query #15
SELECT COUNT(DISTINCT HeadOfState) FROM Country;

--***************************************************--

Provide at least 3 screenshots as part of HOP submission.
Write a 150-word summary to explain your understandings and findings from this lab assignment.

