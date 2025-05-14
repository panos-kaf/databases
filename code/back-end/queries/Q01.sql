WITH RevenueCTE AS (
    SELECT 
        festival.year AS Festival_Year,
        purchase_type.type AS Payment_Type,
        SUM(ticket.cost) AS Total_Revenue
    FROM ticket
    JOIN purchase_type ON ticket.purchase_type_id = purchase_type.id
    JOIN buyer ON ticket.visitor_id = buyer.visitor_id
    JOIN event ON buyer.event_id = event.id
    JOIN festival ON event.festival_id = festival.id
    GROUP BY festival.year, purchase_type.type
)
SELECT 
    Festival_Year,
    SUM(CASE WHEN Payment_Type = 'Bank Transfer' THEN Total_Revenue ELSE 0 END) AS Bank_Transfer_Earnings,
    SUM(CASE WHEN Payment_Type = 'Cash' THEN Total_Revenue ELSE 0 END) AS Cash_Earnings,
    SUM(CASE WHEN Payment_Type = 'Online' THEN Total_Revenue ELSE 0 END) AS Online_Earnings,
    SUM(Total_Revenue) AS Total_Earnings
FROM RevenueCTE
GROUP BY Festival_Year
ORDER BY Festival_Year;