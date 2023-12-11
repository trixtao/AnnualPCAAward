/* This query shows the total number of completed solves and attempts for the Philippines. The first query shows for a specific year, and the second query shows only for 3x3. */

SELECT
    eventId,
    YEAR(competition.start_date) AS year,
    SUM(
        IF(value1 > 0, 1, 0) +
        IF(value2 > 0, 1, 0) +
        IF(value3 > 0, 1, 0) +
        IF(value4 > 0, 1, 0) +
        IF(value5 > 0, 1, 0)
    ) AS solves,
    SUM(
        IF(value1 != -2 and value1 != 0, 1, 0) +
        IF(value2 != -2 and value2 != 0, 1, 0) +
        IF(value3 != -2 and value3 != 0, 1, 0) +
        IF(value4 != -2 and value4 != 0, 1, 0) +
        IF(value5 != -2 and value5 != 0, 1, 0)
    ) AS attempts
FROM
    Results
INNER JOIN Competitions competition ON Results.competitionId = competition.id
WHERE
    Results.countryId = "Philippines"
    AND YEAR(competition.start_date) = ":year"
GROUP BY
    eventId,
    YEAR(competition.start_date)
ORDER BY
    eventId, 
    year,
    solves,
    attempts;

/* SECOND QUERY */

SELECT
    eventId,
    YEAR(competition.start_date) AS year,
    SUM(
        IF(value1 > 0, 1, 0) +
        IF(value2 > 0, 1, 0) +
        IF(value3 > 0, 1, 0) +
        IF(value4 > 0, 1, 0) +
        IF(value5 > 0, 1, 0)
    ) AS solves,
    SUM(
        IF(value1 != -2 and value1 != 0, 1, 0) +
        IF(value2 != -2 and value2 != 0, 1, 0) +
        IF(value3 != -2 and value3 != 0, 1, 0) +
        IF(value4 != -2 and value4 != 0, 1, 0) +
        IF(value5 != -2 and value5 != 0, 1, 0)
    ) AS attempts
FROM
    Results
INNER JOIN Competitions competition ON Results.competitionId = competition.id
WHERE
    Results.countryId = "Philippines"
    AND eventId = "333"
GROUP BY
    eventId,
    YEAR(competition.start_date)
ORDER BY
    eventId, 
    year DESC,
    solves,
    attempts;
