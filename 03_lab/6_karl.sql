CREATE TABLE input_line AS
SELECT
    ST_MakeLine(geom ORDER BY id) AS geom
FROM input_points;

ALTER TABLE input_line
ALTER COLUMN geom TYPE geometry(Linestring, 3068)
USING ST_Transform(ST_SetSRID(geom, 4326), 3068);

ALTER TABLE street_node_2019
ALTER COLUMN geom TYPE geometry(Point, 3068)
USING ST_Transform(ST_SetSRID(geom, 4326), 3068);

CREATE TABLE intersections_within_200m AS
SELECT s.*
FROM street_node_2019 s, input_line l
WHERE ST_DWithin(s.geom, l.geom, 200);

SELECT * FROM intersections_within_200m