CREATE DATABASE  IF NOT EXISTS `studentpop` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `studentpop`;
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: studentpop
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

--
-- Table structure for table `userProposal`
--

DROP TABLE IF EXISTS `userProposal`;
CREATE TABLE `userProposal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `message` text NOT NULL,
  `proposal_id` int NOT NULL,
  `sentDate` datetime,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES user(`id`),
  FOREIGN KEY (`proposal_id`) REFERENCES proposal(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userProposal`
--

LOCK TABLES `userProposal` WRITE;
INSERT INTO `userProposal` VALUES 
(1,1,'Une nouvelle mission vous est proposée', 1, null),
(2,2,'Une nouvelle mission vous est proposée', 2, null),
(3, 3, 'Une nouvelle mission vous est proposée', 3, null),
(4, 4,'Une nouvelle mission vous est proposée',4, null),
(5,4,'Une nouvelle mission vous est proposée', 1, null),
(6,2,'Une nouvelle mission vous est proposée', 2, null),
(7, 1, 'Une nouvelle mission vous est proposée', 3, null),
(8, 4,'Une nouvelle mission vous est proposée',4, null),
(9,2,'Une nouvelle mission vous est proposée', 1, null),
(10,2,'Une nouvelle mission vous est proposée', 2, null),
(11, 3, 'Une nouvelle mission vous est proposée', 3, null),
(12, 4,'Une nouvelle mission vous est proposée',4, null),
(13,1,'Une nouvelle mission vous est proposée', 1, null),
(14,2,'Une nouvelle mission vous est proposée', 2, null),
(15, 3, 'Une nouvelle mission vous est proposée', 3, null),
(16, 4,'Une nouvelle mission vous est proposée',4, null),
(17,1,'Une nouvelle mission vous est proposée', 1, null),
(18,2,'Une nouvelle mission vous est proposée', 2, null),
(19, 3, 'Une nouvelle mission vous est proposée', 3, null),
(20, 4,'Une nouvelle mission vous est proposée',4, null);
UNLOCK TABLES;

-- Dump completed on 2019-07-31 15:23:08