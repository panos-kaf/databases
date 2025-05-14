 SELECT
         f.id,
         f.year,
         AVG(x.experience) AS avg_experience
     FROM
         festival AS f
       JOIN (
         SELECT DISTINCT
             s.id         AS staff_id,
             s.experience AS experience,
             e.festival_id
         FROM
             staff AS s
           JOIN event AS e
             ON s.building_id = e.building_id
       ) AS x
         ON x.festival_id = f.id
     GROUP BY
         f.id,
         f.year
     ORDER BY
         avg_experience ASC
     LIMIT 1;