CREATE DATABASE  IF NOT EXISTS `clear_crm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `clear_crm`;
-- MySQL dump 10.13  Distrib 5.6.19, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: clear_crm
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` char(36) NOT NULL,
  `companyName` varchar(150) NOT NULL,
  `dateEntered` datetime NOT NULL,
  `introducedBy` varchar(150) NOT NULL,
  `description` text,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `industry` varchar(50) DEFAULT NULL,
  `annualRevenue` varchar(100) DEFAULT NULL,
  `phoneFax` varchar(100) DEFAULT NULL,
  `billingAddressStreet` varchar(150) DEFAULT NULL,
  `billingAddressCity` varchar(100) DEFAULT NULL,
  `billingAddressState` varchar(100) DEFAULT NULL,
  `billingAddressZipcode` varchar(20) DEFAULT NULL,
  `billingAddressCountry` varchar(225) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `mainPhone` varchar(100) NOT NULL,
  `alternativePhone` varchar(100) DEFAULT NULL,
  `website` varchar(225) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` int(10) DEFAULT NULL,
  `tickerSymbol` varchar(10) DEFAULT NULL,
  `shippingAddressStreet` varchar(150) DEFAULT NULL,
  `shippingAddressCity` varchar(100) NOT NULL,
  `shippingAddressState` varchar(100) NOT NULL,
  `shippingAddressZipcode` varchar(20) DEFAULT NULL,
  `shippingAddressCountry` varchar(225) NOT NULL DEFAULT 'United States',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_contact`
--

DROP TABLE IF EXISTS `account_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_contact` (
  `accountId` char(36) NOT NULL,
  `contactId` char(36) NOT NULL,
  PRIMARY KEY (`accountId`,`contactId`),
  KEY `contactId` (`contactId`),
  CONSTRAINT `account_contact_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`),
  CONSTRAINT `account_contact_ibfk_2` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_product`
--

DROP TABLE IF EXISTS `account_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_product` (
  `accountId` char(36) NOT NULL,
  `productId` char(36) NOT NULL,
  PRIMARY KEY (`accountId`,`productId`),
  KEY `productId` (`productId`),
  CONSTRAINT `account_product_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`),
  CONSTRAINT `account_product_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `callTime` datetime DEFAULT NULL,
  `blog` text,
  `durationHours` int(2) DEFAULT NULL,
  `durationMinutes` int(2) DEFAULT NULL,
  `direction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` char(36) NOT NULL,
  `saluation` varchar(225) DEFAULT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `department` varchar(225) DEFAULT NULL,
  `doNotCall` bit(1) DEFAULT NULL,
  `dateEntered` datetime NOT NULL,
  `referredBy` varchar(150) NOT NULL,
  `leadSource` varchar(100) DEFAULT NULL,
  `leadSourceDescription` text,
  `descripton` text,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `lead` bit(1) NOT NULL DEFAULT b'0',
  `mobile` varchar(100) DEFAULT NULL,
  `phoneWork` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `emailAddress` varchar(200) DEFAULT NULL,
  `assistant` varchar(100) DEFAULT NULL,
  `primaryAddressStreet` varchar(150) DEFAULT NULL,
  `primaryAddressState` varchar(100) DEFAULT NULL,
  `primaryAddressCity` varchar(100) DEFAULT NULL,
  `primaryAddressZipcode` varchar(20) DEFAULT NULL,
  `primaryAddressCountry` varchar(225) DEFAULT NULL,
  `shippingAddressStreet` varchar(150) DEFAULT NULL,
  `shippingAddressState` varchar(100) NOT NULL,
  `shippingAddressCity` varchar(100) NOT NULL,
  `shippingAddressZipcode` varchar(20) DEFAULT NULL,
  `shippingAddressCountry` varchar(225) NOT NULL DEFAULT 'United States',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_call`
--

DROP TABLE IF EXISTS `contact_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_call` (
  `contact_id` char(36) NOT NULL,
  `call_id` int(10) NOT NULL,
  `employee_id` char(36) NOT NULL,
  PRIMARY KEY (`contact_id`,`call_id`,`employee_id`),
  KEY `call_id` (`call_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `contact_call_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`),
  CONSTRAINT `contact_call_ibfk_2` FOREIGN KEY (`call_id`) REFERENCES `calls` (`id`),
  CONSTRAINT `contact_call_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_meeting`
