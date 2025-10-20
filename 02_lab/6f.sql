SELECT ST_Area(ST_Difference(bc.geometry, ST_Buffer(bb.geometry, 0.5))) AS area
FROM buildings bc, buildings bb
WHERE bc.name = 'BuildingC' AND bb.name = 'BuildingB';