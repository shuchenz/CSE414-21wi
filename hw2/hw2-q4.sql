/*
output has cardinality of 12
*/

Select distinct C.name As name
From Flights as F
Join Carriers as C on F.carrier_id = C.cid
Group by F.day_of_month, F.month_id, C.cid, C.name
Having count(*) > 1000;
