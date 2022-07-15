-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jul 2022 pada 19.11
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `andri_04tplp016`
--
CREATE DATABASE IF NOT EXISTS `andri_04tplp016` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `andri_04tplp016`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kodebar` varchar(10) NOT NULL,
  `namabar` varchar(30) NOT NULL,
  `hargabeli` int(11) NOT NULL,
  `hargajual` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `saham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kodebar`, `namabar`, `hargabeli`, `hargajual`, `stok`, `saham`) VALUES
('1', 'Mouse Gaming AULA', 100000, 150000, 0, 0),
('2', 'Headset Gaming AULA', 400000, 450000, 5, 2000000),
('3', 'Keyboard Gaming AULA', 550000, 600000, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `kodepem` varchar(10) NOT NULL,
  `kodebar` varchar(10) NOT NULL,
  `jumlahbeli` int(11) NOT NULL,
  `totalhargabeli` int(11) NOT NULL,
  `tanggalbeli` date NOT NULL,
  `kodesup` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`kodepem`, `kodebar`, `jumlahbeli`, `totalhargabeli`, `tanggalbeli`, `kodesup`) VALUES
('1', '1', 5, 500000, '2022-05-29', '1'),
('2', '2', 15, 6000000, '2022-05-29', '1'),
('3', '1', 10, 1000000, '2022-05-29', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `kodepenjualan` varchar(10) NOT NULL,
  `kodebar` varchar(10) NOT NULL,
  `jumlahjual` int(11) NOT NULL,
  `tanggaljual` date NOT NULL,
  `diskon` int(11) NOT NULL,
  `totalhargajual` int(11) NOT NULL,
  `profit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`kodepenjualan`, `kodebar`, `jumlahjual`, `tanggaljual`, `diskon`, `totalhargajual`, `profit`) VALUES
('1', '1', 4, '2022-05-29', 0, 600000, 200000),
('2', '1', 1, '2022-05-29', 0, 150000, 50000),
('3', '1', 5, '2022-05-29', 0, 750000, 250000),
('4', '2', 10, '2022-05-29', 0, 4500000, 500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `kodesup` varchar(10) NOT NULL,
  `namasup` varchar(30) NOT NULL,
  `alamatsup` varchar(50) NOT NULL,
  `notelpsup` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`kodesup`, `namasup`, `alamatsup`, `notelpsup`) VALUES
('1', 'Andri Firman', 'Pocis', '087808675313'),
('2', 'Andre Farhan Saputra', 'Pocis', '087733932416'),
('3', 'Fiki Aji Panuntun', 'Buaran', '08964123421');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kodebar`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`kodepem`),
  ADD KEY `kodebar` (`kodebar`),
  ADD KEY `kodesup` (`kodesup`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`kodepenjualan`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kodesup`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `andry_laundry`
--
CREATE DATABASE IF NOT EXISTS `andry_laundry` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `andry_laundry`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata`
--

CREATE TABLE `biodata` (
  `id_biodata` int(11) NOT NULL,
  `nama_lengkap` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tempat_lahir` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('pria','wanita') COLLATE utf8_unicode_ci NOT NULL,
  `golongan_darah` enum('o','a','b','ab') COLLATE utf8_unicode_ci DEFAULT NULL,
  `telepon` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8_unicode_ci NOT NULL,
  `foto` text COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `biodata`
--

