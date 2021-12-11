-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2021 at 03:33 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account` int(50) NOT NULL,
  `balance` int(15) NOT NULL,
  `last_accessed_date` date NOT NULL,
  `account_type` varchar(5) NOT NULL,
  `intereset_overdraft` int(15) DEFAULT NULL,
  `overdrafted_account` int(50) DEFAULT NULL,
  `cssn` varchar(10) NOT NULL,
  `Branch_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account`, `balance`, `last_accessed_date`, `account_type`, `intereset_overdraft`, `overdrafted_account`, `cssn`, `Branch_id`) VALUES
(1, 5000, '2021-12-05', 's', NULL, NULL, '1234', 1),
(2, 5025, '2021-12-05', 's', NULL, NULL, '1236', 1),
(3, 2500, '2021-12-07', 'c', NULL, NULL, '1236', 2),
(4, 6000, '2021-12-07', 'c', NULL, NULL, '1234', 1),
(5, 600, '2021-12-09', 'm', NULL, NULL, '5450', 1),
(6, 700, '2021-12-11', 's', NULL, NULL, '1560', 1),
(7, 800, '2021-12-11', 's', NULL, NULL, '7535', 1),
(8, 900, '2021-12-11', 'c', NULL, NULL, '1236', 1),
(9, 15000, '2021-12-11', 'm', NULL, NULL, '7535', 1),
(10, 800, '2021-12-11', 'l', NULL, NULL, '1236', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `SSN` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`email`, `password`, `SSN`) VALUES
('hinata@gmail.com', '1234', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchid` int(10) NOT NULL,
  `bname` varchar(50) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchid`, `bname`, `address`) VALUES
(1, 'Cliffside Park Branch', '757 Palisade Avenue\r\n\r\nCliffside Park, NJ 07010'),
(2, 'Fair Lawn Branch', '33-11 Broadway\r\nFair Lawn, NJ 07410'),
(3, 'Garfield Branch', '369 Lanza Avenue\r\nGarfield, NJ 07026'),
(4, 'Lyndhurst Branch', '307 Stuyvesant Avenue\r\nLyndhurst, NJ 07071');

-- --------------------------------------------------------

--
-- Table structure for table `branch_manager`
--

CREATE TABLE `branch_manager` (
  `branch_id` int(50) NOT NULL,
  `manager` varchar(50) NOT NULL,
  `asstmanager` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch_manager`
--

INSERT INTO `branch_manager` (`branch_id`, `manager`, `asstmanager`) VALUES
(1, '123', '124'),
(2, '125', '125');

-- --------------------------------------------------------

--
-- Table structure for table `checking`
--

CREATE TABLE `checking` (
  `checkingaccount` int(50) NOT NULL,
  `overdrafted_amount` varchar(50) NOT NULL,
  `overdrafted_account` int(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CSSN` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Apartment` int(5) NOT NULL,
  `Street#` int(5) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` text NOT NULL,
  `Zipcode` int(11) NOT NULL,
  `PersonalBanker_ESSN` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CSSN`, `Name`, `Apartment`, `Street#`, `City`, `State`, `Zipcode`, `PersonalBanker_ESSN`) VALUES
('1234', 'Hinata', 324, 322, 'Kearny', 'NJ', 1786, '123'),
('1236', 'Kiba', 3, 1, 'Newark', 'New York', 7029, '125'),
('1560', 'Rin', 23, 4, 'New Jersey', 'Newark', 7303, '125'),
('5450', 'Betty', 56, 3, 'San Francisco', 'Calfornia', 94016, '124'),
('7535', 'Archie', 322, 20, 'Chicago', 'Illinois', 60007, '123');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ESSN` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` int(50) NOT NULL,
  `Start_date` date NOT NULL,
  `Length_of_employment` int(5) NOT NULL,
  `Dependent_Name` varchar(50) DEFAULT NULL,
  `Branch_ID` int(10) NOT NULL,
  `Manager_SSN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ESSN`, `Name`, `Phone`, `Start_date`, `Length_of_employment`, `Dependent_Name`, `Branch_ID`, `Manager_SSN`) VALUES
