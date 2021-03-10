Select C.name as name, avg(F.canceled)*100 as percentage
From Flights as F
Join Carriers as C on F.carrier_id = C.cid
Where F.origin_city = 'Seattle WA'
Group by C.name
Having avg(F.canceled) > 0.005
Order by avg(F.canceled) ASC;
