SET @number_one = 10;

WITH cte_festival_staff AS (
    SELECT 
        event.day,
        DATE_ADD(festival.starting_date, INTERVAL (event.day - 1) DAY) AS festival_date,
        role.description,
        COUNT(staff.id) AS staff_count,
        MAX(building.capacity) AS building_capacity,
        GROUP_CONCAT(DISTINCT building.name ORDER BY building.name SEPARATOR ', ') AS buildings,
        CASE 
            WHEN role.description = 'Security' THEN CEIL((MAX(building.capacity) * 0.05))
            WHEN role.description = 'Guide' THEN CEIL((MAX(building.capacity) * 0.02))
            WHEN role.description = 'Technician' THEN @number_one
            ELSE 0
        END AS minimum_required
    FROM 
        festival
    JOIN 
        event ON festival.id = event.festival_id
    JOIN 
        building ON event.building_id = building.id
    JOIN 
        staff ON building.id = staff.building_id
    JOIN 
        role ON staff.role = role.id
    WHERE 
        festival.year = 2019 
        AND event.day BETWEEN 1 AND (festival.duration + 1)
    GROUP BY 
        event.day,
        role.description,
        DATE_ADD(festival.starting_date, INTERVAL (event.day - 1) DAY)
),
cte_check_staff AS (
    SELECT
        cte_festival_staff.*,
        CASE 
            WHEN cte_festival_staff.staff_count >= cte_festival_staff.minimum_required THEN 'OK'
            ELSE 'INSUFFICIENT'
        END AS status
    FROM 
        cte_festival_staff
)
SELECT 
    day,
    festival_date,
    description,
    staff_count,
    building_capacity,
    minimum_required,
    status,
    buildings
FROM 
    cte_check_staff
ORDER BY 
    day,
    description;

