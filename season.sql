USE cyclistic;
SELECT
	ride_id,
    member_casual,
	(CASE
		WHEN MONTH(started_at) IN (1,2,12) THEN "Winter"
        WHEN MONTH(started_at) IN (3,4,5) THEN "Spring"
        WHEN MONTH(started_at) IN (6,7,8) THEN "Summer"
        ELSE "Fall"
        END
	) season
FROM
	cyclistic_2023_2024