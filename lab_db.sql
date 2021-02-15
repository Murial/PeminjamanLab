-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2021 at 01:48 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(11) NOT NULL,
  `id_ruangan` varchar(11) NOT NULL,
  `nama_barang` varchar(40) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `status_barang` enum('rusak','baik') NOT NULL,
  `tipe_barang` enum('alat_tulis','aset_lab','general') NOT NULL,
  `keterangan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `id_ruangan`, `nama_barang`, `jml_barang`, `status_barang`, `tipe_barang`, `keterangan`) VALUES
('bar001', '301', 'Mouse', 30, 'rusak', 'aset_lab', 'Asset Lab');

-- --------------------------------------------------------

--
-- Stand-in structure for view `history_pemindahan_barang`
-- (See below for the actual view)
--
CREATE TABLE `history_pemindahan_barang` (
`id_pemindahan_b` varchar(11)
,`tgl_pemindahan` date
,`nama_barang` varchar(40)
,`id_ruangan` varchar(11)
,`nama_ruangan` varchar(40)
,`nama_user` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `history_peminjaman_barang`
-- (See below for the actual view)
--
CREATE TABLE `history_peminjaman_barang` (
`id_peminjaman` varchar(11)
,`nama_peminjam` varchar(100)
,`nama_barang` varchar(40)
,`waktu_dipinjam` datetime
,`waktu_dikembalikan` datetime
,`alasan_peminjaman` varchar(250)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `history_peminjaman_ruangan`
-- (See below for the actual view)
--
CREATE TABLE `history_peminjaman_ruangan` (
`id_peminjaman` varchar(11)
,`nama_peminjam` varchar(100)
,`nomor_ruangan` varchar(11)
,`nama_ruangan` varchar(40)
,`waktu_dipinjam` datetime
,`waktu_dikembalikan` datetime
,`alasan_peminjaman` varchar(250)
);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_b`
--

