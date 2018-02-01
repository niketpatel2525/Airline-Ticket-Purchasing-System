CREATE DATABASE  IF NOT EXISTS `flyers` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `flyers`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: flyers
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `aircraftid` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`aircraftid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Boing 777',100),(4,NULL,350),(5,'Boing 761',350),(6,'Boing 761',350);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airline` (
  `username` varchar(100) NOT NULL,
  `airlinename` varchar(100) DEFAULT NULL,
  `image` varchar(45) DEFAULT 'images/airline.png',
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES ('airindia@gmail.com','Air India','images/airindia.jpg','Air India is the flag carrier airline of India.[8] It is owned by Air India Limited, a government-owned enterprise, and operates a fleet of Airbus and Boeing aircraft serving 90 domestic and international destinations. The airline has its hub at Indira Gandhi International Airport, New Delhi, alongside several focus cities across India. Air India is the largest international carrier out of India with an 18.6% market share.[9] Over 60 international destinations are served by Air India across four continents. Additionally, the carrier is the third largest domestic airline in India in terms of passengers carried (after IndiGo and Jet Airways) with a market share of 13.5% as of July 2017.[10] The airline became the 27th member of Star Alliance on 11 July 2014.');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autocomplete`
--

DROP TABLE IF EXISTS `autocomplete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autocomplete` (
  `name` varchar(200) NOT NULL,
  `link` varchar(1000) DEFAULT '#',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autocomplete`
--

LOCK TABLES `autocomplete` WRITE;
/*!40000 ALTER TABLE `autocomplete` DISABLE KEYS */;
INSERT INTO `autocomplete` VALUES ('Air India','/Flyers/FlightServlet?code=airlinedetail&amp;airline=Air+India'),('Airlines','/Flyers/FlightServlet?code=searchforairline'),('Flight Status','/Flyers/flightstatus.jsp'),('Help','/Flyers/help.jsp'),('My Tickets','/Flyers/findMyTicket.jsp'),('Offers','/Flyers/offers.jsp');
/*!40000 ALTER TABLE `autocomplete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightschedule`
--

DROP TABLE IF EXISTS `flightschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightschedule` (
  `fsid` int(11) NOT NULL AUTO_INCREMENT,
  `flightdate` datetime NOT NULL,
  `arrivaldate` datetime NOT NULL,
  `fareeconomy` double DEFAULT NULL,
  `farebusiness` double DEFAULT NULL,
  `farefirst` double DEFAULT NULL,
  `aircraftid` int(11) DEFAULT NULL,
  `routeid` int(11) DEFAULT NULL,
  `bagallow` int(11) DEFAULT '2',
  `extrabagfare` double DEFAULT NULL,
  `timeoffset` int(11) DEFAULT '0',
  `username` varchar(100) DEFAULT NULL,
  `wifi` tinyint(4) DEFAULT '0',
  `cancellationcharge` double DEFAULT '300',
  PRIMARY KEY (`fsid`),
  KEY `aircraftid_idx` (`aircraftid`),
  KEY `routeid_idx` (`routeid`),
  KEY `fsusername_idx` (`username`),
  CONSTRAINT `aircraftid` FOREIGN KEY (`aircraftid`) REFERENCES `aircraft` (`aircraftid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fsusername` FOREIGN KEY (`username`) REFERENCES `airline` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `routeid` FOREIGN KEY (`routeid`) REFERENCES `route` (`routeid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightschedule`
--

LOCK TABLES `flightschedule` WRITE;
/*!40000 ALTER TABLE `flightschedule` DISABLE KEYS */;
INSERT INTO `flightschedule` VALUES (1,'2017-10-30 08:31:25','2017-10-31 15:16:18',1000,3600,2400,1,1,3,400,60,'airindia@gmail.com',0,300),(2,'2017-10-30 08:31:25','2017-10-31 23:16:18',700,1399,2400,1,10,2,100,0,'airindia@gmail.com',0,300),(3,'2017-10-30 08:31:25','2017-10-31 15:16:18',210,3600,2400,1,3,2,100,0,'airindia@gmail.com',0,300),(4,'2017-10-31 08:31:25','2017-11-01 15:16:18',120,1200,1200,1,4,2,150,0,'airindia@gmail.com',0,300),(5,'2017-11-01 19:00:00','2017-11-01 22:00:00',320,1200,1200,1,5,2,100,0,'airindia@gmail.com',0,300),(6,'2017-11-01 03:12:00','2017-11-01 18:00:00',140,2000,200,1,3,2,100,0,'airindia@gmail.com',0,300),(7,'2017-10-31 23:00:18','2017-11-01 18:00:00',1230,200,2000,1,3,2,100,0,'airindia@gmail.com',0,200),(8,'2017-11-04 12:00:00','2017-11-04 14:00:00',200,200,1000,1,8,2,100,0,'airindia@gmail.com',0,200),(9,'2017-11-04 19:00:00','2017-11-05 07:00:00',100,200,1000,1,9,2,100,0,'airindia@gmail.com',0,200),(10,'2017-11-04 19:00:00','2017-11-05 19:00:00',700,1398,2400,1,10,4,100,0,'airindia@gmail.com',0,200),(15,'2017-11-06 01:00:00','2017-11-07 18:30:00',100,2000,3000,1,1,2,100,0,'airindia@gmail.com',1,300),(16,'2017-11-06 10:30:00','2017-11-07 18:30:00',90,2000,3000,1,1,2,100,0,'airindia@gmail.com',1,300),(17,'2017-11-30 01:00:00','2017-12-01 13:59:00',680,2000,4000,1,1,2,100,0,'airindia@gmail.com',1,300),(18,'2017-12-11 00:00:00','2017-12-12 13:59:00',1000,2000,3000,1,1,2,100,0,'airindia@gmail.com',1,300),(19,'2017-12-05 01:00:00','2017-12-06 01:00:00',1100,2200,3000,1,1,2,100,0,'airindia@gmail.com',1,300),(20,'2017-12-07 00:59:00','2017-12-08 00:59:00',1000,2000,3000,1,1,2,100,0,'airindia@gmail.com',1,300),(21,'2017-12-09 13:59:00','2017-12-10 00:59:00',1400,2300,4000,1,1,2,100,0,'airindia@gmail.com',0,300),(22,'2017-12-06 00:59:00','2017-12-07 00:01:00',1000,2000,3000,1,2,2,100,0,'airindia@gmail.com',0,300),(23,'2017-12-08 00:59:00','2017-12-09 00:59:00',1000,2000,3000,1,2,2,100,0,'airindia@gmail.com',1,300),(24,'2017-12-07 00:00:00','2017-12-08 01:00:00',600,1200,3000,1,3,2,100,0,'airindia@gmail.com',1,300),(25,'2017-12-11 22:01:00','2017-12-12 00:59:00',1000,2000,3000,1,4,2,100,0,'airindia@gmail.com',1,300),(26,'2017-12-13 15:31:00','2017-11-14 03:59:00',900,1990,3000,1,4,2,100,0,'airindia@gmail.com',1,300),(27,'2017-12-15 04:10:00','2017-12-16 16:10:00',870,3100,4200,1,4,2,100,0,'airindia@gmail.com',1,300),(28,'2017-12-14 04:00:00','2017-12-14 06:00:00',100,300,400,1,5,2,100,0,'airindia@gmail.com',0,300),(29,'2017-12-14 07:00:00','2017-12-14 00:59:00',130,500,1000,1,5,2,100,0,'airindia@gmail.com',1,300),(30,'2017-12-18 15:00:00','2017-12-19 16:59:00',1300,3000,4000,1,6,2,344,0,'airindia@gmail.com',1,134),(31,'2017-12-20 00:22:00','2017-12-21 16:00:00',4200,6600,12300,1,6,2,400,0,'airindia@gmail.com',1,300),(32,'2017-12-19 22:00:00','2017-12-20 23:59:00',30,40,50,1,7,2,100,0,'airindia@gmail.com',1,24),(33,'2017-12-21 22:00:00','2017-12-21 23:05:00',24,90,190,1,7,2,100,0,'airindia@gmail.com',1,24),(34,'2017-12-07 14:59:00','2017-12-08 00:00:00',400,2230,1300,1,13,2,150,0,'airindia@gmail.com',1,200),(35,'2017-12-08 22:59:00','2017-12-09 00:59:00',200,400,500,1,14,2,100,0,'airindia@gmail.com',1,140),(36,'2017-12-09 00:58:00','2017-12-11 23:59:00',1000,2000,3000,1,15,2,100,0,'airindia@gmail.com',0,134),(37,'2017-12-20 00:59:00','2017-12-21 00:59:00',1000,2000,3000,1,10,2,100,0,'airindia@gmail.com',1,300),(38,'2017-12-22 00:59:00','2017-12-22 14:59:00',90,300,600,1,8,2,100,0,'airindia@gmail.com',1,300),(39,'2017-12-22 23:59:00','2017-12-23 23:59:00',1200,2000,4000,1,9,2,100,0,'airindia@gmail.com',1,300),(40,'2017-12-22 00:59:00','2017-12-23 00:59:00',2000,4000,5000,1,10,2,100,0,'airindia@gmail.com',1,300),(41,'2017-12-05 00:59:00','2017-12-06 01:00:00',800,2000,1000,1,6,1,100,0,'airindia@gmail.com',1,300),(42,'2017-12-06 04:00:00','2017-12-06 06:00:00',40,120,500,1,7,2,120,0,'airindia@gmail.com',1,40),(43,'2017-12-13 00:59:00','2017-12-14 23:59:00',1000,2000,3000,1,12,2,100,0,'airindia@gmail.com',0,300),(44,'2017-12-12 00:59:00','2017-12-13 23:59:00',2221,232,2121,1,12,2,100,0,'airindia@gmail.com',1,24),(45,'2017-12-14 14:01:00','2017-12-15 01:59:00',1000,1000,3000,1,8,2,100,0,'airindia@gmail.com',1,200);
/*!40000 ALTER TABLE `flightschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `datecreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `usertype` tinyint(4) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `streetaddress` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `lastlogin` datetime DEFAULT CURRENT_TIMESTAMP,
  `balance` double DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('airindia@gmail.com','airindia','2017-11-05 10:43:24',2,'AirIndia','AirIndia','1098','Elgin','Illinois','2017-12-02 22:59:57',0),('niketpate2525@gmail.com','Niks@123','2017-12-02 22:52:30',0,'Niket','Patel','1098 Clover Hill LN','Elgin ','Illinois ',NULL,0),('niketpate252@gmail.com','Niks@123','2017-12-02 22:55:02',0,'Niket','Patel','1098 Clover Hill LN','Elgin ','Illinois ',NULL,0),('niketpatel2525@gmail.com','Niks@123','2017-12-02 20:36:33',0,'Niket','Patel','1098','Elgin','Illinois','2017-12-02 23:18:52',0),('parth@gmail.com','parth','2017-11-03 14:06:58',1,'Parth','Hindia','1098 Clover Hill LN','Elgin ','Illinois ','2017-12-02 23:07:31',0),('parthhindia@gmail.com','Parth@123','2017-12-02 20:36:33',0,'Parth','Hindia','1098 Clover Hill LN','Elgin ','Illinois ','2017-12-02 20:36:50',0),('united@gmail.com','Niks@123','2017-12-02 23:08:11',2,'United','Airline','1098 Clover Hill LN','Elgin ','Illinois ',NULL,0);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `offersid` int(11) NOT NULL AUTO_INCREMENT,
  `offername` varchar(100) NOT NULL,
  `discount` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `promocode` varchar(45) NOT NULL,
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`offersid`,`promocode`),
  KEY `offusername_idx` (`username`),
  CONSTRAINT `offusername` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,'New User',10,0,'Get 10% off on your first trip with us','airindia@gmail.com','NEWUSER',1),(2,'20% off',20,0,'Get 20% off on your next ticket purchase with us.','airindia@gmail.com','20OFF',1),(3,'10% off each ticket',10,0,'Get 10% off on your ticket','airindia@gmail.com','GROUPOFF',1),(4,'20% off AirIndia',20,0,'Travel with AirIndia and Get 20% off on your ticket','airindia@gmail.com','AIRINDIA20',1),(6,'Bingo',20,0,'Apply to new customer','airindia@gmail.com','20OFF',1),(7,'BingoSummer',20,0,'Get 20% off on Flight','airindia@gmail.com','20OFF',1),(8,'WinterSale',20,0,'Buy one ticket and get 20% off','parth@gmail.com','20OFF',1);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passanger`
--

DROP TABLE IF EXISTS `passanger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passanger` (
  `psid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `passportno` varchar(45) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `freqflyerno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`psid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passanger`
--

LOCK TABLES `passanger` WRITE;
/*!40000 ALTER TABLE `passanger` DISABLE KEYS */;
INSERT INTO `passanger` VALUES (1,'Niket','1098 Cloverr Hill Ln','Male',24,'J9895099','Indian','2247047566',NULL),(2,'Niket','1098 Clover Hill Ln. Elgin','Male',24,'J989250','Indian','2247047566','FF098'),(3,'Niket','1098 Clover Hill Ln. Elgin','Male',24,'J989250','Indian','2247047566','FF098'),(4,'Niket','1098 Clover Hill Ln. Elgin','Male',24,'J989250','Indian','2247047566','FF098'),(5,'Niket','1098 Clover Hill Ln. Elgin','Male',24,'J989250','Indian','2247047566','FF098'),(6,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(7,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(8,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(9,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(10,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(11,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(12,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(13,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(14,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(15,'Patel','Elgin','Male',24,'J9898251','Indian','2247047566','FF099'),(16,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(17,'Patel','Elgin','Male',24,'J9898251','Indian','2247047566','FF099'),(18,'Niket','Elgin ','Male',25,'J989250','United States','2247047566','FF098'),(19,'Niket','Elgin ','Male',25,'J989250','United States','2247047566','FF098'),(20,'Niket','Elgin ','Male',25,'J989250','United States','2247047566','FF098'),(21,'Patel','Elgin ','Male',25,'J9898251','United States','2247047566','FF099'),(22,'Niket','Elgin ','Male',25,'J989250','United States','2247047566','FF098'),(23,'Patel','Elgin ','Male',25,'J9898251','United States','2247047566','FF099'),(24,'Niket','Elgin ','Male',25,'J989250','United States','2247047566','FF098'),(25,'Niket Patel','Elgin','Male',24,'J989250','Indian','2247047566','J213123443'),(26,'Niket','Elgin ','Male',23,'J989250','Indian','2247047566','FF098'),(27,'Niket','Elgin ','Male',23,'J989250','Indian','2247047566','FF098'),(28,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098'),(29,'Niket','Elgin ','Male',24,'J989250','Indian','2247047566','FF098');
/*!40000 ALTER TABLE `passanger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `routeid` int(11) NOT NULL AUTO_INCREMENT,
  `airport` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`airport`,`destination`),
  UNIQUE KEY `routeid_UNIQUE` (`routeid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'ORD','AMD'),(2,'ORD','AMS'),(3,'AMS','AMD'),(4,'ORD','DEL'),(5,'DEL','AMD'),(6,'ORD','MUM'),(7,'MUM','AMD'),(8,'AMD','DEL'),(9,'DEL','ORD'),(10,'AMD','ORD'),(12,'ORD','HYD'),(13,'BOSTON','MONTREAL'),(14,'CHICAGO','PRAGUE'),(15,'CHICAGO','BANGKOK'),(17,'ORD','KOL'),(18,'CHICAGO ','CALIFORNIA'),(19,'CHICAGO','KANSAS');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `tsid` int(11) NOT NULL,
  `bookingdate` datetime NOT NULL,
  `seatno` int(11) DEFAULT NULL,
  `psid` int(11) NOT NULL,
  `fsid` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `offerid` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `creditcard` varchar(45) DEFAULT NULL,
  `wheelchair` tinyint(4) DEFAULT '0',
  `food` varchar(45) DEFAULT NULL,
  `cabinclass` tinyint(4) DEFAULT '0',
  `promo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tsid`,`bookingdate`,`psid`,`fsid`),
  KEY `transpassanger_idx` (`psid`),
  KEY `transflightschedule_idx` (`fsid`),
  KEY `transusername_idx` (`username`),
  KEY `transoffers_idx` (`offerid`),
  CONSTRAINT `transflightschedule` FOREIGN KEY (`fsid`) REFERENCES `flightschedule` (`fsid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `transoffers` FOREIGN KEY (`offerid`) REFERENCES `offers` (`offersid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `transpassanger` FOREIGN KEY (`psid`) REFERENCES `passanger` (`psid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `transusername` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'2017-11-11 12:57:35',1,14,1,0,'niketpatel2525@gmail.com',NULL,680,'123123123123',1,'Jain Meal',0,NULL),(1,'2017-11-11 12:57:35',2,15,1,0,'niketpatel2525@gmail.com',NULL,680,'123123123123',1,'Asian Veg Meal',0,NULL),(1,'2017-11-11 12:57:35',98,16,10,0,'niketpatel2525@gmail.com',NULL,680,'123123123123',1,'Jain Meal',0,NULL),(1,'2017-11-11 12:57:35',99,17,10,0,'niketpatel2525@gmail.com',NULL,680,'123123123123',0,'Kosher Meal',0,NULL),(2,'2017-11-12 17:18:43',5,18,1,0,'niketpatel2525@gmail.com',NULL,680,'1231231231223123123',0,NULL,0,NULL),(2,'2017-11-12 17:18:43',8,19,10,0,'niketpatel2525@gmail.com',NULL,680,'1231231231223123123',0,NULL,0,NULL),(3,'2017-11-12 18:15:04',NULL,20,1,1,'niketpatel2525@gmail.com',NULL,680,'2123123123123121',0,NULL,0,NULL),(3,'2017-11-12 18:15:04',NULL,21,1,1,'niketpatel2525@gmail.com',NULL,680,'2123123123123121',0,NULL,0,NULL),(3,'2017-11-12 18:15:04',NULL,22,10,1,'niketpatel2525@gmail.com',NULL,680,'2123123123123121',0,NULL,0,NULL),(3,'2017-11-12 18:15:04',NULL,23,10,1,'niketpatel2525@gmail.com',NULL,680,'2123123123123121',0,NULL,0,NULL),(4,'2017-11-12 18:16:28',NULL,24,1,1,'niketpatel2525@gmail.com',NULL,1000,'12312324334231231231',0,NULL,0,NULL),(5,'2017-11-14 17:53:36',NULL,25,17,1,'niketpatel2525@gmail.com',NULL,680,'1231231231231231',0,NULL,0,NULL),(6,'2017-12-02 21:43:38',1,26,26,1,'niketpatel2525@gmail.com',NULL,360,'1231231231231',0,'Vegetarian Meal',0,NULL),(6,'2017-12-02 21:43:38',2,27,28,1,'niketpatel2525@gmail.com',NULL,360,'1231231231231',0,NULL,0,NULL),(7,'2017-12-02 22:57:40',6,28,26,1,'niketpatel2525@gmail.com',NULL,360,'12332131231',1,'Asian Veg Meal',0,NULL),(7,'2017-12-02 22:57:40',NULL,29,28,1,'niketpatel2525@gmail.com',NULL,360,'12332131231',0,NULL,0,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'flyers'
--

--
-- Dumping routines for database 'flyers'
--
/*!50003 DROP PROCEDURE IF EXISTS `bookTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookTicket`(tsid int, bookingdate datetime, pname varchar(200), paddr varchar(100), pgender varchar(45),age int, passno  varchar(45), nationality varchar(100), contact varchar(100), ffn varchar(100),fsid int,ttype tinyint, username varchar(100), fare double, ccnum varchar(45), cabin tinyint , promo varchar(45))
BEGIN
Declare lastentry Int;

INSERT INTO passanger
(
`name`,
`address`,
`gender`,
`age`,
`passportno`,
`nationality`,
`contact`,
`freqflyerno`)
VALUES
(pname,paddr,pgender,age,passno,nationality,contact,ffn);

Set lastentry = (select max(psid) from passanger);
INSERT INTO `flyers`.`transaction`
(`tsid`,
`bookingdate`,
`psid`,
`fsid`,
`type`,
`username`,
`total`,
`creditcard`,
`cabinclass`,
`promo`)
VALUES
(tsid,
bookingdate,
lastentry,
fsid,
ttype,
username,
fare,
ccnum,
cabin,
promo);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fetchAllRoute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetchAllRoute`()
BEGIN
select routeid, concat(airport,'-',destinantion) from flyers.route;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findConnectedOneWayFlights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findConnectedOneWayFlights`(src varchar(100), dst varchar(100), fromdate varchar(100))
BEGIN
select a.fsid , r.routeid, r.airport, a.flightdate , r.destination, a.arrivaldate, 
a.timeoffset, a.wifi,
(a.fareeconomy+b.fareeconomy) *0.80, (a.farefirst+b.farefirst) *0.8, (a.farebusiness+b.farebusiness)*0.8, 
case when (a.cancellationcharge > b.cancellationcharge) then a.cancellationcharge else b.cancellationcharge end,
case when (a.bagallow>b.bagallow) then b.bagallow else a.bagallow end,
case when (a.extrabagfare >b.extrabagfare) then a.extrabagfare else b.extrabagfare end,
oa.aircraftid, 
oai.username, oai.airlinename, 
b.fsid, t.routeid,t.airport,b.flightdate,t.destination,b.arrivaldate,b.timeoffset,b.wifi
 from 
(flightschedule a inner join route r on a.routeid=r.routeid 
inner join aircraft oa on oa.aircraftid =a.aircraftid
inner join airline oai on oai.username =a.username) 
inner join 
(flightschedule b inner join route t on b.routeid=t.routeid
inner join aircraft ra on ra.aircraftid =b.aircraftid
inner join airline rai on rai.username =b.username)   
on 
r.airport =src and r.destination= t.airport and t.destination =dst and
(DATE(a.flightdate) = date(fromdate)) and
b.flightdate >  date_add(a.arrivaldate, interval 3 HOUR)

;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findConnectedReturnFlights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findConnectedReturnFlights`(src varchar(100), dst varchar(100), fromdate varchar(100), todate varchar(100))
BEGIN
select 
f1fsid, f1routeid, f1airport,f1flightdate,f1destination,f1arrivaldate,f1timeoffset,
f1wifi,
(f1fareeconomy + f3fareeconomy) * 0.90 , (f1farefirst+f3farefirst) * 0.90,
(f1farebusiness+f3farebusiness) * 0.90,
case when (f1cancellationcharge > f1cancellationcharge) then f1cancellationcharge else f3cancellationcharge end,
case when (f1bagallow > f3bagallow) then f3bagallow else f1bagallow end,
case when (f1extrabagfare > f3extrabagfare) then f1extrabagfare else f3extrabagfare end,
f1aircraftid,f1username,f1airlinename,
f2fsid, f2routeid, f2airport,f2flightdate,f2destination,f2arrivaldate,f2timeoffset,
f2wifi,
f3fsid, f3routeid, f3airport,f3flightdate,f3destination,f3arrivaldate,f3timeoffset,
f3wifi,
f4fsid, f4routeid, f4airport,f4flightdate,f4destination,f4arrivaldate,f4timeoffset,
f4wifi

from(

select
a.fsid as f1fsid , r.routeid as f1routeid, r.airport as f1airport, a.flightdate as f1flightdate , r.destination as f1destination, a.arrivaldate as f1arrivaldate, 
a.timeoffset as f1timeoffset, a.wifi as f1wifi, 
(a.fareeconomy + b.fareeconomy) *0.80 as f1fareeconomy, 
(a.farefirst +b.farefirst) *0.80 as f1farefirst,
(a.farebusiness + b.farebusiness) *0.80 as f1farebusiness, 
case when (a.cancellationcharge > b.cancellationcharge) then a.cancellationcharge else b.cancellationcharge end   as f1cancellationcharge,
case when (a.bagallow > b.bagallow) then b.bagallow else a.bagallow end as f1bagallow,
case when (a.extrabagfare >b.extrabagfare) then a.extrabagfare else b.extrabagfare end as f1extrabagfare,
oa.aircraftid as f1aircraftid, 
oai.username as f1username,
oai.airlinename as f1airlinename, 
b.fsid as f2fsid, t.routeid as f2routeid, 
t.airport as f2airport ,b.flightdate as f2flightdate,
t.destination as f2destination, b.arrivaldate as f2arrivaldate, 
b.timeoffset as f2timeoffset, b.wifi as f2wifi

from 
(flightschedule a inner join route r on a.routeid=r.routeid
inner join aircraft oa on oa.aircraftid =a.aircraftid
inner join airline oai on oai.username =a.username
) 
inner join 
(flightschedule b inner join route t on b.routeid=t.routeid
inner join aircraft ra on ra.aircraftid =b.aircraftid
inner join airline rai on rai.username =b.username
)   
on 
a.username = b.username and 
r.airport =src and r.destination= t.airport and t.destination =dst 
and
(DATE(a.flightdate) = date(fromdate)) and
b.flightdate >  date_add(a.arrivaldate, interval 3 HOUR)
) m





inner join
(
select 
c.fsid as f3fsid , p.routeid as f3routeid, p.airport as f3airport, c.flightdate as f3flightdate , p.destination as f3destination, c.arrivaldate as f3arrivaldate, 
c.timeoffset as f3timeoffset, c.wifi as f3wifi, 
(c.fareeconomy + d.fareeconomy) *0.80 as f3fareeconomy, 
(c.farefirst +d.farefirst) *0.80 as f3farefirst,
(c.farebusiness + d.farebusiness) *0.80 as f3farebusiness, 
case when (c.cancellationcharge > d.cancellationcharge) then c.cancellationcharge else d.cancellationcharge end as f3cancellationcharge,
case when (c.bagallow > d.bagallow) then d.bagallow else c.bagallow end  as f3bagallow,
case when (c.extrabagfare >d.extrabagfare) then c.extrabagfare else d.extrabagfare end  as f3extrabagfare,
o1a.aircraftid as f3aircraftid, 
o1ai.username as f3username,
o1ai.airlinename as f3airlinename, 
d.fsid as f4fsid, s.routeid as f4routeid, 
s.airport as f4airport ,d.flightdate as f4flightdate,
s.destination as f4destination, d.arrivaldate as f4arrivaldate, 
d.timeoffset as f4timeoffset, d.wifi as f4wifi

from 
(flightschedule c inner join route p on c.routeid=p.routeid
inner join aircraft o1a on o1a.aircraftid =c.aircraftid
inner join airline o1ai on o1ai.username =c.username) 
inner join 
(flightschedule d inner join route s on d.routeid=s.routeid
inner join aircraft o2a on o2a.aircraftid =d.aircraftid
inner join airline o2ai on o2ai.username =d.username)   
on 
c.username = d.username and
p.airport =dst and p.destination= s.airport and s.destination =src
and
(DATE(c.flightdate) = date(todate)) and
d.flightdate >  date_add(c.arrivaldate, interval 3 HOUR)

) n

on m.f2destination =dst  and n.f4destination =src
group by (m.f1fareeconomy+n.f3fareeconomy) , (m.f1farefirst+n.f3farefirst) , (m.f1farebusiness+n.f3farebusiness)
order by (m.f1fareeconomy+n.f3fareeconomy) , (m.f1farefirst+n.f3farefirst) , (m.f1farebusiness+n.f3farebusiness)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findDirectOneWayFlight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findDirectOneWayFlight`(src varchar(100), dst varchar(100), fromdate varchar(100))
BEGIN
select fs.fsid , r.routeid,r.airport, fs.flightdate , r.destination, fs.arrivaldate, 
fs.timeoffset, fs.wifi, fs.fareeconomy, fs.farefirst, fs.farebusiness, 
fs.cancellationcharge,fs.bagallow,fs.extrabagfare, fs.aircraftid, 
ai.username, ai.airlinename
from flyers.flightschedule fs  inner join route r on fs.routeid =r.routeid 
inner join  aircraft a on fs.aircraftid =a.aircraftid 
inner join airline ai on fs.username = ai.username
where  
date(fs.flightdate) = date(fromdate)
and r.airport = src and r.destination = dst;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findDirectReturnFlights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findDirectReturnFlights`(src varchar(100), dst varchar(100), fromdate varchar(100), todate varchar(100))
BEGIN
select ofsid, orouteid, oairport,oflightdate,odestination,oarrivaldate,otimeoffset,
owifi,
(ofareeconomy + rfareeconomy) * 0.80 , (ofarefirst+rfarefirst) * 0.80,
(ofarebusiness+rfarebusiness) * 0.80,
case when (ocancellationcharge > rcancellationcharge) then ocancellationcharge else rcancellationcharge end,
case when (obagallow > rbagallow) then rbagallow else obagallow end,
case when (oextrabagfare > rextrabagfare) then oextrabagfare else rextrabagfare end,
oaircraftid,ousername,oairlinename,
rfsid, rrouteid, rairport,rflightdate,rdestination,rarrivaldate,rtimeoffset,
rwifi
from(

select 
a.fsid as ofsid , r.routeid as orouteid, r.airport as oairport, a.flightdate as oflightdate,
r.destination as odestination, a.arrivaldate as oarrivaldate, 
a.timeoffset as otimeoffset, a.wifi as owifi, a.fareeconomy as ofareeconomy,
a.farefirst as ofarefirst, a.farebusiness as ofarebusiness, 
a.cancellationcharge as ocancellationcharge,a.bagallow as obagallow,
a.extrabagfare as oextrabagfare, a.aircraftid as oaircraftid, 
oai.username as ousername, oai.airlinename as oairlinename
from 
(flightschedule a inner join route r on a.routeid=r.routeid
inner join aircraft oa on oa.aircraftid =a.aircraftid
inner join airline oai on oai.username =a.username
) 
 where 
r.airport =src  and r.destination =dst  and
(DATE(a.flightdate) = date(fromdate))
) m
inner join
(
select 
c.fsid as rfsid , p.routeid as rrouteid, p.airport as rairport, c.flightdate as rflightdate,
p.destination as rdestination, c.arrivaldate as rarrivaldate, 
c.timeoffset as rtimeoffset, c.wifi as rwifi, c.fareeconomy as rfareeconomy, c.farefirst as rfarefirst, c.farebusiness as rfarebusiness, 
c.cancellationcharge as rcancellationcharge,c.bagallow as rbagallow,
c.extrabagfare as rextrabagfare, c.aircraftid as raircraftid, 
rai.username as rusername, rai.airlinename as rairlinename

from (flightschedule c inner join route p on c.routeid=p.routeid
inner join aircraft ra on ra.aircraftid =c.aircraftid
inner join airline rai on rai.username =c.username
) 
where 
p.airport =dst  and p.destination =src and
(DATE(c.flightdate) = date(todate) )

) n

on m.odestination =dst  and n.rdestination =src
and m.ousername = n.rusername
group by (m.ofareeconomy+n.rfareeconomy) , (m.ofarefirst+n.rfarefirst) , (m.ofarebusiness+n.rfarebusiness)
order by (m.ofareeconomy+n.rfareeconomy) , (m.ofarefirst+n.rfarefirst) , (m.ofarebusiness+n.rfarebusiness)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findMyTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findMyTicket`(tid int , uname varchar(100))
BEGIN
if uname='XXXXXXX' then
select 
t.tsid,t.bookingdate,t.seatno,t.psid,t.fsid,t.type,t.username,t.offerid,t.total,t.creditcard,t.wheelchair,t.food,t.cabinclass,fs.flightdate,fs.arrivaldate,fs.aircraftid,fs.routeid, fs.bagallow, fs.username, fs.wifi,a.model,a.capacity,r.airport,r.destination,p.name,ar.airlinename,o.promocode
from 
flyers.transaction t join flyers.flightschedule fs  on  t.fsid = fs.fsid
inner join flyers.aircraft a on fs.aircraftid = a.aircraftid
inner join flyers.route r on r.routeid =fs.routeid
inner join flyers.passanger p  on p.psid = t.psid
inner join flyers.airline ar on ar.username =fs.username
left outer join flyers.offers o on o.offersid = t.offerid

where tsid=tid
and type =1
;
else 
select 
t.tsid,t.bookingdate,t.seatno,t.psid,t.fsid,t.type,t.username,t.offerid,t.total,t.creditcard,t.wheelchair,t.food,t.cabinclass,fs.flightdate,fs.arrivaldate,fs.aircraftid,fs.routeid, fs.bagallow, fs.username, fs.wifi,a.model,a.capacity,r.airport,r.destination,p.name,ar.airlinename,o.promocode
from 
flyers.transaction t join flyers.flightschedule fs  on  t.fsid = fs.fsid
inner join flyers.aircraft a on fs.aircraftid = a.aircraftid
inner join flyers.route r on r.routeid =fs.routeid
inner join flyers.passanger p  on p.psid = t.psid
inner join flyers.airline ar on ar.username =fs.username
left outer join flyers.offers o on o.offersid = t.offerid

where tsid=tid
and type =1
and t.username = uname;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findNextFlightsForAirline` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findNextFlightsForAirline`(usr varchar(100))
BEGIN

if usr = 'XXXXXX' then
select * from flightschedule fs inner join route r on fs.routeid  = r.routeid  where date(fs.flightdate) > now()  order by fs.flightdate;
else
select * from flightschedule fs inner join route r on fs.routeid  = r.routeid  where date(fs.flightdate) > now() and fs.username = usr order by fs.flightdate;
end if;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findSeatAvailibility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findSeatAvailibility`(fid int)
BEGIN
declare i int;
declare aid  int;
declare cap int;
SET i=1;
set aid = (select aircraftid from  flightschedule fs where  fs.fsid=fid);
set cap = (select capacity from aircraft where aircraftid =aid);

drop table if exists temp ;
create  table temp (seat int);


loop_loop: LOOP
    if not exists(
    
    select 1 from flyers.transaction where seatno = i and type=1 and 	 fsid = fid
    
    ) then
    insert into temp values(i);
	end IF;
	SET i=i+1;
     IF i>cap then
         LEAVE loop_loop;
     END IF;
 END LOOP loop_loop;
 
 select * from temp;
 drop table if exists temp ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findTravelDestination` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findTravelDestination`()
BEGIN
select fs.fsid , r.routeid,r.airport, fs.flightdate , r.destination, fs.arrivaldate, 
fs.timeoffset, fs.wifi, fs.fareeconomy, fs.farefirst, fs.farebusiness, 
fs.cancellationcharge,fs.bagallow,fs.extrabagfare, fs.aircraftid, 
ai.username, ai.airlinename
from flyers.flightschedule fs  inner join route r on fs.routeid =r.routeid 
inner join  aircraft a on fs.aircraftid =a.aircraftid 
inner join airline ai on fs.username = ai.username
where  

fs.fareeconomy = (
select min(fq.fareeconomy) from flyers.flightschedule fq where fs.routeid=fq.routeid group by  fq.routeid
) group by fs.routeid order by fs.routeid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `flightschedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `flightschedule`(id int, fd varchar(100))
BEGIN
select flightdate, arrivaldate, date_add(flightdate, interval timeoffset minute) as estimated_flightdate, date_add(arrivaldate, interval timeoffset minute) as estimated_arrivaldate, timeoffset as delay
from flyers.flightschedule
where fsid = id and date(fd) = date(flightdate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generateSalesReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generateSalesReport`()
BEGIN
select fs.fsid, a.airlinename,count(t.tsid), sum(t.total), concat(r.airport,'-',r.destination) from
flyers.flightschedule fs 
inner join airline a on fs.username = a.username
inner join route r on r.routeid = fs.routeid
left outer join flyers.transaction t on t.fsid = fs.fsid group by fs.fsid, tsid and t.total
order by sum(t.total) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login_user`(uname varchar(100), pwd varchar(100), utype tinyint)
BEGIN
update login set lastlogin = CURRENT_TIMESTAMP where username = uname;
select * from login where username = uname and password = pwd and usertype = utype;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-02 23:28:50
