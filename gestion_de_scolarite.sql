-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3309
-- Généré le :  lun. 29 août 2022 à 18:40
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion_de_scolarite`
--

-- --------------------------------------------------------

--
-- Structure de la table `coeficient`
--

DROP TABLE IF EXISTS `coeficient`;
CREATE TABLE IF NOT EXISTS `coeficient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codemat` int(11) NOT NULL,
  `codefil` int(11) NOT NULL,
  `coef` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codemat` (`codemat`),
  KEY `codefil` (`codefil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `composition`
--

DROP TABLE IF EXISTS `composition`;
CREATE TABLE IF NOT EXISTS `composition` (
  `Datreg` int(11) NOT NULL AUTO_INCREMENT,
  `Numins` int(11) NOT NULL,
  `Codemat` int(11) NOT NULL,
  `Notecomp` varchar(11) NOT NULL,
  PRIMARY KEY (`Datreg`),
  KEY `Numins` (`Numins`),
  KEY `Codemat` (`Codemat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `echeance`
--

DROP TABLE IF EXISTS `echeance`;
CREATE TABLE IF NOT EXISTS `echeance` (
  `numech` int(11) NOT NULL AUTO_INCREMENT,
  `numins` int(11) NOT NULL,
  `datech` varchar(0) NOT NULL,
  `montech` varchar(11) NOT NULL,
  PRIMARY KEY (`numech`),
  KEY `numins` (`numins`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `matricule` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

DROP TABLE IF EXISTS `filiere`;
CREATE TABLE IF NOT EXISTS `filiere` (
  `codefif` int(11) NOT NULL AUTO_INCREMENT,
  `libfil` varchar(255) DEFAULT NULL,
  `cout` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`codefif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `numins` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` int(11) NOT NULL,
  `codefil` int(11) NOT NULL,
  `dateins` varchar(0) DEFAULT NULL,
  `annee` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`numins`),
  KEY `matricule` (`matricule`),
  KEY `codefil` (`codefil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `codemat` int(11) NOT NULL AUTO_INCREMENT,
  `libmat` varchar(255) NOT NULL,
  PRIMARY KEY (`codemat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reglement`
--

DROP TABLE IF EXISTS `reglement`;
CREATE TABLE IF NOT EXISTS `reglement` (
  `datreg` int(11) NOT NULL AUTO_INCREMENT,
  `numins` int(11) NOT NULL,
  `numech` int(11) NOT NULL,
  `montreg` varchar(11) NOT NULL,
  PRIMARY KEY (`datreg`),
  KEY `numins` (`numins`),
  KEY `Numech` (`numech`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `coeficient`
--
ALTER TABLE `coeficient`
  ADD CONSTRAINT `coeficient_filiere_codefil` FOREIGN KEY (`codefil`) REFERENCES `filiere` (`codefif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coeficient_matiere_codemat` FOREIGN KEY (`codemat`) REFERENCES `matiere` (`codemat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `composition`
--
ALTER TABLE `composition`
  ADD CONSTRAINT `composition_inscription_numins` FOREIGN KEY (`Numins`) REFERENCES `inscription` (`numins`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `composition_matiere_codemat` FOREIGN KEY (`Codemat`) REFERENCES `matiere` (`codemat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `echeance`
--
ALTER TABLE `echeance`
  ADD CONSTRAINT `echeance_inscription_numins` FOREIGN KEY (`numins`) REFERENCES `inscription` (`numins`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_etudiant_matricule` FOREIGN KEY (`matricule`) REFERENCES `etudiant` (`matricule`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscription_filiere_codefil` FOREIGN KEY (`codefil`) REFERENCES `filiere` (`codefif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reglement`
--
ALTER TABLE `reglement`
  ADD CONSTRAINT `reglement_echeance_numech` FOREIGN KEY (`numech`) REFERENCES `echeance` (`numech`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reglement_inscription_nuins` FOREIGN KEY (`numins`) REFERENCES `inscription` (`numins`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
