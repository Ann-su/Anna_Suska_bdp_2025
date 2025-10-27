CREATE TABLE IF NOT EXISTS new_poi AS
SELECT p19.*
FROM poi_2019 p19
LEFT JOIN poi_2018 p18 ON p19.poi_id = p18.poi_id
WHERE p18.poi_id IS NULL;

SELECT 
    np.type AS kategoria_poi,
    COUNT(*) AS liczba_nowych_poi
FROM new_poi np
JOIN new_and_renovated_buildings nrb 
    ON ST_DWithin(
        np.geom, 
        nrb.geom, 
        500
    )
GROUP BY np.type
ORDER BY liczba_nowych_poi DESC;

SELECT * FROM poi_2019

