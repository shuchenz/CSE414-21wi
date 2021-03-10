/*
the create table part
*/

CREATE TABLE Carriers(
cid varchar(7) primary key,
name varchar(83));

CREATE TABLE Months(
mid int primary key,
month varchar(9));

CREATE TABLE Weekdays(
did int primary key,
day_of_week varchar(9));

CREATE TABLE Flights(
fid int primary key,
month_id int references Months(mid),
day_of_month int,
day_of_week_id int references Weekdays(did),
carrier_id varchar(7) references Carriers(cid),
flight_num int,
origin_city varchar(34),
origin_state varchar(47),
dest_city varchar(34),
dest_state varchar(46),
departure_delay int,
taxi_out int,
arrival_delay int,
canceled int,
actual_time int,
distance int,
capacity int,
price int);
