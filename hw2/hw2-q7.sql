Select sum(F.capacity) as capacity
From Flights as F
Join Months as M on F.month_id = M.mid
Where  M.month = 'July' AND
F.day_of_month = 10 AND
((F.origin_city = 'Seattle WA' AND F.dest_city = 'San Francisco CA') OR
(F.dest_city = 'Seattle WA' AND F.origin_city = 'San Francisco CA'));
