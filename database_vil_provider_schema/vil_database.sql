-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: vil_provider_db
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
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `description` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_complaint_user` (`user_id`),
  CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,2,'Slow internet connection during peak hours','OPEN','2025-03-26 18:13:15'),(2,3,'Billing discrepancy for last month','IN_PROGRESS','2025-03-26 18:13:15'),(3,1,'vadafone is fraud company','OPEN','2025-03-26 18:53:00'),(4,1,'vadafone  fraud','OPEN','2025-03-26 18:56:05'),(6,1,'airtel is bad services','OPEN','2025-03-26 19:13:39'),(7,1,'o2 is very bad service provider','OPEN','2025-03-26 19:29:37');
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_reports`
--

DROP TABLE IF EXISTS `compliance_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compliance_reports` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `last_checked` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_compliance_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_reports`
--

LOCK TABLES `compliance_reports` WRITE;
/*!40000 ALTER TABLE `compliance_reports` DISABLE KEYS */;
INSERT INTO `compliance_reports` VALUES (1,'Q1 2025 Compliance','COMPLIANT','All systems compliant with regulations','2025-03-26 18:13:20'),(2,'Security Audit','PENDING','Pending final review from security team','2025-03-26 18:13:20'),(3,'122334','COMPLIANT','tetelcomecompany','2025-03-26 18:54:12');
/*!40000 ALTER TABLE `compliance_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_subscription_user` (`user_id`),
  CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,1,'PREMIUM','ACTIVE','2025-03-26 18:13:05','2025-03-26 18:13:05'),(2,2,'STANDARD','ACTIVE','2025-03-26 18:13:05','2025-03-26 18:13:05'),(3,3,'BASIC','INACTIVE','2025-03-26 18:13:05','2025-03-26 18:13:05'),(9,1,'BASIC','ACTIVE','2025-03-26 19:14:37','2025-03-26 19:14:37'),(10,1,'STANDARD','ACTIVE','2025-03-26 19:14:53','2025-03-26 19:14:53'),(12,1,'STANDARD','ACTIVE','2025-03-26 19:15:15','2025-03-26 19:15:15'),(13,1,'BASIC','ACTIVE','2025-03-26 19:19:45','2025-03-26 19:19:45'),(14,1,'STANDARD','ACTIVE','2025-03-26 19:23:37','2025-03-26 19:23:37'),(15,1,'BASIC','ACTIVE','2025-03-26 19:28:58','2025-03-26 19:28:58'),(21,1,'STANDARD','ACTIVE','2025-03-27 00:55:57','2025-03-27 00:55:57');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','admin@vilprovider.com','$2a$10$xJwL5v5Jz6TZzBZ7QYqZ3uJ1V9WkQ6Xc5nX7vY8wR9tN0yK1L2M3','2025-03-26 18:12:55','2025-03-26 18:12:55'),(2,'John Doe','john.doe@example.com','$2a$10$yH9aP5bQ2rS3tU4vW5xY6zA7B8C9D0E1F2G3H4I5J6K7L8M9N0O1','2025-03-26 18:12:55','2025-03-26 18:12:55'),(3,'Jane Smith','jane.smith@example.com','$2a$10$zI0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z6A7B8C9D0E1F2G3H4','2025-03-26 18:12:55','2025-03-26 18:12:55'),(5,'priyanka kumari','priayankak866@gmail.com','455','2025-03-26 19:12:08','2025-03-26 19:12:08'),(7,'priyankakumari','priayankak900866@gmail.com','9007uyjjj','2025-03-27 00:53:24','2025-03-27 00:53:24'),(8,'zahid','zahid@gmail.com','zahid','2025-03-27 00:53:49','2025-03-27 00:53:49'),(9,'neha','neha@gmail.com','12345','2025-03-27 00:54:35','2025-03-27 00:54:35'),(10,'preetiii','pritei@gmail.com','ghjjk','2025-03-27 00:54:55','2025-03-27 00:54:55');
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

-- Dump completed on 2025-03-27  7:10:05
