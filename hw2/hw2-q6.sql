Select C.name as carrier, max(F.price) as max_price
From Flights as F
Join Carriers as C On F.carrier_id = C.cid
Where(F.origin_city = 'Seattle WA' AND F.dest_city = 'New York NY') OR
(F.dest_city = 'Seattle WA' AND F.origin_city = 'New York NY')
Group by C.name;
