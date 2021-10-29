-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: monkeDBfinal
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
-- Current Database: `monkeDBfinal`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `monkeDBfinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `monkeDBfinal`;

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
INSERT INTO `ASSIGNED_TO` VALUES ('zon2',3190,7206),('zone1',4447,2868),('zone3',3285,3362),('zonelmao',8908,7648);
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
INSERT INTO `CAN_TREAT` VALUES (1229,'aranea idk'),(2029,'aranea idk'),(9066,'homo erectus'),(1250,'homo sapien'),(2029,'homo sapien'),(4731,'homo sapien'),(6919,'lumbricina bruh'),(8093,'lumbricina bruh'),(4731,'panthera tigris');
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
INSERT INTO `Employee` VALUES (1229,'Gannon Pugh',39192,'Medic','P.O. Box 541, 5933 A, Ave','1995-10-17',NULL),(1250,'Jonas Bowman',39308,'Medic','Ap #959-1453 Et Rd.','1985-03-09',NULL),(1597,'Fuller Farmer',36712,'Ranger','6648 Eu Street','1995-04-12',7500),(2029,'Ainsley Cooley',39636,'Medic','911-8456 Nisi Road','1978-05-15',NULL),(2786,'Regina Leonard',36554,'Ranger','P.O. Box 279, 5048 Luctus Av.','1980-07-06',4447),(2868,'Fredericka Goodman',31163,'Security','Ap #435-2310 Quis Avenue','1986-10-15',4447),(2988,'Ian Joyner',32711,'Security','Ap #441-7463 Scelerisque St.','1975-08-14',3285),(3190,'Herrod Velazquez',35813,'Ranger','9195 Litora St.','1975-04-06',NULL),(3285,'Orli Rivers',34112,'Ranger','Ap #483-7442 Nisl. Street','1995-01-16',NULL),(3351,'Gabriel Lyons',30075,'Security','P.O. Box 696, 3490 In Avenue','1985-09-10',3285),(3362,'Carson Romero',33669,'Security','659-6810 Phasellus Road','1981-08-31',8908),(3703,'Tobias Bradshaw',33178,'Security','P.O. Box 253, 9469 Semper Rd.','1980-06-09',NULL),(4447,'Cruz Terrell',33344,'Ranger','6215 Elit. Street','1975-05-31',NULL),(4731,'Luke Stone',39754,'Medic','P.O. Box 915, 3226 Quis St.','1990-06-29',NULL),(4877,'Murphy Clay',35257,'Ranger','3084 Orci, Street','1982-12-24',4447),(6919,'Freya Hendricks',38816,'Medic','P.O. Box 525, 4390 Duis Rd.','1983-04-13',NULL),(7074,'Buckminster Talley',35487,'Ranger','Ap #434-6224 Integer Road','1987-12-05',NULL),(7206,'Caleb Gutierrez',32595,'Security','Ap #910-7800 Arcu. Av.','1981-04-19',8908),(7500,'Keefe Warner',36284,'Ranger','Ap #188-7622 Interdum Avenue','1988-06-01',NULL),(7648,'Ariana Hudson',32078,'Security','P.O. Box 781, 2272 Phasellus Rd.','1982-01-18',4447),(8093,'Anne Herring',38908,'Medic','345-8078 Tristique Street','1989-08-18',NULL),(8908,'Tiger Merrill',35403,'Ranger','1219 Non, Rd.','1982-10-12',4447),(9066,'Grady Leon',34335,'Medic','P.O. Box 761, 696 Donec Rd.','1982-04-25',NULL),(9582,'Clark Kirkland',33870,'Security','3166 In St.','1985-10-27',4447),(9775,'Kaye Harris',34989,'Ranger','P.O. Box 811, 2258 Libero Ave','1989-07-02',NULL);
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
INSERT INTO `Medic` VALUES (1229,'Hematologist'),(1250,'Cardiologist'),(2029,'General Physician'),(4731,'General Physician'),(6919,'Pathologist'),(8093,'Pathologist'),(9066,'Hematologist');
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
INSERT INTO `Org_CommonNames` VALUES ('aranea idk','makdi'),('homo erectus','monke'),('homo sapien','human'),('homo sapien','u me and every1'),('lumbricina bruh','earthworm'),('panthera tigris','bagheera'),('panthera tigris','tiger');
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
INSERT INTO `Organism` VALUES ('aranea idk','arthropda'),('homo erectus','vertebrata'),('homo sapien','vertebrata'),('lumbricina bruh','annelida'),('panthera tigris','vertebrata');
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
INSERT INTO `PRESENT_IN` VALUES ('aranea idk','zon2'),('homo sapien','zon2'),('homo sapien','zone1'),('lumbricina bruh','zone1'),('aranea idk','zone3'),('homo sapien','zone3'),('lumbricina bruh','zone3'),('homo erectus','zonelmao'),('panthera tigris','zonelmao');
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
  `Year` int NOT NULL,
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
INSERT INTO `Population` VALUES ('aranea idk',2020,40000),('aranea idk',2021,45000),('aranea idk',2022,50000),('homo erectus',2020,2300),('homo erectus',2021,2350),('homo erectus',2022,2400),('homo sapien',2020,10000),('homo sapien',2021,20000),('homo sapien',2022,40000),('lumbricina bruh',2020,1000000),('lumbricina bruh',2021,2000000),('lumbricina bruh',2022,4000000),('panthera tigris',2020,1100),('panthera tigris',2021,2100),('panthera tigris',2022,3100);
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
INSERT INTO `Ranger` VALUES (1597,3),(2786,2),(3190,3),(3285,3),(4447,1),(4877,2),(7074,3),(7500,3),(8908,2),(9775,3);
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
INSERT INTO `Security` VALUES (2868,'Staff'),(2988,'Gun'),(3351,'Staff'),(3362,'Gun'),(3703,'Gun'),(7206,'Staff'),(7648,'Gun'),(9582,'Gun');
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
INSERT INTO `Tour` VALUES ('1EEI9H','zone1','UKi8HV5rB02',1597,1445683823,1445730623),('1PROS','zonelmao','CDe8ce0sB02',3190,1572051023,1572058223),('1ABIS','zone1','AB73HV83B02',4447,1603713023,1603673423),('1ABIS','zone3','AB73HV83B02',4447,1508831423,1508874623),('D587G','zonelmao','508383B02UH',4877,1477338623,1477349423),('S84IS','zon2','508383B02UH',4877,1571885423,1571903493);
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
INSERT INTO `Vehicle` VALUES ('123','Sedan',3000),('456','Bus',5000),('508383B02UH','car',420),('789','Bus',4500),('AB73HV83B02','bus',42),('AB73iomaB02','sedan',2000),('CDe8ce0sB02','helicopter',42000),('UKi8HV5rB02','jeep',1000);
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
INSERT INTO `Visitor` VALUES ('1ABIS','pratyay'),('1DG','donald'),('1EEI9H','julius caesar'),('1FEIS','pratham'),('1PROS','trump'),('1SFX','yashaswini'),('2ABIS','pratyaksh'),('83BOV3','gerge'),('CJO3S','hussein'),('D587G','obama'),('E08NG40','washington'),('H08NEJN3','shakespeare'),('S84IS','yashaswi'),('SO004S','barack'),('SO4IS','yash'),('X420420','william');
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
INSERT INTO `Visitor_PhNos` VALUES ('1ABIS',98403),('1DG',139835),('1EEI9H',7330173),('1FEIS',4646924),('1PROS',42037),('1SFX',92341),('2ABIS',94023),('83BOV3',9810389734),('CJO3S',333783),('D587G',98273302),('E08NG40',7369830),('H08NEJN3',93083),('S84IS',100003),('S84IS',92937842),('SO004S',444823),('SO4IS',870234),('X420420',18383);
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
INSERT INTO `Zone` VALUES ('zon2',30.023,74,'many tourists'),('zone1',28.888,72.803,'very good'),('zone3',27.991,74.92,'hungry animals'),('zonelmao',28.888,72.703,'not even a zone lmao');
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

-- Dump completed on 2021-10-26 11:56:19
