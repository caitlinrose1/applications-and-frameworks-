-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2024 at 01:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cardealership`
--

-- --------------------------------------------------------

--
-- Table structure for table `dealership`
--

CREATE TABLE `dealership` (
  `DealershipAddress` varchar(100) NOT NULL PRIMARY KEY,
  `City` varchar(100) NOT NULL,
  UNIQUE KEY `Dealership_unique` (`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dealership`
--

INSERT INTO `dealership` (`DealershipAddress`, `City`) VALUES
('Pennyburn Industrial Estate', 'Londonderry');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `Model` varchar(20) NOT NULL PRIMARY KEY,
  `Price` varchar(20) DEFAULT NULL,
  `fuelType` varchar(100) DEFAULT NULL,
  `Mileage` varchar(100) DEFAULT NULL,
  `Colour` varchar(100) NOT NULL,
  `DealershipAddress` varchar(100) NOT NULL,
  FOREIGN KEY (`DealershipAddress`) REFERENCES `dealership` (`DealershipAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`Model`, `Price`, `fuelType`, `Mileage`, `Colour`, `DealershipAddress`) VALUES
('Audi A1BL', '17456', 'Petrol', '40000', 'Black', 'Pennyburn Industrial Estate'),
('Audi A1G', '18250', 'Petrol', '18000', 'Grey', 'Pennyburn Industrial Estate'),
('Audi A1W', '21750', 'Petrol', '10000', 'White', 'Pennyburn Industrial Estate'),
('Audi A1Y', '20945', 'Petrol', '12000', 'Yellow', 'Pennyburn Industrial Estate'),
('Audi A4BL', '38670', 'Petrol', '37000', 'Black', 'Pennyburn Industrial Estate'),
('Audi A4G', '48987', 'Diesel', '15000', 'Grey', 'Pennyburn Industrial Estate'),
('Audi A4R', '42765', 'Petrol', '40000', 'Red', 'Pennyburn Industrial Estate'),
('Audi Q7B', '60000', 'Diesel', '22000', 'Blue', 'Pennyburn Industrial Estate'),
('Audi Q7R', '55250', 'Diesel', '20000', 'Red', 'Pennyburn Industrial Estate'),
('Audi Q7S', '63935', 'Petrol', '40000', 'Silver', 'Pennyburn Industrial Estate'),
('Audi Q7W', '72875', 'Diesel', '10000', 'White', 'Pennyburn Industrial Estate'),
('Audi R8R', '131670', 'Diesel', '32000', 'Red', 'Pennyburn Industrial Estate'),
('Audi R8B', '128545', 'Diesel', '20000', 'Blue', 'Pennyburn Industrial Estate');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Model` varchar(20) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `DealershipAddress` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Model` (`Model`),
  KEY `DealershipAddress` (`DealershipAddress`),
  CONSTRAINT `stock_car_FK` FOREIGN KEY (`Model`) REFERENCES `car` (`Model`),
  CONSTRAINT `stock_dealership_FK` FOREIGN KEY (`DealershipAddress`) REFERENCES `dealership` (`DealershipAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `Model`, `Quantity`, `DealershipAddress`) VALUES
(1, 'Audi A1BL', 5, 'Pennyburn Industrial Estate'),
(2, 'Audi A1G', 8, 'Pennyburn Industrial Estate'),
(3, 'Audi A1W', 3, 'Pennyburn Industrial Estate'),
(4, 'Audi A1Y', 6, 'Pennyburn Industrial Estate'),
(5, 'Audi A4BL', 0, 'Pennyburn Industrial Estate'),
(6, 'Audi A4G', 7, 'Pennyburn Industrial Estate'),
(7, 'Audi A4R', 12, 'Pennyburn Industrial Estate'),
(8, 'Audi Q7B', 4, 'Pennyburn Industrial Estate'),
(9, 'Audi Q7R', 9, 'Pennyburn Industrial Estate'),
(10, 'Audi Q7S', 0, 'Pennyburn Industrial Estate'),
(11, 'Audi Q7W', 2, 'Pennyburn Industrial Estate'),
(12, 'Audi R8R', 3, 'Pennyburn Industrial Estate'),
(13, 'Audi R8B', 0, 'Pennyburn Industrial Estate');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(30) NOT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `PhoneNo` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Customer_AK` (`fullname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`fullName`, `Email`, `PhoneNo`) VALUES
('John Doe', 'john.doe@example.com', 1234567890),
('Jane Smith', 'jane.smith@example.com', 9876543210),
('Michael Johnson', 'michael.johnson@example.com', 5486783345),
('Emily Davis', 'emily.davis@example.com', 4523279097),
('David Wilson', 'david.wilson@example.com', 3782372088),
('Sophia Thompson', 'sophia.thompson@example.com', 567890678),
('Daniel Anderson', 'daniel.anderson@example.com', 234789045),
('Olivia Martinez', 'olivia.martinez@example.com', 456897646),
('William Taylor', 'william.taylor@example.com', 98734567),
('Ava Thomas', 'ava.thomas@example.com', 78645678);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(30) NOT NULL,
  `Model` varchar(20) NOT NULL,
  `DealershipAddress` varchar(100) NOT NULL,
  `PurchaseDate` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fullName` (`fullName`),
  KEY `Model` (`Model`),
  KEY `DealershipAddress` (`DealershipAddress`),
  CONSTRAINT `purchase_customer_FK` FOREIGN KEY (`fullName`) REFERENCES `customer` (`fullName`),
  CONSTRAINT `purchase_car_FK` FOREIGN KEY (`Model`) REFERENCES `car` (`Model`),
  CONSTRAINT `purchase_dealership_FK` FOREIGN KEY (`DealershipAddress`) REFERENCES `dealership` (`DealershipAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `fullName`, `Model`, `DealershipAddress`, `PurchaseDate`)
VALUES
  (1, 'John Doe', 'Audi A4BL', 'Pennyburn Industrial Estate', '2023-05-01 10:30:00'),
  (2, 'Jane Smith', 'Audi Q7S', 'Pennyburn Industrial Estate', '2023-05-02 14:45:00'),
  (3, 'Michael Johnson', 'Audi A1W', 'Pennyburn Industrial Estate', '2023-05-03 09:15:00'),
  (4, 'Emily Davis', 'Audi R8R', 'Pennyburn Industrial Estate', '2023-05-04 16:20:00'),
  (5, 'David Wilson', 'Audi A4R', 'Pennyburn Industrial Estate', '2023-05-05 11:00:00'),
  (6, 'Sophia Thompson', 'Audi Q7B', 'Pennyburn Industrial Estate', '2023-05-06 13:30:00'),
  (7, 'Daniel Anderson', 'Audi A1G', 'Pennyburn Industrial Estate', '2023-05-07 08:45:00'),
  (8, 'Olivia Martinez', 'Audi Q7R', 'Pennyburn Industrial Estate', '2023-05-08 15:15:00'),
  (9, 'William Taylor', 'Audi A4G', 'Pennyburn Industrial Estate', '2023-05-09 10:00:00'),
  (10, 'Ava Thomas', 'Audi A1Y', 'Pennyburn Industrial Estate', '2023-05-10 12:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `passsword` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `passsword`, `email`) VALUES
('audiadmin1', '$adminpassword1', 'adminaudi@egmail.com'),
('jane_smith', '$bingo12', 'jane.smith@example.com'),
('joe_cole', '$AUDICARS,123', 'joe.cole@gmail.com'),
('john_doe', 'secretpass1', 'john.doe@example.com'),
('mee_cheeks', 'blue', 'mee.cheeks@gmail.com'),
('mike_doherty', 'vroom12', 'auser@gmail.com'),
('New Customer Name', 'default', 'user@email.com');

--
-- Deleting data for table 'users'
--

DELETE FROM `customer`
WHERE `fullName` = 'Customer Name to Delete';

--
-- Searching Data for table 'users'
--

SELECT `fullName`, `Email`, `PhoneNo`
FROM `customer`
WHERE `fullName` LIKE '%search_term%';

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;