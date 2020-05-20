-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2020 at 08:56 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exaditama_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `team_id_home` int(11) DEFAULT NULL,
  `team_id_away` int(11) DEFAULT NULL,
  `score_home` int(11) DEFAULT NULL,
  `score_away` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `date`, `team_id_home`, `team_id_away`, `score_home`, `score_away`, `createdAt`, `updatedAt`) VALUES
(27, '2020-05-20 05:42:05', 2, 1, 3, 1, '2020-05-20 05:42:05', '2020-05-20 05:42:05'),
(28, '2020-05-20 05:42:09', 2, 1, 3, 4, '2020-05-20 05:42:09', '2020-05-20 05:42:09'),
(29, '2020-05-20 05:42:12', 2, 1, 4, 4, '2020-05-20 05:42:12', '2020-05-20 05:42:12'),
(30, '2020-05-20 05:42:36', 2, 1, 4, 5, '2020-05-20 05:42:36', '2020-05-20 05:42:36'),
(31, '2020-05-20 06:00:10', 2, 1, 4, 3, '2020-05-20 06:00:10', '2020-05-20 06:00:10'),
(32, '2020-05-20 06:00:25', 2, 1, 4, 3, '2020-05-20 06:00:25', '2020-05-20 06:00:25'),
(33, '2020-05-20 06:07:50', 2, 1, 4, 3, '2020-05-20 06:07:50', '2020-05-20 06:07:50'),
(34, '2020-05-20 06:24:38', 2, 1, 4, 3, '2020-05-20 06:24:38', '2020-05-20 06:24:38'),
(35, '2020-05-20 06:24:48', 2, 1, 4, 3, '2020-05-20 06:24:48', '2020-05-20 06:24:48'),
(36, '2020-05-20 06:28:01', 2, 1, 4, 3, '2020-05-20 06:28:01', '2020-05-20 06:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `rankings`
--

CREATE TABLE `rankings` (
  `id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `pts` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rankings`
--

INSERT INTO `rankings` (`id`, `team_id`, `rank`, `pts`, `date`, `createdAt`, `updatedAt`) VALUES
(11, 2, 1, 22, '2020-05-20 06:28:01', '2020-05-20 05:42:05', '2020-05-20 06:28:02'),
(12, 1, 2, 7, '2020-05-20 05:42:37', '2020-05-20 05:42:09', '2020-05-20 06:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20200519114646-create-team.js'),
('20200519115015-create-matches.js'),
('20200519120927-create-ranking.js');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'real madrid', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'barcelona', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'liverpool', '2020-05-20 06:17:37', '2020-05-20 06:17:37'),
(4, 'chelsea', '2020-05-20 06:29:10', '2020-05-20 06:29:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id_home` (`team_id_home`),
  ADD KEY `team_id_away` (`team_id_away`);

--
-- Indexes for table `rankings`
--
ALTER TABLE `rankings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `rankings`
--
ALTER TABLE `rankings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`team_id_home`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`team_id_away`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rankings`
--
ALTER TABLE `rankings`
  ADD CONSTRAINT `rankings_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
