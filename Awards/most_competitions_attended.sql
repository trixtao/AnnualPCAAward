SELECT 
    r.personId, 
    r.personName AS name,
    COUNT(DISTINCT r.competitionId) AS comps
FROM 
    Results r
JOIN 
    Competitions c ON r.competitionId = c.id
WHERE 
    r.countryId = 'Philippines'
    AND c.end_date LIKE ':year%'
GROUP BY 
    r.personId
ORDER BY 
    comps DESC;
