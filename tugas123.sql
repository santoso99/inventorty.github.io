-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Des 2022 pada 13.08
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas123`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_ambil`
--

CREATE TABLE `cart_ambil` (
  `user_id` bigint(20) NOT NULL,
  `to` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_pinjam`
--

CREATE TABLE `cart_pinjam` (
  `user_id` bigint(20) NOT NULL,
  `to` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'APD BAGIAN ATAS', '2022-12-04 11:11:42', '2022-12-04 11:11:42', NULL),
(2, 'APD BAGIAN BADAN', '2022-12-04 11:11:42', '2022-12-04 11:11:42', NULL),
(3, 'APD BAGIAN KAKI', '2022-12-04 11:11:42', '2022-12-04 11:11:42', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_ambil`
--

CREATE TABLE `item_ambil` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `unique_id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `item_ambil`
--

INSERT INTO `item_ambil` (`id`, `category_id`, `unique_id`, `name`, `image`, `unit`, `stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'AMB-20221204-001', 'HELM SAFETY', 'public/item-image/Sp9RbhAA42qBJgJsUzHH1V1q3EidrYRVk9gEkZLb.jpg', 'HELM', 10, '2022-12-04 11:50:47', '2022-12-04 12:06:18', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_pinjam`
--

CREATE TABLE `item_pinjam` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_pinjam_detail`
--

CREATE TABLE `item_pinjam_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_pinjam_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` enum('bagus','rusak','hilang') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_09_134336_create_activity_table', 1),
(5, '2020_06_17_114301_create_category_table', 1),
(6, '2020_09_10_111423_create_peminjaman_table', 1),
(7, '2020_09_10_112231_create_pengambilan_table', 1),
(8, '2020_09_10_112323_create_peminjaman_detail_table', 1),
(9, '2020_09_10_112437_create_pengambilan_detail_table', 1),
(10, '2020_11_06_071202_create_item_pinjam_table', 1),
(11, '2020_11_06_072349_create_item_pinjam_detail_table', 1),
(12, '2020_11_19_125432_create_item_ambil_table', 1),
(13, '2020_12_04_213347_create_cart_pinjams_table', 1),
(14, '2020_12_04_214450_create_cart_ambils_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_detail`
--

CREATE TABLE `peminjaman_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `items_id` bigint(20) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `peminjamanable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peminjamanable_id` bigint(20) UNSIGNED NOT NULL,
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `returned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengambilan`
--

CREATE TABLE `pengambilan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengambilan_detail`
--

CREATE TABLE `pengambilan_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pengambilan_id` bigint(20) NOT NULL,
  `items_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SI', 'Si@gmail.com', NULL, '$2y$10$gYKpUzyhAB2/rchUYtq0Be0jROmWSzXtBxZ6m4h/RR0Q8AXXWSYuW', 'admin', NULL, '2022-12-04 11:11:42', '2022-12-04 11:11:42', NULL),
(2, 'pegawai', 'pegawai@ gmail.com', NULL, '$2y$10$gYKpUzyhAB2/rchUYtq0Be0jROmWSzXtBxZ6m4h/RR0Q8AXXWSYuW', 'user', NULL, '2022-12-04 11:11:42', '2022-12-04 11:11:42', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart_ambil`
--
ALTER TABLE `cart_ambil`
  ADD KEY `cart_ambil_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `cart_pinjam`
--
ALTER TABLE `cart_pinjam`
  ADD KEY `cart_pinjam_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `item_ambil`
--
ALTER TABLE `item_ambil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_ambil_unique_id_unique` (`unique_id`),
  ADD KEY `item_ambil_category_id_index` (`category_id`);

--
-- Indeks untuk tabel `item_pinjam`
--
ALTER TABLE `item_pinjam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_pinjam_category_id_index` (`category_id`);

--
-- Indeks untuk tabel `item_pinjam_detail`
--
ALTER TABLE `item_pinjam_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_pinjam_detail_unique_id_unique` (`unique_id`),
  ADD KEY `item_pinjam_detail_item_pinjam_id_index` (`item_pinjam_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peminjaman_detail_peminjamanable_type_peminjamanable_id_index` (`peminjamanable_type`,`peminjamanable_id`);

--
-- Indeks untuk tabel `pengambilan`
--
ALTER TABLE `pengambilan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengambilan_detail`
--
ALTER TABLE `pengambilan_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `item_ambil`
--
ALTER TABLE `item_ambil`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `item_pinjam`
--
ALTER TABLE `item_pinjam`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `item_pinjam_detail`
--
ALTER TABLE `item_pinjam_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengambilan`
--
ALTER TABLE `pengambilan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengambilan_detail`
--
ALTER TABLE `pengambilan_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

DELIMITER $$
--
-- Event
--
CREATE DEFINER=`id19961826_yes1233`@`localhost` EVENT `event_cart_pinjam` ON SCHEDULE EVERY 15 MINUTE STARTS '2022-12-04 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN UPDATE item_pinjam_detail as item, cart_pinjam as cart SET item.status = '1' where item.id = cart.item_id AND cart.created_at <= CURRENT_TIMESTAMP - INTERVAL 1 HOUR; DELETE FROM cart_pinjam WHERE created_at <= CURRENT_TIMESTAMP - INTERVAL 1 HOUR; END$$

CREATE DEFINER=`id19961826_yes1233`@`localhost` EVENT `event_cart_ambil` ON SCHEDULE EVERY 15 MINUTE STARTS '2022-12-04 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN UPDATE item_ambil as item, cart_ambil as cart SET item.stock = item.stock + cart.quantity WHERE item.id = cart.item_id AND cart.created_at <= CURRENT_TIMESTAMP - INTERVAL 1 HOUR; DELETE FROM cart_ambil WHERE created_at <= CURRENT_TIMESTAMP - INTERVAL 1 HOUR; END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
