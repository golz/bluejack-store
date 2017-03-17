-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2016 at 01:45 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prk`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE IF NOT EXISTS `carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `user_id`, `status`) VALUES
(10, 3, 'Completed'),
(11, 4, 'Completed'),
(12, 4, 'Active'),
(13, 10, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE IF NOT EXISTS `cart_detail` (
  `cart_id` int(11) NOT NULL,
  `product_id` varchar(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_detail`
--

INSERT INTO `cart_detail` (`cart_id`, `product_id`, `quantity`) VALUES
(10, 'PR002', 1),
(11, 'PR004', 3),
(11, 'PR006', 3),
(12, 'PR002', 1),
(13, 'PR018', 2);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `product_id` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `star` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`product_id`, `user_id`, `content`, `star`) VALUES
('PR002', 3, 'This keyboard is awesome!!!', 5),
('PR002', 3, 'Try please', 5),
('PR002', 3, 'Keyboard yang mantab\r\n', 5),
('PR002', 3, 'Super', 5),
('PR002', 4, 'berisik jef', 3),
('PR002', 4, 'Jelek ini ternyata', 1),
('PR001', 2, 'Mouse Razernya bagus\r\n', 5),
('PR008', 2, 'Harddisk', 5),
('PR018', 10, 'This teleskop has a new power of view LOL :D', 5),
('PR001', 10, 'Kamu admin win ... Kok beli barangnya?', 3),
('PR001', 2, 'Up', 5);

-- --------------------------------------------------------

--
-- Table structure for table `header_transaction`
--

CREATE TABLE IF NOT EXISTS `header_transaction` (
  `transaction_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `header_transaction`
--

INSERT INTO `header_transaction` (`transaction_id`, `cart_id`, `date`) VALUES
(2, 10, '2016-08-23 11:49:45'),
(3, 11, '2016-08-24 18:07:13'),
(4, 13, '2016-08-24 18:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` varchar(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `weight` double NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `insertedBy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `weight`, `stock`, `image`, `insertedBy`) VALUES
('PR001', 'Mouse Razer', 1250000, 3, 85, 'mouse.png', 'Goldwin Japar'),
('PR002', 'Keyboard Razer Blue', 2551000, 1, 98, 'keyboard.png', 'Goldwin Japar'),
('PR003', 'Baju Biru', 150000, 1, 34, 'baju.jpg', 'Goldwin Japar'),
('PR004', 'Celana', 145500, 2, 65, 'celana.jpg', 'Goldwin Japar'),
('PR005', 'Monitor', 1900000, 10, 22, 'monitor.jpg', 'Goldwin Japar'),
('PR006', 'Kursi', 980000, 12, 44, 'kursi.jpg', 'Goldwin Japar'),
('PR007', 'Headset', 250000, 1, 90, 'headset.jpg', 'Goldwin Japar'),
('PR008', 'Harddisk', 680000, 1, 121, 'harddisk.jpg', 'Goldwin Japar'),
('PR009', 'Ikat Pinggang', 100000, 1, 212, 'ikatpinggang.jpg', 'Goldwin Japar'),
('PR010', 'Dasi', 50000, 1, 50, 'dasi.jpg', 'Goldwin Japar'),
('PR011', 'Black Jacket', 256000, 1, 88, 'jaket.png', 'Goldwin Japar'),
('PR012', 'Eye Protector', 100500, 1, 666, 'kacamata.png', 'Goldwin Japar'),
('PR013', 'Mousepad Steels', 120000, 1, 899, 'mousepad.jpg', 'Goldwin Japar'),
('PR014', 'Nametag', 5000, 1, 1200, 'nametag.jpg', 'Andy Fudiko'),
('PR015', 'Mi Bank', 540000, 1, 878, 'powerbank.jpg', 'Andy Fudiko'),
('PR016', 'Sofa Unique', 22500000, 25, 120, 'sofa.jpg', 'Andy Fudiko'),
('PR017', 'Tas Eiger', 500000, 2, 120, 'tas.jpg', 'Andy Fudiko'),
('PR018', 'Teleskop of Star', 9000000, 5, 3, 'teleskop.jpg', 'Goldwin Japar'),
('PR019', 'Topi Adidas', 300000, 1, 999, 'topi.jpg', 'Goldwin Japar'),
('PR020', 'USB Cable', 50000, 1, 1200, 'usb.jpg', 'Goldwin Japar'),
('PR021', 'Sepatu Bola', 555000, 2, 987, 'sepatubola.jpg', 'Goldwin Japar');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `phone`, `email`, `password`, `gender`, `dob`, `address`, `photo`, `role`) VALUES
(2, 'Goldwin Japar', '081923853485', 'goldwinjapar@gmail.com', 'asdasd123123', 'Male', '1998-09-21', 'Manggo Street', 'profile0.png', 'Admin'),
(3, 'Jefry', '08080808080', 'jefry@gmail.com', 'asdasd123123', 'Male', '1998-06-15', 'Apple Street', 'profile1.png', 'Member'),
(4, 'Muhammad Akbar', '083213213211', 'akbar@gmail.com', 'asdasd123123', 'Male', '1997-03-02', 'Melon Street', 'profile2.png', 'Member'),
(5, 'Michelle Neysa', '08321654544', 'michelle@gmail.com', 'asdasd123123', 'Female', '1997-11-12', 'Strawberry Street', 'profile6.png', 'Member'),
(6, 'Chrstina Alexandra', '0832132122', 'christina@gmail.com', 'asdasd123123', 'Female', '1996-09-10', 'Grape Street', 'profile7.png', 'Member'),
(7, 'Hengky Sandi', '08654654544', 'hengky@gmail.com', 'asdasd123123', 'Male', '1996-11-28', 'Pineapple Street', 'profile3.jpg', 'Member'),
(8, 'William', '08987987877', 'william@gmail.com', 'asdasd123123', 'Male', '1996-00-02', 'Melon Street', 'profile8.png', 'Member'),
(9, 'Nicholas Krisna', '0865445665', 'nicholas@gmail.com', 'asdasd123123', 'Male', '1997-01-12', 'Noch Street', 'profile4.png', 'Member'),
(10, 'Eric Marcelino', '08321221111', 'eric@gmail.com', 'asdasd123123', 'Male', '1996-07-08', 'Valve Street', 'profile5.png', 'Member'),
(11, 'Pribadi Ridwan', '0321321211', 'pribadi@gmail.com', 'asdasd123123', 'Male', '1995-11-12', 'Stealth Street', 'riki.png', 'Member'),
(12, 'Andy Fudiko', '0865455544', 'andy@gmail.com', 'asdasd123123', 'Male', '1997-05-01', 'North Street', 'fudiko.jpg', 'Admin'),
(13, 'Hendra Effendi', '03213211211', 'hendra@gmail.com', 'asdasd123123', 'Male', '1997-01-01', 'Thug Street', 'illu.png', 'Member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD KEY `cart_detail_product` (`product_id`),
  ADD KEY `cart_id` (`cart_id`,`product_id`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD KEY `comments_user` (`user_id`),
  ADD KEY `product_id` (`product_id`,`user_id`) USING BTREE;

--
-- Indexes for table `header_transaction`
--
ALTER TABLE `header_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `header_transaction`
--
ALTER TABLE `header_transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `cart_detail_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_detail_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `header_transaction`
--
ALTER TABLE `header_transaction`
  ADD CONSTRAINT `header_transaction_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
