/* This query shows all the number of rounds an event has been held in competitions in Philippines in a certain year */

SELECT 
	p.Event, 
	SUM(p.TimesHeld) as Rounds 
FROM 
	(SELECT 
		eventId as Event, 
		COUNT(DISTINCT roundTypeId) as TimesHeld
	FROM 
		Results r
	JOIN 
		Competitions c
	ON 
		r.competitionId = c.id
	WHERE 
		c.countryId = 'Philippines' AND 
		RIGHT(c.id,4) = :year
	GROUP BY 
		eventId, 
		competitionId)p
GROUP BY 
	p.Event
ORDER BY 
	Rounds DESC
