CREATE TABLE IF NOT EXISTS new_and_renovated_buildings AS
SELECT 
    b19.*,
    'new' AS building_status
FROM buildings_2019 b19
LEFT JOIN buildings_2018 b18 ON b19.polygon_id = b18.polygon_id
WHERE b18.polygon_id IS NULL
UNION ALL
SELECT 
    b19.*,
    'renovated' AS building_status
FROM buildings_2019 b19
JOIN buildings_2018 b18 ON b19.polygon_id = b18.polygon_id
WHERE NOT ST_Equals(b19.geom, b18.geom);

SELECT * FROM new_and_renovated_buildings

DROP TABLE new_and_renovated_buildings