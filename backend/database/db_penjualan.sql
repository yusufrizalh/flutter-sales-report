-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2022 at 03:57 AM
-- Server version: 10.5.12-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id19109336_db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_cashiers`
--

CREATE TABLE `tb_cashiers` (
  `cashier_id` int(11) NOT NULL,
  `cashier_name` varchar(30) DEFAULT NULL,
  `cashier_phone` varchar(12) DEFAULT NULL,
  `cashier_email` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_cashiers`
--

INSERT INTO `tb_cashiers` (`cashier_id`, `cashier_name`, `cashier_phone`, `cashier_email`, `created_at`) VALUES
(1, 'Agatha', '081786423001', 'agatha@email.com', '2022-06-14 04:48:58'),
(2, 'Debora', '085768012004', 'debora@email.com', '2022-06-14 04:49:20'),
(3, 'Alexander', '081331278550', 'alexander@email.com', '2022-06-14 04:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customers`
--

CREATE TABLE `tb_customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `customer_phone` varchar(13) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `customer_city` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_customers`
--

INSERT INTO `tb_customers` (`customer_id`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_city`, `created_at`) VALUES
(1, 'Louis Shannon', '081756412990', 'louis_shannon@email.com', 'Jl Letjen Haryono MT 268, Jawa Tengah', 'Semarang', '2022-06-14 06:59:59'),
(2, 'Charlie Keith', '085756623001', 'charlie_keith@email.com', 'Jl KH Agus Salim 25,Pandean', 'Madiun', '2022-06-14 07:01:04'),
(3, 'Blain Lucas', '081765120967', 'blain_lucas@email.com', 'Jl Raya Serang Km 12 Ds Bunder Cikupa', 'Tangerang', '2022-06-14 07:02:05'),
(4, 'Lizza Shaw', '089761209574', 'lizza_shaw@email.com', 'Jl Argopuro 11 A, Jawa Tengah', 'Semarang', '2022-06-14 07:03:10'),
(5, 'Tommy Berg', '081543109550', 'tommy_berg@email.com', 'Jl Trusmi Kulon 187, Weru, Plered', 'Cirebon', '2022-06-14 07:04:36'),
(6, 'Taylor Curtis', '087654312005', 'taylor_curtis@email.com', 'Jl Dempo Baru 15, Palembang', 'Palembang', '2022-06-14 07:05:44'),
(7, 'Kathryn Oneal', '089099912443', 'kathryn_oneal@email.com', 'Jl Jemursari Slt II 2A-2B', 'Surabaya', '2022-06-14 07:41:12'),
(8, 'Queen Turner', '084536409120', 'queen_turner@email.com', 'Jl Undaan Wetan 10', 'Surabaya', '2022-06-14 07:42:03'),
(9, 'Benazir Shea', '081765643006', 'benazir_shea@example.com', 'Jl Kemayoran Budidayan, No 15', 'Surabaya', '2022-06-15 08:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `tb_orderdetails`
--

CREATE TABLE `tb_orderdetails` (
  `detail_id` int(11) NOT NULL,
  `fk_order_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  `product_qty` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_orderdetails`
--

INSERT INTO `tb_orderdetails` (`detail_id`, `fk_order_id`, `fk_product_id`, `product_qty`) VALUES
(1, 1, 10, '1'),
(2, 2, 4, '2'),
(3, 2, 5, '2'),
(4, 3, 16, '1'),
(5, 4, 8, '1'),
(6, 5, 13, '1'),
(7, 5, 18, '1'),
(8, 6, 6, '5'),
(9, 6, 1, '3'),
(10, 7, 12, '1'),
(11, 8, 14, '1'),
(12, 9, 20, '1'),
(13, 10, 11, '1'),
(14, 11, 19, '1'),
(15, 12, 21, '1'),
(16, 13, 13, '1'),
(17, 14, 14, '2'),
(18, 14, 15, '2'),
(19, 14, 20, '3'),
(20, 15, 7, '30'),
(21, 15, 14, '2'),
(22, 15, 1, '3'),
(23, 16, 3, '2'),
(24, 17, 8, '1'),
(25, 18, 14, '2'),
(26, 19, 11, '2'),
(27, 19, 9, '2'),
(28, 20, 17, '2'),
(29, 20, 18, '2'),
(30, 20, 10, '2'),
(31, 21, 1, '1'),
(32, 21, 7, '2'),
(33, 21, 13, '5'),
(34, 21, 15, '2'),
(35, 21, 19, '2'),
(36, 21, 20, '3'),
(37, 22, 22, '2'),
(38, 23, 10, '1'),
(39, 23, 17, '1'),
(40, 24, 5, '6'),
(41, 25, 3, '1'),
(42, 25, 8, '1'),
(43, 25, 14, '1'),
(44, 26, 16, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_orders`
--

CREATE TABLE `tb_orders` (
  `order_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `fk_cashier_id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_orders`
--

INSERT INTO `tb_orders` (`order_id`, `order_date`, `fk_cashier_id`, `fk_customer_id`) VALUES
(1, '2022-06-14 07:46:05', 1, 4),
(2, '2022-06-14 07:46:05', 3, 1),
(3, '2022-06-14 07:46:05', 2, 7),
(4, '2022-06-14 07:46:05', 1, 2),
(5, '2022-06-14 07:46:05', 3, 5),
(6, '2022-06-14 07:46:05', 2, 1),
(7, '2022-06-14 07:46:05', 1, 8),
(8, '2022-06-14 07:46:05', 2, 6),
(9, '2022-06-14 07:46:05', 1, 3),
(10, '2022-06-14 07:46:05', 2, 5),
(11, '2022-06-14 07:46:05', 3, 8),
(12, '2022-06-14 07:46:05', 1, 2),
(13, '2022-06-14 07:46:05', 2, 4),
(14, '2022-06-14 07:46:05', 3, 2),
(15, '2022-06-14 07:46:05', 2, 5),
(16, '2022-06-14 07:46:05', 1, 6),
(17, '2022-06-14 07:46:05', 1, 3),
(18, '2022-06-14 07:46:05', 3, 4),
(19, '2022-06-14 07:46:05', 1, 7),
(20, '2022-06-14 07:46:05', 3, 8),
(21, '2022-06-15 08:32:05', 2, 9),
(22, '2022-06-15 13:23:25', 1, 3),
(23, '2022-06-15 13:31:54', 3, 7),
(24, '2022-06-15 13:36:02', 2, 1),
(25, '2022-06-15 13:53:30', 1, 8),
(26, '2022-06-15 14:03:01', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tb_products`
--

CREATE TABLE `tb_products` (
  `product_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_products`
--

INSERT INTO `tb_products` (`product_id`, `product_name`, `product_price`, `created_at`) VALUES
(1, 'Monitor LG 14\"', 959000, '2022-06-14 04:52:29'),
(2, 'Thinkplus Live Pods LP40 Pro', 345000, '2022-06-14 06:52:44'),
(3, 'Blackberry Aurora BBC101', 3000000, '2022-06-14 06:53:09'),
(4, 'Mouse Genius', 79999, '2022-06-14 06:53:31'),
(5, 'Mouse Sturdy', 65000, '2022-06-14 06:53:46'),
(6, 'Monitor Autos', 880000, '2022-06-14 06:54:12'),
(7, 'Keyboard Genius', 325000, '2022-06-14 06:54:48'),
(8, 'Lenovo Thinkpad T420', 13000000, '2022-06-14 06:55:46'),
(9, 'Lenovo Thinkpad X240', 23000000, '2022-06-14 06:55:59'),
(10, 'Lenovo Thinkpad T430', 11750000, '2022-06-14 06:56:16'),
(11, 'Asus Laptop Vivobook A416JP', 8949000, '2022-06-14 07:30:32'),
(12, 'Lenovo Ideapad Slim 3I', 4299000, '2022-06-14 07:31:04'),
(13, 'Lenovo Yoga Slim 7', 17499000, '2022-06-14 07:31:35'),
(14, 'Canon Ink Jet MG2570', 769000, '2022-06-14 07:32:38'),
(15, 'Epson Projector EB-X500', 5399000, '2022-06-14 07:33:07'),
(16, 'Cardless Phone VTech VT1091', 369000, '2022-06-14 07:33:40'),
(17, 'Intercom Commax CM-800', 199000, '2022-06-14 07:34:06'),
(18, 'Epson Projector EB-E10', 4999000, '2022-06-14 07:34:43'),
(19, 'Acer LCD Projector SVGA-BS020P', 4399000, '2022-06-14 07:35:11'),
(20, 'Monitor Samsung IPS LED 22MK600M-B', 2349000, '2022-06-14 07:36:10'),
(21, 'Monitor LG Ultra Gear FHD IPS 24GN600-B', 2749000, '2022-06-14 07:36:46'),
(22, 'Redmi Note 10s', 4999000, '2022-06-15 13:16:11'),
(23, 'TV Sharp 41\"', 3999000, '2022-06-15 13:50:58'),
(24, 'SanDisk microSD Adapter 32GB', 88999, '2022-06-16 04:22:40'),
(25, 'SHARP Air Conditioner CRMC-B007', 4299000, '2022-06-16 11:17:51');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_report_front_detail_page`
-- (See below for the actual view)
--
CREATE TABLE `v_report_front_detail_page` (
`cashier_name` varchar(30)
,`customer_name` varchar(30)
,`order_id` int(11)
,`order_date` timestamp
,`product_name` text
,`product_price` decimal(10,0)
,`product_qty` text
,`subtotal` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_report_front_page`
-- (See below for the actual view)
--
CREATE TABLE `v_report_front_page` (
`order_id` int(11)
,`customer_name` varchar(30)
,`total` double
);

-- --------------------------------------------------------

--
-- Structure for view `v_report_front_detail_page`
--
DROP TABLE IF EXISTS `v_report_front_detail_page`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id19109336_yusufrizalh`@`%` SQL SECURITY DEFINER VIEW `v_report_front_detail_page`  AS  select `c`.`cashier_name` AS `cashier_name`,`cus`.`customer_name` AS `customer_name`,`o`.`order_id` AS `order_id`,`o`.`order_date` AS `order_date`,`p`.`product_name` AS `product_name`,`p`.`product_price` AS `product_price`,`d`.`product_qty` AS `product_qty`,`p`.`product_price` * `d`.`product_qty` AS `subtotal` from ((((`tb_cashiers` `c` join `tb_orders` `o` on(`c`.`cashier_id` = `o`.`fk_cashier_id`)) join `tb_orderdetails` `d` on(`o`.`order_id` = `d`.`fk_order_id`)) join `tb_products` `p` on(`p`.`product_id` = `d`.`fk_product_id`)) join `tb_customers` `cus` on(`cus`.`customer_id` = `o`.`fk_customer_id`)) order by `o`.`order_id` desc ;

-- --------------------------------------------------------

--
-- Structure for view `v_report_front_page`
--
DROP TABLE IF EXISTS `v_report_front_page`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id19109336_yusufrizalh`@`%` SQL SECURITY DEFINER VIEW `v_report_front_page`  AS  select `o`.`order_id` AS `order_id`,`cus`.`customer_name` AS `customer_name`,sum(`p`.`product_price` * `d`.`product_qty`) AS `total` from ((((`tb_cashiers` `c` join `tb_orders` `o` on(`c`.`cashier_id` = `o`.`fk_cashier_id`)) join `tb_orderdetails` `d` on(`o`.`order_id` = `d`.`fk_order_id`)) join `tb_products` `p` on(`p`.`product_id` = `d`.`fk_product_id`)) join `tb_customers` `cus` on(`cus`.`customer_id` = `o`.`fk_customer_id`)) group by `o`.`order_id` order by `o`.`order_id` desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_cashiers`
--
ALTER TABLE `tb_cashiers`
  ADD PRIMARY KEY (`cashier_id`);

--
-- Indexes for table `tb_customers`
--
ALTER TABLE `tb_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tb_orderdetails`
--
ALTER TABLE `tb_orderdetails`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `fk_order_id` (`fk_order_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `tb_orders`
--
ALTER TABLE `tb_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_cashier_id` (`fk_cashier_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `tb_products`
--
ALTER TABLE `tb_products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_cashiers`
--
ALTER TABLE `tb_cashiers`
  MODIFY `cashier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_customers`
--
ALTER TABLE `tb_customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_orderdetails`
--
ALTER TABLE `tb_orderdetails`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tb_orders`
--
ALTER TABLE `tb_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_products`
--
ALTER TABLE `tb_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_orderdetails`
--
ALTER TABLE `tb_orderdetails`
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`fk_order_id`) REFERENCES `tb_orders` (`order_id`),
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`fk_product_id`) REFERENCES `tb_products` (`product_id`);

--
-- Constraints for table `tb_orders`
--
ALTER TABLE `tb_orders`
  ADD CONSTRAINT `fk_cashier_id` FOREIGN KEY (`fk_cashier_id`) REFERENCES `tb_cashiers` (`cashier_id`),
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`fk_customer_id`) REFERENCES `tb_customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
