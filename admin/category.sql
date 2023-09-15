-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Sep 15, 2023 at 08:39 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `category_description`, `image`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`) VALUES
(7, 'Mens-Wear', '<p><strong>Well-dressed men understand that when they look like their most professional, put-together and capable selves, that the world relates to them accordingly and operates with them on a higher level. Clothing acts as the outward representation of their skills and personality, tying their positive attributes together into a comprehensive package. That&rsquo;s why regardless of whether or not they have an interest in fashion, attention is always paid to maintaining their image.</strong></p>', '../categories/images/81bEvE7vyLL._UX679_.jpg', 38, 38, '2023-09-15 23:38:36', '2023-09-15 23:39:32', 1),
(8, 'Womens-Wear', '<p><em><strong>is a budget-friendly clothing store that has colorful and trendy pieces for women. Their selection of graphic tees, sweatpants and joggers, and sneakers...</strong></em></p>', '../categories/images/71BMG8EorsL._UL1500_.jpg', 38, 38, '2023-09-15 23:45:32', '2023-09-15 23:45:32', 1),
(9, 'Childrens-Wear', '<p><strong>Introducing our delightful collection of kids dresses, specially designed to make your little ones look adorable and stylish. Crafted with utmost care and attention to detail, these dresses are perfect for various occasions, from casual outings to special events. With a combination of comfort, quality, and trendy designs, our kids dresses are sure to be a hit among both children and parents alike.The freshness of the color will draw everybody&rsquo;s attention and your kid will be an instant hit! The dress is complete in itself and you can pair it nice accessory to break the perfect look. Breathable and comfortable wear experience in all seasons. This dress is perfect for a day out. This type of dress is known for its feminine and playful look. The dress is designed specifically for birthday parties and summer events, making it an excellent choice for parents who want their girl to look stylish and cute.</strong></p>', '../categories/images/41Np040iagL._UY741_.jpg', 38, 38, '2023-09-15 23:49:41', '2023-09-15 23:51:17', 1),
(10, 'Boys-Wear', '<p><strong>Step up your Style Quotient by wearing this Casual Shirt from LEWEL. Team it up with your favourite pair of jeans, denim shorts and sneakers when you head out to work, party, vacation or anything your heart desires. It&rsquo;s your Life, your Rules and we will be all the way with you in style.</strong></p>', '../categories/images/61skoH0rMsL._UY741_.jpg', 38, 38, '2023-09-16 00:01:15', '2023-09-16 00:01:15', 1),
(11, 'Girls-Wear', '<div id=\"title_feature_div\" class=\"celwidget\" data-feature-name=\"title\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"title\" data-csa-c-slot-id=\"title_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ktanjj-9k2v96-xnmk0v-atgnb1\" data-cel-widget=\"title_feature_div\">\r\n<div id=\"titleSection\" class=\"a-section a-spacing-none\">\r\n<h1 class=\"a-size-large a-spacing-none\"><span style=\"font-size: 18pt;\"><strong><span id=\"productTitle\" class=\"a-size-large product-title-word-break\">luyk Girls Floral Printed Top with <span style=\"font-size: 14pt;\">Trousers...</span></span></strong></span></h1>\r\n</div>\r\n</div>\r\n<div id=\"qpeTitleTag_feature_div\" class=\"celwidget\" data-feature-name=\"qpeTitleTag\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"qpeTitleTag\" data-csa-c-slot-id=\"qpeTitleTag_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"f9408f-hapg7y-jfwjod-6m6qe8\" data-cel-widget=\"qpeTitleTag_feature_div\"></div>\r\n<div id=\"cmrsSummary_feature_div\" class=\"celwidget\" data-feature-name=\"cmrsSummary\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"cmrsSummary\" data-csa-c-slot-id=\"cmrsSummary_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"cwdiip-prctva-86s4ps-ap479t\" data-cel-widget=\"cmrsSummary_feature_div\"></div>', '../categories/images/61OTdInzd9L._UY741_.jpg', 38, 38, '2023-09-16 00:06:16', '2023-09-16 00:06:16', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cat_created_by` (`created_by`),
  ADD KEY `fk_cat_updated_by` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_cat_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cat_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
