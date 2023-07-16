.output csv
SELECT *
FROM track
GROUP BY title
ORDER BY title ASC
LIMIT 24;