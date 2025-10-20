SELECT ST_Distance(
    (SELECT geometry FROM buildings WHERE name = 'BuildingC'),
    (SELECT geometry FROM poi WHERE name = 'K')
) AS distance;