CREATE TABLE streets_reprojected AS
SELECT 
    *,
    ST_Transform(ST_SetSRID(geom, 4326), 3068)  -- Reprojekcja do EPSG:3068
FROM streets_2019;
