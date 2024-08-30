-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Agu 2024 pada 15.15
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
-- Database: `jfd_belajar_database`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agama`
--

CREATE TABLE `agama` (
  `id` int(11) NOT NULL,
  `nama` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `agama`
--

INSERT INTO `agama` (`id`, `nama`) VALUES
(1, 'Islam'),
(2, 'Katolik'),
(3, 'Kristen'),
(4, 'Hindu'),
(5, 'Buddha'),
(6, 'Konghucu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `id` int(11) NOT NULL,
  `kode` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`id`, `kode`, `nama`) VALUES
(1, 'IT', 'Information Technology'),
(2, 'FIN', 'Finance'),
(3, 'HR', 'Human Resources'),
(4, 'GA', 'General Affair');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `nip` varchar(15) NOT NULL,
  `departemen_id` int(11) DEFAULT NULL,
  `agama_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `gender`, `alamat`, `nip`, `departemen_id`, `agama_id`) VALUES
(7, 'Aji Kowiyu', 'L', 'Pluit', '210910', 2, 1),
(8, 'Sakura Haruno', 'P', 'Konoha', '123123', 4, 3),
(9, 'Sasuke Uchiha', 'L', 'Konoha Bagian Selatan', '444', 1, 5),
(10, 'Naruto Uzumaki', 'L', 'Konoha', '0918', 1, NULL),
(11, 'Kakashi Hatake', 'L', 'Konoha', '08124', NULL, 4),
(18, 'Jokowi', 'L', 'Solo, Jawa Tengah, Indonesia.', '007', 3, 1),
(19, 'Sri Mulyani', 'P', 'Jakarta', '8098098', NULL, NULL),
(20, 'Prabowo Subianto', 'L', 'Jakarta Pusat', '008', NULL, NULL),
(24, 'Annie Leonhart', 'P', 'Negara Marley', '9889', 3, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `komen` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`id`, `id_post`, `komen`, `created_by`, `created_at`) VALUES
(1, 1, 'Astaga lucu bangettt!!!! Pake banget, banget!!', 2, '2024-08-29 17:17:38'),
(2, 6, 'km pasti bisa. kalem. tahan. senyumin aj.', 3, '2024-08-29 17:19:10'),
(3, 1, 'Tidak dapat dipungkiri', 3, '2024-08-29 23:49:44'),
(4, 6, 'Saya suka humor Anda', 1, '2024-08-29 23:50:38'),
(5, 5, 'Beneran geraaahh banget', 1, '2024-08-29 23:51:56'),
(6, 6, 'Astaga, kamu jenius ya? (sarkas)', 3, '2024-08-30 10:12:42'),
(7, 6, 'Halo aku komen', 1, '2024-08-30 19:56:17'),
(8, 7, 'beri komen sebagai apple', 3, '2024-08-30 19:59:06'),
(9, 7, '  0', 3, '2024-08-30 19:59:18'),
(10, 7, '  ', 3, '2024-08-30 19:59:21'),
(11, 7, 'aku suka apel<br>yaa', 3, '2024-08-30 20:02:40'),
(12, 7, '<hr/>', 3, '2024-08-30 20:02:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `caption` varchar(1000) DEFAULT NULL,
  `file1` varchar(500) DEFAULT NULL,
  `file2` varchar(500) DEFAULT NULL,
  `file3` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `hashtag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `post`
--

INSERT INTO `post` (`id`, `caption`, `file1`, `file2`, `file3`, `created_at`, `created_by`, `updated_at`, `updated_by`, `hashtag`) VALUES
(1, 'Dialah guguk terlucu di dunia', 'aud_20240827_202936_BaileyHead.png', NULL, NULL, '2024-08-27 20:29:36', 1, '0000-00-00 00:00:00', 0, ''),
(2, 'Ia memang agak panjang', 'aud_20240827_203020_BaileyFeet.png', 'aud_20240827_203020_BaileyBody.png', 'aud_20240827_203020_BaileyHead.png', '2024-08-27 20:30:20', 1, '0000-00-00 00:00:00', 0, ''),
(3, '', 'aud_20240827_203043_Buffy Ecstatic.png', NULL, NULL, '2024-08-27 20:30:43', 1, '0000-00-00 00:00:00', 0, ''),
(4, 'Caption saja sudah cukup', NULL, NULL, NULL, '2024-08-27 20:31:03', 1, '0000-00-00 00:00:00', 0, ''),
(5, 'Di Indonesia, panen ini banyak banget', 'happyman_20240829_160135_cca0e61a6c554fb5bdfcf6c5a30e8e08.jpg', NULL, NULL, '2024-08-29 16:01:35', 2, '0000-00-00 00:00:00', 0, ''),
(6, 'Set reaksi penunjuk kekecewaan', 'happyman_20240829_205401_23559b4c9e9b70ce035597c0a136d347.jpg', 'happyman_20240829_205401_15257625475af149f3e384c.jpg', 'happyman_20240829_205401_9feb1d24335073f939157b30a0d9b86833d32fbc.jpg', '2024-08-29 20:54:01', 2, '0000-00-00 00:00:00', 0, ''),
(7, 'Haduhh vendor\" percetakan zaman sekarang terlalu... 😓😓', 'aud_20240830_102459_761235-pelesetan-singkat.jpg', NULL, NULL, '2024-08-30 10:24:59', 1, '0000-00-00 00:00:00', 0, ''),
(8, 'apakah kalian sedang nyimak karena hari ini akan bubar maribobo', 'apple_20240830_200455_CsJm_bcVUAA-tcO.jpg', 'apple_20240830_200455_images (70).jpeg', 'apple_20240830_200455_ni-vidi-maribobo-bega-dang-dapat-menyebabkan-mata-ngantuk-kurang-tidur-1370010.png', '2024-08-30 20:04:55', 3, '0000-00-00 00:00:00', 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `foto` varchar(1000) DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama_lengkap`, `foto`, `bio`, `last_update`) VALUES
(1, 'aud', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 'Aud Et', 'aud_20240830_110825_Kos Kaki MID.png', 'Ingin pensiun dan menjalankan hobi...', '2024-08-30 11:08:25'),
(2, 'happyman', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 'Siah Bahagia', 'happyman_20240829_161252_Bolsty Lovin It S.png', 'Makan apa ya hari ini', '2024-08-29 16:12:52'),
(3, 'apple', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 'Flying Dragon', NULL, 'LIVE SETIAP HARI: 20.00 WIB!!', '2024-08-29 19:47:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agama`
--
ALTER TABLE `agama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
