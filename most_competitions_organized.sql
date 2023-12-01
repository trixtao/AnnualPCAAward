/* This query shows how many competitions (for a specific year) a Filipino has organized, 
you can customize it so that you can change the country and the year */
SELECT users.name "Organizer", 
       wca_id "WCA ID", 
       COUNT(DISTINCT competition_id) "Competitions", 
       start_date "Start Date", 
       countryid "Country"
FROM 
      competition_organizers
JOIN 
      users ON users.id = competition_organizers.organizer_id
JOIN 
      Competitions ON competition_organizers.competition_id = Competitions.id
WHERE 
      countryid = 'Philippines'
AND 
      Competitions.end_date LIKE ":year%"
GROUP BY 
      users.name
ORDER BY 
      Competitions DESC;
