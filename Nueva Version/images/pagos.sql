-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2026 at 01:55 PM
-- Server version: 8.0.45-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ALEJANDRIA`
--

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id` int NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` enum('pagado','pendiente','fallido','reembolsado') DEFAULT 'pendiente',
  `stripe_id` varchar(255) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_expiracion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`id`, `user_id`, `monto`, `estado`, `stripe_id`, `fecha_pago`, `fecha_vencimiento`, `fecha_inicio`, `fecha_expiracion`) VALUES
(25, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-04-14 11:35:26', NULL, '2026-04-14', '2026-05-14'),
(26, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-04-14 14:58:04', NULL, '2026-04-14', '2026-05-14'),
(27, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-04-14 14:58:13', NULL, '2026-04-14', '2026-05-14'),
(28, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-04-30 09:47:21', NULL, '2026-04-30', '2026-05-30'),
(29, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-04-30 10:10:03', NULL, '2026-04-30', '2026-05-30'),
(30, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-05-07 11:26:54', NULL, '2026-05-07', '2026-06-06'),
(31, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-05-28 16:05:50', NULL, '2026-05-28', '2026-06-27'),
(32, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-10-13 09:26:32', NULL, '2026-10-13', '2026-11-12'),
(33, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-10-13 09:26:42', NULL, '2026-10-13', '2026-11-12'),
(34, 'basedeemma@gmail.com', '59.00', 'pagado', NULL, '2026-10-13 09:26:48', NULL, '2026-10-13', '2026-11-12'),
(35, 'emmanuelacoltzi311@gmail.com', '59.00', 'pagado', NULL, '2026-11-24 09:07:14', NULL, '2026-11-24', '2026-12-24'),
(36, 'emmanuelacoltzi311@gmail.com', '59.00', 'pagado', NULL, '2026-11-24 13:26:53', NULL, '2026-11-24', '2026-12-24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
