use databases25;

INSERT INTO `festival` (`year`, `starting_date`, `ending_date`, `location_id`) VALUES
(2022, '2020-12-06', '2022-12-09', 12);

INSERT INTO `event` (`building_id`, `image_url`, `festival_id`, `day`) VALUES
(1, 'https://placekitten.com/666/412', 2, 2),
(2, 'https://placekitten.com/666/412', 4, 2),
(4, 'https://placekitten.com/666/412', 1, 2),
(7, 'https://placekitten.com/666/412', 6, 2),
(7, 'https://placekitten.com/666/412', 11, 2);

INSERT INTO `performance` (`time`, `duration`,  `performance_type_id`, `event_id`, `break`) VALUES
('17:39:00', 89, 2, 31, 5),
('17:39:00', 89, 2, 32, 5),
('17:39:00', 89, 2, 33, 5),
('17:39:00', 89, 2, 34, 5),
('17:39:00', 89, 2, 35, 5);


INSERT INTO `artist` (`name`, `stage_name`, `birthdate`, `site`, `instagram_profile`, `image_url`) VALUES
('Kayla Gallagher', 'dthomas', '1989-02-12', 'http://petersen.com/', 'https://instagram.com/dthomas', 'https://dummyimage.com/182x543');

INSERT INTO `artist_performance` (`artist_id`, `performance_id`) VALUES
(51, 101),
(51, 102),
(51, 103),
(51, 104);
