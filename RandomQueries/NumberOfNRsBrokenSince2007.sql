/* This query shows the total number of NRs (National Records) broken per year in the Philippines */

SELECT year, NRs
FROM (
    SELECT YEAR(c.end_date) AS year,
           SUM(
               CASE WHEN r.regionalSingleRecord IS NOT NULL THEN 1 ELSE 0 END +
               CASE WHEN r.regionalAverageRecord IS NOT NULL THEN 1 ELSE 0 END
           ) AS NRs
    FROM Results r
    JOIN Competitions c ON r.competitionId = c.id
    WHERE c.end_date >= '2007-01-01' AND r.countryId = 'Philippines'
    GROUP BY year
) AS Subquery
GROUP BY NRs, year 
ORDER BY year ASC
