SELECT ST_Area(
    ST_Buffer(
        ST_ShortestLine(
            (SELECT geometry FROM obiekty WHERE name = 'obiekt3'),
            (SELECT geometry FROM obiekty WHERE name = 'obiekt4')
        ),
        5
    )
) AS pole_bufora;

