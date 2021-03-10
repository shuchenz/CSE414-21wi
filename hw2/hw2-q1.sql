/*
output has cardinality of 3
*/

Select distinct F.flight_num
From Flights as F
Join Carriers as C On F.carrier_id = C.cid
Join Weekdays as W on day_of_week_id = W.did
Where
C.name = 'Alaska Airlines Inc.' AND
W.day_of_week = 'Monday' AND
F.origin_city = 'Seattle WA' AND
F.dest_city = 'Boston MA';
