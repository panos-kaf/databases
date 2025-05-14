WITH yearly_subgenre_counts AS (
    SELECT 
        subgenre.id,
        subgenre.name,
        festival.year,
        COUNT(DISTINCT performance.id) AS performance_count
    FROM 
        subgenre
        JOIN artist_subgenre ON subgenre.id = artist_subgenre.subgenre_id
        JOIN artist_performance ON artist_subgenre.artist_id = artist_performance.artist_id
        JOIN performance ON artist_performance.performance_id = performance.id
        JOIN event ON performance.event_id = event.id
        JOIN festival ON event.festival_id = festival.id
    GROUP BY 
        subgenre.id, subgenre.name, festival.year
    HAVING 
        COUNT(DISTINCT performance.id) >= 3
)

SELECT 
    yearly_subgenre_counts.id,
    yearly_subgenre_counts.name,
    yearly_subgenre_counts.year,
    yearly_subgenre_counts.year + 1,
    yearly_subgenre_counts.performance_count
FROM 
    yearly_subgenre_counts
    JOIN yearly_subgenre_counts AS next_year_counts ON 
        yearly_subgenre_counts.id = next_year_counts.id AND
        yearly_subgenre_counts.year = next_year_counts.year - 1 AND
        yearly_subgenre_counts.performance_count = next_year_counts.performance_count
ORDER BY 
    yearly_subgenre_counts.name, yearly_subgenre_counts.year;