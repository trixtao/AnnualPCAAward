/* This query contains how many female competitors in PH have competed in n competitions */

WITH comps AS(
	SELECT 
		r.personId as wca_id, 
		COUNT(DISTINCT r.competitionId) as NumComps
	FROM 
		Results r
	GROUP BY 
		r.personId
)
SELECT 
	c.NumComps,
	COUNT(DISTINCT c.wca_id) as f_competitors
FROM 
	comps c, 
	Persons p
WHERE 
	c.wca_id = p.wca_id AND 
	p.gender = 'f' AND
        p.countryId = 'Philippines'
GROUP BY 
	c.NumComps
ORDER BY 
	c.NumComps ASC
