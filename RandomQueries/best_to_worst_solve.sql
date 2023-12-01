/* This query contains the best to worst solve of a competitor given an event */

SELECT competitionId, roundTypeId, 1 as solve, value1 as value FROM Results r
WHERE r.personId = ':person_id' AND r.eventId = ':event_id' AND value1 > 0
UNION ALL
SELECT competitionId, roundTypeId, 2, value2 as value FROM Results r
WHERE r.personId = ':person_id' AND r.eventId = ':event_id' AND value2 > 0
UNION ALL
SELECT competitionId, roundTypeId, 3, value3 as value FROM Results r
WHERE r.personId = ':person_id' AND r.eventId = ':event_id' AND value3 > 0
UNION ALL
SELECT competitionId, roundTypeId, 4, value4 as value FROM Results r
WHERE r.personId = ':person_id' AND r.eventId = ':event_id' AND value4 > 0
UNION ALL
SELECT competitionId, roundTypeId, 5, value5 as value FROM Results r
WHERE r.personId = ':person_id' AND r.eventId = ':event_id' AND value5 > 0
ORDER BY value
