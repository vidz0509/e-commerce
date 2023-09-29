-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2023 at 05:54 PM
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
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `product_id` int(20) NOT NULL,
  `qty` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `amount` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `qty`, `user_id`, `amount`) VALUES
(12, 31, 1, 38, '599.00'),
(13, 10, 1, 38, '400.00'),
(14, 16, 1, 38, '399.00'),
(19, 32, 1, 1, '699.00');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(20) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_description` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
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
(7, 'Men\'s Wear', '', 'images/717V-PPn8NL._SX679._SX._UX._SY._UY_.jpg', 1, 1, '2023-09-15 23:38:36', '2023-09-24 22:59:30', 1),
(8, 'Women\'s Wear', '<p><em><strong>is a budget-friendly clothing store that has colorful and trendy pieces for women. Their selection of graphic tees, sweatpants and joggers, and sneakers...</strong></em></p>', 'images/71BMG8EorsL._UL1500_.jpg', 1, 1, '2023-09-15 23:45:32', '2023-09-15 23:45:32', 1),
(10, 'Boy\'s Wear', '<p><strong>Step up your Style Quotient by wearing this Casual Shirt from LEWEL. Team it up with your favourite pair of jeans, denim shorts and sneakers when you head out to work, party, vacation or anything your heart desires. It&rsquo;s your Life, your Rules and we will be all the way with you in style.</strong></p>', 'images/61skoH0rMsL._UY741_.jpg', 1, 1, '2023-09-16 00:01:15', '2023-09-16 00:01:15', 1),
(11, 'Girl\'s Wear', '<div id=\"title_feature_div\" class=\"celwidget\" data-feature-name=\"title\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"title\" data-csa-c-slot-id=\"title_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ktanjj-9k2v96-xnmk0v-atgnb1\" data-cel-widget=\"title_feature_div\">\r\n<div id=\"titleSection\" class=\"a-section a-spacing-none\">\r\n<h1 class=\"a-size-large a-spacing-none\"><span style=\"font-size: 18pt;\"><strong><span id=\"productTitle\" class=\"a-size-large product-title-word-break\">luyk Girls Floral Printed Top with <span style=\"font-size: 14pt;\">Trousers...</span></span></strong></span></h1>\r\n</div>\r\n</div>\r\n<div id=\"qpeTitleTag_feature_div\" class=\"celwidget\" data-feature-name=\"qpeTitleTag\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"qpeTitleTag\" data-csa-c-slot-id=\"qpeTitleTag_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"f9408f-hapg7y-jfwjod-6m6qe8\" data-cel-widget=\"qpeTitleTag_feature_div\"></div>\r\n<div id=\"cmrsSummary_feature_div\" class=\"celwidget\" data-feature-name=\"cmrsSummary\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"cmrsSummary\" data-csa-c-slot-id=\"cmrsSummary_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"cwdiip-prctva-86s4ps-ap479t\" data-cel-widget=\"cmrsSummary_feature_div\"></div>', 'images/61OTdInzd9L._UY741_.jpg', 1, 1, '2023-09-16 00:06:16', '2023-09-16 00:28:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(20) NOT NULL,
  `category_id` int(20) NOT NULL,
  `variants_id` int(20) NOT NULL,
  `attribute_id` int(20) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `p_image` longtext DEFAULT NULL,
  `p_description` longtext NOT NULL,
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
(9, 7, 6, 14, 't-shirts', 'products/images/cartoon-1.jpg', '<p>test</p>', 20, 350, 1, NULL, '2023-09-18 22:38:20', NULL, 1),
(10, 7, 6, 15, 'Shirt', 'products/images/shirt.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 10, 400, 1, NULL, '2023-09-18 22:48:46', NULL, 1),
(11, 7, 7, 18, 'Jeans For Men', 'products/images/jeans.jpg', '<h1 class=\"a-size-large a-spacing-none\"><span id=\"productTitle\" class=\"a-size-large product-title-wo', 20, 350, 1, NULL, '2023-09-18 23:12:06', NULL, 1),
(12, 7, 7, 21, 'Boxer For Men', 'products/images/BOXER.jpg', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li class=\"a-spacing-mini\"><span class=\"a-l', 20, 525, 1, NULL, '2023-09-18 23:15:55', NULL, 1),
(13, 7, 8, 25, 'Half Sleeves Shirt F', 'products/images/half sleeves shirt.jpg', '<p>Pump up your style statement with this slim-fit shirt in any formal or casual occasion. Shirts wi', 20, 380, 1, NULL, '2023-09-18 23:21:09', NULL, 1),
(14, 7, 8, 27, 'Stripe Shirt For Men', 'products/images/stripe.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 630, 1, NULL, '2023-09-18 23:26:44', NULL, 1),
(15, 7, 6, 16, 'Full Sleeves Shirt F', 'products/images/full sleeves shirt.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 500, 1, NULL, '2023-09-18 23:30:12', NULL, 1),
(16, 7, 6, 14, 'Printed Shirt For Me', 'products/images/printed shirt_.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 399, 1, NULL, '2023-09-18 23:32:28', NULL, 1),
(17, 8, 6, 16, 'Traditional Dress Fo', 'products/images/traditional dresss_.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 10, 1500, 1, NULL, '2023-09-18 23:36:43', NULL, 1),
(18, 8, 7, 21, 'Western Dress For Wo', 'products/images/western.jpg', '<p><strong><span class=\"a-list-item\">We loved every little detail with this crochet floral lace dres', 20, 599, 1, NULL, '2023-09-18 23:40:48', NULL, 1),
(19, 8, 7, 23, 'Office Dress For Wom', 'products/images/office wear dressL.jpg', '<p><span class=\"a-list-item\">This Co-ord Set will give you a trendy look with its beautiful design o', 20, 850, 1, NULL, '2023-09-18 23:45:13', NULL, 1),
(20, 8, 7, 22, 'Formal Dress For Wom', 'products/images/formal wear.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 600, 1, NULL, '2023-09-18 23:51:31', NULL, 1),
(21, 10, 7, 21, 'Boys wear Dress(7-8 ', 'products/images/kids dress for boy_.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 500, 1, NULL, '2023-09-18 23:57:58', NULL, 1),
(22, 7, 6, 15, 'Full Sleeves Shirt F', 'products/images/full sleeves shirt for men1.jpg', '<h1 class=\"a-size-large a-spacing-none\"><span style=\"font-size: 12pt;\"><strong><span id=\"productTitl', 50, 475, 1, NULL, '2023-09-19 13:56:57', NULL, 1),
(23, 7, 7, 18, 'Full Sleeves Shirt F', 'products/images/full sleeves shirt for men (red', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 40, 350, 1, NULL, '2023-09-19 13:59:43', NULL, 1),
(24, 7, 7, 23, 'Full Sleeves Shirt F', 'products/images/full sleeves shirt for men(blac', '', 40, 360, 1, 1, '2023-09-19 14:03:06', '2023-09-19 14:11:06', 1),
(25, 7, 7, 21, 'Full Sleeves Shirt F', 'products/images/full sleeves for men (blue) 3.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 40, 350, 1, NULL, '2023-09-19 14:14:47', NULL, 1),
(26, 7, 7, 22, 'Full Sleeves Shirt F', 'products/images/full sleeves for men (green) 4.', '<p><strong>We are very involved in the process of selecting great products that perform exceptionall', 40, 999, 1, NULL, '2023-09-19 14:18:45', NULL, 1),
(27, 7, 7, 24, 'Full Sleeves Shirt F', 'products/images/full sleeves for men (white) 5.jpg', '<p><strong>The Majestic Man Solid Slim Fit Casual Shirt for Men is a stylish and versatile shirt tha', 40, 499, 1, NULL, '2023-09-19 14:21:28', NULL, 1),
(28, 7, 6, 16, 'Full Sleeves Shirt F', 'products/images/full sleeves for men (xl) 6.jpg', '<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" dat', 25, 299, 1, NULL, '2023-09-19 14:24:47', NULL, 1),
(29, 7, 6, 15, 'Full Sleeves Shirt F', 'products/images/full sleeves for men (s) 7.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 499, 1, NULL, '2023-09-19 14:28:05', NULL, 1),
(30, 7, 6, 14, 'Full Sleeves Shirt F', 'products/images/full sleeves for men (m) 8.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 475, 499, 1, NULL, '2023-09-19 14:30:46', NULL, 1),
(31, 7, 6, 17, 'Full Sleeves Shirt F', 'products/images/full sleeves for men (xxl) 9.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 599, 1, NULL, '2023-09-19 14:33:48', NULL, 1),
(32, 7, 7, 23, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (black)1.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 699, 1, NULL, '2023-09-19 14:45:53', NULL, 1),
(33, 7, 7, 21, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (blue)2.jpg', '<p><strong><span class=\"a-text-bold\">BRUCEWANE&nbsp;</span>understands the importance of offering af', 50, 580, 1, NULL, '2023-09-19 14:51:27', NULL, 1),
(34, 7, 7, 18, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (red)3.jpg', '<p>With full sleeves and a curved hemline, this shirt provides a versatile and trendy appeal. Crafte', 50, 499, 1, NULL, '2023-09-19 14:53:55', NULL, 1),
(35, 7, 7, 24, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (white)4.j', '<p><strong><span class=\"a-list-item\">&nbsp;Half Sleeves for a versatile and relaxed style..</span></', 70, 375, 1, NULL, '2023-09-19 14:55:53', NULL, 1),
(36, 7, 7, 22, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (green)5.j', '<p><strong><span class=\"a-list-item\">&nbsp;Stylish Curved Hemline adds a contemporary and trendy tou', 50, 375, 1, NULL, '2023-09-19 14:57:34', NULL, 1),
(37, 7, 8, 25, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (half slee', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 25, 380, 1, NULL, '2023-09-19 14:59:43', NULL, 1),
(38, 7, 6, 14, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (m)7.jpg', '<p><strong>Half Sleeves for a versatile and relaxed style...</strong></p>', 25, 450, 1, NULL, '2023-09-19 15:02:46', NULL, 1),
(39, 7, 6, 16, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (xl)8.jpg', '<h1 class=\"a-size-large a-spacing-none\"><span id=\"productTitle\" class=\"a-size-large product-title-wo', 40, 450, 1, NULL, '2023-09-19 15:05:08', NULL, 1),
(40, 7, 6, 17, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (xxl)9.jpg', '<p><strong>With full sleeves and a curved hemline, this shirt provides a versatile and trendy appeal', 50, 499, 1, NULL, '2023-09-19 15:06:58', NULL, 1),
(41, 7, 6, 15, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (s)10.jpg', '<p><strong>Classic Spread Collar for a sophisticated and timeless look...</strong></p>', 20, 499, 1, NULL, '2023-09-19 15:11:27', NULL, 1),
(42, 7, 8, 25, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (half slee', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 279, 1, NULL, '2023-09-19 15:18:26', NULL, 1),
(43, 7, 8, 25, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (half slee', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 299, 1, NULL, '2023-09-19 15:20:22', NULL, 1),
(44, 7, 8, 25, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (half slee', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 499, 1, NULL, '2023-09-19 15:23:23', NULL, 1),
(45, 7, 8, 25, 'Half Sleeves Shirt F', 'products/images/half sleeves for men (half slee', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 499, 1, NULL, '2023-09-19 15:26:58', NULL, 1),
(46, 7, 7, 22, 'Stripe  Shirt For Me', 'products/images/stripe shirt1.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 389, 1, NULL, '2023-09-19 15:32:49', NULL, 1),
(47, 7, 7, 21, 'Stripe Shirt For Men', 'products/images/stripe shirt(bliue)2.jpg', '<p><strong><span class=\"a-list-item\">This striped printed full sleeve and spread collar shirt is ide', 30, 399, 1, NULL, '2023-09-19 15:41:07', NULL, 1),
(48, 7, 7, 23, 'Stripe Shirt For Men', 'products/images/stripe shirt(black)2.jpg', '<p><strong><span class=\"a-list-item\">Striped design 100% Pure Cotton Casual Shirt for Men</span></st', 25, 399, 1, NULL, '2023-09-19 15:42:37', NULL, 1),
(49, 7, 7, 18, 'Stripe Shirt For Men', 'products/images/stripe shirt(red)4.jpg', '<p><strong><span class=\"a-list-item\">Striped design 100% Pure Cotton Casual Shirt for Men...</span><', 30, 375, 1, NULL, '2023-09-19 15:44:13', NULL, 1),
(50, 7, 7, 24, 'Stripe Shirt For Men', 'products/images/stripe shirt(white)5.jpg', '<p><strong><span class=\"a-list-item\">This striped printed full sleeve and spread collar shirt is ide', 20, 399, 1, NULL, '2023-09-19 15:45:25', NULL, 1),
(51, 7, 6, 14, 'Stripe Shirt For Men', 'products/images/stripe shirt(m)y6.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 399, 1, NULL, '2023-09-19 15:47:11', NULL, 1),
(52, 7, 6, 15, 'Stripe Shirt For Men', 'products/images/stripe shirt(s)y7.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 499, 1, NULL, '2023-09-19 15:49:41', NULL, 1),
(53, 7, 6, 16, 'Stripe Shirt For Men', 'products/images/stripe shirt(xl)8.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 649, 1, NULL, '2023-09-19 15:51:50', NULL, 1),
(54, 7, 6, 17, 'Stripe Shirt For Men', 'products/images/stripe shirt(xxl)9.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 620, 1, NULL, '2023-09-19 15:54:09', NULL, 1),
(55, 7, 8, 27, 'Stripe  Shirt For Me', 'products/images/stripe shirt(grey)10.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 499, 1, NULL, '2023-09-19 15:57:45', NULL, 1),
(56, 7, 8, 27, 'Stripe Shirt For Men', 'products/images/stripe shirt(green)11.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 25, 499, 1, NULL, '2023-09-19 16:02:38', NULL, 1),
(57, 7, 8, 27, 'Stripe  Shirt For Me', 'products/images/stripe shirt(mustard)12.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 399, 1, NULL, '2023-09-19 16:05:42', NULL, 1),
(58, 7, 8, 27, 'Stripe  Shirt For Me', 'products/images/stripe shirt(red)13.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 30, 399, 1, NULL, '2023-09-19 16:07:45', NULL, 1),
(59, 7, 7, 23, 'Printed Shirt  For M', 'products/images/printed shirt for men(black)1.j', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 499, 1, NULL, '2023-09-19 16:17:11', NULL, 1),
(60, 7, 7, 22, 'Printed Shirt  For M', 'products/images/printed shirt for men(Green)2.j', '<p><strong><span class=\"a-list-item\">High Definition Print - Using the highest quality solvents and ', 20, 499, 1, NULL, '2023-09-19 16:22:57', NULL, 1),
(61, 7, 7, 18, 'Printed Shirt  For M', 'products/images/printed shirt for men(red)2.jpg', '<p><strong><span class=\"a-list-item\">High Definition Print - Using the highest quality solvents and ', 20, 1350, 1, NULL, '2023-09-19 22:36:50', NULL, 1),
(62, 7, 7, 24, 'Printed Shirt  For M', 'products/images/printed shirt for men(white)2.j', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 30, 349, 1, NULL, '2023-09-19 22:41:43', NULL, 1),
(63, 7, 7, 21, 'Printed Shirt  For M', 'products/images/printed shirt for men(blue)5.jp', '<p><strong>GloryBoyz Mens Short Sleeve Printed Casual Button Down Standard Fit Beach Shirts Using so', 40, 850, 1, NULL, '2023-09-19 22:44:45', NULL, 1),
(64, 7, 6, 15, 'Printed Shirt  For M', 'products/images/printed shirt for men(s)6.jpg', '<p><strong>&nbsp;Perfect for hawaiian aloha theme, camp, luau, cruise, sun beach, birthday party, va', 30, 850, 1, NULL, '2023-09-19 22:47:19', NULL, 1),
(65, 7, 6, 14, 'Printed Shirt  For M', 'products/images/printed shirt for men(M)7.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 30, 445, 1, NULL, '2023-09-19 22:49:16', NULL, 1),
(66, 7, 6, 16, 'Printed Shirt  For M', 'products/images/printed shirt for men(xl)8.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 30, 499, 1, NULL, '2023-09-19 22:51:37', NULL, 1),
(67, 7, 6, 17, 'Printed Shirt  For M', 'products/images/printed shirt for men(xxl)9.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 30, 399, 1, NULL, '2023-09-19 22:54:21', NULL, 1),
(68, 7, 8, 28, 'Printed Shirt  For M', 'products/images/printed shirt for men()10.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 30, 549, 1, NULL, '2023-09-19 22:57:27', NULL, 1),
(69, 8, 7, 18, 'Traditional Dress Fo', 'products/images/traditional-red 1.jpg', '<p><strong>Fabric Details Of Kameez :- Georgette Semi stitched Product</strong></p>\r\n<p><strong>Inne', 50, 1049, 1, NULL, '2023-09-19 23:02:33', NULL, 1),
(70, 8, 7, 22, 'Traditional Dress Fo', 'products/images/traditional-green 2.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 1299, 1, NULL, '2023-09-19 23:05:13', NULL, 1),
(71, 8, 7, 21, 'Traditional Dress Fo', 'products/images/traditional-blue 3.jpg', '<p><strong>A pretty Gown to wear at parties, functions or just casually which is stylish &amp; comfo', 50, 1299, 1, NULL, '2023-09-19 23:08:02', NULL, 1),
(72, 8, 7, 24, 'Traditional Dress Fo', 'products/images/traditional-white 4.jpg', '<p><strong>Fashion Basket brings to you this lehenga choli which is available in a shade of attracti', 50, 999, 1, NULL, '2023-09-19 23:10:54', NULL, 1),
(73, 8, 7, 23, 'Traditional Dress Fo', 'products/images/traditional-black 5.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 30, 1399, 1, NULL, '2023-09-19 23:14:31', NULL, 1),
(74, 8, 6, 17, 'Traditional Dress Fo', 'products/images/traditional-maroon 6.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 1399, 1, NULL, '2023-09-19 23:21:01', NULL, 1),
(75, 8, 6, 16, 'Traditional Dress Fo', 'products/images/traditional-xxl 7.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 1399, 1, NULL, '2023-09-19 23:24:54', NULL, 1),
(76, 8, 6, 14, 'Traditional Dress Fo', 'products/images/traditional-m 8.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 2250, 1, NULL, '2023-09-19 23:27:02', NULL, 1),
(77, 8, 8, 29, 'Traditional Dress Fo', 'products/images/traditional-more peace 9.jpg', '<p><strong>A major benefit of Florely Collection stylish Gown is exceptional quality. We designed th', 50, 999, 1, NULL, '2023-09-19 23:29:51', NULL, 1),
(78, 8, 8, 29, 'Traditional Dress Fo', 'products/images/traditional-brown 10.jpg', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li class=\"a-spacing-mini\"><span class=\"a-l', 50, 1299, 1, NULL, '2023-09-19 23:33:31', NULL, 1),
(79, 8, 7, 18, 'Western Dress For Wo', 'products/images/western drees for women 1 red.j', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 25, 899, 1, NULL, '2023-09-19 23:41:02', NULL, 1),
(80, 8, 7, 21, 'Western Dress For Wo', 'products/images/western drees for women 2 blue.', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 40, 859, 1, NULL, '2023-09-19 23:44:41', NULL, 1),
(81, 8, 7, 23, 'Western Dress For Wo', 'products/images/western drees for women 3 black', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 40, 749, 1, NULL, '2023-09-19 23:47:04', NULL, 1),
(82, 8, 7, 22, 'Western Dress For Wo', 'products/images/western drees for women 4 grren', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 25, 660, 1, NULL, '2023-09-19 23:50:29', NULL, 1),
(83, 8, 7, 24, 'Western Dress For Wo', 'products/images/western drees for women 5 white', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 549, 1, NULL, '2023-09-19 23:55:13', NULL, 1),
(84, 8, 6, 15, 'Western Dress For Wo', 'products/images/western drees for women (s) 6.j', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 40, 379, 1, NULL, '2023-09-19 23:59:18', NULL, 1),
(85, 8, 6, 14, 'Western Dress For Wo', 'products/images/western drees for women (m) 7.j', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 25, 380, 1, NULL, '2023-09-20 00:01:43', NULL, 1),
(86, 8, 6, 16, 'Western Dress For Wo', 'products/images/western drees for women (xl) 8.', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 40, 499, 1, NULL, '2023-09-20 00:03:48', NULL, 1),
(87, 8, 6, 17, 'Western Dress For Wo', 'products/images/western drees for women (XXL) 9', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 40, 599, 1, NULL, '2023-09-20 00:06:35', NULL, 1),
(88, 8, 8, 30, 'Western Dress For Wo', 'products/images/western drees for women  black1', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 799, 1, NULL, '2023-09-20 00:08:53', NULL, 1),
(89, 7, 7, 21, 'Office Dress For Wom', 'products/images/office drees for women blue 1.j', '<p><strong><span class=\"a-list-item\">This Top &amp; Pant Set will give you a trendy look with its be', 25, 670, 1, NULL, '2023-09-20 00:16:59', NULL, 1),
(90, 8, 7, 23, 'Office Dress For Wom', 'products/images/office drees for women black 2.', '<p><strong><span class=\"a-list-item\">This Top &amp; Pant Set will give you a trendy look with its be', 20, 650, 1, NULL, '2023-09-20 21:08:52', NULL, 1),
(91, 8, 7, 18, 'Office Dress For Wom', 'products/images/office drees for women red 3.jp', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 52, 589, 1, NULL, '2023-09-20 21:11:27', NULL, 1),
(92, 8, 7, 22, 'Office Dress For Wom', 'products/images/office drees for women green 4.', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 999, 1, NULL, '2023-09-20 21:14:07', NULL, 1),
(93, 8, 7, 24, 'Office Dress For Wom', 'products/images/office drees for women white 5.', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 40, 699, 1, NULL, '2023-09-20 21:17:43', NULL, 1),
(94, 8, 6, 15, 'Office Dress For Wom', 'products/images/office drees for women (s) 6.jp', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 30, 999, 1, NULL, '2023-09-20 21:20:30', NULL, 1),
(95, 8, 6, 14, 'Office Dress For Wom', 'products/images/office drees for women (M) 7.jp', '<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c', 52, 699, 1, NULL, '2023-09-20 21:22:13', NULL, 1),
(96, 8, 6, 16, 'Office Dress For Wom', 'products/images/office drees for women (xl) 8.j', '<p><strong><span class=\"a-list-item\">This Co-ord Set will give you a trendy look with its beautiful ', 50, 699, 1, NULL, '2023-09-20 21:25:22', NULL, 1),
(97, 8, 6, 17, 'Office Dress For Wom', 'products/images/office drees for women (xxl) 9.', '<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c', 40, 699, 1, NULL, '2023-09-20 21:27:49', NULL, 1),
(98, 8, 8, 31, 'Office Dress For Wom', 'products/images/office drees for women (YELLOWl', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 30, 699, 1, NULL, '2023-09-20 21:33:58', NULL, 1),
(99, 8, 7, 23, 'Formal Dress For Wom', 'products/images/formal  drees for women (blackl', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 20, 699, 1, NULL, '2023-09-20 21:46:21', NULL, 1),
(100, 8, 7, 22, 'Formal Dress For Wom', 'products/images/formal  drees for women (green)', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 699, 1, NULL, '2023-09-20 21:48:34', NULL, 1),
(101, 8, 7, 24, 'Formal Dress For Wom', 'products/images/formal  drees for women (white)', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 50, 649, 1, NULL, '2023-09-20 21:50:24', NULL, 1),
(102, 8, 7, 18, 'Formal Dress For Wom', 'products/images/formal  drees for women (red) 4', '<p><strong><span style=\"font-size: 14pt;\">Round Neck Full Sleeve Solid Midi Bodycon Casual Western S', 50, 399, 1, NULL, '2023-09-20 21:52:48', NULL, 1),
(103, 8, 7, 21, 'Formal Dress For Wom', 'products/images/formal  drees for women (blue) ', '<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c', 50, 599, 1, NULL, '2023-09-20 21:56:28', NULL, 1),
(104, 8, 6, 14, 'Formal Dress For Wom', 'products/images/formal  drees for women (m) 6.j', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 25, 699, 1, NULL, '2023-09-20 22:06:12', NULL, 1),
(105, 8, 6, 15, 'Formal Dress For Wom', 'products/images/formal  drees for women (s) 7.j', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" da', 25, 499, 1, NULL, '2023-09-20 22:15:33', NULL, 1),
(106, 8, 6, 16, 'Full Sleeves Shirt F', 'products/images/formal  drees for women (xl) 8.', '<h1 class=\"a-size-large a-spacing-none\"><span id=\"productTitle\" class=\"a-size-large product-title-wo', 20, 499, 1, NULL, '2023-09-20 22:18:04', NULL, 1),
(107, 8, 6, 17, 'Selvia Women\'s Green Lycra Solid Piece Blazer Co-Ord Set', 'images/formal  drees for women (blackl) 1.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"clwnnh-d9jlb4-x4atpn-od2tb4\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>This Co-Ords Set Is Made Of Lycra Fabric,Crafted For Every Comfort. This Knitted &amp; Dyed Dress To Make It Suitable For Daily Party Or Evening Wear.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"kqf7py-21ekej-1xhraj-ze16gz\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"dqnsdr-7mcbiu-pc63fo-ps0gmx\" data-cel-widget=\"aplus_feature_div\">\r\n<div id=\"aplus\" class=\"a-section a-spacing-large bucket\"></div>\r\n</div>', 20, 499, 1, 1, '2023-09-20 22:19:50', '2023-09-29 21:22:17', 1),
(108, 8, 8, 32, 'SIRIL Lycra Long Puff Sleeve Sweetheart Neck Co-Ords Set for Women\'s | Suit Set|Two Piece Dress', 'images/formal  drees for women (blackl) 1.jpg', '<p><span class=\"a-list-item\">This Top &amp; Pant Set will give you a trendy look with its beautiful design on this Festival, Wedding Seasons, Use it as casual or formal wear for office, shopping, daily wear in home, college, family, meetings, etc.</span></p>', 25, 599, 1, 1, '2023-09-20 22:52:32', '2023-09-29 21:15:13', 1),
(109, 7, 7, 23, 'LOUIS DEVIN Silicone', 'products/images/watch (black) 1.jpg', '<p><strong>A watch is a portable timepiece intended to be carried or worn by a person. It is designe</strong></p>', 20, 399, 1, 1, '2023-09-20 23:16:29', '2023-09-29 21:05:32', 1),
(110, 7, 7, 21, 'ASGARD Analog Mens &', 'products/images/watch (blue) 2.jpg', '<p><strong><span class=\"a-list-item\">Suitable for party wedding, formal and casual occasion(Color-Bl</span></strong></p>', 80, 351, 1, 1, '2023-09-20 23:30:27', '2023-09-25 00:37:29', 1),
(111, 7, 7, 22, 'TIMEWEAR Analogue - Digital Mens Watch (Green Color)', 'products/images/watch (green) 3.jpg', '<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c<=\"\">Analogue watches/clocks have a mechanism to indicate time by means of mechanical structures, such as a dial and hands (hand indication type), while digital watches/clocks have a mechanism to indicate time by means of electronic structures, such as a liquid crystal and LED (number display type).</div>', 110, 549, 1, 1, '2023-09-20 23:35:21', '2023-09-24 20:54:14', 1),
(112, 7, 7, 21, 'TIMEX Analog Blue Dial Men\'s Watch-TW000T310', 'products/images/watch (timex-blue) 4.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>One of the largest watch makers in the world</strong>, Timex Group companies include the Timex Business Unit (Timex, Timex Ironman, Nautica, Marc Ecko and Helix); Timex Group Luxury Watches (Salvatore Ferragamo); Sequel (Guess, Gc) and Vertime (Versace).<!--</body--></div>', 10, 999, 1, 1, '2023-09-20 23:44:14', '2023-09-24 21:01:13', 1),
(113, 7, 7, 21, 'TIMEX Analog Blue Dial Men\'s Watch-TW000T310', 'products/images/watch (-blue) 5.jpg', '<div id=\"title_feature_div\" class=\"celwidget\" data-feature-name=\"title\" data-csa-c-type=\"widget\"><strong>with Timex you\'re getting a watch that\'s deep-rooted in brand history with significant contributions to watch design</strong>. It\'s important to know that Timex is not a luxury brand though &ndash; with Timex you\'re getting a watch that looks good and has great functionality at an affordable price.</div>', 10, 899, 1, 1, '2023-09-20 23:52:33', '2023-09-28 14:14:40', 1);

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
  `u_profile` varchar(200) NOT NULL,
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
(1, 'Vairag Bavadiya', 'vairagbavadiya5@gmail.com', '9909409153', '7607', 1, './user_images/cartoon-3.png', '2023-09-02 16:43:07', '2023-09-08 21:55:45', 1, 1, 1),
(16, 'kaushik_gorasiya', 'kaushikgorasiya@gmail.com', '7383415839', '8733', 2, './user_images/cartoon-4.jpg', '2023-09-02 18:16:36', '2023-09-03 16:44:45', 16, 16, 1),
(23, 'test', 'df@gmail.com', '11', '11', 2, '', '2023-09-03 22:22:34', '2023-09-03 22:22:34', 23, 23, 1),
(38, 'Kavita Bavadiya', 'kavitabavadiya@gmail.com', '9909409153', '0000', 3, '', '2023-09-26 00:10:43', '2023-09-26 00:10:43', 38, 38, 1);

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
(6, 'Size', '2023-09-17 21:30:36', NULL, 1, NULL, 1),
(7, 'Color', '2023-09-17 21:30:58', NULL, 1, NULL, 1),
(8, 'Style & Fit', '2023-09-17 21:31:25', NULL, 1, NULL, 1),
(9, 'Material', '2023-09-17 21:32:13', NULL, 1, NULL, 1);

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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fkk_p_idd` (`product_id`);

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `product_attribute`
--
ALTER TABLE `product_attribute`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkk_p_idd` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
