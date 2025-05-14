SELECT a.*
FROM artist a
JOIN artist_performance ap ON a.id = ap.artist_id
JOIN performance p ON ap.performance_id = p.id
JOIN performance_type pt ON p.performance_type_id = pt.id
WHERE pt.type = 'warmup'
GROUP BY a.id
HAVING COUNT(*) >= 2;