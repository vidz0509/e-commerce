-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2023 at 08:30 PM
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
  `variants_id` int(20) NOT NULL,
  `attribute_name` varchar(50) NOT NULL,
  `attribute_image` varchar(150) DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `variants_id`, `attribute_name`, `attribute_image`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`) VALUES
(14, 6, 'M', NULL, 1, NULL, '2023-09-17 21:45:42', NULL, 1),
(15, 6, 'S', NULL, 1, NULL, '2023-09-17 21:46:38', NULL, 1),
(16, 6, 'XL', NULL, 1, NULL, '2023-09-17 21:46:50', NULL, 1),
(17, 6, 'XXL', NULL, 1, NULL, '2023-09-17 21:47:03', NULL, 1),
(18, 7, 'RED', '../attributes/images/Red.jpeg', 1, NULL, '2023-09-17 22:10:16', NULL, 1),
(21, 7, 'BLUE', '../attributes/images/blue.jpeg', 1, NULL, '2023-09-17 22:13:01', NULL, 1),
(22, 7, 'GREEN', '../attributes/images/green.png', 1, NULL, '2023-09-17 22:14:14', NULL, 1),
(23, 7, 'BLACK', '../attributes/images/black.jpeg', 1, NULL, '2023-09-17 22:15:25', NULL, 1),
(24, 7, 'WHITE', '../attributes/images/white.jpeg', 1, NULL, '2023-09-17 22:16:34', NULL, 1),
(25, 8, 'Half Sleeves', '../attributes/images/HALF SLIVES .jpg', 1, NULL, '2023-09-17 22:22:03', NULL, 1),
(26, 8, 'Full Sleeves', '../attributes/images/full shirt sleeves.jpg', 1, NULL, '2023-09-17 22:26:37', NULL, 1),
(27, 8, 'Stripe Shirt', '../attributes/images/stripe shirt.jpg', 1, NULL, '2023-09-17 22:36:02', NULL, 1),
(28, 8, 'Printed Shirt', '../attributes/images/printed shirt.jpg', 1, NULL, '2023-09-17 22:39:39', NULL, 1),
(29, 8, ' Traditional Dress W', '../attributes/images/traditinal dress.jpg', 1, NULL, '2023-09-17 22:49:46', NULL, 1),
(30, 8, 'Western Dress For Wo', '../attributes/images/WESTERN DRESS WOMEN.jpg', 1, NULL, '2023-09-17 22:55:31', NULL, 1),
(31, 8, 'Office Wear Dress Fo', '../attributes/images/OFFICE WEAR DRESS.jpg', 1, NULL, '2023-09-17 23:00:01', NULL, 1),
(32, 8, 'Formal wear Dress Fo', '../attributes/images/formal dress for women.jpg', 1, NULL, '2023-09-17 23:23:09', NULL, 1);

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
(7, 'Men\'s Wear', '<p><strong>Well-dressed men understand that when they look like their most professional, put-together and capable selves, that the world relates to them accordingly and operates with them on a higher level. Clothing acts as the outward representation of their skills and personality, tying their positive attributes together into a comprehensive package. That&rsquo;s why regardless of whether or not they have an interest in fashion, attention is always paid to maintaining their image.</strong></p>', '../categories/images/81bEvE7vyLL._UX679_.jpg', 1, 1, '2023-09-15 23:38:36', '2023-09-15 23:39:32', 1),
(8, 'Women\'s Wear', '<p><em><strong>is a budget-friendly clothing store that has colorful and trendy pieces for women. Their selection of graphic tees, sweatpants and joggers, and sneakers...</strong></em></p>', '../categories/images/71BMG8EorsL._UL1500_.jpg', 1, 1, '2023-09-15 23:45:32', '2023-09-15 23:45:32', 1),
(10, 'Boy\'s Wear', '<p><strong>Step up your Style Quotient by wearing this Casual Shirt from LEWEL. Team it up with your favourite pair of jeans, denim shorts and sneakers when you head out to work, party, vacation or anything your heart desires. It&rsquo;s your Life, your Rules and we will be all the way with you in style.</strong></p>', '../categories/images/61skoH0rMsL._UY741_.jpg', 1, 1, '2023-09-16 00:01:15', '2023-09-16 00:01:15', 1),
(11, 'Girl\'s Wear', '<div id=\"title_feature_div\" class=\"celwidget\" data-feature-name=\"title\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"title\" data-csa-c-slot-id=\"title_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ktanjj-9k2v96-xnmk0v-atgnb1\" data-cel-widget=\"title_feature_div\">\r\n<div id=\"titleSection\" class=\"a-section a-spacing-none\">\r\n<h1 class=\"a-size-large a-spacing-none\"><span style=\"font-size: 18pt;\"><strong><span id=\"productTitle\" class=\"a-size-large product-title-word-break\">luyk Girls Floral Printed Top with <span style=\"font-size: 14pt;\">Trousers...</span></span></strong></span></h1>\r\n</div>\r\n</div>\r\n<div id=\"qpeTitleTag_feature_div\" class=\"celwidget\" data-feature-name=\"qpeTitleTag\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"qpeTitleTag\" data-csa-c-slot-id=\"qpeTitleTag_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"f9408f-hapg7y-jfwjod-6m6qe8\" data-cel-widget=\"qpeTitleTag_feature_div\"></div>\r\n<div id=\"cmrsSummary_feature_div\" class=\"celwidget\" data-feature-name=\"cmrsSummary\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"cmrsSummary\" data-csa-c-slot-id=\"cmrsSummary_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"cwdiip-prctva-86s4ps-ap479t\" data-cel-widget=\"cmrsSummary_feature_div\"></div>', '../categories/images/61OTdInzd9L._UY741_.jpg', 1, 1, '2023-09-16 00:06:16', '2023-09-16 00:28:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(20) NOT NULL,
  `category_id` int(20) NOT NULL,
  `variants_id` int(20) NOT NULL,
  `attribute_id` int(20) NOT NULL,
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

INSERT INTO `product` (`id`, `category_id`, `variants_id`, `attribute_id`, `p_name`, `p_image`, `p_description`, `stock`, `price`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`) VALUES
(9, 7, 6, 14, 't-shirts', '../products/images/cartoon-1.jpg', '<p>test</p>', 20, 350, 1, NULL, '2023-09-18 22:38:20', NULL, 1),
(10, 7, 6, 15, 'Shirt', '../products/images/shirt.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 10, 400, 1, NULL, '2023-09-18 22:48:46', NULL, 1),
(11, 7, 7, 18, 'Jeans For Men', '../products/images/jeans.jpg', '<h1 class=\"a-size-large a-spacing-none\"><span id=\"productTitle\" class=\"a-size-large product-title-wo', 20, 350, 1, NULL, '2023-09-18 23:12:06', NULL, 1),
(12, 7, 7, 21, 'Boxer For Men', '../products/images/BOXER.jpg', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li class=\"a-spacing-mini\"><span class=\"a-l', 20, 525, 1, NULL, '2023-09-18 23:15:55', NULL, 1),
(13, 7, 8, 25, 'Half Sleeves Shirt F', '../products/images/half sleeves shirt.jpg', '<p>Pump up your style statement with this slim-fit shirt in any formal or casual occasion. Shirts wi', 20, 380, 1, NULL, '2023-09-18 23:21:09', NULL, 1),
(14, 7, 8, 27, 'Stripe Shirt For Men', '../products/images/stripe.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 630, 1, NULL, '2023-09-18 23:26:44', NULL, 1),
(15, 7, 6, 16, 'Full Sleeves Shirt F', '../products/images/full sleeves shirt.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 500, 1, NULL, '2023-09-18 23:30:12', NULL, 1),
(16, 7, 6, 14, 'Printed Shirt For Me', '../products/images/printed shirt_.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 399, 1, NULL, '2023-09-18 23:32:28', NULL, 1),
(17, 8, 6, 16, 'Traditional Dress Fo', '../products/images/traditional dresss_.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 10, 1500, 1, NULL, '2023-09-18 23:36:43', NULL, 1),
(18, 8, 7, 21, 'Western Dress For Wo', '../products/images/western.jpg', '<p><strong><span class=\"a-list-item\">We loved every little detail with this crochet floral lace dres', 20, 599, 1, NULL, '2023-09-18 23:40:48', NULL, 1),
(19, 8, 7, 23, 'Office Dress For Wom', '../products/images/office wear dressL.jpg', '<p><span class=\"a-list-item\">This Co-ord Set will give you a trendy look with its beautiful design o', 20, 850, 1, NULL, '2023-09-18 23:45:13', NULL, 1),
(20, 8, 7, 22, 'Formal Dress For Wom', '../products/images/formal wear.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 600, 1, NULL, '2023-09-18 23:51:31', NULL, 1),
(21, 10, 7, 21, 'Boys wear Dress(7-8 ', '../products/images/kids dress for boy_.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 500, 1, NULL, '2023-09-18 23:57:58', NULL, 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(20) NOT NULL,
  `var_name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `var_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_active`) VALUES
(6, 'size', '2023-09-17 21:30:36', NULL, 1, NULL, 1),
(7, 'color', '2023-09-17 21:30:58', NULL, 1, NULL, 1),
(8, 'style & fit', '2023-09-17 21:31:25', NULL, 1, NULL, 1),
(9, 'material', '2023-09-17 21:32:13', NULL, 1, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_att_updated_by` (`created_by`),
  ADD KEY `fk_upd_by` (`updated_by`),
  ADD KEY `fk_variants_id` (`variants_id`);

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
  ADD KEY `fk_pdt_updated_by` (`updated_by`),
  ADD KEY `fk_c_id` (`category_id`),
  ADD KEY `fk_a_id` (`attribute_id`),
  ADD KEY `fk_v_id` (`variants_id`);

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
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_var_created_by` (`created_by`),
  ADD KEY `fk_var_updated_by` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute`
--
ALTER TABLE `attribute`
  ADD CONSTRAINT `fk_att_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_upd_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_variants_id` FOREIGN KEY (`variants_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_a_id` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_c_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pdt_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pdt_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_v_id` FOREIGN KEY (`variants_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `fk_var_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_var_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
