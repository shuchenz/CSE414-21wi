SELECT DISTINCT C.name AS carrier
FROM Carriers as C, Flights as F
WHERE F.origin_city = 'Seattle WA'
AND F.dest_city = 'San Francisco CA'
AND C.cid = F.carrier_id
ORDER BY carrier ASC

/*
    Carinality of output: 4
    Runtime: 03.120sec
    First 20 rows of output:
        Alaska Airlines Inc.
        SkyWest Airlines Inc.
        United Air Lines Inc.
        Virgin America
*/