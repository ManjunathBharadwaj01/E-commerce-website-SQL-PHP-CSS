-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2021 at 02:39 PM
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
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(3, 'Manjunath Bharadwaj V', 'manjunathbharadwaj059', 'c6bf9106a065cb0667c06985d148d1b2'),
(5, 'Likith Krishna', 'likiithkrishnacs054', 'e0481ff703fb160e8020e25d6bd91372'),
(7, 'administrator', 'cseadmin', 'c93ccd78b2076528346216b3b2f701e6');

--
-- Triggers `tbl_admin`
--
DELIMITER $$
CREATE TRIGGER `deletelogs` BEFORE DELETE ON `tbl_admin` FOR EACH ROW INSERT INTO tbl_logs VALUES(null,OLD.id,'Deleted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertlog` AFTER INSERT ON `tbl_admin` FOR EACH ROW INSERT INTO tbl_logs VALUES(NULL, NEW.id,'Inserted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatelogs` AFTER UPDATE ON `tbl_admin` FOR EACH ROW INSERT INTO tbl_logs VALUES(null,NEW.id,'Updated',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(2, 'electronics', 'Product_Category_239.jpg', 'Yes', 'Yes'),
(3, 'fashion', 'Product_Category_758.jpg', 'Yes', 'Yes'),
(5, 'decor', 'Product_Category_385.jpg', 'Yes', 'Yes'),
(6, 'Toys', '', 'No', 'Yes'),
(7, 'Sports', 'Product_Category_984.jpg', 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `tr_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `c_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`tr_id`, `admin_id`, `action`, `c_date`) VALUES
(1, 5, 'Inserted', '2021-12-27 19:01:52'),
(2, 5, 'Updated', '2021-12-27 19:04:39'),
(3, 6, 'Inserted', '2021-12-27 19:07:00'),
(4, 6, 'Deleted', '2021-12-27 19:07:12'),
(5, 7, 'Inserted', '2021-12-27 19:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `product` varchar(100) NOT NULL,
  `price` varchar(255) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `total` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_contact` varchar(15) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `product`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(6, 'Laptop', '25000.00', '1.00', '25000', '2021-12-27 02:21:21', 'Delivered', 'peter ', '1234567890', 'peter@abc.com', '456,3rd lane,xyz street'),
(7, 'Sweatshirt', '1499.00', '2.00', '2998', '2021-12-27 02:22:02', 'Ordered', 'david', '9087654321', 'xyz@demo.com', '7th street, 5th lane, NYC'),
(8, 'Badminton racket', '2999.00', '4.00', '11996', '2021-12-27 02:22:47', 'On Delivery', 'John', '3216549870', 'demo@sce.com', '5th cross, 4th block, blore');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(1, 'Laptop', '8gb RAM,  1TB SSD + 256GB HDD, Windows 11', '25000.00', 'Product-Name-1417.png', 2, 'Yes', 'Yes'),
(3, 'Decor', 'Stunning Home decor of fine fabric', '4500.00', 'Product-Name-6985.png', 5, 'Yes', 'Yes'),
(4, 'Sweatshirt', 'Comfortable sweatshirt, grey colour', '1499.00', 'Product-Name-5559.png', 3, 'Yes', 'Yes'),
(5, 'Stuff toy for kids', 'Blue stuff toy', '499.00', 'Product-Name-214.jpg', 6, 'Yes', 'Yes'),
(6, 'Badminton racket', 'racket', '2999.00', 'Product-Name-8565.jpg', 7, 'No', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`tr_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `tr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
