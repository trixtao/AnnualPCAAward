SELECT 
	personId as WCAID,
	personName as Name, 
	COUNT(DISTINCT competitionId) as CompetitionsAttended
FROM 
	Results
WHERE 
	countryId = 'Philippines'
GROUP BY 
	personId
ORDER BY 
	CompetitionsAttended DESC
