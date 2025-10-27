WITH parks AS (
    SELECT geom
    FROM land_use_A_2019
    WHERE type = 'Park (City/County)'
),
sporting_goods_stores AS (
    SELECT geom
    FROM poi_2019
    WHERE type = 'Sporting Goods Store'
)
SELECT COUNT(*) AS count_sporting_goods_stores_near_parks
FROM sporting_goods_stores s, parks p
WHERE ST_DWithin(s.geom, p.geom, 300);