CREATE DATABASE  IF NOT EXISTS `wiki` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wiki`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: wiki
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category` (
  `articleID` int(11) NOT NULL DEFAULT '0',
  `categoryID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`articleID`,`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,2),(10,2),(11,2),(12,2),(13,2),(14,3),(14,4),(14,5),(17,3),(17,7),(17,8),(17,9),(17,10),(17,11),(17,12),(18,3),(18,14),(18,15),(18,16),(19,3),(19,18),(20,19),(20,20),(20,21),(20,22),(20,23),(20,24),(20,25),(20,26),(21,21),(21,25),(21,26),(21,27),(21,28),(21,31),(22,3),(22,11),(22,34),(22,35),(23,3),(23,11),(23,23),(23,25),(23,28),(23,39),(24,43),(24,44),(24,45),(25,43),(25,47),(25,48),(25,49),(26,4),(26,51),(26,52),(27,53),(27,54),(27,55),(27,56),(27,57),(27,58),(27,59),(28,56),(28,60),(28,61),(29,63),(30,63);
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `articleID` int(11) NOT NULL AUTO_INCREMENT,
  `articleTitle` varchar(100) DEFAULT NULL,
  `articleNotes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`articleID`),
  UNIQUE KEY `articleTitle_UNIQUE` (`articleTitle`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'First normal form','The domain of each attribute contains only atomic values, and the value of each attribute contains only a single value from that domain.'),(2,'Second normal form','No non-prime attribute is dependent on any proper subset of any candidate key of the table.'),(3,'Third normal form','Every non-prime attribute of R is non-transitively dependent on every superkey of R.'),(4,'Boyce-Codd normal form','All redundancy based on functional dependency has been removed, although other types of redundancy may still exist.'),(5,'Fourth normal form','For every one of its non-trivial multivalued dependencies X -->> Y, X is a superkey, that is, X is either a candidate key or a superset thereof.'),(6,'Fifth normal form','Database, in which every non-trivial join dependency in it is implied by the candidate keys.'),(7,'Domain/key normal form','The database that contains no constraints other than domain constraints and key constraints.'),(8,'Sixth normal form','A relvar R [table] that satisfies no nontrivial join dependencies at all.'),(9,'Python','General-purpose, high-level programming language.'),(10,'Perl','A family of high-level,general-purpose, interpreted, dynamic programming languages.'),(11,'PHP','A server-side scripting language designed for web development but also used as a general-purpose programming language.'),(12,'C++','A general-purpose programming language.'),(13,'Java','A general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible.'),(14,'Database',NULL),(17,'SQL',NULL),(18,'Relational model',NULL),(19,'Database model',NULL),(20,'MySQL',NULL),(21,'PostgreSQL',NULL),(22,'Microsoft SQL Server',NULL),(23,'Oracle Database',NULL),(24,'Online database',NULL),(25,'List of online databases',NULL),(26,'Introduction to Databases',NULL),(27,'Data',NULL),(28,'Data analysis',NULL),(29,'Data screening',NULL),(30,'Missing data',NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryName_UNIQUE` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (15,'1969 in computer science'),(20,'1995 software'),(26,'Client-server database management systems'),(7,'Computer languages'),(45,'Computer network stubs'),(53,'Computer science'),(25,'Cross-platform software'),(63,'Data analysis'),(8,'Data modeling languages'),(3,'Database management systems'),(18,'Database models'),(5,'Database theory'),(4,'Databases'),(9,'Declarative programming languages'),(21,'Free database management systems'),(31,'Free software programmed in C'),(57,'Information technology'),(47,'Internet-related lists'),(52,'Introductions'),(51,'Learning activities'),(49,'Lists of websites'),(54,'Mathematics'),(35,'Microsoft database software'),(19,'MySQL'),(59,'Nearly complete resources'),(1,'Normal Forms'),(43,'Online databases'),(23,'Oracle software'),(28,'ORDBMS software for Linux'),(27,'PostgreSQL'),(2,'Programming language'),(16,'Programming paradigms'),(39,'Proprietary database management systems'),(10,'Query languages'),(24,'RDBMS software for Linux'),(11,'Relational database management systems'),(14,'Relational model'),(61,'Research'),(55,'Science'),(58,'Secondary Education'),(48,'Social information processing'),(12,'SQL'),(56,'Statistics'),(60,'Statistics stubs'),(22,'Sun Microsystems software'),(44,'Types of databases'),(34,'Windows Server System');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-26  7:27:02
