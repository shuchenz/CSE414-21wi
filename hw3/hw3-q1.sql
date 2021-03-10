SELECT DISTINCT F1.origin_city AS origin_city, F1.dest_city AS dest_city, maximum AS time
FROM Flights AS F1
JOIN (SELECT F.origin_city as origin_city, MAX(actual_time) AS maximum
                    FROM Flights AS F 
                    GROUP BY F.origin_city) AS F2
ON F1.origin_city = F2.origin_city 
AND F1.actual_time = F2.maximum
ORDER BY origin_city ASC, dest_city ASC

/*
    Carinality of output: 334
    Runtime: 13.406sec
    First 20 rows of output:
        Aberdeen SD	Minneapolis MN	106
        Abilene TX	Dallas/Fort Worth TX	111
        Adak Island AK	Anchorage AK	471
        Aguadilla PR	New York NY	368
        Akron OH	Atlanta GA	408
        Albany GA	Atlanta GA	243
        Albany NY	Atlanta GA	390
        Albuquerque NM	Houston TX	492
        Alexandria LA	Atlanta GA	391
        Allentown/Bethlehem/Easton PA	Atlanta GA	456
        Alpena MI	Detroit MI	80
        Amarillo TX	Houston TX	390
        Anchorage AK	Barrow AK	490
        Appleton WI	Atlanta GA	405
        Arcata/Eureka CA	San Francisco CA	476
        Asheville NC	Chicago IL	279
        Ashland WV	Cincinnati OH	84
        Aspen CO	Los Angeles CA	304
        Atlanta GA	Honolulu HI	649
        Atlantic City NJ	Fort Lauderdale FL	212
*/