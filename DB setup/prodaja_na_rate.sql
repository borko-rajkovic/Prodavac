-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2019 at 10:43 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prodaja_na_rate`
--
CREATE DATABASE IF NOT EXISTS `prodaja_na_rate` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prodaja_na_rate`;

-- --------------------------------------------------------

--
-- Table structure for table `artgrupe`
--

DROP TABLE IF EXISTS `artgrupe`;
CREATE TABLE IF NOT EXISTS `artgrupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Broj` varchar(20) NOT NULL,
  `Naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `artmodeli`
--

DROP TABLE IF EXISTS `artmodeli`;
CREATE TABLE IF NOT EXISTS `artmodeli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupe` int(11) NOT NULL,
  `model` varchar(20) NOT NULL,
  `cijena` float(10,2) NOT NULL,
  `id_rastera` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `artmodelidetalji`
--

DROP TABLE IF EXISTS `artmodelidetalji`;
CREATE TABLE IF NOT EXISTS `artmodelidetalji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modela` int(11) NOT NULL,
  `velicina` varchar(20) NOT NULL,
  `brojkomada` int(11) NOT NULL,
  `barkod` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `artpopusti`
--

DROP TABLE IF EXISTS `artpopusti`;
CREATE TABLE IF NOT EXISTS `artpopusti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(50) NOT NULL,
  `Iznos` float(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `artpopustigrupe`
--

DROP TABLE IF EXISTS `artpopustigrupe`;
CREATE TABLE IF NOT EXISTS `artpopustigrupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupe` int(11) NOT NULL,
  `id_popusta` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `artpopustimodel`
--

DROP TABLE IF EXISTS `artpopustimodel`;
CREATE TABLE IF NOT EXISTS `artpopustimodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modela` int(11) NOT NULL,
  `id_popusta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `artrasteri`
--

DROP TABLE IF EXISTS `artrasteri`;
CREATE TABLE IF NOT EXISTS `artrasteri` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sifra` varchar(50) NOT NULL,
  `Naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `artrasterivelicina`
--

DROP TABLE IF EXISTS `artrasterivelicina`;
CREATE TABLE IF NOT EXISTS `artrasterivelicina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rastera` int(11) NOT NULL,
  `Velicina` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conf`
--

DROP TABLE IF EXISTS `conf`;
CREATE TABLE IF NOT EXISTS `conf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FilesPath` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
CREATE TABLE IF NOT EXISTS `korisnici` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Ime` varchar(50) NOT NULL,
  `Prezime` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Grupa` varchar(50) NOT NULL DEFAULT 'Operater',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kupci`
--

DROP TABLE IF EXISTS `kupci`;
CREATE TABLE IF NOT EXISTS `kupci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kupcigrupe` int(11) DEFAULT NULL,
  `Ime` varchar(50) NOT NULL,
  `Prezime` varchar(50) NOT NULL,
  `JMBG` varchar(20) NOT NULL,
  `BrojLicne` varchar(20) NOT NULL,
  `KopijaLicne` varchar(300) NOT NULL,
  `kontaktTelefon` varchar(50) NOT NULL DEFAULT ' ',
  `Napomena` varchar(20) NOT NULL DEFAULT ' ',
  `username` varchar(20) NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `kupci`
--
DROP TRIGGER IF EXISTS `kupci_after_ins_tr`;
DELIMITER $$
CREATE TRIGGER `kupci_after_ins_tr` AFTER INSERT ON `kupci` FOR EACH ROW BEGIN
	insert into `kupci_history`(id_kupca,akcija,Ime,Prezime,JMBG,BrojLicne,KopijaLicne,username,datum)
    values(new.id,'insert',New.ime,New.Prezime,New.JMBG,New.BrojLicne,New.KopijaLicne,New.username,New.datum);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `kupci_after_upd_tr`;
DELIMITER $$
CREATE TRIGGER `kupci_after_upd_tr` AFTER UPDATE ON `kupci` FOR EACH ROW BEGIN
	insert into `kupci_history`(id_kupca,akcija,Ime,Prezime,JMBG,BrojLicne,KopijaLicne,username,datum)
    values(new.id,'update',New.ime,New.Prezime,New.JMBG,New.BrojLicne,New.KopijaLicne,New.username,New.datum);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kupcigrupe`
--

DROP TABLE IF EXISTS `kupcigrupe`;
CREATE TABLE IF NOT EXISTS `kupcigrupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Broj` varchar(20) NOT NULL,
  `Naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kupci_history`
--

DROP TABLE IF EXISTS `kupci_history`;
CREATE TABLE IF NOT EXISTS `kupci_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kupca` int(11) DEFAULT NULL,
  `akcija` varchar(20) DEFAULT NULL,
  `Ime` varchar(50) DEFAULT NULL,
  `Prezime` varchar(50) DEFAULT NULL,
  `JMBG` varchar(20) DEFAULT NULL,
  `BrojLicne` varchar(20) DEFAULT NULL,
  `KopijaLicne` varchar(300) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kupljeni_proizvodi`
--

DROP TABLE IF EXISTS `kupljeni_proizvodi`;
CREATE TABLE IF NOT EXISTS `kupljeni_proizvodi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kupca` int(11) NOT NULL,
  `id_prodavca` int(11) NOT NULL,
  `proizvod` varchar(50) NOT NULL,
  `cijena` float(12,2) NOT NULL DEFAULT '0.00',
  `brojkomada` int(11) NOT NULL DEFAULT '1',
  `broj_rata` int(11) NOT NULL,
  `id_velicine` int(11) NOT NULL,
  `velicina` varchar(20) NOT NULL,
  `popust` float(12,2) NOT NULL,
  `odobreno` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uplacene_rate`
--

DROP TABLE IF EXISTS `uplacene_rate`;
CREATE TABLE IF NOT EXISTS `uplacene_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_uplate` int(11) NOT NULL DEFAULT '0',
  `id_prodaje` int(11) NOT NULL,
  `iznos` float(12,2) NOT NULL,
  `odobreno` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `uplacene_rate`
--
DROP TRIGGER IF EXISTS `uplacene_rate_after_del_tr`;
DELIMITER $$
CREATE TRIGGER `uplacene_rate_after_del_tr` AFTER DELETE ON `uplacene_rate` FOR EACH ROW BEGIN
	delete from uplate
	where id not in (select id_uplate from uplacene_rate);
    update uplate as up
    inner join 
	(select u.id, sum(ur.iznos) as suma_uplata
	from uplacene_rate ur
	inner join uplate u
	on ur.id_uplate = u.id
	group by u.id) as S on up.id = s.id
	set up.iznos = s.suma_uplata;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `uplate`
--

DROP TABLE IF EXISTS `uplate`;
CREATE TABLE IF NOT EXISTS `uplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prodavca` int(11) NOT NULL,
  `id_kupca` int(11) NOT NULL,
  `iznos` float(12,2) NOT NULL,
  `username` varchar(50) NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
