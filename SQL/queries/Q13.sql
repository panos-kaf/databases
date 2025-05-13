SELECT 
    artist.id,
    artist.name,
    artist.stage_name,
    COUNT(DISTINCT continent.name) AS continent_count,
    GROUP_CONCAT(DISTINCT continent.name ORDER BY continent.name SEPARATOR ', ') AS continents
FROM 
    artist
JOIN 
    artist_performance ON artist.id = artist_performance.artist_id
JOIN 
    performance ON artist_performance.performance_id = performance.id
JOIN 
    event ON performance.event_id = event.id
JOIN 
    festival ON event.festival_id = festival.id
JOIN 
    building ON event.building_id = building.id
JOIN 
    location ON building.id = location.id
JOIN 
    continent ON location.continent_id = continent.id
GROUP BY 
    artist.id, 
    artist.name,
    artist.stage_name
HAVING 
    COUNT(DISTINCT continent.name) >= 3
ORDER BY 
    continent_count DESC;