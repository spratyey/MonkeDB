-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: monkeDB
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.21.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `monkeDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `monkeDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `monkeDB`;

--
-- Table structure for table `ASSIGNED_TO`
--

DROP TABLE IF EXISTS `ASSIGNED_TO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSIGNED_TO` (
  `ZoneName` varchar(100) DEFAULT NULL,
  `Ranger_ID` bigint NOT NULL,
  `Security_ID` bigint NOT NULL,
  PRIMARY KEY (`Ranger_ID`,`Security_ID`),
  KEY `ZoneName` (`ZoneName`),
  KEY `Security_ID` (`Security_ID`),
  CONSTRAINT `ASSIGNED_TO_ibfk_1` FOREIGN KEY (`ZoneName`) REFERENCES `Zone` (`ZoneName`),
  CONSTRAINT `ASSIGNED_TO_ibfk_2` FOREIGN KEY (`Ranger_ID`) REFERENCES `Ranger` (`Employee_ID`),
  CONSTRAINT `ASSIGNED_TO_ibfk_3` FOREIGN KEY (`Security_ID`) REFERENCES `Security` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSIGNED_TO`
--

LOCK TABLES `ASSIGNED_TO` WRITE;
/*!40000 ALTER TABLE `ASSIGNED_TO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSIGNED_TO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAN_TREAT`
--

DROP TABLE IF EXISTS `CAN_TREAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAN_TREAT` (
  `Medic_ID` bigint NOT NULL,
  `Org_SciName` varchar(100) NOT NULL,
  PRIMARY KEY (`Medic_ID`,`Org_SciName`),
  KEY `Org_SciName` (`Org_SciName`),
  CONSTRAINT `CAN_TREAT_ibfk_1` FOREIGN KEY (`Medic_ID`) REFERENCES `Medic` (`Employee_ID`),
  CONSTRAINT `CAN_TREAT_ibfk_2` FOREIGN KEY (`Org_SciName`) REFERENCES `Organism` (`SciName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAN_TREAT`
--

LOCK TABLES `CAN_TREAT` WRITE;
/*!40000 ALTER TABLE `CAN_TREAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAN_TREAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Employee_ID` bigint NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `Job_type` varchar(100) DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `Supervisor_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Supervisor_ID` (`Supervisor_ID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Supervisor_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medic`
--

DROP TABLE IF EXISTS `Medic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medic` (
  `Employee_ID` bigint NOT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `Medic_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medic`
--

LOCK TABLES `Medic` WRITE;
/*!40000 ALTER TABLE `Medic` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Org_CommonNames`
--

DROP TABLE IF EXISTS `Org_CommonNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Org_CommonNames` (
  `Org_SciName` varchar(100) NOT NULL,
  `Common_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Org_SciName`,`Common_Name`),
  CONSTRAINT `Org_CommonNames_ibfk_1` FOREIGN KEY (`Org_SciName`) REFERENCES `Organism` (`SciName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Org_CommonNames`
--

LOCK TABLES `Org_CommonNames` WRITE;
/*!40000 ALTER TABLE `Org_CommonNames` DISABLE KEYS */;
/*!40000 ALTER TABLE `Org_CommonNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organism`
--

DROP TABLE IF EXISTS `Organism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Organism` (
  `SciName` varchar(100) NOT NULL,
  `Class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SciName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organism`
--

LOCK TABLES `Organism` WRITE;
/*!40000 ALTER TABLE `Organism` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organism` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESENT_IN`
--

DROP TABLE IF EXISTS `PRESENT_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRESENT_IN` (
  `Org_SciName` varchar(100) NOT NULL,
  `ZoneName` varchar(100) NOT NULL,
  PRIMARY KEY (`Org_SciName`,`ZoneName`),
  KEY `ZoneName` (`ZoneName`),
  CONSTRAINT `PRESENT_IN_ibfk_1` FOREIGN KEY (`Org_SciName`) REFERENCES `Organism` (`SciName`),
  CONSTRAINT `PRESENT_IN_ibfk_2` FOREIGN KEY (`ZoneName`) REFERENCES `Zone` (`ZoneName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESENT_IN`
--

LOCK TABLES `PRESENT_IN` WRITE;
/*!40000 ALTER TABLE `PRESENT_IN` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRESENT_IN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Population`
--

DROP TABLE IF EXISTS `Population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Population` (
  `Org_SciName` varchar(100) NOT NULL,
  `Year` date NOT NULL,
  `Number` bigint DEFAULT NULL,
  PRIMARY KEY (`Org_SciName`,`Year`),
  CONSTRAINT `Population_ibfk_1` FOREIGN KEY (`Org_SciName`) REFERENCES `Organism` (`SciName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Population`
--

LOCK TABLES `Population` WRITE;
/*!40000 ALTER TABLE `Population` DISABLE KEYS */;
/*!40000 ALTER TABLE `Population` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ranger`
--

DROP TABLE IF EXISTS `Ranger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ranger` (
  `Employee_ID` bigint NOT NULL,
  `Ranger_grade` tinyint DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `Ranger_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ranger`
--

LOCK TABLES `Ranger` WRITE;
/*!40000 ALTER TABLE `Ranger` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ranger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Security`
--

DROP TABLE IF EXISTS `Security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Security` (
  `Employee_ID` bigint NOT NULL,
  `Weapon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `Security_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Security`
--

LOCK TABLES `Security` WRITE;
/*!40000 ALTER TABLE `Security` DISABLE KEYS */;
/*!40000 ALTER TABLE `Security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tour`
--

DROP TABLE IF EXISTS `Tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tour` (
  `Visitor_UID` varchar(100) NOT NULL,
  `ZoneName` varchar(100) NOT NULL,
  `Vehi_Lic_Number` varchar(11) NOT NULL,
  `Ranger_ID` bigint NOT NULL,
  `Start_timestamp` int NOT NULL,
  `End_timestamp` int NOT NULL,
  PRIMARY KEY (`Visitor_UID`,`ZoneName`,`Vehi_Lic_Number`,`Ranger_ID`,`Start_timestamp`,`End_timestamp`),
  KEY `ZoneName` (`ZoneName`),
  KEY `Vehi_Lic_Number` (`Vehi_Lic_Number`),
  KEY `Ranger_ID` (`Ranger_ID`),
  CONSTRAINT `Tour_ibfk_1` FOREIGN KEY (`Visitor_UID`) REFERENCES `Visitor` (`UniqueID`),
  CONSTRAINT `Tour_ibfk_2` FOREIGN KEY (`ZoneName`) REFERENCES `Zone` (`ZoneName`),
  CONSTRAINT `Tour_ibfk_3` FOREIGN KEY (`Vehi_Lic_Number`) REFERENCES `Vehicle` (`Lic_Number`),
  CONSTRAINT `Tour_ibfk_4` FOREIGN KEY (`Ranger_ID`) REFERENCES `Ranger` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tour`
--

LOCK TABLES `Tour` WRITE;
/*!40000 ALTER TABLE `Tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicle` (
  `Lic_Number` varchar(11) NOT NULL,
  `Vehicle_type` varchar(100) DEFAULT NULL,
  `Hourly_Rate` int DEFAULT NULL,
  PRIMARY KEY (`Lic_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visitor`
--

DROP TABLE IF EXISTS `Visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Visitor` (
  `UniqueID` varchar(100) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visitor`
--

LOCK TABLES `Visitor` WRITE;
/*!40000 ALTER TABLE `Visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visitor_PhNos`
--

DROP TABLE IF EXISTS `Visitor_PhNos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Visitor_PhNos` (
  `Visitor_UID` varchar(100) NOT NULL,
  `Phone_Num` bigint NOT NULL,
  PRIMARY KEY (`Visitor_UID`,`Phone_Num`),
  CONSTRAINT `Visitor_PhNos_ibfk_1` FOREIGN KEY (`Visitor_UID`) REFERENCES `Visitor` (`UniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visitor_PhNos`
--

LOCK TABLES `Visitor_PhNos` WRITE;
/*!40000 ALTER TABLE `Visitor_PhNos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visitor_PhNos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zone`
--

DROP TABLE IF EXISTS `Zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zone` (
  `ZoneName` varchar(100) NOT NULL,
  `Longitude` float DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ZoneName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zone`
--

LOCK TABLES `Zone` WRITE;
/*!40000 ALTER TABLE `Zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-26  9:12:40
