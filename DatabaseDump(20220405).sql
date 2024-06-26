CREATE DATABASE  IF NOT EXISTS `car_service2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `car_service2`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: car_service2
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `auto_service`
--

DROP TABLE IF EXISTS `auto_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_service`
--

LOCK TABLES `auto_service` WRITE;
/*!40000 ALTER TABLE `auto_service` DISABLE KEYS */;
INSERT INTO `auto_service` VALUES (1,'Sofia','Auto Beast'),(2,'Sofia','Lotus'),(3,'Varna','H&H Motors'),(4,'Varna','Garage');
/*!40000 ALTER TABLE `auto_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_service_brand`
--

DROP TABLE IF EXISTS `auto_service_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_service_brand` (
  `brand_id_brands` bigint NOT NULL,
  `auto_services_id` bigint NOT NULL,
  PRIMARY KEY (`brand_id_brands`),
  KEY `FKo3rc73f67ogvr1i8cvgbvrnya` (`auto_services_id`),
  CONSTRAINT `FKo3rc73f67ogvr1i8cvgbvrnya` FOREIGN KEY (`auto_services_id`) REFERENCES `auto_service` (`id`),
  CONSTRAINT `FKt95n9y4yt7s4dq81p19svi5gr` FOREIGN KEY (`brand_id_brands`) REFERENCES `brand` (`id_brands`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_service_brand`
--

LOCK TABLES `auto_service_brand` WRITE;
/*!40000 ALTER TABLE `auto_service_brand` DISABLE KEYS */;
INSERT INTO `auto_service_brand` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `auto_service_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id_brands` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_brands`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'BMW'),(2,'Opel'),(3,'Audi'),(4,'Tesla'),(5,'Renault'),(6,'Honda');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `model` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `year_of_production` date DEFAULT NULL,
  `brand_id_brands` bigint DEFAULT NULL,
  `customer_id_customers` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgev2yd3n0yl866th4cpbth08t` (`brand_id_brands`),
  KEY `FKeelaqk9kgt470kdxrntp05gyy` (`customer_id_customers`),
  CONSTRAINT `FKeelaqk9kgt470kdxrntp05gyy` FOREIGN KEY (`customer_id_customers`) REFERENCES `customer` (`id_customers`),
  CONSTRAINT `FKgev2yd3n0yl866th4cpbth08t` FOREIGN KEY (`brand_id_brands`) REFERENCES `brand` (`id_brands`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'Corsa','CA1552CA','2001-01-01',2,5,NULL),(2,'Civic','PK6622PX','2004-02-02',6,2,NULL),(3,'E46','CO5534CA','2002-01-01',1,6,NULL),(4,'Espace 3','CA5542CA','2003-04-04',5,7,NULL);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id_customers` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_card_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id_customers`),
  KEY `FKo4q5dk9ncfyq2euxmthd9bnvy` (`id_card_id`),
  CONSTRAINT `FK1pyvhy1ywoems32xnftn7348` FOREIGN KEY (`id_customers`) REFERENCES `user` (`id`),
  CONSTRAINT `FKo4q5dk9ncfyq2euxmthd9bnvy` FOREIGN KEY (`id_card_id`) REFERENCES `id_card` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,'Daniel',2,0),(5,'Kiril',1,0),(6,'Stoicho',3,0),(7,'Ivailo',4,0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_employees` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `auto_service_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id_employees`),
  KEY `FKs6ia0v4u01vqnflx3687tw0f5` (`auto_service_id`),
  CONSTRAINT `FK47igqfn3g8ag8hkav502ycf5w` FOREIGN KEY (`id_employees`) REFERENCES `user` (`id`),
  CONSTRAINT `FKs6ia0v4u01vqnflx3687tw0f5` FOREIGN KEY (`auto_service_id`) REFERENCES `auto_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Tutrakan','Leo',1,0),(8,'Mladost','Vasil',1,0),(9,'Drujba','Peter',2,0),(10,'Levski','Ivanna',2,0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id_history` bigint NOT NULL AUTO_INCREMENT,
  `date_of_repair` date DEFAULT NULL,
  `car_id` bigint DEFAULT NULL,
  `is_paid` bit(1) NOT NULL,
  PRIMARY KEY (`id_history`),
  KEY `FK8cfvmetqo0qa1lx860gw47l56` (`car_id`),
  CONSTRAINT `FK8cfvmetqo0qa1lx860gw47l56` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'2022-01-01',2,_binary '\0'),(2,'2021-01-03',1,_binary ''),(3,'2021-02-03',2,_binary ''),(4,'2021-03-24',4,_binary '\0'),(5,'2000-01-22',2,_binary ''),(6,'1990-01-22',1,_binary ''),(7,'2022-02-07',2,_binary '');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_employees`
--

DROP TABLE IF EXISTS `history_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_employees` (
  `histories_id_history` bigint NOT NULL,
  `employees_id_employees` bigint NOT NULL,
  `employees_id` bigint NOT NULL,
  PRIMARY KEY (`histories_id_history`,`employees_id_employees`),
  KEY `FK3ybgdpiyxmhxrs84935scv7ox` (`employees_id_employees`),
  CONSTRAINT `FK3ybgdpiyxmhxrs84935scv7ox` FOREIGN KEY (`employees_id_employees`) REFERENCES `employee` (`id_employees`),
  CONSTRAINT `FKt0sf818nav24u8qhforo0mvdc` FOREIGN KEY (`histories_id_history`) REFERENCES `history` (`id_history`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_employees`
