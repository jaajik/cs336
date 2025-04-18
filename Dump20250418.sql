CREATE DATABASE  IF NOT EXISTS `travelreservation` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `travelreservation`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: travelreservation
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraftID` varchar(10) NOT NULL,
  `numOfSeats` int DEFAULT NULL,
  `operationDay1` varchar(9) DEFAULT NULL,
  `operationDay2` varchar(9) DEFAULT NULL,
  `operationDay3` varchar(9) DEFAULT NULL,
  `operationDay4` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`aircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraftowned`
--

DROP TABLE IF EXISTS `aircraftowned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraftowned` (
  `aircraftID` varchar(10) NOT NULL,
  `airlineID` char(2) NOT NULL,
  PRIMARY KEY (`aircraftID`,`airlineID`),
  KEY `airlineID` (`airlineID`),
  CONSTRAINT `aircraftowned_ibfk_1` FOREIGN KEY (`airlineID`) REFERENCES `airlinecompany` (`airlineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraftowned`
--

LOCK TABLES `aircraftowned` WRITE;
/*!40000 ALTER TABLE `aircraftowned` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraftowned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlinecompany`
--

DROP TABLE IF EXISTS `airlinecompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlinecompany` (
  `airlineID` char(2) NOT NULL,
  PRIMARY KEY (`airlineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlinecompany`
--

LOCK TABLES `airlinecompany` WRITE;
/*!40000 ALTER TABLE `airlinecompany` DISABLE KEYS */;
/*!40000 ALTER TABLE `airlinecompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airportID` char(3) NOT NULL,
  PRIMARY KEY (`airportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` varchar(10) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`customerID`,`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('peterw','Peter','Waltz','passwordPW'),('robin','Richard','Grayson','bluejay'),('traveler1','traveler1FN','traveler1LN','password1');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `airlineID` char(2) NOT NULL,
  `aircraftID` varchar(10) NOT NULL,
  `ticketNum` int NOT NULL,
  `flightNum` int NOT NULL,
  `depTime` datetime DEFAULT NULL,
  `arrivalTime` datetime DEFAULT NULL,
  `depAirport` char(3) DEFAULT NULL,
  `arrivalAirport` char(3) DEFAULT NULL,
  `typeDomInternational` varchar(13) DEFAULT NULL,
  `typeTrip` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`airlineID`,`aircraftID`,`ticketNum`,`flightNum`),
  KEY `aircraftID` (`aircraftID`),
  KEY `ticketNum` (`ticketNum`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airlineID`) REFERENCES `airlinecompany` (`airlineID`),
  CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`),
  CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`ticketNum`) REFERENCES `tickets` (`ticketNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatesin`
--

DROP TABLE IF EXISTS `operatesin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operatesin` (
  `airlineID` char(2) NOT NULL,
  `airportID` char(2) NOT NULL,
  PRIMARY KEY (`airlineID`,`airportID`),
  KEY `airportID` (`airportID`),
  CONSTRAINT `operatesin_ibfk_1` FOREIGN KEY (`airportID`) REFERENCES `airport` (`airportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatesin`
--

LOCK TABLES `operatesin` WRITE;
/*!40000 ALTER TABLE `operatesin` DISABLE KEYS */;
/*!40000 ALTER TABLE `operatesin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationaccount`
--

DROP TABLE IF EXISTS `reservationaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservationaccount` (
  `customerID` varchar(10) NOT NULL,
  `accountNum` int NOT NULL,
  `flightHistoryPast1-4` varchar(20) DEFAULT NULL,
  `flightHistoryUpcoming1-4` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customerID`,`accountNum`),
  CONSTRAINT `reservationaccount_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationaccount`
--

LOCK TABLES `reservationaccount` WRITE;
/*!40000 ALTER TABLE `reservationaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservationaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticketNum` int NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `customerID` varchar(10) DEFAULT NULL,
  `seatNum` varchar(3) DEFAULT NULL,
  `class` varchar(8) DEFAULT NULL,
  `totalFare` float DEFAULT NULL,
  `bookingfee` float DEFAULT NULL,
  `purchaseDate` datetime DEFAULT NULL,
  `numOfStops` int DEFAULT NULL,
  `flightNum1-5` int DEFAULT NULL,
  PRIMARY KEY (`ticketNum`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitinglist`
--

DROP TABLE IF EXISTS `waitinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitinglist` (
  `airlineID` char(2) NOT NULL,
  `aircraftID` varchar(10) NOT NULL,
  `ticketNum` int NOT NULL,
  `flightNum` int NOT NULL,
  `customerID` varchar(10) NOT NULL,
  PRIMARY KEY (`ticketNum`,`flightNum`,`airlineID`,`aircraftID`,`customerID`),
  KEY `airlineID` (`airlineID`,`aircraftID`,`ticketNum`,`flightNum`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `waitinglist_ibfk_1` FOREIGN KEY (`airlineID`, `aircraftID`, `ticketNum`, `flightNum`) REFERENCES `flights` (`airlineID`, `aircraftID`, `ticketNum`, `flightNum`),
  CONSTRAINT `waitinglist_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitinglist`
--

LOCK TABLES `waitinglist` WRITE;
/*!40000 ALTER TABLE `waitinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `waitinglist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-18 19:11:34
