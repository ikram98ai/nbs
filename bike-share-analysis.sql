CREATE TEMPORARY TABLE ride SELECT ride_id, start_station_name, end_station_name, member_casual ,rideable_type, ride_length, day_of_week, started_hour FROM Cyclistic.bike_ride;

select * from ride order by member_casual desc, ride_length desc;

select member_casual, min(ride_length) as min_ride, max(ride_length) as max_ride, sec_to_time(avg(time_to_sec(ride_length))) as avg_ride_length from ride group by member_casual;

select day_of_week, count(ride_id) as rides from ride group by day_of_week order by rides;

select started_hour, count(ride_id) as rides from ride group by started_hour order by rides;

select member_casual, sec_to_time(avg(time_to_sec(ride_length))) as avg_ride_length from ride group by member_casual;

select day_of_week, member_casual, sec_to_time(avg(time_to_sec(ride_length))) as avg_ride_length from ride group by day_of_week, member_casual order by avg_ride;

select member_casual, day_of_week, count(ride_id) as rides from ride group by member_casual,day_of_week order by rides;

select month(started_at) as ride_month, count(ride_id) as rides from bike_ride group by month(started_at) order by rides;

select concat(start_station_name,' to ', end_station_name) as way, count(ride_id) as rides from ride group by way order by rides desc;

-- select start_station_name, count(ride_id) as rides from ride group by start_station_name order by rides desc;

-- select end_station_name, count(ride_id) as rides from ride group by end_station_name order by rides desc;

select member_casual, count(ride_id) as rides from ride group by member_casual order by rides desc;
 
select member_casual, count(ride_id) as rides from ride where rideable_type ='electric_bike' group by member_casual;

select member_casual, rideable_type, count(ride_id) as rides from ride group by member_casual, rideable_type;

select rideable_type,member_casual, (avg(time_to_sec(ride_length))/60) as avg_ride_length_in_min from ride group by rideable_type, member_casual; 

select month(started_at) as ride_month, member_casual,count(ride_id) from bike_ride group by ride_month, member_casual;

select started_hour, member_casual, count(ride_id) as rides from ride group by started_hour, member_casual order by rides;

select member_casual, (avg(time_to_sec(ride_length))/60) as avg_ride_length_in_min from ride group by  member_casual; 

select started_hour, rideable_type, round((avg(time_to_sec(ride_length))/60),2) as avg_ride_length_in_min from ride group by started_hour, rideable_type;




SELECT rideable_type, count(*) FROM	bike_ride where start_station_name = '' and end_station_name = '' group by rideable_type;
    
-- 'electric_bike', '1367053'
-- 'classic_bike', '5645'
-- 'docked_bike', '1947'
-- this shows most of electric bike customer's start and end station is not known

 
select 	member_casual, rideable_type, count(ride_id) from bike_ride where start_station_name = '' or end_station_name = '' group by member_casual,rideable_type;
     
-- 920524 are null end stations
-- 866105 are null start stations  
-- combine 1374645 station names are '' 
-- where 'member'='852226', 'casual'='522419'

-- station id is '' null when station name is ''   



