/* This query shows the number of competitions (even unconfirmed, I don't know how to remove them) per year for the Philippines */

SELECT YEAR(start_date) AS year, COUNT(DISTINCT id) AS num_comps
FROM Competitions
WHERE YEAR(start_date) >= 2007
AND countryId = "Philippines"
GROUP BY YEAR(start_date)
ORDER BY YEAR(start_date);
