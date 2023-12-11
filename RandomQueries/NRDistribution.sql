/* This query shows the National Records distribution throughout all 17 events in the WCA for the Philippines */

SELECT 
	t.personId, 
	p.name, 
	p.countryId, 
	COUNT(t.eventId) as NRs

FROM
	(SELECT 
		personId, 
		eventId
	FROM 
		RanksSingle 
	WHERE 
		countryRank = 1 AND 
		eventId NOT IN ('magic','mmagic','333ft','333mbo')
	UNION ALL
	SELECT 
		personId, 
		eventId
	FROM 
		RanksAverage
	WHERE 
		countryRank = 1 AND 
		eventId NOT IN ('magic','mmagic','333ft','333mbo')) t,

	Persons p

WHERE 
	p.wca_id = t.personId AND 
	p.subId = 1 AND 
	p.countryId = 'Philippines'
GROUP BY 
	t.personId
ORDER BY 
	NRs DESC
