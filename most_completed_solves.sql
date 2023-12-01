/* This query shows the number of completed solves a Filipino has done (for a specific year) */

SELECT 
    num.personId, 
    num.name,
    num.solves
FROM (
    SELECT 
        r.personId, 
        r.personName AS name,
        COUNT(DISTINCT r.competitionId) as numComps,
        SUM(
            CASE WHEN r.value1 > 0 THEN 1 ELSE 0 END +
            CASE WHEN r.value2 > 0 THEN 1 ELSE 0 END +
            CASE WHEN r.value3 > 0 THEN 1 ELSE 0 END +
            CASE WHEN r.value4 > 0 THEN 1 ELSE 0 END +
            CASE WHEN r.value5 > 0 THEN 1 ELSE 0 END
        ) as solves
    FROM Results r
    JOIN Competitions c ON r.competitionId = c.id
    WHERE r.countryId = 'Philippines'
      AND c.end_date LIKE ':year%'
    GROUP BY r.personId
) num
ORDER BY num.solves DESC;

