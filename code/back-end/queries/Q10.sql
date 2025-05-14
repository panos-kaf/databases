SELECT 
    genre.name,
    genre2.name,
    COUNT(DISTINCT festival.id)
FROM festival
JOIN event ON event.festival_id = festival.id
JOIN performance ON performance.event_id = event.id
JOIN artist_performance ON artist_performance.performance_id = performance.id
JOIN artist_subgenre ON artist_subgenre.artist_id = artist_performance.artist_id
JOIN subgenre ON subgenre.id = artist_subgenre.subgenre_id
JOIN genre ON genre.id = subgenre.genre_id
JOIN artist_subgenre artist_subgenre2 ON artist_subgenre2.artist_id = artist_performance.artist_id
JOIN subgenre subgenre2 ON subgenre2.id = artist_subgenre2.subgenre_id
JOIN genre genre2 ON genre2.id = subgenre2.genre_id
WHERE 
    genre.id < genre2.id 
GROUP BY 
    genre.name, genre2.name
ORDER BY 
    COUNT(DISTINCT festival.id) DESC
LIMIT 3;
