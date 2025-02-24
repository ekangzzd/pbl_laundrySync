-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2025 at 02:45 PM
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
-- Database: `laundrysync_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_tbl`
--

CREATE TABLE `customer_tbl` (
  `customer_id` int(11) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `mName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) NOT NULL,
  `suffix` enum('Jr.','Sr.','II','III','IV') DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `contactEmail` varchar(100) NOT NULL,
  `contactNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_tbl`
--

INSERT INTO `customer_tbl` (`customer_id`, `fName`, `mName`, `lName`, `suffix`, `unit`, `street`, `barangay`, `city`, `region`, `country`, `zipCode`, `contactEmail`, `contactNumber`) VALUES
(1, 'John', 'A.', 'Doe', NULL, '12A', 'Main St.', 'Barangay 1', 'Metro City', 'Region 1', 'CountryX', '1000', 'john.doe@email.com', '09123456789'),
(2, 'Jane', 'B.', 'Smith', 'Jr.', '5B', '2nd Ave.', 'Barangay 2', 'Metro City', 'Region 1', 'CountryX', '1001', 'jane.smith@email.com', '09876543210');

-- --------------------------------------------------------

--
-- Table structure for table `dryload_tbl`
--

CREATE TABLE `dryload_tbl` (
  `dryLoad_id` int(11) NOT NULL,
  `size` enum('medium','large') NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dryload_tbl`
--

INSERT INTO `dryload_tbl` (`dryLoad_id`, `size`, `description`, `price`) VALUES
(1, 'medium', 'Standard Drying', 65),
(2, 'large', 'Standard Drying', 100);

-- --------------------------------------------------------

--
-- Table structure for table `laundrydetails_tbl`
--

CREATE TABLE `laundrydetails_tbl` (
  `details_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `washLoad_id` int(11) DEFAULT NULL,
  `dryLoad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundrydetails_tbl`
--

INSERT INTO `laundrydetails_tbl` (`details_id`, `service_id`, `washLoad_id`, `dryLoad_id`) VALUES
(1, 1, 1, NULL),
(2, 1, 2, NULL),
(3, 1, 3, NULL),
(4, 1, 4, NULL),
(5, 1, 5, NULL),
(6, 1, 6, NULL),
(7, 1, 7, NULL),
(8, 1, 8, NULL),
(9, 1, 9, NULL),
(10, 2, NULL, 1),
(11, 2, NULL, 2),
(12, 3, 1, 1),
(13, 3, 1, 2),
(14, 3, 2, 1),
(15, 3, 2, 2),
(16, 3, 3, 1),
(17, 3, 3, 2),
(18, 3, 4, 1),
(19, 3, 4, 2),
(20, 3, 5, 1),
(21, 3, 5, 2),
(22, 3, 6, 1),
(23, 3, 6, 2),
(24, 3, 7, 1),
(25, 3, 7, 2),
(26, 3, 8, 1),
(27, 3, 8, 2),
(28, 3, 9, 1),
(29, 3, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `laundryorderstatus_tbl`
--

CREATE TABLE `laundryorderstatus_tbl` (
  `status_id` int(11) NOT NULL,
  `statusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundryorderstatus_tbl`
--

INSERT INTO `laundryorderstatus_tbl` (`status_id`, `statusName`) VALUES
(1, 'Pending'),
(2, 'Washing'),
(3, 'Drying'),
(4, 'Drying'),
(5, 'Pickup Ready'),
(6, 'Cancelled'),
(7, 'Pending Fee'),
(8, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `laundryorder_tbl`
--

CREATE TABLE `laundryorder_tbl` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `details_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `orderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundryorder_tbl`
--

INSERT INTO `laundryorder_tbl` (`order_id`, `customer_id`, `details_id`, `status_id`, `orderDate`) VALUES
(1, 1, 1, 2, '2025-02-24'),
(2, 2, 2, 3, '2025-02-23');

-- --------------------------------------------------------

--
-- Table structure for table `laundryservice_tbl`
--

CREATE TABLE `laundryservice_tbl` (
  `service_id` int(11) NOT NULL,
  `serviceName` varchar(100) NOT NULL,
  `serviceDesc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundryservice_tbl`
--

INSERT INTO `laundryservice_tbl` (`service_id`, `serviceName`, `serviceDesc`) VALUES
(1, 'Washing Only', 'Standard washing service without drying'),
(2, 'Drying Only', 'Standard drying service without washing'),
(3, 'Full Service', 'Washing and drying service');

-- --------------------------------------------------------

--
-- Table structure for table `login_tbl`
--

CREATE TABLE `login_tbl` (
  `customer_id` int(11) NOT NULL,
  `contactEmail` varchar(100) NOT NULL,
  `passwordHash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_tbl`
--

INSERT INTO `login_tbl` (`customer_id`, `contactEmail`, `passwordHash`) VALUES
(1, 'john.doe@email.com', 'hashedpassword1'),
(2, 'jane.smith@email.com', 'hashedpassword2');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_tbl`
--

CREATE TABLE `notifications_tbl` (
  `notification_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications_tbl`
--

INSERT INTO `notifications_tbl` (`notification_id`, `customer_id`, `message`, `status`, `createdAt`) VALUES
(1, 1, 'Your order has been processed.', 'unread', '2025-02-24 13:16:11'),
(2, 2, 'Your order is ready for pickup.', 'read', '2025-02-24 13:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `payment_tbl`
--

CREATE TABLE `payment_tbl` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pickupDatetime` datetime NOT NULL,
  `paymentMethod` enum('cash','credit','debit','online') NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL DEFAULT 0.00,
  `updatedDetails_id` int(11) DEFAULT NULL,
  `additionalPrice` decimal(10,2) NOT NULL DEFAULT 0.00,
  `totalPayment` decimal(10,2) NOT NULL DEFAULT 0.00,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_tbl`
--

INSERT INTO `payment_tbl` (`payment_id`, `order_id`, `pickupDatetime`, `paymentMethod`, `totalPrice`, `updatedDetails_id`, `additionalPrice`, `totalPayment`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2025-02-25 10:00:00', 'cash', 60.00, NULL, 0.00, 60.00, '2025-02-24 13:16:56', '2025-02-24 13:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `washload_tbl`
--

CREATE TABLE `washload_tbl` (
  `washLoad_id` int(11) NOT NULL,
  `size` enum('small','medium','large') NOT NULL,
  `intensity` enum('light','medium','heavy') NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `washload_tbl`
--

INSERT INTO `washload_tbl` (`washLoad_id`, `size`, `intensity`, `description`, `price`) VALUES
(1, 'small', 'light', '1 Wash, 1 Rinse, 1 Spin. Total 21 minutes', 60),
(2, 'medium', 'light', '1 Wash, 1 Rinse, 1 Spin. Total 21 minutes', 85),
(3, 'large', 'light', '1 Wash, 1 Rinse, 1 Spin. Total 21 minutes', 120),
(4, 'small', 'medium', '1 Wash, 2 Rinse, 1 Spin. Total 28 minutes', 70),
(5, 'medium', 'medium', '1 Wash, 2 Rinse, 1 Spin. Total 28 minutes', 95),
(6, 'large', 'medium', '1 Wash, 2 Rinse, 1 Spin. Total 28 minutes', 130),
(7, 'small', 'heavy', '2 Wash, 2 Rinse, 1 Spin. Total 33 minutes', 80),
(8, 'medium', 'heavy', '2 Wash, 2 Rinse, 1 Spin. Total 33 minutes', 105),
(9, 'large', 'heavy', '2 Wash, 2 Rinse, 1 Spin. Total 33 minutes', 140);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_tbl`
--
ALTER TABLE `customer_tbl`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `contactEmail` (`contactEmail`);

--
-- Indexes for table `dryload_tbl`
--
ALTER TABLE `dryload_tbl`
  ADD PRIMARY KEY (`dryLoad_id`);

--
-- Indexes for table `laundrydetails_tbl`
--
ALTER TABLE `laundrydetails_tbl`
  ADD PRIMARY KEY (`details_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `washLoad_id` (`washLoad_id`),
  ADD KEY `dryLoad_id` (`dryLoad_id`);

--
-- Indexes for table `laundryorderstatus_tbl`
--
ALTER TABLE `laundryorderstatus_tbl`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `laundryorder_tbl`
--
ALTER TABLE `laundryorder_tbl`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `details_id` (`details_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `laundryservice_tbl`
--
ALTER TABLE `laundryservice_tbl`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `login_tbl`
--
ALTER TABLE `login_tbl`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `contactEmail` (`contactEmail`);

--
-- Indexes for table `notifications_tbl`
--
ALTER TABLE `notifications_tbl`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `updatedDetails_id` (`updatedDetails_id`);

--
-- Indexes for table `washload_tbl`
--
ALTER TABLE `washload_tbl`
  ADD PRIMARY KEY (`washLoad_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_tbl`
--
ALTER TABLE `customer_tbl`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dryload_tbl`
--
ALTER TABLE `dryload_tbl`
  MODIFY `dryLoad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `laundrydetails_tbl`
--
ALTER TABLE `laundrydetails_tbl`
  MODIFY `details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `laundryorderstatus_tbl`
--
ALTER TABLE `laundryorderstatus_tbl`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `laundryorder_tbl`
--
ALTER TABLE `laundryorder_tbl`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `laundryservice_tbl`
--
ALTER TABLE `laundryservice_tbl`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications_tbl`
--
ALTER TABLE `notifications_tbl`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `washload_tbl`
--
ALTER TABLE `washload_tbl`
  MODIFY `washLoad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laundrydetails_tbl`
--
ALTER TABLE `laundrydetails_tbl`
  ADD CONSTRAINT `laundrydetails_tbl_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `laundryservice_tbl` (`service_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundrydetails_tbl_ibfk_2` FOREIGN KEY (`washLoad_id`) REFERENCES `washload_tbl` (`washLoad_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundrydetails_tbl_ibfk_3` FOREIGN KEY (`dryLoad_id`) REFERENCES `dryload_tbl` (`dryLoad_id`) ON DELETE CASCADE;

--
-- Constraints for table `laundryorder_tbl`
--
ALTER TABLE `laundryorder_tbl`
  ADD CONSTRAINT `laundryorder_tbl_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundryorder_tbl_ibfk_2` FOREIGN KEY (`details_id`) REFERENCES `laundrydetails_tbl` (`details_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundryorder_tbl_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `laundryorderstatus_tbl` (`status_id`) ON DELETE CASCADE;

--
-- Constraints for table `login_tbl`
--
ALTER TABLE `login_tbl`
  ADD CONSTRAINT `login_tbl_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications_tbl`
--
ALTER TABLE `notifications_tbl`
  ADD CONSTRAINT `notifications_tbl_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  ADD CONSTRAINT `payment_tbl_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundryorder_tbl` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_tbl_ibfk_2` FOREIGN KEY (`updatedDetails_id`) REFERENCES `laundrydetails_tbl` (`details_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
