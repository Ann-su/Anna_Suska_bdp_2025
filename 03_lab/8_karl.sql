CREATE TABLE T2019_KAR_BRIDGES AS
SELECT  ST_intersection(r.geom, w.geom)
FROM railways_2019 as r 
INNER JOIN water_lines_2019 as w ON ST_intersects(r.geom, w.geom);

SELECT COUNT(*) FROM T2019_KAR_BRIDGES;