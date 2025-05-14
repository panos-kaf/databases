SELECT
  a.id,
  a.name,
  a.stage_name,
  g.name AS genre_name,
  CASE
    WHEN EXISTS (
      SELECT 1
      FROM artist_performance ap
        JOIN performance p ON p.id = ap.performance_id
        JOIN event e ON e.id = p.event_id
        JOIN festival f ON f.id = e.festival_id
      WHERE
        ap.artist_id = a.id
        AND f.year = 2024
    ) THEN 1 ELSE 0
  END AS participated
FROM
  artist AS a
  JOIN artist_subgenre AS asg ON asg.artist_id = a.id
  JOIN subgenre AS sg ON sg.id = asg.subgenre_id
  JOIN genre AS g ON g.id = sg.genre_id
WHERE
  g.id = 5
ORDER BY
  a.name;
