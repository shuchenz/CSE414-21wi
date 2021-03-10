SELECT DISTINCT F2.dest_city AS city
FROM Flights AS F1, Flights AS F2
WHERE F1.origin_city = 'Seattle WA'
AND F1.dest_city = F2.origin_city
AND NOT F2.dest_city = 'Seattle WA'
AND F2.dest_city NOT IN (
    SELECT dest_city
    FROM Flights
    WHERE origin_city = 'Seattle WA'
)
ORDER BY city ASC

/*
    Carinality of output: 256
    Runtime: 18.828sec
    First 20 rows of output:
        Aberdeen SD
        Abilene TX
        Adak Island AK
        Aguadilla PR
        Akron OH
        Albany GA
        Albany NY
        Alexandria LA
        Allentown/Bethlehem/Easton PA
        Alpena MI
        Amarillo TX
        Appleton WI
        Arcata/Eureka CA
        Asheville NC
        Ashland WV
        Aspen CO
        Atlantic City NJ
        Augusta GA
        Bakersfield CA
        Bangor ME
*/