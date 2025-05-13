SELECT 
    g.name AS genre_name,
    p1.year AS year_one,
    p2.year AS year_two,
    p1.total_appearances
FROM (
    SELECT 
        genre.name,
        YEAR(festival.starting_date) AS year,
        COUNT(*) AS total_appearances
    FROM 
        artist
    JOIN 
        artist_subgenre ON artist.id = artist_subgenre.artist_id
    JOIN 
        subgenre ON artist_subgenre.subgenre_id = subgenre.id
    JOIN 
        genre ON subgenre.genre_id = genre.id
    JOIN 
        artist_performance ON artist.id = artist_performance.artist_id
    JOIN 
        performance ON artist_performance.performance_id = performance.id
    JOIN 
        event ON performance.event_id = event.id
    JOIN 
        festival ON event.festival_id = festival.id
    GROUP BY 
        genre.name, YEAR(festival.starting_date)
    HAVING 
        COUNT(*) >= 3
) AS p1
JOIN (
    SELECT 
        genre.name,
        YEAR(festival.starting_date) AS year,
        COUNT(*) AS total_appearances
    FROM 
        artist
    JOIN 
        artist_subgenre ON artist.id = artist_subgenre.artist_id
    JOIN 
        subgenre ON artist_subgenre.subgenre_id = subgenre.id
    JOIN 
        genre ON subgenre.genre_id = genre.id
    JOIN 
        artist_performance ON artist.id = artist_performance.artist_id
    JOIN 
        performance ON artist_performance.performance_id = performance.id
    JOIN 
        event ON performance.event_id = event.id
    JOIN 
        festival ON event.festival_id = festival.id
    GROUP BY 
        genre.name, YEAR(festival.starting_date)
    HAVING 
        COUNT(*) >= 3
) AS p2 ON p1.name = p2.name AND p1.year = p2.year - 1
WHERE 
    p1.total_appearances = p2.total_appearances
ORDER BY 
    genre_name, year_one;