CREATE TABLE `pembelian_b` (
  `id_pembelian_b` varchar(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `keterangan` enum('praktikum','general') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemindahan_b`
--

CREATE TABLE `pemindahan_b` (
  `id_pemindahan_b` varchar(11) NOT NULL,
  `id_barang` varchar(11) NOT NULL,
  `id_ruangan` varchar(11) NOT NULL,
  `id_user` varchar(11) NOT NULL,
  `tgl_pemindahan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemindahan_b`
--

INSERT INTO `pemindahan_b` (`id_pemindahan_b`, `id_barang`, `id_ruangan`, `id_user`, `tgl_pemindahan`) VALUES
('pem001', 'bar001', '301', 'user_001', '2020-12-23');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_b`
--

CREATE TABLE `peminjaman_b` (
  `id_peminjaman_b` varchar(11) NOT NULL,
  `id_barang` varchar(11) NOT NULL,
  `id_user` varchar(11) NOT NULL,
  `keperluan` varchar(250) NOT NULL,
  `cek_in` datetime NOT NULL,
  `cek_out` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman_b`
--

INSERT INTO `peminjaman_b` (`id_peminjaman_b`, `id_barang`, `id_user`, `keperluan`, `cek_in`, `cek_out`) VALUES
('pem_b_001', 'bar001', 'user_001', 'Mabar di kontrakan', '2020-12-23 07:00:00', '2020-12-23 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_r`
--

CREATE TABLE `peminjaman_r` (
  `id_peminjaman_r` varchar(11) NOT NULL,
  `id_user` varchar(11) NOT NULL,
  `id_ruangan` varchar(11) NOT NULL,
  `cek_in` datetime NOT NULL,
  `cek_out` datetime NOT NULL,
  `keperluan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman_r`
--

INSERT INTO `peminjaman_r` (`id_peminjaman_r`, `id_user`, `id_ruangan`, `cek_in`, `cek_out`, `keperluan`) VALUES
('pem_r_001', 'user_001', '302 ', '2021-02-15 02:23:00', '2021-02-16 02:23:00', 'asdasdasdasd'),
('pem_r_002', 'user_002', '301', '2021-02-10 03:45:32', '2021-02-11 03:45:32', 'Kepanitiaan'),
('pem_r_003', 'user_002', '301', '2021-02-01 22:47:01', '2021-02-02 22:47:01', 'asdasdasd'),
('pem_r_4', 'user_002', '301 ', '2021-02-14 19:14:00', '2021-02-15 19:14:00', 'adawd,mqmqq,q'),
('pem_r_5', 'user_002', '302 ', '2021-02-18 05:12:00', '2021-02-19 05:12:00', 'mqmqqmqmqmqmq'),
('pem_r_6', 'user_002', '303 ', '2021-02-15 07:45:00', '2021-02-16 07:45:00', 'Kerja Praktik'),
('pem_r_7', 'user_002', '304 ', '2021-02-18 07:46:00', '2021-02-19 07:46:00', 'Simulasi KP');

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `id_ruangan` varchar(11) NOT NULL,
  `nama_ruangan` varchar(40) NOT NULL,
  `status` enum('tersedia','digunakan') NOT NULL,
  `id_user` varchar(11) DEFAULT NULL,
  `kondisi_ruangan` enum('beroperasi','tidak beroperasi') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`id_ruangan`, `nama_ruangan`, `status`, `id_user`, `kondisi_ruangan`) VALUES
('301', 'Pemrograman', 'digunakan', 'user_001', 'beroperasi'),
('302', 'Web Developing', 'tersedia', NULL, 'beroperasi'),
('303', 'Animasi', 'tersedia', NULL, 'beroperasi'),
('304', 'Lab Jaringan', 'tersedia', NULL, 'beroperasi'),
('305', 'Lab Basis Data', 'tersedia', NULL, 'beroperasi');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `roles` enum('mahasiswa','ail','kalab') NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `nama_user`, `roles`, `email`, `password`) VALUES
('user_001', '1955301008', 'Aditya Akmal', 'mahasiswa', 'adit19ti@mahasiswa.pcr.ac.id', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
('user_002', '1955301095', 'Mukmin Arrijal', 'mahasiswa', 'mukmin19ti@mahasiswa.pcr.ac.id', '1955301095'),
('user_003', '1955301023', 'Muhammad Zafran Rayhan ', 'mahasiswa', 'zafran19ti@mahasiswa.pcr.ac.id', '123123123'),
('user_004', '1955301091', 'Muhammad Rachim Aris', 'mahasiswa', 'rachim19ti@mahasiswa.pcr.ac.id', '123123123');

-- --------------------------------------------------------

--
-- Structure for view `history_pemindahan_barang`
--
DROP TABLE IF EXISTS `history_pemindahan_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `history_pemindahan_barang`  AS  select `pemindahan_b`.`id_pemindahan_b` AS `id_pemindahan_b`,`pemindahan_b`.`tgl_pemindahan` AS `tgl_pemindahan`,`barang`.`nama_barang` AS `nama_barang`,`ruang`.`id_ruangan` AS `id_ruangan`,`ruang`.`nama_ruangan` AS `nama_ruangan`,`user`.`nama_user` AS `nama_user` from (((`pemindahan_b` join `ruang`) join `barang`) join `user`) where `user`.`id_user` = `pemindahan_b`.`id_user` and `barang`.`id_barang` = `pemindahan_b`.`id_barang` and `ruang`.`id_ruangan` = `pemindahan_b`.`id_ruangan` ;

-- --------------------------------------------------------

--
-- Structure for view `history_peminjaman_barang`
--
DROP TABLE IF EXISTS `history_peminjaman_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `history_peminjaman_barang`  AS  select `peminjaman_b`.`id_peminjaman_b` AS `id_peminjaman`,`user`.`nama_user` AS `nama_peminjam`,`barang`.`nama_barang` AS `nama_barang`,`peminjaman_b`.`cek_in` AS `waktu_dipinjam`,`peminjaman_b`.`cek_out` AS `waktu_dikembalikan`,`peminjaman_b`.`keperluan` AS `alasan_peminjaman` from ((`peminjaman_b` join `barang`) join `user`) where `peminjaman_b`.`id_user` = `user`.`id_user` and `peminjaman_b`.`id_barang` = `barang`.`id_barang` ;

-- --------------------------------------------------------

--
-- Structure for view `history_peminjaman_ruangan`
--
DROP TABLE IF EXISTS `history_peminjaman_ruangan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `history_peminjaman_ruangan`  AS  select `peminjaman_r`.`id_peminjaman_r` AS `id_peminjaman`,`user`.`nama_user` AS `nama_peminjam`,`ruang`.`id_ruangan` AS `nomor_ruangan`,`ruang`.`nama_ruangan` AS `nama_ruangan`,`peminjaman_r`.`cek_in` AS `waktu_dipinjam`,`peminjaman_r`.`cek_out` AS `waktu_dikembalikan`,`peminjaman_r`.`keperluan` AS `alasan_peminjaman` from ((`peminjaman_r` join `ruang`) join `user`) where `peminjaman_r`.`id_user` = `user`.`id_user` and `peminjaman_r`.`id_ruangan` = `ruang`.`id_ruangan` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_ruangan` (`id_ruangan`);

--
-- Indexes for table `pembelian_b`
--
ALTER TABLE `pembelian_b`
  ADD PRIMARY KEY (`id_pembelian_b`);

--
-- Indexes for table `pemindahan_b`
--
ALTER TABLE `pemindahan_b`
  ADD PRIMARY KEY (`id_pemindahan_b`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_ruangan` (`id_ruangan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `peminjaman_b`
--
ALTER TABLE `peminjaman_b`
  ADD PRIMARY KEY (`id_peminjaman_b`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `peminjaman_r`
--
ALTER TABLE `peminjaman_r`
  ADD PRIMARY KEY (`id_peminjaman_r`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_ruangan` (`id_ruangan`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id_ruangan`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_ruangan`) REFERENCES `ruang` (`id_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemindahan_b`
--
ALTER TABLE `pemindahan_b`
  ADD CONSTRAINT `pemindahan_b_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemindahan_b_ibfk_2` FOREIGN KEY (`id_ruangan`) REFERENCES `ruang` (`id_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemindahan_b_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman_b`
--
ALTER TABLE `peminjaman_b`
  ADD CONSTRAINT `peminjaman_b_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_b_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman_r`
--
ALTER TABLE `peminjaman_r`
  ADD CONSTRAINT `peminjaman_r_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_r_ibfk_2` FOREIGN KEY (`id_ruangan`) REFERENCES `ruang` (`id_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ruang`
--
ALTER TABLE `ruang`
  ADD CONSTRAINT `ruang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
