/* This query contains all the firstcomers at a certain competition */

SELECT personName
FROM (
    SELECT *
    FROM (
        SELECT
            r.personId,
            r.personName,
            r.competitionId
        FROM Results r
        JOIN Competitions c ON r.competitionId = c.id
        ORDER BY c.start_date
    ) AS orderedResults
    GROUP BY personId
) AS firstComps
WHERE competitionId = ':competitionId';
