SELECT 
    artist.id,
    artist.name,
    artist.stage_name,
    AVG(CASE WHEN criteria.category = 'artist performance' THEN review.score END) AS avg_artist_performance,
    AVG(CASE WHEN criteria.category = 'overall impression' THEN review.score END) AS avg_overall_impression
FROM 
    artist
JOIN 
    artist_performance ON artist.id = artist_performance.artist_id
JOIN 
    performance ON artist_performance.performance_id = performance.id
JOIN 
    review ON review.performance_id = performance.id
JOIN 
    criteria ON criteria.id = review.criteria_id
WHERE 
    criteria.category IN ('artist performance', 'overall impression')
GROUP BY 
    artist.id, artist.name, artist.stage_name
ORDER BY 
    avg_artist_performance DESC, avg_overall_impression DESC;