('123', 'Naruto', 123, '2021-11-01', 1, NULL, 1, NULL),
('124', 'Emma', 1111111111, '2021-12-01', 6, 'Himawari', 1, '123'),
('125', 'Ross', 1234512345, '2020-12-07', 1, 'Rachel', 2, NULL),
('126', 'Shelly', 1212121212, '2018-12-07', 3, 'Abhy', 2, '125');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan` int(50) NOT NULL,
  `Amount` int(50) NOT NULL,
  `Repayment_amount` int(50) NOT NULL,
  `interset_rate` int(5) NOT NULL DEFAULT 0,
  `account#` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `moneymarket`
--

CREATE TABLE `moneymarket` (
  `marketaccount` int(50) NOT NULL,
  `updated_date` date NOT NULL,
  `market_interset_rate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `savingsaccount` int(50) NOT NULL,
  `last_accessed_data` date NOT NULL,
  `savings_interset_rate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`savingsaccount`, `last_accessed_data`, `savings_interset_rate`) VALUES
(1, '2021-12-05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transcation`
--

CREATE TABLE `transcation` (
  `transactionid` varchar(50) NOT NULL,
  `tname` varchar(50) NOT NULL,
  `taccount` int(50) NOT NULL,
  `date` date NOT NULL,
  `fees` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transct`
--

CREATE TABLE `transct` (
  `transactionid` varchar(50) NOT NULL,
  `account#` int(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `amount` int(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account`),
  ADD KEY `cssn` (`cssn`),
  ADD KEY `Branch_id` (`Branch_id`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchid`);

--
-- Indexes for table `branch_manager`
--
ALTER TABLE `branch_manager`
  ADD KEY `branch_manager_ibfk_1` (`branch_id`),
  ADD KEY `manager` (`manager`),
  ADD KEY `asstmanager` (`asstmanager`);

--
-- Indexes for table `checking`
--
ALTER TABLE `checking`
  ADD PRIMARY KEY (`checkingaccount`),
  ADD KEY `overdrafted_account` (`overdrafted_account`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CSSN`),
  ADD KEY `PersonalBanker_ESSN` (`PersonalBanker_ESSN`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ESSN`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD KEY `Manager_SSN` (`Manager_SSN`),
  ADD KEY `Branch_ID` (`Branch_ID`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan`),
  ADD KEY `account#` (`account#`);

--
-- Indexes for table `moneymarket`
--
ALTER TABLE `moneymarket`
  ADD PRIMARY KEY (`marketaccount`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD KEY `savingsaccount` (`savingsaccount`);

--
-- Indexes for table `transcation`
--
ALTER TABLE `transcation`
  ADD PRIMARY KEY (`transactionid`),
  ADD KEY `taccount` (`taccount`);

--
-- Indexes for table `transct`
--
ALTER TABLE `transct`
  ADD PRIMARY KEY (`transactionid`),
  ADD KEY `account#` (`account#`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`cssn`) REFERENCES `customer` (`CSSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`Branch_id`) REFERENCES `branch` (`branchid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_manager`
--
ALTER TABLE `branch_manager`
  ADD CONSTRAINT `branch_manager_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branchid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_manager_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `employee` (`ESSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_manager_ibfk_3` FOREIGN KEY (`asstmanager`) REFERENCES `employee` (`ESSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `checking`
--
ALTER TABLE `checking`
  ADD CONSTRAINT `checking_ibfk_1` FOREIGN KEY (`checkingaccount`) REFERENCES `account` (`account`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `checking_ibfk_2` FOREIGN KEY (`overdrafted_account`) REFERENCES `account` (`account`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`PersonalBanker_ESSN`) REFERENCES `employee` (`ESSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Manager_SSN`) REFERENCES `employee` (`ESSN`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`branchid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`loan`) REFERENCES `account` (`account`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`account#`) REFERENCES `account` (`account`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `moneymarket`
--
ALTER TABLE `moneymarket`
  ADD CONSTRAINT `moneymarket_ibfk_1` FOREIGN KEY (`marketaccount`) REFERENCES `account` (`account`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `savings`
--
ALTER TABLE `savings`
  ADD CONSTRAINT `savings_ibfk_1` FOREIGN KEY (`savingsaccount`) REFERENCES `account` (`account`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transcation`
--
ALTER TABLE `transcation`
  ADD CONSTRAINT `transcation_ibfk_1` FOREIGN KEY (`taccount`) REFERENCES `account` (`account`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transct`
--
ALTER TABLE `transct`
  ADD CONSTRAINT `transct_ibfk_1` FOREIGN KEY (`transactionid`) REFERENCES `transcation` (`transactionid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transct_ibfk_2` FOREIGN KEY (`account#`) REFERENCES `account` (`account`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
