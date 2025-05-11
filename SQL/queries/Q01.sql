SELECT 
    festival.year AS festival_year,
    purchase_type.type AS payment_type,
    SUM(ticket.cost) AS total_revenue
FROM ticket
JOIN purchase_type ON ticket.purchase_type_id = purchase_type.id
JOIN buyer ON ticket.visitor_id = buyer.visitor_id
JOIN event ON buyer.event_id = event.id
JOIN festival ON event.festival_id = festival.id
GROUP BY festival.year, purchase_type.type
ORDER BY festival.year, purchase_type.type;
