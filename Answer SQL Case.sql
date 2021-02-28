-- This Query Was Made Using MySQL
USE database_astra;

-- Question Number 1
SELECT station_id, name, capacity FROM citibike_stations
ORDER BY capacity DESC
LIMIT 5;

-- Question Number 2
SELECT name AS station_name, gender, COUNT(name) AS number_of_trips FROM (
	SELECT * FROM (
		SELECT station_id, name, capacity
		FROM citibike_stations
		ORDER BY capacity DESC
		LIMIT 5) cn
	JOIN citibike_trips ct ON cn.station_id = ct.start_station_id
	WHERE cn.name IS NOT NULL AND ct.starttime >= '2018-01-01' AND ct.starttime <'2021-01-01'
) ft
GROUP BY station_name, ft.gender
ORDER BY station_name, ft.gender;
