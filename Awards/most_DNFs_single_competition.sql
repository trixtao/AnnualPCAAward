/* This query shows the Filipinos with the most DNFs in a single competition */

SELECT b.personName, b.countryId, b.competitionId, SUM(b.DNFs) AS DNFs
FROM (
    SELECT 
        a.personId, 
        a.personName, 
        a.countryId, 
        a.competitionId, 
        (a.v1 + a.v2 + a.v3 + a.v4 + a.v5) AS DNFs
    FROM (
        SELECT 
            personId, 
            personName, 
            countryId, 
            competitionId, 
            (CASE value1 WHEN -1 THEN 1 ELSE 0 END) AS v1, 
            (CASE value2 WHEN -1 THEN 1 ELSE 0 END) AS v2, 
            (CASE value3 WHEN -1 THEN 1 ELSE 0 END) AS v3, 
            (CASE value4 WHEN -1 THEN 1 ELSE 0 END) AS v4, 
            (CASE value5 WHEN -1 THEN 1 ELSE 0 END) AS v5 
        FROM Results
    ) a
) b
WHERE countryId = "Philippines"
GROUP BY personId, competitionId
ORDER BY DNFs DESC;

/* This query shows the Filipinos with teh most DNFs in a single competition in 2023 */
SELECT 
    b.personName, 
    b.countryId, 
    b.competitionId, 
    SUM(b.DNFs) AS DNFs
FROM (
    SELECT 
        r.personId, 
        r.personName, 
        r.countryId, 
        r.competitionId, 
        (CASE r.value1 WHEN -1 THEN 1 ELSE 0 END +
         CASE r.value2 WHEN -1 THEN 1 ELSE 0 END +
         CASE r.value3 WHEN -1 THEN 1 ELSE 0 END +
         CASE r.value4 WHEN -1 THEN 1 ELSE 0 END +
         CASE r.value5 WHEN -1 THEN 1 ELSE 0 END) AS DNFs
    FROM Results r
    JOIN Competitions c ON r.competitionId = c.id
    WHERE r.countryId = 'Philippines'
    AND c.end_date LIKE '2023%'
) b
GROUP BY b.personId, b.competitionId, b.personName, b.countryId
ORDER BY DNFs DESC;

/* This query shows the Filipinos with the most DNFs in all the competitions they have been to (for a specific year) */

SELECT 
    b.personId, 
    b.personName, 
    b.countryId,
    SUM(b.DNFs) AS TotalDNFs
FROM (
    SELECT 
        r.personId, 
        r.personName, 
        r.countryId,
        (CASE r.value1 WHEN -1 THEN 1 ELSE 0 END +
         CASE r.value2 WHEN -1 THEN 1 ELSE 0 END +
         CASE r.value3 WHEN -1 THEN 1 ELSE 0 END +
         CASE r.value4 WHEN -1 THEN 1 ELSE 0 END +
         CASE r.value5 WHEN -1 THEN 1 ELSE 0 END) AS DNFs
    FROM Results r
    JOIN Competitions c ON r.competitionId = c.id
    WHERE r.countryId = 'Philippines'
    AND YEAR(c.end_date) = :year  
) b
GROUP BY b.personId, b.personName, b.countryId
ORDER BY TotalDNFs DESC;
