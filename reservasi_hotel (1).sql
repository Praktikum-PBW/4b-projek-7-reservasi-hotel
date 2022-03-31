-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2022 at 08:41 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservasi_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `id` int(10) NOT NULL,
  `id_kota` int(10) NOT NULL,
  `nama_kotkab` varchar(25) NOT NULL,
  `id_prov` int(10) NOT NULL,
  `nama_prov` varchar(25) NOT NULL,
  `id_negara` int(10) NOT NULL,
  `nama_negara` varchar(25) NOT NULL,
  `alamat` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(10) NOT NULL,
  `hotel` varchar(25) NOT NULL,
  `id_alamat` int(20) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `harga` char(20) NOT NULL,
  `rating` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kotkab`
--

CREATE TABLE `kotkab` (
  `id` int(10) NOT NULL,
  `nama_kotkab` varchar(25) NOT NULL,
  `id_prov` int(10) NOT NULL,
  `id_negara` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `negara`
--

CREATE TABLE `negara` (
  `id` int(10) NOT NULL,
  `nama_negara` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(10) NOT NULL,
  `user_email` int(20) NOT NULL,
  `username` varchar(25) NOT NULL,
  `hotel_id` int(20) NOT NULL,
  `hotel_name` varchar(25) NOT NULL,
  `awal_reservasi` date NOT NULL,
  `akhir_reservasi` date NOT NULL,
  `total_reservasi` datetime(6) NOT NULL,
  `harga` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id` int(10) NOT NULL,
  `nama_prov` varchar(25) NOT NULL,
  `id_negara` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(10) NOT NULL,
  `id_reservasi` int(10) NOT NULL,
  `rating` tinyint(10) NOT NULL,
  `review` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(10) NOT NULL,
  `id_reservasi` int(10) NOT NULL,
  `sisa_waktu` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `email` varchar(30) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `nama`, `password`) VALUES
(3, 'jagopbw@gege.com', 'damar', 'bangbudigege');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kota` (`id_kota`),
  ADD KEY `nama_kotkab` (`nama_kotkab`),
  ADD KEY `id_prov` (`id_prov`,`nama_prov`,`id_negara`,`nama_negara`,`alamat`),
  ADD KEY `id_negara` (`id_negara`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel` (`hotel`,`id_alamat`,`alamat`,`harga`,`rating`),
  ADD KEY `id_alamat` (`id_alamat`);

--
-- Indexes for table `kotkab`
--
ALTER TABLE `kotkab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_kotkab` (`nama_kotkab`,`id_prov`,`id_negara`),
  ADD KEY `id_prov` (`id_prov`),
  ADD KEY `id_negara` (`id_negara`);

--
-- Indexes for table `negara`
--
ALTER TABLE `negara`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_negara` (`nama_negara`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_email`,`username`,`hotel_id`,`hotel_name`,`awal_reservasi`,`akhir_reservasi`,`total_reservasi`,`harga`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `hotel_name` (`hotel_name`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_prov` (`nama_prov`,`id_negara`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reservasi` (`id_reservasi`,`rating`,`review`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reservasi` (`id_reservasi`,`sisa_waktu`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama` (`nama`,`password`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kotkab`
--
ALTER TABLE `kotkab`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `negara`
--
ALTER TABLE `negara`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `alamat_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `kotkab` (`id`),
  ADD CONSTRAINT `alamat_ibfk_2` FOREIGN KEY (`id_negara`) REFERENCES `negara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alamat_ibfk_3` FOREIGN KEY (`id_prov`) REFERENCES `provinsi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alamat_ibfk_4` FOREIGN KEY (`nama_kotkab`) REFERENCES `kotkab` (`nama_kotkab`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`id_alamat`) REFERENCES `alamat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kotkab`
--
ALTER TABLE `kotkab`
  ADD CONSTRAINT `kotkab_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `provinsi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kotkab_ibfk_2` FOREIGN KEY (`id_negara`) REFERENCES `negara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_3` FOREIGN KEY (`hotel_name`) REFERENCES `hotel` (`hotel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_reservasi`) REFERENCES `pembelian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
