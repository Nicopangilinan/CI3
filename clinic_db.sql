-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2024 at 07:58 AM
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
-- Database: `clinic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ape`
--

CREATE TABLE `ape` (
  `employee_id` int(11) NOT NULL,
  `ape_id` int(11) NOT NULL,
  `finding` varchar(225) NOT NULL,
  `recommendation` varchar(225) NOT NULL,
  `date_time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ape`
--

INSERT INTO `ape` (`employee_id`, `ape_id`, `finding`, `recommendation`, `date_time`) VALUES
(1, 1, 'Normal physical examination', 'Maintain healthy lifestyle, annual check-up in 12 months', '2023-12-15 10:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`) VALUES
(1),
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `medication_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `medicine` varchar(25) NOT NULL,
  `quantity` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`medication_id`, `record_id`, `medicine`, `quantity`) VALUES
(1, 1, 'Paracetamol', '5pcs'),
(2, 1, 'Mefanamic', '5pcs'),
(3, 1, 'Aspirin', '10pcs');

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `record_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `vital_id` int(11) NOT NULL,
  `chief_complaints` varchar(225) NOT NULL,
  `brief_history` varchar(225) NOT NULL,
  `findings_diagnosis` varchar(225) NOT NULL,
  `intervention` varchar(225) NOT NULL,
  `remarks` varchar(225) NOT NULL,
  `date_time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`record_id`, `employee_id`, `vital_id`, `chief_complaints`, `brief_history`, `findings_diagnosis`, `intervention`, `remarks`, `date_time`) VALUES
(1, 1, 1, 'Fever and body ache', 'No chronic illnesses reported', 'Mild flu symptoms', ' Rest and hydration advised', 'Follow-up in 2 days if symptoms persist', '2024-03-05 09:30:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `vital_signs`
--

CREATE TABLE `vital_signs` (
  `vital_id` int(11) NOT NULL,
  `temperature` varchar(11) NOT NULL,
  `pulse_rate` varchar(25) NOT NULL,
  `height` varchar(25) NOT NULL,
  `weight` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vital_signs`
--

INSERT INTO `vital_signs` (`vital_id`, `temperature`, `pulse_rate`, `height`, `weight`) VALUES
(1, '37.2 C', '78 bpm', '65 kg', '120/80 mmHg'),
(2, '36.8 C', '75 bpm', '50 kg', '118/78 mmHg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ape`
--
ALTER TABLE `ape`
  ADD PRIMARY KEY (`ape_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`medication_id`),
  ADD KEY `record_id` (`record_id`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `vital_id` (`vital_id`);

--
-- Indexes for table `vital_signs`
--
ALTER TABLE `vital_signs`
  ADD PRIMARY KEY (`vital_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ape`
--
ALTER TABLE `ape`
  MODIFY `ape_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medication`
--
ALTER TABLE `medication`
  MODIFY `medication_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vital_signs`
--
ALTER TABLE `vital_signs`
  MODIFY `vital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ape`
--
ALTER TABLE `ape`
  ADD CONSTRAINT `ape_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `medication`
--
ALTER TABLE `medication`
  ADD CONSTRAINT `medication_ibfk_3` FOREIGN KEY (`record_id`) REFERENCES `record` (`record_id`);

--
-- Constraints for table `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `record_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `record_ibfk_3` FOREIGN KEY (`vital_id`) REFERENCES `vital_signs` (`vital_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
