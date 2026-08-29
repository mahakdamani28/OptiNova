-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 27, 2026 at 06:48 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `optinova_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(2, 'admin', '$2y$10$WaXKaIkVLw8Ibi8gMKbkAeC4ZjW9HRCyuptNCSlfqU8CTUV5baND6');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `message` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `name`, `email`, `phone`, `date`, `time`, `message`, `created_at`) VALUES
(1, 'optinova', 'optinova83@gmail.com', '8149645247', '2026-06-24', '16:55:00', 'do come fast', '2026-04-24 08:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `created_at`) VALUES
(1, 4, 52, 1, '2025-08-17 09:26:25'),
(2, 4, 198, 1, '2025-08-17 10:07:01'),
(3, 4, 167, 1, '2025-08-17 10:07:37'),
(4, 4, 104, 1, '2025-08-17 16:36:59'),
(5, 4, 232, 4, '2025-08-17 16:47:01'),
(6, 4, 248, 1, '2025-08-17 16:47:16'),
(7, 4, 249, 1, '2025-08-17 16:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE IF NOT EXISTS `contact_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'Mahak Damani', 'mahekdamani@gmail.com', 'GOOD PRODUCT WORTH BUYING', '2026-02-02 07:13:56'),
(2, 'optinova', 'optinova83@gmail.com', 'awesome product', '2026-04-22 08:23:29'),
(3, 'optinova', 'optinova83@gmail.com', 'good product', '2026-04-23 13:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci NOT NULL,
  `payment_method` enum('cod','upi') COLLATE utf8mb4_general_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Dispatched','Completed','Cancelled') COLLATE utf8mb4_general_ci DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `full_name`, `email`, `phone`, `address`, `payment_method`, `total_amount`, `order_date`, `created_at`, `status`) VALUES
(1, 6, 'Mahak Damani', 'mahekdamani@gmail.com', '8149659787', 'ring road', 'cod', 3596.00, '2026-02-05 17:05:33', '2026-02-05 17:05:33', 'Cancelled'),
(2, 6, 'Mahak Damani', 'mahekdamani@gmail.com', '8149659787', 'ring road', 'upi', 3596.00, '2026-02-05 17:06:13', '2026-02-05 17:06:13', 'Dispatched'),
(3, 6, 'Ananya Sharma', 'ananya23@gmail.com', '8149659787', 'umred', 'cod', 1199.00, '2026-02-05 17:10:33', '2026-02-05 17:10:33', 'Cancelled'),
(4, 6, 'Ananya Sharma', 'ananya23@gmail.com', '8149659787', 'umred', 'cod', 149.00, '2026-02-05 17:15:43', '2026-02-05 17:15:43', 'Pending'),
(5, 6, 'Ananya Sharma', 'ananya23@gmail.com', '8149659787', 'umred', 'cod', 299.00, '2026-02-05 17:33:13', '2026-02-05 17:33:13', 'Dispatched'),
(6, 6, 'Ananya Sharma', 'ananya23@gmail.com', '8149659787', 'katol', 'upi', 1439.20, '2026-02-05 17:33:58', '2026-02-05 17:33:58', 'Completed'),
(7, 6, 'Ananya Sharma', 'ananya23@gmail.com', '8149659787', 'wardha', 'upi', 799.20, '2026-02-05 17:34:47', '2026-02-05 17:34:47', 'Cancelled'),
(8, 6, 'optinova', 'optinova83@gmail.com', '8149645247', 'a sq', 'upi', 3557.20, '2026-04-22 08:25:54', '2026-04-22 08:25:54', 'Dispatched'),
(9, 6, 'optinova', 'optinova83@gmail.com', '8149645247', 'ajni', 'upi', 4237.20, '2026-04-23 13:53:51', '2026-04-23 13:53:51', 'Completed'),
(10, 6, 'optinova', 'optinova83@gmail.com', '8149645247', 'ajni', 'upi', 5795.00, '2026-04-24 08:25:04', '2026-04-24 08:25:04', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(22, 76, 245, 1, 99.00),
(20, 76, 10, 1, 999.00),
(13, 73, 132, 1, 1249.00),
(21, 76, 161, 1, 449.00),
(12, 72, 312, 3, 1699.00),
(14, 74, 183, 1, 199.00),
(15, 75, 297, 1, 1399.00),
(16, 76, 268, 1, 1499.00),
(17, 76, 269, 1, 1499.00),
(19, 76, 72, 1, 999.00),
(18, 76, 309, 1, 1699.00),
(23, 87, 103, 1, 1399.00),
(24, 91, 103, 1, 1399.00),
(25, 92, 318, 1, 1439.20),
(26, 92, 141, 1, 1299.00),
(27, 92, 233, 1, 99.00),
(28, 92, 319, NULL, 299.00),
(29, 93, 103, 1, 1399.00),
(30, 94, 102, 1, 999.00),
(31, 95, 52, 4, 1199.00),
(32, 96, 103, 1, 1399.00),
(33, 1, 2, 1, 399.00),
(34, 1, 248, 2, 999.00),
(35, 1, 139, 1, 1199.00),
(36, 3, 0, 1, 1199.00),
(37, 4, 0, NULL, 149.00),
(38, 5, 208, 1, 299.00),
(39, 6, 318, 1, 1439.20),
(40, 7, 10, 1, 799.20),
(41, 8, 52, 1, 1199.00),
(42, 8, 53, 1, 999.00),
(43, 8, 309, 1, 1359.20),
(44, 9, 103, 2, 1399.00),
(45, 9, 318, 1, 1439.20),
(46, 10, 256, 1, 1399.00),
(47, 10, 248, 2, 999.00),
(48, 10, 60, 2, 1199.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `discount_price`, `image`, `category`, `created_at`, `is_deal`) VALUES
(1, 'Green Neon Shades', 'Bright neon green kid’s sunglasses', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks1.jpeg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(2, 'Black Flower Shades', 'Black frame with flower detail', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks2.jpeg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(3, 'Pink Heart Glasses', 'Heart-shaped pink kids’ sunglasses', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks3.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(4, 'Black Cartoon Flower Shades', 'Black novelty flower sunglasses', 499.00, 399.20, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks4.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 1),
(5, 'Blue Two-Tone Shades', 'Light blue & dark blue frame sunglasses', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks5.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(6, 'Pixel Gamer Shades', 'Pixel block design sunglasses', 599.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks6.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(7, 'Classic Black Glasses', 'Simple black frame sunglasses', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks7.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(8, 'Green Cartoon Shades', 'Fun green cartoon-style sunglasses', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks8.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(9, 'Green Checkered Glasses', 'Checkered green kids’ sunglasses', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks9.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(10, 'Pink & Black Shades', 'Set of pink and black sunglasses (3pcs)', 999.00, 799.20, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks10.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 1),
(11, 'Dino Blue Shades', 'Blue frames with decorative flower', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks11.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(12, 'Red & Blue Fun Shades', 'Red temples with blue frame sunglasses', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks12.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(13, 'Sunny Starburst', 'Bright yellow frames to light up everyday.', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks13.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(14, 'Bubblegum Pop', 'Pink shades for that extra dose of cuteness.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks14.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(15, 'Cool Cruiser', 'Sporty blue shades for mini adventurers.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks15.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(16, 'Rainbow Rider', 'Multicolour fun for every sunny afternoon.', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks16.jpg', 'Kids Sunglasses', '2025-08-12 15:00:56', 0),
(17, 'Cherry Spark', 'Red hot style with playful vibes.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks17.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(18, 'Minty Fresh', 'Cool green frames for a breezy look.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks18.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(19, 'Ocean Breeze', 'Deep blue tones for little beach lovers.', 349.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks19.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(20, 'Lemon Twist', 'Zesty yellow for a sunny smile.', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks20.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(21, 'Coral Charm', 'Peachy tones for a sweet and stylish day.', 549.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks21.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(22, 'Funky Frames', 'Bold colors for the little trendsetter.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks22.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(23, 'Sunny Safari', 'Perfect for playful outdoor adventures! (2pcs)', 699.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks23.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(24, 'Starry Shine', 'Glittery charm for magical sunny days.', 449.00, 359.20, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks24.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 1),
(25, 'Swan Glide Shades', 'Elegant swan-shaped frames for little fashionistas.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks25.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(26, 'Retro Rounders', 'Classic round lenses for timeless style.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks26.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(27, 'Pink Oval Glam', 'Bright pink oval frames that pop with personality.', 449.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks27.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(28, 'Blue Frame Cool', 'Stylish blue frames with a bold, trendy vibe.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks28.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(29, 'Checkerboard Chic', 'Black frames with red arms and checkered accents.', 299.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks29.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(30, 'Rainbow Reflectors', 'Vibrant rainbow arms with dark lenses.', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks30.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(31, 'Pink Aviator Sparkle', 'Classic aviator shape with a soft pink twist.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks31.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(32, 'Midnight Shades', 'Simple and sleek black frames for everyday cool.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks32.jpg', 'Kids Sunglasses', '2025-08-12 15:04:56', 0),
(49, 'Bear Hug Shades', 'Adorable bear-shaped frames in a soft beige tone.', 449.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks49.jpg', 'Kids Sunglasses', '2025-08-12 15:34:45', 0),
(48, 'Bat Buddy Shades', 'Black bat-shaped sunglasses.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks48.jpg', 'Kids Sunglasses', '2025-08-12 15:34:45', 0),
(47, 'Retro Panda Rounds', 'Monochrome panda-style circles.', 299.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks47.jpg', 'Kids Sunglasses', '2025-08-12 15:34:45', 0),
(46, 'Alien Eyes Shades', 'Futuristic black-and-green lenses.', 299.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks46.jpg', 'Kids Sunglasses', '2025-08-12 15:34:45', 0),
(45, 'Shark Attack Shades', 'Blue shades with fin detailing', 329.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks45.jpg', 'Kids Sunglasses', '2025-08-12 15:34:45', 0),
(33, 'Square Edge Style', 'Bold square frames with a modern edge.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks33.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(34, 'Ocean Breeze', 'Blue gradient lenses that evoke a cool sea vibe.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks34.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(35, 'Cat-Eye Charm', 'Classic cat-eye frames with a chic black finish.', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks35.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(36, 'Polka Dot Delight', 'Black frames dotted with playful white polka dots.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks36.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(37, 'Mermaid Glow Shades', 'Shimmer in style with these aqua-blue sunglasses!', 299.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks37.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(38, 'Twist & Swirl Shades', 'Pastel blue frames with colorful twirly arms.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks38.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(39, 'Sunbeam Pop Shades', 'Bright yellow lenses with red-orange accents.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks39.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(40, 'Green Zoom Goggles', 'Vibrant green and black sporty shades.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks40.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(41, 'Jungle Snap Shades', 'Fun green animal-shaped frames.', 449.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks41.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(42, 'Lime Spark Shades', 'Cool lime-colored frames with a sleek design.', 399.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks42.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(43, 'Peachy Pop Glasses', 'Adorable peach-shaped pink glasses!', 429.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks43.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(44, 'Panda Coolers', 'Cute panda-face round glasses with black ears.', 599.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks44.jpg', 'Kids Sunglasses', '2025-08-12 15:14:05', 0),
(50, 'Kitty Charm Shades', 'Chic cat-shaped sunglasses, red bow.', 499.00, NULL, 'OptiNova/images/sunglasses/kids/kidsunglasses/ks50.jpg', 'Kids Sunglasses', '2025-08-12 15:34:45', 0),
(51, 'Aviator Black', 'Classic metal frame, lightweight.', 1299.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms1.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(52, 'Round Retro', 'Vintage-inspired, stylish finish.', 1199.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms2.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(53, 'Aviator Bronze', 'Sleek, UV-protected lenses.', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms3.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(54, 'Bold Wayfarer', 'Matte black with square fit.', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms4.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(55, 'Dark Aviator', 'Stylish with metal rim.', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms5.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(56, 'Blocky Wayfarer', 'Thick frame, sharp edges.', 1199.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms6.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(57, 'Retro Aviator', 'Lightweight & glare-free.', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms7.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(58, 'Cool Grey', 'Clean and classic look.', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms8.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(59, 'Brown Round', 'Wood-textured vibe.', 1399.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms9.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(60, 'Red Vision', 'Sporty red-tint shades.', 1199.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms10.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(61, 'Grey Round', 'Subtle tone, retro design.', 799.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms11.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(62, 'Matte Edge', 'Sleek and bold build.', 1399.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms12.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(63, 'Jet Black', 'Pure black, wide lens.', 1599.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms13.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(64, 'Street Style', 'Urban classic, daily wear.', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms14.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(65, 'StyMinimal Matte', 'Soft edges, trendy look (2pcs)', 1999.00, 1599.20, 'OptiNova/images/sunglasses/men/mensunglasses/ms15.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 1),
(66, 'Classic Edge', 'Sleek black with sharp detailing.', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms16.jpg', 'Men Sunglasses', '2025-08-12 15:52:07', 0),
(67, 'Amber Vision', 'Pack of two', 1299.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms17.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(68, 'Matte Jet', 'Minimalist frame, round lens', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms18.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(69, 'Flat Black', 'Clean design, dark tone', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms19.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(70, 'Rust Lens', 'Warm amber tint for sunny days', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms20.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(71, 'Gold Curve', 'Gold-toned sleek metal finish', 1099.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms21.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(72, 'Matte Round', 'Timeless shape, smooth surface', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms22.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(73, 'Urban Fold', 'Chunk arms with foldable fit', 1199.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms23.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(74, 'Flat Lens', 'Edge-to-edge glass look', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms24.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(75, 'Pilot Style', 'Retro pilot shape with black lens', 1299.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms25.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(76, 'Tan Shade', 'Matte finish with soft brown hue', 1199.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms26.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(77, 'Beach Vibe', 'Glossy finish with beach-ready look', 1699.00, 1359.20, 'OptiNova/images/sunglasses/men/mensunglasses/ms27.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 1),
(78, 'Royal Gold', 'Round frame with gold temples', 1599.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms28.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(79, 'Light Curve', 'Sleek design with thin sides', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms29.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(80, 'Silver Frost', 'Light silver rim with icy finish', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms30.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(81, 'Golden Retro', 'Vintage design with a golden metal frame', 1799.00, 1439.20, 'OptiNova/images/sunglasses/men/mensunglasses/ms31.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 1),
(82, 'Golden Curve', 'Curved golden rim for a luxurious look', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms32.jpg', 'Men Sunglasses', '2025-08-12 15:53:53', 0),
(83, 'Silver Round', 'Classic round frame with silver finish.', 799.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms33.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(84, 'Jet Black', 'Bold black shades for a sharp look.', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms34.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(85, 'Ocean Fade', 'Blue gradient lenses with a modern vibe.', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms35.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(86, 'Flat Matte Black', 'Matte black frame for a sleek stealthy look.', 1599.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms36.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(87, 'Dark Gold Trim', 'Rimless design with gold-detailed temples.', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms37.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(88, 'Stone White', 'Unique white marble frame for bold style.', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms38.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(89, 'Desert Bronze', 'Warm bronze frame with gradient lenses.', 1299.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms39.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(90, 'Blue Edge', 'Sharp blue-rimmed sunglasses with black tint.', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms40.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(91, 'Cream Minimalist', 'Simple and elegant cream-tone frames.', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms41.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(92, 'Pitch Black Round', 'Round black frame for classic style (2pcs).', 1599.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms42.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(93, 'Silver Shine', 'Bright silver tone with clean edges.', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms43.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(94, 'Dark Wings', 'Wing-style shades with dark lens finish.', 799.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms44.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(95, 'White Frame Black Tint', 'Bold white frame with deep black tint.', 899.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms45.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(96, 'Round Retro Black', 'Minimalist vintage shades perfect for casual and formal looks.', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms46.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(97, 'Classic Matte Black', 'Bold matte finish for a strong and confident style statement.', 1199.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms47.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(98, 'Green Tinted Rounds', 'Fashion-forward green lenses with sleek black frames.', 1399.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms48.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(99, 'Grey Urban Round', 'Modern street-style shades with a soft monochrome vibe.', 999.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms49.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(100, 'Silver Blue Reflector', 'Cool-toned reflectors ideal for bright sunny outings.', 1399.00, NULL, 'OptiNova/images/sunglasses/men/mensunglasses/ms50.jpg', 'Men Sunglasses', '2025-08-12 15:56:05', 0),
(101, 'Black Slim', 'Minimalist black with a sleek silhouette.', 849.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws1.jpeg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(102, 'Brown Retro', 'Vintage brown-tinted with a gold bridge.', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws2.jpeg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(103, 'Pink Heart Shades', 'Romantic heart-shaped pink with pearl, chain.', 1399.00, 1119.20, 'OptiNova/images/sunglasses/women/womensunglasses/ws3.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 1),
(104, 'Silver Frame Black', 'Elegant silver with UV-protected black lenses.', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws4.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(105, 'Black-Gold Aviator', 'Bold aviator lenses.', 849.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws5.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(106, 'Oversized Gold', 'Luxurious oversized gold frames.', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws6.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(107, 'Pastel Pink Slim', 'Soft pink-tinted oval lenses.', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws7.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(108, 'Rose Gold Mirror', 'Trendy rose-gold mirrored (2pcs).', 1699.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws8.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(109, 'Gradient Tint Set', 'Set of gradient-tinted lenses (3pcs).', 2299.00, 1839.20, 'OptiNova/images/sunglasses/women/womensunglasses/ws9.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 1),
(110, 'Beige Tint Slim', 'Neutral beige-tinted lenses.', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws10.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(111, 'Pink Floral Round', 'Pastel pink lenses, floral-inspired.', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws11.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(112, 'Blue Tint Rectangular', 'Cool blue-tinted rectangular lenses.', 1149.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws12.jpg', 'Women Sunglasses', '2025-08-14 15:04:51', 0),
(113, 'Pink Ombre Square', 'Square frames with pink ombre lens', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws13.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(114, 'Pearl Accent Round', 'Elegant round lenses with pearl-embellished', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws14.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(115, 'Brown Oversized Square', 'Oversized brown gradient lenses', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws15.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(116, 'Matte Black Angular', 'Bold matte black frames', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws16.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(117, 'Sunset Gradient Oversized', 'Soft pink-orange gradient lenses', 1299.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws17.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(118, 'Pink Gradient Glam', 'Feminine pink gradient lenses', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws18.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(119, 'Brown Retro Square', 'Classic brown-tinted lenses', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws19.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(120, 'Gold Trim Angular', 'Angular black with gold accents', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws20.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(121, 'Black Round Metal', 'Timeless black in thin metal frame', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws21.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(122, 'Matte Black Retro Round', 'Minimal matte black round frames', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws22.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(123, 'Orange Pop Rectangle', 'Bright orange rectangular lenses', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws23.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 0),
(124, 'Slim Black', 'Sleek black rectangular frames', 1699.00, 1359.20, 'OptiNova/images/sunglasses/women/womensunglasses/ws24.jpg', 'Women Sunglasses', '2025-08-14 15:10:54', 1),
(125, 'Bold Chain Cat Eye', 'Statement cat-eye frames with chain', 1399.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws25.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(126, 'Pastel Round', 'Soft pastel lenses in round', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws26.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(127, 'Minimal Black Rectangles', 'Sleek, narrow black frames', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws27.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(128, 'Classic Round Metals', 'Timeless round metal frames', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws28.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(129, 'Ombre Gradient Oversize', 'Large lenses with ombre fade', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws29.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(130, 'Gold Accent Cat Eye', 'Elegant cat-eye frames with gold detailing.', 1299.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws30.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(131, 'Violet Fade Cat Eye', 'Gradient purple lenses for standout style.', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws31.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(132, 'Pink Ombre Rounds', 'Soft pink gradient lenses', 1249.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws32.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(133, 'Rose Gold Rectangles', 'Rose gold with subtle tinted lenses.', 1149.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws33.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(134, 'Ultra-Slim Black', 'Minimalist narrow frames for a clean look.', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws34.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(135, 'White Retro Rectangles', 'Bold rectangular frames, vintage-inspired design.', 899.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws35.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(136, 'Ivory Beige', 'Neutral beige frames with matte finish', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws36.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(137, 'Pink Heart', 'Playful heart-shaped frames', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws37.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(138, 'Oversized Black', 'Bold oversized frames', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws38.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(139, 'Retro Purple', 'Vintage-inspired lenses with purple tint', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws39.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(140, 'Pink Chain', 'Trendy frames paired with pink chain.', 1399.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws40.jpg', 'Women Sunglasses', '2025-08-14 15:14:00', 0),
(141, 'Pearl Studded', 'Elegant black with delicate pearl studs.', 1299.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws41.jpg', 'Women Sunglasses', '2025-08-14 15:54:04', 0),
(142, 'Brown Ombre Shades', 'Smooth brown gradient lenses.', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws42.jpg', 'Women Sunglasses', '2025-08-14 15:54:04', 0),
(143, 'Round Black Retro', 'Minimalist round frames with vintage appeal.', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws43.jpg', 'Women Sunglasses', '2025-08-14 15:54:04', 0),
(144, 'Green Round', 'Bright green lenses summer look.', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws44.jpg', 'Women Sunglasses', '2025-08-14 15:54:04', 0),
(145, 'Hexagon Frame White', 'Unique hexagon frames in white finish.', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws45.jpg', 'Women Sunglasses', '2025-08-14 15:54:04', 0),
(146, 'Emerald Green Round', 'Lush green lenses with gold accents.', 1199.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws46.jpg', 'Women Sunglasses', '2025-08-14 15:54:04', 0),
(147, 'Gradient Pink Round', 'Soft shaded gradient lenses with lightweight frame.', 1299.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws47.jpg', 'Women Sunglasses', '2025-08-14 15:59:50', 0),
(148, 'Sky Blue Glare', 'Cool blue-tinted lenses for fresh style.', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws48.jpg', 'Women Sunglasses', '2025-08-14 15:59:50', 0),
(149, 'Midnight Edge', 'Chic gold-rimmed aviators with a warm tint', 1099.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws49.jpg', 'Women Sunglasses', '2025-08-14 15:59:50', 0),
(150, 'Golden Hour Glare', 'Sleek black frames with a bold square cut', 999.00, NULL, 'OptiNova/images/sunglasses/women/womensunglasses/ws50.jpg', 'Women Sunglasses', '2025-08-14 15:59:50', 0),
(151, 'Aqualens 30lens pack', 'Daily lenses with 10H comfort', 699.00, NULL, 'OptiNova/images/lens/transparent/transparent/t1.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(152, 'Air Optix HydraGlyde', 'Monthly lenses with moisture matrix', 2499.00, 1999.20, 'OptiNova/images/lens/transparent/transparent/t2.jpg', 'Clear Lens', '2025-08-14 16:07:47', 1),
(153, 'Aqualens 10lens pack', 'Comfortable daily disposable lenses (10h)', 399.00, NULL, 'OptiNova/images/lens/transparent/transparent/t3.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(154, 'Aqualens 5lens pack', 'Affordable, high-quality soft lenses', 199.00, NULL, 'OptiNova/images/lens/transparent/transparent/t4.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(155, 'Clear Vision Daily', 'Clear daily wear contact lenses (6 lenses)', 799.00, 639.20, 'OptiNova/images/lens/transparent/transparent/t5.jpg', 'Clear Lens', '2025-08-14 16:07:47', 1),
(156, 'Polylite Monthly', 'Flexible monthly contact lenses (3 lenses)', 299.00, NULL, 'OptiNova/images/lens/transparent/transparent/t6.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(157, 'Aqualens 3lens pack', 'Colorful box, 10-hour hydration', 399.00, NULL, 'OptiNova/images/lens/transparent/transparent/t7.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(158, 'BIO 55 Advance', 'Advanced monthly soft lenses', 499.00, NULL, 'OptiNova/images/lens/transparent/transparent/t8.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(159, 'Optify Clear', 'Clear lenses for everyday use', 999.00, NULL, 'OptiNova/images/lens/transparent/transparent/t9.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(160, 'Ultra Comfort 24H', 'All-day wear with ultra comfort (30 lenses)', 3399.00, 2719.20, 'OptiNova/images/lens/transparent/transparent/t10.jpg', 'Clear Lens', '2025-08-14 16:07:47', 1),
(161, 'Bio Clear 10H (2 lenses)', 'Soft daily lenses with hydration', 449.00, NULL, 'OptiNova/images/lens/transparent/transparent/t11.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(162, 'Aqualens 24H 3lens pack', 'Affordable lenses, 24H wear', 999.00, NULL, 'OptiNova/images/lens/transparent/transparent/t12.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(163, 'Bausch & Lomb iConnect Monthly', 'Stylish lenses for a bold, natural look (3 lenses)', 299.00, NULL, 'OptiNova/images/lens/transparent/transparent/t13.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(164, 'Acme Supreme', 'Hydrating clear lenses for daily wear (6 lenses)', 675.00, NULL, 'OptiNova/images/lens/transparent/transparent/t14.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(165, 'Bausch + Lomb iConnect 10h', 'Soft contact lenses for lasting comfort', 899.00, NULL, 'OptiNova/images/lens/transparent/transparent/t15.jpg', 'Clear Lens', '2025-08-14 16:07:47', 0),
(166, 'Frost Gray', 'Cool-toned gray for a sharp, icy look', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl1.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(167, 'Jade Green', 'Vibrant green shade for bold eyes', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl2.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(168, 'Honey Brown', 'Warm honey tint for natural warmth', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl3.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(169, 'Cloud Mist', 'Soft gray blend with a misty glow', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl4.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(170, 'Chestnut Glow', 'Deep chestnut for a natural sparkle', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl5.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(171, 'Arctic Blue', 'Bright blue eyes with a frosty finish', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl6.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(172, 'Golden Bronze', 'Shimmering bronze for radiant eyes', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl7.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(173, 'Olive Mist', 'Muted olive for soft, earthy tones', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl8.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(174, 'Caramel Shine', 'Golden caramel for a glowing gaze', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl9.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(175, 'Sunset Brown', 'Warm tones inspired by dusk light', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl10.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(176, 'Amethyst Dream', 'Violet hue for a magical eye effect', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl11.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(177, 'Ocean Storm', 'Deep blue shade with bold intensity', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/single/cl12.jpg', 'Color Lens', '2025-08-14 16:10:20', 0),
(178, 'Candy Pack Misty Gray', 'Daily Disposable', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/aqualens/al1.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 0),
(179, 'Candy Pack Walnut Brown', 'Daily Disposable', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/aqualens/al2.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 0),
(180, 'Candy Pack Spicy Gray', 'Daily Disposable', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/aqualens/al3.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 0),
(181, 'Candy Pack Stormy Gray', 'Daily Disposable', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/aqualens/al4.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 0),
(182, 'Candy Pack Submarine Blue', 'Daily Disposable', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/aqualens/al5.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 0),
(183, 'Candy Pack Mystery Brown', 'Daily Disposable', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/aqualens/al6.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 0),
(184, 'Candy Pack Envy Green', 'Daily Disposable', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/aqualens/al7.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 0),
(185, 'Candy Pack Mocha Brown', 'Daily Disposable', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/aqualens/al8.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 0),
(186, 'Candy Pack Tricky Turquoise', 'Daily Disposable', 199.00, NULL, 'OptiNova/images/lens/color/colorlens/aqualens/al9.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 0),
(187, 'Candy Pack Dusky Brown', 'Daily Disposable', 199.00, 159.20, 'OptiNova/images/lens/color/colorlens/aqualens/al10.jpg', 'Aqua Lens', '2025-08-14 16:12:58', 1),
(188, 'Peacock Green & Stormy Gray', 'Aqua Color Combo', 1099.00, NULL, 'OptiNova/images/lens/color/colorlens/combo/combo1.jpg', 'Combo', '2025-08-14 16:15:10', 0),
(189, 'Mocha Brown, Tricky Turquoise, Walnut Brown & Misty Gray', 'Aqua Color Combo', 799.00, NULL, 'OptiNova/images/lens/color/colorlens/combo/combo2.jpg', 'Combo', '2025-08-14 16:15:10', 0),
(190, 'Stormy Gray & Tricky Turquoise', 'Aqua Color Combo', 1099.00, NULL, 'OptiNova/images/lens/color/colorlens/combo/combo3.jpg', 'Combo', '2025-08-14 16:15:10', 0),
(191, 'Mystery Brown, Dusky Brown, Stormy Grey & Spicy Grey', 'Aqua Color Combo', 799.00, NULL, 'OptiNova/images/lens/color/colorlens/combo/combo4.jpg', 'Combo', '2025-08-14 16:15:10', 0),
(192, 'Spicy Gray & Submarine Blue', 'Aqua Color Combo', 1099.00, 879.20, 'OptiNova/images/lens/color/colorlens/combo/combo5.jpg', 'Combo', '2025-08-14 16:15:10', 1),
(193, 'Tricky Turquoise & Spicy Gray', 'Aqua Color Combo', 1099.00, NULL, 'OptiNova/images/lens/color/colorlens/combo/combo6.jpg', 'Combo', '2025-08-14 16:15:10', 0),
(194, 'Tricky Turquoise & Peacock Green', 'Aqua Color Combo', 1099.00, NULL, 'OptiNova/images/lens/color/colorlens/combo/combo7.jpg', 'Combo', '2025-08-14 16:15:10', 0),
(195, 'Mystery Brown, Tricky Turquoise, Spicy Gray & Submarine Blue', 'Aqua Color Combo', 799.00, NULL, 'OptiNova/images/lens/color/colorlens/combo/combo8.jpg', 'Combo', '2025-08-14 16:15:10', 0),
(196, 'Spicy Gray & Dusky Brown', 'Aqua Color Combo', 1099.00, 879.20, 'OptiNova/images/lens/color/colorlens/combo/combo9.jpg', 'Combo', '2025-08-14 16:15:10', 1),
(197, 'Aqua Lens Comfort Solution', 'Gentle and effective lens cleaning. (360ml)', 399.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol1.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(198, 'ReNu Fresh Contact Lens Solution', 'Keeps your lenses fresh and clean. (365ml)', 549.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol2.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(199, 'Optify Lens Care Solution', 'Compact travel-friendly kit. (30ml)', 149.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol3.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(200, 'BioTrue Hydration Solution', 'Inspired by the natural biology for superior comfort. (120ml)', 349.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol4.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(201, 'Appollo Lensol Care', 'Advanced cleaning formula to keep your lenses crystal clear. (120ml)', 199.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol5.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(202, 'Soft Comfort Solution', 'Hydrating solution that reduces dryness and irritation. (60ml)', 99.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol6.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(203, 'Multisol Plus Cleaning Solution', 'Instant moisture boost for dry and tired eyes. (70ml)', 199.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol7.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(204, 'Boston Simplus Multi-Action Solution', 'Professional-grade cleaner for rigid gas permeable lenses. (105ml)', 499.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol8.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(205, 'Lenskart Anti-Fog Spray', 'Chemical-free lens care. (30ml)', 149.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol9.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(206, 'Aqua Soft Solution', 'Double the cleaning power with this economical twin pack. (360ml/pack)', 479.00, NULL, 'OptiNova/images/solutionsncases/solutions/sol10.jpg', 'Solutions', '2025-08-14 16:16:40', 0),
(207, 'Peppa Pig Lens Case', 'Cute pig-shaped lens case to store your lenses with style.', 299.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc1.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(208, 'Sunny Bear Lens Case', 'Bright yellow bear-shaped design to keep lenses safe and cheerful.', 299.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc2.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(209, 'Kawaii Bunny Lens Case', 'Adorable bunny-ear lens case for a playful touch to lens care.', 299.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc3.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(210, 'Blue Dolphin Lens Case', 'Marine-inspired dolphin design for ocean lovers.', 249.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc4.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(211, 'Pink Hippo Lens Case', 'Fun hippo design to brighten your daily lens routine.', 299.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc5.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(212, 'Duck Travel Lens Kit', 'Compact travel kit with mirror and tweezers, duck-themed.', 299.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc6.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(213, 'Blue Whale Lens Case', 'Cute whale-shaped lens case for a splash of joy.', 199.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc7.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(214, 'Lavender Travel Lens Kit', 'Stylish purple lens kit with built-in mirror for on-the-go care.', 249.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc8.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(215, 'Brown Bear Lens Case', 'Cute teddy bear face lens case for fun and safe storage.', 299.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc9.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(216, 'Mint Green Lens Kit', 'Fresh minty design with tools for perfect lens care.', 149.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc10.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(217, 'Classic Silver Lens Kit', 'Elegant silver design with case and mirror included.', 149.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc11.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(218, 'Pastel Lens Case Set', 'Set of pastel-colored lens cases for variety and style.', 299.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc12.jpg', 'Lens Cases & Solutions', '2025-08-16 06:30:12', 0),
(219, 'Golden Honeycomb Lens Case', 'Premium honeycomb pattern lens case with mirror & tools for safe and stylish storage.', 299.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc13.jpg', 'Lens Cases & Solutions', '2025-08-16 06:43:24', 0),
(220, 'Yellow Dotted Travel Lens Kit', 'Vibrant yellow dotted case with full kit for easy lens care on the go.', 149.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc14.jpg', 'Lens Cases & Solutions', '2025-08-16 06:43:24', 0),
(221, 'Mint Fresh Lens Kit', 'Refreshing mint green lens kit with tools for a clean and hygienic experience.', 149.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc15.jpg', 'Lens Cases & Solutions', '2025-08-16 06:43:24', 0),
(222, 'Silver Stripe Lens Case', 'Elegant silver striped design with mirror and compartments for secure storage.', 149.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc16.jpg', 'Lens Cases & Solutions', '2025-08-16 06:43:24', 0),
(223, 'Crystal Blue Lens Case', 'Cool blue geometric pattern case with mirror and tools for lens safety.', 199.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc17.jpg', 'Lens Cases & Solutions', '2025-08-16 06:43:24', 0),
(224, 'Black Marble Lens Case', 'Bold black marble design with durable build and essential lens accessories.', 149.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc18.jpg', 'Lens Cases & Solutions', '2025-08-16 06:43:24', 0),
(225, 'Emerald Scales Lens Case', 'Unique green scale pattern case with mirror, tweezers, and storage kit.', 149.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc19.jpg', 'Lens Cases & Solutions', '2025-08-16 06:43:24', 0),
(226, 'Leopard Print Lens Case', 'Stylish leopard print design for a chic and protective lens storage solution.', 149.00, NULL, 'OptiNova/images/solutionsncases/len cases/lc20.jpg', 'Lens Cases & Solutions', '2025-08-16 06:43:24', 0),
(227, 'Wooden Owl Lens Case', 'Cute wooden-style case with owl design, durable and stylish for safe lens storage.', 199.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc1.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(228, 'Classic Grey Eyewear Case', 'Sleek and minimal grey case offering solid protection for your glasses.', 149.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc2.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(229, 'Color Fabric Lens Pouch', 'Soft fabric pouches in multiple colors, lightweight and travel-friendly.', 59.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc3.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(230, 'Yellow Glasses Case with Cleaning Kit', 'Hard-shell yellow case with a built-in compartment for accessories.', 169.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc4.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(231, 'Blush Pink Compact Case', 'Smooth pink protective case, compact design ideal for handbags.', 99.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc5.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(232, 'Floral Print Lens Case', 'Colorful floral design, sturdy build with soft lining for scratch-free storage.', 99.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc6.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(233, 'Matte Capsule Lens Case (Blue & Green)', 'Minimal capsule-shaped hard case, perfect for compact storage.', 99.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc7.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(234, 'Pastel Pink Premium Case', 'Soft pastel pink finish, stylish and protective for everyday use.', 129.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc8.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(235, 'Lavender Minimal Lens Case', 'Elegant lavender shade case with a slim profile for modern look.', 89.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc9.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(236, 'Black Travel Lens Case', 'Strong and sleek black case with curved edges, designed for daily use.', 89.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc10.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(237, 'Olive Green Classic Case', 'Hard protective olive case with soft inner lining for safe lens keeping.', 99.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc11.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(238, 'Coral Pink Slim Case', 'Slim and stylish coral pink hard case, easy to carry and lightweight.', 139.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc12.jpg', 'Glass Case', '2025-08-16 07:12:30', 0),
(239, 'Vibrant Capsule Lens Case (Set of 3)', 'Fun and colorful capsule-shaped hard cases in red, blue, and yellow. Perfect for kids and travel.', 149.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc13.jpg', 'Glass Case', '2025-08-16 07:17:39', 0),
(240, 'Bunny Ears Grey Case', 'Cute grey case with bunny ears design, soft-lined for extra lens protection.', 179.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc14.jpg', 'Glass Case', '2025-08-16 07:17:39', 0),
(241, 'Fuchsia Pink Slim Case', 'Bright pink slim hard case, stylish and lightweight for daily use.', 99.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc15.jpg', 'Glass Case', '2025-08-16 07:17:39', 0),
(242, 'Bear Ears Amber Case', 'Cute amber-colored case with bear ears, durable build for playful storage.', 99.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc16.jpg', 'Glass Case', '2025-08-16 07:17:39', 0),
(243, 'Pastel Peach Wide Case', 'Soft pastel peach wide case, elegant and compact for gentle eyewear care.', 129.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc17.jpg', 'Glass Case', '2025-08-16 07:17:39', 0),
(244, 'Black Executive Case', 'Premium matte black hard case with flap cover, ideal for professional use.', 99.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc18.jpg', 'Glass Case', '2025-08-16 07:17:39', 0),
(245, 'Beige Minimal Case', 'Sleek beige slim case with a minimal look, lightweight and easy to carry.', 99.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc19.jpg', 'Glass Case', '2025-08-16 07:17:39', 0),
(246, 'Lavender Compact Case', 'Soft lavender shade case, compact and protective for everyday eyewear storage.', 99.00, NULL, 'OptiNova/images/solutionsncases/glasscase/gc20.jpg', 'Glass Case', '2025-08-16 07:17:39', 0),
(247, 'Vintage Cat-Eye Charm', 'A retro twist for your everyday style.', 1199.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce1.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(248, 'Urban Chic Frame', 'Sleek design for bold personalities.', 999.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce2.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(249, 'Elegant Oval Edge', 'Graceful curves with timeless appeal.', 1499.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce3.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(250, 'Bold Statement Cat-Eye', 'Make every glance unforgettable.', 1699.00, 1359.20, 'OptiNova/images/eyeglasses/cateye/ce4.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 1),
(251, 'Classic Black Cat-Eye', 'A true wardrobe staple.', 1299.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce5.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(252, 'Rose Gold Accent', 'Soft elegance with a warm glow.', 799.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce6.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(253, 'Minimalist Cat-Eye', 'Understated elegance for daily wear.', 999.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce7.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(254, 'Luxury Pearl White', 'A pure, sophisticated style choice.', 1099.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce8.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(255, 'Glossy Jet Black', 'Sharp and sleek for all occasions.', 1299.00, 1039.20, 'OptiNova/images/eyeglasses/cateye/ce9.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 1),
(256, 'Royal Blue Edge', 'A pop of color for your look.', 1399.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce10.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(257, 'Golden Frame Grace', 'Chic metallic touch for any outfit.', 899.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce11.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(258, 'Smokey Grey Cat-Eye', 'Subtle tones for effortless charm.', 999.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce12.jpg', 'Cat-Eye', '2025-08-16 07:24:38', 0),
(259, 'Blue Marble Cateye', 'Blue marble frame with bold cateye design.', 1099.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce13.jpg', 'Cat-Eye', '2025-08-16 07:30:01', 0),
(260, 'Classic Brown Cateye', 'Warm brown matte finish for a classic look.', 1199.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce14.jpg', 'Cat-Eye', '2025-08-16 07:30:01', 0),
(261, 'Beige Elegance', 'Soft beige frame with subtle elegance.', 1099.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce15.jpg', 'Cat-Eye', '2025-08-16 07:30:01', 0),
(262, 'Emerald Charm', 'Deep green tone for a bold fashion statement.', 1099.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce16.jpg', 'Cat-Eye', '2025-08-16 07:30:01', 0),
(263, 'Wine Red Gloss', 'Rich wine-red frame with glossy finish.', 1199.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce17.jpg', 'Cat-Eye', '2025-08-16 07:30:01', 0),
(264, 'Sky Breeze', 'Light sky-blue frame for a fresh look.', 999.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce18.jpg', 'Cat-Eye', '2025-08-16 07:30:01', 0),
(265, 'Blue Silver Fusion', 'Dual-tone blue and silver frame for modern style.', 1499.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce19.jpg', 'Cat-Eye', '2025-08-16 07:30:01', 0),
(266, 'Blush Pink', 'Soft pink frame with feminine charm.', 999.00, NULL, 'OptiNova/images/eyeglasses/cateye/ce20.jpg', 'Cat-Eye', '2025-08-16 07:30:01', 0),
(267, 'Urban Round', 'Minimal round frame for a clean, modern look.', 1199.00, NULL, 'OptiNova/images/eyeglasses/round/ro1.jpg', 'round', '2025-08-17 07:31:47', 0),
(268, 'Vintage Curve', 'Classic retro vibe with a bold frame.', 1499.00, NULL, 'OptiNova/images/eyeglasses/round/ro2.jpg', 'round', '2025-08-17 07:31:47', 0),
(269, 'Soft Edge Round', 'Lightweight frame for all-day comfort.', 1099.00, NULL, 'OptiNova/images/eyeglasses/round/ro3.jpg', 'round', '2025-08-17 07:31:47', 0),
(270, 'Retro Vision', 'Stylish round lenses with vintage charm.', 1199.00, NULL, 'OptiNova/images/eyeglasses/round/ro4.jpg', 'round', '2025-08-17 07:31:47', 0),
(271, 'Classic Loop', 'Timeless design for everyday wear.', 1599.00, 1279.20, 'OptiNova/images/eyeglasses/round/ro5.jpg', 'round', '2025-08-17 07:31:47', 1);
INSERT INTO `products` (`id`, `name`, `description`, `price`, `discount_price`, `image`, `category`, `created_at`, `is_deal`) VALUES
(272, 'Bold Retro', 'Make a statement with this bold frame.', 1199.00, NULL, 'OptiNova/images/eyeglasses/round/ro6.jpg', 'round', '2025-08-17 07:31:47', 0),
(273, 'Matte Round', 'Smooth matte finish for a subtle style.', 1699.00, NULL, 'OptiNova/images/eyeglasses/round/ro7.jpg', 'round', '2025-08-17 07:31:47', 0),
(274, 'Vintage Circle', 'A throwback look with modern comfort.', 1699.00, 1359.20, 'OptiNova/images/eyeglasses/round/ro8.jpg', 'round', '2025-08-17 07:31:47', 1),
(275, 'Elegant Round', 'Light frame with a classy round shape.', 1099.00, NULL, 'OptiNova/images/eyeglasses/round/ro9.jpg', 'round', '2025-08-17 07:31:47', 0),
(276, 'Retro Chic', 'Trendy round lenses for a bold look.', 1299.00, NULL, 'OptiNova/images/eyeglasses/round/ro10.jpg', 'round', '2025-08-17 07:31:47', 0),
(277, 'Retro Luxe', 'Premium retro design with rich detailing.', 1299.00, NULL, 'OptiNova/images/eyeglasses/round/ro11.jpg', 'round', '2025-08-17 07:31:47', 0),
(278, 'Retro Edge', 'Bold retro round frame with sharp style.', 1299.00, NULL, 'OptiNova/images/eyeglasses/round/ro12.jpg', 'round', '2025-08-17 07:31:47', 0),
(279, 'Sky Blue Retro', 'Bright sky-blue round frames for a fun, casual look.', 1299.00, NULL, 'OptiNova/images/eyeglasses/round/ro13.jpg', 'round', '2025-08-17 07:35:32', 0),
(280, 'Classic Brown Retro', 'Warm brown tones for timeless everyday style.', 1299.00, NULL, 'OptiNova/images/eyeglasses/round/ro14.jpg', 'round', '2025-08-17 07:35:32', 0),
(281, 'Sunny Yellow Retro', 'Vibrant yellow frames for a cheerful, bold vibe.', 1399.00, NULL, 'OptiNova/images/eyeglasses/round/ro15.jpg', 'round', '2025-08-17 07:35:32', 0),
(282, 'Mint Green Retro', 'Soft mint green shade for a fresh, trendy appeal.', 1799.00, NULL, 'OptiNova/images/eyeglasses/round/ro16.jpg', 'round', '2025-08-17 07:35:32', 0),
(283, 'Transparent Coffee Retro', 'Clear brownish tint for a modern minimal look.', 1699.00, NULL, 'OptiNova/images/eyeglasses/round/ro17.jpg', 'round', '2025-08-17 07:35:32', 0),
(284, 'Tortoise Shell Retro', 'Patterned tortoise shell design for classic charm.', 1599.00, NULL, 'OptiNova/images/eyeglasses/round/ro18.jpg', 'round', '2025-08-17 07:35:32', 0),
(285, 'Chocolate Brown Retro', 'Deep chocolate shade for bold sophistication.', 1799.00, NULL, 'OptiNova/images/eyeglasses/round/ro19.jpg', 'round', '2025-08-17 07:35:32', 0),
(286, 'Golden Beige Retro', 'Light golden-beige tone for a soft and elegant style.', 1999.00, NULL, 'OptiNova/images/eyeglasses/round/ro20.jpg', 'round', '2025-08-17 07:35:32', 0),
(287, 'Urban Square', 'Matte black square frame for a bold city look.', 1299.00, NULL, 'OptiNova/images/eyeglasses/square/sq1.jpg', 'square', '2025-08-17 07:39:53', 0),
(288, 'Classic Vintage', 'Retro-inspired square frames with a timeless vibe.', 1099.00, NULL, 'OptiNova/images/eyeglasses/square/sq2.jpg', 'square', '2025-08-17 07:39:53', 0),
(289, 'Minimalist Edge', 'Lightweight design with sleek black edges.', 999.00, NULL, 'OptiNova/images/eyeglasses/square/sq3.jpg', 'square', '2025-08-17 07:39:53', 0),
(290, 'Retro Charm', 'Square frame with vintage brown tone.', 1399.00, 1119.20, 'OptiNova/images/eyeglasses/square/sq4.jpg', 'square', '2025-08-17 07:39:53', 1),
(291, 'Office Pro', 'Perfect blend of style and professionalism.', 1199.00, NULL, 'OptiNova/images/eyeglasses/square/sq5.jpg', 'square', '2025-08-17 07:39:53', 0),
(292, 'Bold Statement', 'Thick frame for a confident and strong look.', 1599.00, 1279.20, 'OptiNova/images/eyeglasses/square/sq6.jpg', 'square', '2025-08-17 07:39:53', 1),
(293, 'Sharp Vision', 'Clean-cut square edges for precision styling.', 1299.00, NULL, 'OptiNova/images/eyeglasses/square/sq7.jpg', 'square', '2025-08-17 07:39:53', 0),
(294, 'Vintage Scholar', 'Classic square frame for intellectual charm.', 1599.00, NULL, 'OptiNova/images/eyeglasses/square/sq8.jpg', 'square', '2025-08-17 07:39:53', 0),
(295, 'Everyday Classic', 'Reliable square style for daily wear.', 1399.00, NULL, 'OptiNova/images/eyeglasses/square/sq9.jpg', 'square', '2025-08-17 07:39:53', 0),
(296, 'Urban Retro', 'A mix of city chic and old-school vibes.', 1099.00, NULL, 'OptiNova/images/eyeglasses/square/sq10.jpg', 'square', '2025-08-17 07:39:53', 0),
(297, 'Formal Edge', 'Ideal for meetings and office wear.', 1399.00, NULL, 'OptiNova/images/eyeglasses/square/sq11.jpg', 'square', '2025-08-17 07:39:53', 0),
(298, 'Classic Brown', 'Warm brown tone for a soft, stylish touch.', 1499.00, NULL, 'OptiNova/images/eyeglasses/square/sq12.jpg', 'square', '2025-08-17 07:39:53', 0),
(299, 'Crystal Edge', 'Trendy crystal clear edged square eyeglasses', 1299.00, NULL, 'OptiNova/images/eyeglasses/square/sq13.jpg', 'square', '2025-08-17 07:42:31', 0),
(300, 'Golden Vision', 'Premium golden metal square eyeglasses', 1499.00, NULL, 'OptiNova/images/eyeglasses/square/sq14.jpg', 'square', '2025-08-17 07:42:31', 0),
(301, 'Midnight Frame', 'Bold black midnight square eyeglasses', 1699.00, NULL, 'OptiNova/images/eyeglasses/square/sq15.jpg', 'square', '2025-08-17 07:42:31', 0),
(302, 'Bookish Charm', 'Classic square eyeglasses with a bookish vibe', 1499.00, NULL, 'OptiNova/images/eyeglasses/square/sq16.jpg', 'square', '2025-08-17 07:42:31', 0),
(303, 'Classic Matte', 'Minimal matte black square eyeglasses', 1499.00, NULL, 'OptiNova/images/eyeglasses/square/sq17.jpg', 'square', '2025-08-17 07:42:31', 0),
(304, 'Amber Glow', 'Elegant amber golden square eyeglasses', 1299.00, NULL, 'OptiNova/images/eyeglasses/square/sq18.jpg', 'square', '2025-08-17 07:42:31', 0),
(305, 'Gunmetal Sleek', 'Sleek gunmetal finish square eyeglasses', 1599.00, NULL, 'OptiNova/images/eyeglasses/square/sq19.jpg', 'square', '2025-08-17 07:42:31', 0),
(306, 'Golden Minimal', 'Lightweight minimal golden square eyeglasses', 1399.00, NULL, 'OptiNova/images/eyeglasses/square/sq20.jpg', 'square', '2025-08-17 07:42:31', 0),
(307, 'Black & Clear Browline', 'Classic black browline frame with clear lower rims for a timeless smart look.', 1299.00, NULL, 'OptiNova/images/eyeglasses/browline/bl1.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(308, 'Golden Edge Browline', 'Elegant golden-rimmed browline design for a premium and polished style.', 1499.00, NULL, 'OptiNova/images/eyeglasses/browline/bl2.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(309, 'Dual-Tone Maroon Browline', 'Stylish maroon and silver combination for a bold and confident appearance.', 1699.00, 1359.20, 'OptiNova/images/eyeglasses/browline/bl3.jpg', 'Browline', '2025-08-17 07:49:03', 1),
(310, 'Brown Classic Browline', 'Warm brown frame with silver accents for a refined everyday look.', 1599.00, NULL, 'OptiNova/images/eyeglasses/browline/bl4.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(311, 'Navy Blue Sleek Browline', 'Slim navy blue frame with a minimalistic browline design for modern wearers.', 1599.00, NULL, 'OptiNova/images/eyeglasses/browline/bl5.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(312, 'Matte Black Minimal Browline', 'Lightweight matte black frame for a clean, professional appearance.', 1699.00, NULL, 'OptiNova/images/eyeglasses/browline/bl6.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(313, 'Mint Green Retro Browline', 'Refreshing mint green frame paired with sleek black arms for a trendy vibe.', 1799.00, NULL, 'OptiNova/images/eyeglasses/browline/bl7.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(314, 'Silver-Black Browline', 'Classic silver frame with bold black browline for a sophisticated edge.', 1299.00, NULL, 'OptiNova/images/eyeglasses/browline/bl8.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(315, 'Glossy Black Browline', 'Shiny black finish with comfortable fit for everyday professional wear.', 1499.00, NULL, 'OptiNova/images/eyeglasses/browline/bl9.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(316, 'Jet Black Modern Browline', 'Dark jet black rims with lightweight construction for comfort and durability.', 1699.00, NULL, 'OptiNova/images/eyeglasses/browline/bl10.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(317, 'Charcoal Grey Browline', 'Dark grey and black combination frame for a subtle yet stylish profile.', 1399.00, NULL, 'OptiNova/images/eyeglasses/browline/bl11.jpg', 'Browline', '2025-08-17 07:49:03', 0),
(318, 'Gold Accent Browline', 'Black and gold combination with a sleek browline for a luxurious finish.', 1799.00, 1439.20, 'OptiNova/images/eyeglasses/browline/bl12.jpg', 'Browline', '2025-08-17 07:49:03', 1),
(319, 'Crystal Clear Browline', 'Lightweight clarity with a modern touch.', 1299.00, NULL, 'OptiNova/images/eyeglasses/browline/bl13.jpg', 'Browline', '2025-08-17 07:51:21', 0),
(320, 'Walnut Brown Classic', 'Rich earthy tones for timeless style.', 1599.00, NULL, 'OptiNova/images/eyeglasses/browline/bl14.jpg', 'Browline', '2025-08-17 07:51:21', 0),
(321, 'Silver Frame Minimalist', 'Sleek silver frame for a clean, sharp look.', 1499.00, NULL, 'OptiNova/images/eyeglasses/browline/bl15.jpg', 'Browline', '2025-08-17 07:51:21', 0),
(322, 'Charcoal Fade Browline', 'Dark fade design for a bold impression.', 1699.00, NULL, 'OptiNova/images/eyeglasses/browline/bl16.jpg', 'Browline', '2025-08-17 07:51:21', 0),
(323, 'Monochrome Sleek', 'Understated black-and-white elegance.', 1499.00, NULL, 'OptiNova/images/eyeglasses/browline/bl17.jpg', 'Browline', '2025-08-17 07:51:21', 0),
(324, 'Modern Black Browline', 'Crisp black frame with modern charm.', 1399.00, NULL, 'OptiNova/images/eyeglasses/browline/bl18.jpg', 'Browline', '2025-08-17 07:51:21', 0),
(325, 'Ebony Gold Accent', 'Luxury black frame with gold details.', 1599.00, NULL, 'OptiNova/images/eyeglasses/browline/bl19.jpg', 'Browline', '2025-08-17 07:51:21', 0),
(326, 'Steel Grey Bold', 'Strong steel-toned frame for a confident look.', 1699.00, 1359.20, 'OptiNova/images/eyeglasses/browline/bl20.jpg', 'Browline', '2025-08-17 07:51:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_general_ci,
  `full_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `age` int NOT NULL,
  `gender` enum('Male','Female','Other') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `profile_img`, `phone`, `address`, `full_name`, `age`, `gender`) VALUES
(5, 'Jiya Bavse', 'jiyabavse27@gmail.com', '$2y$10$91pMG8a/5idpgEj0FiuJFeDAvKHy8tQJBnotSZFi/8Oa3sbCEy4yS', '2025-11-03 06:33:23', NULL, '9850232599', 'Omkar Nagar', '', 20, 'Female'),
(2, 'optinova', 'optinova83@gmail.com', '$2y$10$9daH2r9sD1TfaJfXj4qat.cPBsOlyNqDVP9UecqIW2Cr6.kBeaGT.', '2025-08-11 17:22:45', NULL, '8143567932', 'Itwari', '', 22, 'Male'),
(6, 'Ananya Sharma', 'ananya23@gmail.com', '$2y$10$dIOnHyNOxp4cStAkblT8s.AR/qKyi33P7USTN7Dm9ETwNxI.U.6Ay', '2026-02-05 15:20:42', 'uploads/1776846120_model1.jpg', '9922881232', 'Ring Road', '', 23, 'Female'),
(4, 'Mahak Damani', 'mahekdamani@gmail.com', '$2y$10$ypjxTOA8gbEvG0Xwg0UGt.omSOomu13JEeh5fmkRV98XV/moafksK', '2025-08-17 09:14:47', 'uploads/1768837967_model2.jpg', '8149646789', 'Ambedkar Square', '', 21, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `created_at`) VALUES
(3, 2, 0, '2025-08-14 11:23:43'),
(25, 4, 102, '2025-08-18 14:01:56'),
(24, 4, 276, '2025-08-18 13:52:33');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
