LOAD DATA LOCAL INFILE 'review.csv'
INTO TABLE review
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 0 LINES
(score, criteria_id, visitor_id, performance_id);