--

DROP TABLE IF EXISTS `contact_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_meeting` (
  `contactId` char(36) NOT NULL,
  `meetingId` int(10) NOT NULL,
  `employeeId` char(36) NOT NULL,
  PRIMARY KEY (`contactId`,`meetingId`),
  KEY `meetingId` (`meetingId`),
  CONSTRAINT `contact_meeting_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`),
  CONSTRAINT `contact_meeting_ibfk_2` FOREIGN KEY (`meetingId`) REFERENCES `meeting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_note`
--

DROP TABLE IF EXISTS `contact_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_note` (
  `contactId` char(36) NOT NULL,
  `noteId` int(10) NOT NULL,
  `employeeId` char(36) NOT NULL,
  PRIMARY KEY (`contactId`,`noteId`),
  KEY `noteId` (`noteId`),
  CONSTRAINT `contact_note_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`),
  CONSTRAINT `contact_note_ibfk_2` FOREIGN KEY (`noteId`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_opprtunity`
--

DROP TABLE IF EXISTS `contact_opprtunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_opprtunity` (
  `contactId` char(36) NOT NULL,
  `opportunityId` char(36) NOT NULL,
  PRIMARY KEY (`contactId`,`opportunityId`),
  KEY `opportunityId` (`opportunityId`),
  CONSTRAINT `contact_opprtunity_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`),
  CONSTRAINT `contact_opprtunity_ibfk_2` FOREIGN KEY (`opportunityId`) REFERENCES `opportunity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_service`
--

DROP TABLE IF EXISTS `contact_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_service` (
  `contactId` varchar(36) NOT NULL,
  `serviceId` int(10) NOT NULL,
  `employeeId` char(36) NOT NULL,
  PRIMARY KEY (`contactId`,`serviceId`),
  KEY `serviceId` (`serviceId`),
  KEY `employeeId` (`employeeId`),
  CONSTRAINT `contact_service_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`),
  CONSTRAINT `contact_service_ibfk_2` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`),
  CONSTRAINT `contact_service_ibfk_3` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` char(36) NOT NULL,
  `userName` varchar(60) NOT NULL,
  `authenticateId` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `department` varchar(225) NOT NULL,
  `isAdmin` bit(1) DEFAULT b'0',
  `home` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `workPhone` varchar(100) NOT NULL,
  `phoneExtension` varchar(100) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `chatId` varchar(100) DEFAULT NULL,
  `chatType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_account`
--

DROP TABLE IF EXISTS `employee_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_account` (
  `employee_id` char(36) NOT NULL,
  `account_id` char(36) NOT NULL,
  PRIMARY KEY (`employee_id`,`account_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `employee_account_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `employee_account_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting` (
  `id` int(10) NOT NULL,
  `scheduledFor` datetime NOT NULL,
  `description` text,
  `agenda` text,
  `blog` text,
  `location` varchar(50) DEFAULT NULL,
  `joinUrl` varchar(200) DEFAULT NULL,
  `externalId` char(36) DEFAULT NULL,
  `durationHours` int(3) NOT NULL,
  `durationMinutes` int(2) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Planned',
  `meetingType` varchar(225) NOT NULL,
  `reminderTime` datetime DEFAULT NULL,
  `emailReminderTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opportunity`
--

DROP TABLE IF EXISTS `opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunity` (
  `id` char(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `opportunityType` varchar(225) NOT NULL,
  `targetQuantity` double(22,3) DEFAULT NULL,
  `targetUnit` varchar(100) DEFAULT NULL,
  `targetValue` varchar(100) DEFAULT NULL,
  `dateOpen` datetime NOT NULL,
  `dateClosed` datetime DEFAULT NULL,
  `probability` double(3,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `supplier` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` text,
  `openDate` datetime NOT NULL,
  `solved` bit(1) NOT NULL DEFAULT b'0',
  `state` varchar(100) NOT NULL DEFAULT 'Open',
  `caseType` varchar(100) NOT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `workLog` text,
  `closeDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-28 23:14:20
