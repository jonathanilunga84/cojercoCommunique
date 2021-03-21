-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 08, 2020 at 05:55 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cojerco`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `ID_COMMENT` int(11) NOT NULL AUTO_INCREMENT,
  `COMMENTAIRE` text NOT NULL,
  `DATE_COMMENT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUT` int(11) NOT NULL DEFAULT '1',
  `STATU` int(11) NOT NULL DEFAULT '1',
  `ID_PUB` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  PRIMARY KEY (`ID_COMMENT`),
  KEY `ID_PUB` (`ID_PUB`),
  KEY `ID_USER` (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `NOTIFICATION` text NOT NULL,
  `DATE_NOTIF` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUT` int(11) NOT NULL DEFAULT '1',
  `ID_PUB` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  KEY `ID_PUB` (`ID_PUB`),
  KEY `ID_USER` (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `ID_PROV` int(11) NOT NULL AUTO_INCREMENT,
  `DESIGNATION` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_PROV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `ID_PUB` int(11) NOT NULL AUTO_INCREMENT,
  `PUBLICATION` text NOT NULL,
  `DATE_PUB` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUT` int(11) NOT NULL DEFAULT '1',
  `ID_PROV` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  PRIMARY KEY (`ID_PUB`),
  KEY `ID_USER` (`ID_USER`),
  KEY `ID_PROV` (`ID_PROV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `ID_TYPE` int(11) NOT NULL AUTO_INCREMENT,
  `DESIGNATION` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `PSEUDO` varchar(100) NOT NULL,
  `NOMS` varchar(100) NOT NULL,
  `MAIL` varchar(30) DEFAULT NULL,
  `SEXE` varchar(10) NOT NULL,
  `PHOTO_USER` text NOT NULL,
  `ANNIV` varchar(20) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `ID_PROV` int(11) NOT NULL,
  `ID_TYPE` int(11) NOT NULL,
  PRIMARY KEY (`ID_USER`),
  KEY `ID_PROV` (`ID_PROV`),
  KEY `ID_TYPE` (`ID_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`ID_PUB`) REFERENCES `publication` (`ID_PUB`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`ID_PUB`) REFERENCES `publication` (`ID_PUB`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `publication_ibfk_2` FOREIGN KEY (`ID_PROV`) REFERENCES `province` (`ID_PROV`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`ID_PROV`) REFERENCES `province` (`ID_PROV`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`ID_TYPE`) REFERENCES `type` (`ID_TYPE`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
