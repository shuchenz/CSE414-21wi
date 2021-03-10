SELECT DISTINCT C.name AS carrier
FROM Carriers as C, (SELECT carrier_id as carrier_id
                    FROM Flights
                    WHERE origin_city = 'Seattle WA'
                    AND dest_city = 'San Francisco CA') AS F
WHERE C.cid = F.carrier_id
ORDER BY carrier ASC

/*
    Carinality of output: 4
    Runtime: 03.246sec
    First 20 rows of output:
        Alaska Airlines Inc.
        SkyWest Airlines Inc.
        United Air Lines Inc.
        Virgin America
*/