-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jun 2022 pada 11.29
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logistik_restoran`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan_pokok`
--

CREATE TABLE `bahan_pokok` (
  `id_bahan_pokok` int(11) NOT NULL,
  `nama_bahan_pokok` varchar(100) NOT NULL,
  `id_jenis_bahan_pokok` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bahan_pokok`
--

INSERT INTO `bahan_pokok` (`id_bahan_pokok`, `nama_bahan_pokok`, `id_jenis_bahan_pokok`, `id_supplier`) VALUES
(1, 'Kentang', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cek_bahan`
--

CREATE TABLE `cek_bahan` (
  `no_cek_bahan` int(11) NOT NULL,
  `tanggal_cek_bahan` date NOT NULL,
  `no_order_pemesanan` int(11) NOT NULL,
  `id_staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cek_bahan`
--

INSERT INTO `cek_bahan` (`no_cek_bahan`, `tanggal_cek_bahan`, `no_order_pemesanan`, `id_staff`) VALUES
(1, '2022-06-02', 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dapur`
--

CREATE TABLE `dapur` (
  `id_dapur` int(11) NOT NULL,
  `penggunaan_stok` int(11) NOT NULL,
  `id_gudang` int(11) NOT NULL,
  `id_staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dapur`
--

INSERT INTO `dapur` (`id_dapur`, `penggunaan_stok`, `id_gudang`, `id_staff`) VALUES
(1, 5, 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gudang`
--

CREATE TABLE `gudang` (
  `id_gudang` int(11) NOT NULL,
  `nama_gudang` varchar(50) NOT NULL,
  `tanggal_masuk_gudang` date NOT NULL,
  `tanggal_keluar_gudang` date NOT NULL,
  `total_stok` int(11) DEFAULT 0,
  `no_cek_bahan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gudang`
--

INSERT INTO `gudang` (`id_gudang`, `nama_gudang`, `tanggal_masuk_gudang`, `tanggal_keluar_gudang`, `total_stok`, `no_cek_bahan`) VALUES
(1, 'Gudang Sayuran', '2022-06-03', '2022-06-04', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_bahan_pokok`
--

CREATE TABLE `jenis_bahan_pokok` (
  `id_jenis_bahan_pokok` int(11) NOT NULL,
  `jenis_bahan_pokok` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_bahan_pokok`
--

INSERT INTO `jenis_bahan_pokok` (`id_jenis_bahan_pokok`, `jenis_bahan_pokok`) VALUES
(1, 'Sayuran'),
(2, 'Minuman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_staff`
--

CREATE TABLE `jenis_staff` (
  `id_jenis_staff` int(11) NOT NULL,
  `jenis_staff` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_staff`
--

INSERT INTO `jenis_staff` (`id_jenis_staff`, `jenis_staff`) VALUES
(1, 'Gudang'),
(2, 'Cek'),
(3, 'Chef');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_pemesanan`
--

CREATE TABLE `order_pemesanan` (
  `no_order_pemesanan` int(11) NOT NULL,
  `tanggal_order_pemesanan` date NOT NULL,
  `stok_pembelian` int(11) NOT NULL,
  `id_bahan_pokok` int(11) NOT NULL,
  `id_staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_pemesanan`
--

INSERT INTO `order_pemesanan` (`no_order_pemesanan`, `tanggal_order_pemesanan`, `stok_pembelian`, `id_bahan_pokok`, `id_staff`) VALUES
(1, '2022-06-01', 15, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

CREATE TABLE `staff` (
  `id_staff` int(11) NOT NULL,
  `nama_staff` varchar(50) NOT NULL,
  `no_telepon_staff` varchar(20) NOT NULL,
  `alamat_staff` text NOT NULL,
  `id_jenis_staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `staff`
--

INSERT INTO `staff` (`id_staff`, `nama_staff`, `no_telepon_staff`, `alamat_staff`, `id_jenis_staff`) VALUES
(1, 'Gudanger', '0812', 'Gudanger', 1),
(2, 'Ceker', '0822', 'Ceker', 2),
(3, 'Chefer', '0896', 'Chefer', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `no_telepon_supplier` varchar(20) NOT NULL,
  `alamat_supplier` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `no_telepon_supplier`, `alamat_supplier`) VALUES
(1, 'Andri', '087808675313', 'Pocis');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bahan_pokok`
--
ALTER TABLE `bahan_pokok`
  ADD PRIMARY KEY (`id_bahan_pokok`),
  ADD KEY `id_jenis_bahan_pokok` (`id_jenis_bahan_pokok`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `cek_bahan`
--
ALTER TABLE `cek_bahan`
  ADD PRIMARY KEY (`no_cek_bahan`),
  ADD KEY `no_order_pemesanan` (`no_order_pemesanan`),
  ADD KEY `id_staff` (`id_staff`);

--
-- Indeks untuk tabel `dapur`
--
ALTER TABLE `dapur`
  ADD PRIMARY KEY (`id_dapur`),
  ADD KEY `id_gudang` (`id_gudang`),
  ADD KEY `id_staff` (`id_staff`);

--
-- Indeks untuk tabel `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id_gudang`),
  ADD KEY `no_cek_bahan` (`no_cek_bahan`);

--
-- Indeks untuk tabel `jenis_bahan_pokok`
--
ALTER TABLE `jenis_bahan_pokok`
  ADD PRIMARY KEY (`id_jenis_bahan_pokok`);

--
-- Indeks untuk tabel `jenis_staff`
--
ALTER TABLE `jenis_staff`
  ADD PRIMARY KEY (`id_jenis_staff`);

--
-- Indeks untuk tabel `order_pemesanan`
--
ALTER TABLE `order_pemesanan`
  ADD PRIMARY KEY (`no_order_pemesanan`),
  ADD KEY `id_bahan` (`id_bahan_pokok`),
  ADD KEY `id_staff` (`id_staff`);

--
-- Indeks untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_staff`),
  ADD KEY `id_jenis_staff` (`id_jenis_staff`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bahan_pokok`
--
ALTER TABLE `bahan_pokok`
  MODIFY `id_bahan_pokok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cek_bahan`
--
ALTER TABLE `cek_bahan`
  MODIFY `no_cek_bahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `dapur`
--
ALTER TABLE `dapur`
  MODIFY `id_dapur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id_gudang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jenis_bahan_pokok`
--
ALTER TABLE `jenis_bahan_pokok`
  MODIFY `id_jenis_bahan_pokok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jenis_staff`
--
ALTER TABLE `jenis_staff`
  MODIFY `id_jenis_staff` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `order_pemesanan`
--
ALTER TABLE `order_pemesanan`
  MODIFY `no_order_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `staff`
--
ALTER TABLE `staff`
  MODIFY `id_staff` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bahan_pokok`
--
ALTER TABLE `bahan_pokok`
  ADD CONSTRAINT `bahan_pokok_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bahan_pokok_ibfk_2` FOREIGN KEY (`id_jenis_bahan_pokok`) REFERENCES `jenis_bahan_pokok` (`id_jenis_bahan_pokok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cek_bahan`
--
ALTER TABLE `cek_bahan`
  ADD CONSTRAINT `cek_bahan_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cek_bahan_ibfk_2` FOREIGN KEY (`no_order_pemesanan`) REFERENCES `order_pemesanan` (`no_order_pemesanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `dapur`
--
ALTER TABLE `dapur`
  ADD CONSTRAINT `dapur_ibfk_1` FOREIGN KEY (`id_gudang`) REFERENCES `gudang` (`id_gudang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dapur_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `gudang`
--
ALTER TABLE `gudang`
  ADD CONSTRAINT `gudang_ibfk_1` FOREIGN KEY (`no_cek_bahan`) REFERENCES `cek_bahan` (`no_cek_bahan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_pemesanan`
--
ALTER TABLE `order_pemesanan`
  ADD CONSTRAINT `order_pemesanan_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_pemesanan_ibfk_2` FOREIGN KEY (`id_bahan_pokok`) REFERENCES `bahan_pokok` (`id_bahan_pokok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`id_jenis_staff`) REFERENCES `jenis_staff` (`id_jenis_staff`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
