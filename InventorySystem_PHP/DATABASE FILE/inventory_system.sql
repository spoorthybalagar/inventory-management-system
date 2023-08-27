-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2023 at 01:57 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_system`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADDPRODUCTS` (IN `Name` VARCHAR(255) CHARSET utf8mb4, IN `Quantity` VARCHAR(50) CHARSET utf8mb4, IN `b_price` DECIMAL(25,2), IN `s_price` DECIMAL(25,2), IN `c_id` INT(11), IN `m_id` INT(11), IN `datee` DATETIME)   BEGIN
insert into products(name,quantity,buy_price,sale_price,categorie_id,media_id,date)
VALUES(Name,Quantity,b_price,s_price,c_id,m_id,datee);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(12, 'cosmetics'),
(9, 'electronics'),
(10, 'furniture'),
(11, 'sports'),
(13, 'stationery');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `cat_id` int(11) NOT NULL,
  `p_title` varchar(100) NOT NULL,
  `action` varchar(15) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`cat_id`, `p_title`, `action`, `date_time`) VALUES
(3, 'iphone', 'UPDATED', '2023-01-16 07:12:07'),
(5, 'boat earphones', 'DELETED', '2023-01-16 07:12:25'),
(9, 'boat earphones', 'UPDATED', '2023-01-16 12:23:55'),
(12, 'lipstick', 'UPDATED', '2023-01-16 12:34:11'),
(10, 'study table', 'UPDATED', '2023-01-16 12:34:31'),
(11, 'cricket bats', 'UPDATED', '2023-01-16 12:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `buy_price` decimal(25,2) DEFAULT NULL,
  `sale_price` decimal(25,2) NOT NULL,
  `categorie_id` int(11) UNSIGNED NOT NULL,
  `media_id` int(11) DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `categorie_id`, `media_id`, `date`) VALUES
(17, 'boat earphones', '100', '10.00', '15.00', 9, 0, '2023-01-16 13:20:53'),
(18, 'Laptops', '50', '1000.00', '1100.00', 9, 0, '2023-01-16 13:21:35'),
(19, 'logitech mouse', '100', '10.00', '13.00', 9, 0, '2023-01-16 13:22:50'),
(20, 'monitor', '50', '150.00', '200.00', 9, 0, '2023-01-16 13:23:06'),
(21, 'TV', '30', '500.00', '700.00', 9, 0, '2023-01-16 13:23:31'),
(22, 'lipstick', '90', '10.00', '13.00', 12, 0, '2023-01-16 13:24:27'),
(23, 'eyeliner', '100', '12.00', '15.00', 12, 0, '2023-01-16 13:24:52'),
(24, 'compact', '100', '17.00', '20.00', 12, 0, '2023-01-16 13:25:31'),
(25, 'moisturiser', '100', '10.00', '15.00', 12, 0, '2023-01-16 13:25:57'),
(26, 'sunscreen', '100', '10.00', '13.00', 12, 0, '2023-01-16 13:26:17'),
(27, 'sofa', '30', '800.00', '1000.00', 10, 0, '2023-01-16 13:26:37'),
(28, 'dining table', '20', '650.00', '800.00', 10, 0, '2023-01-16 13:26:56'),
(29, 'cupboard', '20', '500.00', '700.00', 10, 0, '2023-01-16 13:27:19'),
(30, 'study table', '18', '300.00', '500.00', 10, 0, '2023-01-16 13:27:41'),
(31, 'double cot', '20', '500.00', '700.00', 10, 0, '2023-01-16 13:28:44'),
(32, 'cricket bats', '90', '110.00', '150.00', 11, 0, '2023-01-16 13:29:03'),
(33, 'football shoes', '100', '100.00', '120.00', 11, 0, '2023-01-16 13:29:25'),
(34, 'volleyball', '100', '65.00', '80.00', 11, 0, '2023-01-16 13:29:50'),
(35, 'swimming goggles', '100', '40.00', '60.00', 11, 0, '2023-01-16 13:30:35'),
(36, 'cycle', '100', '190.00', '250.00', 11, 0, '2023-01-16 13:30:54'),
(37, 'notebooks(100 pages)', '150', '2.00', '3.00', 13, 0, '2023-01-16 13:31:54'),
(38, 'marker', '100', '1.00', '2.00', 13, 0, '2023-01-16 13:32:10'),
(39, 'diary', '100', '2.00', '3.00', 13, 0, '2023-01-16 13:32:27'),
(40, 'scientific calculator', '100', '10.00', '15.00', 13, 0, '2023-01-16 13:32:58'),
(41, 'pens(pack of 10)', '100', '2.00', '3.00', 13, 0, '2023-01-16 13:33:21');

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `d_logs` BEFORE DELETE ON `products` FOR EACH ROW BEGIN
insert into logs(cat_id,p_title,action,date_time) VALUES (OLD.categorie_id,OLD.name,'DELETED',NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logs` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
insert into logs(cat_id,p_title,action,date_time) VALUES (NEW.categorie_id,NEW.name,'UPDATED',NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `qty`, `price`, `date`) VALUES
(11, 22, 10, '130.00', '2023-01-16'),
(12, 30, 2, '1000.00', '2023-01-16'),
(13, 32, 10, '1500.00', '2023-01-16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(1, 'shreyas', 'shreyas', 'fac76aafe57fc9acb24e05f5dba9b58a43a0a645', 1, 'no_image.png', 1, '2023-01-16 13:15:52'),
(3, 'user', 'User', '12dea96fec20593566ab75692c9949596833adc9', 3, 'no_image.png', 1, '2023-01-16 13:50:51'),
(6, 'spoorthy', 'spoorthy', '5f1ee1aa48465efbd32277708ce4f28524b9493f', 1, 'no_image.jpg', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Admin', 1, 1),
(3, 'User', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `media_id` (`media_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level` (`user_level`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_level` (`group_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
