-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2023 at 08:22 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `id` int(20) NOT NULL,
  `category_id` int(20) NOT NULL,
  `attribute_name` varchar(20) NOT NULL,
  `attribute_image` varchar(50) DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `category_id`, `attribute_name`, `attribute_image`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 1, 'test', '../attributes/images/aA6XvF.webp', 1, NULL, '2023-09-03 14:25:23', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(20) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `category_description` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `created_by` int(50) NOT NULL,
  `updated_by` int(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `category_description`, `image`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'test 1', '<p>testing</p>', '../categories/images/cool-dark-wallpapers.jpg', 1, 1, '2023-09-02 20:29:24', '2023-09-14 21:34:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(20) NOT NULL,
  `p_name` varchar(20) NOT NULL,
  `p_image` varchar(50) DEFAULT NULL,
  `p_description` varchar(100) NOT NULL,
  `stock` int(50) NOT NULL,
  `price` int(50) NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `p_name`, `p_image`, `p_description`, `stock`, `price`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 't-shirts', NULL, '<p>test</p>', 20, 300, 1, NULL, '2023-09-14 21:54:23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE `product_attribute` (
  `id` int(20) NOT NULL,
  `p_id` int(20) NOT NULL,
  `attribute_id` int(20) NOT NULL,
  `price` int(20) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `u_type_id` int(20) NOT NULL,
  `u_profile` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `u_name`, `email`, `phone_no`, `password`, `u_type_id`, `u_profile`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_active`) VALUES
(1, 'vairag_bavadiya', 'vairagbavadiya5@gmail.com', '9909409153', '7607', 1, './user_images/cartoon-3.png', '2023-09-02 16:43:07', '2023-09-08 21:55:45', 1, 1, 1),
(16, 'kaushik_gorasiya', 'kaushikgorasiya@gmail.com', '7383415839', '8733', 2, './user_images/cartoon-4.jpg', '2023-09-02 18:16:36', '2023-09-03 16:44:45', 16, 16, 1),
(23, 'test', 'df@gmail.com', '11', '11', 2, '', '2023-09-03 22:22:34', '2023-09-03 22:22:34', 23, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(20) NOT NULL,
  `type_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type_name`) VALUES
(1, 'admin'),
(2, 'assistant'),
(3, 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`category_id`),
  ADD KEY `fk_att_updated_by` (`created_by`),
  ADD KEY `fk_upd_by` (`updated_by`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cat_created_by` (`created_by`),
  ADD KEY `fk_cat_updated_by` (`updated_by`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pdt_created_by` (`created_by`),
  ADD KEY `fk_pdt_updated_by` (`updated_by`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_id` (`p_id`),
  ADD KEY `fk_attribute_id` (`attribute_id`),
  ADD KEY `fk_p_attr_created_by` (`created_by`),
  ADD KEY `fk_p_attr_updated_by` (`updated_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usertype_id` (`u_type_id`),
  ADD KEY `fk_created_by` (`created_by`),
  ADD KEY `fk_updated_by` (`updated_by`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_attribute`
--
ALTER TABLE `product_attribute`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute`
--
ALTER TABLE `attribute`
  ADD CONSTRAINT `fk_att_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_upd_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_cat_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cat_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_pdt_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pdt_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `fk_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_p_attr_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_p_attr_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`p_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usertype_id` FOREIGN KEY (`u_type_id`) REFERENCES `user_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
