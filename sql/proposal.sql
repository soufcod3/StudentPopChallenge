CREATE DATABASE  IF NOT EXISTS `studentpop` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `studentpop`;
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: studentpop
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `proposal`;
CREATE TABLE `proposal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proposal`
--

LOCK TABLES `proposal` WRITE;
INSERT INTO `proposal` VALUES (1,'Babysitting','Mission courte'),(2,'Serveur(se) en restauration','Mission longue'),(3,'Animateur en centre de loisirs','Mission courte'),(4,'Une jonquille contre le Cancer','Sondage');
UNLOCK TABLES;

-- Dump completed on 2022-05-08 16:52:08