-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2024 at 12:05 PM
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
-- Database: `wpl_mini project`
--

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `Passenger_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `PNR` int(11) NOT NULL,
  `Seat_no` int(11) NOT NULL,
  `Train_ID` int(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `Contact` varchar(20) NOT NULL,
  `Gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`Passenger_ID`, `Name`, `PNR`, `Seat_no`, `Train_ID`, `Email`, `Password`, `Age`, `Contact`, `Gender`) VALUES
(1, 'Amit Kumar', 123456789, 25, 1, 'amit@example.com', 'password123', 30, '9876543210', 'Male'),
(2, 'Priya Sharma', 234567890, 12, 2, 'priya@example.com', 'pass123', 25, '9876543211', 'Female'),
(3, 'Ravi Singh', 345678901, 8, 3, 'ravi@example.com', 'ravi123', 35, '9876543212', 'Male'),
(4, 'Neha Gupta', 456789012, 15, 4, 'neha@example.com', 'pass456', 28, '9876543213', 'Female'),
(5, 'Sanjay Patel', 567890123, 30, 5, 'sanjay@example.com', 'sanjay123', 40, '9876543214', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Ticket_ID` int(11) NOT NULL,
  `Passenger_ID` int(11) DEFAULT NULL,
  `Train_ID` int(11) DEFAULT NULL,
  `Booking_Date` date NOT NULL,
  `Fare` decimal(10,2) NOT NULL,
  `Status` enum('booked','cancelled') NOT NULL DEFAULT 'booked',
  `PNR_Status` enum('confirmed','waiting') NOT NULL DEFAULT 'confirmed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`Ticket_ID`, `Passenger_ID`, `Train_ID`, `Booking_Date`, `Fare`, `Status`, `PNR_Status`) VALUES
(1, 1, 1, '2024-02-25', 500.00, 'booked', 'confirmed'),
(2, 2, 2, '2024-02-26', 750.00, 'booked', 'confirmed'),
(3, 3, 3, '2024-02-27', 600.00, 'booked', 'waiting'),
(4, 4, 4, '2024-02-28', 700.00, 'booked', 'confirmed'),
(5, 5, 5, '2024-02-29', 800.00, 'booked', 'waiting');

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_ID` int(11) NOT NULL,
  `Train_Name` varchar(100) NOT NULL,
  `Departure_Station` varchar(100) NOT NULL,
  `Destination_Station` varchar(100) NOT NULL,
  `Departure_Time` time NOT NULL,
  `Arrival_Time` time NOT NULL,
  `Total_Seats` int(11) NOT NULL,
  `Available_Seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`Train_ID`, `Train_Name`, `Departure_Station`, `Destination_Station`, `Departure_Time`, `Arrival_Time`, `Total_Seats`, `Available_Seats`) VALUES
(1, 'Rajdhani Express', 'Mumbai', 'Delhi', '08:00:00', '20:00:00', 100, 3),
(2, 'Shatabdi Express', 'Delhi', 'Chennai', '09:00:00', '18:00:00', 120, 11),
(3, 'Duronto Express', 'Kolkata', 'Mumbai', '10:00:00', '22:00:00', 80, 6),
(4, 'Gatimaan Express', 'Delhi', 'Agra', '07:00:00', '09:00:00', 150, 4),
(5, 'Humsafar Express', 'Chennai', 'Hyderabad', '11:00:00', '15:00:00', 200, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Role` enum('admin','customer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `Username`, `Password`, `Email`, `First_Name`, `Last_Name`, `Phone_Number`, `Address`, `Role`) VALUES
(1, 'admin01', 'admin@123', 'admin@example.com', 'Admin', 'User', '9876543215', '123 Admin St, City', 'admin'),
(2, 'user01', 'user@123', 'user@example.com', 'Regular', 'User', '9876543216', '456 User St, City', 'customer'),
(3, 'user02', 'pass@word', 'user2@example.com', 'John', 'Doe', '9876543217', '789 User St, City', 'customer'),
(4, 'user03', 'password123', 'user3@example.com', 'Jane', 'Doe', '9876543218', '1011 User St, City', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`Passenger_ID`),
  ADD KEY `Train_ID` (`Train_ID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Ticket_ID`),
  ADD KEY `Passenger_ID` (`Passenger_ID`),
  ADD KEY `Train_ID` (`Train_ID`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`Train_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `Passenger_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `Ticket_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `train`
--
ALTER TABLE `train`
  MODIFY `Train_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_ID`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
