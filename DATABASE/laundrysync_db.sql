-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 04:00 PM
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
-- Table structure for table `additionalpayment_tbl`
--

CREATE TABLE `additionalpayment_tbl` (
  `addcharges_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `prev_wash_size_id` int(11) DEFAULT NULL,
  `new_wash_size_id` int(11) DEFAULT NULL,
  `prev_dry_size_id` int(11) DEFAULT NULL,
  `new_dry_size_id` int(11) DEFAULT NULL,
  `additional_fee` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `additionalpayment_tbl`
--

INSERT INTO `additionalpayment_tbl` (`addcharges_id`, `order_id`, `prev_wash_size_id`, `new_wash_size_id`, `prev_dry_size_id`, `new_dry_size_id`, `additional_fee`) VALUES
(1, 1, 1, 2, 1, 2, 5),
(2, 2, 2, 3, 2, 3, 7),
(3, 3, 1, 3, 1, 2, 10),
(4, 4, 2, 2, 1, 3, 6.5),
(5, 5, 1, 2, 2, 2, 5.75);

-- --------------------------------------------------------

--
-- Table structure for table `customer_tbl`
--

CREATE TABLE `customer_tbl` (
  `customer_id` int(11) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `mName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) NOT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `contactEmail` varchar(100) NOT NULL,
  `contactNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_tbl`
--

INSERT INTO `customer_tbl` (`customer_id`, `fName`, `mName`, `lName`, `suffix`, `unit`, `street`, `barangay`, `city`, `region`, `country`, `zipcode`, `contactEmail`, `contactNumber`) VALUES
(1, 'John', 'A', 'Doe', 'Jr.', 'Unit 101', 'Main St', 'Barangay 1', 'City A', 'Region X', 'Country Y', '12345', 'john.doe@example.com', '09123456789'),
(2, 'Jane', 'B', 'Smith', NULL, 'Unit 202', 'Second St', 'Barangay 2', 'City B', 'Region Y', 'Country Z', '54321', 'jane.smith@example.com', '09234567890'),
(3, 'Alice', NULL, 'Johnson', 'Sr.', 'Unit 303', 'Third St', 'Barangay 3', 'City C', 'Region Z', 'Country Y', '67890', 'alice.johnson@example.com', '09345678901'),
(4, 'Bob', 'C', 'Taylor', NULL, 'Unit 404', 'Fourth St', 'Barangay 4', 'City D', 'Region X', 'Country Z', '98765', 'bob.taylor@example.com', '09456789012'),
(5, 'Charlie', NULL, 'Brown', 'III', 'Unit 505', 'Fifth St', 'Barangay 5', 'City E', 'Region Y', 'Country X', '34567', 'charlie.brown@example.com', '09567890123');

-- --------------------------------------------------------

--
-- Table structure for table `dryintensity_tbl`
--

