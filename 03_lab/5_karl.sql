ALTER TABLE input_points
ALTER COLUMN geom TYPE geometry(Point, 3068)
USING ST_SetSRID(geom, 3068);