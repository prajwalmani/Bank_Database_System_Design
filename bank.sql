-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2021 at 05:59 AM
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
(1, 5000, '2021-12-05', 's', NULL, NULL, '1234', 1);

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
  `address` text NOT NULL,
  `manager` varchar(50) NOT NULL,
  `asstmanager` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `checking`
--

CREATE TABLE `checking` (
  `checkingaccount#` varchar(50) NOT NULL,
  `overdrafted_amount` varchar(50) NOT NULL,
  `overdrafted_account` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CSSN` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Apratment#` int(5) NOT NULL,
  `Street#` int(5) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` text NOT NULL,
  `Zipcode` int(11) NOT NULL,
  `PersonalBanker_ESSN` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CSSN`, `Name`, `Apratment#`, `Street#`, `City`, `State`, `Zipcode`, `PersonalBanker_ESSN`) VALUES
('1234', 'Hinata', 2, 322, 'Newark', 'NJ', 1786, '123');

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
('123', 'Naruto', 123, '2021-11-01', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan#` varchar(50) NOT NULL,
  `Amount` int(50) NOT NULL,
  `Repayment_amount` int(50) NOT NULL,
  `interset_rate` int(5) NOT NULL DEFAULT 0,
  `account#` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `moneymarket`
--

CREATE TABLE `moneymarket` (
  `marketaccount#` varchar(50) NOT NULL,
  `updated_date` date NOT NULL,
  `market_interset_rate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `savingsaccount` varchar(50) NOT NULL,
  `last_accessed_data` date NOT NULL,
  `savings_interset_rate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`savingsaccount`, `last_accessed_data`, `savings_interset_rate`) VALUES
('1', '2021-12-05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transcation`
--

CREATE TABLE `transcation` (
  `transactionid` varchar(50) NOT NULL,
  `tname` varchar(50) NOT NULL,
  `taccount` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `fees` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transct`
--

CREATE TABLE `transct` (
  `transactionid` varchar(50) NOT NULL,
  `account#` varchar(50) NOT NULL,
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
  ADD PRIMARY KEY (`account`);

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
-- Indexes for table `checking`
--
ALTER TABLE `checking`
  ADD PRIMARY KEY (`checkingaccount#`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CSSN`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ESSN`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan#`);

--
-- Indexes for table `moneymarket`
--
ALTER TABLE `moneymarket`
  ADD PRIMARY KEY (`marketaccount#`);

--
-- Indexes for table `transcation`
--
ALTER TABLE `transcation`
  ADD PRIMARY KEY (`transactionid`);

--
-- Indexes for table `transct`
--
ALTER TABLE `transct`
  ADD PRIMARY KEY (`transactionid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;