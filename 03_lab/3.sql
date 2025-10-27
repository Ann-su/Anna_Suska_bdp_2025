-- Sprawdzenie czy poligon jest zamknięty
SELECT ST_IsClosed(geometry) FROM obiekty WHERE name = 'obiekt4';

UPDATE obiekty 
SET geometry = ST_AddPoint(
    geometry, 
    ST_StartPoint(geometry)
)
WHERE name = 'obiekt4';

SELECT ST_GeometryType(obiekty.geometry)
FROM obiekty
WHERE obiekty.name = 'obiekt4';

UPDATE obiekty 
SET geometry = ST_MakePolygon(geometry)
WHERE name = 'obiekt4';