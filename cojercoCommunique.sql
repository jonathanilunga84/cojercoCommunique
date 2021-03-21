-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 23 Février 2021 à 13:08
-- Version du serveur :  5.7.26-0ubuntu0.19.04.1
-- Version de PHP :  7.2.17-0ubuntu0.19.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cojercoCommunique`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `ID_COMMENT` int(11) NOT NULL,
  `COMMENTAIRE` text NOT NULL,
  `DATE_COMMENT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUT` int(11) NOT NULL DEFAULT '1',
  `STATU` int(11) NOT NULL DEFAULT '1',
  `ID_PUB` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `NOTIFICATION` text NOT NULL,
  `DATE_NOTIF` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUT` int(11) NOT NULL DEFAULT '1',
  `ID_PUB` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `province`
--

CREATE TABLE `province` (
  `ID_PROV` int(11) NOT NULL,
  `DESIGNATION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

CREATE TABLE `publication` (
  `ID_PUB` int(11) NOT NULL,
  `PUBLICATION` text NOT NULL,
  `DATE_PUB` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUT` int(11) NOT NULL DEFAULT '1',
  `ID_PROV` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `ID_TYPE` int(11) NOT NULL,
  `DESIGNATION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL,
  `PSEUDO` varchar(100) NOT NULL,
  `NOMS` varchar(100) NOT NULL,
  `MAIL` varchar(30) DEFAULT NULL,
  `SEXE` varchar(10) NOT NULL,
  `PHOTO_USER` text NOT NULL,
  `ANNIV` varchar(20) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `ID_PROV` int(11) NOT NULL,
  `ID_TYPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`ID_COMMENT`),
  ADD KEY `ID_PUB` (`ID_PUB`),
  ADD KEY `ID_USER` (`ID_USER`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD KEY `ID_PUB` (`ID_PUB`),
  ADD KEY `ID_USER` (`ID_USER`);

--
-- Index pour la table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`ID_PROV`);

--
-- Index pour la table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`ID_PUB`),
  ADD KEY `ID_USER` (`ID_USER`),
  ADD KEY `ID_PROV` (`ID_PROV`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`ID_TYPE`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`),
  ADD KEY `ID_PROV` (`ID_PROV`),
  ADD KEY `ID_TYPE` (`ID_TYPE`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `ID_COMMENT` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `province`
--
ALTER TABLE `province`
  MODIFY `ID_PROV` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `publication`
--
ALTER TABLE `publication`
  MODIFY `ID_PUB` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `ID_TYPE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`ID_PUB`) REFERENCES `publication` (`ID_PUB`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`ID_PUB`) REFERENCES `publication` (`ID_PUB`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `publication_ibfk_2` FOREIGN KEY (`ID_PROV`) REFERENCES `province` (`ID_PROV`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`ID_PROV`) REFERENCES `province` (`ID_PROV`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`ID_TYPE`) REFERENCES `type` (`ID_TYPE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
