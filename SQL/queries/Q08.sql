SET @target_date = '2025-05-12';

SELECT DISTINCT 
    staff.id,
    staff.first_name,
    staff.last_name,
    role.description
FROM 
    staff
LEFT JOIN role ON staff.role = role.id
LEFT JOIN event ON staff.building_id = event.building_id
LEFT JOIN festival ON event.festival_id = festival.id
WHERE 
    role.id = 4 AND
    NOT EXISTS (
        SELECT 1 
        FROM event e 
        JOIN festival f ON e.festival_id = f.id
        WHERE 
            e.building_id = staff.building_id AND
            @target_date BETWEEN f.starting_date AND f.ending_date
    );