INSERT INTO `biodata` (`id_biodata`, `nama_lengkap`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `golongan_darah`, `telepon`, `email`, `alamat`, `foto`, `id_user`) VALUES
(1, 'Andri Firman Saputra', 'Jakarta', '2002-01-29', 'pria', '', '087808675313', 'andri.firman.saputra.56@gmail.com', 'Jl. AMD Babakan Pocis No. 100 RT02/RW02 Bakti Jaya Kec. Setu Kota. Tangerang Selatan Prov. Banten Jawa Barat 15433', 'andri_foto6.png', 1),
(2, 'Andre Farhan Saputra', 'Jakarta', '2002-01-29', 'pria', '', '087853132111', 'andrefarhansaputra@gmail.com', 'Jl. AMD Babakan Pocis', '5cd9bfce39cac1.jpg', 2),
(3, 'Muhammad Irgi Al Ghitraf', 'Jakarta', '2002-08-28', 'pria', '', '085942442210', 'irgibungsu@gmail.com', 'Perum Puri Serpong 1 Blok D5 No. 7 RT 08 / RW 02 Setu', 'IMG_20200210_0724522.jpg', 3),
(4, 'Salsa Rahma Fathansa', 'Jakarta', '2002-08-09', 'wanita', '', '085823266575', 'salsa24@gmail.com', 'JL. MARUGA RAYA NO 17 RT 06/04 SERUA CIPUTAT TANGERANG SELATAN', 'default.png', 4),
(5, 'Indah Permata Sari', 'Tangerang', '2004-03-03', 'wanita', '', '087832134541', 'indahpermata25@gmail.com', 'KP. CIATER BARAT RT 02/01 CIATER SERPONG TANGERANG SELATAN 15317', 'default.png', 5),
(6, 'Rian Febri Alfiarudin', 'Tangerang', '2002-02-13', 'pria', '', '089631348598', 'rianfebri13@gmail.com', 'Kelurahan Setu Rt 16/04 Setu Tangerang Selatan', 'default.png', 6),
(7, 'FEBY FEBRIYANTY', 'Tangerang', '2002-02-21', 'wanita', '', '085978983093', 'febyfebrianti97@gmail.com', 'JL. PAMULANG 2 RT 03/09 BENDA BARU PAMULANG', 'default.png', 7),
(8, 'GITA AGUSTIN', 'Tangerang', '2002-08-01', 'wanita', '', '081244583209', 'gitaagustin32@gmail.com', 'Jl. Salak Kp. Buaran Rt 04/04 No. 001 Pondok Benda Pamulang', 'default.png', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `kuantitas` float NOT NULL,
  `keterangan` text COLLATE utf8_unicode_ci NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail_transaksi`, `kuantitas`, `keterangan`, `id_transaksi`, `id_paket`) VALUES
(1, 2, 'baju x2', 1, 2),
(2, 1, 'baju x2', 3, 1),
(3, 3, 'baju x3', 4, 2),
(4, 2, 'baju x2', 5, 2),
(5, 2, 'baju x12', 7, 1),
(6, 2, 'baju x2', 8, 1),
(7, 1, 'baju x1', 8, 2),
(8, 2, 'baju x3', 9, 1),
(9, 2, 'jaket x2', 9, 2),
(10, 2, 'selimut x2', 9, 3),
(11, 1, 'baju x1', 10, 2),
(12, 2, 'baju x3', 11, 4),
(13, 2, 'baju x6', 12, 4),
(14, 2, 'jaket x2', 12, 5),
(15, 2, 'baju x2', 15, 1),
(16, 3, 'baju x3', 16, 2),
(17, 2, 'baju x2', 17, 1),
(18, 2, 'baju x2\r\n', 18, 2),
(19, 3, 'Baju x3, celana x5', 19, 1),
(20, 2, 'Jaket merah x2', 19, 2),
(21, 2, 'Selimut x1,\r\nbed cover hijau x1', 19, 3),
(22, 2, 'baju x3', 21, 1),
(23, 2, 'bed cover x2', 24, 3),
(36, 2, 'baju x2', 27, 1),
(37, 2, 'baju x3', 28, 1),
(38, 3, 'jaket x1, sweater x1, jeans x1', 28, 2),
(39, 2, 'bed cover x2', 28, 3),
(40, 2, 'baju x2', 29, 2),
(41, 2, 'baju x3', 29, 1),
(42, 2, 'baju x2', 30, 5),
(43, 6, 'baju x3, celana x6, jaket x1', 32, 1),
(44, 2, 'baju x4', 33, 1),
(45, 1, 'jaket x1', 33, 2),
(46, 2, 'bed cover x2', 33, 3),
(47, 3, 'baju x5, celana x6', 34, 4),
(49, 3, 'baju x5, celana x5', 35, 6),
(50, 2, 'kaos kaki x2', 34, 5),
(51, 5, '', 36, 4),
(52, 2, 'Baju x5, Celana x3', 37, 1),
(53, 1, 'baju x3', 38, 4),
(54, 2, 'kaos kaki x5 pasang', 38, 5),
(55, 2, 'baju 2x', 39, 2),
(56, 2, 'kaos kaki 2x', 40, 2),
(57, 2, 'baju x4', 40, 1),
(58, 2, 'jaket x2', 7, 2),
(59, 2, 'jaket x2', 41, 2),
(60, 1, 'baju x3', 42, 1),
(61, 5, 'O9I9', 43, 2),
(62, 4, 'kaos kaki (4) pasang', 44, 5),
(63, 5, 'baju', 45, 1),
(64, 4, 'kemeja', 45, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(1, 'super administrator'),
(2, 'administrator'),
(3, 'kasir'),
(4, 'owner');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_paket`
--

CREATE TABLE `jenis_paket` (
  `id_jenis_paket` int(11) NOT NULL,
  `nama_jenis_paket` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `jenis_paket`
--

INSERT INTO `jenis_paket` (`id_jenis_paket`, `nama_jenis_paket`) VALUES
(1, 'kiloan'),
(2, 'selimut'),
(3, 'bed cover'),
(4, 'Kaos'),
(6, 'Celana'),
(8, 'satuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `isi_log` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_log` datetime NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `log`
--

INSERT INTO `log` (`id_log`, `isi_log`, `tanggal_log`, `id_user`) VALUES
(1, 'Pengguna super_administrator berhasil login', '2020-03-02 14:28:37', 1),
(2, 'Biodata Pengguna Andri Firman Saputra berhasil ditambahkan', '2020-03-02 14:31:04', 1),
(3, 'Outlet Andry Laundry Pamulang berhasil ditambahkan', '2020-03-02 14:32:18', 1),
(4, 'Pengguna andre975 berhasil ditambahkan', '2020-03-02 14:32:42', 1),
(5, 'Pengguna super_administrator berhasil logout', '2020-03-02 14:33:33', 1),
(6, 'Pengguna andre975 berhasil login', '2020-03-02 14:35:28', 2),
(7, 'Biodata Pengguna Andre Farhan Saputra berhasil ditambahkan', '2020-03-02 14:36:25', 2),
(8, 'Print profile', '2020-03-02 14:36:37', 2),
(9, 'Pengguna irgi12 berhasil ditambahkan', '2020-03-02 14:37:55', 2),
(10, 'Biodata Pengguna Muhammad Irgi Al Ghitraf berhasil ditambahkan', '2020-03-02 14:40:15', 2),
(11, 'Print profile', '2020-03-02 14:40:23', 2),
(12, 'Paket Kiloan Biasa AJA berhasil ditambahkan', '2020-03-02 14:43:08', 2),
(13, 'Paket satuan baju aja mas berhasil ditambahkan', '2020-03-02 14:45:42', 2),
(14, 'Paket Satuan baju aja mas berhasil diubah', '2020-03-02 14:45:49', 2),
(15, 'Paket WoW! Bed cover Ada disini! berhasil ditambahkan', '2020-03-02 14:46:30', 2),
(16, 'Pengguna andre975 berhasil login', '2020-03-02 14:47:48', 2),
(17, 'Member Salsa Rahma Fathansa berhasil ditambahkan', '2020-03-02 14:49:25', 2),
(18, 'Member Muhammad Fikri berhasil ditambahkan', '2020-03-02 14:50:37', 2),
(19, 'Transaksi 02032020122T0001 berhasil ditambahkan', '2020-03-02 14:52:26', 2),
(20, 'Transaksi 02032020122T0001 berhasil diubah', '2020-03-02 14:52:51', 2),
(21, 'Transaksi 02032020122T0001 berhasil diubah', '2020-03-02 14:53:06', 2),
(22, 'Transaksi 02032020122T0001 berhasil diubah', '2020-03-02 14:53:18', 2),
(23, 'Transaksi 02032020122T0001 berhasil dihapus', '2020-03-02 14:54:12', 2),
(24, 'Transaksi 02032020121T0001 berhasil ditambahkan', '2020-03-02 14:55:07', 2),
(25, 'Member Nazira Apriliani berhasil diubah', '2020-03-02 14:58:43', 2),
(26, 'Pengguna salsa321 berhasil ditambahkan', '2020-03-02 14:59:04', 2),
(27, 'Biodata Pengguna Salsa Rahma Fathansa berhasil ditambahkan', '2020-03-02 15:01:51', 2),
(28, 'Detail Transaksi 02032020121T0001 berhasil ditambahkan', '2020-03-02 15:02:41', 2),
(29, 'Pengguna andre975 berhasil logout', '2020-03-02 15:05:40', 2),
(30, 'Pengguna super_administrator berhasil login', '2020-03-02 15:05:46', 1),
(31, 'Pengguna indah76 berhasil ditambahkan', '2020-03-02 15:07:56', 1),
(32, 'Biodata Pengguna Indah Permata Sari berhasil ditambahkan', '2020-03-02 15:10:40', 1),
(33, 'Pengguna rian43 berhasil ditambahkan', '2020-03-02 15:11:34', 1),
(34, 'Biodata Pengguna Rian Febri Alfiarudin berhasil ditambahkan', '2020-03-02 15:12:26', 1),
(35, 'Pengguna febyfeb09 berhasil ditambahkan', '2020-03-02 15:12:57', 1),
(36, 'Biodata Pengguna FEBY FEBRIYANTY berhasil ditambahkan', '2020-03-02 15:14:49', 1),
(37, 'Pengguna super_administrator berhasil logout', '2020-03-02 15:16:26', 1),
(38, 'Pengguna irgi12 berhasil login', '2020-03-03 23:29:52', 3),
(39, 'Pengguna irgi12 berhasil login', '2020-03-03 23:35:09', 3),
(40, 'Transaksi  berhasil diubah statusnya', '2020-03-03 23:44:12', 3),
(41, 'Transaksi  berhasil diubah statusnya', '2020-03-03 23:46:35', 3),
(42, 'Transaksi  berhasil diubah statusnya', '2020-03-03 23:47:15', 3),
(43, 'Pengguna irgi12 berhasil logout', '2020-03-03 23:50:38', 3),
(44, 'Pengguna super_administrator berhasil login', '2020-03-03 23:50:44', 1),
(45, 'Transaksi 02032020121T0001 berhasil diubah', '2020-03-03 23:58:05', 1),
(46, 'Transaksi  berhasil diubah statusnya', '2020-03-03 23:58:27', 1),
(47, 'Transaksi 02032020121T0001 berhasil diubah', '2020-03-03 23:59:28', 1),
(48, 'Transaksi 02032020121T0001 berhasil diubah', '2020-03-03 23:59:35', 1),
(49, 'Transaksi  berhasil diubah statusnya', '2020-03-03 23:59:43', 1),
(50, 'Transaksi 02032020121T0001 berhasil diubah', '2020-03-04 00:00:39', 1),
(51, 'Transaksi 02032020121T0001 berhasil dihapus', '2020-03-04 00:00:45', 1),
(52, 'Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-04 00:01:16', 1),
(53, 'Transaksi  berhasil diubah statusnya', '2020-03-04 00:05:42', 1),
(54, 'Transaksi 04032020112T0002 berhasil ditambahkan', '2020-03-04 00:06:34', 1),
(55, 'Transaksi  berhasil diubah status transaksinya', '2020-03-04 00:10:37', 1),
(56, 'Transaksi 04032020112T0003 berhasil ditambahkan', '2020-03-04 00:17:04', 1),
(57, 'Pengguna super_administrator berhasil login', '2020-03-04 00:25:03', 1),
(58, 'Member Bintang Shakila Akassah berhasil ditambahkan', '2020-03-04 00:26:56', 1),
(59, 'Transaksi 04032020211T0004 berhasil ditambahkan', '2020-03-04 00:59:50', 1),
(60, 'Pengguna super_administrator berhasil login', '2020-03-04 01:04:21', 1),
(61, 'Transaksi 04032020113T0004 berhasil ditambahkan', '2020-03-04 01:04:42', 1),
(62, 'Transaksi 04032020113T0005 berhasil ditambahkan', '2020-03-04 01:04:52', 1),
(63, 'Pengguna super_administrator berhasil login', '2020-03-04 01:27:40', 1),
(64, 'Transaksi 04032020113T0005 berhasil ditambahkan', '2020-03-04 01:28:51', 1),
(65, 'Transaksi 04032020113T0005 berhasil dihapus', '2020-03-04 01:29:59', 1),
(66, 'Pengguna super_administrator berhasil login', '2020-03-04 01:31:25', 1),
(67, 'Transaksi 04032020112T0005 berhasil ditambahkan', '2020-03-04 01:31:35', 1),
(68, 'Pengguna super_administrator berhasil login', '2020-03-04 01:33:37', 1),
(69, 'Transaksi 04032020113T0005 berhasil ditambahkan', '2020-03-04 01:33:54', 1),
(70, 'Transaksi 04032020113T0005 berhasil dihapus', '2020-03-04 01:34:00', 1),
(71, 'Transaksi 04032020113T0005 berhasil ditambahkan', '2020-03-04 01:34:35', 1),
(72, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-04 02:32:41', 1),
(73, 'Transaksi 04032020112T0006 berhasil ditambahkan', '2020-03-04 02:33:11', 1),
(74, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-04 02:33:18', 1),
(75, 'Transaksi 04032020113T0006 berhasil ditambahkan', '2020-03-04 02:34:12', 1),
(76, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-04 02:34:19', 1),
(77, 'Pengguna super_administrator berhasil login', '2020-03-04 02:36:01', 1),
(78, 'Transaksi 04032020113T0007 berhasil ditambahkan', '2020-03-04 02:36:15', 1),
(79, 'Pengguna super_administrator berhasil login', '2020-03-04 02:38:14', 1),
(80, 'Transaksi 04032020111T0008 berhasil ditambahkan', '2020-03-04 02:38:28', 1),
(81, 'Transaksi 04032020111T0008 berhasil ditambahkan', '2020-03-04 02:39:05', 1),
(82, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-04 02:39:48', 1),
(83, 'Pengguna super_administrator berhasil login', '2020-03-04 02:41:43', 1),
(84, 'Transaksi 04032020113T0008 berhasil ditambahkan', '2020-03-04 02:41:56', 1),
(85, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-04 02:42:16', 1),
(86, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-04 02:42:40', 1),
(87, 'Pengguna super_administrator berhasil login', '2020-03-04 02:53:35', 1),
(88, 'Pengguna super_administrator berhasil logout', '2020-03-04 02:55:30', 1),
(89, 'Pengguna indah76 berhasil login', '2020-03-04 02:55:33', 5),
(90, 'Paket Reguler Kiloan berhasil ditambahkan', '2020-03-04 02:55:58', 5),
(91, 'Paket Reguler Satuan berhasil ditambahkan', '2020-03-04 02:56:23', 5),
(92, 'Pengguna indah76 berhasil logout', '2020-03-04 02:56:47', 5),
(93, 'Pengguna indah76 berhasil login', '2020-03-04 02:57:04', 5),
(94, 'Pengguna indah76 berhasil logout', '2020-03-04 02:58:14', 5),
(95, 'Pengguna super_administrator berhasil login', '2020-03-04 02:58:19', 1),
(96, 'Transaksi 04032020113T0009 berhasil ditambahkan', '2020-03-04 03:02:57', 1),
(97, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-04 03:06:55', 1),
(98, 'Pengguna super_administrator berhasil login', '2020-03-04 12:58:14', 1),
(99, 'Transaksi 04032020112T0010 berhasil ditambahkan', '2020-03-04 12:59:19', 1),
(100, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-04 12:59:33', 1),
(101, 'Pengguna super_administrator berhasil login', '2020-03-05 06:35:34', 1),
(102, 'Member Bintang Shakila Akassah berhasil diubah', '2020-03-05 06:38:19', 1),
(103, 'Pengguna super_administrator berhasil logout', '2020-03-05 06:40:23', 1),
(104, 'Pengguna andre975 berhasil login', '2020-03-05 06:40:30', 2),
(105, 'Transaksi 05032020122T0001 berhasil ditambahkan', '2020-03-05 06:41:41', 2),
(106, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-05 06:42:36', 2),
(107, 'Paket Satuan aja mas berhasil diubah', '2020-03-05 06:56:08', 2),
(108, 'Transaksi 05032020122T0001 berhasil dihapus', '2020-03-05 06:57:31', 2),
(109, 'Transaksi 05032020122T0001 berhasil ditambahkan', '2020-03-05 06:58:55', 2),
(110, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-05 07:00:20', 2),
(111, 'Pengguna andre975 berhasil logout', '2020-03-05 07:00:39', 2),
(112, 'Pengguna andre975 berhasil login', '2020-03-05 07:00:45', 2),
(113, 'Transaksi 05032020122T0002 berhasil ditambahkan', '2020-03-05 07:01:36', 2),
(114, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-05 07:01:53', 2),
(115, 'Transaksi 05032020122T0003 berhasil ditambahkan', '2020-03-05 07:02:45', 2),
(116, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-05 07:04:40', 2),
(117, 'Detail Transaksi 04032020111T0001 berhasil ditambahkan', '2020-03-05 07:14:10', 2),
(118, 'Transaksi 05032020122T0001 berhasil ditambahkan', '2020-03-05 07:20:07', 2),
(119, 'Detail Transaksi 05032020122T0001 berhasil ditambahkan', '2020-03-05 07:20:18', 2),
(120, 'Pengguna andre975 berhasil login', '2020-03-06 06:52:35', 2),
(121, 'Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 06:55:39', 2),
(122, 'Detail Transaksi 05032020122T0001 berhasil ditambahkan', '2020-03-06 06:58:41', 2),
(123, 'Pembayaran Transaksi 06032020123T0001 berhasil', '2020-03-06 07:30:21', 2),
(124, 'Pembayaran Transaksi 06032020123T0001 berhasil', '2020-03-06 07:31:22', 2),
(125, 'Pembayaran Transaksi 06032020123T0001 berhasil', '2020-03-06 07:32:33', 2),
(126, 'Pembayaran Transaksi 06032020123T0001 berhasil', '2020-03-06 07:35:00', 2),
(127, 'Pengguna andre975 berhasil logout', '2020-03-06 07:37:35', 2),
(128, 'Pengguna andre975 berhasil login', '2020-03-06 07:37:41', 2),
(129, 'Transaksi 06032020121T0002 berhasil ditambahkan', '2020-03-06 07:38:22', 2),
(130, 'Detail Transaksi 05032020122T0001 berhasil ditambahkan', '2020-03-06 07:38:28', 2),
(131, 'Pembayaran Transaksi 06032020121T0002 berhasil', '2020-03-06 07:38:36', 2),
(132, 'Pembayaran Transaksi 06032020121T0002 gagal! uang yang dibayar kurang dari total harga', '2020-03-06 07:42:56', 2),
(133, 'Pembayaran Transaksi 06032020121T0002 gagal! uang yang dibayar kurang dari total harga', '2020-03-06 07:44:11', 2),
(134, 'Pembayaran Transaksi 06032020121T0002 berhasil', '2020-03-06 07:45:59', 2),
(135, 'Pengguna andre975 berhasil logout', '2020-03-06 07:50:57', 2),
(136, 'Pengguna andre975 berhasil login', '2020-03-06 07:51:04', 2),
(137, 'Transaksi 06032020121T0001 berhasil ditambahkan', '2020-03-06 07:51:16', 2),
(138, 'Detail Transaksi 06032020121T0001 berhasil ditambahkan', '2020-03-06 07:51:35', 2),
(139, 'Pengguna andre975 berhasil logout', '2020-03-06 07:52:51', 2),
(140, 'Pengguna andre975 berhasil login', '2020-03-06 07:53:18', 2),
(141, 'Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 07:53:44', 2),
(142, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 07:54:55', 2),
(143, 'Pembayaran Transaksi 06032020123T0001 gagal! uang yang dibayar kurang dari total harga', '2020-03-06 08:00:33', 2),
(144, 'Pembayaran Transaksi 06032020123T0001 berhasil', '2020-03-06 08:01:31', 2),
(145, 'Cetak Invoice 06032020123T0001 Bintang Shakila Akassah', '2020-03-06 08:22:02', 2),
(146, 'Cetak Invoice  ', '2020-03-06 08:22:02', 2),
(147, 'Cetak Invoice 06032020123T0001 Bintang Shakila Akassah', '2020-03-06 08:22:38', 2),
(148, 'Pengguna andre975 berhasil login', '2020-03-06 10:46:22', 2),
(149, 'Transaksi 06032020122T0002 berhasil ditambahkan', '2020-03-06 10:46:55', 2),
(150, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 10:50:13', 2),
(151, 'Transaksi 06032020123T0002 berhasil ditambahkan', '2020-03-06 10:50:57', 2),
(152, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 10:51:07', 2),
(153, 'Pembayaran Transaksi 06032020123T0002 berhasil', '2020-03-06 10:51:35', 2),
(154, 'Cetak Invoice 06032020123T0002 Bintang Shakila Akassah', '2020-03-06 10:51:46', 2),
(155, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:53:12', 2),
(156, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:54:57', 2),
(157, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:55:09', 2),
(158, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:56:11', 2),
(159, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:58:36', 2),
(160, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:58:55', 2),
(161, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:59:11', 2),
(162, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:59:19', 2),
(163, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:59:32', 2),
(164, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 10:59:49', 2),
(165, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:01:04', 2),
(166, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:01:45', 2),
(167, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:04:55', 2),
(168, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:05:37', 2),
(169, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:06:56', 2),
(170, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:11:19', 2),
(171, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:12:06', 2),
(172, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:12:09', 2),
(173, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:12:22', 2),
(174, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:12:24', 2),
(175, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:12:30', 2),
(176, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:13:02', 2),
(177, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:13:18', 2),
(178, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:13:45', 2),
(179, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:14:04', 2),
(180, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:14:42', 2),
(181, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:14:46', 2),
(182, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:14:58', 2),
(183, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:16:01', 2),
(184, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:16:19', 2),
(185, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:16:28', 2),
(186, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:19:16', 2),
(187, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:19:27', 2),
(188, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:19:29', 2),
(189, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:29:06', 2),
(190, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:31:02', 2),
(191, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:31:17', 2),
(192, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:31:31', 2),
(193, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:31:40', 2),
(194, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:31:53', 2),
(195, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:32:06', 2),
(196, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:32:19', 2),
(197, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:33:03', 2),
(198, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:33:12', 2),
(199, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:33:31', 2),
(200, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:33:39', 2),
(201, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:36:06', 2),
(202, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:36:25', 2),
(203, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:36:39', 2),
(204, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:36:49', 2),
(205, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:37:00', 2),
(206, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:37:34', 2),
(207, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:38:15', 2),
(208, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:38:54', 2),
(209, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:39:35', 2),
(210, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:39:42', 2),
(211, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:39:49', 2),
(212, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:39:56', 2),
(213, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:40:34', 2),
(214, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:40:38', 2),
(215, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:40:52', 2),
(216, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:43:59', 2),
(217, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:46:41', 2),
(218, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:46:50', 2),
(219, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:46:53', 2),
(220, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:47:39', 2),
(221, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:47:50', 2),
(222, 'Cetak Invoice - 06032020123T0002 - Bintang Shakila Akassah', '2020-03-06 11:47:53', 2),
(223, 'Member Bintang Shakila Akassah berhasil diubah', '2020-03-06 11:48:31', 2),
(224, 'Member Bintang Shakila Akassah berhasil diubah', '2020-03-06 11:48:54', 2),
(225, 'Pengguna andre975 berhasil logout', '2020-03-06 11:49:11', 2),
(226, 'Pengguna andre975 berhasil login', '2020-03-06 19:21:55', 2),
(227, 'Transaksi  berhasil diubah statusnya', '2020-03-06 19:25:53', 2),
(228, 'Transaksi 06032020122T0002 berhasil diubah', '2020-03-06 19:26:30', 2),
(229, 'Transaksi 06032020123T0003 berhasil ditambahkan', '2020-03-06 19:26:44', 2),
(230, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 19:26:51', 2),
(231, 'Pembayaran Transaksi 06032020123T0003 berhasil', '2020-03-06 19:31:22', 2),
(232, 'Cetak Invoice - 06032020123T0003 - Bintang Shakila Akassah', '2020-03-06 19:31:25', 2),
(233, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:34:53', 2),
(234, 'Cetak Invoice - 06032020123T0003 - Bintang Shakila Akassah', '2020-03-06 19:37:43', 2),
(235, 'Pembayaran Transaksi 06032020122T0002 berhasil', '2020-03-06 19:46:00', 2),
(236, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:48:15', 2),
(237, 'Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 19:52:58', 2),
(238, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 19:55:17', 2),
(239, 'Pembayaran Transaksi 06032020123T0001 berhasil', '2020-03-06 19:55:27', 2),
(240, 'Cetak Invoice - 06032020123T0001 - Bintang Shakila Akassah', '2020-03-06 19:55:30', 2),
(241, 'Transaksi 06032020122T0002 berhasil ditambahkan', '2020-03-06 19:55:56', 2),
(242, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 19:56:18', 2),
(243, 'Pembayaran Transaksi 06032020122T0002 berhasil', '2020-03-06 19:56:24', 2),
(244, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:56:29', 2),
(245, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:57:19', 2),
(246, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:57:28', 2),
(247, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:57:33', 2),
(248, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:57:37', 2),
(249, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:58:38', 2),
(250, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:58:40', 2),
(251, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:58:48', 2),
(252, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:58:52', 2),
(253, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:58:55', 2),
(254, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:59:17', 2),
(255, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:59:24', 2),
(256, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 19:59:29', 2),
(257, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:00:00', 2),
(258, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:00:03', 2),
(259, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:00:08', 2),
(260, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:00:26', 2),
(261, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:00:32', 2),
(262, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:00:45', 2),
(263, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:00:53', 2),
(264, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:01:03', 2),
(265, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:01:09', 2),
(266, 'Transaksi  berhasil diubah status transaksinya', '2020-03-06 20:01:45', 2),
(267, 'Transaksi  berhasil diubah status transaksinya', '2020-03-06 20:01:48', 2),
(268, 'Transaksi 06032020122T0002 berhasil diubah', '2020-03-06 20:13:30', 2),
(269, 'Transaksi 06032020122T0002 berhasil diubah', '2020-03-06 20:15:15', 2),
(270, 'Transaksi 06032020122T0002 berhasil diubah', '2020-03-06 20:15:22', 2),
(271, 'Transaksi 06032020122T0002 berhasil diubah', '2020-03-06 20:15:46', 2),
(272, 'Transaksi 06032020122T0002 berhasil diubah', '2020-03-06 20:17:31', 2),
(273, 'Cetak Invoice -  - ', '2020-03-06 20:18:37', 2),
(274, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:19:33', 2),
(275, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:20:01', 2),
(276, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:20:21', 2),
(277, 'Transaksi 06032020123T0001 berhasil diubah', '2020-03-06 20:20:44', 2),
(278, 'Cetak Invoice - 06032020123T0001 - Bintang Shakila Akassah', '2020-03-06 20:21:00', 2),
(279, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:21:14', 2),
(280, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 20:25:29', 2),
(281, 'Transaksi 06032020123T0001 berhasil diubah', '2020-03-06 20:40:29', 2),
(282, 'Transaksi 06032020123T0001 berhasil diubah', '2020-03-06 20:41:11', 2),
(283, 'Transaksi 06032020123T0001 berhasil diubah', '2020-03-06 20:42:00', 2),
(284, 'Transaksi 06032020123T0001 berhasil diubah', '2020-03-06 20:42:06', 2),
(285, 'Pengguna andre975 berhasil login', '2020-03-06 20:45:13', 2),
(286, 'Pengguna andre975 berhasil login', '2020-03-06 20:46:01', 2),
(287, 'Pengguna andre975 berhasil login', '2020-03-06 20:46:22', 2),
(288, 'Transaksi 06032020121T0002 berhasil ditambahkan', '2020-03-06 21:15:57', 2),
(289, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 21:16:06', 2),
(290, 'Pembayaran Transaksi 06032020121T0002 berhasil', '2020-03-06 21:16:10', 2),
(291, 'Cetak Invoice - 06032020121T0002 - Nazira Apriliani', '2020-03-06 21:16:14', 2),
(292, 'Transaksi 06032020122T0002 berhasil ditambahkan', '2020-03-06 21:16:48', 2),
(293, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 21:17:02', 2),
(294, 'Pengguna andre975 berhasil login', '2020-03-06 21:28:30', 2),
(295, 'Pengguna indah76 berhasil login', '2020-03-06 21:59:17', 5),
(296, 'Pengguna indah76 berhasil login', '2020-03-06 22:00:01', 5),
(297, 'Member Namira Nindya Fitri berhasil ditambahkan', '2020-03-06 22:04:05', 5),
(298, 'Member Yos Hermawan berhasil ditambahkan', '2020-03-06 22:05:17', 5),
(299, 'Member Arum Diah Ariyanti berhasil ditambahkan', '2020-03-06 22:06:00', 5),
(300, 'Transaksi 06032020256T0002 berhasil ditambahkan', '2020-03-06 22:06:32', 5),
(301, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 22:06:53', 5),
(302, 'Pembayaran Transaksi 06032020256T0002 berhasil', '2020-03-06 22:07:00', 5),
(303, 'Cetak Invoice - 06032020256T0002 - Arum Diah Ariyanti', '2020-03-06 22:07:08', 5),
(304, 'Transaksi 06032020254T0003 berhasil ditambahkan', '2020-03-06 22:11:09', 5),
(305, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 22:34:46', 5),
(306, 'Pembayaran Transaksi 06032020254T0003 berhasil', '2020-03-06 22:35:10', 5),
(307, 'Cetak Invoice - 06032020254T0003 - Namira Nindya Fitri', '2020-03-06 22:35:13', 5),
(308, 'Transaksi 06032020256T0003 berhasil ditambahkan', '2020-03-06 22:35:29', 5),
(309, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 22:35:36', 5),
(310, 'Cetak Invoice -  - ', '2020-03-06 22:36:03', 5),
(311, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 22:36:08', 5),
(312, 'Cetak Invoice - 06032020122T0002 - Muhammad Fikri', '2020-03-06 22:36:11', 5),
(313, 'Cetak Invoice - 06032020256T0003 - Arum Diah Ariyanti', '2020-03-06 22:36:27', 5),
(314, 'Cetak Invoice - 06032020121T0002 - Nazira Apriliani', '2020-03-06 23:15:44', 5),
(315, 'Cetak Invoice - 06032020121T0002 - Nazira Apriliani', '2020-03-06 23:15:49', 5),
(316, 'Pengguna indah76 berhasil logout', '2020-03-06 23:23:31', 5),
(317, 'Pengguna andre975 berhasil login', '2020-03-06 23:23:36', 2),
(318, 'Transaksi 06032020126T0004 berhasil ditambahkan', '2020-03-06 23:24:10', 2),
(319, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 23:24:26', 2),
(320, 'Pembayaran Transaksi 06032020126T0004 berhasil', '2020-03-06 23:24:31', 2),
(321, 'Cetak Invoice - 06032020126T0004 - Arum Diah Ariyanti', '2020-03-06 23:24:33', 2),
(322, 'Transaksi 06032020123T0004 berhasil ditambahkan', '2020-03-06 23:25:12', 2),
(323, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-06 23:25:33', 2),
(324, 'Pengguna andre975 berhasil logout', '2020-03-06 23:45:55', 2),
(325, 'Pengguna super_administrator berhasil login', '2020-03-06 23:46:01', 1),
(326, 'Pembayaran Transaksi 06032020123T0004 berhasil', '2020-03-06 23:49:29', 2),
(327, 'Cetak Invoice - 06032020123T0004 - Bintang Shakila Akassah', '2020-03-06 23:49:33', 1),
(328, 'Pembayaran Transaksi 06032020256T0003 berhasil', '2020-03-06 23:51:31', 1),
(329, 'Cetak Invoice - 06032020256T0003 - Arum Diah Ariyanti', '2020-03-06 23:51:33', 1),
(330, 'Pengguna super_administrator berhasil logout', '2020-03-06 23:52:30', 1),
(331, 'Pengguna andre975 berhasil login', '2020-03-07 12:57:55', 2),
(332, 'Transaksi  berhasil diubah status transaksinya', '2020-03-07 13:21:21', 2),
(333, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-07 13:24:47', 2),
(334, 'Detail Transaksi 06032020123T0001 berhasil ditambahkan', '2020-03-07 13:25:05', 2),
(335, 'Detail Transaksi 06032020121T0002 berhasil ditambahkan', '2020-03-07 13:28:25', 2),
(336, 'Detail Transaksi 06032020122T0002 berhasil dihapus', '2020-03-07 13:28:48', 2),
(337, 'Detail Transaksi  berhasil dihapus', '2020-03-07 13:28:51', 2),
(338, 'Detail Transaksi  berhasil dihapus', '2020-03-07 13:28:57', 2),
(339, 'Cetak Invoice - 06032020126T0004 - Arum Diah Ariyanti', '2020-03-07 13:29:29', 2),
(340, 'Cetak Invoice - 06032020123T0004 - Bintang Shakila Akassah', '2020-03-07 13:29:50', 2),
(341, 'Detail Transaksi 06032020126T0004 berhasil ditambahkan', '2020-03-07 13:30:40', 2),
(342, 'Pengguna andre975 berhasil login', '2020-03-08 09:09:59', 2),
(343, 'Transaksi 06032020123T0004 berhasil diubah', '2020-03-08 09:11:37', 2),
(344, 'Transaksi 06032020123T0004 berhasil diubah', '2020-03-08 09:12:05', 2),
(345, 'Transaksi 06032020123T0004 berhasil diubah', '2020-03-08 09:14:58', 2),
(346, 'Transaksi 06032020122T0002 berhasil diubah', '2020-03-08 09:15:18', 2),
(347, 'Transaksi 08032020126T0001 berhasil ditambahkan', '2020-03-08 09:18:07', 2),
(348, 'Detail Transaksi 08032020126T0001 berhasil ditambahkan', '2020-03-08 09:18:48', 2),
(349, 'Transaksi 08032020126T0001 berhasil diubah', '2020-03-08 09:19:46', 2),
(350, 'Pengguna andre975 berhasil logout', '2020-03-08 09:22:43', 2),
(351, 'Pengguna andre975 berhasil login', '2020-03-08 09:22:48', 2),
(352, 'Transaksi 08032020126T0001 berhasil diubah', '2020-03-08 09:23:00', 2),
(353, 'Pembayaran Transaksi 08032020126T0001 berhasil', '2020-03-08 09:23:10', 2),
(354, 'Cetak Invoice - 08032020126T0001 - Arum Diah Ariyanti', '2020-03-08 09:23:14', 2),
(355, 'Cetak Invoice - 08032020126T0001 - Arum Diah Ariyanti', '2020-03-08 09:24:05', 2),
(356, 'Cetak Invoice - 08032020126T0001 - Arum Diah Ariyanti', '2020-03-08 09:24:36', 2),
(357, 'Cetak Invoice - 08032020126T0001 - Arum Diah Ariyanti', '2020-03-08 09:26:07', 2),
(358, 'Transaksi 08032020123T0002 berhasil ditambahkan', '2020-03-08 09:26:36', 2),
(359, 'Detail Transaksi 08032020123T0002 berhasil ditambahkan', '2020-03-08 09:28:07', 2),
(360, 'Pembayaran Transaksi 08032020123T0002 berhasil', '2020-03-08 09:28:18', 2),
(361, 'Cetak Invoice - 08032020123T0002 - Bintang Shakila Akassah', '2020-03-08 09:28:33', 2),
(362, 'Transaksi  berhasil diubah status transaksinya', '2020-03-08 09:33:14', 2),
(363, 'Transaksi 08032020122T0002 berhasil ditambahkan', '2020-03-08 09:34:07', 2),
(364, 'Detail Transaksi 08032020122T0002 berhasil ditambahkan', '2020-03-08 09:34:14', 2),
(365, 'Pengguna andre975 berhasil logout', '2020-03-08 09:40:56', 2),
(366, 'Pengguna andre975 berhasil login', '2020-03-08 09:41:01', 2),
(367, 'Transaksi 08032020123T0002 berhasil ditambahkan', '2020-03-08 09:41:16', 2),
(368, 'Detail Transaksi 08032020123T0002 berhasil ditambahkan', '2020-03-08 09:41:27', 2),
(369, 'Pengguna andre975 berhasil login', '2020-03-08 09:42:49', 2),
(370, 'Transaksi 08032020123T0001 berhasil ditambahkan', '2020-03-08 09:43:03', 2),
(371, 'Detail Transaksi 08032020123T0001 berhasil ditambahkan', '2020-03-08 09:43:19', 2),
(372, 'Pembayaran Transaksi 08032020123T0001 berhasil', '2020-03-08 09:49:52', 2),
(373, 'Cetak Invoice - 08032020123T0001 - Bintang Shakila Akassah', '2020-03-08 09:51:25', 2),
(374, 'Cetak Invoice - 08032020123T0001 - Bintang Shakila Akassah', '2020-03-08 09:52:06', 2),
(375, 'Cetak Invoice - 08032020123T0001 - Bintang Shakila Akassah', '2020-03-08 09:52:20', 2),
(376, 'Cetak Invoice - 08032020123T0001 - Bintang Shakila Akassah', '2020-03-08 09:52:31', 2),
(377, 'Cetak Invoice - 08032020123T0001 - Bintang Shakila Akassah', '2020-03-08 09:54:44', 2),
(378, 'Cetak Invoice - 08032020123T0001 - Bintang Shakila Akassah', '2020-03-08 09:56:41', 2),
(379, 'Transaksi 08032020124T0001 berhasil ditambahkan', '2020-03-08 09:57:27', 2),
(380, 'Detail Transaksi 08032020124T0001 berhasil ditambahkan', '2020-03-08 09:57:42', 2),
(381, 'Pembayaran Transaksi 08032020124T0001 gagal! uang yang dibayar kurang dari total harga', '2020-03-08 10:00:40', 2),
(382, 'Pembayaran Transaksi 08032020124T0001 berhasil', '2020-03-08 10:00:45', 2),
(383, 'Cetak Invoice - 08032020124T0001 - Namira Nindya Fitri', '2020-03-08 10:00:48', 2),
(384, 'Cetak Invoice - 08032020124T0001 - Namira Nindya Fitri', '2020-03-08 10:01:21', 2),
(385, 'Cetak Invoice - 08032020124T0001 - Namira Nindya Fitri', '2020-03-08 10:01:34', 2),
(386, 'Cetak Invoice - 08032020124T0001 - Namira Nindya Fitri', '2020-03-08 10:02:13', 2),
(387, 'Transaksi  berhasil diubah status transaksinya', '2020-03-08 10:02:31', 2),
(388, 'Transaksi  berhasil diubah status transaksinya', '2020-03-08 10:02:33', 2),
(389, 'Transaksi 08032020122T0002 berhasil ditambahkan', '2020-03-08 10:06:02', 2),
(390, 'Detail Transaksi 08032020122T0002 gagal ditambahkan', '2020-03-08 10:14:43', 2),
(391, 'Detail Transaksi 08032020122T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:15:14', 2),
(392, 'Detail Transaksi 08032020122T0002 berhasil ditambahkan', '2020-03-08 10:15:26', 2),
(393, 'Transaksi 08032020123T0002 berhasil ditambahkan', '2020-03-08 10:18:51', 2),
(394, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:38:22', 2),
(395, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:38:30', 2),
(396, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:42:25', 2),
(397, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:43:30', 2),
(398, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:43:37', 2),
(399, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:43:40', 2),
(400, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:44:41', 2),
(401, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:44:44', 2),
(402, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:45:50', 2),
(403, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:45:58', 2),
(404, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:46:57', 2),
(405, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:49:39', 2),
(406, 'Detail Transaksi 08032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:49:42', 2),
(407, 'Detail Transaksi 08032020123T0002 berhasil ditambahkan', '2020-03-08 10:49:51', 2),
(408, 'Pengguna andre975 berhasil logout', '2020-03-08 10:50:16', 2),
(409, 'Pengguna rian43 berhasil login', '2020-03-08 10:50:28', 6),
(410, 'Transaksi 08032020264T0002 berhasil ditambahkan', '2020-03-08 10:50:43', 6),
(411, 'Detail Transaksi 08032020264T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 10:50:46', 6),
(412, 'Detail Transaksi 08032020264T0002 berhasil ditambahkan', '2020-03-08 10:51:00', 6),
(413, 'Pembayaran Transaksi 08032020264T0002 berhasil', '2020-03-08 10:51:12', 6),
(414, 'Cetak Invoice - 08032020264T0002 - Namira Nindya Fitri', '2020-03-08 10:51:16', 6),
(415, 'Transaksi 08032020264T0002 berhasil diubah', '2020-03-08 10:52:02', 6),
(416, 'Pengguna rian43 berhasil logout', '2020-03-08 10:52:11', 6),
(417, 'Pengguna rian43 berhasil login', '2020-03-08 10:56:34', 6),
(418, 'Transaksi 08032020264T0002 berhasil diubah', '2020-03-08 10:56:51', 6),
(419, 'Transaksi 08032020266T0003 berhasil ditambahkan', '2020-03-08 10:57:05', 6),
(420, 'Detail Transaksi 08032020266T0003 berhasil ditambahkan', '2020-03-08 10:57:10', 6),
(421, 'Transaksi 08032020266T0003 berhasil diubah', '2020-03-08 10:57:32', 6),
(422, 'Pembayaran Transaksi 08032020266T0003 berhasil', '2020-03-08 10:57:38', 6),
(423, 'Cetak Invoice - 08032020266T0003 - Arum Diah Ariyanti', '2020-03-08 10:57:42', 6),
(424, 'Transaksi 08032020263T0004 berhasil ditambahkan', '2020-03-08 10:58:05', 6),
(425, 'Detail Transaksi 08032020263T0004 berhasil ditambahkan', '2020-03-08 10:58:20', 6),
(426, 'Transaksi  berhasil diubah statusnya', '2020-03-08 11:00:03', 6),
(427, 'Transaksi 08032020263T0004 berhasil diubah', '2020-03-08 11:02:47', 6),
(428, 'Pembayaran Transaksi 08032020263T0004 berhasil', '2020-03-08 11:04:23', 6),
(429, 'Cetak Invoice - 08032020263T0004 - Bintang Shakila Akassah', '2020-03-08 11:04:26', 6),
(430, 'Cetak Invoice - 08032020263T0004 - Bintang Shakila Akassah', '2020-03-08 11:04:32', 6),
(431, 'Transaksi 08032020262T0004 berhasil ditambahkan', '2020-03-08 11:04:55', 6),
(432, 'Detail Transaksi 08032020262T0004 gagal ditambahkan! isi minimal 1 paket', '2020-03-08 11:04:58', 6),
(433, 'Detail Transaksi 08032020262T0004 berhasil ditambahkan', '2020-03-08 11:05:04', 6),
(434, 'Transaksi 08032020262T0004 berhasil ditambahkan', '2020-03-08 11:07:04', 6),
(435, 'Detail Transaksi 08032020262T0004 berhasil ditambahkan', '2020-03-08 11:07:09', 6),
(436, 'Transaksi 08032020262T0005 berhasil ditambahkan', '2020-03-08 11:17:55', 6),
(437, 'Detail Transaksi 08032020262T0005 berhasil ditambahkan', '2020-03-08 11:18:06', 6),
(438, 'Transaksi 08032020261T0001 berhasil ditambahkan', '2020-03-08 11:19:04', 6),
(439, 'Detail Transaksi 08032020261T0001 berhasil ditambahkan', '2020-03-08 11:19:26', 6),
(440, 'Pembayaran Transaksi 08032020261T0001 berhasil', '2020-03-08 11:19:39', 6),
(441, 'Cetak Invoice - 08032020261T0001 - Nazira Apriliani', '2020-03-08 11:19:42', 6),
(442, 'Cetak Invoice - 08032020261T0001 - Nazira Apriliani', '2020-03-08 11:23:30', 6),
(443, 'Transaksi  berhasil diubah status transaksinya', '2020-03-08 11:24:24', 6),
(444, 'Transaksi  berhasil diubah status transaksinya', '2020-03-08 11:24:28', 6),
(445, 'Transaksi 08032020265T0002 berhasil ditambahkan', '2020-03-08 11:24:44', 6),
(446, 'Detail Transaksi 08032020265T0002 berhasil ditambahkan', '2020-03-08 11:24:52', 6),
(447, 'Pengguna andre975 berhasil login', '2020-03-08 15:33:23', 2),
(448, 'Transaksi 08032020125T0003 berhasil ditambahkan', '2020-03-08 15:34:02', 2),
(449, 'Detail Transaksi 08032020125T0003 berhasil ditambahkan', '2020-03-08 15:34:39', 2),
(450, 'Cetak Invoice - 08032020125T0003 - Yos Hermawan', '2020-03-08 15:37:48', 2),
(451, 'Pembayaran Transaksi 08032020125T0003 berhasil', '2020-03-08 15:38:15', 2),
(452, 'Cetak Invoice - 08032020125T0003 - Yos Hermawan', '2020-03-08 15:38:25', 2),
(453, 'Pengguna rian43 berhasil login', '2020-03-08 15:39:43', 6),
(454, 'Transaksi 08032020264T0004 berhasil ditambahkan', '2020-03-08 15:40:05', 6),
(455, 'Detail Transaksi 08032020264T0004 berhasil ditambahkan', '2020-03-08 15:40:12', 6),
(456, 'Pembayaran Transaksi 08032020264T0004 berhasil', '2020-03-08 15:40:20', 6),
(457, 'Cetak Invoice - 08032020264T0004 - Namira Nindya Fitri', '2020-03-08 15:40:23', 6),
(458, 'Pembayaran Transaksi 08032020265T0002 berhasil', '2020-03-08 15:40:47', 6),
(459, 'Cetak Invoice - 08032020265T0002 - Yos Hermawan', '2020-03-08 15:40:50', 6),
(460, 'Pengguna andre975 berhasil login', '2020-03-08 16:38:32', 2),
(461, 'Pengguna andre975 berhasil logout', '2020-03-08 16:38:48', 2),
(462, 'Pengguna andre975 berhasil login', '2020-03-08 16:39:25', 2),
(463, 'Transaksi 08032020125T0003 berhasil diubah', '2020-03-08 16:40:07', 2),
(464, 'Pembayaran Transaksi 08032020125T0003 berhasil', '2020-03-08 16:40:11', 2),
(465, 'Cetak Invoice - 08032020125T0003 - Yos Hermawan', '2020-03-08 16:40:16', 2),
(466, 'Transaksi 08032020125T0005 berhasil ditambahkan', '2020-03-08 16:40:52', 2),
(467, 'Detail Transaksi 08032020125T0005 berhasil ditambahkan', '2020-03-08 16:40:57', 2),
(468, 'Transaksi 08032020125T0005 berhasil diubah', '2020-03-08 16:44:45', 2),
(469, 'Pembayaran Transaksi 08032020125T0005 berhasil', '2020-03-08 16:46:54', 2),
(470, 'Cetak Invoice - 08032020125T0005 - Yos Hermawan', '2020-03-08 16:46:56', 2),
(471, 'Transaksi 08032020123T0006 berhasil ditambahkan', '2020-03-08 16:47:19', 2),
(472, 'Detail Transaksi 08032020123T0006 berhasil ditambahkan', '2020-03-08 16:48:27', 2),
(473, 'Pembayaran Transaksi 08032020123T0006 berhasil', '2020-03-08 16:48:47', 2),
(474, 'Cetak Invoice - 08032020123T0006 - Bintang Shakila Akassah', '2020-03-08 16:48:51', 2),
(475, 'Cetak Invoice - 08032020123T0006 - Bintang Shakila Akassah', '2020-03-08 16:50:20', 2),
(476, 'Pengguna andre975 berhasil login', '2020-03-09 08:22:11', 2),
(477, 'Transaksi 09032020123T0001 berhasil ditambahkan', '2020-03-09 08:24:24', 2),
(478, 'Detail Transaksi 09032020123T0001 berhasil ditambahkan', '2020-03-09 08:24:32', 2),
(479, 'Transaksi 09032020123T0001 berhasil diubah', '2020-03-09 08:24:53', 2),
(480, 'Pembayaran Transaksi 09032020123T0001 berhasil', '2020-03-09 08:24:57', 2),
(481, 'Cetak Invoice - 09032020123T0001 - Bintang Shakila Akassah', '2020-03-09 08:25:00', 2),
(482, 'Pembayaran Transaksi 08032020123T0006 berhasil', '2020-03-09 08:27:36', 2),
(483, 'Cetak Invoice - 08032020123T0006 - Bintang Shakila Akassah', '2020-03-09 08:27:39', 2),
(484, 'Transaksi 09032020122T0002 berhasil ditambahkan', '2020-03-09 08:28:05', 2),
(485, 'Detail Transaksi 09032020122T0002 berhasil ditambahkan', '2020-03-09 08:28:13', 2),
(486, 'Transaksi 09032020122T0002 berhasil diubah', '2020-03-09 08:28:31', 2),
(487, 'Pembayaran Transaksi 09032020122T0002 berhasil', '2020-03-09 08:28:35', 2),
(488, 'Cetak Invoice - 09032020122T0002 - Muhammad Fikri', '2020-03-09 08:28:38', 2),
(489, 'Transaksi 09032020123T0003 berhasil ditambahkan', '2020-03-09 08:32:06', 2),
(490, 'Detail Transaksi 09032020123T0003 berhasil ditambahkan', '2020-03-09 08:32:13', 2),
(491, 'Pembayaran Transaksi 09032020123T0003 berhasil', '2020-03-09 08:32:32', 2),
(492, 'Cetak Invoice - 09032020123T0003 - Bintang Shakila Akassah', '2020-03-09 08:32:35', 2),
(493, 'Cetak Invoice - 09032020123T0003 - Bintang Shakila Akassah', '2020-03-09 08:33:29', 2),
(494, 'Transaksi 09032020121T0004 berhasil ditambahkan', '2020-03-09 08:34:05', 2),
(495, 'Detail Transaksi 09032020121T0004 berhasil ditambahkan', '2020-03-09 08:34:16', 2),
(496, 'Pembayaran Transaksi 09032020121T0004 berhasil', '2020-03-09 08:34:48', 2),
(497, 'Cetak Invoice - 09032020121T0004 - Nazira Apriliani', '2020-03-09 08:34:50', 2),
(498, 'Transaksi 09032020123T0005 berhasil ditambahkan', '2020-03-09 08:35:09', 2),
(499, 'Detail Transaksi 09032020123T0005 berhasil ditambahkan', '2020-03-09 08:35:28', 2),
(500, 'Pembayaran Transaksi 09032020123T0005 berhasil', '2020-03-09 08:35:34', 2),
(501, 'Cetak Invoice - 09032020123T0005 - Bintang Shakila Akassah', '2020-03-09 08:35:39', 2),
(502, 'Transaksi 09032020126T0006 berhasil ditambahkan', '2020-03-09 08:36:04', 2),
(503, 'Detail Transaksi 09032020126T0006 berhasil ditambahkan', '2020-03-09 08:36:13', 2),
(504, 'Transaksi 09032020126T0006 berhasil diubah', '2020-03-09 08:36:23', 2),
(505, 'Pembayaran Transaksi 09032020126T0006 berhasil', '2020-03-09 08:36:26', 2),
(506, 'Cetak Invoice - 09032020126T0006 - Arum Diah Ariyanti', '2020-03-09 08:36:29', 2),
(507, 'Detail Transaksi 09032020126T0006 berhasil ditambahkan', '2020-03-09 10:46:30', 2),
(508, 'Transaksi 09032020126T0001 berhasil ditambahkan', '2020-03-09 11:32:20', 2),
(509, 'Detail Transaksi 09032020126T0001 berhasil ditambahkan', '2020-03-09 11:32:26', 2),
(510, 'Pembayaran Transaksi 09032020126T0001 berhasil', '2020-03-09 11:33:04', 2),
(511, 'Cetak Invoice - 09032020126T0001 - Arum Diah Ariyanti', '2020-03-09 11:33:13', 2),
(512, 'Cetak Invoice - 09032020126T0001 - Arum Diah Ariyanti', '2020-03-09 11:34:09', 2),
(513, 'Cetak Invoice - 09032020126T0001 - Arum Diah Ariyanti', '2020-03-09 11:34:48', 2),
(514, 'Transaksi 09032020123T0002 berhasil ditambahkan', '2020-03-09 11:35:33', 2),
(515, 'Detail Transaksi 09032020123T0002 berhasil ditambahkan', '2020-03-09 11:35:40', 2),
(516, 'Pembayaran Transaksi 09032020123T0002 berhasil', '2020-03-09 11:35:59', 2),
(517, 'Cetak Invoice - 09032020123T0002 - Bintang Shakila Akassah', '2020-03-09 11:36:03', 2),
(518, 'Transaksi 09032020122T0003 berhasil ditambahkan', '2020-03-09 11:36:42', 2),
(519, 'Detail Transaksi 09032020122T0003 berhasil ditambahkan', '2020-03-09 11:36:49', 2),
(520, 'Pembayaran Transaksi 09032020122T0003 berhasil', '2020-03-09 11:37:07', 2),
(521, 'Cetak Invoice - 09032020122T0003 - Muhammad Fikri', '2020-03-09 11:37:11', 2),
(522, 'Transaksi 09032020125T0004 berhasil ditambahkan', '2020-03-09 11:37:37', 2),
(523, 'Detail Transaksi 09032020125T0004 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 11:37:42', 2),
(524, 'Detail Transaksi 09032020125T0004 berhasil ditambahkan', '2020-03-09 11:37:49', 2),
(525, 'Transaksi 09032020125T0004 berhasil diubah', '2020-03-09 11:38:24', 2),
(526, 'Pembayaran Transaksi 09032020125T0004 berhasil', '2020-03-09 11:38:29', 2),
(527, 'Cetak Invoice - 09032020125T0004 - Yos Hermawan', '2020-03-09 11:38:32', 2),
(528, 'Transaksi 09032020123T0005 berhasil ditambahkan', '2020-03-09 11:38:46', 2),
(529, 'Detail Transaksi 09032020123T0005 berhasil ditambahkan', '2020-03-09 11:39:13', 2),
(530, 'Cetak Invoice - 09032020123T0005 - Bintang Shakila Akassah', '2020-03-09 11:39:22', 2),
(531, 'Pengguna andre975 berhasil logout', '2020-03-09 12:42:29', 2),
(532, 'Pengguna andre975 berhasil login', '2020-03-09 12:42:42', 2),
(533, 'Transaksi 09032020123T0006 berhasil ditambahkan', '2020-03-09 13:01:52', 2),
(534, 'Detail Transaksi 09032020123T0006 berhasil ditambahkan', '2020-03-09 13:03:42', 2),
(535, 'Pembayaran Transaksi 09032020123T0006 berhasil', '2020-03-09 13:03:49', 2),
(536, 'Cetak Invoice - 09032020123T0006 - Bintang Shakila Akassah', '2020-03-09 13:03:56', 2),
(537, 'Transaksi 09032020125T0007 berhasil ditambahkan', '2020-03-09 13:44:39', 2),
(538, 'Pengguna andre975 berhasil logout', '2020-03-09 13:52:03', 2),
(539, 'Pengguna andre975 berhasil login', '2020-03-09 13:52:11', 2),
(540, 'Transaksi 09032020125T0008 berhasil ditambahkan', '2020-03-09 14:03:56', 2),
(541, 'Detail Transaksi 09032020125T0008 berhasil ditambahkan', '2020-03-09 14:06:30', 2),
(542, 'Pembayaran Transaksi 09032020125T0008 berhasil', '2020-03-09 14:06:42', 2),
(543, 'Cetak Invoice - 09032020125T0008 - Yos Hermawan', '2020-03-09 14:06:46', 2),
(544, 'Transaksi 09032020126T0001 berhasil ditambahkan', '2020-03-09 14:07:31', 2),
(545, 'Detail Transaksi 09032020126T0001 berhasil ditambahkan', '2020-03-09 14:07:38', 2),
(546, 'Transaksi 09032020126T0001 berhasil ditambahkan', '2020-03-09 14:08:19', 2),
(547, 'Detail Transaksi 09032020126T0001 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 14:08:22', 2),
(548, 'Detail Transaksi 09032020126T0001 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 14:09:10', 2),
(549, 'Detail Transaksi 09032020126T0001 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 14:09:26', 2),
(550, 'Detail Transaksi 09032020126T0001 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 14:09:36', 2),
(551, 'Transaksi 09032020126T0001 berhasil dihapus', '2020-03-09 14:09:45', 2),
(552, 'Pengguna andre975 berhasil logout', '2020-03-09 14:11:59', 2),
(553, 'Pengguna andre975 berhasil login', '2020-03-09 14:12:06', 2),
(554, 'Transaksi 09032020126T0001 berhasil ditambahkan', '2020-03-09 14:12:45', 2),
(555, 'Detail Transaksi 09032020126T0001 berhasil ditambahkan', '2020-03-09 14:14:38', 2),
(556, 'Pembayaran Transaksi 09032020126T0001 berhasil', '2020-03-09 14:14:47', 2),
(557, 'Cetak Invoice - 09032020126T0001 - Arum Diah Ariyanti', '2020-03-09 14:14:49', 2),
(558, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 14:14:58', 2),
(559, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 14:15:01', 2),
(560, 'Transaksi 09032020123T0002 berhasil ditambahkan', '2020-03-09 14:15:13', 2),
(561, 'Detail Transaksi 09032020123T0002 berhasil ditambahkan', '2020-03-09 14:15:18', 2),
(562, 'Transaksi 09032020124T0003 berhasil ditambahkan', '2020-03-09 14:16:03', 2),
(563, 'Detail Transaksi 09032020124T0003 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 14:16:07', 2),
(564, 'Detail Transaksi 09032020124T0003 berhasil ditambahkan', '2020-03-09 14:16:12', 2),
(565, 'Cetak Invoice - 09032020126T0001 - Arum Diah Ariyanti', '2020-03-09 14:25:14', 2),
(566, 'Transaksi 09032020126T0001 berhasil ditambahkan', '2020-03-09 14:25:59', 2),
(567, 'Detail Transaksi 09032020126T0001 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 14:26:02', 2),
(568, 'Detail Transaksi 09032020126T0001 berhasil ditambahkan', '2020-03-09 14:26:09', 2),
(569, 'Pembayaran Transaksi 09032020126T0001 berhasil', '2020-03-09 14:26:14', 2),
(570, 'Cetak Invoice - 09032020126T0001 - Arum Diah Ariyanti', '2020-03-09 14:26:17', 2),
(571, 'Transaksi 09032020123T0002 berhasil ditambahkan', '2020-03-09 14:26:38', 2),
(572, 'Detail Transaksi 09032020123T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 14:26:41', 2),
(573, 'Transaksi 09032020123T0002 berhasil dihapus', '2020-03-09 14:26:46', 2),
(574, 'Transaksi 09032020123T0002 berhasil ditambahkan', '2020-03-09 14:26:52', 2),
(575, 'Detail Transaksi 09032020123T0002 berhasil ditambahkan', '2020-03-09 14:27:00', 2),
(576, 'Transaksi 09032020122T0003 berhasil ditambahkan', '2020-03-09 14:34:13', 2),
(577, 'Detail Transaksi 09032020122T0003 berhasil ditambahkan', '2020-03-09 14:34:18', 2),
(578, 'Pembayaran Transaksi 09032020122T0003 berhasil', '2020-03-09 14:34:29', 2),
(579, 'Cetak Invoice - 09032020122T0003 - Muhammad Fikri', '2020-03-09 14:34:31', 2),
(580, 'Transaksi 09032020123T0002 berhasil diubah', '2020-03-09 14:34:47', 2),
(581, 'Pembayaran Transaksi 09032020123T0002 berhasil', '2020-03-09 14:34:50', 2),
(582, 'Cetak Invoice - 09032020123T0002 - Bintang Shakila Akassah', '2020-03-09 14:34:53', 2),
(583, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 14:35:02', 2),
(584, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 14:35:06', 2),
(585, 'Cetak Invoice - 09032020123T0002 - Bintang Shakila Akassah', '2020-03-09 14:36:01', 2),
(586, 'Transaksi 09032020126T0004 berhasil ditambahkan', '2020-03-09 14:36:32', 2),
(587, 'Detail Transaksi 09032020126T0004 berhasil ditambahkan', '2020-03-09 14:36:39', 2),
(588, 'Pembayaran Transaksi 09032020126T0004 berhasil', '2020-03-09 14:36:42', 2),
(589, 'Cetak Invoice - 09032020126T0004 - Arum Diah Ariyanti', '2020-03-09 14:36:44', 2),
(590, 'Transaksi 09032020125T0005 berhasil ditambahkan', '2020-03-09 14:37:10', 2),
(591, 'Detail Transaksi 09032020125T0005 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 14:37:12', 2),
(592, 'Transaksi 09032020125T0005 berhasil dihapus', '2020-03-09 14:37:15', 2),
(593, 'Transaksi 09032020121T0005 berhasil ditambahkan', '2020-03-09 14:37:54', 2),
(594, 'Detail Transaksi 09032020121T0005 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 14:38:05', 2),
(595, 'Detail Transaksi 09032020121T0005 berhasil ditambahkan', '2020-03-09 14:38:37', 2);
INSERT INTO `log` (`id_log`, `isi_log`, `tanggal_log`, `id_user`) VALUES
(596, 'Transaksi 09032020123T0006 berhasil ditambahkan', '2020-03-09 14:38:47', 2),
(597, 'Detail Transaksi 09032020123T0006 berhasil ditambahkan', '2020-03-09 14:38:56', 2),
(598, 'Transaksi 09032020122T0007 berhasil ditambahkan', '2020-03-09 14:51:02', 2),
(599, 'Detail Transaksi 09032020122T0007 berhasil ditambahkan', '2020-03-09 14:51:20', 2),
(600, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 16:11:48', 2),
(601, 'Transaksi 09032020124T0008 berhasil ditambahkan', '2020-03-09 16:14:10', 2),
(602, 'Detail Transaksi 09032020124T0008 gagal ditambahkan! isi minimal 1 paket', '2020-03-09 16:14:13', 2),
(603, 'Detail Transaksi 09032020124T0008 berhasil ditambahkan', '2020-03-09 16:14:21', 2),
(604, 'Pembayaran Transaksi 09032020124T0008 berhasil', '2020-03-09 16:14:25', 2),
(605, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:14:28', 2),
(606, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:15:53', 2),
(607, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:16:28', 2),
(608, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:16:54', 2),
(609, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:18:24', 2),
(610, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:18:36', 2),
(611, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:19:10', 2),
(612, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:20:10', 2),
(613, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:20:22', 2),
(614, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:21:01', 2),
(615, 'Cetak Invoice - 09032020124T0008 - Namira Nindya Fitri', '2020-03-09 16:21:14', 2),
(616, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 16:22:02', 2),
(617, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 16:22:05', 2),
(618, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 16:22:09', 2),
(619, 'Pembayaran Transaksi 09032020122T0007 berhasil', '2020-03-09 16:22:24', 2),
(620, 'Cetak Invoice - 09032020122T0007 - Muhammad Fikri', '2020-03-09 16:22:27', 2),
(621, 'Cetak Invoice - 09032020122T0007 - Muhammad Fikri', '2020-03-09 16:25:10', 2),
(622, 'Pengguna andre975 berhasil logout', '2020-03-09 17:47:31', 2),
(623, 'Pengguna super_administrator berhasil login', '2020-03-09 17:47:38', 1),
(624, 'Pengguna super_administrator berhasil logout', '2020-03-09 17:47:46', 1),
(625, 'Pengguna rian43 berhasil login', '2020-03-09 17:47:59', 6),
(626, 'Member Jasmine Aulia Syahrami berhasil ditambahkan', '2020-03-09 17:49:36', 6),
(627, 'Member Febby Anggraeni berhasil ditambahkan', '2020-03-09 17:50:42', 6),
(628, 'Member Edwan Syawal berhasil ditambahkan', '2020-03-09 17:51:58', 6),
(629, 'Member Tyo Hafiad Noerman berhasil ditambahkan', '2020-03-09 17:52:53', 6),
(630, 'Member Roro Dana Iswara Aditya Bakti berhasil ditambahkan', '2020-03-09 17:55:11', 6),
(631, 'Transaksi 09032020268T0009 berhasil ditambahkan', '2020-03-09 17:55:33', 6),
(632, 'Detail Transaksi 09032020268T0009 berhasil ditambahkan', '2020-03-09 17:55:39', 6),
(633, 'Transaksi 090320202611T0010 berhasil ditambahkan', '2020-03-09 17:56:11', 6),
(634, 'Detail Transaksi 090320202611T0010 berhasil ditambahkan', '2020-03-09 17:56:26', 6),
(635, 'Pembayaran Transaksi 090320202611T0010 berhasil', '2020-03-09 17:56:32', 6),
(636, 'Cetak Invoice - 090320202611T0010 - Roro Dana Iswara Aditya Bakti', '2020-03-09 17:56:36', 6),
(637, 'Cetak Invoice - 090320202611T0010 - Roro Dana Iswara Aditya Bakti', '2020-03-09 17:56:46', 6),
(638, 'Print profile', '2020-03-09 17:57:15', 6),
(639, 'Print profile', '2020-03-09 17:57:20', 6),
(640, 'Print profile', '2020-03-09 17:57:24', 6),
(641, 'Print profile', '2020-03-09 17:57:28', 6),
(642, 'Biodata Pengguna rian43 berhasil diubah', '2020-03-09 17:57:44', 6),
(643, 'Biodata Pengguna rian43 berhasil diubah', '2020-03-09 17:57:56', 6),
(644, 'Biodata Pengguna rian43 berhasil diubah', '2020-03-09 17:58:04', 6),
(645, 'Print profile', '2020-03-09 17:58:10', 6),
(646, 'Biodata Pengguna rian43 berhasil diubah', '2020-03-09 17:59:31', 6),
(647, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 17:59:57', 6),
(648, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 18:00:00', 6),
(649, 'Pengguna rian43 berhasil logout', '2020-03-09 18:00:33', 6),
(650, 'Pengguna super_administrator berhasil login', '2020-03-09 18:00:41', 1),
(651, 'Member Shelina berhasil ditambahkan', '2020-03-09 18:01:52', 1),
(652, 'Transaksi 090320201112T0011 berhasil ditambahkan', '2020-03-09 18:07:48', 1),
(653, 'Pengguna super_administrator berhasil logout', '2020-03-09 18:08:04', 1),
(654, 'Pengguna super_administrator berhasil login', '2020-03-09 18:08:56', 1),
(655, 'Transaksi 090320201112T0011 berhasil dihapus', '2020-03-09 18:09:29', 1),
(656, 'Transaksi 090320201112T0011 berhasil ditambahkan', '2020-03-09 18:11:05', 1),
(657, 'Detail Transaksi 090320201112T0011 berhasil ditambahkan', '2020-03-09 18:13:03', 1),
(658, 'Pembayaran Transaksi 090320201112T0011 berhasil', '2020-03-09 18:13:10', 1),
(659, 'Cetak Invoice - 090320201112T0011 - Shelina', '2020-03-09 18:13:12', 1),
(660, 'Transaksi 09032020114T0012 berhasil ditambahkan', '2020-03-09 18:14:23', 1),
(661, 'Detail Transaksi 09032020114T0012 berhasil ditambahkan', '2020-03-09 18:14:30', 1),
(662, 'Pembayaran Transaksi 09032020114T0012 berhasil', '2020-03-09 18:14:34', 1),
(663, 'Cetak Invoice - 09032020114T0012 - Namira Nindya Fitri', '2020-03-09 18:14:36', 1),
(664, 'Pembayaran Transaksi 09032020268T0009 berhasil', '2020-03-09 18:14:58', 1),
(665, 'Cetak Invoice - 09032020268T0009 - Febby Anggraeni', '2020-03-09 18:15:00', 1),
(666, 'Transaksi  berhasil diubah status transaksinya', '2020-03-09 18:15:12', 1),
(667, 'Paket Kiloan Raja Laut berhasil ditambahkan', '2020-03-09 18:16:03', 1),
(668, 'Pengguna super_administrator berhasil logout', '2020-03-09 18:20:26', 1),
(669, 'Pengguna rian43 berhasil login', '2020-03-09 18:20:33', 6),
(670, 'Pengguna rian43 berhasil logout', '2020-03-09 18:21:01', 6),
(671, 'Pengguna andre975 berhasil login', '2020-03-09 18:21:07', 2),
(672, 'Pengguna andre975 berhasil logout', '2020-03-09 18:21:28', 2),
(673, 'Pengguna super_administrator berhasil login', '2020-03-09 18:21:35', 1),
(674, 'Pengguna gita32 berhasil ditambahkan', '2020-03-09 18:22:21', 1),
(675, 'Biodata Pengguna GITA AGUSTIN berhasil ditambahkan', '2020-03-09 18:23:28', 1),
(676, 'Pengguna super_administrator berhasil logout', '2020-03-09 18:23:44', 1),
(677, 'Pengguna gita32 berhasil login', '2020-03-09 18:23:48', 8),
(678, 'Pengguna gita32 berhasil logout', '2020-03-09 18:28:35', 8),
(679, 'Pengguna super_administrator berhasil login', '2020-03-09 18:28:59', 1),
(680, 'Transaksi 09032020119T0013 berhasil ditambahkan', '2020-03-09 18:31:42', 1),
(681, 'Detail Transaksi 09032020119T0013 berhasil ditambahkan', '2020-03-09 18:32:07', 1),
(682, 'Pembayaran Transaksi 09032020119T0013 berhasil', '2020-03-09 18:32:11', 1),
(683, 'Cetak Invoice - 09032020119T0013 - Edwan Syawal', '2020-03-09 18:32:14', 1),
(684, 'Transaksi 09032020117T0014 berhasil ditambahkan', '2020-03-09 18:32:33', 1),
(685, 'Detail Transaksi 09032020117T0014 berhasil ditambahkan', '2020-03-09 18:32:39', 1),
(686, 'Transaksi 09032020117T0014 berhasil diubah', '2020-03-09 18:33:19', 1),
(687, 'Pembayaran Transaksi 09032020117T0014 berhasil', '2020-03-09 18:33:23', 1),
(688, 'Cetak Invoice - 09032020117T0014 - Jasmine Aulia Syahrami', '2020-03-09 18:33:25', 1),
(689, 'Cetak Invoice - 09032020117T0014 - Jasmine Aulia Syahrami', '2020-03-09 18:33:39', 1),
(690, 'Pengguna super_administrator berhasil logout', '2020-03-09 18:34:58', 1),
(691, 'Pengguna andre975 berhasil login', '2020-03-10 08:47:58', 2),
(692, 'Transaksi 09032020117T0014 berhasil diubah', '2020-03-10 08:49:53', 2),
(693, 'Transaksi 09032020117T0014 berhasil diubah', '2020-03-10 08:50:03', 2),
(694, 'Member Muhammad Irgi Al Ghitraf berhasil ditambahkan', '2020-03-10 08:55:20', 2),
(695, 'Transaksi 100320201213T0001 berhasil ditambahkan', '2020-03-10 08:56:12', 2),
(696, 'Detail Transaksi 100320201213T0001 berhasil ditambahkan', '2020-03-10 08:56:44', 2),
(697, 'Transaksi  berhasil diubah status transaksinya', '2020-03-10 09:01:22', 2),
(698, 'Pembayaran Transaksi 100320201213T0001 gagal! uang yang dibayar kurang dari total harga', '2020-03-10 09:01:35', 2),
(699, 'Pembayaran Transaksi 100320201213T0001 gagal! uang yang dibayar kurang dari total harga', '2020-03-10 09:02:37', 2),
(700, 'Pembayaran Transaksi 100320201213T0001 gagal! uang yang dibayar kurang dari total harga', '2020-03-10 09:02:42', 2),
(701, 'Pembayaran Transaksi 100320201213T0001 berhasil', '2020-03-10 09:02:49', 2),
(702, 'Cetak Invoice - 100320201213T0001 - Muhammad Irgi Al Ghitraf', '2020-03-10 09:02:52', 2),
(703, 'Transaksi 10032020127T0002 berhasil ditambahkan', '2020-03-10 09:03:06', 2),
(704, 'Detail Transaksi 10032020127T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-10 09:03:11', 2),
(705, 'Transaksi 10032020127T0002 berhasil dihapus', '2020-03-10 09:03:17', 2),
(706, 'Pengguna andre975 berhasil login', '2020-03-10 12:50:38', 2),
(707, 'Pengguna andre975 berhasil login', '2020-03-10 19:21:25', 2),
(708, 'Pembayaran Transaksi 09032020123T0006 berhasil', '2020-03-10 19:55:33', 2),
(709, 'Cetak Invoice - 09032020123T0006 - Bintang Shakila Akassah', '2020-03-10 19:55:39', 2),
(710, 'Pengguna andre975 berhasil logout', '2020-03-10 19:57:03', 2),
(711, 'Pengguna super_administrator berhasil login', '2020-03-10 19:57:10', 1),
(712, 'Pengguna super_administrator berhasil logout', '2020-03-10 19:59:12', 1),
(713, 'Pengguna febyfeb09 berhasil login', '2020-03-10 19:59:16', 7),
(714, 'Print profile', '2020-03-10 21:15:39', 7),
(715, 'Pengguna febyfeb09 berhasil logout', '2020-03-10 21:16:32', 7),
(716, 'Pengguna febyfeb09 berhasil logout', '2020-03-10 21:16:32', 7),
(717, 'Pengguna andre975 berhasil login', '2020-03-10 21:37:18', 2),
(718, 'Pengguna andre975 berhasil login', '2020-03-11 10:16:02', 2),
(719, 'Transaksi 11032020127T0001 berhasil ditambahkan', '2020-03-11 10:16:28', 2),
(720, 'Detail Transaksi 11032020127T0001 berhasil ditambahkan', '2020-03-11 10:17:42', 2),
(721, 'Transaksi 11032020123T0002 berhasil ditambahkan', '2020-03-11 10:24:53', 2),
(722, 'Pengguna andre975 berhasil logout', '2020-03-11 10:25:00', 2),
(723, 'Pengguna andre975 berhasil login', '2020-03-11 10:25:07', 2),
(724, 'Transaksi 11032020125T0003 berhasil ditambahkan', '2020-03-11 10:29:22', 2),
(725, 'Pengguna andre975 berhasil logout', '2020-03-11 10:29:39', 2),
(726, 'Pengguna andre975 berhasil login', '2020-03-11 10:29:43', 2),
(727, 'Pengguna andre975 berhasil logout', '2020-03-11 10:34:30', 2),
(728, 'Pengguna andre975 berhasil login', '2020-03-11 10:34:36', 2),
(729, 'Pengguna andre975 berhasil logout', '2020-03-11 10:35:10', 2),
(730, 'Pengguna andre975 berhasil login', '2020-03-11 10:35:15', 2),
(731, 'Transaksi 11032020125T0003 berhasil dihapus', '2020-03-11 10:35:31', 2),
(732, 'Transaksi 11032020123T0002 berhasil dihapus', '2020-03-11 10:35:46', 2),
(733, 'Detail Transaksi 11032020127T0001 gagal ditambahkan! isi minimal 1 paket', '2020-03-11 10:38:10', 2),
(734, 'Transaksi 11032020127T0002 berhasil ditambahkan', '2020-03-11 10:59:07', 2),
(735, 'Detail Transaksi 11032020127T0002 berhasil ditambahkan', '2020-03-11 10:59:21', 2),
(736, 'Pengguna andre975 berhasil logout', '2020-03-11 10:59:37', 2),
(737, 'Pengguna andre975 berhasil login', '2020-03-11 10:59:44', 2),
(738, 'Member Rayhan Aditya Syahputra berhasil ditambahkan', '2020-03-11 11:01:25', 2),
(739, 'Transaksi 110320201214T0003 berhasil ditambahkan', '2020-03-11 11:01:50', 2),
(740, 'Detail Transaksi 110320201214T0003 berhasil ditambahkan', '2020-03-11 11:02:13', 2),
(741, 'Pengguna andre975 berhasil logout', '2020-03-11 11:07:26', 2),
(742, 'Pengguna rian43 berhasil login', '2020-03-11 11:07:39', 6),
(743, 'Transaksi 11032020261T0004 berhasil ditambahkan', '2020-03-11 11:09:07', 6),
(744, 'Detail Transaksi 11032020261T0004 berhasil ditambahkan', '2020-03-11 11:10:28', 6),
(745, 'Detail Transaksi  gagal ditambahkan! isi minimal 1 paket', '2020-03-11 11:23:13', 6),
(746, 'Detail Transaksi 11032020261T0004 gagal ditambahkan! isi minimal 1 paket', '2020-03-11 11:33:54', 6),
(747, 'Detail Transaksi 11032020261T0004 gagal ditambahkan! isi minimal 1 paket', '2020-03-11 11:36:50', 6),
(748, 'Detail Transaksi 11032020261T0004 berhasil dimanipulasi', '2020-03-11 11:38:03', 6),
(749, 'Detail Transaksi 11032020261T0004 berhasil dimanipulasi', '2020-03-11 11:38:26', 6),
(750, 'Detail Transaksi 11032020261T0004 berhasil dimanipulasi', '2020-03-11 11:38:51', 6),
(751, 'Pengguna rian43 berhasil logout', '2020-03-11 11:39:50', 6),
(752, 'Pengguna indah76 berhasil login', '2020-03-11 11:40:03', 5),
(753, 'Transaksi 11032020261T0004 berhasil dihapus', '2020-03-11 11:40:17', 5),
(754, 'Pengguna indah76 berhasil logout', '2020-03-11 12:47:56', 5),
(755, 'Pengguna andre975 berhasil login', '2020-03-11 12:48:18', 2),
(756, 'Detail Transaksi 110320201214T0003 berhasil dimanipulasi', '2020-03-11 12:57:22', 2),
(757, 'Detail Transaksi 110320201214T0003 berhasil dimanipulasi', '2020-03-11 13:03:47', 2),
(758, 'Detail Transaksi 110320201214T0003 berhasil dimanipulasi', '2020-03-11 13:04:01', 2),
(759, 'Detail Transaksi 110320201214T0003 berhasil dimanipulasi', '2020-03-11 13:05:14', 2),
(760, 'Detail Transaksi 110320201214T0003 berhasil dimanipulasi', '2020-03-11 13:05:37', 2),
(761, 'Pengguna andre975 berhasil logout', '2020-03-11 13:08:28', 2),
(762, 'Pengguna andre975 berhasil login', '2020-03-11 13:08:52', 2),
(763, 'Pengguna andre975 berhasil logout', '2020-03-11 13:09:28', 2),
(764, 'Pengguna salsa321 berhasil login', '2020-03-11 13:09:33', 4),
(765, 'Pengguna salsa321 berhasil logout', '2020-03-11 13:25:10', 4),
(766, 'Pengguna andre975 berhasil login', '2020-03-11 13:25:14', 2),
(767, 'Transaksi 11032020123T0004 berhasil ditambahkan', '2020-03-11 13:25:25', 2),
(768, 'Detail Transaksi 11032020123T0004 berhasil ditambahkan', '2020-03-11 13:25:31', 2),
(769, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:32:51', 2),
(770, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:33:38', 2),
(771, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:34:22', 2),
(772, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:34:34', 2),
(773, 'Transaksi 11032020123T0005 berhasil ditambahkan', '2020-03-11 13:39:53', 2),
(774, 'Detail Transaksi 11032020123T0005 berhasil ditambahkan', '2020-03-11 13:41:15', 2),
(775, 'Pembayaran Transaksi 11032020123T0005 berhasil', '2020-03-11 13:41:23', 2),
(776, 'Cetak Invoice - 11032020123T0005 - Bintang Shakila Akassah', '2020-03-11 13:41:38', 2),
(777, 'Pembayaran Transaksi 11032020123T0004 berhasil', '2020-03-11 13:45:31', 2),
(778, 'Cetak Invoice - 11032020123T0004 - Bintang Shakila Akassah', '2020-03-11 13:45:34', 2),
(779, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:45:40', 2),
(780, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:45:45', 2),
(781, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:45:54', 2),
(782, 'Transaksi 110320201214T0003 berhasil dihapus', '2020-03-11 13:48:42', 2),
(783, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:49:19', 2),
(784, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:49:22', 2),
(785, 'Pembayaran Transaksi 11032020127T0002 berhasil', '2020-03-11 13:49:54', 2),
(786, 'Cetak Invoice - 11032020127T0002 - Jasmine Aulia Syahrami', '2020-03-11 13:49:57', 2),
(787, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:50:13', 2),
(788, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:50:27', 2),
(789, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:50:33', 2),
(790, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:52:14', 2),
(791, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:52:18', 2),
(792, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:52:23', 2),
(793, 'Cetak Invoice - 11032020123T0005 - Bintang Shakila Akassah', '2020-03-11 13:52:27', 2),
(794, 'Transaksi 110320201211T0006 berhasil ditambahkan', '2020-03-11 13:53:17', 2),
(795, 'Pengguna andre975 berhasil logout', '2020-03-11 13:53:28', 2),
(796, 'Pengguna andre975 berhasil login', '2020-03-11 13:53:35', 2),
(797, 'Detail Transaksi 110320201211T0006 berhasil ditambahkan', '2020-03-11 13:54:00', 2),
(798, 'Detail Transaksi 110320201211T0006 berhasil dimanipulasi', '2020-03-11 13:54:37', 2),
(799, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:57:28', 2),
(800, 'Transaksi  berhasil diubah status transaksinya', '2020-03-11 13:57:35', 2),
(801, 'Pengguna andre975 berhasil login', '2020-03-11 14:00:42', 2),
(802, 'Pengguna andre975 berhasil login', '2020-03-11 16:34:43', 2),
(803, 'Pengguna andre975 berhasil logout', '2020-03-11 16:35:07', 2),
(804, 'Pengguna rian43 berhasil login', '2020-03-11 16:35:12', 6),
(805, 'Pengguna rian43 berhasil logout', '2020-03-11 16:35:35', 6),
(806, 'Pengguna andre975 berhasil login', '2020-03-11 16:35:43', 2),
(807, 'Pengguna andre975 berhasil logout', '2020-03-11 16:53:52', 2),
(808, 'Pengguna rian43 berhasil login', '2020-03-11 16:53:59', 6),
(809, 'Pengguna rian43 berhasil logout', '2020-03-11 17:08:14', 6),
(810, 'Pengguna andre975 berhasil login', '2020-03-11 17:08:19', 2),
(811, 'Pengguna andre975 berhasil logout', '2020-03-11 17:09:58', 2),
(812, 'Pengguna rian43 berhasil login', '2020-03-11 17:10:03', 6),
(813, 'Transaksi 11032020263T0007 berhasil ditambahkan', '2020-03-11 17:10:46', 6),
(814, 'Detail Transaksi 11032020263T0007 berhasil ditambahkan', '2020-03-11 17:10:53', 6),
(815, 'Pembayaran Transaksi 11032020263T0007 berhasil', '2020-03-11 17:10:59', 6),
(816, 'Cetak Invoice - 11032020263T0007 - Bintang Shakila Akassah', '2020-03-11 17:11:03', 6),
(817, 'Pengguna rian43 berhasil logout', '2020-03-11 17:11:14', 6),
(818, 'Pengguna andre975 berhasil login', '2020-03-11 17:11:18', 2),
(819, 'Pengguna andre975 berhasil logout', '2020-03-11 17:16:38', 2),
(820, 'Pengguna rian43 berhasil login', '2020-03-11 17:16:43', 6),
(821, 'Pengguna rian43 berhasil logout', '2020-03-11 17:55:04', 6),
(822, 'Pengguna super_administrator berhasil login', '2020-03-11 17:55:10', 1),
(823, 'Pengguna super_administrator berhasil logout', '2020-03-11 17:56:26', 1),
(824, 'Pengguna andre975 berhasil login', '2020-03-11 17:56:31', 2),
(825, 'Pengguna andre975 berhasil logout', '2020-03-11 17:56:47', 2),
(826, 'Pengguna super_administrator berhasil login', '2020-03-11 17:56:54', 1),
(827, 'Pengguna andre975 berhasil login', '2020-03-12 08:17:13', 2),
(828, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 08:17:33', 2),
(829, 'Member Himdan Al Ghozan berhasil ditambahkan', '2020-03-12 08:32:02', 2),
(830, 'Transaksi 120320201215T0001 berhasil ditambahkan', '2020-03-12 08:43:13', 2),
(831, 'Pengguna andre975 berhasil logout', '2020-03-12 08:43:54', 2),
(832, 'Pengguna andre975 berhasil login', '2020-03-12 08:44:07', 2),
(833, 'Transaksi 120320201215T0001 berhasil dihapus', '2020-03-12 08:44:37', 2),
(834, 'Transaksi 120320201215T0001 berhasil ditambahkan', '2020-03-12 08:52:43', 2),
(835, 'Detail Transaksi 120320201215T0001 berhasil ditambahkan', '2020-03-12 08:53:00', 2),
(836, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 08:53:30', 2),
(837, 'Member Muhammad Faisal Achramsyah berhasil ditambahkan', '2020-03-12 09:03:59', 2),
(838, 'Transaksi 120320201216T0002 berhasil ditambahkan', '2020-03-12 09:04:42', 2),
(839, 'Detail Transaksi 120320201216T0002 berhasil ditambahkan', '2020-03-12 09:05:05', 2),
(840, 'Pembayaran Transaksi 120320201216T0002 gagal! uang yang dibayar kurang dari total harga', '2020-03-12 09:05:22', 2),
(841, 'Pembayaran Transaksi 120320201216T0002 berhasil', '2020-03-12 09:06:42', 2),
(842, 'Cetak Invoice - 120320201216T0002 - Muhammad Faisal Achramsyah', '2020-03-12 09:06:50', 2),
(843, 'Transaksi 120320201215T0001 berhasil diubah', '2020-03-12 09:07:53', 2),
(844, 'Detail Transaksi 120320201215T0001 berhasil dimanipulasi', '2020-03-12 09:08:31', 2),
(845, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 09:10:50', 2),
(846, 'Pengguna andre975 berhasil login', '2020-03-12 11:21:22', 2),
(847, 'Pengguna andre975 berhasil logout', '2020-03-12 11:35:27', 2),
(848, 'Pengguna super_administrator berhasil login', '2020-03-12 11:35:33', 1),
(849, 'Pengguna super_administrator berhasil logout', '2020-03-12 11:36:06', 1),
(850, 'Pengguna indah76 berhasil login', '2020-03-12 11:36:11', 5),
(851, 'Transaksi 12032020253T0003 berhasil ditambahkan', '2020-03-12 11:36:45', 5),
(852, 'Detail Transaksi 12032020253T0003 berhasil ditambahkan', '2020-03-12 11:37:26', 5),
(853, 'Detail Transaksi 12032020253T0003 berhasil dimanipulasi', '2020-03-12 11:37:51', 5),
(854, 'Detail Transaksi 12032020253T0003 gagal ditambahkan! isi minimal 1 paket', '2020-03-12 11:38:04', 5),
(855, 'Transaksi 120320202513T0004 berhasil ditambahkan', '2020-03-12 11:38:39', 5),
(856, 'Detail Transaksi 120320202513T0004 berhasil ditambahkan', '2020-03-12 11:38:53', 5),
(857, 'Pembayaran Transaksi 120320202513T0004 gagal! uang yang dibayar kurang dari total harga', '2020-03-12 11:39:03', 5),
(858, 'Pembayaran Transaksi 120320202513T0004 berhasil', '2020-03-12 11:39:13', 5),
(859, 'Cetak Invoice - 120320202513T0004 - Muhammad Irgi Al Ghitraf', '2020-03-12 11:39:18', 5),
(860, 'Cetak Invoice - 120320202513T0004 - Muhammad Irgi Al Ghitraf', '2020-03-12 11:39:43', 5),
(861, 'Detail Transaksi 12032020253T0003 berhasil dimanipulasi', '2020-03-12 11:40:49', 5),
(862, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 11:41:13', 5),
(863, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 11:49:44', 5),
(864, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 11:49:49', 5),
(865, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 11:49:52', 5),
(866, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 11:49:57', 5),
(867, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 11:50:00', 5),
(868, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 11:50:03', 5),
(869, 'Transaksi 120320202515T0005 berhasil ditambahkan', '2020-03-12 13:09:33', 5),
(870, 'Detail Transaksi 120320202515T0005 berhasil ditambahkan', '2020-03-12 13:10:26', 5),
(871, 'Pengguna indah76 berhasil logout', '2020-03-12 13:13:01', 5),
(872, 'Pengguna andre975 berhasil login', '2020-03-12 21:44:23', 2),
(873, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 21:49:42', 2),
(874, 'Pengguna andre975 berhasil logout', '2020-03-12 21:49:54', 2),
(875, 'Pengguna super_administrator berhasil login', '2020-03-12 21:50:03', 1),
(876, 'Transaksi  berhasil diubah status transaksinya', '2020-03-12 21:50:15', 1),
(877, 'Pengguna andre975 berhasil login', '2020-03-13 08:26:29', 2),
(878, 'Transaksi 130320201213T0001 berhasil ditambahkan', '2020-03-13 08:46:20', 2),
(879, 'Detail Transaksi 130320201213T0001 berhasil ditambahkan', '2020-03-13 08:46:33', 2),
(880, 'Pembayaran Transaksi 130320201213T0001 berhasil', '2020-03-13 08:46:39', 2),
(881, 'Cetak Invoice - 130320201213T0001 - Muhammad Irgi Al Ghitraf', '2020-03-13 08:46:42', 2),
(882, 'Transaksi  berhasil diubah status transaksinya', '2020-03-13 08:47:20', 2),
(883, 'Transaksi  berhasil diubah status transaksinya', '2020-03-13 08:47:24', 2),
(884, 'Transaksi  berhasil diubah status transaksinya', '2020-03-13 08:48:45', 2),
(885, 'Pengguna andre975 berhasil login', '2020-03-13 08:51:03', 2),
(886, 'Pengguna salsa321 berhasil login', '2020-03-14 11:17:36', 4),
(887, 'Pengguna salsa321 berhasil logout', '2020-03-14 12:09:14', 4),
(888, 'Pengguna indah76 berhasil login', '2020-03-14 12:09:27', 5),
(889, 'Transaksi 14032020253T0001 berhasil ditambahkan', '2020-03-14 12:09:50', 5),
(890, 'Detail Transaksi 14032020253T0001 berhasil ditambahkan', '2020-03-14 12:10:23', 5),
(891, 'Pembayaran Transaksi 14032020253T0001 berhasil', '2020-03-14 12:10:31', 5),
(892, 'Cetak Invoice - 14032020253T0001 - Bintang Shakila Akassah', '2020-03-14 12:10:34', 5),
(893, 'Transaksi  berhasil diubah status transaksinya', '2020-03-14 12:11:58', 5),
(894, 'Pengguna indah76 berhasil logout', '2020-03-14 12:12:17', 5),
(895, 'Pengguna super_administrator berhasil login', '2020-03-14 12:12:42', 1),
(896, 'Pengguna super_administrator berhasil logout', '2020-03-14 12:22:46', 1),
(897, 'Pengguna andre975 berhasil login', '2020-03-14 12:22:52', 2),
(898, 'Pengguna andre975 berhasil login', '2020-03-15 13:56:44', 2),
(899, 'Pengguna andre975 berhasil logout', '2020-03-15 13:56:56', 2),
(900, 'Pengguna irgi12 berhasil login', '2020-03-15 13:56:58', 3),
(901, 'Transaksi  berhasil diubah status transaksinya', '2020-03-15 13:57:03', 3),
(902, 'Pengguna irgi12 berhasil login', '2020-03-15 14:04:35', 3),
(903, 'Pembayaran Transaksi 120320201215T0001 berhasil', '2020-03-15 14:18:01', 3),
(904, 'Cetak Invoice - 120320201215T0001 - Himdan Al Ghozan', '2020-03-15 14:18:08', 3),
(905, 'Cetak Invoice - 120320201215T0001 - Himdan Al Ghozan', '2020-03-15 14:18:41', 3),
(906, 'Cetak Invoice - 130320201213T0001 - Muhammad Irgi Al Ghitraf', '2020-03-15 14:19:06', 3),
(907, 'Pengguna andre975 berhasil login', '2020-03-15 14:39:24', 2),
(908, 'Pengguna andre975 berhasil login', '2020-03-15 14:45:59', 2),
(909, 'Pengguna andre975 berhasil login', '2020-03-15 14:59:59', 2),
(910, 'Pengguna andre975 berhasil login', '2020-03-15 15:00:36', 2),
(911, 'Cetak Invoice - 130320201213T0001 - Muhammad Irgi Al Ghitraf', '2020-03-15 15:10:31', 2),
(912, 'Cetak Invoice - 130320201213T0001 - Muhammad Irgi Al Ghitraf', '2020-03-15 15:11:15', 2),
(913, 'Cetak Laporan - 2020-03-01 - 2020-03-15', '2020-03-15 15:19:55', 2),
(914, 'Pengguna andre975 berhasil login', '2020-03-16 08:33:16', 2),
(915, 'Member Putri Larasati berhasil ditambahkan', '2020-03-16 08:40:24', 2),
(916, 'Transaksi 160320201217T0001 berhasil ditambahkan', '2020-03-16 08:40:46', 2),
(917, 'Detail Transaksi 160320201217T0001 berhasil ditambahkan', '2020-03-16 08:40:58', 2),
(918, 'Pembayaran Transaksi 160320201217T0001 berhasil', '2020-03-16 08:41:03', 2),
(919, 'Pengguna andre975 berhasil logout', '2020-03-16 09:20:26', 2),
(920, 'Pengguna super_administrator berhasil login', '2020-03-16 09:20:34', 1),
(921, 'Transaksi  berhasil diubah status transaksinya', '2020-03-16 09:23:00', 1),
(922, 'Pengguna super_administrator berhasil logout', '2020-03-16 09:23:31', 1),
(923, 'Pengguna andre975 berhasil login', '2020-03-16 09:23:36', 2),
(924, 'Pengguna andre975 berhasil login', '2020-03-16 09:25:54', 2),
(925, 'Pengguna andre975 berhasil logout', '2020-03-16 09:35:03', 2),
(926, 'Pengguna super_administrator berhasil login', '2020-03-16 09:35:10', 1),
(927, 'Transaksi 160320201217T0001 berhasil diubah', '2020-03-16 09:39:04', 1),
(928, 'Transaksi 160320201217T0001 berhasil diubah', '2020-03-16 09:39:12', 1),
(929, 'Transaksi  berhasil diubah status transaksinya', '2020-03-16 09:39:18', 1),
(930, 'Biodata Pengguna super_administrator berhasil diubah', '2020-03-16 09:40:46', 1),
(931, 'Cetak Laporan - 2020-03-01 - 2020-03-16', '2020-03-16 09:41:50', 1),
(932, 'Print profile', '2020-03-16 09:49:40', 1),
(933, 'Cetak Laporan - 2020-03-01 - 2020-03-16', '2020-03-16 09:50:13', 1),
(934, 'Cetak Laporan - 2020-03-01 - 2020-03-16', '2020-03-16 09:51:23', 1),
(935, 'Cetak Laporan - 2020-03-01 - 2020-03-16', '2020-03-16 09:52:14', 1),
(936, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:54:04', 1),
(937, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:54:24', 1),
(938, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:55:20', 1),
(939, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:55:30', 1),
(940, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:55:35', 1),
(941, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:55:39', 1),
(942, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:55:49', 1),
(943, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:56:22', 1),
(944, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:57:06', 1),
(945, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:57:38', 1),
(946, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:57:46', 1),
(947, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:57:57', 1),
(948, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:58:04', 1),
(949, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:58:33', 1),
(950, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:58:47', 1),
(951, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:58:53', 1),
(952, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:59:01', 1),
(953, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 09:59:28', 1),
(954, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:01:50', 1),
(955, 'Pengguna super_administrator berhasil logout', '2020-03-16 10:02:05', 1),
(956, 'Pengguna andre975 berhasil login', '2020-03-16 10:02:10', 2),
(957, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:02:16', 2),
(958, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:02:37', 2),
(959, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:04:35', 2),
(960, 'Cetak Laporan - 2020-03-14 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:04:48', 2),
(961, 'Cetak Laporan - 2020-03-14 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:04:51', 2),
(962, 'Cetak Laporan - 2020-03-14 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:05:08', 2),
(963, 'Cetak Laporan - 2020-03-14 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:05:42', 2),
(964, 'Cetak Laporan - 2020-03-14 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:05:52', 2),
(965, 'Cetak Laporan - 2020-03-14 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:06:03', 2),
(966, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:06:44', 2),
(967, 'Print profile', '2020-03-16 10:08:35', 2),
(968, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:08:57', 2),
(969, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:09:13', 2),
(970, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:09:18', 2),
(971, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:09:33', 2),
(972, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:09:40', 2),
(973, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:09:46', 2),
(974, 'Cetak Laporan - 2020-03-01 00:00:00 - 2020-03-16 23:59:59', '2020-03-16 10:12:11', 2),
(975, 'Transaksi  berhasil diubah status transaksinya', '2020-03-16 10:14:51', 2),
(976, 'Transaksi  berhasil diubah status transaksinya', '2020-03-16 10:14:56', 2),
(977, 'Pengguna andre975 berhasil logout', '2020-03-16 10:15:18', 2),
(978, 'Pengguna rian43 berhasil login', '2020-03-16 10:15:22', 6),
(979, 'Pengguna rian43 berhasil logout', '2020-03-16 10:15:55', 6),
(980, 'Pengguna andre975 berhasil login', '2020-03-16 10:16:02', 2),
(981, 'Member Ikbal berhasil ditambahkan', '2020-03-16 10:19:06', 2),
(982, 'Transaksi 160320201218T0002 berhasil ditambahkan', '2020-03-16 10:19:32', 2),
(983, 'Detail Transaksi 160320201218T0002 berhasil ditambahkan', '2020-03-16 10:19:43', 2),
(984, 'Detail Transaksi 160320201218T0002 berhasil dimanipulasi', '2020-03-16 10:19:56', 2),
(985, 'Pengguna andre975 berhasil logout', '2020-03-16 10:34:13', 2),
(986, 'Pengguna andre975 berhasil login', '2020-03-16 10:57:56', 2),
(987, 'Transaksi  berhasil diubah status transaksinya', '2020-03-16 10:58:27', 2),
(988, 'Transaksi  berhasil diubah status transaksinya', '2020-03-16 10:58:33', 2),
(989, 'Pengguna andre975 berhasil logout', '2020-03-16 11:00:19', 2),
(990, 'Pengguna andre975 berhasil login', '2020-03-16 11:00:28', 2),
(991, 'Pengguna andre975 berhasil login', '2020-03-16 11:00:41', 2),
(992, 'Pengguna irgi12 berhasil diubah', '2020-03-16 11:09:48', 2),
(993, 'Pengguna irgi12 berhasil diubah', '2020-03-16 11:09:53', 2),
(994, 'Pengguna andre975 berhasil logout', '2020-03-16 11:11:13', 2),
(995, 'Pengguna super_administrator berhasil login', '2020-03-16 11:11:19', 1),
(996, 'Jabatan administrator3 berhasil diubah', '2020-03-16 11:16:55', 1),
(997, 'Jabatan administrator berhasil diubah', '2020-03-16 11:17:00', 1),
(998, 'Jenis Paket kiloan2 berhasil diubah', '2020-03-16 11:19:40', 1),
(999, 'Jenis Paket kiloan berhasil diubah', '2020-03-16 11:19:44', 1),
(1000, 'Paket Kiloan Biasa AJAa! berhasil diubah', '2020-03-16 11:20:57', 1),
(1001, 'Paket Kiloan Biasa AJA berhasil diubah', '2020-03-16 11:21:01', 1),
(1002, 'Pengguna super_administrator berhasil logout', '2020-03-16 11:28:21', 1),
(1003, 'Pengguna andre975 berhasil login', '2020-03-16 11:28:26', 2),
(1004, 'Pengguna andre975 berhasil logout', '2020-03-16 11:29:06', 2),
(1005, 'Pengguna andre975 berhasil login', '2020-03-16 11:31:12', 2),
(1006, 'Pengguna andre975 berhasil login', '2020-03-16 20:04:56', 2),
(1007, 'Pengguna andre975 berhasil logout', '2020-03-16 20:56:25', 2),
(1008, 'Pengguna andre975 berhasil login', '2020-03-16 20:57:20', 2),
(1009, 'Cetak Invoice - 120320201215T0001 - Himdan Al Ghozan', '2020-03-16 21:05:52', 2),
(1010, 'Cetak Invoice - 120320201216T0002 - Muhammad Faisal Achramsyah', '2020-03-16 21:06:26', 2),
(1011, 'Cetak Invoice - 120320201216T0002 - Muhammad Faisal Achramsyah', '2020-03-16 21:07:36', 2),
(1012, 'Pengguna andre975 berhasil login', '2020-03-17 01:17:02', 2),
(1013, 'Cetak Invoice - 160320201217T0001 - Putri Larasati', '2020-03-17 01:28:45', 2),
(1014, 'Cetak Invoice - 160320201217T0001 - Putri Larasati', '2020-03-17 01:29:39', 2),
(1015, 'Cetak Invoice - 160320201217T0001 - Putri Larasati', '2020-03-17 01:37:05', 2),
(1016, 'Cetak Invoice - 160320201218T0002 - Ikbal', '2020-03-17 01:37:08', 2),
(1017, 'Cetak Invoice - 160320201218T0002 - Ikbal', '2020-03-17 01:38:51', 2),
(1018, 'Cetak Invoice - 160320201217T0001 - Putri Larasati', '2020-03-17 01:39:18', 2),
(1019, 'Detail Transaksi 09032020121T0005 berhasil dimanipulasi', '2020-03-17 02:11:21', 2),
(1020, 'Transaksi  berhasil diubah status transaksinya', '2020-03-17 02:13:48', 2),
(1021, 'Transaksi 17032020123T0001 berhasil ditambahkan', '2020-03-17 02:14:16', 2),
(1022, 'Detail Transaksi 17032020123T0001 berhasil ditambahkan', '2020-03-17 02:14:21', 2),
(1023, 'Transaksi  berhasil diubah status transaksinya', '2020-03-17 02:14:38', 2),
(1024, 'Pembayaran Transaksi 17032020123T0001 berhasil', '2020-03-17 02:16:27', 2),
(1025, 'Cetak Invoice - 17032020123T0001 - Bintang Shakila Akassah', '2020-03-17 02:16:33', 2),
(1026, 'Transaksi 17032020123T0001 berhasil diubah', '2020-03-17 02:17:00', 2),
(1027, 'Transaksi 17032020128T0002 berhasil ditambahkan', '2020-03-17 02:19:19', 2),
(1028, 'Detail Transaksi 17032020128T0002 berhasil ditambahkan', '2020-03-17 02:19:23', 2),
(1029, 'Detail Transaksi 17032020128T0002 gagal ditambahkan! isi minimal 1 paket', '2020-03-17 02:19:32', 2),
(1030, 'Transaksi 17032020128T0002 berhasil diubah', '2020-03-17 02:30:03', 2),
(1031, 'Transaksi 17032020128T0002 berhasil diubah', '2020-03-17 02:30:09', 2),
(1032, 'Transaksi 17032020128T0002 berhasil diubah', '2020-03-17 02:32:12', 2),
(1033, 'Transaksi 17032020128T0002 berhasil diubah', '2020-03-17 02:33:05', 2),
(1034, 'Transaksi 17032020128T0002 berhasil diubah', '2020-03-17 02:33:20', 2),
(1035, 'Pengguna andre975 berhasil login', '2020-03-17 13:15:04', 2),
(1036, 'Transaksi 17032020126T0003 berhasil ditambahkan', '2020-03-17 13:58:29', 2),
(1037, 'Detail Transaksi 17032020126T0003 berhasil ditambahkan', '2020-03-17 13:58:37', 2),
(1038, 'Transaksi  berhasil diubah status transaksinya', '2020-03-17 13:58:47', 2),
(1039, 'Pengguna andre975 berhasil logout', '2020-03-17 14:01:35', 2),
(1040, 'Pengguna rian43 berhasil login', '2020-03-17 14:01:54', 6),
(1041, 'Transaksi  berhasil diubah status transaksinya', '2020-03-17 14:40:45', 6),
(1042, 'Pembayaran Transaksi 120320202515T0005 berhasil', '2020-03-17 14:41:14', 6),
(1043, 'Cetak Invoice - 120320202515T0005 - Himdan Al Ghozan', '2020-03-17 14:41:24', 6),
(1044, 'Transaksi  berhasil diubah status transaksinya', '2020-03-17 14:42:01', 6),
(1045, 'Transaksi 17032020263T0004 berhasil ditambahkan', '2020-03-17 14:59:47', 6),
(1046, 'Detail Transaksi 17032020263T0004 berhasil ditambahkan', '2020-03-17 15:00:34', 6),
(1047, 'Pembayaran Transaksi 17032020263T0004 gagal! uang yang dibayar kurang dari total harga', '2020-03-17 15:00:58', 6),
(1048, 'Pembayaran Transaksi 17032020263T0004 berhasil', '2020-03-17 15:02:30', 6),
(1049, 'Cetak Invoice - 17032020263T0004 - Bintang Shakila Akassah', '2020-03-17 15:03:30', 6),
(1050, 'Pengguna andre975 berhasil login', '2020-03-17 18:36:52', 2),
(1051, 'Pengguna super_administrator berhasil login', '2021-12-17 22:54:53', 1),
(1052, 'Transaksi 17122021118T0001 berhasil ditambahkan', '2021-12-17 22:55:40', 1),
(1053, 'Detail Transaksi 17122021118T0001 berhasil ditambahkan', '2021-12-17 22:55:59', 1),
(1054, 'Transaksi  berhasil diubah status transaksinya', '2021-12-17 22:59:20', 1),
(1055, 'Pembayaran Transaksi 17122021118T0001 berhasil', '2021-12-17 23:14:47', 1),
(1056, 'Cetak Invoice - 17122021118T0001 - Febby Anggraeni', '2021-12-17 23:14:51', 1),
(1057, 'Cetak Laporan - 2017-12-31 00:00:00 - 2021-12-17 23:59:59', '2021-12-17 23:18:23', 1),
(1058, 'Cetak Laporan - 2017-12-31 00:00:00 - 2021-12-17 23:59:59', '2021-12-17 23:18:41', 1),
(1059, 'Pengguna super_administrator berhasil logout', '2021-12-17 23:19:09', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `jenis_kelamin` enum('pria','wanita') COLLATE utf8_unicode_ci NOT NULL,
  `telepon_member` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email_member` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat_member` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `jenis_kelamin`, `telepon_member`, `email_member`, `alamat_member`) VALUES
(1, 'Nazira Apriliani', 'wanita', '085826875457', 'naziraap21@gmail.com', 'Gg. Kesadaran No. 32 RT 04 / RW 02'),
(2, 'Muhammad Fikri', 'pria', '087842349805', 'fikrimuh8@gmail.com', 'Gg. Salak 5 No. 45 RT 04 / RW 02'),
(3, 'Bintang Shakila Akassah', 'wanita', '087851253899', 'bintang.22.syakila@gmail.com', 'Jl. AMD Babakan Pocis RT04/01 No. 200'),
(4, 'Namira Nindya Fitri', 'wanita', '081245725233', '', 'Pondok Benda Buaran Serpong Rt 01/04 Buaran Serpong Tangerang Selatan'),
(5, 'Yos Hermawan', 'pria', '0895454288024', 'yos.herm31@gmail.com', 'Jl. Kesadaran 2 No. 4 Rt 04/13 Pondok Petir, Bojongsari'),
(6, 'Arum Diah Ariyanti', 'wanita', '085812554231', '', 'Benda Baru No 97 Rt 02/09 Benda Baru Pamulang'),
(7, 'Jasmine Aulia Syahrami', 'wanita', '085642130220', 'jasmineaul25@gmail.com', 'Jl. Otista Gg. Saktirt 09/09 Kedaung, Pamulang Tangerang Selatan 15413'),
(8, 'Febby Anggraeni', 'wanita', '085721350253', 'febbya79@yahoo.co.id', 'Jl. Raya Puspiptek Gg. Masjid Rt.16/04'),
(9, 'Edwan Syawal', 'pria', '082125653821', 'edo42@gmail.com', 'Kp. Pengasinan Rt 05/01 Pengasinan, Gunung Sindur'),
(10, 'Tyo Hafiad Noerman', 'pria', '089542351005', 'tyohafiad4@gmail.com', 'Jl. Kesadaran Rt 05/03 No .72 Pondok Benda, Pamulang'),
(11, 'Roro Dana Iswara Aditya Bakti', 'wanita', '087821350255', 'roro32@yahoo.com', 'Jl. Ciater Barat No. 28 Rt 11/01 Ciater , Serpong'),
(12, 'Shelina', 'wanita', '08582135562', 'shelina87@gmail.com', 'Jl. Hk Kademangan, No. 30 Rt 05/01 Kademangan, Setu'),
(13, 'Muhammad Irgi Al Ghitraf', 'pria', '087853239481', 'irgibungsu@gmail.com', 'Puri Serpong 2'),
(14, 'Rayhan Aditya Syahputra', 'pria', '0896343114653', 'rehanadit0981@gmail.com', 'Desa Pamulang Barat Rt 02/07 No 59 Pamulang Barat, Pamulang'),
(15, 'Himdan Al Ghozan', 'pria', '089743766739', '', 'rawakalong'),
(16, 'Muhammad Faisal Achramsyah', 'pria', '0878324624782', 'faisalach2@gmail.com', 'Perum Batan Indah Blok H No. 37 Rt 13/04 Kademangan, Setu'),
(17, 'Putri Larasati', 'wanita', '087851347522', 'putrilara@gmail.com', 'Viladago Parangtritis C7 1h Rt 01/20 Benda Baru Pamulang Tangerang Selatan 15433'),
(18, 'Ikbal', 'pria', '08787836542', '', 'pamulang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telepon_outlet` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `alamat_outlet` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `telepon_outlet`, `alamat_outlet`) VALUES
(1, 'Andry Laundry Pocis', '087808675313', 'Jl. AMD Babakan Pocis No. 100 RT02/RW02 Bakti Jaya Kec. Setu Kota. Tangerang Selatan Prov. Banten Jawa Barat 15433'),
(2, 'Andry Laundry Pamulang', '081213145521', 'Jl. Jendral Sudirman No. 12 RT02/RW03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `harga_paket` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `id_jenis_paket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `harga_paket`, `id_outlet`, `id_jenis_paket`) VALUES
(1, 'Kiloan Biasa AJA', 8000, 1, 1),
(2, 'Satuan aja mas', 4000, 1, 8),
(3, 'WoW! Bed cover Ada disini!', 25000, 1, 3),
(4, 'Reguler Kiloan', 7000, 2, 1),
(5, 'Reguler Satuan', 2500, 2, 8),
(6, 'Kiloan Raja Laut', 10000, 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `uang_yg_dibayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_transaksi`, `id_user`, `total_harga`, `uang_yg_dibayar`, `kembalian`) VALUES
(1, 1, 2, 8800, 10000, 1200),
(2, 4, 2, 13200, 15000, 1800),
(3, 3, 2, 8800, 10000, 1200),
(4, 5, 2, 8800, 10000, 1200),
(5, 10, 2, 4400, 5000, 600),
(6, 9, 2, 81400, 90000, 8600),
(7, 12, 6, 20900, 21000, 100),
(8, 15, 1, 17600, 20000, 2400),
(9, 16, 1, 13200, 15000, 1800),
(10, 11, 1, 15400, 20000, 4600),
(11, 17, 1, 17600, 20000, 2400),
(12, 18, 1, 8800, 10000, 1200),
(13, 19, 2, 95700, 100000, 4300),
(14, 8, 2, 22000, 25000, 3000),
(15, 28, 2, 85800, 90000, 4200),
(16, 27, 2, 19800, 20000, 200),
(17, 24, 2, 56200, 57000, 800),
(18, 30, 6, 16500, 17000, 500),
(19, 33, 2, 75800, 76000, 200),
(20, 35, 5, 33000, 50000, 17000),
(21, 37, 2, 18900, 20000, 1100),
(22, 38, 5, 13200, 13500, 300),
(23, 32, 3, 52800, 60000, 7200),
(24, 39, 2, 8800, 10000, 1200),
(25, 41, 2, 8800, 10000, 1200),
(26, 36, 6, 36200, 100000, 63800),
(27, 44, 6, 11500, 12000, 500),
(28, 45, 1, 56500, 100000, 43500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `kode_invoice` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `batas_waktu` datetime NOT NULL,
  `tanggal_bayar` datetime NOT NULL,
  `biaya_tambahan` int(11) NOT NULL,
  `diskon` float NOT NULL,
  `pajak` int(11) NOT NULL,
  `status_transaksi` enum('proses','dicuci','siap diambil','sudah diambil') COLLATE utf8_unicode_ci NOT NULL,
  `status_bayar` enum('belum dibayar','sudah dibayar') COLLATE utf8_unicode_ci NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `kode_invoice`, `tanggal_transaksi`, `batas_waktu`, `tanggal_bayar`, `biaya_tambahan`, `diskon`, `pajak`, `status_transaksi`, `status_bayar`, `id_member`, `id_outlet`, `id_user`) VALUES
(1, '09032020126T0001', '2020-03-07 00:00:00', '2020-03-09 14:25:00', '2020-03-09 14:26:14', 0, 0, 10, 'siap diambil', 'sudah dibayar', 6, 1, 2),
(3, '09032020123T0002', '2020-03-09 14:26:52', '2020-03-09 14:26:00', '2020-03-09 14:34:50', 0, 0, 10, 'dicuci', 'sudah dibayar', 3, 1, 2),
(4, '09032020122T0003', '2020-03-09 14:34:13', '2020-03-10 09:00:00', '2020-03-09 14:34:29', 0, 0, 10, 'siap diambil', 'sudah dibayar', 2, 1, 2),
(5, '09032020126T0004', '2020-03-09 14:36:32', '2020-03-10 09:00:00', '2020-03-09 14:36:42', 0, 0, 10, 'dicuci', 'sudah dibayar', 6, 1, 2),
(7, '09032020121T0005', '2020-03-09 14:37:54', '2020-03-09 14:37:00', '0000-00-00 00:00:00', 0, 0, 10, 'dicuci', 'belum dibayar', 1, 1, 2),
(8, '09032020123T0006', '2020-03-09 14:38:47', '2020-03-09 14:38:00', '2020-03-10 19:55:33', 0, 0, 10, 'proses', 'sudah dibayar', 3, 1, 2),
(9, '09032020122T0007', '2020-03-09 14:51:02', '2020-03-09 14:50:00', '2020-03-09 16:22:24', 0, 0, 10, 'dicuci', 'sudah dibayar', 2, 1, 2),
(10, '09032020124T0008', '2020-03-09 16:14:10', '2020-03-10 09:00:00', '2020-03-09 16:14:25', 0, 0, 10, 'sudah diambil', 'sudah dibayar', 4, 1, 2),
(11, '09032020268T0009', '2020-03-09 17:55:33', '2020-03-10 09:00:00', '2020-03-09 18:14:58', 3000, 5, 10, 'sudah diambil', 'sudah dibayar', 8, 2, 6),
(12, '090320202611T0010', '2020-03-09 17:56:11', '2020-03-11 09:00:00', '2020-03-09 17:56:32', 0, 0, 10, 'siap diambil', 'sudah dibayar', 11, 2, 6),
(15, '090320201112T0011', '2020-03-09 18:11:05', '2020-03-10 09:00:00', '2020-03-09 18:13:10', 0, 0, 10, 'proses', 'sudah dibayar', 12, 1, 1),
(16, '09032020114T0012', '2020-03-09 18:14:23', '2020-03-10 09:00:00', '2020-03-09 18:14:34', 0, 0, 10, 'proses', 'sudah dibayar', 4, 1, 1),
(17, '09032020119T0013', '2020-03-09 18:31:42', '2020-03-10 09:00:00', '2020-03-09 18:32:11', 0, 0, 10, 'proses', 'sudah dibayar', 9, 1, 1),
(18, '09032020117T0014', '2020-03-09 18:32:33', '2020-03-10 09:00:00', '2020-03-09 18:33:23', 0, 0, 10, 'sudah diambil', 'sudah dibayar', 7, 1, 1),
(19, '100320201213T0001', '2020-03-10 08:56:12', '2020-03-09 09:00:00', '2020-03-10 09:02:49', 5000, 0, 10, 'sudah diambil', 'sudah dibayar', 13, 1, 2),
(21, '11032020127T0001', '2020-03-11 10:16:28', '2020-03-12 09:00:00', '0000-00-00 00:00:00', 0, 0, 10, 'siap diambil', 'belum dibayar', 7, 1, 2),
(24, '11032020127T0002', '2020-03-11 10:59:07', '2020-03-12 09:00:00', '2020-03-11 13:49:54', 1002, 0, 10, 'sudah diambil', 'sudah dibayar', 7, 1, 2),
(27, '11032020123T0004', '2020-03-11 13:25:25', '2020-03-11 13:25:00', '2020-03-11 13:45:31', 2000, 0, 10, 'sudah diambil', 'sudah dibayar', 3, 1, 2),
(28, '11032020123T0005', '2020-03-11 13:39:53', '2020-03-12 09:00:00', '2020-03-11 13:41:23', 0, 0, 10, 'sudah diambil', 'sudah dibayar', 3, 1, 2),
(29, '110320201211T0006', '2020-03-11 13:53:17', '2020-03-11 13:53:00', '0000-00-00 00:00:00', 0, 0, 10, 'siap diambil', 'belum dibayar', 11, 1, 2),
(30, '11032020263T0007', '2020-03-11 17:10:46', '2020-03-12 09:00:00', '2020-03-11 17:10:59', 10000, 0, 10, 'siap diambil', 'sudah dibayar', 3, 2, 6),
(32, '120320201215T0001', '2020-03-12 08:52:43', '2020-03-13 09:00:00', '2020-03-15 14:18:01', 0, 0, 10, 'siap diambil', 'sudah dibayar', 15, 1, 2),
(33, '120320201216T0002', '2020-03-12 09:04:42', '2020-03-15 09:00:00', '2020-03-12 09:06:42', 2500, 5, 10, 'siap diambil', 'sudah dibayar', 16, 1, 2),
(34, '12032020253T0003', '2020-03-12 11:36:45', '2020-03-13 09:00:00', '0000-00-00 00:00:00', 2000, 5, 10, 'siap diambil', 'belum dibayar', 3, 2, 5),
(35, '120320202513T0004', '2020-03-12 11:38:39', '2020-03-13 10:00:00', '2020-03-12 11:39:13', 0, 0, 10, 'dicuci', 'sudah dibayar', 13, 2, 5),
(36, '120320202515T0005', '2020-03-12 13:09:33', '2020-03-12 13:08:00', '2020-03-17 14:41:14', 0, 6, 10, 'sudah diambil', 'sudah dibayar', 15, 2, 5),
(37, '130320201213T0001', '2020-03-13 08:46:20', '2020-03-14 09:00:00', '2020-03-13 08:46:39', 2000, 5, 10, 'siap diambil', 'sudah dibayar', 13, 1, 2),
(38, '14032020253T0001', '2020-03-14 12:09:50', '2020-03-15 12:09:00', '2020-03-14 12:10:31', 0, 0, 10, 'proses', 'sudah dibayar', 3, 2, 5),
(39, '160320201217T0001', '2020-03-16 08:40:46', '2020-03-17 09:00:00', '2020-03-16 08:41:03', 0, 0, 10, 'siap diambil', 'sudah dibayar', 17, 1, 2),
(40, '160320201218T0002', '2020-03-16 10:19:32', '2020-03-17 09:00:00', '0000-00-00 00:00:00', 2000, 0, 10, 'siap diambil', 'belum dibayar', 18, 1, 2),
(41, '17032020123T0001', '2020-03-17 02:14:16', '2020-03-17 09:00:00', '2020-03-17 02:16:27', 0, 0, 10, 'dicuci', 'sudah dibayar', 3, 1, 2),
(42, '17032020128T0002', '2020-03-17 02:19:19', '2020-03-17 09:00:00', '0000-00-00 00:00:00', 5000, 2, 12, 'proses', 'belum dibayar', 8, 1, 2),
(43, '17032020126T0003', '2020-03-17 13:58:29', '2020-03-17 13:58:00', '0000-00-00 00:00:00', 0, 0, 10, 'dicuci', 'belum dibayar', 6, 1, 2),
(44, '17032020263T0004', '2020-03-17 14:59:47', '2020-03-18 09:00:00', '2020-03-17 15:02:30', 1000, 5, 10, 'proses', 'sudah dibayar', 3, 2, 6),
(45, '17122021118T0001', '2021-12-17 22:55:40', '2021-12-18 22:55:00', '2021-12-17 23:14:47', 1000, 10, 10, 'dicuci', 'belum dibayar', 8, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `id_outlet`, `id_jabatan`) VALUES
(1, 'super_administrator', '$2y$10$.zk2CNXlXauzDhI38F721.2ExLvw3hvDxE4hA.v/m.ANSGrPiPleC', 1, 1),
(2, 'andre975', '$2y$10$pFEavlHoN3M8NqpoW.XfGOZ7lBnWngElDkijqaBoAs4uwEpS1HrBq', 1, 2),
(3, 'irgi12', '$2y$10$z6U4gqlXkVHxVn9DeR5wveVUPvkWcscdODMoK4Xdzcj256mkbg666', 1, 3),
(4, 'salsa321', '$2y$10$LLS4fpdOsBbDjFjHwtEh3OwsFNILOAOJ6JEGga3zE1HupDLq/7wpa', 1, 4),
(5, 'indah76', '$2y$10$yUxIEeuKhyKhY0lb9yF9puoiiTIEf1hHMoffBDRm.B4XPfBOL76mi', 2, 2),
(6, 'rian43', '$2y$10$8VkjMkKQAwT/ZrX51WjSMOzeLTPpczX96FT87BFawgiBumVBDR6u.', 2, 3),
(7, 'febyfeb09', '$2y$10$/TSrLFZd8Gv.4jayCmp/FOezrEmsWGcVgWU/Pn89PdWfJFlkpY8DO', 2, 4),
(8, 'gita32', '$2y$10$o23vOagRlojnwlOQdBYQbuRCCC17eSmLyXytEC0o1ITwmjCPTgT7W', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`id_biodata`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indeks untuk tabel `jenis_paket`
--
ALTER TABLE `jenis_paket`
  ADD PRIMARY KEY (`id_jenis_paket`);

--
-- Indeks untuk tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_jenis_paket` (`id_jenis_paket`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `biodata`
--
ALTER TABLE `biodata`
  MODIFY `id_biodata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jenis_paket`
--
ALTER TABLE `jenis_paket`
  MODIFY `id_jenis_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1060;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `biodata`
--
ALTER TABLE `biodata`
  ADD CONSTRAINT `biodata_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD CONSTRAINT `paket_ibfk_1` FOREIGN KEY (`id_jenis_paket`) REFERENCES `jenis_paket` (`id_jenis_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paket_ibfk_2` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `arsip_b2tke`
--
CREATE DATABASE IF NOT EXISTS `arsip_b2tke` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `arsip_b2tke`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `arsip_dokumen`
--

CREATE TABLE `arsip_dokumen` (
  `id_arsip_dokumen` int(11) NOT NULL,
  `kode_rak` varchar(30) NOT NULL,
  `kode_box` varchar(30) NOT NULL,
  `kode_ordner` varchar(30) NOT NULL,
  `kode_arsip` varchar(200) NOT NULL,
  `no_akun` varchar(30) NOT NULL,
  `bidang` varchar(250) NOT NULL,
  `sub_bidang` varchar(200) NOT NULL,
  `kegiatan` varchar(200) NOT NULL,
  `tahun` int(4) NOT NULL,
  `status_arsip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `arsip_dokumen`
--

INSERT INTO `arsip_dokumen` (`id_arsip_dokumen`, `kode_rak`, `kode_box`, `kode_ordner`, `kode_arsip`, `no_akun`, `bidang`, `sub_bidang`, `kegiatan`, `tahun`, `status_arsip`) VALUES
(1, '', '001', '', 'B-1.2. 01', '', 'Bagian Umum\r\n', 'Program  & Keuangan', 'DIPA\r\n', 2016, ''),
(2, '', '002', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'DIPA\r\n', 2016, ''),
(3, '', '002', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE\r\n\r\n', 2016, ''),
(4, '', '002', '', 'B-1.2. 03', '', 'Bagian Umum', 'Program  & Keuangan', '', 2016, ''),
(5, '', '003', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'RM', 2016, ''),
(6, '', '003', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(7, '', '004', '', 'B-1.2. 01\r\n', '', 'Bagian Umum', 'Program  & Keuangan', 'DIPA\r\n', 2016, ''),
(8, '', '004', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE\r\n', 2016, ''),
(9, '', '005', '', '', '', 'Bagian Umum', 'Program  & Keuangan', '', 2016, ''),
(10, '', '006', '', '', '', 'Bagian Umum', 'Program  & Keuangan', '', 2016, ''),
(11, '', '006', '', '', '', 'Bagian Umum', 'Program  & Keuangan', '', 2016, ''),
(12, '', '007', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'DIPA', 2016, ''),
(13, '', '007', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(14, '', '004', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'DIPA', 2016, ''),
(15, '', '004', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(16, '', '005', '', '', '', 'Bagian Umum', 'Program  & Keuangan', '', 2016, ''),
(17, '', '006', '', '', '', 'Bagian Umum', 'Program  & Keuangan', '', 2016, ''),
(18, '', '006', '', '', '', 'Bagian Umum', 'Program  & Keuangan', '', 2016, ''),
(19, '', '007', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'DIPA', 2016, ''),
(20, '', '007', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(21, '', '008', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'II 2016', 2016, ''),
(22, '', '009', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(23, '', '009', '', '', '', 'Bagian Umum', 'Program & Keuangan', 'SSPB,Rekening Koran,Pencairan Cek,DLL', 2016, ''),
(24, '', '010', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(25, '', '010', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'Gaji', 2016, ''),
(26, '', '010', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'Gaji', 2016, ''),
(27, '', '011', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(28, '', '011', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'Surat Setoran Pajak Untuk Arsip', 2016, ''),
(29, '', '011', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'Surat Setoran Pajak Untuk Arsip', 2016, ''),
(30, '', '012', '', 'B-1.2.01', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(31, '', '012', '', 'B-1.2.02', '', 'Bagian Umum', 'Program  & Keuangan', 'Pajak(Surat Setoran Pajak-UP)', 2016, ''),
(32, '', '012', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'Pajak(Surat Setoran Pajak-UP)', 2016, ''),
(33, '', '013', '', 'B-1.2.01', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(34, '', '013', '', 'B-1.2.02', '', 'Bagian Umum', 'Program  & Keuangan', 'SSP Untuk pihak ke III', 2016, ''),
(35, '', '013', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'SSP Untuk pihak ke III', 2016, ''),
(36, '', '014', '', 'B-1.2.01', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE\r\n', 2016, ''),
(37, '', '014', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'Pajak LS Untuk Pihak ke III', 2016, ''),
(38, '', '015', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'SP2D', 2016, ''),
(39, '', '015', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'Transport Lokal', 2016, ''),
(40, '', '015', '', 'B-1.2. 03', '', 'Bagian Umum', 'Program  & Keuangan', 'Bku.DLL(SILABI)', 2016, ''),
(41, '', '016', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'SSBP PNBP\r\n', 2016, ''),
(42, '', '016', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'Kontrak PNBP Sudah lunas\r\n', 2016, ''),
(43, '', '016', '', 'B-1.2. 03', '', 'Bagian Umum', 'Program  & Keuangan', 'Invoice dan Kwitansi', 2016, ''),
(44, '', '017', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'SP2D Gaji', 2016, ''),
(45, '', '017', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'SP2D', 2016, ''),
(46, '', '017', '', 'B-1.2. 03', '', 'Bagian Umum', 'Program  & Keuangan', 'SP2D', 2016, ''),
(47, '', '018', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'Memo masuk umum', 2016, ''),
(48, '', '018', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'Berkas dalam proses', 2016, ''),
(49, '', '018', '', 'B-1.2. 03', '', 'Bagian Umum', 'Program  & Keuangan', 'Petunjuk Operasional PNBP', 2016, ''),
(50, '', '019', '', 'B-1.2.01', '', 'Bagian Umum', 'Program  & Keuangan', 'Faktur penjualan', 2016, ''),
(51, '', '019', '', 'B-1.2.02', '', 'Bagian Umum', 'Program  & Keuangan', 'Nota Dinas', 2016, ''),
(52, '', '020', '', 'B-1.2.01', '', 'Bagian Umum', 'Program  & Keuangan', 'Nota dinas masuk', 2016, ''),
(53, '', '020', '', 'B-1.2.02', '', 'Bagian Umum', 'Program  & Keuangan', 'Ristek dan Dipa', 2016, ''),
(54, '', '020', '', 'B-1.2.03', '', 'Bagian Umum', 'Program  & Keuangan', 'DIPA RKAKL', 2016, ''),
(55, '', '021', '', 'B-1.1.01', '', 'Bagian Umum', 'TU & SDM', 'Rekap cuti', 2016, ''),
(56, '', '021', '', 'B-1.1.02', '', 'Bagian Umum', 'TU & SDM', 'Sertifikat Rumah Cisauk', 2016, ''),
(57, '', '021', '', 'B-1.1.03', '', 'Bagian Umum', 'TU & SDM', 'Surat/Nota dinas masuk ', 2016, ''),
(58, '', '022', '', 'B-1.1.01', '', 'Bagian Umum', 'TU & SDM', 'Data pendukung Absensi', 2016, ''),
(59, '', '022', '', 'B-1.1.02', '', 'Bagian Umum', 'TU & SDM', 'STKK Tiem', 2016, ''),
(60, '', '022', '', 'B-1.1.03', '', 'Bagian Umum', 'TU & SDM', 'Data pegawai', 2016, ''),
(61, '', '023', '', 'B-1.1. 01', '', 'Bagian Umum', 'TU & SDM', 'Data dukung absensi Maret', 2016, ''),
(62, '', '023', '', 'B-1.1. 02', '', 'Bagian Umum', 'TU & SDM', 'Data dukung absensi April', 2016, ''),
(63, '', '023', '', 'B-1.1. 03', '', 'Bagian Umum', 'TU & SDM', 'Data dukung absensi Mei-Agustus', 2016, ''),
(64, '', '024', '', 'B-1.1. 01', '', 'Bagian Umum', 'TU & SDM', 'Data dukung absensi Sep-Des', 2016, ''),
(65, '', '024', '', 'B-1.1. 02', '', 'Bagian Umum', 'TU & SDM', 'Lain-lain', 2016, ''),
(66, '', '024', '', 'B-1.1. 03', '', 'Bagian Umum', 'TU & SDM', 'Surat/Nota dinas masuk', 2016, ''),
(67, '', '025', '', 'B-1.1. 01', '', 'Bagian Umum', 'TU & SDM', 'Nomor Dupak Perekayasa', 2016, ''),
(68, '', '025', '', 'B-1.1. 02', '', 'Bagian Umum', 'TU & SDM', 'SPPD', 2016, ''),
(69, '', '026', '', 'B-3. 01', '', 'Tek. Kelistrikan', '', 'Kaji ulang Pengujian', 2016, ''),
(70, '', '026', '', 'B-3. 02', '', 'Tek. Kelistrikan', '', 'Jawaban Kaji Ulang', 2016, ''),
(71, '', '027', '', 'B-3. 01', '', 'Tek. Kelistrikan', '', 'Surat tugas transport', 2016, ''),
(72, '', '027', '', 'B-3. 02', '', 'Tek. Kelistrikan', '', 'Surat Tugas Umum', 2016, ''),
(73, '', '028', '', 'B-3. 01', '', 'Tek. Kelistrikan', '', 'Surat dinas masuk', 2016, ''),
(74, '', '028', '', 'B-3. 02', '', 'Tek. Kelistrikan', '', 'Rekap absensi', 2016, ''),
(75, '', '029', '', 'B-3. 01', '', 'Tek. Kelistrikan', '', 'Nota dinas masuk', 2016, ''),
(76, '', '029', '', 'B-3. 02', '', 'Tek. Kelistrikan', '', 'Nota dinas keluar', 2016, ''),
(77, '', '030', '', 'B-3. 01', '', 'Tek. Kelistrikan', '', 'Mobil Listrik', 2016, ''),
(78, '', '030', '', 'B-3. 02', '', 'Tek. Kelistrikan', '', 'LKP Pengujian', 2016, ''),
(79, '', '031', '', 'B-3. 01', '', 'Tek. Kelistrikan', '', 'DIPA 2016 Smart Grid', 2016, ''),
(80, '', '032', '', 'Fosil 01', '', 'Energi Fosil', '', 'Personil', 2016, ''),
(81, '', '032', '', 'Fosil 02', '', 'Energi Fosil', '', 'Undangan', 2016, ''),
(82, '', '032', '', 'Fosil 03', '', 'Energi Fosil', '', 'Nota dinas keluar', 2016, ''),
(83, '', '033', '', 'B-3. 01', '', 'LPKSF', '', 'Form keluhan pelanggan', 2016, ''),
(84, '', '033', '', 'B-3. 02', '', 'LPKSF', '', 'Berkas perbaikan alat', 2016, ''),
(85, '', '033', '', 'B-3. 03', '', 'LPKSF', '', 'Form Pengujian', 2016, ''),
(86, '', '033', '', 'B-3. 04', '', 'LPKSF', '', 'Panduan Mutu Prosedur Operasional', 2016, ''),
(87, '', '034', '', 'B-3. 01', '', 'LPKSF', '', 'Panduan Mutu Prosedur Operasional', 2016, ''),
(88, '', '035', '', 'B-3. 01', '', 'LPKSF', '', 'Formulir Penyerahan', 2016, ''),
(89, '', '035', '', '', '', 'LPKSF', '', 'Sempel Ke Lab.', 2016, ''),
(90, '', '036', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'DIPA', 2016, ''),
(91, '', '036', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'BPG-B2TKE', 2016, ''),
(92, '', '001', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'Kontrak lunas 1', 2017, ''),
(93, '', '001', '', '', '', 'Bagian Umum', 'Program  & Keuangan', 'Kontrak lunas II\r\n', 2017, ''),
(94, '', '002', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'SSP(Surat Setoran Pajak),UP,Arsip I', 2017, ''),
(95, '', '002', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'SSP(Surat Setoran Pajak),UP,Pihak III', 2017, ''),
(96, '', '002', '', 'B-1.2. 03', '', 'Bagian Umum', 'Program  & Keuangan', 'SSP(Surat Setoran Pajak),UP,Pihak ke III', 2017, ''),
(97, '', '003', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'R/K,Pencairan Cek,Bukti Transfer,Astrographia,SSPB', 2017, ''),
(98, '', '003', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'Surat Setoran Pajak,LS,Pihak III', 2017, ''),
(99, '', '003', '', 'B-1.2. 03', '', 'Bagian Umum', 'Program  & Keuangan', 'Surat Setoran Pajak,LS,Pihak III', 2017, ''),
(100, '', '004', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program  & Keuangan', 'Bukti Setor,Surat Setoran Pajak,GU,Bank,Copy DRPP', 2017, ''),
(101, '', '004', '', 'B-1.2. 02', '', 'Bagian Umum', 'Program  & Keuangan', 'Bukti Transfer', 2017, ''),
(102, '', '005', '', 'B-1.1 01', '', 'Bagian Umum', 'TU & SDM & RT', 'Data Dukung Absensi Januari-Maret', 2017, ''),
(103, '', '005', '', 'B-1.1 02', '', 'Bagian Umum', 'TU & SDM & RT', 'Data Dukung Absensi April-Juni', 2017, ''),
(104, '', '005', '', 'B-1.1 03', '', 'Bagian Umum', 'TU & SDM & RT', 'Data Dukung Absensi Juli-Agustus', 2017, ''),
(105, '', '006', '', 'B-1.1 01', '', 'Bagian Umum', 'TU & SDM & RT', 'Data Dukung Absensi Oktober-Desember', 2017, ''),
(106, '', '006', '', 'B-1.1 02', '', 'Bagian Umum', 'TU & SDM & RT', 'Jabatan Fungsional,dan Kenaikan Pangkat', 2017, ''),
(107, '', '006', '', 'B-1.1 03', '', 'Bagian Umum', 'TU & SDM & RT', 'Surat atau Nota Dinas Masuk', 2017, ''),
(108, '', '007', '', 'B-1.1 01', '', 'Bagian Umum', 'TU & SDM & RT', 'Surat Pemberitahuan Rumah Dinas Puspiptek', 2017, ''),
(109, '', '007', '', 'B-1.1 02', '', 'Bagian Umum', 'TU & SDM & RT', 'PKL/Magang', 2017, ''),
(110, '', '007', '', 'B-1.1 03', '', 'Bagian Umum', 'TU & SDM & RT', 'Rekapitulasi Absensi', 2017, ''),
(111, '', '001', '', 'B-1.2. 01', '', 'Bagian Umum', 'Program & Keuangan', 'PNBP', 2017, ''),
(112, 'A1', 'A1-1', 'A1-1-1', 'BN.00.00', '1', 'bagian umum', 'program keuangan', 'DIPA', 2016, 'ada');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bidang`
--

CREATE TABLE `bidang` (
  `id_bidang` int(11) NOT NULL,
  `bidang` varchar(100) NOT NULL,
  `sub_bidang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bidang`
--

INSERT INTO `bidang` (`id_bidang`, `bidang`, `sub_bidang`) VALUES
(1, 'energi terbarukan', 'fotofoltaik & elektro kimia\r\n'),
(2, 'energi terbarukan', 'termal mekanik\r\n'),
(3, 'efisiensi energi', 'analisis & optimasi energi'),
(4, 'efisiensi energi', 'rekayasa instrumentasi & kalibrasi'),
(5, 'energi fosil', 'pengolahan & karakterisasi\r\n'),
(6, 'energi fosil\r\n', 'konversi & pengendalian polusi\r\n'),
(7, 'bagian umum\r\n', 'SBRT\r\n'),
(8, 'bagian umum\r\n', 'TU SDM\r\n'),
(9, 'bagian umum\r\n', 'TU SDM RT\r\n'),
(10, 'bagian umum\r\n', 'program keuangan\r\n'),
(11, 'pelayanan teknologi\r\n', 'pelayanan jasa\r\n'),
(12, 'pelayanan teknologi\r\n', 'program\r\n'),
(13, 'layanan jasa teknologi\r\n', 'pengelolaan technopark energi\r\n'),
(14, 'layanan jasa teknologi\r\n', 'layanan jasa\r\n'),
(15, 'teknologi kelistrikan\r\n', ''),
(16, 'konversi energi\r\n', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode_arsip`
--

CREATE TABLE `kode_arsip` (
  `id_kode_arsip` int(11) NOT NULL,
  `kode_arsip` varchar(100) NOT NULL,
  `deskripsi_arsip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kode_arsip`
--

INSERT INTO `kode_arsip` (`id_kode_arsip`, `kode_arsip`, `deskripsi_arsip`) VALUES
(1, 'BN', 'Barang Milik Negara'),
(2, 'BN.00', 'Pengelolaan Barang Milik Negara'),
(3, 'BN.00.00', 'Inventarisasi Barang Milik Negara'),
(4, 'BN.00.01', 'Penyimpanan Barang Milik Negara'),
(5, 'BN.00.02', 'Distribusi/Penyaluran Barang Milik Negara'),
(6, 'BN.01', 'Penghapusan Barang Milik Negara'),
(7, 'BN.01.00', 'Penghapusan Barang Bergerak'),
(8, 'BN.01.01', 'Penghapusan Barang Tidak Bergerak'),
(9, 'HM', 'Hubungan Masyarakat'),
(10, 'HM.00', 'Keprotokolan'),
(11, 'HM.00.00', 'Upacara/Acara Kedinasan'),
(12, 'HM.00.01', 'Penerimaan Tamu'),
(13, 'HM.00.02', 'Agenda Pimpinan'),
(14, 'HM.00.03', 'Kunjungan Kerja'),
(15, 'HM.01', 'Dengar Pendapat/Hearing DPR-RI'),
(16, 'HM.02', 'Hubungan Antar Lembaga'),
(17, 'HM.02.00', 'Lembaga Negara'),
(18, 'HM.02.01', 'Perusahaan'),
(19, 'HM.02.02', 'Organisasi Kemasyarakatan'),
(20, 'HM.02.03', 'Perguruan Tinggi/Sekolah'),
(21, 'HM.02.04', 'Bakohumas'),
(22, 'HM.03', 'Penerangan dan Publikasi'),
(23, 'HM.04', 'Dokumentasi dan Penerbitan'),
(24, 'HM.05', 'Ucapan'),
(25, 'HK', 'Hukum'),
(26, 'HK.00', 'Program Legislasi'),
(27, 'HK.01', 'Produk Hukum Lembaga Negara'),
(28, 'HK.01.00', 'Undang-Undang Dasar'),
(29, 'HK.01.01', 'Ketetapan MPR'),
(30, 'HK.01.02', 'Undang-Undang'),
(31, 'HK.01.03', 'Peraturan Pemerintah Pengganti Undang-Undang'),
(32, 'HK.01.04', 'Peraturan Pemerintah'),
(33, 'HK.01.05', 'Peraturan Presiden'),
(34, 'HK.01.06', 'Keputusan Presiden'),
(35, 'HK.01.07', 'Instruksi Presiden'),
(36, 'HK.01.08', 'Peraturan Daerah'),
(37, 'HK.01.09', 'Peraturan Lainnya'),
(38, 'HK.02', 'Produk Hukum Kementrian dan Non Kementrian di Luar BPPT'),
(39, 'HK.02.00', 'Peraturan Menteri'),
(40, 'HK.02.01', 'Keputusan Menteri'),
(41, 'HK.02.02', 'Instruksi Menteri'),
(42, 'HK.02.03', 'Keputusan/Peraturan Direktur Jenderal'),
(43, 'HK.02.04', 'Keputusan/Peraturan Gubernur,PERDA,KPU'),
(44, 'HK.02.05', 'Surat Edaran'),
(45, 'HK.02.06', 'Keputusan/Peraturan Lembaga/Badan'),
(46, 'HK.03', 'Telaah Hukum'),
(47, 'HK.03.00', 'Telaah Hukum Internal'),
(48, 'HK.03.01', 'Telaah Eksternal'),
(49, 'HK.03.02', 'Telaah Perjanjian'),
(50, 'HK.03.03', 'Telaah Akta'),
(51, 'HK.04', 'Pertimbangan Hukum'),
(52, 'HK.05', 'Sosialisasi/Penyuluhan Produk Hukum'),
(53, 'HK.06', 'Bantuan Hukum'),
(54, 'HK.07', 'Kekayaan Intelektual'),
(55, 'HK.07.00', 'Paten'),
(56, 'HK.07.01', 'Desain Industri'),
(57, 'HK.07.02', 'Hak Cipta'),
(58, 'HK.07.03', 'Merk dan Indikasi Geografis'),
(59, 'HK.07.04', 'Desain Tata Letak Sirkuit Terpadu'),
(60, 'HK.07.05', 'Rahasia Dagang'),
(61, 'HK.08', 'Dokumentasi Produk Hukum'),
(62, 'KA', 'Kearsipan'),
(63, 'KA.00', 'Penyusunan Sistem Kearsipan'),
(64, 'KA.01', 'Arsip Dinamis'),
(65, 'KA.01.00', 'Persuratan'),
(66, 'KA.01.01', 'Pengelolaan Arsip Dinamis Aktif'),
(67, 'KA.01.02', 'Pengelolaan Arsip Dinamis Inaktif'),
(68, 'KA.01.03', 'Layanan Peminjaman Arsip'),
(69, 'KA.02', 'Pembinaan Kearsipan'),
(70, 'KA.03', 'Supervisi Kearsipan'),
(71, 'KA.04', 'Evaluasi Sistem Kearsipan'),
(72, 'KA.05', 'Sosialisasi Kearsipan'),
(73, 'KA.06', 'Persandian'),
(74, 'KP', 'Kepegawaian'),
(75, 'KP.00', 'Formasi Pegawai'),
(76, 'KP.00.00', 'Usulan, Persetujuan dan Penetapan Formasi'),
(77, 'KP.00.01', 'Usulan Penempatan Pegawai'),
(78, 'KP.01', 'Pengadaan Pegawai'),
(79, 'KP.01.00', 'Penerimaan'),
(80, 'KP.01.01', 'Pengangkatan CPNS dan PNS'),
(81, 'KP.01.02', 'Prajabatan'),
(82, 'KP.02', 'Ujian Kenaikan Pangkat/Jabatan'),
(83, 'KP.02.00', 'Ujian Penyesuaian Ijazah'),
(84, 'KP.03', 'Standar Kompetensi'),
(85, 'KP.03.00', 'Standar Kompetensi Jabatan Struktural'),
(86, 'KP.03.01', 'Standar Kompetensi Jabatan Fungsional'),
(87, 'KP.04', 'Analisis Beban Kerja'),
(88, 'KP.05', 'Kompetensi'),
(89, 'KP.05.00', 'Assessment Pegawai'),
(90, 'KP.05.01', 'Pemetaan/Talent Mapping Pegawai'),
(91, 'KP.06', 'Data Pegawai'),
(92, 'KP.07', 'Kartu Pegawai'),
(93, 'KP.08', 'Pembinaan Pegawai'),
(94, 'KP.08.00', 'Penilaian Prestasi Kerja'),
(95, 'KP.08.01', 'Pembinaan Mental'),
(96, 'KP.08.02', 'Hukum Disiplin'),
(97, 'KP.08.03', 'Perselisihan/Sengketa Pegawai'),
(98, 'KP.09', 'Pembinaan Jabatan Fungsional'),
(99, 'KP.09.00', 'Pengangkatan Jabatan Fungsional Tertentu'),
(100, 'KP.09.01', 'Kenaikan Jenjang Jabatan'),
(101, 'KP.09.02', 'Pemindahan Jabatan Fungsional Tertentu'),
(102, 'KP.09.03', 'Pemberhentian'),
(103, 'KP.10', 'Mutasi'),
(104, 'KP.10.00', 'Kenaikan Pangkat atau Golongan'),
(105, 'KP.10.01', 'Perpindahan Pegawai'),
(106, 'KP.10.02', 'Penyesuaian Kelas Jabatan'),
(107, 'KP.10.03', 'Pemberhentian Pegawai'),
(108, 'KP.11', 'Pegawai Dipekerjakan dan Diperbantukan'),
(109, 'KP.12', 'Pengangkatan dan Pemberhentian Jabatan Struktural'),
(110, 'KP.12.00', 'Pengangkatan Jabatan Struktural'),
(111, 'KP.12.01', 'Pemberhentian Jabatan Struktural'),
(112, 'KP.13', 'Pendelegasian Wewenang'),
(113, 'KP.13.00', 'Pelaksana Tugas (Plt.)'),
(114, 'KP.13.01', 'Pelaksana Harian (Plh.)'),
(115, 'KP.14', 'Ijin dan Cuti Pegawai'),
(116, 'KP.15', 'Kesejahteraan'),
(117, 'KP.15.00', 'Kesehatan'),
(118, 'KP.15.01', 'Bantuan Sosial'),
(119, 'KP.15.02', 'Perumahan'),
(120, 'KP.15.03', 'Keterangan Penerimaan Pembayaran Penghasilan Pegawai (KP4)'),
(121, 'KP.15.04', 'Status Keluarga dan Penyesuaian Tunjangan Keluarga'),
(122, 'KP.15.05', 'Tunjangan Kinerja dan Uang Makan'),
(123, 'KP.15.06', 'Tanda Jasa'),
(124, 'KP.15.07', 'Kenaikan Gaji Berkala'),
(125, 'KS', 'Kerja Sama'),
(126, 'KS.00', 'Kerja Sama'),
(127, 'KS.00.00', 'Kerja Sama Dalam Negeri'),
(128, 'KS.00.01', 'Kerja Sama Luar Negeri'),
(129, 'KS.00.02', 'Kerja Sama Industri'),
(130, 'KS.01', 'Penyusunan Laporan'),
(131, 'KS.01.00', 'Laporan Berkala'),
(132, 'KS.01.01', 'Laporan Khusus'),
(133, 'KS.01.02', 'Laporan Perkembangan'),
(134, 'KS.02', 'Bantuan/Peminjaman Luar Negeri'),
(135, 'KS.02.00', 'Grey Book-Blue Book'),
(136, 'KS.02.01', 'Loan Agreement (PHLN)'),
(137, 'KS.02.02', 'Alokasi dan Relokasi'),
(138, 'KS.02.03', 'Replenishment'),
(139, 'KU', 'Keuangan'),
(140, 'KU.00', 'Pelaksanaan Anggaran'),
(141, 'KU.00.01', 'RAB'),
(142, 'KU.00.02', 'Penggajian'),
(143, 'KU.00.03', 'Pengeluaran Anggaran'),
(144, 'KU.01', 'Pengelolaan Perbendaharaan'),
(145, 'KU.01.00', 'Perbendaharaan'),
(146, 'KU.01.01', 'Kartu Pengawasan Kredit'),
(147, 'KU.01.02', 'Pajak'),
(148, 'KU.01.03', 'Penerimaan Negara Bukan Pajak (PNBP)'),
(149, 'KU.01.04', 'Pengembalian Belanja'),
(150, 'KU.01.05', 'Berita Acara Pemeriksaan Kas'),
(151, 'KU.01.06', 'Tuntutan Ganti Rugi'),
(152, 'KU.01.07', 'Pembukuan Anggaran'),
(153, 'KU.02', 'Verifikasi Anggaran'),
(154, 'KU.03', 'Ketatausahaan Keuangan '),
(155, 'KU.03.00', 'Keterangan Penghasilan'),
(156, 'KU.03.01', 'Permohonan Peminjaman'),
(157, 'KU.04', 'Bantuan/Peminjaman Luar Negeri'),
(158, 'KU.04.00', 'Realisasi'),
(159, 'KU.04.01', 'Laporan Bantuan Luar Negeri'),
(160, 'KU.05', 'Akuntansi dan Pelaporan'),
(161, 'KU.06', 'Implementasi Sistem Akuntansi Pemerintah (SAP)'),
(162, 'KU.07', 'Evaluasi Anggaran'),
(163, 'KU.08', 'Tindak Lanjut Laporan Hasil Pemeriksaan'),
(164, 'KU.09', 'Ketatausahaan Anggaran'),
(165, 'KU.10', 'Standar Biaya Masukan Lainnya'),
(166, 'MI', 'Manajemen Informasi'),
(167, 'MI.00', 'Infrastruktur Informasi'),
(168, 'MI.01', 'Manajemen Aplikasi E-Government'),
(169, 'MI.02', 'Layanan Standardisasi'),
(170, 'MI.03', 'Manajemen Pengetahuan dan Perpustakaan'),
(171, 'OT', 'Organisasi dan Tata Laksana'),
(172, 'OT.00', 'Organisasi'),
(173, 'OT.00.00', 'Penataan Organisasi'),
(174, 'OT.00.01', 'Evaluasi Organisasi'),
(175, 'OT.01', 'Analisis Jabatan\r\n'),
(176, 'OT.01.00', 'Analisis Jabatan Struktural\r\n'),
(177, 'OT.01.01', 'Analisis Jabatan Fungsional Tertentu\r\n'),
(178, 'OT.01.02', 'Analisis Jabatan Fungsional Umum\r\n'),
(179, 'OT.02', 'Evaluasi Jabatan'),
(180, 'OT.03', 'Tata Laksana'),
(181, 'OT.03.00', 'Penyusunan dan Peyelarasan Tata Laksana'),
(182, 'OT.03.01', 'Monitoring dan Evaluasi Tata Laksana'),
(183, 'PRB', 'Program Reformasi Birokrasi'),
(184, 'PRB.00', 'Pelaksanaan Reformasi Birokrasi'),
(185, 'PRB.01', 'Penilaian Mandiri Pelaksanaan Reformasi Birokrasi (PMPRB)'),
(186, 'DL', 'Pendidikan dan Pelatihan'),
(187, 'DL.00', 'Program/Perencanaan'),
(188, 'DL.01', 'Penjenjangan'),
(189, 'DL.01.00', 'Penjenjangan Jabatan Struktural'),
(190, 'DL.01.01', 'Penjenjangan Jabatan Fungsional'),
(191, 'DL.02', 'Pendidikan'),
(192, 'DL.02.00', 'Perguruan Tinggi'),
(193, 'DL.02.01', 'Tugas Belajar'),
(194, 'DL.02.02', 'Ikatan Dinas'),
(195, 'DL.03', 'Pelatihan'),
(196, 'DL.03.00', 'Pelatihan Teknis dan Non Teknis'),
(197, 'DL.03.01', 'Magang/Praktek Kerja'),
(198, 'DL.03.02', 'Evaluasi'),
(199, 'DL.04', 'Akreditasi dan Sertifikasi'),
(200, 'DL.04.00', 'Akreditasi'),
(201, 'DL.04.01', 'Sertifikasi'),
(202, 'PR', 'Perencanaan'),
(203, 'PR.00', 'Pokok-Pokok Kebijakan dan Strategi Pembangunan'),
(204, 'PR.00.00', 'Rencana Pembangunan Jangka Panjang (RPJP)'),
(205, 'PR.00.01', 'Rencana Pembangunan Jangka Menengah (RPJM)'),
(206, 'PR.00.02', 'Rencana Strategis (Renstra)'),
(207, 'PR.01', 'Rencana Kerja'),
(208, 'PR.01.00', 'Usulan Perencanaan Kegiatan'),
(209, 'PR.01.01', 'Rencana Kinerja Tahunan'),
(210, 'PR.01.02', 'Rencana Kerja Berdasar Pagu Indikatif'),
(211, 'PR.01.03', 'Inisiatif Baru'),
(212, 'PR.02', 'Penetapan Kinerja'),
(213, 'PR.03', 'Perencanaan Anggaran'),
(214, 'PR.03.00', 'Penyusunan Rencana Anggaran'),
(215, 'PR.03.01', 'Penerimaan Negara Bukan Pajak (PNBP)'),
(216, 'PR.03.02', 'Standarisasi Harga Satuan Perencanaan Barang (SHSPB)'),
(217, 'PR.03.03', 'Standar Biaya Keluaran (SBK)'),
(218, 'PR.03.04', 'Arsitektur dan Informasi Kinerja (ADIK)'),
(219, 'PR.04', 'Revisi Dokumen Anggaran'),
(220, 'PR.04.00', 'Revisi DIPA dan POK'),
(221, 'PR.04.01', 'Anggaran Belanja Tambahan (ABT)'),
(222, 'PR.04.02', 'Anggaran Pendapat dan Belanja Negara-Perubahan (APBN-P)'),
(223, 'PR.05', 'Laporan Akuntabilitas Kinerja Instansi Pemerintah (LAKIP)'),
(224, 'PR.06', 'Evaluasi Program dan Pelaporan Kinerja'),
(225, 'PL', 'Perlengkapan'),
(226, 'PL.00', 'Perencanaan Pengadaan Barang dan Jasa'),
(227, 'PL.00.00', 'Analisis Kebutuhan'),
(228, 'PL.00.01', 'Tata Ruang'),
(229, 'PL.00.02', 'Daftar Perkenalan Mampu'),
(230, 'PL.01', 'Pelaksanaan Pengadaan Barang dan Jasa'),
(231, 'PL.01.00', 'Pengadaan Barang Habis Pakai'),
(232, 'PL.01.01', 'Pengadaan Barang Bergerak'),
(233, 'PL.01.02', 'Pengadaan Barang Tidak Bergerak'),
(234, 'PL.01.03', 'Pengadaan Instalasi/Jaringan'),
(235, 'PL.02', 'Penyimpanan Distribusi'),
(236, 'PL.03', 'Pemeliharaan'),
(237, 'PW', 'Pengawasan'),
(238, 'PW.00', 'Audit'),
(239, 'PW.01', 'Reviu'),
(240, 'PW.02', 'Evaluasi/Penilaian'),
(241, 'PW.03', 'Pemantauan'),
(242, 'PW.04', 'Kegiatan Pengawasan Lainnya'),
(243, 'PW.05', 'Pengaduan Masyarakat'),
(244, 'RT', 'Rumah Tangga'),
(245, 'RT.00', 'Urusan Dalam'),
(246, 'RT.00.00', 'Jamuan'),
(247, 'RT.00.01', 'Pengamanan'),
(248, 'RT.00.02', 'Evakuasi Penanggulangan Bahaya'),
(249, 'RT.01', 'Perjalanan Dinas'),
(250, 'RT.01.00', 'Perjalanan Dinas Dalam Negeri'),
(251, 'RT.01.01', 'Perjalanan Dinas Luar Negeri'),
(252, 'RT.02', 'Kendaraan Dinas'),
(253, 'RT.02.01', 'Pengelolaan Kendaraan Dinas'),
(254, 'RT.02.02', 'Pengelolaan BBM'),
(255, 'RT.03', 'Percetakan'),
(256, 'KT', 'Kebijakan Teknologi'),
(257, 'KT.00', 'Sistem Inovasi Daerah'),
(258, 'KT.00.00', 'Kebijakan Kelembagaan Inovasi'),
(259, 'KT.00.01', 'Kebijakan Budaya Inovasi'),
(260, 'KT.00.02', 'Kebijakan Infrastruktur Khusus Inovasi'),
(261, 'KT.00.03', 'Isu Perkembangan Inovasi Global'),
(262, 'KT.01', 'Kawasan Spesifik'),
(263, 'KT.01.00', 'Manajemen Invensi dan Inovasi'),
(264, 'KT.01.01', 'Jaringan Inovasi'),
(265, 'KT.01.02', 'Penyiapan Rumusan Kebijakan'),
(266, 'KT.02', 'Teknoprener dan Klaster Industri'),
(267, 'KT.02.00', 'Kebijakan Teknologi Teknoprener'),
(268, 'KT.02.01', 'Kebijakan Teknologi Klaster Tertentu'),
(269, 'KT.02.02', 'Kebijakan Pengembangan Kelembagaan dan Budaya Teknoprener'),
(270, 'KT.03', 'Strategi Teknologi dan Audit Teknologi'),
(271, 'KT.03.00', 'Strategi Teknologi'),
(272, 'KT.03.01', 'Audit Teknologi'),
(273, 'KT.03.02', 'Teknologi Tematik'),
(274, 'KT.04', 'Teknologi Industri Kreatif Keramik'),
(275, 'KT.04.00', 'Fasilitasi dan Konsultasi'),
(276, 'KT.04.01', 'Kerekayasaan Teknologi Industri Kreatif Keramik'),
(277, 'KT.05', 'Inkubator Teknologi'),
(278, 'KT.05.00', 'Fasilitasi dan Konsultasi'),
(279, 'KT.05.01', 'Inkubasi Bisnis Untuk Pengembangan'),
(280, 'SA', 'Sumber Daya Alam'),
(281, 'SA.00', 'Sumber Daya Wilayah'),
(282, 'SA.00.00', 'Eksplorasi Sumber Daya Alam Berbasis Penginderaan Jauh Maju'),
(283, 'SA.00.01', 'Eksplorasi Sumber Daya Alam Wilayah Darat'),
(284, 'SA.00.02', 'Eksplorasi Sumber Daya Alam Wilayah Laut'),
(285, 'SA.01', 'Sumber Daya Mineral'),
(286, 'SA.01.00', 'Eksplorasi dan Penambangan'),
(287, 'SA.01.01', 'Pengolahan dan Tekno-Ekonomi Mineral'),
(288, 'SA.01.02', 'Pengelolaan Dampak Pertambangan'),
(289, 'SA.02', 'Reduksi Resiko Bencana'),
(290, 'SA.02.00', 'Pengelolaan Bentang Lahan dan Badan Air'),
(291, 'SA.02.01', 'Pengembangan Wilayah dan Pengelolaan Kawasan'),
(292, 'SA.02.02', 'Mitigasi Bencana'),
(293, 'SA.03', 'Teknologi Lingkungan'),
(294, 'SA.03.00', 'Pengendalian Pencemaran Lingkungan'),
(295, 'SA.03.01', 'Konservasi dan Pemulihan Kualitas Lingkungan'),
(296, 'SA.03.02', 'Tata Kelola Lingkungan'),
(297, 'SA.04', 'Teknologi Modifikasi Cuaca'),
(298, 'SA.04.01', 'Eksternal'),
(299, 'SA.04.02', 'Internal'),
(300, 'SA.05', 'Pengolahan Air dan Limbah'),
(301, 'SA.05.00', 'Layanan Jasa Kepada Pemerintah'),
(302, 'SA.05.01', 'Layanan Jasa Kepada Swasta'),
(303, 'SA.06', 'Teknologi Survey Kelautan'),
(304, 'SA.06.00', 'Layanan Teknologi Survey Kelautan'),
(305, 'SA.06.01', 'Kerjasama Riset Kelautan'),
(306, 'SA.06.02', 'Pengelolaan Kapal Riset Baruna Jaya BPPT'),
(307, 'SA.06.03', 'Pengelolaan Sarana-Prasarana National science and Techno Park (NSTP) Maritim'),
(308, 'AB', 'Agro Industri dan Bioteknologi'),
(309, 'AB.00', 'Produksi Pertanian'),
(310, 'AB.01', 'Agro Industri'),
(311, 'AB.02', 'Bioindustri'),
(312, 'AB.03', 'Farmasi dan Medika'),
(313, 'AB.04', 'Bioteknologi'),
(314, 'AB.05', 'Teknologi Pati'),
(315, 'EM', 'Energi dan Material'),
(316, 'EM.00', 'Sumber Daya Energi dan Industri Kimia'),
(317, 'EM.01', 'Konversi dan Konservasi Energi'),
(318, 'EM.02', 'Teknologi Material'),
(319, 'EM.03', 'Teknologi Polimer'),
(320, 'EM.04', 'Teknologi Elektronika'),
(321, 'EM.05', 'Bahan Bakar dan Rekayasa Disain'),
(322, 'EM.06', 'Informasi dan Komunikasi'),
(323, 'RB', 'Rancang Bangun dan Rekayasa'),
(324, 'RB.00', 'Teknologi Pertahanan dan Keamanan'),
(325, 'RB.01', 'Teknologi Industri Permesinan'),
(326, 'RB.02', 'Teknologi Sistem dan Prasarana Transportasi'),
(327, 'RB.03', 'Teknologi Rekayasa Industri Maritim'),
(328, 'RB.04', 'Aerodinamika, Aeroelastika, dan Aeroakustika'),
(329, 'RB.04.00', 'Layanan Teknologi'),
(330, 'RB.04.o1', 'Kerekayasaan dan Inovasi Teknologi'),
(331, 'RB.05', 'Kekuatan Struktur'),
(332, 'RB.05.00', 'Uji Sertifikasi'),
(333, 'RB.05.01', 'Uji Material'),
(334, 'RB.05.02', 'Pengembangan Sarana Uji'),
(335, 'RB.06', 'Hidrodinamika'),
(336, 'RB.06.00', 'Program Teknologi Hidrodinamika'),
(337, 'RB.06.01', 'Layanan Teknologi Hidrodinamika'),
(338, 'RB.06.02', 'Sarana Prasarana BTH'),
(339, 'RB.07', 'Termodinamika, Motor, dan Propulsi'),
(340, 'RB.07.00', 'Pelayanan Jasa Teknologi'),
(341, 'RB.07.01', 'Kerekayasaan dan Inovasi Teknologi'),
(342, 'RB.07.02', 'Sarana-Prasarana'),
(343, 'RB.08', 'Teknologi Infrastruktur Pelabuhan dan Dinamika Pantai'),
(344, 'RB.08.00', 'Program Teknologi Infrastruktur Pelabuhan dan Dinamika Pantai'),
(345, 'RB.08.01', 'Layanan Teknologi Infrastruktur Pelabuhan dan Dinamika Pantai'),
(346, 'RB.08.02', 'Sarana Prasarana'),
(347, 'RB.09', 'Mesin Perkakas, Produksi dan Otomasi'),
(348, 'RB.09.00', 'Kerekayasaan Teknologi'),
(349, 'RB.09.01', 'Pengembangan Sarana-Prasarana'),
(350, 'PT', 'Pelayanan Teknologi'),
(351, 'PT.00', 'Perencanaan Pemasaran'),
(352, 'PT.01', 'Pemasyarakatan'),
(353, 'PT.02', 'Pelayanan Jasa Teknologi'),
(354, 'PT.03', 'Pematangan Usaha'),
(355, 'PT.04', 'Monitoring dan Evaluasi'),
(356, 'Fosil 03', 'Energi Fosil'),
(357, 'Fosil 02', 'Energi Fosil'),
(358, 'Fosil 01', 'Energi Fosil'),
(365, 'B-3. 04', 'LPKSF'),
(366, 'B-3. 03', 'LPKSF'),
(367, 'B-3. 02	', 'Tek. Kelistrikan'),
(368, 'B-3. 01', 'Tek. Kelistrikan'),
(369, 'B-1.2.03', 'Bagian Umum'),
(370, 'B-1.2.02', 'Bagian Umum'),
(371, 'B-1.2.01', 'Bagian Umum'),
(372, 'B-1.2. 03', 'Bagian Umum'),
(373, 'B-1.2. 02', 'Bagian Umum'),
(374, '	B-1.2. 01', 'Bagian Umum'),
(375, 'B-1.1.03', 'Bagian Umum'),
(376, 'B-1.1.02', 'Bagian Umum'),
(377, 'B-1.1.01', 'Bagian Umum'),
(378, 'B-1.1. 03', 'Bagian Umum'),
(379, 'B-1.1. 02', 'Bagian Umum'),
(380, 'B-1.1. 01	', 'Bagian Umum'),
(381, 'B-1.1 03', 'Bagian Umum'),
(382, 'B-1.1 02', 'Bagian Umum'),
(383, 'B-1.1 01', 'Bagian Umum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(350) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `akses` enum('administrator','pegawai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `nip`, `akses`) VALUES
(1, 'adminarsip', '$2y$10$7sXsRJsIzSNyNPADmEK7KeXWijuVaytZaBPtnu4oYrRdeZQBHwuaG', 'adminarsip', '-', 'administrator');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `arsip_dokumen`
--
ALTER TABLE `arsip_dokumen`
  ADD PRIMARY KEY (`id_arsip_dokumen`);

--
-- Indeks untuk tabel `bidang`
--
ALTER TABLE `bidang`
  ADD PRIMARY KEY (`id_bidang`);

--
-- Indeks untuk tabel `kode_arsip`
--
ALTER TABLE `kode_arsip`
  ADD PRIMARY KEY (`id_kode_arsip`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `arsip_dokumen`
--
ALTER TABLE `arsip_dokumen`
  MODIFY `id_arsip_dokumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT untuk tabel `bidang`
--
ALTER TABLE `bidang`
  MODIFY `id_bidang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `kode_arsip`
--
ALTER TABLE `kode_arsip`
  MODIFY `id_kode_arsip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=384;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `coba_mahasiswa`
--
CREATE DATABASE IF NOT EXISTS `coba_mahasiswa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coba_mahasiswa`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `nim` bigint(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(25) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`nim`, `nama`, `kelas`, `jenis_kelamin`, `alamat`) VALUES
(201011402126, 'Myra Stevenson', '03TPLP016', 'Laki-Laki', 'Ap #334-939 Sem Road'),
(201011402127, 'Marcia Washington', '03TPLP016', 'Perempuan', 'Ap #125-3163 In Ave'),
(201011402128, 'Maris Salazar', '03TPLP016', 'Laki-Laki', '733-8788 Aliquet Road'),
(201011402129, 'Eve Foreman', '03TPLP016', 'Laki-Laki', 'Ap #527-3458 Scelerisque Rd.'),
(201011402130, 'Jenette Peck', '03TPLP016', 'Laki-Laki', 'Ap #503-7172 Mus. Road'),
(201011402131, 'Halee Blackburn', '03TPLP016', 'Laki-Laki', 'Ap #548-5127 Turpis Rd.'),
(201011402132, 'Eugenia Pennington', '03TPLP016', 'Laki-Laki', '767-4138 A, Road'),
(201011402133, 'Melissa Nixon', '03TPLP016', 'Laki-Laki', '597-8661 Adipiscing Street'),
(201011402134, 'Keith Downs', '03TPLP016', 'Laki-Laki', 'P.O. Box 108, 1754 Augue. Av.'),
(201011402135, 'Anika Valenzuela', '03TPLP016', 'Laki-Laki', 'P.O. Box 240, 1448 Orci St.'),
(201011402136, 'Chloe Turner', '03TPLP016', 'Laki-Laki', '525-3508 Non, St.'),
(201011402137, 'Timon Frank', '03TPLP016', 'Laki-Laki', 'Ap #175-2729 Auctor Av.'),
(201011402138, 'Shannon Fulton', '03TPLP016', 'Laki-Laki', 'Ap #581-3068 Iaculis Street'),
(201011402139, 'Keaton Mccormick', '03TPLP016', 'Laki-Laki', '547-3306 Vestibulum Rd.'),
(201011402140, 'Lionel Boyle', '03TPLP016', 'Laki-Laki', 'Ap #250-4760 Purus, Road'),
(201011402141, 'Rosalyn Goff', '03TPLP016', 'Laki-Laki', 'Ap #801-5419 Ligula Street'),
(201011402142, 'Olivia Farrell', '03TPLP016', 'Laki-Laki', '7757 Libero. St.'),
(201011402143, 'Theodore Whitley', '03TPLP016', 'Laki-Laki', 'P.O. Box 739, 4406 Ac Av.'),
(201011402144, 'Autumn Castro', '03TPLP016', 'Laki-Laki', '5302 A Avenue'),
(201011402145, 'Ross Roy', '03TPLP016', 'Laki-Laki', '8434 Dictum Street'),
(201011402146, 'Quyn Jordan', '03TPLP016', 'Laki-Laki', 'Ap #847-9180 Sed Ave'),
(201011402147, 'Kimberley Watkins', '03TPLP016', 'Laki-Laki', 'Ap #510-6457 Et, Ave'),
(201011402148, 'Baxter Lang', '03TPLP016', 'Laki-Laki', 'P.O. Box 369, 4614 Risus. Ave'),
(201011402149, 'Martin Deleon', '03TPLP016', 'Laki-Laki', 'P.O. Box 799, 8342 Tincidunt, Rd.'),
(201011402150, 'Sarah Buck', '03TPLP016', 'Laki-Laki', '194-1689 Sagittis St.'),
(201011402151, 'Ira Mcneil', '03TPLP016', 'Laki-Laki', 'Ap #135-5016 Enim Street'),
(201011402152, 'Fitzgerald Clark', '03TPLP016', 'Laki-Laki', 'P.O. Box 702, 1772 Nunc Avenue'),
(201011402153, 'Neve Velazquez', '03TPLP016', 'Laki-Laki', '635-5046 Eleifend Rd.'),
(201011402154, 'Rose Hinton', '03TPLP016', 'Laki-Laki', 'Ap #961-136 Aliquam Road'),
(201011402155, 'Illiana Hebert', '03TPLP016', 'Laki-Laki', '812-3547 Nonummy Av.'),
(201011402156, 'Molly Cross', '03TPLP016', 'Laki-Laki', '753-9585 Consectetuer St.'),
(201011402157, 'Stephen Hensley', '03TPLP016', 'Laki-Laki', '8256 Dolor Ave'),
(201011402158, 'Mark Koch', '03TPLP016', 'Laki-Laki', '363-404 Nulla Ave'),
(201011402159, 'Mira Whitfield', '03TPLP016', 'Laki-Laki', '4623 Mauris St.'),
(201011402160, 'Chastity Deleon', '03TPLP016', 'Laki-Laki', '7330 Consequat Ave'),
(201011402161, 'Erich Petersen', '03TPLP016', 'Laki-Laki', '396-9403 Penatibus Ave'),
(201011402162, 'Kasper Crosby', '03TPLP016', 'Laki-Laki', '319-1467 Ornare Av.'),
(201011402163, 'Timothy Holland', '03TPLP016', 'Laki-Laki', '891-4936 Ligula. St.'),
(201011402164, 'Leonard Smith', '03TPLP016', 'Laki-Laki', 'Ap #194-1855 Augue Rd.'),
(201011402165, 'Flynn Bird', '03TPLP016', 'Laki-Laki', 'P.O. Box 563, 2685 Urna St.'),
(201011402166, 'Jamalia Frank', '03TPLP016', 'Laki-Laki', 'Ap #634-3716 Integer Avenue'),
(201011402167, 'Eve Reilly', '03TPLP016', 'Laki-Laki', '796-5964 Consectetuer St.'),
(201011402168, 'Tiger Freeman', '03TPLP016', 'Laki-Laki', 'P.O. Box 629, 2185 Vitae Road'),
(201011402169, 'Hamish Holman', '03TPLP016', 'Laki-Laki', 'Ap #463-5740 Dictum Ave'),
(201011402170, 'Ainsley Barron', '03TPLP016', 'Laki-Laki', '966-9830 Cursus. St.'),
(201011402171, 'Darryl Sellers', '03TPLP016', 'Laki-Laki', 'Ap #751-8090 Ut Ave'),
(201011402172, 'Brenden Horton', '03TPLP016', 'Laki-Laki', '1363 Ornare, Road'),
(201011402173, 'Signe Kidd', '03TPLP016', 'Laki-Laki', 'Ap #362-7078 Diam Ave'),
(201011402174, 'Isaiah Cummings', '03TPLP016', 'Laki-Laki', 'Ap #129-7295 Pulvinar Rd.'),
(201011402175, 'Kieran Langley', '03TPLP016', 'Laki-Laki', 'Ap #473-7667 Mauris Road'),
(201011402176, 'Walker Guzman', '03TPLP016', 'Laki-Laki', '4648 Amet, Rd.'),
(201011402177, 'Zephania George', '03TPLP016', 'Laki-Laki', 'Ap #670-7116 Eget Ave'),
(201011402178, 'Barbara Brewer', '03TPLP016', 'Laki-Laki', 'P.O. Box 275, 9097 Eu, Road'),
(201011402179, 'Seth Rasmussen', '03TPLP016', 'Laki-Laki', '6937 Sit Av.'),
(201011402180, 'Tarik Mullins', '03TPLP016', 'Laki-Laki', '228-8195 Ut Ave'),
(201011402181, 'Hamish Pacheco', '03TPLP016', 'Laki-Laki', 'P.O. Box 131, 1535 Cursus Rd.'),
(201011402182, 'Walter Baker', '03TPLP016', 'Laki-Laki', '3970 Aenean Av.'),
(201011402183, 'Carol Holt', '03TPLP016', 'Laki-Laki', '6331 Ipsum. Av.'),
(201011402184, 'Imelda Mills', '03TPLP016', 'Laki-Laki', '260-3518 Orci Avenue'),
(201011402185, 'Dean Gates', '03TPLP016', 'Laki-Laki', '552-872 Sit Rd.'),
(201011402186, 'Athena Moody', '03TPLP016', 'Laki-Laki', 'P.O. Box 722, 9663 Pede St.'),
(201011402187, 'Nash Kent', '03TPLP016', 'Laki-Laki', '9405 Tristique Av.'),
(201011402188, 'Fitzgerald Fisher', '03TPLP016', 'Laki-Laki', '504-7183 Nam Avenue'),
(201011402189, 'Ainsley Pickett', '03TPLP016', 'Laki-Laki', '7266 In Rd.'),
(201011402190, 'Madison Warren', '03TPLP016', 'Laki-Laki', 'Ap #929-7473 Leo, Road'),
(201011402191, 'Stuart Hood', '03TPLP016', 'Laki-Laki', '2913 A, Avenue'),
(201011402192, 'Simone Ryan', '03TPLP016', 'Laki-Laki', 'Ap #887-1732 Dolor Rd.'),
(201011402193, 'Amy Marquez', '03TPLP016', 'Laki-Laki', '917-7451 Sagittis. St.'),
(201011402194, 'Damian Mccormick', '03TPLP016', 'Laki-Laki', '6312 Nullam Avenue'),
(201011402195, 'Harper Burke', '03TPLP016', 'Laki-Laki', '783-202 Metus. Ave'),
(201011402196, 'Kyla Gomez', '03TPLP016', 'Laki-Laki', 'Ap #427-6042 Sit Road'),
(201011402197, 'Henry Hutchinson', '03TPLP016', 'Laki-Laki', 'Ap #782-642 Pede, Road'),
(201011402198, 'Adria Gibson', '03TPLP016', 'Laki-Laki', '447-5343 Dis Avenue'),
(201011402199, 'Charissa Thomas', '03TPLP016', 'Laki-Laki', 'Ap #699-1136 Elit, St.'),
(201011402200, 'Nelle Pitts', '03TPLP016', 'Laki-Laki', 'Ap #150-1471 Nunc, Ave'),
(201011402201, 'Sonia Malone', '03TPLP016', 'Laki-Laki', '244-3196 A Ave'),
(201011402202, 'Nina Jackson', '03TPLP016', 'Laki-Laki', 'P.O. Box 576, 8760 Quam Rd.'),
(201011402203, 'Kareem Houston', '03TPLP016', 'Laki-Laki', '599-230 Vivamus Av.'),
(201011402204, 'Carlos Rich', '03TPLP016', 'Laki-Laki', 'P.O. Box 553, 1948 Eget St.'),
(201011402205, 'Branden Mckee', '03TPLP016', 'Laki-Laki', '821-2242 Tincidunt Rd.'),
(201011402206, 'Yoko Barr', '03TPLP016', 'Laki-Laki', 'Ap #192-8254 Enim, Ave'),
(201011402207, 'James Donovan', '03TPLP016', 'Laki-Laki', '4317 Et Ave'),
(201011402208, 'Kieran Sykes', '03TPLP016', 'Laki-Laki', '110 Mus. St.'),
(201011402209, 'Cynthia Quinn', '03TPLP016', 'Laki-Laki', 'P.O. Box 111, 3216 Ornare Street'),
(201011402210, 'Henry Vaughan', '03TPLP016', 'Laki-Laki', '319-3609 Porta St.'),
(201011402211, 'Aristotle Ewing', '03TPLP016', 'Laki-Laki', '773-1297 Libero. Avenue'),
(201011402212, 'Oliver Fox', '03TPLP016', 'Laki-Laki', 'Ap #889-1016 Erat Ave'),
(201011402213, 'Carter Wallace', '03TPLP016', 'Laki-Laki', 'P.O. Box 831, 8066 Aliquam St.'),
(201011402214, 'Keaton England', '03TPLP016', 'Laki-Laki', '8438 Id Ave'),
(201011402215, 'Reece Coleman', '03TPLP016', 'Laki-Laki', 'P.O. Box 645, 1171 Arcu Ave'),
(201011402216, 'Lacota Peters', '03TPLP016', 'Laki-Laki', '605-196 Velit Rd.'),
(201011402217, 'Andrew Cross', '03TPLP016', 'Laki-Laki', 'Ap #432-5714 Et St.'),
(201011402218, 'Brett Russo', '03TPLP016', 'Laki-Laki', 'Ap #853-2294 Arcu. St.'),
(201011402219, 'April Tran', '03TPLP016', 'Laki-Laki', 'P.O. Box 560, 9305 Turpis St.'),
(201011402220, 'Oren Fletcher', '03TPLP016', 'Laki-Laki', 'P.O. Box 520, 6150 Odio. St.'),
(201011402221, 'Mara Barber', '03TPLP016', 'Laki-Laki', 'Ap #419-5347 Maecenas Avenue'),
(201011402222, 'Audra Parrish', '03TPLP016', 'Laki-Laki', 'P.O. Box 153, 1194 Magna. Ave'),
(201011402223, 'Rashad Bray', '03TPLP016', 'Laki-Laki', '527-5033 Vehicula Avenue'),
(201011402224, 'Rinah Briggs', '03TPLP016', 'Laki-Laki', 'Ap #163-4200 Purus, Avenue'),
(201011402225, 'Dale Galloway', '03TPLP016', 'Laki-Laki', 'Ap #348-9204 Et, Streetd');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`nim`);
--
-- Database: `credits`
--
CREATE DATABASE IF NOT EXISTS `credits` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `credits`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `credits`
--

CREATE TABLE `credits` (
  `id_credit` int(11) NOT NULL,
  `asset` varchar(100) NOT NULL,
  `creator` varchar(100) NOT NULL,
  `date_created` int(11) NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `credits`
--

INSERT INTO `credits` (`id_credit`, `asset`, `creator`, `date_created`, `id_type`) VALUES
(1, 'music_zapsplat_mr_jelly | BGM', 'zapsplat.com', 1651671014, 2),
(4, 'zapsplat_cartoon_click_pop_single_75392 | Positive Button', 'zapsplat.com', 1651673269, 3),
(5, 'zapsplat_multimedia_game_sound_fun_magic_game_positive_event_notification_002_61005 | Start Game', 'zapsplat.com', 1651673890, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `type`
--

INSERT INTO `type` (`id_type`, `type`) VALUES
(1, 'assets'),
(2, 'bgm'),
(3, 'sfx');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id_credit`),
  ADD KEY `id_type` (`id_type`);

--
-- Indeks untuk tabel `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `credits`
--
ALTER TABLE `credits`
  MODIFY `id_credit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `hako_lab`
--
CREATE DATABASE IF NOT EXISTS `hako_lab` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hako_lab`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `articles`
--

CREATE TABLE `articles` (
  `id_articles` int(11) NOT NULL,
  `title_articles` varchar(100) NOT NULL,
  `content_articles` text NOT NULL,
  `img_articles` text NOT NULL,
  `time_articles` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `games`
--

CREATE TABLE `games` (
  `id_games` int(11) NOT NULL,
  `title_games` varchar(100) NOT NULL,
  `description_games` text NOT NULL,
  `url_games` text NOT NULL,
  `img_games` text NOT NULL,
  `is_active` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `games`
--

INSERT INTO `games` (`id_games`, `title_games`, `description_games`, `url_games`, `img_games`, `is_active`) VALUES
(4, 'Yumiko Adventure 3D', 'Game yang penuh dengan aksi seperti berlari, menaiki tangga, menghindari musuh, mendapatkan buah spesial, dan ada boss yang menunggumu untuk setiap kelipatan 5 level. Selain itu, game ini juga menyuguhkan pemandangan yang belum pernah kamu lihat sebelumnya. Ada banyak rintangan yang mungkin tidak bisa Anda taklukkan.', 'https://play.google.com/store/apps/details?id=com.HakoLab.YumikoAdventure3D', '1638947465Yumiko.png', 1),
(5, 'Move the Shape', 'Permainan tentang teka-teki dengan menggerakan beberapa bentuk ke tempatnya untuk menyelesaikan sebuah permainan dengan banyak rintangan.', 'https://play.google.com/store/apps/details?id=com.game.fallingpuzzle', '16389521125.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id_roles`, `role_name`) VALUES
(1, 'administrator'),
(2, 'operator'),
(3, 'content_writer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `id_roles` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_users`, `username`, `password`, `id_roles`, `is_active`) VALUES
(1, 'admin', '$2y$10$0hp7xcZbXNaNYPqEo00JpO5PfDCPz5g7XgkR1CV4Ykbc3TdtiQ3AS', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_articles`);

--
-- Indeks untuk tabel `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id_games`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`),
  ADD KEY `id_roles` (`id_roles`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `articles`
--
ALTER TABLE `articles`
  MODIFY `id_articles` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `games`
--
ALTER TABLE `games`
  MODIFY `id_games` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kamar`
--

CREATE TABLE `jenis_kamar` (
  `id_jenis_kamar` int(11) NOT NULL,
  `jenis_kamar` varchar(100) NOT NULL,
  `harga_jenis_kamar` int(11) NOT NULL,
  `jml_jenis_kamar` int(11) NOT NULL,
  `foto_jenis_kamar` text NOT NULL,
  `video_jenis_kamar` text NOT NULL,
  `is_active_jenis_kamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_kamar`
--

INSERT INTO `jenis_kamar` (`id_jenis_kamar`, `jenis_kamar`, `harga_jenis_kamar`, `jml_jenis_kamar`, `foto_jenis_kamar`, `video_jenis_kamar`, `is_active_jenis_kamar`) VALUES
(4, 'Standar', 100000, 5, '16390687133.jpg', '16390606811.mp4', 1),
(5, 'Deluxe', 750000, 5, '16390687001.jpg', '16390606811.mp4', 1),
(6, 'Eksekutif', 1250000, 5, '16390687072.jpg', '16390606811.mp4', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `nama_pemesanan` varchar(100) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `nik` varchar(20) NOT NULL,
  `id_jenis_kamar` int(11) NOT NULL,
  `tgl_pemesanan` int(11) NOT NULL,
  `durasi_menginap` int(11) NOT NULL,
  `breakfast` int(11) NOT NULL,
  `total_pembayaran` int(11) NOT NULL,
  `no_kamar` int(11) NOT NULL,
  `is_active_pemesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `nama_pemesanan`, `jenis_kelamin`, `nik`, `id_jenis_kamar`, `tgl_pemesanan`, `durasi_menginap`, `breakfast`, `total_pembayaran`, `no_kamar`, `is_active_pemesanan`) VALUES
(1, 'Andri Firman Saputra', 'pria', '3674072901021001', 4, 1639100688, 4, 1, 680000, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(300) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `is_active_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_lengkap`, `is_active_user`) VALUES
(1, 'admin', '$2y$10$vb98X5xB3wipROu0kzb0xeaUFW1BRHhCQYN3ew8oEMDt4fzi26Aie', 'Admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_kamar`
--
ALTER TABLE `jenis_kamar`
  ADD PRIMARY KEY (`id_jenis_kamar`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_jenis_kamar` (`id_jenis_kamar`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_kamar`
--
ALTER TABLE `jenis_kamar`
  MODIFY `id_jenis_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data untuk tabel `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"uas_andri_spbu\",\"table\":\"kendaraan\"},{\"db\":\"uas_andri_spbu\",\"table\":\"karyawan\"},{\"db\":\"uas_andri_spbu\",\"table\":\"transaksi_pengisian\"},{\"db\":\"hako_lab\",\"table\":\"games\"},{\"db\":\"hotel\",\"table\":\"jenis_kamar\"},{\"db\":\"db_mahasiswa\",\"table\":\"tbl_mahasiswa\"},{\"db\":\"credits\",\"table\":\"credits\"}]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data untuk tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-07-15 14:15:59', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"id\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeks untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeks untuk tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeks untuk tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeks untuk tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeks untuk tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeks untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeks untuk tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeks untuk tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeks untuk tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeks untuk tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `resensi_film_andri`
--
CREATE DATABASE IF NOT EXISTS `resensi_film_andri` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `resensi_film_andri`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_film`
--

CREATE TABLE `tb_film` (
  `id_film` int(10) NOT NULL,
  `nama_film` varchar(100) NOT NULL,
  `tahun_film` int(4) NOT NULL,
  `sutradara_film` varchar(100) NOT NULL,
  `cover_film` text NOT NULL,
  `rating_film` float NOT NULL,
  `tanggal_diposting` int(11) NOT NULL,
  `id_genre` int(10) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_film`
--

INSERT INTO `tb_film` (`id_film`, `nama_film`, `tahun_film`, `sutradara_film`, `cover_film`, `rating_film`, `tanggal_diposting`, `id_genre`, `id_user`) VALUES
(1, 'Avenger', 2019, 'Anthony Russo dan Joe Russo', '08042020104652.png', 8.4, 1590495796, 1, 1),
(2, 'Mr. Beans Holiday', 2007, 'Steve Bendelack', '08042020154003.png', 6.4, 1652461011, 2, 1),
(3, 'Bean', 1997, 'Mel Smith', '08042020154348.png', 6.5, 1590495796, 2, 1),
(4, 'Spiderman: Far From Home', 2019, 'Jon Watts', '08042020154655.png', 7.5, 1590495796, 1, 1),
(5, 'Insidious', 2010, 'James Wan', '08042020155915.png', 6.8, 1652460975, 3, 1),
(6, 'Inspector Gadget', 1999, 'David Kellogg', '08042020160106.png', 4.1, 1652460991, 2, 1),
(7, 'The Conjuring', 2013, 'James Wan', '08042020160311.png', 7.5, 1652461073, 3, 1),
(8, 'Furious 7', 2015, 'James Wan', '08042020160519.png', 7.2, 1590495796, 1, 1),
(9, 'Batman v Superman: Dawn of Justice', 2016, 'Zack Snyder', '08042020160832.png', 6.5, 1590495796, 1, 1),
(10, 'Spies in Disguise', 2019, 'Nick Bruno Dan Troy Quane', '08042020161132.png', 6.8, 1652461063, 4, 1),
(11, 'Cars', 2006, 'John Lasseter', '08042020161335.png', 7.1, 1652460958, 4, 1),
(12, 'Miracle in Cell No. 7', 2013, 'Hwan-kyung Lee', '08042020162415.png', 8.2, 1652461000, 5, 1),
(13, 'Titanic', 1997, 'James Cameron', '08042020163414.png', 7.8, 1652461082, 5, 1),
(14, 'Sonic the Hedgehog', 2020, 'Jeff Fowler', '08042020173537.png', 6.6, 1652461041, 4, 1),
(15, 'Frozen II', 2019, 'Chris Buck Dan Jennifer Lee', '08042020173743.png', 7, 1652460965, 4, 1),
(16, 'Sherlock Holmes: A Game of Shadows', 2011, 'Guy Ritchie', '08042020174222.png', 7.5, 1652461027, 6, 1),
(17, 'Jumanji: Welcome to the Jungle', 2017, 'Jake Kasdan', '08042020210238.png', 6.9, 1590495796, 7, 1),
(18, 'Annihilation', 2018, 'Alex Garland', '08042020210744.png', 6.9, 1590495796, 7, 1),
(19, 'Harry Potter and the Prisoner of Azkaban', 2004, 'Alfonso Cuaron', '08042020211039.png', 7.9, 1590495796, 7, 1),
(20, 'Indiana Jones and the Last Crusade', 1989, 'Steven Spielberg', '08042020211241.png', 8.2, 1590495796, 7, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_genre`
--

CREATE TABLE `tb_genre` (
  `id_genre` int(10) NOT NULL,
  `nama_genre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_genre`
--

INSERT INTO `tb_genre` (`id_genre`, `nama_genre`) VALUES
(1, 'Aksi'),
(2, 'Komedi'),
(3, 'Horor'),
(4, 'Animasi'),
(5, 'Drama'),
(6, 'Petualangan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_komentar`
--

CREATE TABLE `tb_komentar` (
  `id_komentar` int(10) NOT NULL,
  `nama_komentar` varchar(50) NOT NULL,
  `isi_komentar` text NOT NULL,
  `tanggal_komentar` int(11) NOT NULL,
  `id_film` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_komentar`
--

INSERT INTO `tb_komentar` (`id_komentar`, `nama_komentar`, `isi_komentar`, `tanggal_komentar`, `id_film`) VALUES
(76, 'Alfred', 'Just one word! AMAZING', 1590495797, 6),
(77, 'Jack', 'Masi belom move on dari #AvengersEndgame, kagum ngebayangin skripnya, bisa buat film superhero rasa film festival dengan nilai-nilai humanis dan kekeluargaan yg kuat jadi pas momen dihadirkan realita yg getir atau pait pecahlah itu kantong mata. Scoringnya jg gila bgt sih!', 1590495796, 6),
(78, 'Fath Fathan', 'Yeaah, already watching Avengers Endgame this morning is cool and all... but, do you know there is something way cooler than that? Not spoiling any of its material to Internet. Enjoy your watch guys!', 1590495796, 6),
(79, 'Dwinda', 'Russo bersaudara, baru rampung menonton Avengers: Endgame, kalian membuat ini amat amat bagus, saya tak bisa menahan diri selain menangis', 1590495796, 6),
(80, 'Radile', 'sepertinya harus menjauhi media sosial beberapa hari sampai tiba waktu dimana diri ini nonton #AvengersEndgame', 1590495796, 6),
(81, 'Cahya Septyanto', 'Doaku pagi ini: Ya allah, tolong lancarkan dan mudahkan lah saya dan teman2 saya yang nanti malam akan menunaikan Avengers: Endgame. Tolong jauhkan lah kami dari Spoiler terkutuk dan orang2 reseh yg berisik ketika nonton. Dan tolong lindungilah Iron man serta Team Avenger nya,', 1590495796, 6),
(82, 'Brandon Davis', 'Avengers: Endgame adalah film yang menakjubkan dan film yang luar biasa. Saya belum pernah melihat yang seperti ini. Film ini semua yang saya mau dan LEBIH banyak lagi. Luar biasa', 1590495796, 6),
(83, 'Catey Sullivan', 'The best part of Far From Home is Samuel L. Jackson, whose Nick Fury single-handedly elevates the movie from a C to a B+.', 1590495796, 9),
(84, 'Bob Mondelo', 'The stakes this time turn out to be considerably lower, and your friendly neighborhood Spider-Teen is arguably just the guy to bring things down to Earth and reestablish a human scale.', 1590495796, 9),
(85, 'Chris Hewitt', '\r\n\r\n I like that \"Far From Home\" is trying something new and that its humor feels more real than the ironic cracks in most superhero movies. I just wish its good pieces all came together more satisfyingly. ', 1590495796, 9),
(86, 'Crishtoper', 'Not as good as the first film but well acted by Tom Holland and company. It is almost essential you have seen the last Avengers film to fully understand this film. THe villain is kinda ho hum but I enjoyed the film.\r\n', 1590495796, 9),
(87, 'Dann', 'Spider-Man hits the road in Spider-Man: Far From Home. Peter Parker European school trip is interrupted when a superhero named Mysterio, who from an alternate Earth, shows up and asked for his help to defeat an Elemental. Unfortunately, as the first post-Endgame Marvel film, Far From Home has the extra burden of resetting the Marvel Universe; which comes off as kind of awkward in this story about a high school trip. And while it does some good things with Parker dealing with the loss of his mentor (Tony Stark), theres too much Iron Man in this Spider-Man movie. A mess from start to finish (though still entertaining), Spider-Man: Far From Home is disappointing both as a MCU film and a Spider-Man film. ', 1590495796, 9),
(88, 'Paul Grimes', 'Fun, lively, high school spirit as Tom Holland is the best Spider-Man to date. No Marvel fatigue with this one. ', 1590495796, 9),
(89, 'Putri Laksmiwati', 'Filmnya seru bikin pengen nonton dua kali. Awesome pokoknya, gak sia sia mesen tiket dari jauh hari dan penantian panjang terbalas dengan film ketje ini', 1590495796, 13),
(90, 'Pangestu Simbolon', 'Overall bagus sih, tapi rasanya enak film film sebelumnya', 1590495796, 13),
(91, 'Pangestu Simbolon', 'GGWP', 1590495796, 13),
(92, 'Jhon', 'Pahlawan kok berantem :v', 1590495796, 14),
(93, 'Cena', 'Filmnya bagus gilsss. nunggu download-annya rilis. mau nonton ulang di rumah, aksinya lebih menantang ketimbang lawan vilain lain', 1590495796, 14),
(94, 'The', 'Yakali gak kuy, fans DC harus liat film ini. semoga masih kebagian tiket nonton di awal tanggal tayang. Rela nebok celengan buat beli tikenya :(', 1590495796, 14),
(95, 'Rock', 'Halah pahlawan diadu kayak gak ada drama lain aja. Penjahat stoknya abis? film kayak gini aja ditunggu. Tapi kayaknya seru, kapan lagi liat pahlawan berantem, aksinya juga kebayang bisa lebih rame. WAJIB BANGET buat nonton. Besok mesen tiketnya ah :v', 1590495796, 14),
(96, 'Rey', 'Skut', 1590495796, 14),
(97, 'Mister', 'Lagi trend banget ya pahlawan melawan pahlawan, gak DC gak Marvel', 1590495796, 14),
(98, 'Rio', 'Dim dim pak dim dim oy dim dim pak dim dim', 1590495796, 14),
(104, 'Mr', 'Kocag :v', 1590495796, 7),
(105, 'Bean', 'Gak ketebak alur ceritanya, komedinya walau absurd tapi keren. bikin keseruan sendiri wkwkw', 1590495796, 7),
(106, 'Tuan', 'Cocok nonton bareng keluarga. Family times\r\n', 1590495796, 7),
(107, 'Buncis', 'Nunggu bajakan awokokoko', 1590495796, 7),
(108, 'Mr', 'Cup 1 kata, kocag :v', 1590495796, 8),
(109, 'Bean', 'Idem sama yg bilang kocag', 1590495796, 8),
(110, 'Tuan', 'Idem', 1590495796, 8),
(111, 'Buncis', 'Idem', 1590495796, 8),
(114, 'Anonim', 'Filmnya Bagus', 1590769117, 3),
(115, 'anonimos', 'iya bener bagus', 1590769173, 3),
(116, 'Spider loverss', 'kerennnn bgttt', 1590769268, 4),
(117, 'anonim', 'GG', 1652460850, 4),
(118, 'anonim', 'Mantap', 1652460862, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_riwayat`
--

CREATE TABLE `tb_riwayat` (
  `id_riwayat` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `tindakan` text NOT NULL,
  `tanggal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_riwayat`
--

INSERT INTO `tb_riwayat` (`id_riwayat`, `id_user`, `tindakan`, `tanggal`) VALUES
(1, 1, 'Berhasil mengubah password', 1590495796),
(2, 1, 'Berhasil mengubah genre film horor', 1590496558),
(3, 1, 'Berhasil mengubah genre film Komedi', 1590496587),
(4, 1, 'Berhasil menambahkan genre film Horor', 1590496998),
(5, 1, 'Berhasil menambahkan genre film Sci-fi', 1590497050),
(6, 1, 'Berhasil menghapus genre film Sci-fi', 1590497339),
(7, 1, 'Berhasil menambahkan genre film Asd', 1590497344),
(8, 1, 'Berhasil menghapus genre film Asd', 1590497345),
(9, 1, 'Berhasil menambahkan genre film Asd', 1590497375),
(10, 1, 'Berhasil menghapus genre film Asd', 1590497376),
(11, 1, 'Berhasil menambahkan genre film Asd', 1590497394),
(12, 1, 'Berhasil menghapus genre film Asd', 1590497395),
(13, 1, 'Berhasil menambahkan genre film Asd', 1590497425),
(14, 1, 'Berhasil menghapus genre film Asd', 1590497430),
(15, 1, 'Berhasil menambahkan genre film Asd', 1590497448),
(16, 1, 'Berhasil menghapus genre film Asd', 1590497453),
(17, 1, 'Berhasil menambahkan film Avengers', 1590499150),
(18, 1, 'Berhasil menambahkan film Mr. Bean', 1590499228),
(19, 1, 'Berhasil menghapus film ', 1590499330),
(20, 1, 'Berhasil mengubah film Mr. Bean2', 1590500493),
(21, 1, 'Berhasil mengubah film Mr. Bean2', 1590500504),
(22, 1, 'Berhasil mengubah film Mr. Bean2', 1590500566),
(23, 1, 'Berhasil mengubah film Mr. Bean2', 1590500659),
(24, 1, 'Berhasil mengubah film Mr. Bean2', 1590500749),
(25, 1, 'Berhasil menambahkan film Mr. Bean\'s Holiday', 1590500981),
(26, 1, 'Berhasil mengubah film Mr. Bean\'s Holiday', 1590500996),
(27, 1, 'Berhasil mengubah film Mr. Bean\'s', 1590501009),
(28, 1, 'Berhasil mengubah film Mr. Bean', 1590501031),
(29, 1, 'Berhasil mengubah password', 1590501741),
(30, 1, 'Berhasil menghapus komentar Dettline | Film Ini Bagus', 1590636744),
(31, 1, 'Berhasil menambahkan film asd', 1590769217),
(32, 1, 'Berhasil menghapus film ', 1590769222),
(33, 1, 'Berhasil mengubah film Cars', 1652460958),
(34, 1, 'Berhasil mengubah film Frozen II', 1652460965),
(35, 1, 'Berhasil mengubah film Insidious', 1652460975),
(36, 1, 'Berhasil mengubah film Inspector Gadget', 1652460991),
(37, 1, 'Berhasil mengubah film Miracle in Cell No. 7', 1652461000),
(38, 1, 'Berhasil mengubah film Mr. Beans Holiday', 1652461011),
(39, 1, 'Berhasil mengubah film Sherlock Holmes: A Game of Shadows', 1652461027),
(40, 1, 'Berhasil mengubah film Sonic the Hedgehog', 1652461041),
(41, 1, 'Berhasil mengubah film Spies in Disguise', 1652461063),
(42, 1, 'Berhasil mengubah film The Conjuring', 1652461073),
(43, 1, 'Berhasil mengubah film Titanic', 1652461082);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `photo_profile` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama_lengkap`, `photo_profile`) VALUES
(1, 'andri123', '$2y$10$Vi80wvdPtIx1W4MWV.wtpOxaCR67S/XzRQkxOJbMknJNaFIfaJGuW', 'Andri Firman Saputra', '5eccfb7172310.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_film`
--
ALTER TABLE `tb_film`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `relasi_genre` (`id_genre`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_genre`
--
ALTER TABLE `tb_genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indeks untuk tabel `tb_komentar`
--
ALTER TABLE `tb_komentar`
  ADD PRIMARY KEY (`id_komentar`),
  ADD KEY `relasi_komentar` (`id_film`);

--
-- Indeks untuk tabel `tb_riwayat`
--
ALTER TABLE `tb_riwayat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_film`
--
ALTER TABLE `tb_film`
  MODIFY `id_film` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tb_genre`
--
ALTER TABLE `tb_genre`
  MODIFY `id_genre` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_komentar`
--
ALTER TABLE `tb_komentar`
  MODIFY `id_komentar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT untuk tabel `tb_riwayat`
--
ALTER TABLE `tb_riwayat`
  MODIFY `id_riwayat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `uang_kas`
--
CREATE DATABASE IF NOT EXISTS `uang_kas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uang_kas`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bulan_pembayaran`
--

CREATE TABLE `bulan_pembayaran` (
  `id_bulan_pembayaran` int(11) NOT NULL,
  `nama_bulan` enum('januari','februari','maret','april','mei','juni','juli','agustus','september','oktober','november','desember') NOT NULL,
  `tahun` int(4) NOT NULL,
  `pembayaran_perminggu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bulan_pembayaran`
--

INSERT INTO `bulan_pembayaran` (`id_bulan_pembayaran`, `nama_bulan`, `tahun`, `pembayaran_perminggu`) VALUES
(1, 'mei', 2022, 5000),
(2, 'juni', 2022, 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(1, 'administrator'),
(2, 'bendahara'),
(3, 'guru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `jumlah_pengeluaran` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal_pengeluaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `jumlah_pengeluaran`, `keterangan`, `tanggal_pengeluaran`, `id_user`) VALUES
(1, 20000, 'Beli Sapu 2pcs', 1652453635, 1),
(2, 15000, 'Beli Pel Lantai 1pcs', 1652453876, 1),
(3, 10000, 'Beli Wipol Pel 12pcs (1 renceng)', 1652453855, 1),
(4, 20000, 'Beli Spidol Hitam 2pcs', 1652453900, 1),
(5, 9000, 'Penghapus Papan Tulis', 1652453779, 1),
(6, 40000, 'Ember Anti Pecah', 1652453886, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat`
--

CREATE TABLE `riwayat` (
  `id_riwayat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_uang_kas` int(11) NOT NULL,
  `aksi` text NOT NULL,
  `tanggal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `riwayat`
--

INSERT INTO `riwayat` (`id_riwayat`, `id_user`, `id_uang_kas`, `aksi`, `tanggal`) VALUES
(1, 1, 2, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1611256476),
(2, 1, 2, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1611256479),
(3, 1, 2, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1611256484),
(4, 1, 2, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 4,000', 1611256488),
(5, 1, 1, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1611256492),
(6, 1, 1, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1611256495),
(7, 1, 1, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1611256500),
(8, 1, 1, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1611256504),
(9, 1, 3, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1611256508),
(10, 1, 3, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1611256512),
(11, 1, 4, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 500', 1611256518),
(12, 1, 4, 'telah mengubah pembayaran minggu ke-1 dari Rp. 500 menjadi Rp. 5,000', 1611256526),
(13, 1, 5, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1611256530),
(14, 1, 5, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1611256534),
(15, 1, 2, 'telah mengubah pembayaran minggu ke-4 dari Rp. 4,000 menjadi Rp. 3,000', 1611257026),
(16, 1, 2, 'telah mengubah pembayaran minggu ke-4 dari Rp. 3,000 menjadi Rp. 5,000', 1652453172),
(17, 1, 3, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1652453181),
(18, 1, 3, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1652453187),
(19, 1, 4, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1652453192),
(20, 1, 4, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1652453196),
(21, 1, 4, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1652453201),
(22, 1, 5, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1652453205),
(23, 1, 5, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1652453209),
(24, 1, 11, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1652453353),
(25, 1, 11, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1652453358),
(26, 1, 11, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1652453362),
(27, 1, 11, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1652453366),
(28, 2, 11, 'telah mengubah pembayaran minggu ke-4 dari Rp. 5,000 menjadi Rp. 1,000', 1652454260),
(29, 2, 11, 'telah mengubah pembayaran minggu ke-4 dari Rp. 1,000 menjadi Rp. 5,000', 1652454272);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_pengeluaran`
--

CREATE TABLE `riwayat_pengeluaran` (
  `id_riwayat_pengeluaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `aksi` text NOT NULL,
  `tanggal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `riwayat_pengeluaran`
--

INSERT INTO `riwayat_pengeluaran` (`id_riwayat_pengeluaran`, `id_user`, `aksi`, `tanggal`) VALUES
(1, 1, 'telah menambahkan pengeluaran Pembersih lantai dengan biaya Rp. 2,000', 1611256576),
(2, 1, 'telah menambahkan pengeluaran sapu x1 dengan biaya Rp. 10,000', 1611256589),
(3, 1, 'telah mengubah pengeluaran Pembersih lantai 2x dari biaya Rp. 2,000 menjadi Rp. 2,000', 1611256595),
(4, 1, 'telah mengubah pengeluaran Pembersih lantai x2 dari biaya Rp. 2,000 menjadi Rp. 2,000', 1611256599),
(5, 1, 'telah menambahkan pengeluaran Beli Sapu 2pcs dengan biaya Rp. 20,000', 1652453635),
(6, 1, 'telah menambahkan pengeluaran Beli Pel Lantai 2pcs dengan biaya Rp. 28,000', 1652453668),
(7, 1, 'telah menambahkan pengeluaran Beli Sabun Pel 12pcs (1 renceng) dengan biaya Rp. 10,000', 1652453690),
(8, 1, 'telah menambahkan pengeluaran Beli Spidol hitam 3pcs dengan biaya Rp. 30,000', 1652453749),
(9, 1, 'telah menambahkan pengeluaran Penghapus Papan Tulis dengan biaya Rp. 9,000', 1652453779),
(10, 1, 'telah mengubah pengeluaran Beli Spidol hitam 2pcs dari biaya Rp. 30,000 menjadi Rp. 20,000', 1652453803),
(11, 1, 'telah menambahkan pengeluaran Ember Anti Pecah dengan biaya Rp. 35,000', 1652453820),
(12, 1, 'telah mengubah pengeluaran Beli Wipol Pel 12pcs (1 renceng) dari biaya Rp. 10,000 menjadi Rp. 10,000', 1652453855),
(13, 1, 'telah mengubah pengeluaran Beli Pel Lantai 1pcs dari biaya Rp. 28,000 menjadi Rp. 15,000', 1652453877),
(14, 1, 'telah mengubah pengeluaran Ember Anti Pecah dari biaya Rp. 35,000 menjadi Rp. 40,000', 1652453886),
(15, 1, 'telah mengubah pengeluaran Beli Spidol Hitam 2pcs dari biaya Rp. 20,000 menjadi Rp. 20,000', 1652453900);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `no_telepon` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `jenis_kelamin`, `no_telepon`, `email`) VALUES
(1, 'Andri Firman Saputra', 'pria', '087808675313', 'andri.firman.saputra.56@gmail.com'),
(2, 'Aisyah Mawar Kusuma Salsabila', 'wanita', '085753152511', 'aisyahmawar69@gmail.com'),
(3, 'Bima Darmaja Suryatama', 'pria', '089612351520', 'bimadarmaja12@gmail.com'),
(4, 'Dzaki Rozzan', 'pria', '085712526395', 'zakiojan1@gmail.com'),
(6, 'Fariz Septiawan', 'pria', '082114523555', 'farizseptiawan8@gmail.com'),
(7, 'Rangga Ariansyah', 'pria', '0851377382722', 'ranggaariansyah77@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `uang_kas`
--

CREATE TABLE `uang_kas` (
  `id_uang_kas` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_bulan_pembayaran` int(11) NOT NULL,
  `minggu_ke_1` int(11) DEFAULT NULL,
  `minggu_ke_2` int(11) DEFAULT NULL,
  `minggu_ke_3` int(11) DEFAULT NULL,
  `minggu_ke_4` int(11) DEFAULT NULL,
  `status_lunas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `uang_kas`
--

INSERT INTO `uang_kas` (`id_uang_kas`, `id_siswa`, `id_bulan_pembayaran`, `minggu_ke_1`, `minggu_ke_2`, `minggu_ke_3`, `minggu_ke_4`, `status_lunas`) VALUES
(1, 1, 1, 5000, 5000, 5000, 5000, 1),
(2, 2, 1, 5000, 5000, 5000, 5000, 1),
(3, 3, 1, 5000, 5000, 5000, 5000, 1),
(4, 4, 1, 5000, 5000, 5000, 5000, 1),
(5, 6, 1, 5000, 5000, 5000, 5000, 1),
(6, 1, 2, 0, 0, 0, 0, 0),
(7, 2, 2, 0, 0, 0, 0, 0),
(8, 3, 2, 0, 0, 0, 0, 0),
(9, 4, 2, 0, 0, 0, 0, 0),
(10, 6, 2, 0, 0, 0, 0, 0),
(11, 7, 1, 5000, 5000, 5000, 5000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `username`, `password`, `id_jabatan`) VALUES
(1, 'Andri Firman Saputra', 'andri123', '$2y$10$RtlG8gY2cp/2BYEeMBJ2C.tMli1qvWGCoT/jkKIZVNrRJ/4cGbbTm', 1),
(2, 'Aisyah Mawar Kusuma Salsabila', 'aisyah123', '$2y$10$fdeYDCtDbXiGEQGLtbiAgOjZe240BbZJfVZK.61cItcJ/VZqO.f4.', 2),
(3, 'Annisa Fatimah, S.Kom', 'annisa321', '$2y$10$1G9mvmbcbdwjdqCb1EuG5OGAYNhPa1aOmlmd2yS2/Yz.A3HRS/u5u', 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bulan_pembayaran`
--
ALTER TABLE `bulan_pembayaran`
  ADD PRIMARY KEY (`id_bulan_pembayaran`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_uang_kas` (`id_uang_kas`);

--
-- Indeks untuk tabel `riwayat_pengeluaran`
--
ALTER TABLE `riwayat_pengeluaran`
  ADD PRIMARY KEY (`id_riwayat_pengeluaran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `uang_kas`
--
ALTER TABLE `uang_kas`
  ADD PRIMARY KEY (`id_uang_kas`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_bulan_pembayaran` (`id_bulan_pembayaran`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bulan_pembayaran`
--
ALTER TABLE `bulan_pembayaran`
  MODIFY `id_bulan_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `riwayat_pengeluaran`
--
ALTER TABLE `riwayat_pengeluaran`
  MODIFY `id_riwayat_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `uang_kas`
--
ALTER TABLE `uang_kas`
  MODIFY `id_uang_kas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `zona_lapor`
--
CREATE DATABASE IF NOT EXISTS `zona_lapor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `zona_lapor`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `kecamatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kecamatan`
--

INSERT INTO `kecamatan` (`id_kecamatan`, `kecamatan`) VALUES
(1, 'Ciputat'),
(2, 'Ciputat Timur'),
(3, 'Pamulang'),
(4, 'Pondok Aren'),
(5, 'Serpong'),
(6, 'Serpong Utara'),
(7, 'Setu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelurahan`
--

CREATE TABLE `kelurahan` (
  `id_kelurahan` int(11) NOT NULL,
  `kelurahan` varchar(100) NOT NULL,
  `id_kecamatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelurahan`
--

INSERT INTO `kelurahan` (`id_kelurahan`, `kelurahan`, `id_kecamatan`) VALUES
(1, 'Ciputat', 1),
(2, 'Cipayung', 1),
(3, 'Serua', 1),
(4, 'Sawah Lama', 1),
(5, 'Sawah Baru', 1),
(6, 'Serua Indah', 1),
(7, 'Jombang', 1),
(8, 'Rengas', 2),
(9, 'Rempoa', 2),
(10, 'Cireundeu', 2),
(11, 'Pondok Ranji', 2),
(12, 'Cempaka Putih', 2),
(13, 'Pisangan', 2),
(14, 'Pondok Benda', 3),
(15, 'Benda Baru', 3),
(16, 'Bambu Apus', 3),
(17, 'Kedaung', 3),
(18, 'Pamulang Barat', 3),
(19, 'Pamulang Timur', 3),
(20, 'Pondok Cabe Udik', 3),
(21, 'Pondok Cabe Ilir', 3),
(22, 'Jurang Mangu Barat', 4),
(23, 'Jurang Mangu Timur', 4),
(24, 'Pondok Kacang Timur', 4),
(25, 'Pondok Kacang Barat', 4),
(26, 'Perigi Lama', 4),
(27, 'Perigi Baru', 4),
(28, 'Pondok Aren', 4),
(29, 'Pondok Karya', 4),
(30, 'Pondok Jaya', 4),
(31, 'Pondok Betung', 4),
(32, 'Pondok Pucung', 4),
(33, 'Buaran', 5),
(34, 'Ciater', 5),
(35, 'Cilenggang', 5),
(36, 'Lengkong Gudang', 5),
(37, 'Lengkong Gudang Timur', 5),
(38, 'Lengkong Wetan', 5),
(39, 'Rawa Buntu', 5),
(40, 'Rawa Mekar Jaya', 5),
(41, 'Serpong', 5),
(42, 'Jelupang', 6),
(43, 'Lengkong Karya', 6),
(44, 'Pakualam', 6),
(45, 'Pakulonan', 6),
(46, 'Paku Jaya', 6),
(47, 'Pondok Jagung', 6),
(48, 'Pondok Jagung Timur', 6),
(49, 'Setu', 7),
(50, 'Keranggan', 7),
(51, 'Muncul', 7),
(52, 'Babakan', 7),
(53, 'Bakti Jaya', 7),
(54, 'Kademangan', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `isi_log` text NOT NULL,
  `tgl_log` datetime NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `id_masyarakat` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`id_masyarakat`, `nama`, `username`, `password`, `no_telepon`, `alamat`) VALUES
(1, 'Andre Farhan Saputra', 'andre123', '$2y$10$np0VReX.hpfpyfGZMB61keaDNoe14ZSzZ9mAP0Zql6mSQuCYfWOla', '087733932416', 'Jl. AMD Babakan Pocis No. 100 RT02/02'),
(2, 'Muhammad Irgi Al Ghithraf', 'irgi5', '$2y$10$51l3fVtvtoUTkuv8NajfjOaWxP7Y/T8Re2LMjmvciuQ0y2a5jgE3e', '085773094859', 'Perum Puri Serpong 1 Blok D5 No. 7 RT 08/02 Setu, Setu, Tangerang Selatan, Banten'),
(3, 'Ableza Melani Putri', 'ableza24', '$2y$10$xiVl2xqkEMAUvj3h2fnUeeuMnt.dxrHIO0m5jgEREujFQAYH1c1zG', '089677646147', 'JL. AMD Babakan Pocis No. 7 RT 02/01 Bakti Jaya Setu Kota Tangerang Selatan'),
(4, 'Annisa Ulazijah Faqih', 'annisa98', '$2y$10$K287REWLi5fn/pCmi90HTumNG2DiwAPjxsGWvx5oDTbhK3aolTBqC', '087808564812', 'Kp. Jaletreng No. 41 RT 03/03 Serpong, Serpong'),
(5, 'Azzaura', 'azzaura56', '$2y$10$5AZT/bsxiJQ/YcrCou.U2.Hun0o3s9aH6do73f01Tm8IZwH/udx/W', '085212984453', 'Perum Griya Cendekia No. 17 RT 05/06, Curug, Gunung Sindur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `isi_laporan` text NOT NULL,
  `tgl_pengaduan` datetime NOT NULL,
  `foto` varchar(500) DEFAULT 'default.png',
  `status_pengaduan` enum('belum_ditanggapi','proses','valid','pengerjaan','selesai','tidak_valid') NOT NULL DEFAULT 'belum_ditanggapi',
  `id_masyarakat` int(11) NOT NULL,
  `id_kelurahan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `isi_laporan`, `tgl_pengaduan`, `foto`, `status_pengaduan`, `id_masyarakat`, `id_kelurahan`) VALUES
(1, 'Telepon Umum rusak di daerah Bakti Jaya', '2021-07-04 11:57:52', '1604499518_image.png', 'selesai', 1, 53),
(2, 'Jembatan antar desa rusak, di daerah Rawa buntu', '2021-07-04 13:06:00', 'jembatan_rusak.jpg', 'selesai', 2, 39),
(3, 'Jalan di daerah pocis, bakti jaya, rusak parah. \r\nTerimakasih.', '2021-07-06 10:01:05', 'jalan-rusak.jpg', 'selesai', 3, 53),
(4, 'Tanah longsor, daerah Serpong dekat Pesantren Hidayatullah Yayasan Al- Firdaus', '2021-07-07 08:22:12', 'IMG-20190808-WA0074.jpg', 'valid', 4, 41);

-- --------------------------------------------------------

--
-- Struktur dari tabel `saran`
--

CREATE TABLE `saran` (
  `id_saran` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `saran` text NOT NULL,
  `tgl_saran` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `isi_tanggapan` text NOT NULL,
  `tgl_tanggapan` datetime NOT NULL,
  `status_tanggapan` enum('proses','valid','pengerjaan','selesai','tidak_valid') NOT NULL,
  `foto_tanggapan` varchar(500) NOT NULL DEFAULT 'default.png',
  `id_pengaduan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `isi_tanggapan`, `tgl_tanggapan`, `status_tanggapan`, `foto_tanggapan`, `id_pengaduan`, `id_user`) VALUES
(1, 'Baik laporan Anda kami proses', '2021-07-05 08:58:34', 'proses', 'default.png', 1, 1),
(2, 'Laporan Anda valid, segera kami perbaiki', '2021-07-05 14:17:35', 'valid', '16044995182.png', 1, 1),
(3, 'Dalam pengerjaan', '2021-07-05 15:05:58', 'pengerjaan', 'default.png', 1, 1),
(4, 'Sudah selesai kami perbaiki.', '2021-07-06 08:01:14', 'selesai', 'telepon-umum-koin.jpg', 1, 1),
(5, 'Baik kami segera mengecek ke TKP.', '2021-07-05 08:12:00', 'proses', 'default.png', 2, 2),
(6, 'Laporan Anda valid, segera kami perbaiki.', '2021-07-05 11:16:22', 'valid', 'default.png', 2, 2),
(7, 'dalam pengerjaan', '2021-07-06 09:03:00', 'pengerjaan', 'default.png', 2, 2),
(8, 'Jembatan sudah selesai diperbaiki.', '2021-07-08 10:18:06', 'selesai', '015117800_1608202742-20201217_153411.jpg', 2, 2),
(9, 'Baik segera kami proses.', '2021-07-06 12:01:49', 'proses', 'default.png', 3, 2),
(10, 'Laporan Anda valid.', '2021-07-07 08:03:14', 'valid', '8-Tips-Saat-Menemui-Jalan-Yang-Rusak.jpg', 3, 2),
(11, 'Jalan sedang dalam pengerjaan untuk diperbaiki.', '2021-07-07 12:04:08', 'pengerjaan', 'perbaikan-jalan-bergelomban.jpg', 3, 2),
(12, 'Jalanan selesai diperbaiki.', '2021-07-07 16:23:06', 'selesai', 'proyek-pengaspalan-jalan-ciater-tangsel-jadi-sorotan-begini-proses-tendernya-cmh.jpg', 3, 2),
(13, 'Baik, laporan Anda segera kami proses.', '2021-07-07 15:50:00', 'proses', 'default.png', 4, 1),
(14, 'Laporan Anda valid, segera kami tangani.', '2021-07-08 09:10:13', 'valid', '5dfb1d22217f0.jpg', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `jabatan` enum('administrator','operator') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `no_telepon`, `jabatan`) VALUES
(1, 'Administrator', 'admin', '$2y$10$L201Eud0B8zkRfT9wOctFeK1LSJWFxwDV8He41JDk4ggRLUb9aIC6', '08123456789', 'administrator'),
(2, 'Andri Firman Saputra', 'andri123', '$2y$10$NbEgBbEr.Di9DwIo/OoXZOefgH7v/zQNxdLPleaJWZTQ7kKQbOCEa', '087808675313', 'operator');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indeks untuk tabel `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`id_kelurahan`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indeks untuk tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`id_masyarakat`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD KEY `id_masyarakat` (`id_masyarakat`),
  ADD KEY `id_kelurahan` (`id_kelurahan`);

--
-- Indeks untuk tabel `saran`
--
ALTER TABLE `saran`
  ADD PRIMARY KEY (`id_saran`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_pengaduan` (`id_pengaduan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `kelurahan`
--
ALTER TABLE `kelurahan`
  MODIFY `id_kelurahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  MODIFY `id_masyarakat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `saran`
--
ALTER TABLE `saran`
  MODIFY `id_saran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
