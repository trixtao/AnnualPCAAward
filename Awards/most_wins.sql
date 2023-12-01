/* This query shows the number of wins a FIlipino has (for a specific year) along with the events they won */

SELECT 
    r.personId,
    COUNT(*) AS Num1stPlaces,
    COUNT(DISTINCT(r.eventId)) as 1stPlaceEvents,
    GROUP_CONCAT(DISTINCT(r.eventId) SEPARATOR ', ') as EventList
FROM 
    Results r 
JOIN 
    Competitions c 
ON 
    c.id = r.competitionId 
WHERE 
    r.best > 0 AND 
    r.pos = 1 AND 
    r.roundTypeId IN ('c', 'f') AND 
    r.CountryId = "Philippines" AND
    c.end_date LIKE ':year%'
GROUP BY
    r.personId
ORDER BY 
    Num1stPlaces DESC 
