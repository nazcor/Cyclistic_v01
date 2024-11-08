SELECT
	ride_id,
	member_casual,
	ride_length,
	CONVERT(time_to_sec(ride_length), DECIMAL) AS ride_in_seconds,
    HOUR(ride_length) AS hours,
    MINUTE(ride_length) AS minutes,
    SECOND(ride_length) AS seconds
FROM
	(
		SELECT
			ride_id,
			member_casual,
			TIMEDIFF(ended_at, started_at) AS ride_length
		FROM cyclistic.cyclistic_2023_2024
	) sub;