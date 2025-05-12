LOAD DATA LOCAL INFILE 'ticket.csv'
INTO TABLE ticket
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 0 LINES
(cost, used, purchase_type_id, ticket_type_id, purchase_date, visitor_id, event_id, for_sale, `ean-13`);
