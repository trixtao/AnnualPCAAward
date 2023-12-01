SELECT
    RIGHT(competitionid, 4) AS Year,
    COUNT(DISTINCT personid) AS PersonCount
FROM Results
WHERE countryId = 'Philippines'
GROUP BY RIGHT(competitionid, 4);
