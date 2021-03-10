SELECT DISTINCT F3.origin_city AS city
FROM Flights AS F3
WHERE F3.origin_city NOT IN (
    SELECT F2.dest_city
    FROM Flights AS F1, Flights AS F2
    WHERE F1.origin_city = 'Seattle WA'
    AND F1.dest_city = F2.origin_city
)
AND F3.origin_city NOT IN (
    SELECT dest_city
    FROM Flights
    WHERE origin_city = 'Seattle WA'
)
ORDER BY city ASC

/*
    Carinality of output: 4
    Runtime: 39.748sec
    First 20 rows of output:
        Devils Lake ND
        Hattiesburg/Laurel MS
        St. Augustine FL
        Victoria TX
*/