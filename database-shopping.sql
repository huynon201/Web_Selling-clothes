-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping
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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg5uhi8vpsuy0lgloxk2h4w5o6` (`user_id`),
  CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_detail_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrg4yopd2252nwj8bfcgq5f4jp` (`cart_id`),
  KEY `FKi7e6sun6bgro3h7maw0v06yip` (`product_detail_id`),
  CONSTRAINT `FKi7e6sun6bgro3h7maw0v06yip` FOREIGN KEY (`product_detail_id`) REFERENCES `product_details` (`id`),
  CONSTRAINT `FKrg4yopd2252nwj8bfcgq5f4jp` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (6,'Áo khoác chính hãng','Áo Khoác'),(7,'Ảo len mùa đông','Ảo len'),(8,'Áo sơ mi công sở','Áo sơ mi'),(10,'','Quần Âu'),(11,'','Quần Jeans'),(12,'','Quần Dài Kaki'),(13,'','Quần Short');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hex_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'#FF0000','Red'),(2,'#00FF00','Green'),(3,'#0000FF','Blue'),(4,'#FFFF00','Yellow'),(5,'#FFA500','Orange'),(6,'#800080','Purple'),(7,'#000000','Black'),(8,'#FFFFFF','White'),(9,'#808080','Gray'),(10,'#FFC0CB','Pink');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `description` text,
  `discount_percent` double NOT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `max_discount` double NOT NULL,
  `quantity` bigint NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bc29q3wh0lqhy0k84bx3afk08` (`code`),
  CONSTRAINT `discounts_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,'G300','',30,'2024-12-21 21:05:00.000000',10000,20,'2024-12-05 21:05:00.000000'),(2,'g100','',10,'2024-12-20 21:06:00.000000',20000,10,'2024-12-12 21:05:00.000000'),(5,'G1223','',32,'2024-12-27 21:36:00.000000',3,3,'2024-12-04 21:36:00.000000');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_history`
--

DROP TABLE IF EXISTS `message_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `message_id` bigint DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe9x31gbg5q7usy4lnwcc07dxb` (`message_id`),
  KEY `FKjgakcya1cp262jlu0ltshpe4a` (`sender_id`),
  CONSTRAINT `FKe9x31gbg5q7usy4lnwcc07dxb` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `FKjgakcya1cp262jlu0ltshpe4a` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_history`
--

