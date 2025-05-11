SELECT 
    g1.name AS genre1,
    g2.name AS genre2,
    COUNT(DISTINCT f.id) AS festival_count
FROM festival f
JOIN event e ON e.festival_id = f.id
JOIN performance p ON p.event_id = e.id
JOIN artist_performance ap ON ap.performance_id = p.id
JOIN artist_subgenre asg1 ON asg1.artist_id = ap.artist_id
JOIN subgenre sg1 ON sg1.id = asg1.subgenre_id
JOIN genre g1 ON g1.id = sg1.genre_id
JOIN artist_subgenre asg2 ON asg2.artist_id = ap.artist_id
JOIN subgenre sg2 ON sg2.id = asg2.subgenre_id
JOIN genre g2 ON g2.id = sg2.genre_id
WHERE 
    g1.id < g2.id -- Αυτό αποτρέπει διπλές εγγραφές (Rock, Jazz) και (Jazz, Rock)
GROUP BY 
    g1.name, g2.name
ORDER BY 
    festival_count DESC
LIMIT 3;
