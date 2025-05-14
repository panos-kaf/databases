EXPLAIN FORMAT=JSON
SELECT 
    visitor.name,
    performance.id as 'performance id',
    AVG(review.score) AS 'average score'
FROM 
    visitor
JOIN 
    ticket ON visitor.id = ticket.visitor_id
JOIN 
    performance ON ticket.event_id = performance.event_id
JOIN 
    review ON review.performance_id = performance.id
WHERE 
    visitor.id = 5
GROUP BY 
    visitor.name, performance.id;


-- FORCE INDEX
EXPLAIN FORMAT=JSON
SELECT 
    visitor.name,
    performance.id as 'performance id',
    AVG(review.score) AS 'average score'
FROM 
    visitor FORCE INDEX (`PRIMARY`)
JOIN 
    ticket FORCE INDEX (`fk_ticket_visitor_id_idx`) ON visitor.id = ticket.visitor_id
JOIN 
    performance FORCE INDEX (`fk_event_performance_id_idx`) ON ticket.event_id = performance.event_id
JOIN 
    review FORCE INDEX (`fk_performance_id`) ON review.performance_id = performance.id
WHERE 
    visitor.id = 5
GROUP BY 
    visitor.name, performance.id;


