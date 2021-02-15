-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2021 at 01:47 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
