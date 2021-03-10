/*
output has cardinality of 1472
*/

Select C.name as name,
F1.flight_num as f1_flight_num,
F1.origin_city as f1_origin_city,
F1.dest_city as f1_dest_city,
F1.actual_time as f1_actual_time,
F2.flight_num as f2_flight_num,
F2.origin_city as f2_origin_city,
F2.dest_city as f2_dest_city,
F2.actual_time as f2_actual_time,
F1.actual_time + F2.actual_time as actual_time
From Flights as F1
Join Flights as F2 on F1.dest_city = F2.origin_city AND
F1.day_of_month = F2.day_of_month AND
F1.month_id = F2.month_id AND
F1.day_of_week_id = F2.day_of_week_id AND
F1.carrier_id = F2.carrier_id
Join Carriers as C On F1.carrier_id = C.cid
Join Weekdays as W on F1.day_of_week_id = W.did
Join Months as M on F1.month_id = M.mid
Where F1.origin_city = 'Seattle WA' AND
F2.dest_city = 'Boston MA' AND
M.month = 'July' AND
F1.day_of_month = 15 AND
(F1.actual_time + F2.actual_time) < 7*60;
