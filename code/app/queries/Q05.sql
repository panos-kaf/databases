WITH 
-- Get all artist performances with performance details
artist_performances AS (
    SELECT 
        ap.artist_id,
        p.id AS performance_id,
        p.event_id,
        e.festival_id
    FROM 
        artist_performance ap
    JOIN 
        performance p ON ap.performance_id = p.id
    JOIN 
        event e ON p.event_id = e.id
)

-- Final result with only total performances
SELECT 
    a.id,
    a.name,
    TIMESTAMPDIFF(YEAR, a.birthdate, CURDATE()) AS age,
    COUNT(DISTINCT ap.performance_id) AS total_performances
FROM 
    artist a
LEFT JOIN 
    artist_performances ap ON a.id = ap.artist_id
WHERE 
    TIMESTAMPDIFF(YEAR, a.birthdate, CURDATE()) < 30
GROUP BY 
    a.id, a.name, a.birthdate
HAVING 
    total_performances > 0
ORDER BY 
    total_performances DESC;
