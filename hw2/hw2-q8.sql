Select C.name as name, sum(F.departure_delay) as delay
From Flights as F
Join Carriers as C On F.carrier_id = C.cid
Group by C.name;
