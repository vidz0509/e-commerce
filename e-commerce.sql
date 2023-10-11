-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Oct 11, 2023 at 08:24 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
  `attribute_image` longtext DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `variants_id`, `attribute_name`, `attribute_image`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`, `is_delete`) VALUES
(14, 6, 'M', NULL, 1, NULL, '2023-09-17 21:45:42', NULL, 1, NULL),
(15, 6, 'S', NULL, 1, NULL, '2023-09-17 21:46:38', NULL, 1, NULL),
(16, 6, 'XL', NULL, 1, NULL, '2023-09-17 21:46:50', NULL, 1, NULL),
(17, 6, 'XXL', NULL, 1, NULL, '2023-09-17 21:47:03', NULL, 1, NULL),
(18, 7, 'RED', '../attributes/images/Red.jpeg', 1, NULL, '2023-09-17 22:10:16', NULL, 1, NULL),
(21, 7, 'BLUE', '../attributes/images/blue.jpeg', 1, NULL, '2023-09-17 22:13:01', NULL, 1, NULL),
(22, 7, 'GREEN', '../attributes/images/green.png', 1, NULL, '2023-09-17 22:14:14', NULL, 1, NULL),
(23, 7, 'BLACK', '../attributes/images/black.jpeg', 1, NULL, '2023-09-17 22:15:25', NULL, 1, NULL),
(24, 7, 'WHITE', '../attributes/images/white.jpeg', 1, NULL, '2023-09-17 22:16:34', NULL, 1, NULL),
(25, 8, 'Half Sleeves', '../attributes/images/HALF SLIVES .jpg', 1, NULL, '2023-09-17 22:22:03', NULL, 1, NULL),
(26, 8, 'Full Sleeves', '../attributes/images/full shirt sleeves.jpg', 1, NULL, '2023-09-17 22:26:37', NULL, 1, NULL),
(27, 8, 'Stripe Shirt', '../attributes/images/stripe shirt.jpg', 1, NULL, '2023-09-17 22:36:02', NULL, 1, NULL),
(28, 8, 'Printed Shirt', '../attributes/images/printed shirt.jpg', 1, NULL, '2023-09-17 22:39:39', NULL, 1, NULL),
(29, 8, ' Traditional Dress Women', '../attributes/images/traditinal dress.jpg', 1, NULL, '2023-09-17 22:49:46', NULL, 1, NULL),
(30, 8, 'Western Dress For Women', '../attributes/images/WESTERN DRESS WOMEN.jpg', 1, NULL, '2023-09-17 22:55:31', NULL, 1, NULL),
(31, 8, 'Office Wear Dress For women', '../attributes/images/OFFICE WEAR DRESS.jpg', 1, NULL, '2023-09-17 23:00:01', NULL, 1, NULL),
(32, 8, 'Formal wear Dress For women', '../attributes/images/formal dress for women.jpg', 1, NULL, '2023-09-17 23:23:09', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `billing_address`
--

CREATE TABLE `billing_address` (
  `id` int(20) NOT NULL,
  `user_id` int(20) DEFAULT NULL,
  `street_address` varchar(150) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing_address`
--

INSERT INTO `billing_address` (`id`, `user_id`, `street_address`, `city`, `state`, `zipcode`, `country`) VALUES
(3, 38, '65, Millennium Residency,', 'SURAT', 'GUJARAT', '394130', 'India'),
(4, 38, '65, Millennium Residency,', 'SURAT', 'GUJARAT', '394130', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `product_id` int(20) DEFAULT NULL,
  `qty` int(20) NOT NULL,
  `user_id` int(20) DEFAULT NULL,
  `amount` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `qty`, `user_id`, `amount`) VALUES
(156, 13, 2, 1, 760.00),
(157, 10, 1, 1, 400.00),
(158, 105, 1, 1, 499.00),
(159, 32, 2, 1, 1398.00),
(160, 26, 2, 1, 1998.00);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(20) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_description` longtext NOT NULL,
  `image` longtext DEFAULT NULL,
  `created_by` int(50) DEFAULT NULL,
  `updated_by` int(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `category_description`, `image`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`, `is_delete`) VALUES
(7, 'Men\'s Wear', '<p>Men\'s clothes are&nbsp;<strong>articles of clothing designed for and worn by men</strong>. Typical men\'s clothes include trousers, shirts, jeans, suits, sweaters, gloves, jackets, and hats. However, the majority of those clothing items are also items of women\'s clothing.</p>', 'images/717V-PPn8NL._SX679._SX._UX._SY._UY_.jpg', 1, 1, '2023-09-15 23:38:36', '2023-10-03 01:26:22', 1, NULL),
(8, 'Women\'s Wear', '<p><em><strong>is a budget-friendly clothing store that has colorful and trendy pieces for women. Their selection of graphic tees, sweatpants and joggers, and sneakers...</strong></em></p>', 'images/71BMG8EorsL._UL1500_.jpg', 1, 1, '2023-09-15 23:45:32', '2023-09-15 23:45:32', 1, NULL),
(10, 'Boy\'s Wear', '<p><strong>Step up your Style Quotient by wearing this Casual Shirt from LEWEL. Team it up with your favourite pair of jeans, denim shorts and sneakers when you head out to work, party, vacation or anything your heart desires. It&rsquo;s your Life, your Rules and we will be all the way with you in style.</strong></p>', 'images/61skoH0rMsL._UY741_.jpg', 1, 1, '2023-09-16 00:01:15', '2023-09-16 00:01:15', 1, NULL),
(11, 'Girl\'s Wear', '<p>girl\'s wear is <strong>outfits made specifically for and worn by girls</strong>. Salwar suits, saaris, lehnga etc. in Indian tradition and Skirts, shirts, sweaters, trousers, coats, chemises, and jeans, etc</p>', 'images/61OTdInzd9L._UY741_.jpg', 1, 1, '2023-09-16 00:06:16', '2023-10-03 01:27:33', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(20) NOT NULL,
  `user_id` int(20) DEFAULT NULL,
  `order_date` date NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `total_amount` decimal(6,2) NOT NULL,
  `address_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `payment_status`, `transaction_id`, `total_amount`, `address_id`) VALUES
(1, 38, '2023-10-11', 'completed', 'e61c511d-b7bc-4012-8a58-0bb095cb4d9d', 2098.00, 3),
(2, 38, '2023-10-11', 'completed', '7c318e7a-ebd4-46ff-8652-c7ffac2ee453', 1598.00, 4);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(20) NOT NULL,
  `order_id` int(20) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  `amount` decimal(6,2) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `user_id`, `product_id`, `amount`, `qty`) VALUES
(1, 1, 38, 9, 350.00, 1),
(2, 1, 38, 16, 399.00, 1),
(3, 1, 38, 28, 299.00, 1),
(4, 1, 38, 9, 1050.00, 3),
(5, 2, 38, 18, 1198.00, 2),
(6, 2, 38, 10, 400.00, 1);

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
  `is_active` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `variants_id`, `attribute_id`, `p_name`, `p_image`, `p_description`, `stock`, `price`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`, `is_delete`) VALUES
