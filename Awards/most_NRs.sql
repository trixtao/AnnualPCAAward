/* This query contains Filipinos with the most National Records (in a specific year), you can fill out the year. */

SELECT SUM(CASE WHEN regionalSingleRecord IS NOT NULL THEN 1 ELSE 0 END + CASE WHEN regionalAverageRecord IS NOT NULL THEN 1 ELSE 0 END) AS NRs, personId FROM Results r, Competitions c
WHERE r.competitionId = c.id
AND c.end_date LIKE ":year%"
AND r.countryId = "Philippines"
GROUP BY personId 
ORDER BY NRs DESC
