-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2021 at 06:52 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'Grp9', '$2y$10$NeveOjOqDoll8dK8jGKl8uVhPDL7GWwGuIBnzbnTvwmWpXfUOwBaa', 'SSH', 'Group', 'male.png', '2018-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `status` int(1) NOT NULL,
  `time_out` time NOT NULL,
  `num_hr` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `time_in`, `status`, `time_out`, `num_hr`) VALUES
(113, 1, '2021-02-16', '10:00:00', 1, '17:32:31', 6.5333333333333),
(114, 2, '2021-02-27', '11:38:29', 0, '11:38:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cashadvance`
--

CREATE TABLE `cashadvance` (
  `id` int(11) NOT NULL,
  `date_advance` date NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashadvance`
--

INSERT INTO `cashadvance` (`id`, `date_advance`, `employee_id`, `amount`) VALUES
(2, '2018-05-02', '1', 1000),
(3, '2018-05-02', '1', 1000),
(4, '2018-07-12', '5', 3500);

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `description`, `amount`) VALUES
(2, 'Professional Tax', 200),
(3, 'Provident Fund', 1000),
(4, 'Mediclaim', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `employeelogin`
--

CREATE TABLE `employeelogin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employeelogin`
--

INSERT INTO `employeelogin` (`username`, `password`) VALUES
('ALB590623481', '020'),
('HSP067892134', '016'),
('PGX413705682', '010'),
('VFT157620348', '019'),
('ZTC714069832', '018');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `vehicle_number` varchar(20) NOT NULL,
  `model` varchar(20) NOT NULL,
  `allotted_area` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `birthdate` date NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `position_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_id`, `firstname`, `lastname`, `vehicle_number`, `model`, `allotted_area`, `address`, `birthdate`, `contact_info`, `gender`, `position_id`, `schedule_id`, `photo`, `created_on`) VALUES
(1, 'XRF342608719', 'Varsha', 'Sawant', 'MH07-GC-5014', 'Activa', 'Thane', 'Badlapur', '1982-02-02', '8467067344', 'Female', 3, 4, 'profile.jpg', '2020-07-11'),
(2, 'LVO541238690', 'Sanjeev', 'Sharma', '', '', '', 'Mumbai', '1979-09-11', '9632145655', 'Male', 4, 2, 'profile.jpg', '2020-07-11'),
(3, 'DYE473869250', 'Priyanka', 'Antony', '', '', '', 'Mumbai', '1992-05-02', '8850241786', 'Female', 2, 1, '', '2020-09-30'),
(4, 'JIE625973480', 'Sayali', 'Jain', '', '', '', 'Carmen, Bohol', '1990-10-02', '09468029840', 'Female', 2, 2, '', '2020-09-30'),
(5, 'GYZ709462513', 'Pinky', 'Nair', '', '', '', 'Thane', '1989-05-13', '9847152367', 'Female', 2, 1, '', '2020-10-11'),
(6, 'EDQ203874591', 'Vinod', 'Naik', '', '', '', 'Thane', '1991-07-25', '9876543210', 'Male', 2, 1, 'male.png', '2020-10-11'),
(7, 'TWY781946302', 'John', 'Watson', '', '', '', 'Mumbai', '1993-07-11', '8467067344', 'Male', 4, 2, 'profile.jpg', '2020-11-11'),
(8, 'GWZ071342865', 'Varun', 'Panchal', '', '', '', 'Navi Mumbai', '1994-07-19', '9876543210', 'Male', 2, 2, 'profile.jpg', '2020-12-11'),
(9, 'HEL079321846', 'Allen', 'Seqeria', '', '', '', 'St12 N1', '1995-07-18', '9454578965', 'Male', 2, 2, 'profile.jpg', '2020-12-16'),
(10, 'OCN273564901', 'Ashwin', 'Nadar', '', '', '', 'Navi mumbai', '1991-07-25', '9857412369', 'Male', 4, 3, 'profile.jpg', '2020-12-16'),
(11, 'PGX413705682', 'Venkat ', 'Subramaniam', 'NA', 'Tata  Hopper Tipper', 'Mumbai', 'Kochin', '1974-07-19', '8467067344', 'Male', 1, 3, 'profile.jpg', '2021-01-11'),
(12, 'YWX536478912', 'Salien', 'Illy', '', '', '', 'Banglore', '1995-07-30', '9876543210', 'Female', 3, 4, 'profile.jpg', '2021-01-11'),
(13, 'ALB590623481', 'Ramsingh', '', '', '', '', 'Lucknow', '1964-07-19', '9632145655', 'Male', 1, 3, 'female4.jpg', '2021-01-13'),
(14, 'IOV153842976', 'Meena', 'Tewatia', '', '', '', 'Jaipur', '1985-07-11', '8854578965', 'Female', 3, 4, 'profile.jpg', '2021-01-25'),
(15, 'CAB835624170', 'Karishma', 'Jain', '', '', '', 'Mumbai', '1996-07-18', '9632145655', 'Female', 4, 2, 'profile.jpg', '2021-01-31'),
(16, 'MGZ312906745', 'Sanjot', 'Rane', '', '', '', 'Navi Mumbai', '1975-02-10', '9876543210', 'Female', 3, 4, 'profile.jpg', '2021-01-31'),
(17, 'HSP067892134', 'Shyam', 'Sawant', '', '', '', 'Goa', '1975-10-24', '8467067344', 'Male', 1, 3, 'profile.jpg', '2021-02-27'),
(18, 'BVH081749563', 'Daniel', 'Sams', '', '', '', 'Noida', '1990-01-02', '7506578965', 'Male', 3, 4, 'profile.jpg', '2021-03-11'),
(19, 'ZTC714069832', 'Pravin', 'Shinde', 'NA', 'Tata  Hopper Tipper', 'Mumbai Suburbs', 'Nagpur', '1974-12-30', '0202121255', 'Male', 1, 3, 'profile.jpg', '2021-03-11'),
(20, 'VFT157620348', 'Abdul', 'Ansari', '', '', '', 'Mumbai', '1988-07-25', '9847123657', 'Male', 1, 3, 'profile.jpg', '2021-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `overtime`
--

CREATE TABLE `overtime` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `hours` double NOT NULL,
  `rate` double NOT NULL,
  `date_overtime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `overtime`
--

INSERT INTO `overtime` (`id`, `employee_id`, `hours`, `rate`, `date_overtime`) VALUES
(4, '6', 240, 1500, '2031-11-08'),
(5, '4', 283.33333333333, 3600, '2018-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `description` varchar(150) NOT NULL,
  `rate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `description`, `rate`) VALUES
(1, 'Driver', 100),
(2, 'Developer', 50),
(3, 'Marketing ', 35),
(4, 'Tester', 75);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `time_in`, `time_out`) VALUES
(1, '07:00:00', '16:00:00'),
(2, '08:00:00', '17:00:00'),
(3, '09:00:00', '18:00:00'),
(4, '10:00:00', '19:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashadvance`
--
ALTER TABLE `cashadvance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employeelogin`
--
ALTER TABLE `employeelogin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overtime`
--
ALTER TABLE `overtime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `cashadvance`
--
ALTER TABLE `cashadvance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `overtime`
--
ALTER TABLE `overtime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
