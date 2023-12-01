/* This query contains the average number of rounds (per event) in a competition in the Philippines */

SELECT
    Events,
    COUNT(Rounds) / COUNT(DISTINCT Comps) AS Rounds_Per_Comp
FROM (
    SELECT
        DISTINCT competitionId AS Comps,
        roundTypeId AS Rounds,
        eventId AS Events
    FROM Results
    WHERE CountryId = 'Philippines'
) AS Subquery
GROUP BY Events
ORDER BY Rounds_Per_Comp DESC;
