SELECT 
    visitor.name AS visitor_name,
    artist.name AS artist_name,
    SUM(review.score) AS total_score
FROM 
    review
JOIN 
    visitor ON review.visitor_id = visitor.id
JOIN 
    performance ON review.performance_id = performance.id
JOIN 
    artist_performance ON artist_performance.performance_id = performance.id
JOIN 
    artist ON artist_performance.artist_id = artist.id
GROUP BY 
    visitor.id, artist.id
ORDER BY 
    total_score DESC
LIMIT 5;