(9, 7, 6, 14, 'Mens Colorblocked Polo T-Shirt', 'images/t shirt_.jpg', '<p><strong>A T-shirt (also spelled tee shirt, or tee for short) is&nbsp;a style of fabric shirt named after the T shape of its body and sleeves. Traditionally, it has short sleeves and a round neckline, known as a crew neck, which lacks a collar.</strong></p>', 20, 350, 1, 16, '2023-09-18 22:38:20', '2023-09-30 23:03:38', 1, NULL),
(10, 7, 6, 15, 'Men\'s Checkered Slim Fit Cotton Casual Shirt', 'images/shirt.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>This Casual Checkered shirt has a Slim Collar, Full Sleeves and a curved hemline Size and Fit Slim Fit The Model a garment for the upper part of the body</strong></div>', 10, 400, 1, 16, '2023-09-18 22:48:46', '2023-09-30 23:00:59', 1, NULL),
(11, 7, 7, 18, 'Men\'s Cotton Blend Denim Jeans Regular Fit Casual', 'images/jeans.jpg', '<h3 class=\"a-size-large a-spacing-none\"><span style=\"font-size: 14pt;\"><strong>Men\'s Cotton Blend Denim Jeans Regular Fit Casual</strong></span></h3>', 20, 350, 1, 16, '2023-09-18 23:12:06', '2023-09-30 22:57:48', 1, NULL),
(12, 7, 7, 21, 'Super Combed Cotton Printed Renew Boxer Shorts for Men', 'images/BOXER.jpg', '<p><strong>boxer shorts have been designed for the contemporary man. Ensuring that everyday clothing is no longer boring, these boxer shorts come in a stylish print. Comfortable enough to wear throughout the day, this is the best a man can expect for daily-wear lounging options.&nbsp;</strong></p>', 20, 525, 1, 16, '2023-09-18 23:15:55', '2023-09-30 22:55:17', 1, NULL),
(13, 7, 8, 25, 'Man Cotton Solid Half Sleeve Shirt for Men', 'images/HALF SLIVES .jpg', '<p><strong>Pump up your style statement with this slim-fit shirt in any formal or casual occasion. he Solid design makes this a trendy party wear casual shirt as well as a formal shirt for men.</strong></p>', 20, 380, 1, 16, '2023-09-18 23:21:09', '2023-09-30 22:52:57', 1, NULL),
(14, 7, 8, 27, ' Men\'s Stripe Regular Fit Shirt', 'images/stripe.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Striped shirts are&nbsp;one of the most versatile pieces of clothing for men. The timeless combinations of stripes and colours can help create a variety of looks that can be worn for any occasion.&nbsp;</strong></div>', 20, 630, 1, 16, '2023-09-18 23:26:44', '2023-09-30 22:51:16', 1, NULL),
(15, 7, 6, 16, 'Mens Basic Solid Full Sleeves Polo Cotton Shirts with Collar Stylish', 'images/full sleeves shirt.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"XVgYZejpLZmU2roPhPaKiAE__4\">\r\n<div class=\"wDYxhc\" data-md=\"61\">\r\n<div class=\"LGOjhe\" role=\"heading\" data-attrid=\"wa:/description\" aria-level=\"3\" data-hveid=\"CBUQAA\"><strong><span class=\"ILfuVd\" lang=\"en\"><span class=\"hgKElc\">The part of your clothing that covers your arm (or part of your arm)&nbsp;is a sleeve. Some t-shirts have long sleeves, others have short sleeves, and your tank top doesn\'t have any sleeves at all.</span></span></strong></div>\r\n</div>\r\n</div>\r\n<div id=\"XVgYZejpLZmU2roPhPaKiAE__5\">\r\n<div class=\"g\">\r\n<div data-hveid=\"CAwQAA\" data-ved=\"2ahUKEwiojPLS69KBAxUZilYBHQS7AhEQFSgAegQIDBAA\">\r\n<div class=\"tF2Cxc\">\r\n<div class=\"yuRUbf\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 20, 500, 1, 16, '2023-09-18 23:30:12', '2023-09-30 22:49:22', 1, NULL),
(16, 7, 6, 14, 'Shirt for Men|| Shirt for Men|| Men Stylish Shirt || Men Printed Shirt', 'images/printed shirt.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Enhance your look by wearing this Casual Stylish Men\'s shirt, Team it with a pair of tapered denims Or Solid Chinos and Loafers for a fun Smart Casual look</strong></div>', 20, 399, 1, 16, '2023-09-18 23:32:28', '2023-09-30 22:46:58', 1, NULL),
(17, 8, 6, 16, 'Women\'s Silk Semi-Stitched Lehenga Choli ', 'images/traditional dresss_.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Traditional dress may be defined as&nbsp;the ensemble of garments, jewelry, and accessories rooted in the past that is worn by an identifiable group of people.</strong></div>', 10, 1500, 1, 16, '2023-09-18 23:36:43', '2023-09-30 22:45:15', 1, NULL),
(18, 8, 7, 21, 'Western Dresses for Women Green Floral Print Maxi Dress', 'images/WESTERN DRESS WOMEN.jpg', '<p><strong>Its quick-drying fabric helps avoid sweat patches plus it is made of crease-free fabric thus making it travel-friendly The wrap detail is very flattering for the Indian body type and is the latest design.&nbsp;</strong></p>', 20, 599, 1, 16, '2023-09-18 23:40:48', '2023-09-30 22:41:04', 1, NULL),
(19, 8, 7, 23, 'Women\'s Black Lycra Solid Three Piece Blazer Co-Ord Set', 'images/office wear dressL.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"gldrdb-hvpwih-4n6uvp-xx6a3w\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>This Co-Ords Set Is Made Of Lycra Fabric,Crafted For Every Comfort. This Knitted &amp; Dyed Dress To Make It Suitable For Daily Party Or Evening Wear.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ktl8l7-mllb9b-969aba-rso9ii\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ruybpa-pjkdyy-loewk-ce5sey\" data-cel-widget=\"aplus_feature_div\">\r\n<div id=\"aplus\" class=\"a-section a-spacing-large bucket\"></div>\r\n</div>', 20, 850, 1, 16, '2023-09-18 23:45:13', '2023-09-30 22:38:28', 1, NULL),
(20, 8, 7, 22, 'Harpa Women Casual Dress ', 'images/formal wear.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>t\'s advisable to choose&nbsp;skirts that are knee length or below the knee&nbsp;for a formal look. In terms of colour, avoid bright skirts with popping colours or sparkly embellished designs.</strong></div>', 20, 600, 1, 16, '2023-09-18 23:51:31', '2023-09-30 22:35:58', 1, NULL),
(21, 10, 7, 21, 'Boy\'s Cotton Kurta Pyjama Dress Set ', 'images/kids dress for boy_.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Make your boy look charming and trendy by buying him this piece of kurta and pajama from Pohar Creation Made frompure cotton, The fit is regular for boys clothing.&nbsp;</strong></div>', 50, 500, 1, 16, '2023-09-18 23:57:58', '2023-09-30 22:33:20', 1, NULL),
(22, 7, 6, 15, 'Unlisted Men\'s Slim Fit Full Sleeve Solid Spread Collar Dress Shirt', 'images/full sleeves shirt.jpg', '<h4 class=\"a-size-large a-spacing-none\"><span style=\"font-size: 14pt;\">A long- or short-sleeved garment for the upper part of the body, usually lightweight and having a collar and a front opening.an undergarment of cotton, or other material, for the upper part of the body.</span></h4>', 50, 475, 1, 16, '2023-09-19 13:56:57', '2023-09-30 22:31:21', 1, NULL),
(23, 7, 7, 18, 'Full Sleeves Solid Slim Fit Casual Shirt for Men', 'images/full sleeves for men (xxl) 9.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<p><strong><span class=\"a-list-item\">Comfortable to Wear and Easy to Maintain. </span></strong><strong><span class=\"a-list-item\">This shirt has been designed keeping in mind the latest trends in a casual fashion or occassional fashion.</span></strong></p>\r\n</div>', 40, 350, 1, 16, '2023-09-19 13:59:43', '2023-09-30 22:26:58', 1, NULL),
(24, 7, 7, 23, 'Men\'s Cotton Casual Shirt for Men Full Sleeves', 'images/full sleeves for men (m) 8.jpg', '<h4 class=\"a-size-large a-spacing-none\"><span style=\"font-size: 14pt;\"><strong>This Casual shirt offers a professional look for the true business man. It\'s the perfect day-to-night shirt. Wear it with some slacks to the office and throw on some jeans at night for drinks with the guys.&nbsp;</strong></span></h4>', 40, 360, 1, 16, '2023-09-19 14:03:06', '2023-09-30 22:25:41', 1, NULL),
(25, 7, 7, 21, 'Men\'s Denim Cutaway Collar Slim Fit Full Sleeve Casual Shirt', 'images/full sleeves for men (s) 7.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>The smooth solid look makes this shirt for men stand apart, while the slim collar and full sleeves add to your well look. The soft and breathable 100% denim material along with an exceptional fit ensures a comfy feel all day long.&nbsp;</strong></div>', 40, 350, 1, 16, '2023-09-19 14:14:47', '2023-09-30 22:24:02', 1, NULL),
(26, 7, 7, 22, 'Men\'s Solid Slim Fit Cotton Blend Casual Shirt with Spread Collar & Full Sleeves', 'images/full sleeves for men (xl) 6.jpg', '<p><strong>This shirt keeps the promise while keeping your look breezy and dressed down! This shirt has been designed keeping in mind the latest trends in casual fashion or occasional fashion.&nbsp;</strong></p>', 40, 999, 1, 16, '2023-09-19 14:18:45', '2023-09-30 22:19:59', 1, NULL),
(27, 7, 7, 24, 'White Beauty Cotton Full Sleeve Solid Slim Fit Trending White Formal Shirt', 'images/full sleeves for men (white) 5.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"t243ho-23m7u7-igj1i5-onwon9\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>This excellent Uathayam white shirt gives you a smart look on all occasions. Uathayam shirts are made from cotton fabric and treated with special enzyme to ensure long-lasting properties. We use international style stitch, branded button and imported fusing collar. Available in&nbsp; full Sleeves.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"bs1owx-wgeadq-v33gbi-ays9c6\" data-cel-widget=\"aplusBrandStory_feature_div\">\r\n<div id=\"aplus\" class=\"a-section a-spacing-large bucket\"></div>\r\n</div>', 40, 499, 1, 16, '2023-09-19 14:21:28', '2023-09-30 22:13:32', 1, NULL),
(28, 7, 6, 16, 'Men\'s Cotton Full Sleeve Plain Casual Shirt ', 'images/full sleeves for men (green) 4.jpg', '<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"5vesrt-mkdhyz-27b720-rzb23o\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Style - Enhance your look by wearing this Casual Stylish Men\'s shirt, Team it with a pair of tapered denims Or Solid Chinos and Loafers for a fun Smart Casual look</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"z1tfsq-nrjt0e-ybsw4g-aqutch\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"b7nvmy-67vpyp-7s87yd-zg6wba\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"za6wxn-1zw6j3-ff9ffm-pu15pi\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n</div>\r\n</div>', 25, 299, 1, 16, '2023-09-19 14:24:47', '2023-09-30 22:12:00', 1, NULL),
(29, 7, 6, 15, 'Men\'s Full Sleeve Regular Fit Casual Shirt', 'images/full sleeves for men (blue) 3.jpg', '<p><strong>The Regular Fit shirt checkered is smart fit by Gloryboyz will upgrade your look and collection. Styled with button down collar and full sleeves, the shirt features a make of cotton for extreme fresh feeling even in summer.&nbsp;</strong></p>', 20, 499, 1, 16, '2023-09-19 14:28:05', '2023-09-30 22:10:10', 1, NULL),
(30, 7, 6, 14, 'Men\'s Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves', 'images/full sleeves shirt for men (red)2.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>This Casual Solid shirt has a Slim fit, Spread collar, full button Placket, Full Sleeves, and a curved hemline Size and Fit Slim Fit The Model (height 6 foot and shoulders&nbsp; wearing size&nbsp; Please check the size chart for more details before ordering Material &amp; Care 100% Premium Cotton (Machine Wash Regular) Style Tip Enhance your look&nbsp;</strong></div>', 475, 499, 1, 16, '2023-09-19 14:30:46', '2023-09-30 22:08:55', 1, NULL),
(31, 7, 6, 17, 'Cotton Checkered Full Sleeves Regular Fit Formal Shirt for Men', 'images/full sleeves shirt for men1.jpg', '<p><strong>cotton fabric, this shirt ensures all-day comfort and breathability, making it ideal for extended wear during formal events or professional engagements.</strong></p>', 50, 599, 1, 16, '2023-09-19 14:33:48', '2023-09-30 22:07:00', 1, NULL),
(32, 7, 7, 23, ' Men\'s Plain Cotton Half Sleeve Shirt ', 'images/half sleeves for men (half sleeves-grey)l14.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<p><strong><span class=\"a-list-item\">The plain cotton shirt can be paired with jeans, shorts, or chinos for a classic and trendy look. </span></strong><strong><span class=\"a-list-item\">Breathable and Comfortable: Experience excellent airflow, keeping you cool and fresh all day long.</span></strong></p>\r\n</div>', 50, 699, 1, 16, '2023-09-19 14:45:53', '2023-09-30 22:04:37', 1, NULL),
(33, 7, 7, 21, ' Half Sleeve Relaxed Fit Tropical Hawaiian Men\'s Casual Shirt', 'images/half sleeves for men (half sleeves-teal13.jpg', '<p><strong>A crop top (also half shirt, midriff top or cutoff shirt) is&nbsp;a top that exposes the waist, navel, or abdomen.</strong></p>', 50, 580, 1, 16, '2023-09-19 14:51:27', '2023-09-30 22:02:08', 1, NULL),
(34, 7, 7, 18, ' Waffle Knit Self-Textured Slim Fit Shirt for Men\'s | Half Sleeve Shirt for Men', 'images/half sleeves for men (half sleeves)11.jpg', '<p><strong>With full sleeves and a curved hemline, this shirt provides a versatile and trendy appeal.&nbsp;</strong></p>', 50, 499, 1, 16, '2023-09-19 14:53:55', '2023-09-30 21:59:28', 1, NULL),
(35, 7, 7, 24, 'Awning Striped Half Sleeves Regular Fit Formal Shirt for Men', 'images/half sleeves for men (s)10.jpg', '<p><strong>&nbsp;Awning Striped Half Sleeves Regular Fit Formal Shirt is a stylish and sophisticated choice for men who want to make a fashion statement. Made from a blend of cotton and linen, this shirt offers a comfortable and breathable feel, perfect for all-day wear.&nbsp;</strong></p>', 70, 375, 1, 16, '2023-09-19 14:55:53', '2023-09-30 21:58:20', 1, NULL),
(36, 7, 7, 22, 'Fashion Men\'s Cotton Half Sleeve Slim Fit Casual Floral Printed Shirt', 'images/half sleeves for men (xxl)9.jpg', '<p><strong>Make heads turn &amp; be a style icon in this unique &amp; fashionable Urbano Fashion men\'s polycotton floral printed shirt with full front buttoned placket, which brings the latest trend for the fashion conscious.&nbsp;</strong></p>', 50, 375, 1, 16, '2023-09-19 14:57:34', '2023-09-30 21:55:53', 1, NULL),
(37, 7, 8, 25, 'Men\'s Cotton Half Sleeve Slim Fit Shirt Fashion Tartan Checkered Basket Weave Shirt', 'images/half sleeves for men (xl)8.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"featurebullets\" data-csa-c-slot-id=\"featurebullets_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"791wwu-ggpbu5-k1gldb-2zkpv9\" data-cel-widget=\"featurebullets_feature_div\">\r\n<div id=\"feature-bullets\" class=\"a-section a-spacing-medium a-spacing-top-small\">\r\n<p><strong><span class=\"a-list-item\">The half sleeve design adds an extra layer of sophistication and can be rolled up for a more relaxed look.</span></strong></p>\r\n</div>\r\n</div>\r\n<div id=\"provenanceCertifications_feature_div\" class=\"celwidget\" data-feature-name=\"provenanceCertifications\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"provenanceCertifications\" data-csa-c-slot-id=\"provenanceCertifications_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"a2l9sf-lnt5l-hme7yj-wnvki7\" data-cel-widget=\"provenanceCertifications_feature_div\"></div>\r\n<div id=\"globalStoreInfoBullets_feature_div\" class=\"celwidget\" data-feature-name=\"globalStoreInfoBullets\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"globalStoreInfoBullets\" data-csa-c-slot-id=\"globalStoreInfoBullets_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"dfc4xg-veqiy1-std93i-8604bs\" data-cel-widget=\"globalStoreInfoBullets_feature_div\"></div>\r\n<div id=\"andonCord_feature_div\" class=\"celwidget\" data-feature-name=\"andonCord\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"andonCord\" data-csa-c-slot-id=\"andonCord_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"d4m2c6-kb9m2z-dqggc1-xg01z4\" data-cel-widget=\"andonCord_feature_div\"></div>\r\n<div id=\"buyingOptionNostosBadge_feature_div\" class=\"celwidget\" data-feature-name=\"buyingOptionNostosBadge\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"buyingOptionNostosBadge\" data-csa-c-slot-id=\"buyingOptionNostosBadge_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"bmlw70-5fn303-yo2d84-mc9htr\" data-cel-widget=\"buyingOptionNostosBadge_feature_div\"></div>\r\n<div id=\"edpIngress_feature_div\" class=\"celwidget\" data-feature-name=\"edpIngress\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"edpIngress\" data-csa-c-slot-id=\"edpIngress_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"1ygwq3-35yz46-e3x402-5kzdct\" data-cel-widget=\"edpIngress_feature_div\"></div>\r\n<div id=\"heroQuickPromo_feature_div\" class=\"celwidget\" data-feature-name=\"heroQuickPromo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"heroQuickPromo\" data-csa-c-slot-id=\"heroQuickPromo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"u4v1ii-y58flk-flsm73-lbb0v5\" data-cel-widget=\"heroQuickPromo_feature_div\">\r\n<div id=\"hero-quick-promo-grid_feature_div\">\r\n<div id=\"hero-quick-promo\" class=\"a-row a-spacing-medium\"></div>\r\n</div>\r\n</div>\r\n</div>', 25, 380, 1, 16, '2023-09-19 14:59:43', '2023-09-30 21:53:11', 1, NULL),
(38, 7, 6, 14, 'Men\'s Half Sleeve Relaxed Fit Shirt Fashion', 'images/half sleeves for men (m)7.jpg', '<p><strong><span class=\"a-list-item\">The solid color of the Shirt makes it versatile, suitable for various occasions, from casual outings to semi-formal events.</span></strong></p>', 25, 450, 1, 16, '2023-09-19 15:02:46', '2023-09-30 21:51:21', 1, NULL),
(39, 7, 6, 16, 'Men Slim Fit Solid Spread Collar Casual Shirt & Half Sleeves', 'images/half sleeves for men (half sleeves)6.jpg', '<p><strong><span class=\"a-list-item\">The Shirt is made from a blend of polyester and cotton, ensuring a comfortable and breathable wearing experience. </span></strong><strong><span class=\"a-list-item\">Its regular fit design provides a stylish and modern look for men of all ages.</span></strong></p>', 40, 450, 1, 16, '2023-09-19 15:05:08', '2023-09-30 21:49:50', 1, NULL),
(40, 7, 6, 17, 'Man Cotton Solid Half Sleeve Shirt for Men', 'images/half sleeves for men (green)5.jpg', '<p><strong><span class=\"a-list-item\">This shirt has been designed keeping in mind the latest trends in a casual fashion or occassional fashion.</span></strong></p>', 50, 499, 1, 16, '2023-09-19 15:06:58', '2023-09-30 21:47:10', 1, NULL),
(41, 7, 6, 15, 'Regular Fit Solid Shirts for Men || Spread Collar & Half Sleeve Shirt ', 'images/half sleeves for men (white)4.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"nikx64-807p0r-r0k78t-1ksc9b\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>men shirts men shirt casual men shirt formal men shirt cotton men shirts casual men shirts stylish latest men shirt half sleeve shirt for men shirts for men shirt for men casual shirt for boys shirt men regular fit shirts for men half sleeves</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"xtdyrf-fckk89-yigtjt-tr6c75\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"jh4rj2-n8xw5b-gxbs5v-7x74ro\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"td2g6o-crpd1n-opet6l-9xbp7a\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n</div>', 20, 499, 1, 16, '2023-09-19 15:11:27', '2023-09-30 21:44:31', 1, NULL),
(42, 7, 8, 25, 'Men\'s Cotton Casual Slim Fit Half Sleeves Shirt', 'images/half sleeves for men (white)4.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Genuine product with cotton quality and on competitive price. Shirt gives rich look as per latest trend for men\'s fashion. Wear it for partywear look formal look and for casual look with jeans and formal bottoms.&nbsp;</strong></div>', 50, 279, 1, 16, '2023-09-19 15:18:26', '2023-09-30 21:42:52', 1, NULL),
(43, 7, 8, 25, 'Half Sleeve Relaxed Fit Tropical Hawaiian Men\'s Casual Shirt', 'images/half sleeves for men (red)3.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"u2a5mu-lu7hza-zb0uh1-5zstag\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>With these classics&mdash;and T-shirts, polo shirts, and outerwear to round out your look&mdash;Goodthreads is your go-to for wardrobe staples with the style you want.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"1z3yna-juf13p-etxwcz-bskl9s\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"vpliz-xykok9-oo17wl-keb93r\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"dc89j6-7tnsj8-p6epym-2j7luo\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"><hr class=\"a-divider-normal\" noshade=\"noshade\" size=\"1\"></div>\r\n</div>\r\n</div>\r\n</div>', 50, 299, 1, 16, '2023-09-19 15:20:22', '2023-09-30 21:41:12', 1, NULL),
(44, 7, 8, 25, 'Men\'s Solid Formal Half Sleeves Shirts.', 'images/half sleeves for men (blue)2.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Men\'s Solid Formal Half Sleeves Shirts.</strong></div>', 20, 499, 1, 16, '2023-09-19 15:23:23', '2023-09-30 21:39:09', 1, NULL),
(45, 7, 8, 25, 'White Stone Cotton Half Sleeve Solid Slim Fit Trending White Formal Shirt', 'images/half sleeves for men (black)1.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"rowgj8-a1hrcd-ud4w2e-nam62f\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>&nbsp;This shirt demands a place in your fashion. New look Normal cut at the Bottom. Crafted with&nbsp; cotton fabric, with regular collar &amp; cuffs. Available in Half and full Selves.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"8di0jl-fbpkwc-2w2116-xtrhjc\" data-cel-widget=\"aplusBrandStory_feature_div\">\r\n<div id=\"aplus\" class=\"a-section a-spacing-large bucket\"></div>\r\n</div>\r\n</div>', 50, 499, 1, 16, '2023-09-19 15:26:58', '2023-09-30 21:37:01', 1, NULL),
(46, 7, 7, 22, 'Stripes Cotton Regular Fit Mens Casual Shirt ', 'images/stripe shirt(red)13.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"48s7mp-hqo8sm-8lxfhc-jv2mgg\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Sporty striper poplin print, regular fit, long sleeves shirt with enzyme softner wash and branding detail at side seam</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"y4beh-4ihumw-w7hxvy-dez8t5\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"wyqpi2-25e0lb-xzwru1-yz6fbb\" data-cel-widget=\"aplus_feature_div\">\r\n<div id=\"aplus\" class=\"a-section a-spacing-large bucket\"></div>\r\n</div>\r\n</div>', 20, 389, 1, 16, '2023-09-19 15:32:49', '2023-09-30 21:34:23', 1, NULL),
(47, 7, 7, 21, 'Men\'s Cotton Blend Full Sleeve Shirt | Stylish Stripe Casual Wear Shirt for Mens', 'images/stripe shirt(mustard)12.jpg', '<p><strong>We offer the right blend of quality, style and value aimed to delight our customers.VERTICAL STRIPE FULL SLEEVES KNIT SHIRT</strong></p>', 30, 399, 1, 16, '2023-09-19 15:41:07', '2023-09-30 21:30:36', 1, NULL),
(48, 7, 7, 23, 'Men\'s Digital Printed Stylish Shirts', 'images/stripe shirt(green)11.jpg', '<p><strong>A Latest stylish shirt for men, CASUAL SHIRT Striped Design shirt REGULAR FIT Looking Slim Fit Cotton Shirt with solid pattern.</strong></p>', 25, 399, 1, 16, '2023-09-19 15:42:37', '2023-09-30 21:24:16', 1, NULL),
(49, 7, 7, 18, 'Men\'s Striped Slim Fit Cotton Casual Shirt', 'images/formal  drees for women (being) 10.jpg', '<p><strong><span class=\"a-list-item\">Striped design 100% Pure Cotton Casual Shirt for Men </span><span id=\"productTitle\" class=\"a-size-large product-title-word-break\" style=\"font-size: 12pt;\">Men\'s Striped Slim Fit Cotton Casual Shirt</span></strong></p>', 30, 375, 1, 16, '2023-09-19 15:44:13', '2023-09-30 21:20:48', 1, NULL),
(50, 7, 7, 24, 'Men\'s Button Up Collared Shirt for Striped Wear', 'images/stripe shirt(xxl)9.jpg', '<p><strong><span class=\"a-list-item\">This striped printed full sleShort Sleeve. Designed to offer an energetic look, the shirt combines the warmth of comfortable and casual feel. Offering an elevated look, it showcases a perfect fit.eve and spread collar shirt is ide</span></strong></p>', 20, 399, 1, 16, '2023-09-19 15:45:25', '2023-09-30 21:18:27', 1, NULL),
(51, 7, 6, 14, 'Regular Fit Striped Printed Casual Shirts for Men', 'images/stripe shirt(xl)8.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<p><strong><span class=\"a-list-item\">This striped printed full sleeve and spread collar shirt is ideal for all seasons and perfects to wear casual shirt in any occasion</span></strong></p>\r\n</div>', 20, 399, 1, 16, '2023-09-19 15:47:11', '2023-09-30 21:16:41', 1, NULL),
(52, 7, 6, 15, 'Men\'s Cotton Formal/Semi Formal Slim Fit Striped Printed Shirt', 'images/stripe shirt(s)y7.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Pump up your style statement with this slim-fit shirt in any formal or casual occasion. Shirts will always come to your rescue when you are confused with your outfit.</strong></div>', 20, 499, 1, 16, '2023-09-19 15:49:41', '2023-09-30 21:15:21', 1, NULL),
(53, 7, 6, 16, 'Men\'s Lining/Striped Slim Fit Cotton Casual Shirt ', 'images/stripe shirt(m)y6.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<p><strong><span class=\"a-list-item\">Soft Touch Premium Cotton Fabrics: Good capability of tenderness, air permeability and moisture absorption feels soft and comfy</span></strong></p>\r\n</div>', 50, 649, 1, 16, '2023-09-19 15:51:50', '2023-09-30 21:13:58', 1, NULL),
(54, 7, 6, 17, 'Posh & Plush Regular Fit Strips Full Sleeves Office Wear Shirt for Men ', 'images/stripe shirt(white)5.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"kdti9j-qlzc6j-vhygj5-kiyd6a\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Truly comfortable and easy to wear in every season. This shirt has been designed keeping in mind the latest trends in a casual fashion or occassional fashion.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"7c93ul-vjeds3-qod23r-62lyiw\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"l32jjy-tpu5cn-h0hvzv-hfc6y6\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"cbtaox-n7sdbz-mijot9-bjb549\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n</div>\r\n</div>', 20, 620, 1, 1, '2023-09-19 15:54:09', '2023-09-29 23:57:55', 1, NULL),
(55, 7, 8, 27, 'Solid Regular Fit Cotton Casual Strips Shirt for Men || Spread Collar || Full Sleeves', 'images/stripe shirt(red)4.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Hems Trends Present Slim Fit Cotton Shirt for Men will give a classic look to you. You can wear this for both formal and casual Occasions. Pairing this Men\'s Shirt with jeans, formal pants and shoes will give you a perfect casual look. Aur product you can trust.</strong></div>', 20, 499, 1, 1, '2023-09-19 15:57:45', '2023-09-29 23:55:51', 1, NULL),
(56, 7, 8, 27, ' Regular Fit Striped Printed Casual Shirts for Men', 'images/stripe shirt(black)3.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>&nbsp;It assures a soft and smooth touch against the skin. These Casual Shirts will go well with denim and sneakers. It helps to give you a trendy casual look.</strong></div>', 25, 499, 1, 1, '2023-09-19 16:02:38', '2023-09-29 23:54:47', 1, NULL),
(57, 7, 8, 27, 'Men\'s Striped Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves', 'images/stripe shirt(bliue)2.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>We are committed to providing high-quality, fashionable menswear that fits your lifestyle.</strong></div>', 20, 399, 1, 1, '2023-09-19 16:05:42', '2023-09-29 23:52:53', 1, NULL),
(58, 7, 8, 27, 'Men\'s Striped Regular Fit Stripe Shirt', 'images/stripe shirt1.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Perfect for your everyday use, you could pair it with a stylish pair of Jeans or Trousers complete the look.</strong></div>', 30, 399, 1, 1, '2023-09-19 16:07:45', '2023-09-29 23:50:34', 1, NULL),
(59, 7, 7, 23, 'Half Sleeve Regular Fit Tropical Hawaiian Men\'s Printed Shirt', 'images/printed shirt for men()10.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>It&rsquo;s your Life, your Rules and we will be all the way with you in style.</strong></div>', 20, 499, 1, 1, '2023-09-19 16:17:11', '2023-09-29 23:47:30', 1, NULL),
(60, 7, 7, 22, 'Men\'s & Boys Half Sleeve Slim Fit Collared Classic Designer Shirt ', 'images/printed shirt for men(xxl)9.jpg', '<p><strong>If you heading for an important casual meeting, pair this shirt with trousers and boots and for a Sunday outing with friends or family, team this shirt with a pair of jeans and sneakers and build your cool and casual personality.</strong></p>', 20, 499, 1, 1, '2023-09-19 16:22:57', '2023-09-29 23:43:34', 1, NULL),
(61, 7, 7, 18, 'Men\'s Poly Cotton Digital Printed Stitched Half Sleeve Shirt', 'images/printed shirt for men(xl)8.jpg', '<p><strong>The unique color combinations, seamlessly stitched ends and perfect collar gives you a charming look when worn for any occasions..</strong></p>', 20, 1350, 1, 1, '2023-09-19 22:36:50', '2023-09-29 23:41:07', 1, NULL),
(62, 7, 7, 24, 'Casual printed Shirt for Men|| Shirt for Men|| Men Stylish Shirt', 'images/printed shirt for men(M)7.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Men\'s classic cotton poplin checkered shirt, with a spread collar, classic front and yoke at the back.&nbsp;</strong></div>', 30, 349, 1, 1, '2023-09-19 22:41:43', '2023-09-29 23:39:10', 1, NULL),
(63, 7, 7, 21, 'Men\'s Slim Fit Spread Collar Printed Shirts', 'images/printed shirt for men(s)6.jpg', '<p><strong>Men\'s Slim Fit Spread Collar Printed Shirt in a stylish grey hue. Crafted from comfortable cotton fabric, this shirt features long sleeves for a touch of elegance. Embrace the eye-catching print and modern design, perfect for adding a dash of style to your formal or casual attire.</strong></p>', 40, 850, 1, 1, '2023-09-19 22:44:45', '2023-09-29 23:37:45', 1, NULL),
(64, 7, 6, 15, 'Men\'s Half Sleeve Relaxed Fit Shirt Fashion Tropical Printed Hawaiian Aloha', 'images/printed shirt for men(blue)5.jpg', '<p><strong>Men\'s Short Sleeve Printed Casual Button Down Standard Fit Beach Shirts Using soft fabrics and simple structure, the casual look of the beautifully printed design complements the comfortable feeling.</strong></p>', 30, 850, 1, 1, '2023-09-19 22:47:19', '2023-09-29 23:35:58', 1, NULL),
(65, 7, 6, 14, 'Men\'s Cottonblend Printed Shirt White', 'images/printed shirt for men(white)2.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>It\'s the perfect day-to-night shirt. Wear it with some slacks to the office and throw on some jeans at night for drinks with the guys. Whatever the occasion this shirt will be your go-to. The style you want and the feel you need all rolled into this shirt</strong></div>', 30, 445, 1, 1, '2023-09-19 22:49:16', '2023-09-29 23:34:10', 1, NULL),
(66, 7, 6, 16, 'Men\'s Digital Ptinted Half Sleeve Red Shirt', 'images/printed shirt for men(red)2.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>&nbsp;a simple and inexpensive method of printing your own custom designs or logos onto a shirt.</strong></div>', 30, 499, 1, 1, '2023-09-19 22:51:37', '2023-09-29 23:32:07', 1, NULL),
(67, 7, 6, 17, 'Reveal Denim Stretch Printed(Green) Shirt for Men', 'images/printed shirt for men(Green)2.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Our shirts are designed to make a statement and embrace your wild spirit. From solids to bold patterns, our shirts boast a wide range of prints and designs.</strong></div>', 30, 399, 1, 1, '2023-09-19 22:54:21', '2023-09-29 23:28:47', 1, NULL),
(68, 7, 8, 28, 'Men\'s Classic Fit Poly Cotton Casual Black Shirt for Men Sleeves', 'images/printed shirt for men(black)1.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ivmta3-ixv3hl-m0a44j-dddkej\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Perfect for your everyday use, festival you could pair it with a stylish pair of Jeans or Chinos to complete the look.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"wye9lg-dikyr0-o37jku-54kstm\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>', 30, 549, 1, 1, '2023-09-19 22:57:27', '2023-09-29 23:26:54', 1, NULL),
(69, 8, 7, 18, 'Women\'s Georgette Traditional Ethnic Long Gown Traditional Dress', 'images/traditional-brown 10.jpg', '<p><strong>The fabric is soft to skin and easy to manage.</strong></p>', 50, 1049, 1, 1, '2023-09-19 23:02:33', '2023-09-29 23:24:04', 1, NULL),
(70, 8, 7, 22, 'Women\'s Poly Crepe Crop Top with Dress', 'images/traditional-more peace 9.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Women\'s Poly Crepe Crop Top with Dress</strong></div>', 50, 1299, 1, 1, '2023-09-19 23:05:13', '2023-09-29 23:21:06', 1, NULL),
(71, 8, 7, 21, 'Women\'s Satin Georgette Long Anarkali Gowns Suits Dress', 'images/traditional-m 8.jpg', '<p><strong>Traditional dress may be defined as&nbsp;the ensemble of garments, jewelry, and accessories rooted in the past that is worn by an identifiable group of people.</strong></p>', 50, 1299, 1, 1, '2023-09-19 23:08:02', '2023-09-29 23:18:06', 1, NULL),
(72, 8, 7, 24, 'Women\'s Floral Printed Anarkali traditional Dress', 'images/traditional-xxl 7.jpg', '<p><strong>Amayra brings to you this beautiful Anarkali kurti with Pant and Dupatta Set which is made from Viscose Rayon fabric with beautiful print all over.</strong></p>', 50, 999, 1, 1, '2023-09-19 23:10:54', '2023-09-29 23:15:41', 1, NULL),
(73, 8, 7, 23, 'Women Rayon Printed Anarkali Traditional Dress', 'images/traditional-maroon 6.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>This product is made by Rayon Fabric. Ideal for daily wear, casual wear, party wear, evening wear, office wear, work wear, festival or semi-formal occasion.&nbsp;</strong></div>', 30, 1399, 1, 1, '2023-09-19 23:14:31', '2023-09-29 23:13:55', 1, NULL),
(74, 8, 6, 17, 'Georgette Dress for Women|one Piece for Women|Dresses for Women', 'images/traditional-black 5.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>It is made from high-quality, lightweight fabric that is comfortable to wear and easy to maintain. Ideal for parties and festivals...</strong></div>', 50, 1399, 1, 1, '2023-09-19 23:21:01', '2023-09-29 23:09:59', 1, NULL),
(75, 8, 6, 16, 'Women Women\'s White Rayon Straight Dress', 'images/traditional-white 4.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"57b281-xrcvgk-omgot4-8p2x6t\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Lusting after luster when you wear this Cream coloured kurta pant set by&nbsp;ziyaa. Crafted from polysilk fabric, it is light in weight and will be soft against your skin. Its unique design and beautiful colour with Chinese collar will fetch a lot of second glances as you club it with contrast coloured pumps and flashy accessory.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"phsbex-j8hybn-a4dkw-6sl6m0\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"onvg5e-yks9dl-3fzsfj-ld5bb9\" data-cel-widget=\"aplus_feature_div\">\r\n<div id=\"aplus\" class=\"a-section a-spacing-large bucket\"></div>\r\n</div>\r\n</div>', 50, 1399, 1, 1, '2023-09-19 23:24:54', '2023-09-29 23:07:54', 1, NULL);
INSERT INTO `product` (`id`, `category_id`, `variants_id`, `attribute_id`, `p_name`, `p_image`, `p_description`, `stock`, `price`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`, `is_delete`) VALUES
(76, 8, 6, 14, ' Georgette Traditional Ethnic Long Sequins Embroidered  Dress', 'images/traditional-blue 3.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>The dress is made from lightweight and airy georgette fabric, which drapes beautifully and feels soft and comfortable against the skin.</strong></div>', 50, 2250, 1, 1, '2023-09-19 23:27:02', '2023-09-29 23:05:56', 1, NULL),
(77, 8, 8, 29, ' Womens Georgette Embroidered Green Dress', 'images/traditional-green 2.jpg', '<p><strong>A major benefit of Florely Collection stylish Gown is exceptional quality.&nbsp;</strong></p>', 50, 999, 1, 1, '2023-09-19 23:29:51', '2023-09-29 23:03:45', 1, NULL),
(78, 8, 8, 29, 'Traditional Dress Women\'s Georgette Traditional Ethnic Long Sequins Embroidered Red Dress', 'images/traditional-red 1.jpg', '<p><strong>The Women\'s Georgette Round Neck Full Sleeve Dress is a stylish and elegant piece of clothing that is perfect for a range of occasions, from formal events to casual outings.&nbsp;</strong></p>', 50, 1299, 1, 1, '2023-09-19 23:33:31', '2023-09-29 23:02:19', 1, NULL),
(79, 8, 7, 18, 'Women\'s Black Rayon Crepe Foil Print Flared Ethnic Western Dress', 'images/western drees for women  black10.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Walk Like A Fashionista With Your All Time Favorite Rayon Crepe Long Flared Maxi Dress With Its Flounce. Crafted In The Soothing Color Of Green, It has ethnic prints In gold colour.</strong></div>', 25, 899, 1, 1, '2023-09-19 23:41:02', '2023-09-29 22:57:08', 1, NULL),
(80, 8, 7, 21, 'Women\'s Poly Western one Piece  Dress', 'images/western drees for women (XXL) 9.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>This dress features a playful hue that adds a pop of colour to your look. The dress features a button downed look with a belt to accentuate your curves.</strong></div>', 40, 859, 1, 1, '2023-09-19 23:44:41', '2023-09-29 22:55:09', 1, NULL),
(81, 8, 7, 23, 'Lifestyle Women Regular Western  Dress', 'images/western drees for women (xl) 8.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Lifestyle Women Regular Western &nbsp;Dress</strong></div>', 40, 749, 1, 1, '2023-09-19 23:47:04', '2023-09-29 22:53:01', 1, NULL),
(82, 8, 7, 22, 'Women Western Casual Dress', 'images/western drees for women (m) 7.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>When dressing business professional, you can wear&nbsp;tidy dresses, slacks, skirts, slacks, dark-colored suits and ties.</strong></div>', 25, 660, 1, 1, '2023-09-19 23:50:29', '2023-09-29 22:50:24', 1, NULL),
(83, 8, 7, 24, 'Women\'s Cotton Relaxed Fit Cord Set Western Suit Set ', 'images/western drees for women (s) 6.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Versatile women pants suits, casual and classy style, great to wear for outing, shopping, meeting with friends, dating, outgoing, street, casual wear and any occasion.&nbsp;</strong></div>', 20, 549, 1, 1, '2023-09-19 23:55:13', '2023-09-29 22:45:50', 1, NULL),
(84, 8, 6, 15, 'Women Fit& Flare Solid White  Dress for Women', 'images/western drees for women 5 white.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>This Casual Short Dress Is Designed In Solid Color, Party, Church. Basic Short Sleeve With Keep You Warm But Also Create A Stylish Look. Perfect Knee Length Show Your Long Legs And Add More Playfulness To This Dress.&nbsp;</strong></div>', 40, 379, 1, 1, '2023-09-19 23:59:18', '2023-09-29 22:41:21', 1, NULL),
(85, 8, 6, 14, 'Dresses for Women Regular Multi Color Green Dress', 'images/western drees for women 4 grren.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<p><strong><span class=\"a-list-item\">To choose the right size- please refer Slim Fit Dress size chart and how to measure image.</span></strong></p>\r\n</div>', 25, 380, 1, 1, '2023-09-20 00:01:43', '2023-09-29 22:37:27', 1, NULL),
(86, 8, 6, 16, 'Women\'s Polyester Blend Bodycon Midi Casual Black  Dress', 'images/western drees for women 3 black.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>dresses for women under 500, frocks for girls new fashion western, women dresses, dress for girls, dresses for women western wear, dresses for women casual, dress for womens new style, frock girls stylish fashion, dress for women western.</strong></div>', 40, 499, 1, 1, '2023-09-20 00:03:48', '2023-09-29 22:34:42', 1, NULL),
(87, 8, 6, 17, 'Women Western Dress with Flared Blue Western Dress', 'images/western drees for women 2 blue.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>The Fabric Is Great And Definitely Not Too Thin Or See-through At All. The Tie Waist Makes It Flattering For Any Figure.</strong></div>', 40, 599, 1, 1, '2023-09-20 00:06:35', '2023-09-29 22:31:59', 1, NULL),
(88, 8, 8, 30, 'Women\'s  Knee length Western Red dress', 'images/western drees for women 1 red.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"jm3qg9-2kki66-v0wr7j-5cml7v\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"jm3qg9-2kki66-v0wr7j-5cml7v\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Spruce Up Your Wardrobe With This Dress From Illi London Available On Amazon. Wear It With A Pair Of Sneakers For A Day Out Or With A Pair Of Nude Heels For The Party And You Are Sure To Make Heads Turn.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"kbld2i-kh8vtz-bga7v9-x5vei\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"nlebjx-b365ng-4n9o04-nlxdqc\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ffvftv-t1fpe-6d275m-u54agg\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"kbld2i-kh8vtz-bga7v9-x5vei\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"nlebjx-b365ng-4n9o04-nlxdqc\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ffvftv-t1fpe-6d275m-u54agg\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n</div>\r\n</div>', 50, 799, 1, 1, '2023-09-20 00:08:53', '2023-09-29 22:28:06', 1, NULL),
(89, 7, 7, 21, 'Maxi A-line Office Dress for Women and Girls Large', 'images/office drees for women (YELLOWl) 10.jpg', '<h3><span style=\"font-size: 12pt;\">The casual floral dresses, pared with white shoes makes you look young and energetic, soft fabric, light weight and breathable, make you enjoy the breezy style. The beach swing dress is perfect for go out to play in the summer, make you charming and get more attention.</span></h3>', 25, 670, 1, 1, '2023-09-20 00:16:59', '2023-09-29 22:25:02', 1, NULL),
(90, 8, 7, 23, 'Women\'s Cotton Relaxed Fit Cord Set Office  Suit Set ', 'images/office drees for women (xxl) 9.jpg', '<p><strong>Versatile women pants suits, casual and classy style, great to wear for outing, shopping, meeting with friends, dating, outgoing, street, casual wear and any occasion. The co-ord set is patterned in a way which gives an elongated effect. Perfect for your daily casual wear and can be layered and worn with anything.</strong></p>', 20, 650, 1, 1, '2023-09-20 21:08:52', '2023-09-29 22:18:26', 1, NULL),
(91, 8, 7, 18, 'Plus Size Women Pure Cotton Office Dress for Casual', 'images/office drees for women (xl) 8.jpg', '<p><span style=\"font-size: 10pt;\"><strong>THIS DRESS IS DESIGNED IN A WAY SO THAT EVERY CUSTOMER CAN WEAR IT ANYTIME. IT CAN BE STYLED WITH COTREL TROUSER FOR OFFICE USE , CAN BE STYLED TO WEAR IN A PARTY.</strong></span></p>', 52, 589, 1, 1, '2023-09-20 21:11:27', '2023-09-29 22:16:47', 1, NULL),
(92, 8, 7, 22, ' Dress for Women Sleeveless with Knee Length', 'images/office drees for women (M) 7.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>It is also important to note that we thrive to bring you the best, but, there may be a little difference in terms of fabric and colour, Wash Care: The Dry clean is recommended.Get ready with your casual look when you put on this outfit</strong></div>', 50, 999, 1, 1, '2023-09-20 21:14:07', '2023-09-29 22:12:29', 1, NULL),
(93, 8, 7, 24, 'Women\'s Mini Shift Office Dress ', 'images/office drees for women (s) 6.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"layudz-sjhrcw-7tviwe-r7ivnz\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Sleeveless cotton mini shift dress , has drawstring at waist and zipper at front.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"deibvg-cjr2m9-4byo85-bxmryr\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ygq9iq-9fttef-6w7szx-b45jve\" data-cel-widget=\"aplus_feature_div\">\r\n<div id=\"aplus\" class=\"a-section a-spacing-large bucket\"></div>\r\n</div>\r\n</div>', 40, 699, 1, 1, '2023-09-20 21:17:43', '2023-09-29 22:10:40', 1, NULL),
(94, 8, 6, 15, 'Women\'s  Bodycon Peplum Office Work White Dress', 'images/office drees for women white 5.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>It\'s the Perfect for casual wear that will lend effortless to Your Style. Product colour may slightly vary due to photographic lighting sources or your monitor settings.</strong></div>', 30, 999, 1, 1, '2023-09-20 21:20:30', '2023-09-29 22:08:32', 1, NULL),
(95, 8, 6, 14, 'Women\'s Green Poly Georgette Floral Flared Office  Dress', 'images/office drees for women green 4.jpg', '<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c<=\"\"><strong>A fusion of style and comfort, this blue poly georgette dress from Janasya will be an apt inclusion to your wardrobe.&nbsp;</strong></div>', 52, 699, 1, 1, '2023-09-20 21:22:13', '2023-09-29 22:05:41', 1, NULL),
(96, 8, 6, 16, 'Women\'s Synthetic  Office Wear Red Dress', 'images/office drees for women red 3.jpg', '<p><strong>Mustard yellow and white printed woven A-line dress with gathered detail, has a V-neck, short sleeves, side slit and flared hem. Bringing something new to the high street, Harpa aspires to deliver every woman&rsquo;s wardrobe needs &ndash; from well made staples to on trend fashion pieces.</strong></p>', 50, 699, 1, 1, '2023-09-20 21:25:22', '2023-09-29 22:04:07', 1, NULL),
(97, 8, 6, 17, 'Women Casual Office Wear Black Dress', 'images/office drees for women black 2.jpg', '<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c<=\"\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"m0pubr-tlboag-xwndmp-3qtgsd\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Harpa Puff Sleeve Office Dress</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"wwo937-onrfsr-bqevp3-hukntn\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"do1op5-qnmifx-jug5kd-cb9dzr\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"woaxx7-tgfqu-vulw5n-hk7ony\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n</div>\r\n</div>', 40, 699, 1, 1, '2023-09-20 21:27:49', '2023-09-29 22:01:14', 1, NULL),
(98, 8, 8, 31, 'Women Maxi Bodycon Office wear Dress(Blue)', 'images/office drees for women blue 1.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>When dressing business professional, you can wear&nbsp;tidy dresses, slacks, skirts, slacks, dark-colored suits and ties.&nbsp;</strong></div>', 30, 699, 1, 1, '2023-09-20 21:33:58', '2023-09-29 21:57:12', 1, NULL),
(99, 8, 7, 23, 'Women\'s A-Line Knee Length Women  Dress', 'images/formal  drees for women (being) 10.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>This A-Line Dress has Solids as pattern type and is perfect for a day out with friends or a night of get-togethers with family.</strong></div>', 20, 699, 1, 1, '2023-09-20 21:46:21', '2023-09-29 21:54:18', 1, NULL),
(100, 8, 7, 22, 'Van Heusen Women\'s Knee Length Checked Formal Wear Sheath Dress', 'images/formal  drees for women (xlx) 9.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"i0k4h-rj7dbc-mjzkii-sgb5wr\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Upgrade your wardrobe with this&nbsp;Dress from by Van Heusen.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"7pelp5-i5k96h-tsn23p-uvpeve\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"upqrfy-9wb2zd-xys61e-1znw3\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"osa663-fcmexv-wsqtvz-6si376\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n</div>\r\n</div>', 50, 699, 1, 1, '2023-09-20 21:48:34', '2023-09-29 21:52:50', 1, NULL),
(101, 8, 7, 24, 'KOTTY Women\'s Co-ords Solid Dress Set', 'images/formal  drees for women (xl) 8.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\">\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"qjaom3-bpicyn-vqqt5d-ydsaq1\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Be the epitome of class and grace while donning this red cord set from kotty. Crafted from viscose rayon , this set features a spread collar blazer and pant set with an button closure waist. The cord set is also modeled with full sleeves.Kindly ensure the size chart before buying.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"oo78v8-pmq39a-eyduhq-pcn0rd\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"l9odz1-4aispc-rd7rk2-2v9qgg\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"dntvar-svq2li-gwgyiz-uavgc5\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n</div>\r\n</div>', 50, 649, 1, 1, '2023-09-20 21:50:24', '2023-09-29 21:51:13', 1, NULL),
(102, 8, 7, 18, 'Fashion fun Women\'s co-ord Set ', 'images/formal  drees for women (s) 7.jpg', '<p><strong>You can pair this Solid Midi Embellished Dress with some nice pair of heels and you are good to go. It is perfect for every occasion from a day out with friends or a night of get-togethers with family.</strong></p>', 50, 399, 1, 1, '2023-09-20 21:52:48', '2023-09-29 21:48:24', 1, NULL),
(103, 8, 7, 21, 'Uptownie Lite Women Formal Dress', 'images/formal  drees for women (m) 6.jpg', '<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c<=\"\"><strong>A party dress is&nbsp;a dress worn especially for a party. Different types of party such as children\'s party, cocktail party, garden party and costume party would tend to require different styles of dress. One classic style of party dress for women in modern society is the little black dress.</strong></div>', 50, 599, 1, 1, '2023-09-20 21:56:28', '2023-09-29 21:46:24', 1, NULL),
(104, 8, 6, 14, 'KOTTY Women\'s Co-ords Solid Dress Blue Set', 'images/formal  drees for women (blue) 5.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"1znla6-v0k0sp-3ipq6i-ye604w\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>Be the epitome of class and grace while donning this red cord set from kotty. Crafted from viscose rayon , this set features a spread collar blazer and pant set with an button closure waist. The cord set is also modeled with full sleeves.Kindly ensure the size chart before buying.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"yj0fzf-s8m14r-j59kjs-5ds716\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"cl835k-72xydr-9g7fte-vh0kut\" data-cel-widget=\"aplus_feature_div\"></div>\r\n<div id=\"dp-ads-center-promo_feature_div\" class=\"celwidget\" data-feature-name=\"dp-ads-center-promo\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"dp-ads-center-promo\" data-csa-c-slot-id=\"dp-ads-center-promo_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"1p0fqk-tozvt4-7ula78-a6nxd3\" data-cel-widget=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\">\r\n<div id=\"dp-ads-center-promo_feature_div\"></div>\r\n</div>\r\n</div>\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"></div>', 25, 699, 1, 1, '2023-09-20 22:06:12', '2023-09-29 21:43:41', 1, NULL),
(105, 8, 6, 15, 'SIRIL Women\'s Regular Fit Co-ord Set (Red)| Office Wear...', 'images/formal  drees for women (red) 4.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>Our designers care about each and every aspect of a measurements are one of them every piece is hand examined by our experts so, that it perfectly fits you and your personality.</strong></div>', 25, 499, 1, 1, '2023-09-20 22:15:33', '2023-09-29 21:40:46', 1, NULL),
(106, 8, 6, 16, 'SIRIL Women\'s Co-ord Set Lycra Long Sleeve Blazer Inner Crop (White)', 'images/formal  drees for women (white) 3.jpg', '<h5 class=\"a-size-large a-spacing-none\"><strong><span style=\"font-size: 12pt;\">Colour Of The Actual Product May Slightly Vary Due To Different Photographic Lighting Sources Or Your Display Color Settings Or Screen Type.</span></strong></h5>', 20, 499, 1, 1, '2023-09-20 22:18:04', '2023-09-29 21:38:30', 1, NULL),
(107, 8, 6, 17, 'Selvia Women\'s Green Lycra Solid Piece Blazer Co-Ord Set', 'images/formal  drees for women (green) 2.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"clwnnh-d9jlb4-x4atpn-od2tb4\" data-cel-widget=\"productDescription_feature_div\">\r\n<div>\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\">\r\n<p><strong>This Co-Ords Set Is Made Of Lycra Fabric,Crafted For Every Comfort. This Knitted &amp; Dyed Dress To Make It Suitable For Daily Party Or Evening Wear.</strong></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"aplusBrandStory_feature_div\" class=\"celwidget\" data-feature-name=\"aplusBrandStory\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplusBrandStory\" data-csa-c-slot-id=\"aplusBrandStory_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"kqf7py-21ekej-1xhraj-ze16gz\" data-cel-widget=\"aplusBrandStory_feature_div\"></div>\r\n<div id=\"aplus_feature_div\" class=\"celwidget\" data-feature-name=\"aplus\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"aplus\" data-csa-c-slot-id=\"aplus_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"dqnsdr-7mcbiu-pc63fo-ps0gmx\" data-cel-widget=\"aplus_feature_div\">\r\n<div id=\"aplus\" class=\"a-section a-spacing-large bucket\"></div>\r\n</div>', 20, 499, 1, 1, '2023-09-20 22:19:50', '2023-09-29 21:36:00', 1, NULL),
(108, 8, 8, 32, 'SIRIL Lycra Long Puff Sleeve Sweetheart Neck Co-Ords Set for Women\'s ', 'images/formal  drees for women (blackl) 1.jpg', '<p><span class=\"a-list-item\">This Top &amp; Pant Set will give you a trendy look with its beautiful design on this Festival, Wedding Seasons, Use it as casual or formal wear for office, shopping, daily wear in home, college, family, meetings, etc.</span></p>', 25, 599, 1, 1, '2023-09-20 22:52:32', '2023-09-29 21:27:55', 1, NULL),
(109, 7, 7, 23, 'LOUIS DEVIN Silicone', 'images/watch (black) 1.jpg', '<p><strong>A watch is a portable timepiece intended to be carried or worn by a person. It is designe</strong></p>', 20, 399, 1, 1, '2023-09-20 23:16:29', '2023-09-29 21:05:32', 1, NULL),
(110, 7, 7, 21, 'ASGARD Analog Mens &', 'images/watch (blue) 2.jpg', '<p><strong><span class=\"a-list-item\">Suitable for party wedding, formal and casual occasion(Color-Bl</span></strong></p>', 80, 351, 1, 1, '2023-09-20 23:30:27', '2023-09-25 00:37:29', 1, NULL),
(111, 7, 7, 22, 'TIMEWEAR Analogue - Digital Mens Watch (Green Color)', 'images/watch (green) 3.jpg', '<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c<=\"\">Analogue watches/clocks have a mechanism to indicate time by means of mechanical structures, such as a dial and hands (hand indication type), while digital watches/clocks have a mechanism to indicate time by means of electronic structures, such as a liquid crystal and LED (number display type).</div>', 110, 549, 1, 1, '2023-09-20 23:35:21', '2023-09-24 20:54:14', 1, NULL),
(112, 7, 7, 21, 'TIMEX Analog Blue Dial Men\'s Watch-TW000T310', 'images/watch (timex-blue) 4.jpg', '<div id=\"productDescription_feature_div\" class=\"celwidget\" data-feature-name=\"productDescription\"><strong>One of the largest watch makers in the world</strong>, Timex Group companies include the Timex Business Unit (Timex, Timex Ironman, Nautica, Marc Ecko and Helix); Timex Group Luxury Watches (Salvatore Ferragamo); Sequel (Guess, Gc) and Vertime (Versace).<!--</body--></div>', 10, 999, 1, 1, '2023-09-20 23:44:14', '2023-09-24 21:01:13', 1, NULL),
(113, 7, 7, 21, 'TIMEX Analog Blue Dial Men\'s Watch-TW000T3', 'images/watch (-blue) 5.jpg', '<div id=\"title_feature_div\" class=\"celwidget\" data-feature-name=\"title\" data-csa-c-type=\"widget\"><strong>with Timex you\'re getting a watch that\'s deep-rooted in brand history with significant contributions to watch design</strong>. It\'s important to know that Timex is not a luxury brand though &ndash; with Timex you\'re getting a watch that looks good and has great functionality at an affordable price.</div>', 10, 899, 1, 1, '2023-09-20 23:52:33', '2023-10-03 13:39:22', 1, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `client_id` varchar(100) DEFAULT NULL,
  `password` varchar(10) NOT NULL,
  `u_type_id` int(20) NOT NULL,
  `u_profile` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `u_name`, `email`, `phone_no`, `client_id`, `password`, `u_type_id`, `u_profile`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_active`, `is_delete`) VALUES
(1, 'Vairag Bavadiya', 'vairagbavadiya5@gmail.com', '9909409153', NULL, '0509', 1, './user_images/cartoon-3.png', '2023-09-02 16:43:07', '2023-10-03 13:40:47', 1, 1, 1, NULL),
(16, 'kaushik_gorasiya', 'kaushikgorasiya@gmail.com', '7383415839', NULL, '8733', 2, './user_images/cartoon-4.jpg', '2023-09-02 18:16:36', '2023-09-03 16:44:45', 16, 16, 1, NULL),
(23, 'test', 'df@gmail.com', '11', NULL, '11', 2, '', '2023-09-03 22:22:34', '2023-09-03 22:22:34', 23, 23, 1, NULL),
(38, 'Kavita Bavadiya', 'kavitabavadiya0509@gmail.com', '9909409153', '2ff02981-0b94-4263-97f0-7ae7e26aca1d', '1234', 3, '', '2023-09-26 00:10:43', '2023-09-26 00:10:43', 38, 38, 1, NULL),
(39, 'Swami', 'Swami@gmail.com', '852741963', NULL, '55', 3, '', '2023-10-05 22:49:54', '2023-10-05 22:49:54', 39, 39, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(20) NOT NULL,
  `type_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `is_active` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `var_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_active`, `is_delete`) VALUES
(6, 'Size', '2023-09-17 21:30:36', NULL, 1, NULL, 1, NULL),
(7, 'Color', '2023-09-17 21:30:58', NULL, 1, NULL, 1, NULL),
(8, 'Style & Fit', '2023-09-17 21:31:25', NULL, 1, NULL, 1, NULL),
(9, 'Material', '2023-09-17 21:32:13', '2023-10-03 01:44:06', 1, 1, 1, NULL);

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
-- Indexes for table `billing_address`
--
ALTER TABLE `billing_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

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
-- AUTO_INCREMENT for table `billing_address`
--
ALTER TABLE `billing_address`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

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
-- Constraints for table `billing_address`
--
ALTER TABLE `billing_address`
  ADD CONSTRAINT `fk_bill_add_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_address_id` FOREIGN KEY (`address_id`) REFERENCES `billing_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_deitalis_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalis_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalis_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
