CREATE DATABASE  IF NOT EXISTS `databases25` /*!40100 DEFAULT CHARACTER SET utf8mb4 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `databases25`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: databases25
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `id` int AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `stage_name` varchar(45) NOT NULL,
  `birthdate` date NOT NULL,
  `site` varchar(45) DEFAULT NULL,
  `instagram_profile` varchar(45) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `artist_subgenre`
--

DROP TABLE IF EXISTS `artist_subgenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_subgenre` (
  `artist_id` int NOT NULL,
  `subgenre_id` int NOT NULL,
  PRIMARY KEY (`artist_id`,`subgenre_id`),
  KEY `fk_subgenre_id_idx` (`subgenre_id`),
  CONSTRAINT `fk_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_subgenre_id` FOREIGN KEY (`subgenre_id`) REFERENCES `subgenre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band` (
  `id` int AUTO_INCREMENT,
  `formation_date` date NOT NULL,
  `name` varchar(45) NOT NULL,
  `instagram_profile` varchar(100) NOT NULL,
  `site` varchar(100) NOT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `band_artist`
--

DROP TABLE IF EXISTS `band_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band_artist` (
  `band_id` int NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`band_id`,`artist_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `band_artist_ibfk_1` FOREIGN KEY (`band_id`) REFERENCES `band` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `band_artist_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `band_subgenre`
--

DROP TABLE IF EXISTS `band_subgenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band_subgenre` (
  `band_id` int NOT NULL,
  `subgenre_id` int NOT NULL,
  PRIMARY KEY (`band_id`,`subgenre_id`),
  KEY `fk_subgenre_id_idx` (`subgenre_id`),
  CONSTRAINT `fk_band_id` FOREIGN KEY (`band_id`) REFERENCES `band` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_subgenre_band_id` FOREIGN KEY (`subgenre_id`) REFERENCES `subgenre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` int AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `capacity` int NOT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `id` int AUTO_INCREMENT,
  `visitor_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `ticket_type_id` int DEFAULT NULL,
  `specific_ticket` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `event_visitor_id_UNIQUE` (`event_id`,`visitor_id`),
  CONSTRAINT `buyer_event` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buyer_visitor` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `continent`
--

DROP TABLE IF EXISTS `continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `continent` (
  `id` int AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `building_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`building_id`,`name`),
  CONSTRAINT `fk_building_id` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int AUTO_INCREMENT,
  `building_id` int NOT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `festival_id` int NOT NULL,
  `day` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_festival_id`(`festival_id`),
  KEY `fk_building_id_idx` (`building_id`),
  CONSTRAINT `fk_building_event_id` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_event_festival_id` FOREIGN KEY (`festival_id`) REFERENCES `festival` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `id` int AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `festival`
--

DROP TABLE IF EXISTS `festival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `festival` (
  `id` int AUTO_INCREMENT,
  `year` year NOT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `duration` int GENERATED ALWAYS AS ((to_days(`ending_date`) - to_days(`starting_date`))) STORED,
  `location_id` int NOT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id_idx` (`location_id`),
  CONSTRAINT `location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `continent_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `continent_id_idx` (`continent_id`),
  CONSTRAINT `continent_id` FOREIGN KEY (`continent_id`) REFERENCES `continent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `performance`
--

DROP TABLE IF EXISTS `performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance` (
  `id` int AUTO_INCREMENT,
  `time` time DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `break` int NOT NULL,
  `performance_type_id` int DEFAULT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_performance_type_id_idx` (`performance_type_id`),
  KEY `fk_event_performance_id_idx` (`event_id`),
  CONSTRAINT `chk_break_values` CHECK (`break` >= 5 and `break` <= 30 ) ,
  CONSTRAINT `chk_duration_limit` CHECK (`duration` <= 180),
  CONSTRAINT `fk_event_performance_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_performance_type_id` FOREIGN KEY (`performance_type_id`) REFERENCES `performance_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `artist_performance`;
CREATE TABLE `artist_performance` (
	`artist_id` int NOT NULL,
    `performance_id` int NOT NULL,
	PRIMARY KEY (`artist_id`,`performance_id`),
	KEY `fk_artist_id_idx` (`artist_id`),
	CONSTRAINT `fk_artist_performance_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_performance_artist_id` FOREIGN KEY (`performance_id`) REFERENCES `performance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `performance_type`
--

DROP TABLE IF EXISTS `performance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_type` (
  `id` int AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_type`
--

DROP TABLE IF EXISTS `purchase_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_type` (
  `id` int AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resale_queue`
--

DROP TABLE IF EXISTS `resale_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resale_queue` (
  `id` int AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `ticket_id_UNIQUE` (`ticket_id`),
  CONSTRAINT `sale_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reseller`
--

DROP TABLE IF EXISTS `reseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller` (
  `id` int AUTO_INCREMENT,
  `visitor_id` int NOT NULL,
  `sale_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `visitor_id_UNIQUE` (`visitor_id`),
  KEY `reseller_sales_idx` (`sale_id`),
  CONSTRAINT `reseller_sales` FOREIGN KEY (`sale_id`) REFERENCES `resale_queue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visitor_reseller` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int AUTO_INCREMENT,
  `score` int NOT NULL,
  `criteria` int NOT NULL,
  `visitor_id` int NOT NULL,
  `performance_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_visitor_id_idx` (`visitor_id`),
  CONSTRAINT `fk_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`),
  CONSTRAINT `fk_performance_id` FOREIGN KEY (`performance_id`) REFERENCES `performance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
	`id` int auto_increment,
    `category` VARCHAR(20) NOT NULL,
    primary key (`id`)
);

DROP TABLE IF EXISTS `review_category`;
CREATE TABLE `review_category` (
	`review_id` int auto_increment,
    `category_id` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`review_id`,`category_id`),
	KEY `fk_review_id_idx` (`review_id`),
	CONSTRAINT `fk_review_category_id` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_category_review_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `birthdate` date NOT NULL,
  `experience` int NOT NULL,
  `role` int NOT NULL,
  `building_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experience_id_idx` (`experience`),
  KEY `role_id_idx` (`role`),
  CONSTRAINT `building_id` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`),
  CONSTRAINT `experience_id` FOREIGN KEY (`experience`) REFERENCES `experience` (`id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subgenre`
--

DROP TABLE IF EXISTS `subgenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subgenre` (
  `id` int AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_genre_id_idx` (`genre_id`),
  CONSTRAINT `fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int AUTO_INCREMENT,
  `cost` int NOT NULL,
  `used` tinyint NOT NULL,
  `purchase_type_id` int DEFAULT  NULL,
  `ticket_type_id` int NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `visitor_id` int DEFAULT NULL,
  `event_id` int NOT NULL,
  `for_sale` tinyint DEFAULT 0,
  `ean-13` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_purchase_type_id_idx` (`purchase_type_id`),
  KEY `fk_ticket_type_id_idx` (`ticket_type_id`),
  KEY `fk_ticket_visitor_id_idx` (`visitor_id`),
  CONSTRAINT `fk_purchase_type_id` FOREIGN KEY (`purchase_type_id`) REFERENCES `purchase_type` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ticket_type_id` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_type` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ticket_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_ticket_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_type`
--

DROP TABLE IF EXISTS `ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_type` (
  `id` int AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `id` int AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `insert_logs`;
CREATE TABLE `insert_logs` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    timestamp DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;


DELIMITER $$

CREATE TRIGGER check_vip_capacity
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE event_building_id INT;
    DECLARE event_capacity INT;
    DECLARE vip_count INT;
    
    -- Βρίσκουμε το κτίριο που θα γίνει το event
    SELECT building_id INTO event_building_id
    FROM event
    WHERE id = NEW.event_id;

    -- Βρίσκουμε τη χωρητικότητα του κτιρίου
    SELECT capacity INTO event_capacity
    FROM building
    WHERE id = event_building_id;

    -- Υπολογίζουμε πόσα VIP εισιτήρια υπάρχουν ήδη για το event
    SELECT COUNT(*) INTO vip_count
    FROM ticket
    WHERE event_id = NEW.event_id AND ticket_type_id = (
        SELECT id FROM ticket_type WHERE type = 'VIP'
    );

    -- Έλεγχος: Αν το VIP ξεπερνάει το 10% της χωρητικότητας
    IF vip_count >= (event_capacity * 0.1) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add more VIP tickets. Capacity limit exceeded.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_single_ticket_per_event
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE ticket_count INT;

    -- Υπολογίζουμε πόσα εισιτήρια έχει ο συγκεκριμένος επισκέπτης για το event
    SELECT COUNT(*) INTO ticket_count
    FROM ticket
    WHERE visitor_id = NEW.visitor_id AND event_id = NEW.event_id;

    -- Σφάλμα αν υπάρχει ήδη ένα εισιτήριο
    IF ticket_count > 0 THEN
        INSERT INTO insert_logs (message, timestamp)
        VALUES (
            CONCAT('Visitor with ID ', NEW.visitor_id, ' already owned ticket for this event with ID ', NEW.event_id),
            NOW()
        );
        SET NEW.id = NULL;
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_consecutive_festival_years
BEFORE INSERT ON artist_performance
FOR EACH ROW
BEGIN
    DECLARE current_festival_year YEAR;
    DECLARE prev_year1 YEAR;
    DECLARE prev_year2 YEAR;
    DECLARE prev_year3 YEAR;
    DECLARE artist_prev_year1_count INT;
    DECLARE artist_prev_year2_count INT;
    DECLARE artist_prev_year3_count INT;
    
    -- Get the year of the festival for the current performance
    SELECT f.year INTO current_festival_year
    FROM performance p
    JOIN event e ON p.event_id = e.id
    JOIN festival f ON e.festival_id = f.id
    WHERE p.id = NEW.performance_id;
    
    -- Calculate previous three years
    SET prev_year1 = current_festival_year - 1;
    SET prev_year2 = current_festival_year - 2;
    SET prev_year3 = current_festival_year - 3;
    
    -- Check if artist performed in previous year
    SELECT COUNT(*) INTO artist_prev_year1_count
    FROM artist_performance ap
    JOIN performance p ON ap.performance_id = p.id
    JOIN event e ON p.event_id = e.id
    JOIN festival f ON e.festival_id = f.id
    WHERE ap.artist_id = NEW.artist_id AND f.year = prev_year1;
    
    -- Check if artist performed two years ago
    SELECT COUNT(*) INTO artist_prev_year2_count
    FROM artist_performance ap
    JOIN performance p ON ap.performance_id = p.id
    JOIN event e ON p.event_id = e.id
    JOIN festival f ON e.festival_id = f.id
    WHERE ap.artist_id = NEW.artist_id AND f.year = prev_year2;
    
    -- Check if artist performed three years ago
    SELECT COUNT(*) INTO artist_prev_year3_count
    FROM artist_performance ap
    JOIN performance p ON ap.performance_id = p.id
    JOIN event e ON p.event_id = e.id
    JOIN festival f ON e.festival_id = f.id
    WHERE ap.artist_id = NEW.artist_id AND f.year = prev_year3;
    
    -- Εισαγωγή στο insert_logs για debugging
    INSERT INTO insert_logs (message) 
    VALUES (
        CONCAT('Year -1: ', artist_prev_year1_count, 
               ', Year -2: ', artist_prev_year2_count, 
               ', Year -3: ', artist_prev_year3_count,
               ', 1: ', prev_year1,
               ', 2: ', prev_year2,
               ', 3: ', prev_year3,
               ', current year ', current_festival_year)
    );
    
    -- If artist performed in all three previous years, prevent this performance (would be 4th consecutive)
    IF artist_prev_year1_count > 0 AND artist_prev_year2_count > 0 AND artist_prev_year3_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Artist cannot perform for more than 3 consecutive years. They must skip this year.';
    END IF;
END $$

DELIMITER ;


/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



-- Dump completed on 2025-04-28 13:30:54
