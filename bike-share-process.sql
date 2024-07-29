SELECT 
    COUNT(DISTINCT ride_id)
FROM
    Cyclistic.bike_ride;-- total = 5707168 after cleaning greater and -ve ride_length 5706862


SELECT 
    started_at,
    ended_at,
    TIMESTAMPDIFF(SECOND,
        started_at,
        ended_at) AS time_difference
FROM
    bike_ride
WHERE
    TIMESTAMPDIFF(SECOND,
        started_at,
        ended_at) > 3087683;


DELETE FROM bike_ride 
WHERE
    TIMESTAMPDIFF(SECOND,
    started_at,
    ended_at) < 0;

DELETE FROM bike_ride 
WHERE
    TIMESTAMPDIFF(SECOND,
    started_at,
    ended_at) > 3087683;


UPDATE bike_ride 
SET 
    ride_length = SEC_TO_TIME(TIMESTAMPDIFF(SECOND,
                started_at,
                ended_at));


UPDATE bike_ride 
SET 
    day_of_week = (CASE DAYOFWEEK(started_at)
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
    END);
    
SELECT 
    started_at, HOUR(started_at)
FROM
    bike_ride;

alter table bike_ride add started_hour int;

UPDATE bike_ride 
SET 
    started_hour = HOUR(started_at);