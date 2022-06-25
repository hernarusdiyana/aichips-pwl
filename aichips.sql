-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2022 at 06:17 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aichips`
--

-- --------------------------------------------------------

--
-- Table structure for table `antrian`
--

CREATE TABLE `antrian` (
  `id` int(11) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `noMeja` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 0,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `antrian`
--

INSERT INTO `antrian` (`id`, `nama`, `noMeja`, `tanggal`, `status`, `idUser`) VALUES
(8, 'mhm', 12, '2022-01-17 23:26:22', 2, 3),
(9, 'tes aja', 1, '2022-01-17 23:28:18', 2, 3),
(10, 'hehe', 23, '2022-01-17 23:29:23', 2, 1),
(11, 'tes', 12, '2022-01-17 23:36:48', 2, 1),
(12, 'FIndri', 12, '2022-01-17 23:37:49', 2, 1),
(13, 'a', 2, '2022-01-17 23:38:51', 2, 3),
(18, 'Jony', 80, '2022-06-25 13:16:24', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `jenis` int(1) NOT NULL DEFAULT 1,
  `harga` int(11) NOT NULL,
  `stok` int(11) UNSIGNED NOT NULL,
  `foto` varchar(32) NOT NULL,
  `status` int(1) NOT NULL,
  `hapus` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `barcode`, `nama`, `jenis`, `harga`, `stok`, `foto`, `status`, `hapus`) VALUES
(43, 'A313', 'Jono', 1, 50000, 50, 'default.jpg', 1, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pembelian`
-- (See below for the actual view)
--
CREATE TABLE `pembelian` (
`idAntrian` int(11)
,`namaAntrian` varchar(32)
,`noMeja` int(11)
,`statusAntrian` int(1)
,`tanggal` datetime
,`idMenu` int(11) unsigned
,`foto` varchar(32)
,`hapus` datetime
,`harga` int(11)
,`jenis` int(1)
,`namaMenu` varchar(32)
,`statusMenu` int(1)
,`idTransaksi` int(11)
,`jumlah` int(11)
,`idUser` int(11)
,`namaUser` varchar(32)
,`rule` int(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `tb_bulan_tahun`
--

CREATE TABLE `tb_bulan_tahun` (
  `id` int(11) UNSIGNED NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `tahun` year(4) NOT NULL,
  `bln_thn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_bulan_tahun`
--

INSERT INTO `tb_bulan_tahun` (`id`, `bulan`, `tahun`, `bln_thn`) VALUES
(1, 'Jan', 2020, '01-2020'),
(2, 'Feb', 2020, '02-2020'),
(3, 'Mar', 2020, '03-2020'),
(4, 'Apr', 2020, '04-2020'),
(5, 'Mei', 2020, '05-2020'),
(6, 'Jun', 2020, '06-2020'),
(7, 'Jul', 2020, '07-2020'),
(8, 'Agu', 2020, '08-2020'),
(9, 'Sep', 2020, '09-2020'),
(10, 'Okt', 2020, '10-2020'),
(11, 'Nov', 2020, '11-2020'),
(12, 'Des', 2020, '12-2020'),
(13, 'Jan', 2021, '01-2021'),
(14, 'Feb', 2021, '02-2021'),
(15, 'Mar', 2021, '03-2021'),
(16, 'Apr', 2021, '04-2021'),
(17, 'Mei', 2021, '05-2021'),
(18, 'Jun', 2021, '06-2021'),
(19, 'Jul', 2021, '07-2021'),
(20, 'Agu', 2021, '08-2021'),
(21, 'Sep', 2021, '09-2021'),
(22, 'Okt', 2021, '10-2021'),
(23, 'Nov', 2021, '11-2021'),
(24, 'Des', 2021, '12-2021'),
(25, 'Jan', 2022, '01-2022'),
(26, 'Feb', 2022, '02-2022'),
(27, 'Mar', 2022, '03-2022'),
(28, 'Apr', 2022, '04-2022'),
(29, 'Mei', 2022, '05-2022'),
(30, 'Jun', 2022, '06-2022'),
(31, 'Jul', 2022, '07-2022'),
(32, 'Agu', 2022, '08-2022'),
(33, 'Sep', 2022, '09-2022'),
(34, 'Okt', 2022, '10-2022'),
(35, 'Nov', 2022, '11-2022'),
(36, 'Des', 2022, '12-2022'),
(37, 'Jan', 2023, '01-2023'),
(38, 'Feb', 2023, '02-2023'),
(39, 'Mar', 2023, '03-2023'),
(40, 'Apr', 2023, '04-2023'),
(41, 'Mei', 2023, '05-2023'),
(42, 'Jun', 2023, '06-2023'),
(43, 'Jul', 2023, '07-2023'),
(44, 'Agu', 2023, '08-2023'),
(45, 'Sep', 2023, '09-2023'),
(46, 'Okt', 2023, '10-2023'),
(47, 'Nov', 2023, '11-2023'),
(48, 'Des', 2023, '12-2023'),
(49, 'Jan', 2024, '01-2024'),
(50, 'Feb', 2024, '02-2024'),
(51, 'Mar', 2024, '03-2024'),
(52, 'Apr', 2024, '04-2024'),
(53, 'Mei', 2024, '05-2024'),
(54, 'Jun', 2024, '06-2024'),
(55, 'Jul', 2024, '07-2024'),
(56, 'Agu', 2024, '08-2024'),
(57, 'Sep', 2024, '09-2024'),
(58, 'Okt', 2024, '10-2024'),
(59, 'Nov', 2024, '11-2024'),
(60, 'Des', 2024, '12-2024'),
(61, 'Jan', 2025, '01-2025'),
(62, 'Feb', 2025, '02-2025'),
(63, 'Mar', 2025, '03-2025'),
(64, 'Apr', 2025, '04-2025'),
(65, 'Mei', 2025, '05-2025'),
(66, 'Jun', 2025, '06-2025'),
(67, 'Jul', 2025, '07-2025'),
(68, 'Agu', 2025, '08-2025'),
(69, 'Sep', 2025, '09-2025'),
(70, 'Okt', 2025, '10-2025'),
(71, 'Nov', 2025, '11-2025'),
(72, 'Des', 2025, '12-2025'),
(73, 'Jan', 2026, '01-2026'),
(74, 'Feb', 2026, '02-2026'),
(75, 'Mar', 2026, '03-2026'),
(76, 'Apr', 2026, '04-2026'),
(77, 'Mei', 2026, '05-2026'),
(78, 'Jun', 2026, '06-2026'),
(79, 'Jul', 2026, '07-2026'),
(80, 'Agu', 2026, '08-2026'),
(81, 'Sep', 2026, '09-2026'),
(82, 'Okt', 2026, '10-2026'),
(83, 'Nov', 2026, '11-2026'),
(84, 'Des', 2026, '12-2026'),
(85, 'Jan', 2027, '01-2027'),
(86, 'Feb', 2027, '02-2027'),
(87, 'Mar', 2027, '03-2027'),
(88, 'Apr', 2027, '04-2027'),
(89, 'Mei', 2027, '05-2027'),
(90, 'Jun', 2027, '06-2027'),
(91, 'Jul', 2027, '07-2027'),
(92, 'Agu', 2027, '08-2027'),
(93, 'Sep', 2027, '09-2027'),
(94, 'Okt', 2027, '10-2027'),
(95, 'Nov', 2027, '11-2027'),
(96, 'Des', 2027, '12-2027'),
(97, 'Jan', 2028, '01-2028'),
(98, 'Feb', 2028, '02-2028'),
(99, 'Mar', 2028, '03-2028'),
(100, 'Apr', 2028, '04-2028'),
(101, 'Mei', 2028, '05-2028'),
(102, 'Jun', 2028, '06-2028'),
(103, 'Jul', 2028, '07-2028'),
(104, 'Agu', 2028, '08-2028'),
(105, 'Sep', 2028, '09-2028'),
(106, 'Okt', 2028, '10-2028'),
(107, 'Nov', 2028, '11-2028'),
(108, 'Des', 2028, '12-2028'),
(109, 'Jan', 2029, '01-2029'),
(110, 'Feb', 2029, '02-2029'),
(111, 'Mar', 2029, '03-2029'),
(112, 'Apr', 2029, '04-2029'),
(113, 'Mei', 2029, '05-2029'),
(114, 'Jun', 2029, '06-2029'),
(115, 'Jul', 2029, '07-2029'),
(116, 'Agu', 2029, '08-2029'),
(117, 'Sep', 2029, '09-2029'),
(118, 'Okt', 2029, '10-2029'),
(119, 'Nov', 2029, '11-2029'),
(120, 'Des', 2029, '12-2029'),
(121, 'Jan', 2030, '01-2030'),
(122, 'Feb', 2030, '02-2030'),
(123, 'Mar', 2030, '03-2030'),
(124, 'Apr', 2030, '04-2030'),
(125, 'Mei', 2030, '05-2030'),
(126, 'Jun', 2030, '06-2030'),
(127, 'Jul', 2030, '07-2030'),
(128, 'Agu', 2030, '08-2030'),
(129, 'Sep', 2030, '09-2030'),
(130, 'Okt', 2030, '10-2030'),
(131, 'Nov', 2030, '11-2030'),
(132, 'Des', 2030, '12-2030');

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `nama_item` varchar(100) NOT NULL,
  `harga` int(11) UNSIGNED NOT NULL,
  `stok` int(11) UNSIGNED NOT NULL,
  `jenis` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `foto` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  `hapus` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_menu`
--

INSERT INTO `tb_menu` (`id`, `barcode`, `nama_item`, `harga`, `stok`, `jenis`, `status`, `foto`, `hapus`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A0001', 'Sarimi Duo', 2500, 4, 0, 0, 'gambar.jpg', '2022-06-24 12:06:00', '2021-10-12 18:32:35', '2022-06-25 23:11:26', '0000-00-00 00:00:00'),
(5, 'A0005', 'Tolak Angin', 3000, 44, 0, 0, 'gambar.jpg', '2022-06-24 12:06:00', '2021-10-20 21:26:17', '2022-06-25 21:10:28', '0000-00-00 00:00:00'),
(6, 'A0006', 'Gula Pasir', 10000, 20, 0, 0, 'gambar.jpg', '2022-06-24 12:06:00', '2021-10-20 22:31:17', '2022-06-15 10:17:34', '0000-00-00 00:00:00'),
(7, 'A0007', 'Sprit', 5000, 20, 0, 0, 'gambar.jpg', '2022-06-24 12:06:00', '2022-01-21 18:57:34', '2022-05-02 22:08:52', '0000-00-00 00:00:00'),
(12, 'A2222', 'JOHN', 11111, 11, 0, 1, '.png', '2022-06-24 12:06:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'A3333', 'Test', 25000, 11, 2, 1, '.png', '2022-06-25 12:06:00', '0000-00-00 00:00:00', '2022-06-24 21:44:03', '0000-00-00 00:00:00'),
(31, 'A444', 'test', 50000, 12, 2, 1, 'test.jpg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'A3334', 'kebab', 50000, 14, 3, 1, 'kebab.jpg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `jenkel` varchar(1) NOT NULL,
  `telp_pelanggan` varchar(20) NOT NULL,
  `alamat_pelanggan` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id`, `nama_pelanggan`, `jenkel`, `telp_pelanggan`, `alamat_pelanggan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Umum', '', '-', '-', '2021-10-12 00:00:00', '2022-05-02 21:52:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemasok`
--

CREATE TABLE `tb_pemasok` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_pemasok` varchar(100) NOT NULL,
  `telp_pemasok` varchar(20) NOT NULL,
  `alamat_pemasok` varchar(100) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_pemasok`
--

INSERT INTO `tb_pemasok` (`id`, `nama_pemasok`, `telp_pemasok`, `alamat_pemasok`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pt. Jaya Abadi', '98732783', 'Jakarta', '', '2021-10-19 20:44:45', '2022-01-21 18:54:53', '0000-00-00 00:00:00'),
(2, 'Cv Sejahtera', '98732783', 'Bandung', '', '2021-10-19 21:17:05', '2022-01-21 18:55:08', '0000-00-00 00:00:00'),
(3, 'Toko Mulia', '09298', 'Bandung', '', '2021-10-20 21:24:37', '2022-05-02 22:05:27', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengaturan`
--

CREATE TABLE `tb_pengaturan` (
  `nama_toko` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pengaturan`
--

INSERT INTO `tb_pengaturan` (`nama_toko`, `no_telp`, `alamat`) VALUES
('AiChips', '081295018034', 'Jl. Babakan Wadana No.39, Cipamokolan, Rancasari, Kota Bandung'),
('AiChips', '081295018034', 'Jl. Babakan Wadana No.39, Cipamokolan, Rancasari, Kota Bandung'),
('Khalisa Online Store', '081295018034', 'Jl. Babakan Wadana No.39, Cipamokolan, Rancasari, Kota Bandung'),
('Khalisa Online Store', '081295018034', 'Jl. Babakan Wadana No.39, Cipamokolan, Rancasari, Kota Bandung'),
('Khalisa Online Store', '081295018034', 'Jl. Babakan Wadana No.39, Cipamokolan, Rancasari, Kota Bandung'),
('Khalisa Online Store', '081295018034', 'Jl. Babakan Wadana No.39, Cipamokolan, Rancasari, Kota Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `id_pelanggan` int(11) UNSIGNED NOT NULL,
  `total_harga` int(11) UNSIGNED NOT NULL,
  `diskon` int(11) UNSIGNED NOT NULL,
  `total_akhir` int(11) UNSIGNED NOT NULL,
  `tunai` int(11) UNSIGNED NOT NULL,
  `kembalian` int(11) UNSIGNED NOT NULL,
  `catatan` text NOT NULL,
  `tanggal` date NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `status` int(1) NOT NULL,
  `no_pesan` int(12) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id`, `invoice`, `id_pelanggan`, `total_harga`, `diskon`, `total_akhir`, `tunai`, `kembalian`, `catatan`, `tanggal`, `id_user`, `status`, `no_pesan`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INV2206150001', 1, 100000, 0, 100000, 100000, 0, '', '2022-06-15', 20, 0, 0, '::1', '2022-06-15 10:17:34', '2022-06-15 10:17:34', '0000-00-00 00:00:00'),
(5, 'INV2206240001', 1, 100000, 0, 100000, 188888, 88888, 'Test', '2022-06-24', 20, 0, 0, '::1', '2022-06-24 16:59:17', '2022-06-24 16:59:17', '0000-00-00 00:00:00'),
(6, 'INV2206240002', 1, 50000, 0, 50000, 111111, 61111, '11', '2022-06-24', 20, 0, 0, '::1', '2022-06-24 17:05:30', '2022-06-24 17:05:30', '0000-00-00 00:00:00'),
(7, 'INV2206240003', 1, 50000, 0, 50000, 111111, 61111, '', '2022-06-24', 20, 0, 0, '::1', '2022-06-24 17:13:37', '2022-06-24 17:13:37', '0000-00-00 00:00:00'),
(10, 'INV2206240004', 1, 27500, 0, 27500, 111111, 83611, '', '2022-06-24', 20, 0, 0, '::1', '2022-06-24 19:46:42', '2022-06-24 19:46:42', '0000-00-00 00:00:00'),
(11, 'INV2206240005', 1, 25000, 0, 25000, 100000, 75000, 'AAA', '2022-06-24', 20, 0, 0, '::1', '2022-06-24 21:44:02', '2022-06-24 21:44:02', '0000-00-00 00:00:00'),
(17, 'INV2206250001', 1, 2500, 0, 2500, 11111, 8611, '1', '2022-06-25', 20, 0, 0, '::1', '2022-06-25 18:15:41', '2022-06-25 18:15:41', '0000-00-00 00:00:00'),
(21, 'INV2206250002', 1, 22500, 0, 22500, 111111, 88611, '', '2022-06-25', 20, 0, 17, '::1', '2022-06-25 20:54:53', '2022-06-25 20:54:53', '0000-00-00 00:00:00'),
(26, 'INV2206250003', 1, 12500, 0, 12500, 111111, 98611, '', '2022-06-25', 20, 0, 0, '::1', '2022-06-25 21:04:20', '2022-06-25 21:04:20', '0000-00-00 00:00:00'),
(27, 'INV2206250004', 1, 8000, 0, 8000, 11111, 3111, '', '2022-06-25', 20, 0, 18, '::1', '2022-06-25 21:10:28', '2022-06-25 21:10:28', '0000-00-00 00:00:00'),
(28, 'INV2206250005', 1, 7500, 0, 7500, 11111, 3611, '', '2022-06-25', 20, 0, 18, '::1', '2022-06-25 21:15:16', '2022-06-25 21:15:16', '0000-00-00 00:00:00'),
(40, 'INV2206250006', 1, 15000, 0, 15000, 111111, 96111, '', '2022-06-25', 20, 0, 18, '::1', '2022-06-25 22:16:44', '2022-06-25 22:16:44', '0000-00-00 00:00:00'),
(41, 'INV2206250007', 1, 30000, 0, 30000, 111111, 81111, '', '2022-06-25', 20, 0, 0, '::1', '2022-06-25 23:11:26', '2022-06-25 23:11:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_roles`
--

CREATE TABLE `tb_roles` (
  `id` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`id`, `keterangan`) VALUES
(1, 'Super Admin'),
(2, 'Administrator'),
(3, 'Kasir');

-- --------------------------------------------------------

--
-- Table structure for table `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_stok` int(11) UNSIGNED NOT NULL,
  `tipe` enum('masuk','keluar') DEFAULT NULL,
  `id_item` int(11) UNSIGNED NOT NULL,
  `id_pemasok` int(11) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_stok`
--

INSERT INTO `tb_stok` (`id_stok`, `tipe`, `id_item`, `id_pemasok`, `jumlah`, `keterangan`, `id_user`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'masuk', 1, 2, 50, 'belanja', 1, '::1', '2022-05-02 22:09:31', '2022-05-02 22:09:31', '0000-00-00 00:00:00'),
(2, 'masuk', 6, 1, 30, 'belanja', 1, '::1', '2022-05-02 22:09:47', '2022-05-02 22:09:47', '0000-00-00 00:00:00'),
(3, 'masuk', 7, 3, 20, 'belanja', 1, '::1', '2022-05-02 22:10:06', '2022-05-02 22:10:06', '0000-00-00 00:00:00'),
(4, 'keluar', 5, 1, 5, 'rusak', 1, '::1', '2022-05-02 22:10:42', '2022-05-02 22:10:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) UNSIGNED NOT NULL,
  `id_penjualan` int(11) UNSIGNED NOT NULL,
  `id_item` int(11) UNSIGNED NOT NULL,
  `harga_item` int(11) UNSIGNED NOT NULL,
  `jumlah_item` int(11) UNSIGNED NOT NULL,
  `diskon_item` int(11) UNSIGNED NOT NULL,
  `no_pesan` int(11) NOT NULL,
  `subtotal` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_penjualan`, `id_item`, `harga_item`, `jumlah_item`, `diskon_item`, `no_pesan`, `subtotal`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 11, 20, 25000, 1, 0, 0, 25000, '::1', '2022-06-24 21:44:03', '2022-06-24 21:44:03', '0000-00-00 00:00:00'),
(8, 17, 1, 2500, 1, 0, 0, 2500, '::1', '2022-06-25 18:15:41', '2022-06-25 18:15:41', '0000-00-00 00:00:00'),
(9, 21, 1, 2500, 9, 0, 0, 22500, '::1', '2022-06-25 20:54:56', '2022-06-25 20:54:56', '0000-00-00 00:00:00'),
(10, 26, 1, 2500, 5, 0, 0, 12500, '::1', '2022-06-25 21:04:20', '2022-06-25 21:04:20', '0000-00-00 00:00:00'),
(11, 27, 1, 2500, 2, 0, 0, 5000, '::1', '2022-06-25 21:10:28', '2022-06-25 21:10:28', '0000-00-00 00:00:00'),
(12, 27, 5, 3000, 1, 0, 0, 3000, '::1', '2022-06-25 21:10:28', '2022-06-25 21:10:28', '0000-00-00 00:00:00'),
(13, 28, 1, 2500, 3, 0, 0, 7500, '::1', '2022-06-25 21:15:17', '2022-06-25 21:15:17', '0000-00-00 00:00:00'),
(14, 40, 1, 2500, 6, 0, 18, 15000, '::1', '2022-06-25 22:16:44', '2022-06-25 22:16:44', '0000-00-00 00:00:00'),
(15, 41, 1, 2500, 12, 0, 0, 30000, '::1', '2022-06-25 23:11:26', '2022-06-25 23:11:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_unit`
--

CREATE TABLE `tb_unit` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_unit` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_unit`
--

INSERT INTO `tb_unit` (`id`, `nama_unit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Botol', '2021-10-12 18:31:20', '2022-05-01 16:07:11', '0000-00-00 00:00:00'),
(2, 'Pcs', '2021-10-12 18:31:25', '2021-10-12 18:31:25', '0000-00-00 00:00:00'),
(3, 'Buah', '2021-10-12 18:31:29', '2021-10-12 18:31:29', '0000-00-00 00:00:00'),
(4, 'Kg', '2021-10-19 22:26:05', '2022-05-02 21:57:21', '0000-00-00 00:00:00'),
(5, 'Gram', '2021-10-20 21:25:42', '2022-05-02 21:58:11', '0000-00-00 00:00:00'),
(6, 'Bungkus', '2022-05-02 22:06:13', '2022-05-02 22:06:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `id_role` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'avatar.jpg',
  `status` int(1) NOT NULL DEFAULT 0,
  `token` varchar(255) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `email`, `username`, `password`, `nama`, `alamat`, `id_role`, `avatar`, `status`, `token`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'afterdusk55@gmail.com', 'superadmin', 'admin', 'Super Admin', 'Bandung', 1, 'avatar.jpg', 1, '35083a6ee73d98bd1e535b752c335979562481afed79ae2e627f2deba1c61005', '0.0.0.0', '2021-10-12 18:29:41', '2022-06-15 09:49:17', NULL),
(2, 'admin@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'Boyolali', 2, 'avatar.jpg', 1, 'bdbc976f1212965d03dcce1fecbcc811d3c817b7efd1aa61c090b5d7913b895f', '0.0.0.0', '2021-10-12 18:29:41', '2022-05-02 21:00:03', NULL),
(3, 'kasir@gmail.com', 'kasir', '$2y$10$eEd2VoX5fOImeW0t20ojpuReyDOwN0i3iFbd9YPaPPCQVqGmjwYeC', 'Kasir', 'Bandung', 3, 'avatar.jpg', 1, NULL, '0.0.0.0', '2021-10-12 18:29:41', '2022-05-02 21:00:08', NULL),
(20, 'superadmin@gmail.com', 'superadmin1', '$2y$10$Mr2UTVmTnbh5RIt5KPTxYODuhcQgPMikJCRPfsXyGV4w9W7N.8tW.', 'Pemilik', 'Jl.bintara Raya\r\n', 1, 'avatar.jpg', 0, 'ea540a9b4c399334a7329457cfda9fd17d1cbdf6bea7ad44ceba6bebce932bfe', '::1', '2022-06-15 10:13:27', '2022-06-15 10:13:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `idAntrian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `idMenu`, `jumlah`, `idAntrian`) VALUES
(1, 5, 0, 8),
(2, 6, 0, 8),
(3, 6, 0, 9),
(4, 7, 0, 9),
(5, 7, 1, 10),
(6, 8, 1, 10),
(7, 2, 1, 10),
(8, 5, 1, 11),
(9, 6, 1, 11),
(10, 7, 1, 11),
(11, 1, 1, 12),
(12, 6, 1, 13),
(13, 6, 1, 14),
(14, 8, 1, 15),
(15, 1, 1, 16),
(16, 25, 2, 16),
(17, 27, 1, 16),
(18, 7, 1, 16),
(19, 7, 1, 17),
(20, 6, 2, 17),
(21, 1, 1, 18),
(22, 7, 1, 19),
(23, 6, 1, 19),
(24, 1, 4, 20),
(25, 6, 1, 20),
(26, 7, 1, 20),
(27, 20, 1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `rule` int(1) NOT NULL,
  `hapus` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `password`, `rule`, `hapus`) VALUES
(1, 'Moham', '$2y$10$MuR.3IpT.1xLJbeUYs6V6.KcCw0A6OO3Vv6K4L9dCuXgDum1eBf/G', 1, NULL),
(2, 'findri', '$2y$10$tNdOYtHXIcaDMaG9F74E9ucomT55HJQh49A/hc9NCosDXTPp4EX0O', 0, NULL),
(3, 'Moh. Nikmat', '$2y$10$N8XuFBEzrTLVccSYXgBoeuSk85r1ZmG/ouiq2hFbbiTpj4WB0yLGS', 1, NULL),
(4, 'Krocket ayam', '$2y$10$qC5Xlz80E7BuC/1cfkI5KOeyi/BQ9lw4nvmtYMmAUb0ijhq2NwMDi', 0, '2022-01-20 12:01:00');

-- --------------------------------------------------------

--
-- Structure for view `pembelian`
--
DROP TABLE IF EXISTS `pembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pembelian`  AS SELECT `antrian`.`id` AS `idAntrian`, `antrian`.`nama` AS `namaAntrian`, `antrian`.`noMeja` AS `noMeja`, `antrian`.`status` AS `statusAntrian`, `antrian`.`tanggal` AS `tanggal`, `menu`.`id` AS `idMenu`, `menu`.`foto` AS `foto`, `menu`.`hapus` AS `hapus`, `menu`.`harga` AS `harga`, `menu`.`jenis` AS `jenis`, `menu`.`nama` AS `namaMenu`, `menu`.`status` AS `statusMenu`, `transaksi`.`id` AS `idTransaksi`, `transaksi`.`jumlah` AS `jumlah`, `user`.`id` AS `idUser`, `user`.`nama` AS `namaUser`, `user`.`rule` AS `rule` FROM (((`antrian` join `transaksi` on(`antrian`.`id` = `transaksi`.`idAntrian`)) join `menu` on(`transaksi`.`idMenu` = `menu`.`id`)) join `user` on(`antrian`.`idUser` = `user`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bulan_tahun`
--
ALTER TABLE `tb_bulan_tahun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pemasok`
--
ALTER TABLE `tb_pemasok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_penjualan_id_user_foreign` (`id_user`),
  ADD KEY `id_pelanggan_id_user` (`id_pelanggan`,`id_user`);

--
-- Indexes for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `tb_stok_id_pemasok_foreign` (`id_pemasok`),
  ADD KEY `tb_stok_id_user_foreign` (`id_user`),
  ADD KEY `id_item_id_pemasok_id_user` (`id_item`,`id_pemasok`,`id_user`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `tb_transaksi_id_item_foreign` (`id_item`),
  ADD KEY `id_penjualan_id_item` (`id_penjualan`,`id_item`);

--
-- Indexes for table `tb_unit`
--
ALTER TABLE `tb_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_username` (`email`,`username`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMenu` (`idMenu`) USING BTREE,
  ADD KEY `idAntrian` (`idAntrian`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antrian`
--
ALTER TABLE `antrian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tb_bulan_tahun`
--
ALTER TABLE `tb_bulan_tahun`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_pemasok`
--
ALTER TABLE `tb_pemasok`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_stok`
--
ALTER TABLE `tb_stok`
  MODIFY `id_stok` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_unit`
--
ALTER TABLE `tb_unit`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antrian`
--
ALTER TABLE `antrian`
  ADD CONSTRAINT `antrian_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penjualan_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD CONSTRAINT `tb_stok_id_item_foreign` FOREIGN KEY (`id_item`) REFERENCES `tb_menu` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stok_id_pemasok_foreign` FOREIGN KEY (`id_pemasok`) REFERENCES `tb_pemasok` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stok_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_id_item_foreign` FOREIGN KEY (`id_item`) REFERENCES `tb_menu` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_transaksi_id_penjualan_foreign` FOREIGN KEY (`id_penjualan`) REFERENCES `tb_penjualan` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `tb_users_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `tb_roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
