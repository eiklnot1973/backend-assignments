select users.id as id, name, seat_number from tickets inner join users
on tickets.user = users.id where train = 11 order by seat_number asc;

select users.id as id, name, count(distinct tickets.train) as trains_count,
sum(trains.distance) / 10 as total_distance from tickets inner join users
on tickets.user = users.id inner join trains on tickets.train = trains.id
group by users.id order by total_distance desc limit 6;

select trains.id as id, types.name as type, src.name as src_stn, dst.name as dst_stn,
timediff(arrival, departure) as travel_time from trains
inner join types on trains.type = types.id
inner join stations as src on trains.source = src.id
inner join stations as dst on trains.destination = dst.id
order by travel_time desc limit 6;

select types.name as type, src.name as src_stn, dst.name as dst_stn,
departure, arrival, round(types.fare_rate * trains.distance / (1000 * 100)) * 100 as fare
from trains inner join types on trains.type = types.id
inner join stations as src on trains.source = src.id
inner join stations as dst on trains.destination = dst.id
order by departure asc;

select trains.id as id, types.name as type, src.name as src_stn, dst.name as dst_stn,
count(tickets.id) as occupied, types.max_seats as maximum
from trains inner join types on trains.type = types.id
inner join stations as src on trains.source = src.id
inner join stations as dst on trains.destination = dst.id
inner join tickets on trains.id = tickets.train
group by trains.id order by trains.id asc;

select trains.id as id, types.name as type, src.name as src_stn, dst.name as dst_stn,
count(tickets.id) as occupied, types.max_seats as maximum
from trains inner join types on trains.type = types.id
inner join stations as src on trains.source = src.id
inner join stations as dst on trains.destination = dst.id
left outer join tickets on trains.id = tickets.train
group by trains.id order by trains.id asc;