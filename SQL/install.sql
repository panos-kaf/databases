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
  `image_description` VARCHAR(255) DEFAULT NULL,
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
  `image_description` VARCHAR(255) DEFAULT NULL,
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
  `image_description` VARCHAR(255) DEFAULT NULL,
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
  `visitor_id` int NOT NULL,
  `event_id` int DEFAULT NULL,
  `ticket_type_id` int DEFAULT NULL,
  `specific_ticket` int DEFAULT NULL,
  `is_valid` int DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
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
  `image_description` VARCHAR(255) DEFAULT NULL,
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
  `image_description` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id_idx` (`location_id`),
  CONSTRAINT `location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `criteria_id` int NOT NULL,
  `visitor_id` int NOT NULL,
  `performance_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_visitor_id_idx` (`visitor_id`),
  CONSTRAINT `fk_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`),
  CONSTRAINT `fk_performance_id` FOREIGN KEY (`performance_id`) REFERENCES `performance` (`id`),
  CONSTRAINT `fk_criteria_id` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `criteria`;
CREATE TABLE `criteria` (
	`id` int auto_increment,
    `category` VARCHAR(20) NOT NULL,
    primary key (`id`)
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
  `cost` float NOT NULL,
  `used` tinyint NOT NULL,
  `purchase_type_id` int DEFAULT  NULL,
  `ticket_type_id` int DEFAULT NULL,
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
  CONSTRAINT `fk_ticket_visitor_id` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ticket_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`)
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

-- ------------------------------ START OF LOG TABLES --------------------------------------------------

DROP TABLE IF EXISTS `insert_logs`;
CREATE TABLE `insert_logs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `message` VARCHAR(255) NOT NULL,
    timestamp DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `festival_insertion_log`;
CREATE TABLE `festival_insertion_log` (
    `id` INT AUTO_INCREMENT,
    `location_id` INT NOT NULL,
    `year` YEAR NOT NULL,
    `attempted_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `message` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `event_per_building_log`;
CREATE TABLE `event_per_building_log` (
    `id` INT AUTO_INCREMENT,
    `building_id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `conflict_time` TIME NOT NULL,
    `message` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ticket_vip_log`;
CREATE TABLE `ticket_vip_log` (
    `id` INT AUTO_INCREMENT,
    `event_id` INT NOT NULL,
    `visitor_id` INT DEFAULT NULL,
    `attempted_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `message` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `ticket_capacity_log`;
CREATE TABLE `ticket_capacity_log` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `event_id` INT NOT NULL,
    `visitor_id` INT DEFAULT NULL,
    `ticket_id` INT DEFAULT NULL,
    `attempted_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `message` VARCHAR(255) NOT NULL,
    CONSTRAINT `fk_event_ticket_capacity` FOREIGN KEY (`event_id`) REFERENCES `event`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_visitor_ticket_capacity` FOREIGN KEY (`visitor_id`) REFERENCES `visitor`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `buyer_log`;
CREATE TABLE `buyer_log` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `ticket_id` INT NOT NULL,
    `visitor_id` INT NOT NULL,
    `event_id` INT DEFAULT NULL,
    `purchase_type_id` INT NOT NULL,
    `purchase_date` DATETIME NOT NULL,
    `purchase_method` VARCHAR(20) NOT NULL, -- 'direct' ή 'resale'
    `is_valid` int,
    CONSTRAINT `fk_buyer_log_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_buyer_log_visitor` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


-- -------------------------------------  END OF LOG TABLES -----------------------------------------------
-- --------------------------- TRIGGERS -------------------------------------------------------------------

DELIMITER $$

DROP TRIGGER IF EXISTS check_vip_capacity;
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
        -- Καταγραφή στο log
        INSERT INTO ticket_vip_log (event_id, visitor_id, message)
        VALUES (NEW.event_id, NEW.visitor_id, 'Cannot add more VIP tickets. Capacity limit exceeded.');
        
        -- Παράκαμψη του insert
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add more VIP tickets. Capacity limit exceeded.';
    END IF;
END $$

DELIMITER ;
-- -----------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP TRIGGER IF EXISTS check_consecutive_festival_years;
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
-- -----------------------------------------------------------------------------------------------------------------
-- -------------------------------- Capacity check per ticket insertion ---------------------------------------

DELIMITER $$

DROP TRIGGER IF EXISTS check_building_capacity_before;
CREATE TRIGGER check_building_capacity_before
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE current_tickets INT;
    DECLARE building_capacity INT;

    -- Βρίσκουμε τη χωρητικότητα του κτιρίου που αντιστοιχεί στο event
    SELECT b.capacity INTO building_capacity
    FROM event e
    JOIN building b ON e.building_id = b.id
    WHERE e.id = NEW.event_id;

    -- Βρίσκουμε πόσα εισιτήρια έχουν ήδη εκδοθεί για το συγκεκριμένο event
    SELECT COUNT(*) INTO current_tickets
    FROM ticket
    WHERE event_id = NEW.event_id;

    -- Αν τα ήδη εκδοθέντα εισιτήρια + το καινούριο υπερβαίνουν τη χωρητικότητα
    IF (current_tickets + 1) > building_capacity THEN
        -- Καταγραφή στο log
        INSERT INTO ticket_capacity_log (event_id, visitor_id, message)
        VALUES (NEW.event_id, NEW.visitor_id, 'Building capacity exceeded. Ticket insertion skipped.');

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Building capacity exceeded. Ticket was not inserted.';
    END IF;
END $$

DELIMITER ;


-- ---------------------------- Trigger για μοναδικό event κάθε φορά ανά κτήριο ----------------------------------------

DELIMITER $$

DROP TRIGGER IF EXISTS check_event_unique_in_building;
CREATE TRIGGER check_event_unique_in_building
BEFORE INSERT ON performance
FOR EACH ROW
BEGIN
    DECLARE event_count INT DEFAULT 0;
    DECLARE building_id INT;

    -- Βρίσκουμε το κτίριο που αντιστοιχεί στο event
    SELECT building_id INTO building_id
    FROM event
    WHERE id = NEW.event_id;

    -- Έλεγχος αν υπάρχει ήδη άλλο event στο ίδιο κτίριο την ίδια χρονική στιγμή
    SELECT COUNT(*) INTO event_count
    FROM performance p
    INNER JOIN event e ON p.event_id = e.id
    WHERE e.building_id = building_id
      AND p.time = NEW.time;

    -- Αν υπάρχει conflict, το παρακάμπτουμε και το καταγράφουμε στο log
    IF event_count > 0 THEN
        -- Καταγραφή στο log
        INSERT INTO event_per_building_log (building_id, event_id, conflict_time, message)
        VALUES (
            building_id,
            NEW.event_id,
            NEW.time,
            'Conflict detected: Another event is scheduled in the same building at this time.'
        );

        -- Μαρκάρουμε το event ως μη έγκυρο
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Conflict detected: Another event is scheduled in the same building at this time.';
    END IF;
END $$

DELIMITER ;

-- --------------------------------------------------------------------------------------------------------


-- ------------------------ Trigger για εισαγωγή tickets στον resale_queue -------------------------------------
DELIMITER $$
DROP TRIGGER IF EXISTS after_insert_ticket;
CREATE TRIGGER after_insert_ticket
AFTER INSERT ON ticket
FOR EACH ROW
BEGIN
    -- Ελέγχουμε αν το ticket έχει for_sale = 1
    IF NEW.for_sale = 1 THEN
        -- Προσθήκη στο resale_queue
        INSERT INTO resale_queue (ticket_id)
        VALUES (NEW.id);
    END IF;
END $$

DELIMITER ;
-- --------------------  Trigger για εισαγωγή ticket στο resale_queue μετά απο update ---------------------------
DELIMITER $$
DROP TRIGGER IF EXISTS after_update_ticket_for_sale;
CREATE TRIGGER after_update_ticket_for_sale
BEFORE
 UPDATE ON ticket
FOR EACH ROW
BEGIN
    -- Ελέγχουμε αν το πεδίο for_sale ενημερώθηκε από 0 σε 1
    IF OLD.for_sale = 0 AND NEW.for_sale = 1 THEN
        -- Προσθήκη στο resale_queue
        INSERT INTO resale_queue (ticket_id)
        VALUES (NEW.id);
    END IF;
END $$

DELIMITER ;
-- ------------------------ Trigger για αγορά ticket απο buyer -------------------------------------------------
DELIMITER $$

DROP TRIGGER IF EXISTS before_insert_buyer;
CREATE TRIGGER before_insert_buyer
BEFORE INSERT ON buyer
FOR EACH ROW
BEGIN

	DECLARE available_ticket_id INT DEFAULT NULL;
	DECLARE resale_ticket_id INT DEFAULT NULL;
	DECLARE random_purchase_type INT;
    
    -- Έλεγχος αν ο buyer έχει is_valid = 0
    IF NEW.is_valid = 1 THEN
        -- Αν δεν είναι έγκυρος, κάνουμε απλά LEAVE και τερματίζουμε το trigger

		-- Επιλογή τυχαίου purchase_type (1, 2 ή 3)
		SET random_purchase_type = FLOOR(1 + RAND() * 3);

		-- Έλεγχος αν υπάρχει specific_ticket
		IF NEW.specific_ticket IS NOT NULL THEN
			-- Ψάχνουμε το συγκεκριμένο ticket
			SELECT id INTO available_ticket_id
			FROM ticket
			WHERE id = NEW.specific_ticket
			  AND visitor_id IS NULL
			LIMIT 1;

			-- Αν δεν βρεθεί στο ticket, το ψάχνουμε στο resale_queue
			IF available_ticket_id IS NULL THEN
				SELECT ticket_id INTO resale_ticket_id
				FROM resale_queue
				WHERE ticket_id = NEW.specific_ticket
				LIMIT 1;
			END IF;
		END IF;

		-- Μόνο αν το event_id δεν είναι NULL προχωράμε στην αναζήτηση
		IF NEW.event_id IS NOT NULL AND (available_ticket_id IS NULL AND resale_ticket_id IS NULL) THEN
			-- Αν δεν βρεθεί με specific_ticket, ψάχνουμε με event_id και ticket_type
			SELECT id INTO available_ticket_id
			FROM ticket
			WHERE event_id = NEW.event_id
			  AND ticket_type_id = NEW.ticket_type_id
			  AND visitor_id IS NULL
			LIMIT 1;

			-- Αν δεν βρεθεί στο ticket, το ψάχνουμε στο resale_queue
			IF available_ticket_id IS NULL THEN
				SELECT ticket_id INTO resale_ticket_id
				FROM resale_queue rq
				JOIN ticket t ON t.id = rq.ticket_id
				WHERE t.event_id = NEW.event_id
				  AND t.ticket_type_id = NEW.ticket_type_id
				LIMIT 1;
			END IF;
		END IF;

		-- Αν βρεθεί εισιτήριο είτε στο ticket είτε στο resale_queue
		IF available_ticket_id IS NOT NULL OR resale_ticket_id IS NOT NULL THEN
			SET available_ticket_id = IFNULL(available_ticket_id, resale_ticket_id);

			-- Κάνουμε το update στο ticket
			UPDATE ticket
			SET visitor_id = NEW.visitor_id,
				purchase_type_id = random_purchase_type,
				purchase_date = NOW()
			WHERE id = available_ticket_id;

			-- Διαγραφή από τον πίνακα resale_queue αν προέρχεται από εκεί
			DELETE FROM resale_queue WHERE ticket_id = available_ticket_id;

			INSERT INTO buyer_log (ticket_id, visitor_id, event_id, purchase_type_id, purchase_date, purchase_method, is_valid)
			VALUES (available_ticket_id, NEW.visitor_id, NEW.event_id, random_purchase_type, NOW(),
			IF(resale_ticket_id IS NOT NULL, 'resale', 'direct'), 0);

			UPDATE buyer
			SET is_valid = 0;
		END IF;

    END IF;
END $$

DELIMITER ;




-- --------------------------------------- END OF TRIGGERS -------------------------------------------------------

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
