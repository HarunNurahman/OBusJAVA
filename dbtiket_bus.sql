-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2019 at 06:37 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtiket_bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_bus`
--

CREATE TABLE `tb_bus` (
  `id_bus` varchar(5) NOT NULL,
  `class_bus` varchar(12) NOT NULL,
  `harga_tiket` int(15) NOT NULL,
  `no_polisi` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bus`
--

INSERT INTO `tb_bus` (`id_bus`, `class_bus`, `harga_tiket`, `no_polisi`) VALUES
('BS001', 'Ekonomi', 50000, 'D6656AAH'),
('BS002', 'Bisnis-AC', 80000, 'D2312MD');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detailtransaksi`
--

CREATE TABLE `tb_detailtransaksi` (
  `id_detailtransaksi` varchar(5) NOT NULL,
  `id_transaksi` varchar(10) NOT NULL,
  `id_kursi` varchar(5) NOT NULL,
  `nama_penumpang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detailtransaksi`
--

INSERT INTO `tb_detailtransaksi` (`id_detailtransaksi`, `id_transaksi`, `id_kursi`, `nama_penumpang`) VALUES
('1', 'TRANS0001', 'KS002', 'dd'),
('2', 'TRANS002', 'KS002', 'ddd');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `id_jadwal` varchar(5) NOT NULL,
  `tgl_berangkat` date NOT NULL,
  `jam_berangkat` time NOT NULL,
  `tujuan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`id_jadwal`, `tgl_berangkat`, `jam_berangkat`, `tujuan`) VALUES
('JD001', '2019-06-24', '19:00:00', 'Jakarta - Bandung'),
('JD002', '2019-07-15', '20:00:00', 'Cikarang - Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kursi`
--

CREATE TABLE `tb_kursi` (
  `id_kursi` varchar(5) NOT NULL,
  `nomor_kursi` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kursi`
--

INSERT INTO `tb_kursi` (`id_kursi`, `nomor_kursi`) VALUES
('KS001', 'A01'),
('KS002', 'A02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_supir`
--

CREATE TABLE `tb_supir` (
  `id_supir` varchar(5) NOT NULL,
  `nama_supir` varchar(30) NOT NULL,
  `no_sim` int(20) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `jk` set('L','P') NOT NULL,
  `alamat` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_supir`
--

INSERT INTO `tb_supir` (`id_supir`, `nama_supir`, `no_sim`, `no_hp`, `jk`, `alamat`) VALUES
('SP001', 'Harunamanya', 1234567890, '083829874987', 'L', 'Pasirluyu'),
('SP002', 'Ujang', 23456789, '345677654', 'L', 'Banung');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `id_jadwal` varchar(5) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `id_supir` varchar(5) NOT NULL,
  `id_bus` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_jadwal`, `id_user`, `id_supir`, `id_bus`) VALUES
('TRANS0001', 'JD002', 'ID001', 'SP001', 'BS001'),
('TRANS002', 'JD001', 'ID001', 'SP001', 'BS002');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` varchar(10) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `password` varchar(16) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `telp` varchar(12) NOT NULL,
  `lvl` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `password`, `alamat`, `jk`, `telp`, `lvl`) VALUES
('ID001', 'admin', 'admin', 'admin', 'L', '083201972', 'adm'),
('ID002', 'Bang', 'bang', 'bang', 'L', '1234567', 'usr');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_bus`
--
ALTER TABLE `tb_bus`
  ADD PRIMARY KEY (`id_bus`);

--
-- Indexes for table `tb_detailtransaksi`
--
ALTER TABLE `tb_detailtransaksi`
  ADD PRIMARY KEY (`id_detailtransaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_kursi` (`id_kursi`);

--
-- Indexes for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `tb_kursi`
--
ALTER TABLE `tb_kursi`
  ADD PRIMARY KEY (`id_kursi`);

--
-- Indexes for table `tb_supir`
--
ALTER TABLE `tb_supir`
  ADD PRIMARY KEY (`id_supir`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_jadwal` (`id_jadwal`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_supir` (`id_supir`),
  ADD KEY `id_bus` (`id_bus`),
  ADD KEY `id_bus_2` (`id_bus`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_detailtransaksi`
--
ALTER TABLE `tb_detailtransaksi`
  ADD CONSTRAINT `tb_detailtransaksi_ibfk_2` FOREIGN KEY (`id_kursi`) REFERENCES `tb_kursi` (`id_kursi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal` (`id_jadwal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_transaksi_ibfk_3` FOREIGN KEY (`id_supir`) REFERENCES `tb_supir` (`id_supir`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_transaksi_ibfk_4` FOREIGN KEY (`id_bus`) REFERENCES `tb_bus` (`id_bus`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
