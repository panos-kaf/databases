SELECT 
    artist.id,
    artist.name,
    artist.stage_name,
    COUNT(artist_performance.performance_id) AS total_performances
FROM 
    artist
JOIN artist_performance ON artist.id = artist_performance.artist_id
GROUP BY 
    artist.id, artist.name, artist.stage_name
HAVING 
    total_performances <= (
        SELECT MAX(total_performances) - 5
        FROM (
            SELECT COUNT(artist_performance.performance_id) AS total_performances
            FROM artist_performance
            GROUP BY artist_performance.artist_id
        ) AS max_performances
    );
