-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2022 at 04:46 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartements`
--

CREATE TABLE `apartements` (
  `apartement_id` int(11) NOT NULL,
  `building_id` int(11) DEFAULT NULL,
  `area` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `dimensions_room` varchar(25) DEFAULT NULL,
  `no_rooms` int(11) NOT NULL,
  `no_bathrooms` int(11) DEFAULT NULL,
  `sold_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apartements`
--

INSERT INTO `apartements` (`apartement_id`, `building_id`, `area`, `floor`, `price`, `description`, `dimensions_room`, `no_rooms`, `no_bathrooms`, `sold_date`) VALUES
(1, 1, 100, 1, 850000, 'floor 1 and big apartment', '0.9*1.6', 4, 1, '2021-07-21'),
(2, 1, 110, 3, 900000, 'floor 3 and big apartment', '1*1.7', 4, 1, NULL),
(3, 2, 300, 3, 2000000, 'floor 3 and big apartment', '4*5', 7, 2, NULL),
(4, 2, 250, 5, 1500000, 'floor 5 and big apartment', '3.3*4.2', 6, 1, NULL),
(5, 2, 270, 5, 1600000, 'floor 5 and big apartment', '3.4*4.5', 6, 2, '2019-03-12'),
(6, 3, 500, 7, 3400000, 'floor 7 and big apartment', '4*5', 11, 3, '2022-01-01'),
(7, 4, 60, 5, 600000, 'floor 5 and small apartment', '1*0.9', 3, 1, '2022-01-02'),
(8, 2, 470, 6, 730000, 'floor 6 and small apartment', '1*1.4', 3, 1, NULL),
(9, 4, 80, 7, 830000, 'floor 7 and small apartment', '1.2*1.6', 3, 1, '2020-08-23'),
(10, 4, 75, 8, 800000, 'floor 8 and small apartment', '1*1.5', 3, 1, '2021-10-12'),
(11, 5, 140, 3, 1300000, 'floor 3 and medium apartment', '2*3', 5, 1, NULL),
(12, 5, 140, 5, 1230000, 'floor 5 and medium apartment', '2*3', 5, 2, '2021-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `building_id` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `building_area` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`building_id`, `area`, `length`, `height`, `building_area`, `address`, `position`, `description`) VALUES
(1, 500, 120, 27, 470, '34 zaki salem strret', 'zaki salem', NULL),
(2, 400, 110, 22, 365, '4 malek strret', 'malek', NULL),
(3, 600, 100, 40, 334, '65 shoots strret', 'shoots', NULL),
(4, 700, 134, 53, 573, '4 fauzy moaz strret', 'smouha', NULL),
(5, 580, 80, 38, 480, '24 senima lila strret', 'bakos', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `apartement_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `apartement_id`, `first_name`, `last_name`, `age`, `phone`) VALUES
(1, 5, 'Ahmed', 'Sabry', 43, '01065447866'),
(2, 7, 'Mona', 'Gamal', 29, '01069787866'),
(3, 1, 'Ahmed', 'Mandor', 66, '01265156861'),
(4, 9, 'Essam', 'Aly', 37, '01265446490'),
(5, 12, 'El-Sayed', 'Hosny', 27, '01083047866'),
(6, 6, 'Manal', 'Mohamed', 49, '01586328898'),
(7, 10, 'Wael', 'Shehata', 25, '01565987656');

-- --------------------------------------------------------

--
-- Table structure for table `installments`
--

CREATE TABLE `installments` (
  `installment_id` int(11) NOT NULL,
  `apartement_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `installment_date` date NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `installments`
--

INSERT INTO `installments` (`installment_id`, `apartement_id`, `customer_id`, `installment_date`, `amount`) VALUES
(1, 5, 1, '2022-01-12', 65000),
(2, 5, 1, '2022-03-12', 70000),
(3, 7, 3, '2022-06-02', 100000),
(4, 5, 1, '2022-12-02', 150000),
(5, 5, 1, '2023-06-02', 200000),
(6, 9, 4, '2021-02-05', 10000),
(7, 9, 4, '2021-04-05', 50000),
(8, 5, 1, '2023-12-02', 2100000),
(9, 5, 1, '2024-06-02', 220000),
(10, 9, 4, '2021-06-05', 100000),
(11, 1, 3, '2021-03-27', 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartements`
--
ALTER TABLE `apartements`
  ADD PRIMARY KEY (`apartement_id`),
  ADD KEY `building_id` (`building_id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`building_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `apartement_id` (`apartement_id`);

--
-- Indexes for table `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`installment_id`),
  ADD KEY `apartement_id` (`apartement_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartements`
--
ALTER TABLE `apartements`
  ADD CONSTRAINT `apartements_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`building_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`apartement_id`) REFERENCES `apartements` (`apartement_id`);

--
-- Constraints for table `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `installments_ibfk_1` FOREIGN KEY (`apartement_id`) REFERENCES `apartements` (`apartement_id`),
  ADD CONSTRAINT `installments_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