CREATE TABLE `dryintensity_tbl` (
  `dryIntensity_id` int(11) NOT NULL,
  `intensity` enum('express','extra','extreme') NOT NULL,
  `fixed_price` float NOT NULL,
  `dryIntDesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dryintensity_tbl`
--

INSERT INTO `dryintensity_tbl` (`dryIntensity_id`, `intensity`, `fixed_price`, `dryIntDesc`) VALUES
(1, 'express', 5, 'Express dry in 30 minutes'),
(2, 'extra', 7, 'Extra dry for thicker fabrics'),
(3, 'extreme', 10, 'Extreme dry for heavy loads');

-- --------------------------------------------------------

--
-- Table structure for table `dryload_tbl`
--

CREATE TABLE `dryload_tbl` (
  `drySize_id` int(11) NOT NULL,
  `size` enum('small','medium','large') NOT NULL,
  `fixed_price` float NOT NULL,
  `drySizeDesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dryload_tbl`
--

INSERT INTO `dryload_tbl` (`drySize_id`, `size`, `fixed_price`, `drySizeDesc`) VALUES
(1, 'small', 5, 'Small load up to 5kg'),
(2, 'medium', 7, 'Medium load up to 10kg'),
(3, 'large', 10, 'Large load above 10kg');

-- --------------------------------------------------------

--
-- Table structure for table `laundrydetails_tbl`
--

CREATE TABLE `laundrydetails_tbl` (
  `details_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `washIntensity_id` int(11) DEFAULT NULL,
  `washSize_id` int(11) DEFAULT NULL,
  `dryIntensity_id` int(11) DEFAULT NULL,
  `drySize_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundrydetails_tbl`
--

INSERT INTO `laundrydetails_tbl` (`details_id`, `service_id`, `washIntensity_id`, `washSize_id`, `dryIntensity_id`, `drySize_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, NULL, NULL),
(3, 3, NULL, NULL, 3, 3),
(4, 1, 1, 3, 1, 3),
(5, 2, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laundryorderstatus_tbl`
--

CREATE TABLE `laundryorderstatus_tbl` (
  `status_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('pending','inProgress_washing','inProgress_drying','pending_addFee','pickupReady','completed','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundryorderstatus_tbl`
--

INSERT INTO `laundryorderstatus_tbl` (`status_id`, `customer_id`, `updated_at`, `status`) VALUES
(1, 1, '2025-02-16 11:15:50', 'pending'),
(2, 2, '2025-02-16 14:02:32', 'inProgress_washing'),
(3, 3, '2025-02-16 14:02:32', 'inProgress_drying'),
(4, 4, '2025-02-16 14:02:32', 'completed'),
(5, 5, '2025-02-16 14:02:32', 'cancelled');

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
(1, 1, 1, 1, '2025-02-16'),
(2, 2, 2, 2, '2025-02-16'),
(3, 3, 3, 3, '2025-02-16'),
(4, 4, 1, 4, '2025-02-16'),
(5, 5, 2, 5, '2025-02-16');

-- --------------------------------------------------------

--
-- Table structure for table `laundryservice_tbl`
--

CREATE TABLE `laundryservice_tbl` (
  `service_id` int(11) NOT NULL,
  `washing` enum('yes','no') NOT NULL,
  `drying` enum('yes','no') NOT NULL,
  `serviceDesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundryservice_tbl`
--

INSERT INTO `laundryservice_tbl` (`service_id`, `washing`, `drying`, `serviceDesc`) VALUES
(1, 'yes', 'yes', 'Full service wash and dry'),
(2, 'yes', 'no', 'Wash only service'),
(3, 'no', 'yes', 'Dry only service');

-- --------------------------------------------------------

--
-- Table structure for table `login_tbl`
--

CREATE TABLE `login_tbl` (
  `customer_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_tbl`
--

INSERT INTO `login_tbl` (`customer_id`, `email`, `password`) VALUES
(1, 'john.doe@example.com', 'hashedpassword123'),
(2, 'jane.smith@example.com', 'hashedpassword456'),
(3, 'alice.johnson@example.com', 'hashedpassword789'),
(4, 'bob.taylor@example.com', 'hashedpassword012'),
(5, 'charlie.brown@example.com', 'hashedpassword345');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_tbl`
--

CREATE TABLE `notifications_tbl` (
  `notification_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications_tbl`
--

INSERT INTO `notifications_tbl` (`notification_id`, `customer_id`, `created_at`, `message`) VALUES
(1, 1, '2025-02-16 19:14:19', 'Your order is ready for pickup.'),
(2, 2, '2025-02-16 22:02:16', 'Order is being processed.'),
(3, 3, '2025-02-16 22:02:16', 'Payment received.'),
(4, 4, '2025-02-16 22:02:16', 'Order completed successfully.'),
(5, 5, '2025-02-16 22:02:16', 'New order placed.');

-- --------------------------------------------------------

--
-- Table structure for table `payment_tbl`
--

CREATE TABLE `payment_tbl` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pickup_datetime` datetime NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` enum('cash','online') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_tbl`
--

INSERT INTO `payment_tbl` (`payment_id`, `order_id`, `pickup_datetime`, `payment_date`, `payment_method`) VALUES
(1, 1, '2025-02-16 22:06:30', '2025-02-16', 'cash'),
(2, 2, '2025-02-16 22:06:50', '2025-02-16', 'online'),
(3, 3, '2025-02-16 22:06:50', '2025-02-16', 'cash'),
(4, 4, '2025-02-16 22:06:50', '2025-02-16', 'online'),
(5, 5, '2025-02-16 22:06:50', '2025-02-16', 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `washintensity_tbl`
--

CREATE TABLE `washintensity_tbl` (
  `washIntensity_id` int(11) NOT NULL,
  `intensity` enum('light','medium','heavy') NOT NULL,
  `fixed_price` float NOT NULL,
  `washIntDesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `washintensity_tbl`
--

INSERT INTO `washintensity_tbl` (`washIntensity_id`, `intensity`, `fixed_price`, `washIntDesc`) VALUES
(1, 'light', 5, 'Light wash for delicate items'),
(2, 'medium', 7, 'Medium wash for regular items'),
(3, 'heavy', 10, 'Heavy wash for tough stains');

-- --------------------------------------------------------

--
-- Table structure for table `washload_tbl`
--

CREATE TABLE `washload_tbl` (
  `washSize_id` int(11) NOT NULL,
  `size` enum('small','medium','large') NOT NULL,
  `fixed_price` float NOT NULL,
  `washSizeDesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `washload_tbl`
--

INSERT INTO `washload_tbl` (`washSize_id`, `size`, `fixed_price`, `washSizeDesc`) VALUES
(1, 'small', 5, 'Small load up to 5kg'),
(2, 'medium', 7, 'Medium load up to 10kg'),
(3, 'large', 10, 'Large load above 10kg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additionalpayment_tbl`
--
ALTER TABLE `additionalpayment_tbl`
  ADD PRIMARY KEY (`addcharges_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `prev_wash_size_id` (`prev_wash_size_id`),
  ADD KEY `new_wash_size_id` (`new_wash_size_id`),
  ADD KEY `prev_dry_size_id` (`prev_dry_size_id`),
  ADD KEY `new_dry_size_id` (`new_dry_size_id`);

--
-- Indexes for table `customer_tbl`
--
ALTER TABLE `customer_tbl`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `dryintensity_tbl`
--
ALTER TABLE `dryintensity_tbl`
  ADD PRIMARY KEY (`dryIntensity_id`);

--
-- Indexes for table `dryload_tbl`
--
ALTER TABLE `dryload_tbl`
  ADD PRIMARY KEY (`drySize_id`);

--
-- Indexes for table `laundrydetails_tbl`
--
ALTER TABLE `laundrydetails_tbl`
  ADD PRIMARY KEY (`details_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `washIntensity_id` (`washIntensity_id`),
  ADD KEY `washSize_id` (`washSize_id`),
  ADD KEY `dryIntensity_id` (`dryIntensity_id`),
  ADD KEY `drySize_id` (`drySize_id`);

--
-- Indexes for table `laundryorderstatus_tbl`
--
ALTER TABLE `laundryorderstatus_tbl`
  ADD PRIMARY KEY (`status_id`),
  ADD KEY `customer_id` (`customer_id`);

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
  ADD UNIQUE KEY `email` (`email`);

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
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `washintensity_tbl`
--
ALTER TABLE `washintensity_tbl`
  ADD PRIMARY KEY (`washIntensity_id`);

--
-- Indexes for table `washload_tbl`
--
ALTER TABLE `washload_tbl`
  ADD PRIMARY KEY (`washSize_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additionalpayment_tbl`
--
ALTER TABLE `additionalpayment_tbl`
  MODIFY `addcharges_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dryintensity_tbl`
--
ALTER TABLE `dryintensity_tbl`
  MODIFY `dryIntensity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dryload_tbl`
--
ALTER TABLE `dryload_tbl`
  MODIFY `drySize_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `laundrydetails_tbl`
--
ALTER TABLE `laundrydetails_tbl`
  MODIFY `details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `laundryorderstatus_tbl`
--
ALTER TABLE `laundryorderstatus_tbl`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `laundryorder_tbl`
--
ALTER TABLE `laundryorder_tbl`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `laundryservice_tbl`
--
ALTER TABLE `laundryservice_tbl`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications_tbl`
--
ALTER TABLE `notifications_tbl`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `washintensity_tbl`
--
ALTER TABLE `washintensity_tbl`
  MODIFY `washIntensity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `washload_tbl`
--
ALTER TABLE `washload_tbl`
  MODIFY `washSize_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additionalpayment_tbl`
--
ALTER TABLE `additionalpayment_tbl`
  ADD CONSTRAINT `additionalpayment_tbl_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundryorder_tbl` (`order_id`),
  ADD CONSTRAINT `additionalpayment_tbl_ibfk_2` FOREIGN KEY (`prev_wash_size_id`) REFERENCES `washload_tbl` (`washSize_id`),
  ADD CONSTRAINT `additionalpayment_tbl_ibfk_3` FOREIGN KEY (`new_wash_size_id`) REFERENCES `washload_tbl` (`washSize_id`),
  ADD CONSTRAINT `additionalpayment_tbl_ibfk_4` FOREIGN KEY (`prev_dry_size_id`) REFERENCES `dryload_tbl` (`drySize_id`),
  ADD CONSTRAINT `additionalpayment_tbl_ibfk_5` FOREIGN KEY (`new_dry_size_id`) REFERENCES `dryload_tbl` (`drySize_id`);

--
-- Constraints for table `laundrydetails_tbl`
--
ALTER TABLE `laundrydetails_tbl`
  ADD CONSTRAINT `laundrydetails_tbl_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `laundryservice_tbl` (`service_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundrydetails_tbl_ibfk_2` FOREIGN KEY (`washIntensity_id`) REFERENCES `washintensity_tbl` (`washIntensity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundrydetails_tbl_ibfk_3` FOREIGN KEY (`washSize_id`) REFERENCES `washload_tbl` (`washSize_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundrydetails_tbl_ibfk_4` FOREIGN KEY (`dryIntensity_id`) REFERENCES `dryintensity_tbl` (`dryIntensity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundrydetails_tbl_ibfk_5` FOREIGN KEY (`drySize_id`) REFERENCES `dryload_tbl` (`drySize_id`) ON DELETE CASCADE;

--
-- Constraints for table `laundryorderstatus_tbl`
--
ALTER TABLE `laundryorderstatus_tbl`
  ADD CONSTRAINT `laundryorderstatus_tbl_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`customer_id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `payment_tbl_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundryorder_tbl` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
