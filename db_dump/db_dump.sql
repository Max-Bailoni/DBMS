-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: continents-db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `CityID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `CityName` varchar(100) NOT NULL,
  `FederalStateID` bigint(20) unsigned NOT NULL,
  `StateID` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `fk_city_federalState` (`FederalStateID`) USING BTREE,
  KEY `fk_city_state` (`StateID`),
  CONSTRAINT `fk_city_federalState` FOREIGN KEY (`FederalStateID`) REFERENCES `federalstate` (`federalStateID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_city_state` FOREIGN KEY (`StateID`) REFERENCES `state` (`StateID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Vienna',1,1),(2,'Sobolonye',2,3),(3,'Ouagadougou',3,5),(4,'Springfield',4,7),(5,'Bucaramanga',5,9),(6,'Brisbane',6,11),(7,'McMurdo',7,13),(8,'Krems',8,1),(9,'Hualien City',9,4),(10,'Kigali',10,5),(11,'New York City',11,7),(12,'San Cristóbal de las Casas',12,10),(13,'Victoria',13,11),(14,'Jinnah',14,13);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citycafe`
--

DROP TABLE IF EXISTS `citycafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citycafe` (
  `CityCafeID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `CityID` bigint(20) unsigned NOT NULL,
  `CafeZIP` int(11) NOT NULL,
  `CafeName` varchar(200) NOT NULL,
  PRIMARY KEY (`CityCafeID`),
  KEY `fk_citycafe_city` (`CityID`),
  CONSTRAINT `fk_citycafe_city` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citycafe`
--

LOCK TABLES `citycafe` WRITE;
/*!40000 ALTER TABLE `citycafe` DISABLE KEYS */;
INSERT INTO `citycafe` VALUES (1,1,1150,'Krimhild'),(2,2,690692,'Moloko & Med'),(3,3,37021,'Baloum'),(4,4,45501,'Kerrys'),(5,5,680001,'Cafetopía'),(6,6,4000,'Iconic'),(7,7,9998,'Southern Exposure'),(8,8,3500,'Ulrich'),(9,9,970005,'Kohi'),(10,10,3425,'Fika'),(11,11,7030,'Cafexico'),(12,12,29230,'Cafeología'),(13,13,181516,'Blue Fox'),(14,14,9997,'Ice Coffe');
/*!40000 ALTER TABLE `citycafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continent`
--

DROP TABLE IF EXISTS `continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `continent` (
  `ContinentID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ContinentName` varchar(50) NOT NULL,
  PRIMARY KEY (`ContinentID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continent`
--

LOCK TABLES `continent` WRITE;
/*!40000 ALTER TABLE `continent` DISABLE KEYS */;
INSERT INTO `continent` VALUES (1,'Europe'),(2,'Asia'),(3,'Africa'),(4,'Northamerica'),(5,'Southamerica'),(6,'Australia'),(7,'Antarctic');
/*!40000 ALTER TABLE `continent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federalstate`
--

DROP TABLE IF EXISTS `federalstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `federalstate` (
  `FederalStateID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FederalState` varchar(50) NOT NULL,
  `ContinentID` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`FederalStateID`),
  KEY `fk_federalState_continent` (`ContinentID`) USING BTREE,
  CONSTRAINT `fk_country_continent` FOREIGN KEY (`ContinentID`) REFERENCES `continent` (`ContinentID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federalstate`
--

LOCK TABLES `federalstate` WRITE;
/*!40000 ALTER TABLE `federalstate` DISABLE KEYS */;
INSERT INTO `federalstate` VALUES (1,'Vienna',1),(2,'Primorye',2),(3,'Burkina Faso',3),(4,'Ohio',4),(5,'Santander',5),(6,'Queensland',6),(7,'Station Entity',7),(8,'Lower Austria',1),(9,'Hualien',2),(10,'Rwanda',3),(11,'New York',4),(12,'Chiapas',5),(13,'British Columbia',6),(14,'Station Entity',7);
/*!40000 ALTER TABLE `federalstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `StateID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `StateName` varchar(100) NOT NULL,
  `FederalStateID` bigint(20) unsigned NOT NULL,
  `ContinentID` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`StateID`),
  KEY `fk_state_continent` (`ContinentID`),
  KEY `fk_state_federalState` (`FederalStateID`) USING BTREE,
  CONSTRAINT `fk_state_continent` FOREIGN KEY (`ContinentID`) REFERENCES `continent` (`ContinentID`),
  CONSTRAINT `fk_state_country` FOREIGN KEY (`FederalStateID`) REFERENCES `federalstate` (`federalStateID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Austria',1,1),(3,'Russia',2,2),(4,'Taiwan',9,2),(5,'African Union',3,3),(7,'United States of America',4,4),(9,'Colombia',5,5),(10,'Mexico',12,5),(11,'Australia',6,6),(13,'Antarctica Stations',7,7);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-02 11:36:11
