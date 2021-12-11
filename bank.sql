-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2021 at 05:14 PM
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
  `cssn` varchar(10) NOT NULL,
  `Branch_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account`, `balance`, `last_accessed_date`, `account_type`, `intereset_overdraft`, `cssn`, `Branch_id`) VALUES
(1, 6015, '2021-12-05', 's', NULL, '1234', 1),
(2, 2490, '2021-12-07', 'c', NULL, '1235', 2),
(3, 5990, '2021-12-07', 'c', NULL, '1234', 1),
(4, 590, '2021-12-09', 'm', 8, '1', 1),
(5, 590, '2021-12-11', 's', 0, '1', 1),
(6, 690, '2021-12-11', 's', 0, '1', 1),
(7, 790, '2021-12-11', 'c', 0, '1235', 1),
(8, 790, '2021-12-11', 'm', 8, '1235', 1),
(9, 14990, '2021-12-11', 'l', 9, '1235', 1);

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
('hinata@gmail.com', '1234', '1234'),
('naruto@gmail.com', '123', '123');

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

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchid`, `bname`, `address`, `manager`, `asstmanager`) VALUES
(1, 'Cliffside Park Branch', '757 Palisade Avenue\r\n\r\nCliffside Park, NJ 07010', '', ''),
(2, 'Fair Lawn Branch', '33-11 Broadway\r\nFair Lawn, NJ 07410', '', ''),
(3, 'Garfield Branch', '369 Lanza Avenue\r\nGarfield, NJ 07026', '', ''),
(4, 'Lyndhurst Branch', '307 Stuyvesant Avenue\r\nLyndhurst, NJ 07071', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `checking`
--

CREATE TABLE `checking` (
  `checkingaccount` varchar(50) NOT NULL,
  `overdrafted_amount` varchar(50) NOT NULL,
  `overdrafted_account` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checking`
--

INSERT INTO `checking` (`checkingaccount`, `overdrafted_amount`, `overdrafted_account`, `date`) VALUES
('3', '0', '4', '2021-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CSSN` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Apartment` int(5) NOT NULL,
  `Street` int(5) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` text NOT NULL,
  `Zipcode` int(11) NOT NULL,
  `PersonalBanker_ESSN` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CSSN`, `Name`, `Apartment`, `Street`, `City`, `State`, `Zipcode`, `PersonalBanker_ESSN`) VALUES
('1234', 'Hinata', 2, 322, 'Newark', 'NJ', 1786, '123'),
('123412341', 'john henriques', 4, 2, 'newark', 'new jersey', 7045, '124'),
('1235', 'Nanami', 6, 3, 'Harrison', 'New Jersey', 7029, ''),
('1236', 'Will Smith', 4, 5, 'new york', 'New york', 8045, '12345'),
('1237', 'Hannah', 4, 4, 'Garfield', 'Baltimore', 8079, ''),
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
('124', 'Pranav', 1483092345, '2019-11-13', 2, 'Hima', 1, '123'),
('125', 'Ross', 1234512345, '2020-12-07', 1, 'Rachel', 2, NULL),
('126', 'Shelly', 1212121212, '2018-12-07', 3, 'Abhy', 2, '125');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan` varchar(50) NOT NULL,
  `Amount` int(50) NOT NULL,
  `Repayment_amount` int(50) NOT NULL,
  `interset_rate` int(5) NOT NULL DEFAULT 0,
  `account` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan`, `Amount`, `Repayment_amount`, `interset_rate`, `account`) VALUES
('9', 15000, 0, 9, '2');

-- --------------------------------------------------------

--
-- Table structure for table `moneymarket`
--

CREATE TABLE `moneymarket` (
  `marketaccount` varchar(50) NOT NULL,
  `updated_date` date NOT NULL,
  `market_interset_rate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `moneymarket`
--

INSERT INTO `moneymarket` (`marketaccount`, `updated_date`, `market_interset_rate`) VALUES
('8', '2021-12-11', 8);

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `savingsaccount` varchar(50) NOT NULL,
  `last_accessed_date` date NOT NULL,
  `savings_interset_rate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`savingsaccount`, `last_accessed_date`, `savings_interset_rate`) VALUES
('1', '2021-12-05', 0),
('5', '2021-12-11', 0),
('6', '2021-12-11', 0),
('6', '2021-12-11', 0);

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
  `account` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `tname` varchar(50) NOT NULL,
  `amount` int(50) NOT NULL,
  `balance` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transct`
--

INSERT INTO `transct` (`transactionid`, `account`, `type`, `tname`, `amount`, `balance`, `time`) VALUES
('0e42d42c-5a93-11ec-ae58-dcfb48bb13bc', '1', 'CSD', 'Cash Deposit', 500, 5525, '2021-12-11 20:00:18'),
('27d63c40-5a96-11ec-8f4f-dcfb48bb13bc', '1', 'SC', 'Service Charge', 10, 6015, '2021-12-11 20:22:30'),
('27d8fb5e-5a96-11ec-acfa-dcfb48bb13bc', '2', 'SC', 'Service Charge', 10, 2490, '2021-12-11 20:22:30'),
('27dffb5c-5a96-11ec-9ae0-dcfb48bb13bc', '3', 'SC', 'Service Charge', 10, 5990, '2021-12-11 20:22:30'),
('27e371e4-5a96-11ec-b0b3-dcfb48bb13bc', '4', 'SC', 'Service Charge', 10, 590, '2021-12-11 20:22:30'),
('27ea441a-5a96-11ec-b927-dcfb48bb13bc', '5', 'SC', 'Service Charge', 10, 590, '2021-12-11 20:22:30'),
('27edc2f6-5a96-11ec-88e5-dcfb48bb13bc', '6', 'SC', 'Service Charge', 10, 690, '2021-12-11 20:22:30'),
('27f2e7a8-5a96-11ec-b900-dcfb48bb13bc', '7', 'SC', 'Service Charge', 10, 790, '2021-12-11 20:22:30'),
('27f69358-5a96-11ec-9b84-dcfb48bb13bc', '8', 'SC', 'Service Charge', 10, 790, '2021-12-11 20:22:30'),
('27fa0e42-5a96-11ec-8bc1-dcfb48bb13bc', '9', 'SC', 'Service Charge', 10, 14990, '2021-12-11 20:22:30'),
('28f1be62-5893-11ec-9b0a-98e74301e279', '1', 'CSD', 'Cash Deposit', 50, 5050, '2021-12-09 06:56:01'),
('33d71446-589b-11ec-b070-98e74301e279', '1', 'CSD', 'Cash Deposit', 25, 5025, '2021-12-09 07:53:35'),
('34d0fe54-5a93-11ec-8348-dcfb48bb13bc', '1', 'CSD', 'Cash Deposit', 500, 6025, '2021-12-11 20:01:23'),
('7f4ba4b8-5a92-11ec-afef-dcfb48bb13bc', '1', 'MW', 'Money Withdraw', 500, 4525, '2021-12-11 19:56:18'),
('99832248-5a92-11ec-8cb3-dcfb48bb13bc', '1', 'CSD', 'Cash Deposit', 500, 5025, '2021-12-11 19:57:02');

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
  ADD PRIMARY KEY (`checkingaccount`);

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
  ADD PRIMARY KEY (`loan`);

--
-- Indexes for table `moneymarket`
--
ALTER TABLE `moneymarket`
  ADD PRIMARY KEY (`marketaccount`);

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
