SELECT
	ride_id,
    member_casual,
	WEEKDAY(started_at) AS day_of_week
FROM cyclistic.cyclistic_2023_2024;