-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2025 at 07:24 PM
-- Server version: 8.0.41
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_platform_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `event_date` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `event_date`, `location`, `price`) VALUES
(2, 'AL HILAL VS AL MERRICK', 'Sudanese Premier League', '2025-07-12 18:00:00', ' KHARTOUM STADIUM', 40.00),
(3, 'Presedent Speach', 'victory celebrations', '2025-05-06 21:00:00', 'Green Yard', 10.00),
(4, 'IT Batch 2020 GRADUATION', 'Finally the Batch Is Out!', '2025-08-06 12:01:00', ' CAIRO', 10.00),
(5, 'WWE RAW', 'John Cena Farwell Live at Jabra hall', '2025-04-06 12:01:00', ' CAIRO', 70.00),
(6, 'boxing match', 'canelo vs tugz', '2025-02-04 17:55:00', 'arkaweet Arena', 20.00),
(7, 'WWE RAW', 'John Cena Farwell Live at Jabra hall', '2025-04-06 12:01:00', ' CAIRO', 70.00),
(8, 'WWE RAW', 'John Cena Farwell Live at Jabra hall', '2025-04-06 12:01:00', ' CAIRO', 70.00),
(9, 'boxing match', 'Sudanese Premier League', '2025-02-07 18:28:00', 'ethiopia', 7.00),
(10, 'WWE smackdown', 'batista vs triple h', '2025-02-06 16:49:00', 'bahri', 14.00),
(11, 'abdallah birthday', 'abdullah turns 22', '2025-02-19 18:22:00', 'omdurman', 10.00),
(12, 'test', 'test', '2025-02-10 20:11:00', 'test', 3.00),
(13, 'ddd', 'ddd', '2025-02-06 12:16:00', 'ddd', 3.00),
(14, 'ddd', 'ddd', '2025-02-06 12:16:00', 'ddd', 3.00),
(15, 'ddd', 'Sudanese Premier League', '2025-02-11 20:24:00', ' KHARTOUM STADIUM', 3.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentid` int NOT NULL,
  `user_id` int NOT NULL,
  `fname` varchar(50) NOT NULL,
  `payment_method` enum('Bankak','Fawry') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentid`, `user_id`, `fname`, `payment_method`, `amount`) VALUES
(1, 8, 'mo', 'Bankak', 0.00),
(2, 9, 'ali', 'Fawry', 12.00),
(3, 10, 'chips', 'Bankak', 8.00),
(4, 10, 'chips 2', 'Bankak', 1.00),
(5, 10, 'test', 'Bankak', 6.00),
(6, 10, 'chips 2', 'Bankak', 4.00),
(7, 11, 'aa', 'Bankak', 3.00),
(8, 11, 'aa', 'Bankak', 4.00);

-- --------------------------------------------------------

--
-- Table structure for table `sponsorships`
--

CREATE TABLE `sponsorships` (
  `id` int NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `event_id` int NOT NULL,
  `sponsorship_tier` enum('Gold','Silver','Bronze') NOT NULL,
  `sponsored_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sponsorships`
--

INSERT INTO `sponsorships` (`id`, `company_name`, `email`, `event_id`, `sponsorship_tier`, `sponsored_at`) VALUES
(6, 'mtn', 'mtn@telecom.com', 3, '', '2025-02-16 12:01:05'),
(7, 'mtn', 'mtn@telecom.com', 3, '', '2025-02-16 12:02:41'),
(8, 'mtn', 'mtn@telecom.com', 3, '', '2025-02-16 12:11:32'),
(9, 'mtn', 'mtn@telecom.com', 2, '', '2025-02-16 13:26:03'),
(10, 'sudani', 'sudani@telecom.com', 4, '', '2025-02-16 21:55:44'),
(11, 'baroon', 'baroon@gmail.com', 2, '', '2025-02-18 13:23:55'),
(12, 'cat', 'cat@tractors.com', 3, '', '2025-02-18 13:27:52'),
(13, 'alico', 'ali@gmail.com', 2, '', '2025-02-18 14:43:40'),
(14, 'chips', 'chips@gmail.com', 2, '', '2025-02-18 14:46:22'),
(15, 'hoodie', 'kp@fu.com', 3, '', '2025-02-18 16:51:10'),
(16, 'hoodie', 'kp@fu.com', 3, 'Silver', '2025-02-18 16:55:21'),
(17, 'aa', 'aa@aa.com', 3, 'Gold', '2025-02-18 18:23:01');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `user_id`, `fname`, `lname`) VALUES
(1, 10, 'ali', 'ddd'),
(2, 10, 'chips 2', 'esam'),
(3, 10, 'mo', 'esam'),
(4, 10, 'chips 2', 'ddd'),
(5, 10, 'xx', 'xx'),
(6, 10, 'ali', 'ddd'),
(7, 11, 'aaa', 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'mohammed', 'mohammed@fu.com', '$2y$10$nQNet/.GEdkUsvNCzSdUReTmHja9Y9qbiRUVFjg5QCJeoZla7y0gK'),
(2, 'abdo', 'abdo@gmail.com', '$2y$10$IVRfLim.bw6B4RWymKd1X.T9P0Le/jTfyZuvseX5eHbDMF04Dp3lu'),
(3, 'ahmed', 'ahmed@gmail.com', '$2y$10$ffF.dn6WDgKSFeRPFcJgHuEF0VFMbWCoEaX8cWlrs2PGcoce.A85a'),
(4, 'momo', 'mp@fu.com', '$2y$10$UIz5mbj8SMdGZuHDp/AmVubXcQrZYRt.2cxW7456460JxcQgZ7xMG'),
(5, 'mohammed', 'mohammed@gmail.com', '$2y$10$/yw8lq8pLACFNm./v4wMLOuk2I6B5r.VnsvKWhUicgimxrzpTeTXK'),
(7, 'omar', 'omar@gmail.com', '$2y$10$hcsSq73gN3pEyVTSpGC9LOyS3Bzvh62AKTSlBWCxFhCaNUG5SwX9C'),
(8, 'hassan', 'hassan@gmail.com', '$2y$10$Wtr2ZQ0.DNBggHlXPY8HceDM3iD37XiS4I8IbUdVK9WvshEsVRwxS'),
(9, 'ali', 'ali@gmail.com', '$2y$10$kjRmUdgvlamVgpGSncNp/.N8kvaSm5XSIgg0na0caqZdJrFe2XdzK'),
(10, 'chips', 'chips@gmail.com', '$2y$10$yoDGIr/2IadmQ8j64XTOeun96HSbApRcuFt1yqLO2H6zcdhba.N8m'),
(11, 'mo', 'aa@aa.com', '$2y$10$RckOXPwGCiMrlUEk1Me1feMAW60Z7c6RrZMIl0eTWqOizfR067pyy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sponsorships`
--
ALTER TABLE `sponsorships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sponsorships`
--
ALTER TABLE `sponsorships`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sponsorships`
--
ALTER TABLE `sponsorships`
  ADD CONSTRAINT `sponsorships_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
