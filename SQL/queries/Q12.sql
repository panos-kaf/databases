declare number_one int;

SELECT 
    f.year AS festival_year,
    f.starting_date,
    f.ending_date,
    e.day AS festival_day_number,
    DATE_ADD(f.starting_date, INTERVAL (e.day - 1) DAY) AS calendar_date,
    r.description AS role_category,
    COUNT(s.id) AS staff_count,
    GROUP_CONCAT(DISTINCT b.name ORDER BY b.name SEPARATOR ', ') AS buildings_assigned
FROM 
    festival f
JOIN 
    event e ON f.id = e.festival_id
JOIN 
    building b ON e.building_id = b.id
JOIN 
    staff s ON b.id = s.building_id
JOIN 
    role r ON s.role = r.id
WHERE 
    f.year = 2020 
    AND e.day BETWEEN 1 AND (f.duration + 1)  -- Only official festival days
GROUP BY 
    f.year,
    f.starting_date,
    f.ending_date,
    e.day,
    calendar_date,
    r.description
ORDER BY 
    e.day,
    r.description;