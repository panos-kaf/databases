WITH VisitorAttendance AS (
    SELECT 
        visitor.id,
        visitor.name,
        COUNT(DISTINCT ticket.event_id) AS events_attended
    FROM 
        visitor
    JOIN 
        ticket ON visitor.id = ticket.visitor_id
    WHERE 
        ticket.used = 1 
        AND ticket.purchase_date BETWEEN '2024-12-05' AND '2025-12-05'
    GROUP BY 
        visitor.id
    HAVING 
        events_attended > 3
),
GroupedAttendance AS (
    SELECT 
        events_attended,
        COUNT(*) AS visitor_count
    FROM 
        VisitorAttendance
    GROUP BY 
        events_attended
    HAVING 
        visitor_count > 1
)

SELECT 
    VisitorAttendance.name,
    VisitorAttendance.events_attended
FROM 
    VisitorAttendance
JOIN 
    GroupedAttendance ON VisitorAttendance.events_attended = GroupedAttendance.events_attended
ORDER BY 
    VisitorAttendance.events_attended DESC;