SELECT DISTINCT F1.origin_city AS city
FROM Flights AS F1
WHERE F1.origin_city NOT IN (SELECT DISTINCT F.origin_city AS origin_city
                            FROM Flights AS F 
                            WHERE F.actual_time >= 180)
ORDER BY F1.origin_city ASC

/*
    Carinality of output: 109
    Runtime: 14.830sec
    First 20 rows of output:
        Aberdeen SD
        Abilene TX
        Alpena MI
        Ashland WV
        Augusta GA
        Barrow AK
        Beaumont/Port Arthur TX
        Bemidji MN
        Bethel AK
        Binghamton NY
        Brainerd MN
        Bristol/Johnson City/Kingsport TN
        Butte MT
        Carlsbad CA
        Casper WY
        Cedar City UT
        Chico CA
        College Station/Bryan TX
        Columbia MO
        Columbus GA
*/