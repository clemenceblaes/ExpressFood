CREATE DATABASE  IF NOT EXISTS `expressfood` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `expressfood`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: expressfood
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `adress_client` varchar(45) NOT NULL,
  `cp_client` int(5) NOT NULL,
  `city_client` varchar(45) NOT NULL,
  `phone_client` int(10) NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,1,'8 rue des jardins',62350,'Flowerland',201020112),(2,2,'12 allée des détergents',64158,'Propreville',421523115),(3,3,'39 boulevard des routiers',96124,'Poidstonne',142352418),(4,4,'41 bis rue de la sourdine',57421,'Sourdeville',356212425),(5,5,'3 rue des repas ',12004,'Trois Etoiles',388471524);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery` (
  `id_delivery` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `name_delivery` varchar(45) NOT NULL,
  `firstname_delivery` varchar(45) NOT NULL,
  `positionx_delivery` float NOT NULL,
  `positiony_delivery` float NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `id_status_idx` (`id_status`),
  CONSTRAINT `id_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,0,'Hédubois','Laure',-113.5,255.6),(2,0,'Ochon','Paul',86.1,-13.5),(3,1,'Dicule','Terry',100.9,-45.7),(4,1,'De Savoie','Tom',120.8,15.8),(5,0,'Vapartout','Yves',97.2,60.4),(6,0,'Toketchup','Thomas',105.7,-26.2);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_stock`
--

DROP TABLE IF EXISTS `delivery_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery_stock` (
  `id_delivery_stock` int(11) NOT NULL,
  `id_delivery` int(11) NOT NULL,
  `id_meal` int(11) NOT NULL,
  `qty_meal` int(11) NOT NULL,
  PRIMARY KEY (`id_delivery_stock`),
  KEY `id_delivery_idx` (`id_delivery`),
  KEY `id_meal_idx` (`id_meal`),
  CONSTRAINT `id_delivery` FOREIGN KEY (`id_delivery`) REFERENCES `delivery` (`id_delivery`),
  CONSTRAINT `id_meal` FOREIGN KEY (`id_meal`) REFERENCES `meal` (`id_meal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_stock`
--

LOCK TABLES `delivery_stock` WRITE;
/*!40000 ALTER TABLE `delivery_stock` DISABLE KEYS */;
INSERT INTO `delivery_stock` VALUES (1,1,1,5),(2,1,2,3),(3,1,3,4),(4,1,4,3),(5,1,5,5),(6,1,6,3),(7,2,1,4),(8,2,2,3),(9,2,3,4),(10,2,4,3),(11,2,5,5),(12,2,6,6),(13,3,1,7),(14,3,2,2),(15,3,3,5),(16,3,4,5),(17,3,5,8),(18,3,6,2),(19,4,1,2),(20,4,2,2),(21,4,3,3),(22,4,4,4),(23,4,5,2),(24,4,6,3),(25,5,1,4),(26,5,2,2),(27,5,3,2),(28,5,4,1),(29,5,5,2),(30,5,6,4),(31,6,1,4),(32,6,2,1),(33,6,3,2),(34,6,4,2),(35,6,5,3),(36,6,6,4);
/*!40000 ALTER TABLE `delivery_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `meal` (
  `id_meal` int(11) NOT NULL,
  `name_meal` varchar(45) NOT NULL,
  `id_type_meal` int(11) NOT NULL,
  `price_meal` float NOT NULL,
  `id_stock` int(11) NOT NULL,
  PRIMARY KEY (`id_meal`),
  KEY `id_type_meal_idx` (`id_type_meal`),
  KEY `id_stock_idx` (`id_stock`),
  CONSTRAINT `id_stock` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`),
  CONSTRAINT `id_type_meal` FOREIGN KEY (`id_type_meal`) REFERENCES `type_meal` (`id_typemeal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (1,'Spaghettis Bolognaise',1,6.5,1),(2,'Porc au Caramel et Pâtes',1,8.75,2),(3,'Boeuf Bourguignon et Légumes',1,8.75,3),(4,'Tartelette au Citron',2,3.5,4),(5,'Salade de Fruits Frais',2,3,5),(6,'Mousse au Chocolat ',2,3,6);
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `id_order` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_payment_type` int(11) NOT NULL,
  `id_delivery` int(11) NOT NULL,
  `id_seller` int(11) NOT NULL,
  `price_order` float NOT NULL,
  `time_order` datetime NOT NULL,
  `time_delivery` datetime NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_client_idx` (`id_client`),
  KEY `id_payment_type_idx` (`id_payment_type`),
  KEY `id_delivery_idx` (`id_delivery`),
  KEY `id_seller_idx` (`id_seller`),
  CONSTRAINT `id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `id_deliveryman` FOREIGN KEY (`id_delivery`) REFERENCES `delivery` (`id_delivery`),
  CONSTRAINT `id_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type` (`id_payment_type`),
  CONSTRAINT `id_seller` FOREIGN KEY (`id_seller`) REFERENCES `seller` (`id_seller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,0,1,0,21.75,'2020-04-16 16:10:00','2020-04-16 16:30:00'),(2,3,1,3,0,21.25,'2020-04-16 16:12:00','2020-04-16 16:32:00'),(3,1,1,2,0,24,'2020-04-16 16:15:00','2020-04-16 16:35:00'),(4,4,1,6,1,21.25,'2020-04-17 18:00:00','2020-04-17 18:30:00'),(5,2,2,4,0,11.75,'2020-04-18 19:00:00','2020-04-18 19:30:00'),(6,5,0,5,0,11.75,'2020-04-18 19:30:00','2020-04-18 20:00:00');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_content`
--

DROP TABLE IF EXISTS `order_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_content` (
  `id_order` int(11) NOT NULL,
  `id_meal` int(11) NOT NULL,
  `qty_meal` int(11) NOT NULL,
  `price_meal` float NOT NULL,
  `id_order_content` int(11) NOT NULL,
  PRIMARY KEY (`id_order_content`),
  KEY `id_meal_idx` (`id_meal`),
  KEY `id_ordercontent_idx` (`id_order`),
  CONSTRAINT `id_mealorder` FOREIGN KEY (`id_meal`) REFERENCES `meal` (`id_meal`),
  CONSTRAINT `id_order` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_content`
