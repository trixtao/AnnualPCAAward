/* This query contains all the competitions a FIlipino has organized */

SELECT users.name "Organizer", wca_id "WCA ID", Competitions.name "Competitions", start_date "Start Date", countryid "Country"
FROM competition_organizers
JOIN users ON users.id = competition_organizers.organizer_id
JOIN Competitions ON competition_organizers.competition_id = Competitions.id
WHERE countryid = 'Philippines'
ORDER BY start_date
