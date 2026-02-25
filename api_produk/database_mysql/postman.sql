-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Feb 2026 pada 02.18
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `postman`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `kode` varchar(225) NOT NULL,
  `harga` varchar(250) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `kode`, `harga`, `foto`) VALUES
(6, 'Ayam', '98765', '100000', 'https://tse2.mm.bing.net/th/id/OIP.GsVO8b3qktNEP9nyaeX_MwHaFj?pid=Api&h=220&P=0'),
(7, 'susu kaleng', '237372', '6000', 'https://tse3.mm.bing.net/th/id/OIP.6Bjaia9tyS3LPRvsdUVSaAHaHa?pid=Api&h=220&P=0'),
(8, 'ikan', '92019039', '20000', 'https://tse3.mm.bing.net/th/id/OIP.Q3sSpB4RXCUOWO3B3TFl5gHaEK?pid=Api&h=220&P=0'),
(9, 'mouse', '096875', '80000', 'https://tse1.mm.bing.net/th/id/OIP.ldJoIvzBkMsRunZhETwbwgHaG6?pid=Api&h=220&P=0'),
(10, 'mangga', '11', '10000', 'https://tse2.mm.bing.net/th/id/OIP.EVR2FGI_DV4DuGrAFRVW2wHaE6?pid=Api&h=220&P=0'),
(11, 'bakwan', '63726372', '3000', 'https://tse2.mm.bing.net/th/id/OIP.0w9FJ18tzrKfDclBe5QbrwHaE8?pid=Api&h=220&P=0'),
(12, 'keyboard', '32323', '100000', 'https://tse2.mm.bing.net/th/id/OIP.GvCrouiTHGLguLnnQfqRHQHaHa?pid=Api&h=220&P=0');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
