-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27.11.2026 klo 12:56
-- Palvelimen versio: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autonvuokraus`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `asiakas`
--

CREATE TABLE `asiakas` (
  `id` int(11) NOT NULL,
  `etunimi` varchar(100) NOT NULL,
  `sukunimi` varchar(100) NOT NULL,
  `katuosoite` varchar(150) NOT NULL,
  `postitoimipaikka` varchar(100) NOT NULL,
  `puhelin` varchar(20) NOT NULL,
  `saika` date NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `asiakas`
--

INSERT INTO `asiakas` (`id`, `etunimi`, `sukunimi`, `katuosoite`, `postitoimipaikka`, `puhelin`, `saika`, `email`) VALUES
(1, 'Liisa', 'Meikäläinen', 'Kotikatu 11 A 3', '00100 Helsinki', '0501234567', '2004-10-08', 'liisa.meikalainen@example.com'),
(2, 'Eerika', 'Hemäläinen', 'Sivuusjoki 3', '04210 Espoo', '045109342198', '1994-10-24', 'Eerika.Hemalainen@hotmail.net'),
(3, 'Veikko', 'Uudenmäki', 'Jenkkisaapankatu 23', '07310 Lappeenranta', '04571012430971', '1985-03-21', 'Veikko.Uudenmaki@gmail.com'),
(4, 'Aaro', 'Seinäjoki', 'Vuorenjuuren tie 4', '01310 Kerava', '0415678183', '2007-08-17', 'Aaro.Seinajoki@gmail.com'),
(5, 'Eerika', 'Hemäläinen', 'Sivuusjoki 3', '04210 Espoo', '045109342198', '1994-10-24', 'Eerika.Hemalainen@hotmail.net'),
(6, 'Veikko', 'Uudenmäki', 'Jenkkisaapankatu 23', '07310 Lappeenranta', '04571012430971', '1985-03-21', 'Veikko.Uudenmaki@gmail.com'),
(7, 'Aaro', 'Seinäjoki', 'Vuorenjuuren tie 4', '01310 Kerava', '0415678183', '2007-08-17', 'Aaro.Seinajoki@gmail.com'),
(8, 'Olli', 'Kunnilainen', 'Viidensivun tie 83', '04178 Jyväskyllä', '040141573', '2001-03-21', 'Olli.Kunnilainen@live.fi');

-- --------------------------------------------------------

--
-- Rakenne taululle `auto`
--

CREATE TABLE `auto` (
  `id` int(11) NOT NULL,
  `rekno` varchar(10) NOT NULL,
  `valmistaja` varchar(100) NOT NULL,
  `malli` varchar(100) NOT NULL,
  `onkoautomaatti` tinyint(1) NOT NULL DEFAULT 0,
  `moottori` varchar(50) NOT NULL,
  `istumapaikat` int(11) NOT NULL,
  `hinta` decimal(6,2) NOT NULL,
  `onkovapaa` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `auto`
--

INSERT INTO `auto` (`id`, `rekno`, `valmistaja`, `malli`, `onkoautomaatti`, `moottori`, `istumapaikat`, `hinta`, `onkovapaa`) VALUES
(1, 'ABC-313', 'Toyota', 'Corolla', 1, 'bensa', 5, 101.00, 1),
(2, 'DEF-456', 'Ford', 'Ranger', 1, 'Hybrid', 5, 99.00, 1),
(3, 'EOR-921', 'Honda', 'Civic', 0, 'Regular', 5, 85.00, 0),
(4, 'XDA-263', 'Toyota', 'Camry', 1, 'Regular', 5, 125.00, 1),
(5, 'LKD-743', 'BMW', '4 Series', 0, 'Petrol', 4, 75.00, 1),
(8, 'UEW-743', 'BMW', '4 Series', 0, 'Petrol', 4, 83.00, 0),
(9, 'KHD-831', 'Dodge', 'Durango', 1, 'Gasoline', 7, 175.00, 1);

-- --------------------------------------------------------

--
-- Rakenne taululle `sopimus`
--

CREATE TABLE `sopimus` (
  `id` int(11) NOT NULL,
  `asiakasid` int(11) NOT NULL,
  `autoid` int(11) NOT NULL,
  `aloituspvm` date NOT NULL,
  `lopetuspvm` date NOT NULL,
  `palautettu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `sopimus`
--

INSERT INTO `sopimus` (`id`, `asiakasid`, `autoid`, `aloituspvm`, `lopetuspvm`, `palautettu`) VALUES
(1, 1, 1, '2026-11-01', '2026-11-05', '2026-11-05'),
(2, 4, 3, '2027-03-01', '2027-04-01', '2027-04-01'),
(3, 7, 9, '2027-02-01', '2027-04-05', '2027-04-05'),
(4, 6, 3, '2027-05-01', '2027-05-08', '2027-04-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asiakas`
--
ALTER TABLE `asiakas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rekno` (`rekno`);

--
-- Indexes for table `sopimus`
--
ALTER TABLE `sopimus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asiakasid` (`asiakasid`),
  ADD KEY `autoid` (`autoid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asiakas`
--
ALTER TABLE `asiakas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `auto`
--
ALTER TABLE `auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sopimus`
--
ALTER TABLE `sopimus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
