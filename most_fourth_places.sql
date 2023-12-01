SELECT 
    r.personId,
    COUNT(*) AS Num4thPlaces,
    COUNT(DISTINCT(r.eventId)) as 4thPlaceEvents,
    GROUP_CONCAT(DISTINCT(r.eventId) SEPARATOR ', ') as EventList
FROM 
    Results r 
JOIN 
    Competitions c 
ON 
    c.id = r.competitionId 
WHERE 
    r.best > 0 AND 
    r.pos = 4 AND 
    r.roundTypeId IN ('c', 'f') AND 
    r.CountryId = "Philippines" AND
    c.end_date LIKE ':year%'
GROUP BY
    r.personId
ORDER BY 
    Num4thPlaces DESC 

