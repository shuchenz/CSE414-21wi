SELECT F1.origin_city AS origin_city, ISNULL(round(cast(F2.num * 100 AS FLOAT) / count(*), 2), 0) AS percentage
FROM Flights AS F1
LEFT JOIN 
(SELECT DISTINCT origin_city AS origin_city, count(*) AS num
    FROM Flights
    WHERE actual_time < 3*60
    AND canceled = 0
    GROUP BY origin_city) AS F2
ON F1.origin_city = F2.origin_city
GROUP BY F2.num, F1.origin_city
ORDER BY percentage ASC, F1.origin_city ASC

/*
    Carinality of output: 327
    Runtime: 18.802sec
    First 20 rows of output:
        Guam TT	0
        Pago Pago TT	0
        Aguadilla PR	28.68
        Anchorage AK	31.66
        San Juan PR	33.54
        Charlotte Amalie VI	39.27
        Ponce PR	40.32
        Fairbanks AK	49.54
        Kahului HI	53.34
        Honolulu HI	54.53
        San Francisco CA	55.22
        Los Angeles CA	55.41
        Seattle WA	57.41
        New York NY	60.53
        Long Beach CA	61.72
        Kona HI	62.95
        Newark NJ	63.37
        Plattsburgh NY	64
        Las Vegas NV	64.47
        Christiansted VI	64.67
*/
