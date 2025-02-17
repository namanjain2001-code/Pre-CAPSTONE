CREATE DATABASE  IF NOT EXISTS `movie-ticket-booking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movie-ticket-booking`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: movie-ticket-booking
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `booking_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('BOOKED','CANCELLED') DEFAULT 'BOOKED',
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (3,'2025-02-16 22:21:48','BOOKED'),(4,'2025-02-17 03:29:20','BOOKED'),(5,'2025-02-17 03:29:36','BOOKED'),(6,'2025-02-17 03:29:53','BOOKED');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `discount_name` varchar(255) NOT NULL,
  `discount_type` enum('PERCENTAGE','FIXED') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_until` date NOT NULL,
  `min_booking_amount` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `movie_id` int NOT NULL,
  PRIMARY KEY (`discount_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_ratings`
--

DROP TABLE IF EXISTS `movie_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_ratings` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `review` text NOT NULL,
  `rating_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rating_id`),
  KEY `user_id` (`user_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `movie_ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `movie_ratings_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_ratings`
--

LOCK TABLES `movie_ratings` WRITE;
/*!40000 ALTER TABLE `movie_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(255) NOT NULL,
  `movie_description` text NOT NULL,
  `movie_duration` int NOT NULL,
  `movie_rated` varchar(10) NOT NULL,
  `movie_languages` varchar(255) NOT NULL,
  `movie_genres` varchar(255) NOT NULL,
  `movie_thumbnail` varchar(255) NOT NULL,
  `movie_type` enum('IMAX','REGULAR') NOT NULL,
  `movie_release_date` date DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  UNIQUE KEY `movie_name_UNIQUE` (`movie_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Interstella','Space and TimeTravel',180,'16+','English,Hindi','Sci-fi,Drama','12345yu','REGULAR','2025-02-27'),(3,'3idiots','comedy',170,'9','hindi','comedy','link','REGULAR','2025-02-02');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `notification_title` varchar(90) DEFAULT NULL,
  `notification_message` varchar(450) DEFAULT NULL,
  `notification_date` date DEFAULT NULL,
  `notification_time` time DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (106,'You\'ve Successfully Logged In!','Hello [User\'s Name], you’ve just logged in to [Movie Portal Name]! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-16','23:34:50',8),(107,'You\'ve Successfully Logged In!','Hello [User\'s Name], you’ve just logged in to [Movie Portal Name]! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-16','23:39:47',8),(108,'You\'ve Successfully Logged In!','Hello [User\'s Name], you’ve just logged in to [Movie Portal Name]! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-16','23:55:13',8),(109,'You\'ve Successfully Logged In!','Hello [User\'s Name], you’ve just logged in to [Movie Portal Name]! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-16','23:56:35',9),(110,'You\'ve Successfully Logged In!','Hello [User\'s Name], you’ve just logged in to [Movie Portal Name]! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-16','23:56:35',9),(111,'You\'ve Successfully Logged In!','Hello AA, you’ve just logged in to [Movie Portal Name]! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','00:18:46',9),(112,'You\'ve Successfully Logged In!','Hello AA, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','00:30:26',9),(113,'Welcome to FINDSHOW!','Hey AA, welcome to [Movie Portal Name]! We\'re thrilled to have you join our community. Explore the latest movies, enjoy personalized recommendations, and stay up to date with all your favorite shows. Get ready to embark on a cinematic journey!','2025-02-17','00:34:27',9),(114,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','00:34:27',11),(115,'Welcome to FINDSHOW!','Hey CC, welcome to [Movie Portal Name]! We\'re thrilled to have you join our community. Explore the latest movies, enjoy personalized recommendations, and stay up to date with all your favorite shows. Get ready to embark on a cinematic journey!','2025-02-17','00:39:45',11),(116,'Welcome to FINDSHOW!','Hey EE, welcome to [Movie Portal Name]! We\'re thrilled to have you join our community. Explore the latest movies, enjoy personalized recommendations, and stay up to date with all your favorite shows. Get ready to embark on a cinematic journey!','2025-02-17','00:42:17',13),(117,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','00:57:04',11),(118,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:24:13',11),(119,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:24:13',11),(120,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:24:13',11),(121,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:24:13',11),(122,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:24:13',11),(123,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:24:13',11),(124,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:24:13',11),(125,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:24:13',11),(126,'You\'ve Successfully Logged In!','Hello CC, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:45:42',11),(127,'You\'ve Successfully Logged In!','Hello BB, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:45:42',10),(128,'You\'ve Successfully Logged In!','Hello BB, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:45:42',10),(129,'Welcome to FINDSHOW!','Hey Hardik, welcome to FINDSHOW! We\'re thrilled to have you join our community. Explore the latest movies, enjoy personalized recommendations, and stay up to date with all your favorite shows. Get ready to embark on a cinematic journey!','2025-02-17','01:45:42',14),(130,'You\'ve Successfully Logged In!','Hello Hardik, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:45:42',14),(131,'You\'ve Successfully Logged In!','Hello Hardik, you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!','2025-02-17','01:45:42',14),(132,'Welcome to FINDSHOW!','Hey qwes, welcome to FINDSHOW! We\'re thrilled to have you join our community. Explore the latest movies, enjoy personalized recommendations, and stay up to date with all your favorite shows. Get ready to embark on a cinematic journey!','2025-02-17','08:57:23',15);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('CREDIT_CARD','DEBIT_CARD','PAYPAL','UPI') DEFAULT 'CREDIT_CARD',
  `payment_status` enum('PENDING','COMPLETED','FAILED') DEFAULT 'PENDING',
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` enum('ROLE_SUPERADMIN','ROLE_ADMIN','ROLE_USER') NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_SUPERADMIN'),(2,'ROLE_ADMIN'),(3,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screens` (
  `screen_id` int NOT NULL AUTO_INCREMENT,
  `screen_number` int NOT NULL,
  `theatre_id` int NOT NULL,
  `screen_capacity` int NOT NULL,
  `screen_type` enum('IMAX','REGULAR') NOT NULL,
  PRIMARY KEY (`screen_id`),
  UNIQUE KEY `screen_number_UNIQUE` (`screen_number`),
  KEY `screens_ibfk_1` (`theatre_id`),
  CONSTRAINT `screens_ibfk_1` FOREIGN KEY (`theatre_id`) REFERENCES `theatres` (`theatre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (1,1,5,200,'REGULAR'),(3,2,5,200,'IMAX');
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seatcost`
--

DROP TABLE IF EXISTS `seatcost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seatcost` (
  `seatcost_id` int NOT NULL AUTO_INCREMENT,
  `screen_type` enum('IMAX','REGULAR') NOT NULL,
  `seat_type` enum('normal','sofa','recliner') NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `reduced_cost` decimal(10,2) DEFAULT NULL,
  `discounted_rows` int NOT NULL,
  PRIMARY KEY (`seatcost_id`),
  CONSTRAINT `seatcost_screen_type_check` CHECK ((`screen_type` in (_utf8mb4'IMAX',_utf8mb4'REGULAR'))),
  CONSTRAINT `seatcost_seat_type_check` CHECK ((`seat_type` in (_utf8mb4'normal',_utf8mb4'sofa',_utf8mb4'recliner')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatcost`
--

LOCK TABLES `seatcost` WRITE;
/*!40000 ALTER TABLE `seatcost` DISABLE KEYS */;
/*!40000 ALTER TABLE `seatcost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `seat_number` varchar(10) NOT NULL,
  `seat_type` enum('NORMAL','SOFA','RECLINER') NOT NULL,
  `show_id` int NOT NULL,
  `booking_id` int DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `seats_ibfk_2` (`show_id`),
  KEY `seats_ibfk_3_idx` (`user_id`),
  KEY `seats_ibfk_4_idx` (`booking_id`),
  CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`),
  CONSTRAINT `seats_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `seats_ibfk_4` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,6,'A5','NORMAL',1,3),(2,5,'B5','NORMAL',1,4),(3,5,'C6','NORMAL',1,5),(4,5,'E7','NORMAL',1,6),(5,5,'E5','NORMAL',1,6),(6,5,'E6','NORMAL',1,6);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `show_id` int NOT NULL AUTO_INCREMENT,
  `screen_id` int NOT NULL,
  `movie_id` int DEFAULT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  PRIMARY KEY (`show_id`),
  KEY `screen_id` (`screen_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`screen_id`),
  CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (1,3,1,'2025-02-16','22:50:00');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatres`
--

DROP TABLE IF EXISTS `theatres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatres` (
  `theatre_id` int NOT NULL AUTO_INCREMENT,
  `theatre_name` varchar(255) NOT NULL,
  `theatre_location` varchar(255) NOT NULL,
  `theatre_screens` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`theatre_id`),
  UNIQUE KEY `theatre_name_UNIQUE` (`theatre_name`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatres`
--

LOCK TABLES `theatres` WRITE;
/*!40000 ALTER TABLE `theatres` DISABLE KEYS */;
INSERT INTO `theatres` VALUES (5,'INOX','Navalur,Chennai',4,5),(6,'PVR','Chennai',4,6),(9,'Carnival Cinema','Indore',3,6);
/*!40000 ALTER TABLE `theatres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `transaction_type` enum('PAYMENT','REFUND') DEFAULT 'PAYMENT',
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (5,1),(6,2),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Girish','9121052205','girishkumarthatavarthi@gmail.com','$2a$10$vQvyr0wtYgpdXrystJMdQOmuhFGDHX5kDwiJgzhevFT.tyOeHl3du'),(6,'Kavya','1234567890','kavya@gmail.com','$2a$10$9fn8aCxduAIeJmEhasZF5u6s9.ln/xjVsccSTZOKMdYbdz9IeFo/u'),(7,'Naman','8720842731','nj796644@gmail.com','$2a$10$m7XhJsFQbXWBrnETwL6HMufyib6qei9BByU7X7ijztm0smvhVVjQW'),(8,'Test','8720842731','test@gmail.com','$2a$10$tCTeq4SrAZ2CxgUklJnUu.wpMxaptyAwPROVcGUXTTDY/.xCAZH6a'),(9,'AA','1234543234','A@gmail.com','$2a$10$nxeS2t8zEK.mULL03/3v.eWgEdLpadBTRE7Jm4jiBDS.IlhgCUvaG'),(10,'BB','1234543234','B@gmail.com','$2a$10$gDAqNHzMga7QIpvHrlQNpufSQXH42ntTvbKup7rOAS.JzMHr9UypK'),(11,'CC','1234543234','C@gmail.com','$2a$10$d7Ad3ze2B0QS6EomFGs9.uVxeDWyFF.vtBz.qIglU2ciMGa..rREi'),(12,'DD','1234543234','D@gmail.com','$2a$10$24w2mWaUNooWJJwZopHB4.MsEgFGDwdDHTs9pgBbyY/7.5bJ4icf.'),(13,'EE','1234543234','E@gmail.com','$2a$10$VRh0gJjLqKYfabb.NMqKl.usucGsT/8IrVeCsZDlQEcFnDxIIBmZW'),(14,'Hardik','1234543234','hardik@gmail.com','$2a$10$f4mrdwq67VhnmF3QhUrnheZs.Vv74Prj9BHoxzd1x2L5OvZi4Srl.'),(15,'qwes','0000000000','qwes@gmail.com','$2a$10$.FfmjT07qaUW6kzBTtfWM.jzDJqlylAZFW8eRg0c33pjI.YtFpqzK');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-17 10:32:08