--

LOCK TABLES `history_employees` WRITE;
/*!40000 ALTER TABLE `history_employees` DISABLE KEYS */;
INSERT INTO `history_employees` VALUES (1,10,0),(2,1,0),(3,9,0),(4,8,0),(5,1,0),(5,9,0),(6,9,0);
/*!40000 ALTER TABLE `history_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_card`
--

DROP TABLE IF EXISTS `id_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_card` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_card`
--

LOCK TABLES `id_card` WRITE;
/*!40000 ALTER TABLE `id_card` DISABLE KEYS */;
INSERT INTO `id_card` VALUES (1,'2002-02-08',''),(2,'2001-01-20',NULL),(3,'2000-06-02',NULL),(4,'2003-05-15',NULL);
/*!40000 ALTER TABLE `id_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'ADMIN_AUTO_SERVICE'),(3,'EMPLOYEE'),(4,'CUSTOMER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_service`
--

DROP TABLE IF EXISTS `type_of_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_service` (
  `id_type_of_service` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type_of_service`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_service`
--

LOCK TABLES `type_of_service` WRITE;
/*!40000 ALTER TABLE `type_of_service` DISABLE KEYS */;
INSERT INTO `type_of_service` VALUES (1,'break fix with ...',200,'break fix'),(2,'engine',999,'engine fix'),(3,'transmission',500,'transmission'),(4,'gear box',200,'gear box'),(5,' oil change',100,'oil '),(6,'clutch change',700,'clutch ');
/*!40000 ALTER TABLE `type_of_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_service_auto_services`
--

DROP TABLE IF EXISTS `type_of_service_auto_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_service_auto_services` (
  `type_of_services_id_type_of_service` bigint NOT NULL,
  `auto_services_id` bigint NOT NULL,
  PRIMARY KEY (`type_of_services_id_type_of_service`,`auto_services_id`),
  KEY `FKouh5iiqnhgdjocvk3i3c0xfgm` (`auto_services_id`),
  CONSTRAINT `FK5hocddpirjjnj2il6h8rxdd7k` FOREIGN KEY (`type_of_services_id_type_of_service`) REFERENCES `type_of_service` (`id_type_of_service`),
  CONSTRAINT `FKouh5iiqnhgdjocvk3i3c0xfgm` FOREIGN KEY (`auto_services_id`) REFERENCES `auto_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_service_auto_services`
--

LOCK TABLES `type_of_service_auto_services` WRITE;
/*!40000 ALTER TABLE `type_of_service_auto_services` DISABLE KEYS */;
INSERT INTO `type_of_service_auto_services` VALUES (2,1),(4,1),(3,2),(6,2),(5,3);
/*!40000 ALTER TABLE `type_of_service_auto_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_service_employees`
--

DROP TABLE IF EXISTS `type_of_service_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_service_employees` (
  `type_of_services_id_type_of_service` bigint NOT NULL,
  `employees_id_employees` bigint NOT NULL,
  `employees_id` bigint NOT NULL,
  PRIMARY KEY (`employees_id_employees`,`type_of_services_id_type_of_service`),
  KEY `FKdui4tynukpcfswj1wxcrqhq28` (`type_of_services_id_type_of_service`),
  CONSTRAINT `FKdui4tynukpcfswj1wxcrqhq28` FOREIGN KEY (`type_of_services_id_type_of_service`) REFERENCES `type_of_service` (`id_type_of_service`),
  CONSTRAINT `FKtr05kqpy8nuivy0t5tkfp6mhv` FOREIGN KEY (`employees_id_employees`) REFERENCES `employee` (`id_employees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_service_employees`
--

LOCK TABLES `type_of_service_employees` WRITE;
/*!40000 ALTER TABLE `type_of_service_employees` DISABLE KEYS */;
INSERT INTO `type_of_service_employees` VALUES (4,1,0),(2,8,0),(6,8,0),(3,9,0),(5,10,0);
/*!40000 ALTER TABLE `type_of_service_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_service_histories`
--

DROP TABLE IF EXISTS `type_of_service_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_service_histories` (
  `type_of_services_id_type_of_service` bigint NOT NULL,
  `histories_id_history` bigint NOT NULL,
  PRIMARY KEY (`histories_id_history`,`type_of_services_id_type_of_service`),
  KEY `FKn8p51680o3ly30j718680majm` (`type_of_services_id_type_of_service`),
  CONSTRAINT `FKn8p51680o3ly30j718680majm` FOREIGN KEY (`type_of_services_id_type_of_service`) REFERENCES `type_of_service` (`id_type_of_service`),
  CONSTRAINT `FKo50m8ky8ri0na7noewir1701w` FOREIGN KEY (`histories_id_history`) REFERENCES `history` (`id_history`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_service_histories`
--

LOCK TABLES `type_of_service_histories` WRITE;
/*!40000 ALTER TABLE `type_of_service_histories` DISABLE KEYS */;
INSERT INTO `type_of_service_histories` VALUES (2,3),(2,6),(2,7),(4,4),(5,5);
/*!40000 ALTER TABLE `type_of_service_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_service_price_overcharge`
--

DROP TABLE IF EXISTS `type_of_service_price_overcharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_service_price_overcharge` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_overcharge` decimal(19,2) DEFAULT NULL,
  `brand_id_brands` bigint DEFAULT NULL,
  `type_of_service_id_type_of_service` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp4cfltj5qsapyf2r4wlksq1i7` (`brand_id_brands`),
  KEY `FKctpcbl9ctwwiq6s4yu4ddbpj` (`type_of_service_id_type_of_service`),
  CONSTRAINT `FKctpcbl9ctwwiq6s4yu4ddbpj` FOREIGN KEY (`type_of_service_id_type_of_service`) REFERENCES `type_of_service` (`id_type_of_service`),
  CONSTRAINT `FKp4cfltj5qsapyf2r4wlksq1i7` FOREIGN KEY (`brand_id_brands`) REFERENCES `brand` (`id_brands`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_service_price_overcharge`
--

LOCK TABLES `type_of_service_price_overcharge` WRITE;
/*!40000 ALTER TABLE `type_of_service_price_overcharge` DISABLE KEYS */;
INSERT INTO `type_of_service_price_overcharge` VALUES (1,3.00,2,1),(2,2.00,3,4),(3,4.00,1,3),(4,5.00,1,2);
/*!40000 ALTER TABLE `type_of_service_price_overcharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_account_non_expired` bit(1) DEFAULT b'1',
  `is_account_non_locked` bit(1) DEFAULT b'1',
  `is_credentials_non_expired` bit(1) DEFAULT b'1',
  `is_enabled` bit(1) DEFAULT b'1',
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '',_binary '',_binary '',_binary '','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','mechanic'),(2,_binary '',_binary '',_binary '',_binary '','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','customer'),(3,_binary '',_binary '',_binary '',_binary '','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','admin'),(4,_binary '',_binary '',_binary '',_binary '','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','admin_auto_service'),(5,_binary '',_binary '',_binary '',_binary '','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','customer2'),(6,_binary '',_binary '',_binary '',_binary '','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','customer3'),(7,_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','customer4'),(8,_binary '',_binary '',_binary '',_binary '','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','mechanic2'),(9,_binary '',_binary '',_binary '',_binary '','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','mechanic3'),(10,_binary '\0',_binary '\0',_binary '\0',_binary '\0','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','mechanic4'),(11,_binary '',_binary '',_binary '',_binary '','$2a$12$GKDk9mzVZuq/qHssJYjsnezzGG/jD1KAYqYAASWYDcIBi5R197rFm','random1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authorities`
--

DROP TABLE IF EXISTS `user_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_authorities` (
  `users_id` bigint NOT NULL,
  `authorities_id` bigint NOT NULL,
  PRIMARY KEY (`users_id`,`authorities_id`),
  KEY `FK1nqvgotmn9fcfarl4rnp6iu7k` (`authorities_id`),
  CONSTRAINT `FK1nqvgotmn9fcfarl4rnp6iu7k` FOREIGN KEY (`authorities_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKn6acb7bng2ljsl1bdwbqdfb4p` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authorities`
--

LOCK TABLES `user_authorities` WRITE;
/*!40000 ALTER TABLE `user_authorities` DISABLE KEYS */;
INSERT INTO `user_authorities` VALUES (3,1),(4,2),(1,3),(8,3),(9,3),(2,4),(5,4),(6,4);
/*!40000 ALTER TABLE `user_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-05 11:42:13
