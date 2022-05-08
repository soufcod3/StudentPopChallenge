CREATE DATABASE  IF NOT EXISTS `studentpop`;
USE `studentpop`;
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: studentpop
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'Ross','Geller'),(2,'Monica','Geller'),(3,'Phoebe','Buffay'),(4,'Joey','Tribbiani');
UNLOCK TABLES;

-- Dump completed on 2022-05-08 16:52:08