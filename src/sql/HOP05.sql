sqlite3 world.db
-- 01 Aggregate Data
-- world.db
.output 'HOP05_World_1.txt'
.headers ON
SELECT COUNT(*) FROM Country
;
.output 'HOP05_World_2.txt'
.headers ON
SELECT Region, COUNT(*)
  FROM Country
  GROUP BY Region
;
.output 'HOP05_World_3.txt'
.headers ON
SELECT Region, COUNT(*) AS Count
  FROM Country
  GROUP BY Region
  ORDER BY Count DESC, Region
;
-- album.db
use album.db
.output 'HOP05_Album_4.txt'
.headers ON
SELECT a.title AS Album, COUNT(t.track_number) as Tracks
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  GROUP BY a.id
  ORDER BY Tracks DESC, Album
;

.output 'HOP05_Album_5.txt'
.headers ON
SELECT a.title AS Album, COUNT(t.track_number) as Tracks
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  GROUP BY a.id
  HAVING Tracks >= 10
  ORDER BY Tracks DESC, Album
;

.output 'HOP05_Album_6.txt'
.headers ON
SELECT a.title AS Album, COUNT(t.track_number) as Tracks
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  WHERE a.artist = 'The Beatles'
  GROUP BY a.id
  HAVING Tracks >= 10
  ORDER BY Tracks DESC, Album
;

-- 02 Aggregate functions
-- world.db
use world.db
.output 'HOP05_World_2_1.txt'
.headers ON
SELECT COUNT(*) FROM Country;
.output 'HOP05_World_2_2.txt'
.headers ON
SELECT COUNT(Population) FROM Country;
.output 'HOP05_World_2_3.txt'
.headers ON
SELECT AVG(Population) FROM Country;
.output 'HOP05_World_2_4.txt'
.headers ON
SELECT Region, AVG(Population) FROM Country GROUP BY Region;
.output 'HOP05_World_2_5.txt'
.headers ON
SELECT Region, MIN(Population), MAX(Population) FROM Country GROUP BY Region;
.output 'HOP05_World_2_6.txt'
.headers ON
SELECT Region, SUM(Population) FROM Country GROUP BY Region;
-- 03 DISTINCT Aggregates
-- world.db
.output 'HOP05_World_3_1.txt'
.headers ON
SELECT COUNT(HeadOfState) FROM Country;
.output 'HOP05_World_3_2.txt'
.headers ON
SELECT HeadOfState FROM Country ORDER BY HeadOfState;
.output 'HOP05_World_3_3.txt'
.headers ON
SELECT COUNT(DISTINCT HeadOfState) FROM Country;
