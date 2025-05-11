--  ------- Έλεγχος για συνεχόμενα φεστιβάλ στην ίδια τοποθεσία -------------

 INSERT INTO festival (year, starting_date, ending_date, location_id)
 VALUES (2025, '2025-06-01', '2025-06-05', 1);

 INSERT INTO festival (year, starting_date, ending_date, location_id)
 VALUES (2026, '2026-07-01', '2026-07-05', 1);

-- SELECT * FROM `festival_insertion_log`;

-- ---------------Ελεγχος ενός Event για ίδια ώρα στο ίδιο κτήριο --------------
INSERT INTO event (building_id, festival_id, day) VALUES (1, 1, 1);

INSERT INTO performance (time, duration, break, event_id) VALUES ('18:00:00', 90, 15, 1);

INSERT INTO event (building_id, festival_id, day) VALUES (1, 1, 1);
INSERT INTO performance (time, duration, break, event_id) VALUES ('18:00:00', 90, 15, 1);

-- SELECT * FROM event_per_building_log;
