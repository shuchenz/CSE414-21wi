/*
output has cardinality of 1
*/

Select W.day_of_week As day_of_week, avg(F.arrival_delay) As delay
From Flights as F
Join Weekdays as W on F.day_of_week_id = W.did
Group by W.day_of_week
Order by avg(F.arrival_delay) DESC
Limit 1;
