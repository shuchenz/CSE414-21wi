/*
the part to import tables
*/

PRAGMA foreign_keys=ON;
.mode csv
.import carriers.csv Carriers
.import months.csv Months
.import weekdays.csv Weekdays
.import flights-small.csv Flights
