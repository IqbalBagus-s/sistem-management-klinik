-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 09:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi-klinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `channelno` varchar(255) NOT NULL,
  `doctorname` varchar(255) NOT NULL,
  `patientname` varchar(255) NOT NULL,
  `roomno` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`channelno`, `doctorname`, `patientname`, `roomno`, `date`) VALUES
('CH001', 'DS001', 'PS002', 'R01', '2024-09-08'),
('CH002', 'DS001', 'PS001', 'R02', '2024-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorno` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `channelfee` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `room` varchar(255) NOT NULL,
  `log_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorno`, `name`, `special`, `qualification`, `channelfee`, `phone`, `room`, `log_id`) VALUES
('DS001', 'samul', 'mata', 's1', 'Rp. 120.000', '081321331331', '5', 2);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `idobat` varchar(255) NOT NULL,
  `namaobat` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `hargajual` int(30) NOT NULL,
  `hargabeli` int(30) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`idobat`, `namaobat`, `deskripsi`, `hargajual`, `hargabeli`, `jumlah`) VALUES
('IU001', 'loratadin', 'obat diabetes', 70000, 80000, 50);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientno` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nohp` varchar(13) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientno`, `name`, `nohp`, `address`) VALUES
('PS001', 'poted', '0823151241', 'Wonorejo Timur'),
('PS002', 'kevin', '0819292101', 'Gunung anyar'),
('PS003', 'Rino', '08210082182', 'Medokan Sawah');

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `rno` varchar(255) NOT NULL,
  `chno` varchar(255) NOT NULL,
  `doctorname` varchar(255) NOT NULL,
  `ptype` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`rno`, `chno`, `doctorname`, `ptype`, `description`) VALUES
('RS001', 'CH002', 'CH002', 'kanker', 'kanker stadium akhir'),
('RS002', 'CH001', 'samul', 'kanker', 'blalbaba');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `subtotal` int(255) NOT NULL,
  `pay` int(255) NOT NULL,
  `balance` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date`, `subtotal`, `pay`, `balance`) VALUES
(1, '2024-06-09', 630000, 3000000, 2370000),
(2, '2024-06-09', 420000, 500000, 80000),
(3, '2024-06-09', 280000, 300000, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `sale_product`
--

CREATE TABLE `sale_product` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `prod_id` varchar(255) NOT NULL,
  `sellprice` int(255) NOT NULL,
  `qty` int(255) NOT NULL,
  `total` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_product`
--

INSERT INTO `sale_product` (`id`, `sales_id`, `prod_id`, `sellprice`, `qty`, `total`) VALUES
(1, 3, 'IU001', 70000, 4, 280000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `utype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `utype`) VALUES
(1, 'jaki', 'jaki', 'jaki', 'Apoteker'),
(2, 'samul', 'samul', 'samul', 'Dokter'),
(3, 'fuad racing mandalika', 'fuad', '123', 'Resepsionis'),
(4, 'rusdi ngawi', 'rusdi', '123', 'Dokter');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`channelno`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorno`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`idobat`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientno`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`rno`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_product`
--
ALTER TABLE `sale_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale_product`
--
ALTER TABLE `sale_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