--

LOCK TABLES `order_content` WRITE;
/*!40000 ALTER TABLE `order_content` DISABLE KEYS */;
INSERT INTO `order_content` VALUES (1,1,2,6.5,0),(1,2,1,8.75,1),(2,1,1,6.5,2),(2,6,2,3,3),(2,3,1,8.75,4),(3,2,2,8.75,5),(3,4,1,3.5,6),(3,5,1,3,7),(4,1,1,6.5,8),(4,3,1,8.75,9),(4,5,2,3,10),(5,2,1,8.75,11),(5,6,1,3,12),(6,3,1,8.75,13),(6,5,1,3,14);
/*!40000 ALTER TABLE `order_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_type` (
  `id_payment_type` int(11) NOT NULL,
  `name_payment_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id_payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (0,'Espèce'),(1,'Carte Bancaire'),(2,'Chèque');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seller` (
  `id_seller` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_seller`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `id_user_seller` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (0,6),(1,7);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `name_status` varchar(45) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (0,'Libre'),(1,'En cours de livraison');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL,
  `qty_meal` int(11) NOT NULL,
  PRIMARY KEY (`id_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,26),(2,13),(3,20),(4,18),(5,25),(6,20);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_meal`
--

DROP TABLE IF EXISTS `type_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type_meal` (
  `id_typemeal` int(11) NOT NULL,
  `type_meal` varchar(45) NOT NULL,
  PRIMARY KEY (`id_typemeal`),
  UNIQUE KEY `id_typemeal_UNIQUE` (`id_typemeal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_meal`
--

LOCK TABLES `type_meal` WRITE;
/*!40000 ALTER TABLE `type_meal` DISABLE KEYS */;
INSERT INTO `type_meal` VALUES (1,'Repas'),(2,'Dessert');
/*!40000 ALTER TABLE `type_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nickname_user` varchar(45) NOT NULL,
  `password_user` varchar(45) NOT NULL,
  `firstname_user` varchar(45) NOT NULL,
  `name_user` varchar(45) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Alexterieur','lesjardinscestbeau','Alex','Terieur'),(2,'Eaudejavel','nettoyercestlasante','Aude ','Javel'),(3,'Camionette','lespoidslourdssontlourds','Camille ','Onette'),(4,'Cestsilencieux','lesilenceestdor','Cécile','Encieux'),(5,'GuideMichelin','classe3etoiles','Guy','De Michelin'),(6,'Seller1','seller1','Automatic','System'),(7,'Seller2','seller2','Sarah','Croche');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-16 17:46:48