LOCK TABLES `message_history` WRITE;
/*!40000 ALTER TABLE `message_history` DISABLE KEYS */;
INSERT INTO `message_history` VALUES (1,'chào bạn',NULL,'2024-12-21 14:30:56.879557',1,3),(2,'bạn có ở đấy không',NULL,'2024-12-21 14:31:12.911884',2,3),(3,'alo',NULL,'2024-12-22 00:50:26.599171',3,3),(4,'hello',NULL,'2024-12-22 00:51:07.076678',4,1),(5,'how are you?',NULL,'2024-12-22 00:51:15.511089',5,1),(6,'tôi đây',_binary '\0','2024-12-22 00:52:20.683500',6,3),(7,'bạn cần gì',_binary '\0','2024-12-22 00:52:27.601145',6,3);
/*!40000 ALTER TABLE `message_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_read` bit(1) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `receiver_id` bigint DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt05r0b6n0iis8u7dfna4xdh73` (`receiver_id`),
  KEY `FK4ui4nnwntodh6wjvck53dbk9m` (`sender_id`),
  CONSTRAINT `FK4ui4nnwntodh6wjvck53dbk9m` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKt05r0b6n0iis8u7dfna4xdh73` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,NULL,'2024-12-21 14:30:56.879557',3,3),(2,NULL,'2024-12-21 14:31:12.911884',3,3),(3,NULL,'2024-12-22 00:50:26.599171',3,3),(4,NULL,'2024-12-22 00:51:07.076678',3,1),(5,NULL,'2024-12-22 00:51:15.511089',3,1),(6,_binary '\0','2024-12-22 00:52:20.667492',1,3);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `product_detail_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FKl9w7hjxo9qo8s0glyr4ngkm1d` (`product_detail_id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKl9w7hjxo9qo8s0glyr4ngkm1d` FOREIGN KEY (`product_detail_id`) REFERENCES `product_details` (`id`),
  CONSTRAINT `order_details_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,'Green',1000,1,'S',32,1),(2,'Red',1000,2,'M',32,1),(3,'Blue',1000,3,'L',32,1),(4,'Yellow',1000,1,'XL',32,1),(5,'Black',1000,4,'XXL',32,1),(6,'White',1000,2,'M',32,1),(7,'Purple',1000,3,'L',32,1),(8,'Pink',1000,5,'S',32,1),(9,'Orange',1000,2,'M',32,1),(10,'Gray',1000,1,'S',32,1),(11,'Brown',1000,6,'XL',32,1),(12,'Green',380000,1,'M',53,16),(13,'Black',500000,1,'S',54,17),(14,'White',480000,1,'M',54,15);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double NOT NULL,
  `discount_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_ref` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsxfvku34v9ujavmj9ao69vo8s` (`discount_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKsxfvku34v9ujavmj9ao69vo8s` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (32,'2024-12-14 20:52:01.964136','vĩnh phúc','nguyễn huy đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(33,'2024-12-15 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(34,'2024-12-16 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(35,'2024-12-17 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(36,'2024-12-18 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(37,'2024-12-19 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(38,'2024-12-20 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(39,'2024-12-21 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(40,'2024-12-22 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(41,'2024-12-23 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(42,'2024-12-24 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(43,'2024-12-25 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(44,'2024-12-26 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(45,'2024-12-27 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(46,'2024-12-28 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(47,'2024-12-29 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(48,'2024-12-30 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(49,'2024-12-31 08:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(50,'2024-12-16 09:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(51,'2024-12-17 09:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(52,'2024-12-18 09:10:00.000000','Vĩnh Phúc','Nguyễn Huy Đạt','0394105275','Đã giao',1000,NULL,1,NULL,NULL,NULL),(53,'2024-12-21 22:24:09.271508','vĩnh long','Vũ Đức Doanh','0394105275','Đang xử lý',380000,NULL,3,'COD','UNKNOWN','PAYMENT_UNPAID'),(54,'2024-12-21 22:24:42.147305','hưng yên','Công','0394105275','Đang xử lý',980000,NULL,3,'COD','UNKNOWN','PAYMENT_UNPAID'),(100,'2024-12-28 08:00:00.000000','Hà Nội','Nguyễn Văn A','0911123456','Processing',1500000,1,1,'Credit Card','REF123456','Unpaid'),(101,'2024-12-29 09:00:00.000000','Hải Phòng','Trần Thị B','0922234567','Pending',2000000,1,3,'Bank Transfer','REF123457','Paid'),(102,'2024-12-30 10:00:00.000000','Đà Nẵng','Lê Thị C','0933345678','Delivered',2500000,NULL,1,'Cash on Delivery',NULL,'Unpaid'),(103,'2024-12-31 11:00:00.000000','Cần Thơ','Võ Văn D','0944456789','Processing',1000000,1,3,'Bank Transfer','REF123458','Paid'),(104,'2025-01-01 12:00:00.000000','Hồ Chí Minh','Phạm Thị E','0955567890','Delivered',1200000,NULL,1,'Credit Card','REF123459','Unpaid'),(105,'2025-01-02 13:00:00.000000','Vũng Tàu','Nguyễn Văn F','0966678901','Pending',800000,1,3,'Cash on Delivery',NULL,'Unpaid'),(106,'2025-01-03 14:00:00.000000','Nha Trang','Trần Thị G','0977789012','Processing',700000,1,1,'Credit Card','REF123460','Paid'),(107,'2025-01-04 15:00:00.000000','Huế','Lê Văn H','0988890123','Đang giao',900000,NULL,1,'Bank Transfer','REF123461','Unpaid'),(108,'2025-01-05 16:00:00.000000','Quảng Ninh','Võ Thị I','0999901234','Pending',1100000,1,1,'Cash on Delivery',NULL,'Paid'),(109,'2025-01-06 17:00:00.000000','Đắk Lắk','Phạm Văn K','0900012345','Processing',1300000,1,3,'Credit Card','REF123462','Paid'),(130,'2024-12-12 08:00:00.000000','Hà Nội','Nguyễn Văn A','0911123456','Processing',1500000,1,1,'Credit Card','REF123456','Unpaid'),(131,'2024-12-13 09:00:00.000000','Hải Phòng','Trần Thị B','0922234567','Pending',2000000,1,3,'Bank Transfer','REF123457','Paid'),(132,'2024-12-14 10:00:00.000000','Đà Nẵng','Lê Thị C','0933345678','Delivered',2500000,NULL,1,'Cash on Delivery',NULL,'Unpaid'),(133,'2024-12-15 11:00:00.000000','Cần Thơ','Võ Văn D','0944456789','Processing',1000000,1,3,'Bank Transfer','REF123458','Paid'),(134,'2024-01-06 12:00:00.000000','Hồ Chí Minh','Phạm Thị E','0955567890','Delivered',1200000,NULL,1,'Credit Card','REF123459','Unpaid'),(135,'2024-01-02 13:00:00.000000','Vũng Tàu','Nguyễn Văn F','0966678901','Pending',800000,1,3,'Cash on Delivery',NULL,'Unpaid'),(136,'2024-01-03 14:00:00.000000','Nha Trang','Trần Thị G','0977789012','Processing',700000,1,1,'Credit Card','REF123460','Paid'),(137,'2024-01-04 15:00:00.000000','Huế','Lê Văn H','0988890123','Delivered',900000,NULL,1,'Bank Transfer','REF123461','Unpaid'),(138,'2024-01-05 16:00:00.000000','Quảng Ninh','Võ Thị I','0999901234','Pending',1100000,1,1,'Cash on Delivery',NULL,'Paid'),(139,'2024-01-06 17:00:00.000000','Đắk Lắk','Phạm Văn K','0900012345','Processing',1300000,1,3,'Credit Card','REF123462','Paid'),(140,'2024-11-12 08:00:00.000000','Hà Nội','Nguyễn Văn A','0911123456','Processing',1500000,1,1,'Credit Card','REF123456','Unpaid'),(141,'2024-11-13 09:00:00.000000','Hải Phòng','Trần Thị B','0922234567','Pending',2000000,1,3,'Bank Transfer','REF123457','Paid'),(142,'2024-11-14 10:00:00.000000','Đà Nẵng','Lê Thị C','0933345678','Delivered',2500000,NULL,1,'Cash on Delivery',NULL,'Unpaid'),(143,'2024-11-15 11:00:00.000000','Cần Thơ','Võ Văn D','0944456789','Processing',1000000,1,3,'Bank Transfer','REF123458','Paid'),(144,'2024-11-06 12:00:00.000000','Hồ Chí Minh','Phạm Thị E','0955567890','Delivered',1200000,NULL,1,'Credit Card','REF123459','Unpaid'),(145,'2024-11-02 13:00:00.000000','Vũng Tàu','Nguyễn Văn F','0966678901','Pending',800000,1,3,'Cash on Delivery',NULL,'Unpaid'),(146,'2024-11-03 14:00:00.000000','Nha Trang','Trần Thị G','0977789012','Processing',700000,1,1,'Credit Card','REF123460','Paid'),(147,'2024-11-04 15:00:00.000000','Huế','Lê Văn H','0988890123','Delivered',900000,NULL,1,'Bank Transfer','REF123461','Unpaid'),(148,'2024-11-05 16:00:00.000000','Quảng Ninh','Võ Thị I','0999901234','Pending',1100000,1,1,'Cash on Delivery',NULL,'Paid'),(149,'2024-11-06 17:00:00.000000','Đắk Lắk','Phạm Văn K','0900012345','Processing',1300000,1,3,'Credit Card','REF123462','Paid'),(150,'2024-10-12 08:00:00.000000','Hà Nội','Nguyễn Văn A','0911123456','Processing',1500000,1,1,'Credit Card','REF123456','Unpaid'),(151,'2024-10-13 09:00:00.000000','Hải Phòng','Trần Thị B','0922234567','Pending',2000000,1,3,'Bank Transfer','REF123457','Paid'),(152,'2024-10-14 10:00:00.000000','Đà Nẵng','Lê Thị C','0933345678','Delivered',2500000,NULL,1,'Cash on Delivery',NULL,'Unpaid'),(153,'2024-10-15 11:00:00.000000','Cần Thơ','Võ Văn D','0944456789','Processing',1000000,1,3,'Bank Transfer','REF123458','Paid'),(154,'2024-10-06 12:00:00.000000','Hồ Chí Minh','Phạm Thị E','0955567890','Delivered',1200000,NULL,1,'Credit Card','REF123459','Unpaid'),(155,'2024-10-02 13:00:00.000000','Vũng Tàu','Nguyễn Văn F','0966678901','Pending',800000,1,3,'Cash on Delivery',NULL,'Unpaid'),(156,'2024-10-03 14:00:00.000000','Nha Trang','Trần Thị G','0977789012','Processing',700000,1,1,'Credit Card','REF123460','Paid'),(157,'2024-10-04 15:00:00.000000','Huế','Lê Văn H','0988890123','Delivered',900000,NULL,1,'Bank Transfer','REF123461','Unpaid'),(158,'2024-10-05 16:00:00.000000','Quảng Ninh','Võ Thị I','0999901234','Pending',1100000,1,1,'Cash on Delivery',NULL,'Paid'),(159,'2024-10-06 17:00:00.000000','Đắk Lắk','Phạm Văn K','0900012345','Processing',1300000,1,3,'Credit Card','REF123462','Paid'),(160,'2024-12-01 08:00:00.000000','Hà Nội','Nguyễn Văn A','0911123456','Processing',1500000,1,1,'Credit Card','REF123456','Unpaid'),(161,'2024-12-02 09:00:00.000000','Hải Phòng','Trần Thị B','0922234567','Pending',2000000,1,3,'Bank Transfer','REF123457','Paid'),(162,'2024-12-03 10:00:00.000000','Đà Nẵng','Lê Thị C','0933345678','Delivered',2500000,NULL,1,'Cash on Delivery',NULL,'Unpaid'),(163,'2024-12-04 11:00:00.000000','Cần Thơ','Võ Văn D','0944456789','Processing',1000000,1,3,'Bank Transfer','REF123458','Paid'),(164,'2024-12-05 12:00:00.000000','Hồ Chí Minh','Phạm Thị E','0955567890','Delivered',1200000,NULL,1,'Credit Card','REF123459','Unpaid'),(165,'2024-12-06 13:00:00.000000','Vũng Tàu','Nguyễn Văn F','0966678901','Pending',800000,1,3,'Cash on Delivery',NULL,'Unpaid'),(166,'2024-12-07 14:00:00.000000','Nha Trang','Trần Thị G','0977789012','Processing',700000,1,1,'Credit Card','REF123460','Paid'),(167,'2024-12-08 15:00:00.000000','Huế','Lê Văn H','0988890123','Delivered',900000,NULL,1,'Bank Transfer','REF123461','Unpaid'),(168,'2024-12-09 16:00:00.000000','Quảng Ninh','Võ Thị I','0999901234','Pending',1100000,1,1,'Cash on Delivery',NULL,'Paid'),(169,'2024-12-10 17:00:00.000000','Đắk Lắk','Phạm Văn K','0900012345','Processing',1300000,1,3,'Credit Card','REF123462','Paid'),(170,'2024-12-11 10:00:00.000000','Đà Nẵng','Lê Thị C','0933345678','Delivered',2500000,NULL,1,'Cash on Delivery',NULL,'Unpaid'),(171,'2024-12-12 11:00:00.000000','Cần Thơ','Võ Văn D','0944456789','Processing',1000000,1,3,'Bank Transfer','REF123458','Paid'),(172,'2024-12-13 12:00:00.000000','Hồ Chí Minh','Phạm Thị E','0955567890','Delivered',1200000,NULL,1,'Credit Card','REF123459','Unpaid'),(173,'2024-12-14 13:00:00.000000','Vũng Tàu','Nguyễn Văn F','0966678901','Pending',800000,1,3,'Cash on Delivery',NULL,'Unpaid'),(174,'2024-12-15 14:00:00.000000','Nha Trang','Trần Thị G','0977789012','Processing',700000,1,1,'Credit Card','REF123460','Paid'),(175,'2024-12-16 15:00:00.000000','Huế','Lê Văn H','0988890123','Delivered',900000,NULL,1,'Bank Transfer','REF123461','Unpaid'),(176,'2024-12-17 16:00:00.000000','Quảng Ninh','Võ Thị I','0999901234','Pending',1100000,1,1,'Cash on Delivery',NULL,'Paid'),(177,'2024-12-18 17:00:00.000000','Đắk Lắk','Phạm Văn K','0900012345','Processing',1300000,1,3,'Credit Card','REF123462','Paid'),(178,'2024-12-19 10:00:00.000000','Đà Nẵng','Lê Thị C','0933345678','Delivered',2500000,NULL,1,'Cash on Delivery',NULL,'Unpaid'),(179,'2024-12-20 11:00:00.000000','Cần Thơ','Võ Văn D','0944456789','Processing',1000000,1,3,'Bank Transfer','REF123458','Paid'),(180,'2024-12-21 12:00:00.000000','Hồ Chí Minh','Phạm Thị E','0955567890','Delivered',1200000,NULL,1,'Credit Card','REF123459','Unpaid'),(181,'2024-12-22 13:00:00.000000','Vũng Tàu','Nguyễn Văn F','0966678901','Pending',800000,1,3,'Cash on Delivery',NULL,'Unpaid'),(182,'2024-12-23 14:00:00.000000','Nha Trang','Trần Thị G','0977789012','Processing',700000,1,1,'Credit Card','REF123460','Paid');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_detail` varchar(255) DEFAULT NULL,
  `quantity` bigint NOT NULL,
  `color_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `size_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5tcr8s5m0i3prlty9w0crocog` (`color_id`),
  KEY `FKnfvvq3meg4ha3u1bju9k4is3r` (`product_id`),
  KEY `FKccs28awcbxp3s7mjthrwcdwvn` (`size_id`),
  CONSTRAINT `FK5tcr8s5m0i3prlty9w0crocog` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  CONSTRAINT `FKccs28awcbxp3s7mjthrwcdwvn` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  CONSTRAINT `FKnfvvq3meg4ha3u1bju9k4is3r` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_details_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (1,'1734790497048-Quần jeans basic FABJ003.2.jpg',187,2,11,1),(2,'1734768948245-Áo khoác phao 3 lớp lót bông cổ cao FWCF005.2.jpg',100,7,16,1),(3,'1734768981944-Áo khoác phao 3 lớp lót bông cổ cao FWCF005.3.jpg',198,8,16,2),(4,'1734769185468-Áo khoác 3 lớp lót bông mũ liền FWCP002.2.jpg',122,7,17,1),(5,'1734770021416-Áo khoác 3 lớp lót bông mũ liền FWCP002.3.webp',232,7,17,2),(6,'1734770278570-Áo khoác cardigan nỉ basic FWCS006.2.webp',343,7,18,1),(7,'1734770314690-Áo khoác cardigan nỉ basic FWCS006.3.jpg',231,9,18,2),(8,'1734770794760-.3.jpg',322,7,19,1),(9,'1734770813631-Áo khoác Puffer cổ cao FWCF004.2.webp',211,3,19,2),(10,'1734770996142-Áo khoác 2 lớp da lộn chần bông cổ bomber phối vai FWCL001.2.jpg',21,2,20,2),(11,'1734784284758-Áo khoác 2 lớp da lộn chần bông cổ bomber phối vai FWCL001.2.webp',212,3,20,3),(12,'1734784432925-Áo len trơn cổ tròn thêu logo FWTE001.2.jpg',21,9,21,2),(13,'1734784586454-Sơ mi dài tay kẻ Oxford FATB035.2.jpg',211,3,22,2),(14,'1734784626965-Sơ mi dài tay kẻ Oxford FATB035.3.jpg',12,3,22,3),(15,'1734784717539-Sơ mi dài tay kẻ caro FATB045.2.webp',11,8,23,2),(16,'1734784900767-Sơ mi ngắn tay trơn hiệu ứng FSTB023.2.webp',166,2,24,2),(17,'1734785081148-Quần âu side tab FABT008.jpg',11,7,25,1),(18,'1734785166989-Quần âu slim fit cạp lót họa tiết FABT002.2.webp',123,3,26,4),(19,'1734790285043-Quần âu slim fit cạp lót họa tiết FABT002.3.webp',123,3,26,3);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `detail_desc` mediumtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (11,'2024-12-14 19:36:28.285741','?THÔNG TIN SẢN PHẨM:\r\n\r\n?Tên sản phẩm: Quần Jeans nam TORANO dáng basic FABJ003\r\n\r\n? Chất liệu: Jeans dày dặn, siêu bền, không phai màu\r\n\r\n?Màu sắc: Xanh da trời nhạt, Darknavy, Xanh da trời đậm\r\n\r\n?Phom dáng: basic hơi ôm','1734790465104-Quần jeans basic FABJ003.jpg','Quần jeans basic FABJ003',590000,'Mã sản phẩm: FABJ00301CT00RB_DNV-33 ',11),(16,'2024-12-21 15:14:59.429104','Miền Bắc chuyển rét, anh em đã tự tin đón gió Đông với phao béo vừa ấm áp, vừa trẻ trung và nổi bật chưa? Thiết kế phóng khoáng với bề mặt chống nước cải tiến gấp 2 lần và chần bông 3 lớp giữ nhiệt sẽ khiến anh em không thể bỏ lỡ.\r\n\r\n','1734768899427-Áo khoác phao 3 lớp lót bông cổ cao FWCF005.jpg','Áo khoác phao 3 lớp lót bông cổ cao FWCF005',990,'990,000',6),(17,'2024-12-21 15:18:51.924123','Áo khoác 3 lớp lót bông mũ liền FWCP002\r\n▪️ Được thiết kế theo đúng form chuẩn của nam giới Việt Nam\r\n▪️ Sản phẩm thuộc dòng Áo khoác 3 lớp cao cấp sản xuất','1734769131923-Áo khoác 3 lớp lót bông mũ liền FWCP002.webp','Áo khoác 3 lớp lót bông mũ liền FWCP002',890000,'Thiết kế phóng khoáng với bề mặt chống nước cải tiến gấp 2 lần và chần bông 3 lớp giữ nhiệt sẽ khiến anh em không thể bỏ lỡ.',6),(18,'2024-12-21 15:35:38.948732','▪️ Được thiết kế theo đúng form chuẩn của nam giới Việt Nam\r\n▪️ Sản phẩm thuộc dòng Áo cardigan nỉ cao cấp do TORANO sản xuất','1734770138947-Áo khoác cardigan nỉ basic FWCS006.webp','Áo khoác cardigan nỉ basic FWCS006',590,'Áo khoác cardigan nỉ basic FWCS006',6),(19,'2024-12-21 15:43:16.625288','Miền Bắc chuyển rét, anh em đã tự tin đón gió Đông với phao béo vừa ấm áp, vừa trẻ trung và nổi bật từ TORANO chưa? Thiết kế phóng khoáng với bề mặt chống nước cải tiến gấp 2 lần và chần bông 3 lớp giữ nhiệt sẽ khiến anh em không thể bỏ lỡ.','1734770596623-Áo khoác Puffer cổ cao FWCF004.webp','Áo khoác Puffer cổ cao FWCF004',699000,'Áo khoác Puffer cổ cao FWCF004',6),(20,'2024-12-21 15:49:29.585755','Áo khoác 2 lớp da lộn chần bông cổ bomber phối vai FWCL001\r\n▪️ Được thiết kế theo đúng form chuẩn của nam giới Việt Nam\r\n▪️ Sản phẩm thuộc dòng Áo khoác da lộn chần bông cao cấp do group sản xuất','1734770969584-Áo khoác 2 lớp da lộn cổ bomber phối vai FWCL001.webp','Áo khoác 2 lớp da lộn cổ bomber phối vai FWCL001',890000,'Áo khoác 2 lớp da lộn cổ bomber phối vai FWCL001',6),(21,'2024-12-21 19:33:08.894441','?THÔNG TIN SẢN PHẨM:\r\n\r\n?Tên sản phẩm: Áo len trơn cổ tròn thêu logo FWTE001\r\n\r\n?Chất liệu: Len\r\n\r\n?Phom dáng: Regular\r\n\r\n?Size: S, M, L, XL','1734784388892-Áo len trơn cổ tròn thêu logo FWTE001.webp','Áo len trơn cổ tròn thêu logo FWTE001',420000,'Mã sản phẩm: FWTE00111AC00SB_DMS-M',7),(22,'2024-12-21 19:35:36.153882','- Tên sản phẩm: Sơ mi dài tay kẻ Oxford FATB035\r\n\r\n- Phom dáng: Smart-fit suông rộng hơn Slim-fit\r\n\r\n- Size: S-M-L\r\n\r\n- Xuất xứ: Việt Nam','1734784536152-Sơ mi dài tay kẻ Oxford FATB035.webp','Sơ mi dài tay kẻ Oxford FATB035',5000000,'Mã sản phẩm: FATB03571CA09XB_CBB-S ',8),(23,'2024-12-21 19:37:55.539616','THÔNG TIN SẢN PHẨM:\r\n\r\n- Tên sản phẩm: Sơ mi dài tay kẻ caro FATB045\r\n\r\n- Phom dáng: Smart-fit suông rộng hơn Slim-fit','1734784675538-Sơ mi dài tay kẻ caro FATB045.webp','Sơ mi dài tay kẻ caro FATB045',480000,'Mã sản phẩm: FATB04571CA11RB_BL-S ',8),(24,'2024-12-21 19:39:41.414717','Mùa hè chắc chắn không thể thiếu áo sơ mi ngắn tay để luôn đảm bảo mát mẻ mà vẫn lịch sự. Với chất liệu Bamboo mát mịn, thấm hút tốt, áo sơ mi ngắn tay trơn FSTB023 từ TORANO giúp anh em không phải lo lắng về vấn đề nóng bí, khó chịu.','1734784781412-Sơ mi ngắn tay trơn hiệu ứng FSTB023.webp','Sơ mi ngắn tay trơn hiệu ứng FSTB023',380000,'Mã sản phẩm: FSTB02372BA00SB_LMS-38 ',8),(25,'2024-12-21 19:43:53.325015','Quần âu side tab FABT008 là mẫu quần âu nam cao cấp chính hãng Torano. Chất vải dày dặn, mềm mịn và không nhăn nhàu lại cực thì thoáng mát.','1734785033323-Quần âu side tab FABT008.webp','Quần âu side tab FABT008',500000,'Mã sản phẩm: FABT00801PE00SB_BL-29 ',10),(26,'2024-12-21 19:45:41.737053','Quần âu slim fit cạp lót họa tiết FABT002 là mẫu quần âu nam cao cấp chính hãng Torano. Chất vải dày dặn, mềm mịn và không nhăn nhàu lại cực thì thoáng mát.','1734785141735-Quần âu slim fit cạp lót họa tiết FABT002.webp','Quần âu slim fit cạp lót họa tiết FABT002',500000,'Mã sản phẩm: FABT00201PE00SB_NV-29 ',10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'USER'),(2,'ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sizes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizes`
--

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` VALUES (1,'S'),(2,'M'),(3,'L'),(4,'XL'),(5,'XXL');
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('48e00776-bc6c-4bc8-820e-9f9992ed3114','994b8098-712d-45c3-b56f-de6b7f3e7ca7',1734191814764,1734191834181,2592000,1736783834181,'user@gmail.com'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','18b50bdc-5f08-4972-8ce2-30dd9ecec805',1734803447774,1734803563222,2592000,1737395563222,'user@gmail.com'),('52827c3e-6893-4cb7-a95d-da37ebacce62','b3c84b2b-863e-41eb-8b3e-4334a5afab21',1734186593440,1734186631462,2592000,1736778631462,'admin@gmail.com'),('beaed917-e034-4c45-9525-bcb2f6193e56','9a12ba0b-9153-46d3-8672-8284e95f0e49',1734186631989,1734186745572,2592000,1736778745572,'admin@gmail.com'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','57c8c154-24af-489e-bb88-a0c51feddb12',1734184086954,1734185230301,2592000,1736777230301,'admin@gmail.com'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','18f1ff84-edd7-4ce2-ad4d-f5109cdab7a6',1734182835423,1734183024938,2592000,1736775024938,'admin@gmail.com'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','ff0d2ce6-0cb1-4cc3-9084-1e9cac59ffcc',1734803494186,1734803547625,2592000,1737395547625,'admin@gmail.com');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('48e00776-bc6c-4bc8-820e-9f9992ed3114','email',_binary '�\�\0t\0user@gmail.com'),('48e00776-bc6c-4bc8-820e-9f9992ed3114','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('48e00776-bc6c-4bc8-820e-9f9992ed3114','name',_binary '�\�\0t\0Nguyễn Huy Đạt'),('48e00776-bc6c-4bc8-820e-9f9992ed3114','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$cd0e9e7e-1826-4482-9d57-39603ed34146'),('48e00776-bc6c-4bc8-820e-9f9992ed3114','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$8b20413a-bef6-4206-95f4-394039dfc333psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0user@gmail.com'),('48e00776-bc6c-4bc8-820e-9f9992ed3114','sum',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0\0'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','address',_binary '�\�\0t\0	Văn trì'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','avatar',_binary '�\�\0t\0B1734766322419-z3751171339796_dd6f5401160b465e53b00f62e152fc542.jpg'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','email',_binary '�\�\0t\0user@gmail.com'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','name',_binary '�\�\0t\0Nguyễn Huy Đạt'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$728aaa08-1731-4598-ae17-1b710e928bf2'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','phone',_binary '�\�\0t\0\n0394105275'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$170cd3c8-a67e-4a9e-8366-86da54432060psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0user@gmail.com'),('4fb448a7-2ec5-4bad-942f-a3a86291ad27','sum',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0\0'),('52827c3e-6893-4cb7-a95d-da37ebacce62','avatar',_binary '�\�\0t\0P/images/avatar/1734175636206-286333796_397803422291512_8507123014656175516_n.jpg'),('52827c3e-6893-4cb7-a95d-da37ebacce62','email',_binary '�\�\0t\0admin@gmail.com'),('52827c3e-6893-4cb7-a95d-da37ebacce62','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('52827c3e-6893-4cb7-a95d-da37ebacce62','name',_binary '�\�\0t\0Nguyễn Huy Đạt'),('52827c3e-6893-4cb7-a95d-da37ebacce62','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$253e5896-f213-4d83-aa78-72576e2cd343psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('52827c3e-6893-4cb7-a95d-da37ebacce62','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0\0w\0\0\0\0xsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0�text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0en-US,en;q=0.9xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0proxy-connectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0A\"Chromium\";v=\"130\", \"Google Chrome\";v=\"130\", \"Not?A_Brand\";v=\"99\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0documentxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0nonext\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\08����q\0~\0q\0~\0q\0~\0;q\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0/admint\0http://localhost:8080/admint\0httpt\0	localhostt\0/admin'),('52827c3e-6893-4cb7-a95d-da37ebacce62','sum',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0\0'),('beaed917-e034-4c45-9525-bcb2f6193e56','avatar',_binary '�\�\0t\0P/images/avatar/1734175636206-286333796_397803422291512_8507123014656175516_n.jpg'),('beaed917-e034-4c45-9525-bcb2f6193e56','email',_binary '�\�\0t\0admin@gmail.com'),('beaed917-e034-4c45-9525-bcb2f6193e56','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('beaed917-e034-4c45-9525-bcb2f6193e56','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('beaed917-e034-4c45-9525-bcb2f6193e56','name',_binary '�\�\0t\0Nguyễn Huy Đạt'),('beaed917-e034-4c45-9525-bcb2f6193e56','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$48053fe6-f6c2-4bb0-97d6-d911da60b57d'),('beaed917-e034-4c45-9525-bcb2f6193e56','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$2e475391-f447-42b8-be56-c9589d32a3a6psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('beaed917-e034-4c45-9525-bcb2f6193e56','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xp����\0\0\0\0\0ppt\0SESSIONpt\00MmU0NzUzOTEtZjQ0Ny00MmI4LWJlNTYtYzk1ODlkMzJhM2E2xsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0�text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0en-US,en;q=0.9xt\0\rcache-controlsq\0~\0\0\0\0w\0\0\0t\0	max-age=0xt\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=MmU0NzUzOTEtZjQ0Ny00MmI4LWJlNTYtYzk1ODlkMzJhM2E2xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0proxy-connectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0referersq\0~\0\0\0\0w\0\0\0t\0http://localhost:8080/loginxt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0A\"Chromium\";v=\"130\", \"Google Chrome\";v=\"130\", \"Not?A_Brand\";v=\"99\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0documentxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0same-originxt\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0E����q\0~\0q\0~\0q\0~\0Hq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0t\0expiredur\0[Ljava.lang.String;�\�V\�\�{G\0\0xp\0\0\0q\0~\0xpt\0expiredt\0/logoutt\0http://localhost:8080/logoutt\0httpt\0	localhostt\0/logout'),('beaed917-e034-4c45-9525-bcb2f6193e56','sum',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0\0'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','avatar',_binary '�\�\0t\0P/images/avatar/1734175636206-286333796_397803422291512_8507123014656175516_n.jpg'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','email',_binary '�\�\0t\0admin@gmail.com'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','name',_binary '�\�\0t\0Nguyễn Huy Đạt'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$66593506-584c-4d43-93f0-d35a3fafda95'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$5999a3a6-9466-42aa-9b50-130d9c3f54afpsr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0\0w\0\0\0\0xsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0�text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\08vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0A\"Google Chrome\";v=\"131\", \"Chromium\";v=\"131\", \"Not_A Brand\";v=\"24\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0documentxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0nonext\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����t\0VNq\0~\0t\0viq\0~\0q\0~\0xsq\0~\08����q\0~\0q\0~\0q\0~\0;q\0~\0q\0~\0xsq\0~\08����t\0FRq\0~\0t\0frq\0~\0q\0~\0xsq\0~\08����q\0~\0q\0~\0q\0~\0?q\0~\0q\0~\0xsq\0~\08����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\08����q\0~\0q\0~\0q\0~\0Cq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0/admint\0http://localhost:8080/admint\0httpt\0	localhostt\0/admin'),('c0033cb7-05b7-4115-bc06-a1caa56d8f07','sum',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0\0'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','avatar',_binary '�\�\0t\0P/images/avatar/1734175636206-286333796_397803422291512_8507123014656175516_n.jpg'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','email',_binary '�\�\0t\0admin@gmail.com'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','name',_binary '�\�\0t\0Nguyễn Huy Đạt'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$3ab192e2-6db7-4897-9e58-9eb59e3c9e57'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$2e347817-997a-465e-bd86-72dc3c62a509psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','SPRING_SECURITY_SAVED_REQUEST',_binary '�\�\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0�t\0\0sr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0\0w\0\0\0\0xsr\0java.util.TreeMap��>-%j\�\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\�\�\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0�text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0en-US,en;q=0.9xt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0proxy-connectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0A\"Chromium\";v=\"130\", \"Google Chrome\";v=\"130\", \"Not?A_Brand\";v=\"99\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0documentxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0nonext\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~�`�0�\�\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xp����t\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\08����q\0~\0q\0~\0q\0~\0;q\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0\0xppt\0/admint\0http://localhost:8080/admint\0httpt\0	localhostt\0/admin'),('c4d4bd9c-c65a-4eac-bf13-d433f3fc0d4f','sum',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0\0'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','address',_binary '�\�\0t\0	Văn Trì'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','avatar',_binary '�\�\0t\01734790784458-29t82.jpg'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','email',_binary '�\�\0t\0admin@gmail.com'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','name',_binary '�\�\0t\0Nguyễn Huy Đạt'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$d03d00ce-3853-4947-a8de-24c2faad5015'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','phone',_binary '�\�\0t\0\n0988035928'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$4da2aa4a-1618-40cd-8961-ec96bfa6cf56psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('f363d6b4-8dc7-4862-9206-900a4ac6b1f5','sum',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0\0');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `total_products` bigint NOT NULL,
  `total_revenue` double NOT NULL,
  `total_sales` bigint NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Văn trì','1734766322419-z3751171339796_dd6f5401160b465e53b00f62e152fc542.jpg','2024-12-14 18:02:01.344896','user@gmail.com','Nguyễn Huy Đạt','$2a$10$WQVcEGxRfUukAU/329tk0.LmjVttf0EWEZ86rqXe2h3lCHQ2MJChu','0394105275',1),(3,'Văn Trì','1734790784458-29t82.jpg','2024-12-14 18:27:16.304194','admin@gmail.com','Nguyễn Huy Đạt','$2a$10$7U1MCapxavv.rsu3gfY72u34vmDffGYCFSToO0t5CDUkk2AfhHfzW','0988035928',2);
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

-- Dump completed on 2024-12-22 19:29:10
