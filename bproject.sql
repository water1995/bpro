-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2020 at 04:37 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `acceptedunis`
--

CREATE TABLE `acceptedunis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `req_id` bigint(20) UNSIGNED NOT NULL,
  `course` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `university` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chose` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `acceptedunis`
--

INSERT INTO `acceptedunis` (`id`, `req_id`, `course`, `university`, `chose`, `created_at`, `updated_at`) VALUES
(8, 1, 'MS in Data Science', 'UM , Ann Arbor', 1, '2020-05-21 18:07:29', '2020-05-21 18:07:29'),
(9, 1, 'MS in Artificial Intelligence', 'SIT , New Jersey', 0, '2020-05-21 18:07:29', '2020-05-21 18:07:29'),
(10, 1, 'MS in Computer Science', 'NEU , Boston', 0, '2020-05-21 18:07:29', '2020-05-21 18:07:29'),
(15, 14, 'MS in Artificial Intelligence', 'SIT , New Jersey', 1, '2020-09-18 07:50:23', '2020-09-18 07:50:23'),
(16, 14, 'MS in Computer Science', 'SIT , New Jersey', 0, '2020-09-18 07:50:23', '2020-09-18 07:50:23'),
(17, 13, 'MS in Computer Science', 'SIT , New Jersey', 1, '2020-09-21 20:03:51', '2020-09-21 20:03:51'),
(18, 15, 'MS in Data Science', 'RU , New Jersey', 1, '2020-09-21 20:05:34', '2020-09-21 20:05:34'),
(19, 19, 'MS in Data Science', 'UM , Ann Arbor', 1, '2020-09-21 20:46:50', '2020-09-21 20:46:50'),
(20, 19, 'MS in Computer Science', 'RIT , Rochester', 0, '2020-09-21 20:46:50', '2020-09-21 20:46:50'),
(21, 20, 'MS in Artificial Intelligence', 'SIT , New Jersey', 1, '2020-09-21 20:58:32', '2020-09-21 20:58:32'),
(22, 21, 'MS in Data Science', 'RU, New Jersey', 0, '2020-09-21 21:12:17', '2020-09-21 21:12:17'),
(23, 21, 'MS in Computer Science', 'RIT , Rochester', 1, '2020-09-21 21:12:17', '2020-09-21 21:12:17');

-- --------------------------------------------------------

--
-- Table structure for table `d_sgpis`
--

CREATE TABLE `d_sgpis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `Sem_1` double NOT NULL,
  `Sem_2` double NOT NULL,
  `Sem_3` double NOT NULL,
  `Sem_4` double NOT NULL,
  `Sem_5` double NOT NULL,
  `Sem_6` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `d_sgpis`
--

INSERT INTO `d_sgpis` (`id`, `stud_id`, `Sem_1`, `Sem_2`, `Sem_3`, `Sem_4`, `Sem_5`, `Sem_6`, `created_at`, `updated_at`) VALUES
(1, 1, 6.25, 6.25, 6.25, 7, 8, 8, '2020-03-23 11:48:01', '2020-03-23 11:48:01'),
(2, 4, 6.25, 6.25, 6.25, 6.25, 6.25, 6.25, '2020-09-09 17:05:13', '2020-09-09 17:05:13'),
(3, 6, 6.25, 6.25, 6.25, 6.25, 6.25, 6, '2020-09-10 14:27:32', '2020-09-10 14:27:32'),
(4, 8, 6.25, 6.25, 6.25, 6.25, 6.25, 8, '2020-09-10 19:00:15', '2020-09-10 19:00:15'),
(5, 10, 6.25, 6.25, 6.25, 6.25, 6.25, 8, '2020-09-10 19:14:41', '2020-09-10 19:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `req_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `stud_id`, `req_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'OPh5I0JCLURPg5yS', '2020-05-13 08:13:50', '2020-05-13 08:13:50'),
(125, 4, 14, 'iMl5mlBkZBo0x3qA', '2020-09-18 07:49:54', '2020-09-18 07:49:54'),
(126, 3, 13, 'D1rjBUOCbbSJTf23', '2020-09-21 20:02:00', '2020-09-21 20:02:00'),
(127, 5, 15, 'DOFXWLoeyFY5Nioj', '2020-09-21 20:02:11', '2020-09-21 20:02:11'),
(128, 3, 13, 'NVjFUkTJsVDxohRC', '2020-09-21 20:40:10', '2020-09-21 20:40:10'),
(129, 5, 15, 'oDnvuJgWB4UlRe9c', '2020-09-21 20:40:22', '2020-09-21 20:40:22'),
(130, 3, 13, 'MSlEGHXR3tZnKTXy', '2020-09-21 20:41:34', '2020-09-21 20:41:34'),
(131, 5, 15, 'rxVInd4BPyoEOp0o', '2020-09-21 20:41:39', '2020-09-21 20:41:39'),
(132, 6, 19, 'fgoeoFu4QurBO5gJ', '2020-09-21 20:41:42', '2020-09-21 20:41:42'),
(133, 3, 13, 'PRh4WJFHGojGhMgK', '2020-09-21 20:55:20', '2020-09-21 20:55:20'),
(134, 5, 15, 'M0PG6TDHdJ60eWO3', '2020-09-21 20:55:25', '2020-09-21 20:55:25'),
(135, 6, 19, 'lzqMjU5b8BWXIVt2', '2020-09-21 20:55:29', '2020-09-21 20:55:29'),
(136, 3, 13, 'ob42w6wQcfTYpBbK', '2020-09-21 20:56:57', '2020-09-21 20:56:57'),
(137, 5, 15, 'hjpHjPUzcgZoAKS0', '2020-09-21 20:57:01', '2020-09-21 20:57:01'),
(138, 6, 19, '5QfWy6RfAydQrtzA', '2020-09-21 20:57:05', '2020-09-21 20:57:05'),
(139, 7, 20, 'fGZlRAfBi3q6tH8O', '2020-09-21 20:57:09', '2020-09-21 20:57:09'),
(140, 3, 13, 'SBoWoqNv8Uv3hoSc', '2020-09-21 21:10:46', '2020-09-21 21:10:46'),
(141, 5, 15, 'UnCf6AXGvRDlqMkY', '2020-09-21 21:10:50', '2020-09-21 21:10:50'),
(142, 6, 19, 'Faquc9VJzfA0cCpm', '2020-09-21 21:10:55', '2020-09-21 21:10:55'),
(143, 7, 20, 'puFX3dNjIbNZV5TO', '2020-09-21 21:11:00', '2020-09-21 21:11:00'),
(144, 8, 21, 'G4Xhh5Rn9huRVxBW', '2020-09-21 21:11:05', '2020-09-21 21:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `lor_achievements`
--

CREATE TABLE `lor_achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `achievement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_achievements`
--

INSERT INTO `lor_achievements` (`id`, `stud_id`, `title`, `achievement`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 1', 'user-1.achievement.15', '2020-04-05 08:27:34', '2020-04-05 08:27:34'),
(2, 1, 'Scored 7 SGPA', 'Scored 7 SGPA in sem 2', 'user-1.achievement.11', '2020-04-05 08:28:15', '2020-04-05 08:28:15'),
(3, 1, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 3', 'user-1.achievement.17', '2020-04-05 08:28:37', '2020-04-05 08:28:37'),
(4, 1, 'Scored 7 SGPA', 'Scored 7 SGPA in sem 4', 'user-1.achievement.19', '2020-04-05 08:29:05', '2020-04-05 08:29:05'),
(109, 1, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 5', 'user-1.achievement.16', '2020-04-12 19:28:15', '2020-04-12 19:28:15'),
(111, 1, 'Scored 7 SGPA', 'Scored 7 SGPA in sem 6', 'user-1.achievement.1', '2020-04-12 19:38:48', '2020-04-12 19:38:48'),
(112, 1, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 7', 'user-1.achievement.9', '2020-04-12 19:49:45', '2020-04-12 19:49:45'),
(113, 2, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 1', 'user-2.achievement.5', '2020-04-27 09:23:42', '2020-04-27 09:23:42'),
(129, 3, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 1', 'user-6.achievement-129', '2020-09-12 12:32:11', '2020-09-14 11:22:46'),
(130, 3, 'Scored 7 SGPA', 'Scored 7 SGPA in sem 6', 'user-6.achievement-130', '2020-09-12 12:32:11', '2020-09-12 12:32:11'),
(132, 4, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 1', 'user-7.achievement-132', '2020-09-15 06:36:41', '2020-09-15 06:36:41'),
(133, 4, 'Scored 7 SGPA', 'Scored 7 SGPA in sem 5', 'user-7.achievement-133', '2020-09-15 06:36:42', '2020-09-15 14:42:22'),
(134, 5, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 2', 'user-8.achievement-134', '2020-09-18 16:18:02', '2020-09-19 19:06:48'),
(136, 6, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 1', 'user-9.achievement-136', '2020-09-21 20:22:16', '2020-09-21 20:22:16'),
(137, 6, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 7', 'user-9.achievement-137', '2020-09-21 20:34:28', '2020-09-21 20:34:28'),
(138, 6, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 7', 'user-9.achievement-138', '2020-09-21 20:35:27', '2020-09-21 20:35:27'),
(139, 7, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 2', 'user-10.achievement-139', '2020-09-21 20:54:09', '2020-09-21 20:54:09'),
(140, 8, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 1', 'user-12.achievement-140', '2020-09-21 21:04:34', '2020-09-21 21:04:34');

-- --------------------------------------------------------

--
-- Table structure for table `lor_activities`
--

CREATE TABLE `lor_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_activities`
--

INSERT INTO `lor_activities` (`id`, `stud_id`, `title`, `activity`, `file_name`, `created_at`, `updated_at`) VALUES
(2, 1, 'Scored 8 CGPA', 'Scored 8 CGPA in sem 2', 'user-1.activity.17', '2020-03-23 14:35:58', '2020-04-05 17:31:10'),
(4, 1, 'Scored 7 CGPA', 'Scored 7 CGPA in sem 4', 'user-1.activity-4.pdf', '2020-03-23 14:35:58', '2020-03-23 14:35:58'),
(5, 1, 'Scored 8 CGPA', 'Scored 8 CGPA in sem 5', 'user-1.activity-5.pdf', '2020-03-23 14:35:58', '2020-03-27 06:56:57'),
(7, 1, 'Scored 7 SGPA', 'Scored 7 SGPA in sem 1', 'user-1.activity.12', '2020-04-05 17:32:23', '2020-04-13 02:22:37'),
(10, 1, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 3', 'user-1.activity.14', '2020-04-13 14:23:02', '2020-04-13 14:23:02'),
(11, 1, 'Scored 7 SGPA', 'Scored 7 SGPA in sem 6', 'user-1.activity.18', '2020-04-13 14:26:54', '2020-04-13 14:26:54'),
(21, 3, 'Technical HEAD', 'Technical HEAD in CSI', 'user-6.activity-21', '2020-09-12 12:32:12', '2020-09-12 12:32:12'),
(22, 4, 'Technical HEAD', 'Technical HEAD in CSI', 'user-7.activity-22', '2020-09-15 06:36:42', '2020-09-15 06:36:42'),
(24, 5, 'Technical HEAD', 'Technical HEAD in  CSI', 'user-5.activity.7', '2020-09-19 19:09:10', '2020-09-19 19:09:34'),
(25, 6, 'Technical HEAD', 'Technical HEAD in CSI', 'user-9.activity-25', '2020-09-21 20:34:28', '2020-09-21 20:34:28'),
(26, 6, 'Technical HEAD', 'Technical HEAD in CSI', 'user-9.activity-26', '2020-09-21 20:35:27', '2020-09-21 20:35:27'),
(27, 7, 'Technical HEAD', 'Technical HEAD in CSI', 'user-10.activity-27', '2020-09-21 20:54:10', '2020-09-21 20:54:10'),
(28, 8, 'Technical HEAD', 'Technical HEAD in CSI', 'user-12.activity-28', '2020-09-21 21:04:34', '2020-09-21 21:04:34');

-- --------------------------------------------------------

--
-- Table structure for table `lor_courses`
--

CREATE TABLE `lor_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `req_id` bigint(20) UNSIGNED NOT NULL,
  `course` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_courses`
--

INSERT INTO `lor_courses` (`id`, `stud_id`, `req_id`, `course`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'MS in Data Science', '2020-03-23 14:36:02', '2020-03-23 14:36:02'),
(2, 1, 1, 'MS in Artificial Intelligence', '2020-03-23 14:36:02', '2020-03-23 14:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `lor_dmarks`
--

CREATE TABLE `lor_dmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_dmarks`
--

INSERT INTO `lor_dmarks` (`id`, `stud_id`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'user-1.dmarksheet.pdf', '2020-03-23 11:48:01', '2020-03-23 11:48:01'),
(2, 4, 'user-7.dmarksheet.pdf', '2020-09-09 17:05:14', '2020-09-09 17:05:14'),
(3, 6, 'user-9.dmarksheet.pdf', '2020-09-10 14:27:32', '2020-09-10 14:27:32'),
(4, 8, 'user-12.dmarksheet.pdf', '2020-09-10 19:00:15', '2020-09-10 19:00:15'),
(5, 10, 'user-14.dmarksheet.pdf', '2020-09-10 19:14:41', '2020-09-10 19:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `lor_extras`
--

CREATE TABLE `lor_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_curricular_activity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_extras`
--

INSERT INTO `lor_extras` (`id`, `stud_id`, `title`, `extra_curricular_activity`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Scored 7 CGPA', 'Scored 7 CGPA in sem 1', 'user-1.extra-1.pdf', '2020-03-23 14:35:59', '2020-03-23 14:35:59'),
(2, 1, 'Scored 7 CGPA', 'Scored 7 CGPA in sem 3', 'user-1.extra.12', '2020-03-23 14:35:59', '2020-04-13 14:19:28'),
(3, 1, 'Scored 7 CGPA', 'Scored 7 CGPA in sem 3', 'user-1.extra.13', '2020-03-23 14:35:59', '2020-04-05 17:58:42'),
(9, 1, 'Scored 8 CGPA', 'Scored 8 CGPA in sem 2', 'user-1.extra.18', '2020-04-13 14:08:52', '2020-04-13 14:08:52'),
(17, 3, 'Hysteria', 'PR head', 'user-6.extra-17', '2020-09-12 12:32:12', '2020-09-12 12:32:12'),
(18, 4, 'Hysteria', 'PR head', 'user-7.extra-18', '2020-09-15 06:36:42', '2020-09-15 06:36:42'),
(19, 5, 'Hysteria', 'PR head', 'user-8.extra-19', '2020-09-18 16:18:03', '2020-09-19 19:11:10'),
(21, 6, 'Hysteria', 'PR head', 'user-9.extra-21', '2020-09-21 20:34:29', '2020-09-21 20:34:29'),
(22, 6, 'Hysteria', 'PR head', 'user-9.extra-22', '2020-09-21 20:35:28', '2020-09-21 20:35:28'),
(23, 7, 'Hysteria', 'PR head', 'user-10.extra-23', '2020-09-21 20:54:10', '2020-09-21 20:54:10'),
(24, 8, 'Hysteria', 'PR head', 'user-12.extra-24', '2020-09-21 21:04:34', '2020-09-21 21:04:34');

-- --------------------------------------------------------

--
-- Table structure for table `lor_marks`
--

CREATE TABLE `lor_marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_marks`
--

INSERT INTO `lor_marks` (`id`, `stud_id`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'user-1.marksheet.pdf', '2020-03-23 11:48:01', '2020-03-23 11:48:01'),
(2, 3, 'user-6.marksheet.pdf', '2020-05-26 13:36:44', '2020-05-26 13:36:44'),
(3, 4, 'user-7.marksheet.pdf', '2020-09-09 17:05:14', '2020-09-09 17:05:14'),
(4, 5, 'user-8.marksheet.pdf', '2020-09-10 14:20:53', '2020-09-10 14:20:53'),
(5, 6, 'user-9.marksheet.pdf', '2020-09-10 14:27:32', '2020-09-10 14:27:32'),
(6, 8, 'user-12.marksheet.pdf', '2020-09-10 19:00:15', '2020-09-10 19:00:15'),
(7, 9, 'user-13.marksheet.pdf', '2020-09-10 19:08:57', '2020-09-10 19:08:57'),
(8, 10, 'user-14.marksheet.pdf', '2020-09-10 19:14:41', '2020-09-10 19:14:41'),
(9, 2, 'user-3.marksheet.pdf', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lor_nsses`
--

CREATE TABLE `lor_nsses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nss_activity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_nsses`
--

INSERT INTO `lor_nsses` (`id`, `stud_id`, `title`, `nss_activity`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Scored 7 CGPA', 'Scored 7 CGPA in sem 1', 'user-1.activity-1.pdf', '2020-03-23 14:36:00', '2020-03-23 14:36:00'),
(2, 1, 'Scored 7 CGPA', 'Scored 7 CGPA in sem 2', 'user-1.activity-2.pdf', '2020-03-23 14:36:00', '2020-03-23 14:36:00'),
(3, 1, 'Scored 7 CGPA', 'Scored 7  CGPA in sem 3', 'user-1.nss.3', '2020-03-23 14:36:01', '2020-04-05 18:08:16'),
(4, 1, 'Scored 7 CGPA', 'Scored 7 CGPA in sem 4', 'user-1.nss.12', '2020-03-23 14:36:01', '2020-04-05 18:25:43'),
(6, 1, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 5', 'user-1.nss.11', '2020-04-05 18:27:15', '2020-04-05 18:27:15'),
(7, 1, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 6', 'user-1.nss.20', '2020-04-05 18:32:51', '2020-04-05 18:33:59'),
(8, 1, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 7', 'user-1.nss.7', '2020-04-05 18:33:46', '2020-04-05 18:33:46'),
(9, 1, 'Scored 8', 'Scored 8 SGPA in sem 8', 'user-1.nss.13', '2020-04-05 18:34:24', '2020-04-13 02:43:25'),
(15, 3, 'NSS camp', 'Participated in NSS camp', 'user-6.activity-15', '2020-09-12 12:32:12', '2020-09-12 12:32:12'),
(16, 4, 'NSS camp', 'Participated in NSS camp', 'user-7.activity-16', '2020-09-15 06:36:43', '2020-09-15 06:36:43'),
(17, 5, 'CSI', 'Participated in NSS camp', 'user-8.activity-17', '2020-09-18 16:18:03', '2020-09-19 19:11:28'),
(18, 5, 'NSS camp', 'Participated in NSS camp', 'user-5.nss.18', '2020-09-19 19:11:46', '2020-09-19 19:11:46'),
(19, 7, 'NSS camp', 'Participated in NSS camp', 'user-10.activity-19', '2020-09-21 20:54:10', '2020-09-21 20:54:10'),
(20, 8, 'NSS camp', 'Participated in NSS camp', 'user-12.activity-20', '2020-09-21 21:04:35', '2020-09-21 21:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `lor_prof_activities`
--

CREATE TABLE `lor_prof_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `req_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marks` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_prof_activities`
--

INSERT INTO `lor_prof_activities` (`id`, `stud_id`, `req_id`, `title`, `activity`, `professor`, `marks`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Project Guide', 'Developed  a project called Record Management System', 'Prof.Nilesh Ghavate', '60/75', NULL, '2020-03-29 12:31:10', '2020-03-29 12:31:10'),
(6, 1, 7, 'TECHNICAL HEAD', 'TECHNICAL HEAD in CSI DBIT', 'Prof.Sushree Satapathy', '0', 'user-1.prof_activity.25', '2020-04-09 11:22:41', '2020-04-09 11:22:41'),
(7, 1, 7, 'PR HEAD', 'PR HEAD in CSI', 'Prof.Sushree Satapathy', '0', 'user-1.prof_activity.18', '2020-04-09 11:26:44', '2020-04-09 11:26:44'),
(19, 1, 1, 'technical HEAD', 'PR HEAD in CSI', 'Prof.Nilesh Ghavate', '0', 'user-1.prof_activity.12', '2020-04-13 16:52:23', '2020-05-28 15:50:35'),
(20, 2, 2, 'Project Guide', 'Developed a project called Crop Management System', 'Prof.Nilesh Ghavate', '60/75', NULL, '2020-04-29 06:22:13', '2020-04-29 06:24:27'),
(21, 2, 2, 'CSI Member', 'Member at CSI', 'Prof.Nilesh Ghavate', '0', 'user-2.prof_activity.4', '2020-04-29 06:24:15', '2020-04-29 06:24:15'),
(28, 3, 13, 'Project Guide', 'Determining location of rehab centres through spatial data analysis', 'Prof.Sushree Satapathy', '60/75', 'user-6.prof_activity.29', '2020-09-12 12:32:13', '2020-09-12 12:32:13'),
(29, 4, 14, 'Project Guide', 'Smart Door Locking Mechnanism', 'Prof.Nilesh Ghavate', '60/75', 'user-4.prof_activity.17', '2020-09-15 06:36:43', '2020-09-15 19:09:35'),
(30, 5, 15, 'Project Guide', 'Expenses Management Application', 'Prof.Sushree Satapathy', '60/75', NULL, '2020-09-18 16:18:04', '2020-09-19 18:06:40'),
(39, 5, 15, 'gffdhhf', 'fdhdh fgddffg dht hthffh', 'Prof.Sushree Satapathy', '0', 'user-5.prof_activity.20', '2020-09-19 18:54:17', '2020-09-19 18:54:17'),
(40, 6, 19, 'Project Guide', 'Decision support system for crop selection', 'Prof.Nilesh Ghavate', '60/75', 'user-9.prof_activity.16', '2020-09-21 20:35:28', '2020-09-21 20:35:28'),
(41, 7, 20, 'Project Guide', 'Single Image super resolution', 'Prof.Sushree Satapathy', '60/75', 'user-10.prof_activity.20', '2020-09-21 20:54:11', '2020-09-21 20:54:11'),
(42, 8, 21, 'Project Guide', 'Prevention of Intellectual Theft using Blockchain', 'Prof.Nilesh Ghavate', '60/75', 'user-12.prof_activity.21', '2020-09-21 21:04:35', '2020-09-21 21:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `lor_requests`
--

CREATE TABLE `lor_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `professor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `roa` tinyint(1) NOT NULL,
  `lor_draft` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Done` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_requests`
--

INSERT INTO `lor_requests` (`id`, `stud_id`, `professor`, `status`, `roa`, `lor_draft`, `Done`, `created_at`, `updated_at`) VALUES
(1, 1, 'Prof.Nilesh Ghavate', 1, 1, 'user-1.lor_draft.pdf', '2020-04-16', '2020-03-29 12:31:10', '2020-03-29 12:31:10'),
(2, 2, 'Prof.Nilesh Ghavate', 1, 0, 'dgnvhnhjhghjhg', '0000-00-00', NULL, NULL),
(13, 3, 'Prof.Sushree Satapathy', 1, 1, 'user-6.lor_draft.pdf', '2020-04-16', '2020-09-12 12:32:12', '2020-09-12 12:32:12'),
(14, 4, 'Prof.Nilesh Ghavate', 1, 1, 'user-7.lor_draft.pdf', '2020-04-17', '2020-09-15 06:36:43', '2020-09-15 06:36:43'),
(15, 5, 'Prof.Sushree Satapathy', 1, 1, 'user-8.lor_draft.pdf', '0000-00-00', '2020-09-18 16:18:04', '2020-09-18 16:18:04'),
(19, 6, 'Prof.Nilesh Ghavate', 1, 0, 'user-9.lor_draft.pdf', '0000-00-00', '2020-09-21 20:34:29', '2020-09-21 20:34:29'),
(20, 7, 'Prof.Sushree Satapathy', 1, 0, 'user-10.lor_draft.pdf', '0000-00-00', '2020-09-21 20:54:11', '2020-09-21 20:54:11'),
(21, 8, 'Prof.Nilesh Ghavate', 1, 0, 'user-12.lor_draft.pdf', '0000-00-00', '2020-09-21 21:04:35', '2020-09-21 21:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `lor_universities`
--

CREATE TABLE `lor_universities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `req_id` bigint(20) UNSIGNED NOT NULL,
  `course` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `university` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `Done` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lor_universities`
--

INSERT INTO `lor_universities` (`id`, `stud_id`, `req_id`, `course`, `university`, `dept`, `deadline`, `Done`, `created_at`, `updated_at`) VALUES
(5, 1, 1, 'MS in Data Science', 'UM , Ann Arbor', 'Computer Science and Engineering', '2019-11-10', '2019-11-10', '2020-03-29 12:31:10', '2020-03-29 12:31:10'),
(7, 1, 1, 'MS in Computer Science', 'NEU , Boston', 'Computing and IT', '2020-04-22', '2019-11-12', '2020-03-29 12:31:11', '2020-04-13 22:30:09'),
(18, 2, 2, 'MS in Data Science', 'UM , Ann Arbor', 'Computer Science and Engineering', '2020-10-07', '2020-09-22', NULL, '2020-04-29 13:29:20'),
(19, 2, 2, 'MS in Data Science', 'RU , New Jersey', 'Electrical and Computer Engineering', '2020-10-11', '0000-00-00', NULL, '2020-04-29 13:29:36'),
(20, 2, 2, 'MS in Computer Science', 'NEU , Boston', 'Computing and IT', '2020-10-13', '0000-00-00', NULL, '2020-04-29 13:31:56'),
(21, 2, 2, 'MS in Computer Science', 'RIT , Rochester', 'Computer Science', '2020-10-15', '0000-00-00', NULL, '2020-04-29 13:30:21'),
(22, 2, 2, 'MS in Artificial Intelligence', 'SIT , New Jersey', 'Electrical and Computer Engineering', '2020-10-18', '0000-00-00', NULL, '2020-04-29 13:30:39'),
(48, 3, 13, 'MS in Computer Science', 'NEU , Boston', 'Computing and IT', '2020-04-15', '2020-04-23', '2020-09-12 12:32:13', '2020-09-12 12:32:13'),
(49, 3, 13, 'MS in Computer Science', 'SIT , New Jersey', 'Electrical and Computer Engineering', '2020-04-15', '2020-04-23', '2020-09-12 12:32:13', '2020-09-12 12:32:13'),
(50, 4, 14, 'MS in Data Science', 'RU, New Jersey', 'Electrical and Computer Engineering', '2020-04-16', '2020-04-19', '2020-09-15 06:36:44', '2020-09-15 06:36:44'),
(51, 4, 14, 'MS in Artificial Intelligence', 'SIT , New Jersey', 'Electrical and Computer Engineering', '2020-04-16', '2020-04-19', '2020-09-15 06:36:44', '2020-09-15 06:36:44'),
(53, 4, 14, 'MS in Computer Science', 'SIT , New Jersey', 'Computer', '2020-04-16', '2020-04-19', '2020-09-15 16:59:34', '2020-09-15 16:59:34'),
(54, 5, 15, 'MS in Computer Science', 'RIT , Rochester', 'Computer Science', '2020-04-19', '2020-04-23', '2020-09-18 16:18:04', '2020-09-18 16:18:04'),
(55, 5, 15, 'MS in Data Science', 'RU , New Jersey', 'Electrical and Computer Engineering', '2020-04-19', '2020-04-23', '2020-09-18 16:18:05', '2020-09-19 19:01:53'),
(57, 6, 19, 'MS in Data Science', 'UM , Ann Arbor', 'Computer Science and Engineering', '2020-04-23', '2020-04-23', '2020-09-21 20:35:28', '2020-09-21 20:35:28'),
(58, 6, 19, 'MS in Computer Science', 'RIT , Rochester', 'Computing and IT', '2020-04-23', '2020-04-23', '2020-09-21 20:35:29', '2020-09-21 20:35:29'),
(59, 7, 20, 'MS in Computer Science', 'SIT , New Jersey', 'Computer Science', '2020-04-23', '2020-04-23', '2020-09-21 20:54:11', '2020-09-21 20:54:11'),
(60, 7, 20, 'MS in Artificial Intelligence', 'SIT , New Jersey', 'Electrical and Computer Engineering', '2020-04-23', '2020-04-23', '2020-09-21 20:54:11', '2020-09-21 20:54:11'),
(61, 8, 21, 'MS in Data Science', 'RU, New Jersey', 'Electrical and Computer Engineering', '2020-04-23', '2020-04-23', '2020-09-21 21:04:36', '2020-09-21 21:04:36'),
(62, 8, 21, 'MS in Computer Science', 'RIT , Rochester', 'Computer', '2020-04-23', '2020-04-23', '2020-09-21 21:04:36', '2020-09-21 21:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(17, '2020_01_26_071715_create_students_table', 3),
(18, '2020_03_23_125009_create_sgpa_6s_table', 3),
(19, '2020_03_23_125122_create_sgpa_7s_table', 3),
(20, '2020_03_23_125147_create_sgpa_8s_table', 3),
(21, '2020_03_23_125257_create_lor_requests_table', 3),
(22, '2020_03_23_125400_create_lor_courses_table', 3),
(23, '2020_03_23_125440_create_lor_universities_table', 3),
(24, '2020_03_23_125602_create_d_sgpis_table', 3),
(25, '2020_03_23_125727_create_lor_achievements_table', 4),
(26, '2020_03_23_125822_create_lor_activities_table', 4),
(27, '2020_03_23_125905_create_lor_marks_table', 4),
(28, '2020_03_23_125944_create_lor_extras_table', 4),
(29, '2020_03_23_130012_create_lor_nsses_table', 4),
(30, '2020_03_23_130046_create_lor_prof_activities_table', 4),
(31, '2020_03_23_133329_create_lor_dmarks_table', 5),
(32, '2020_04_08_233510_create_notifications_table', 6),
(33, '2020_04_14_215143_roa_data', 7),
(34, '2020_04_14_222847_roa_criterion', 7),
(35, '2020_04_14_223756_roa_recommendation', 7),
(36, '2020_04_17_045457_transcipt', 8),
(37, '2020_05_12_204827_create_feedback_table', 9),
(38, '2020_05_15_180526_create_acceptedunis_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('004109ad-f23b-4712-b6a8-d7e7efb9759e', 'App\\Notifications\\NotifyCurricularEdited', 'App\\User', 4, '{\"activity\":\"Technical HEAD\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:09:34', '2020-09-20 10:42:24'),
('056059f5-1ff5-4ded-a38e-f811abef0c10', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"ghcgcf\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:30:14', '2020-09-20 10:42:25'),
('09e7a722-f79f-437f-a490-8a3a814a7b20', 'App\\Notifications\\NotifyStudentAccepted', 'App\\User', 12, '{\"prof\":[{\"id\":21,\"stud_id\":8,\"professor\":\"Prof.Nilesh Ghavate\"}]}', NULL, '2020-09-21 21:09:00', '2020-09-21 21:09:00'),
('143ea4b7-9167-4369-89f7-f3e7648c2c73', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"dsadfdd\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:34:42', '2020-09-20 10:42:25'),
('16506a78-025c-47ac-a2b3-ae044f538550', 'App\\Notifications\\NotifyCourseEdited', 'App\\User', 4, '{\"course\":\"MS in Data Science\",\"uni\":\"RU , New Jersey\",\"reqID\":15}', '2020-09-20 10:42:26', '2020-09-19 19:01:53', '2020-09-20 10:42:26'),
('169ed399-48d6-485e-9256-ab9af7534677', 'App\\Notifications\\notifyachievement', 'App\\User', 4, '{\"achievement\":\"Scored 8 SGPA\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:07:16', '2020-09-20 10:42:24'),
('182c0eab-d60a-4627-a61d-80e978e2e0b2', 'App\\Notifications\\NotifyAchievementEdited', 'App\\User', 4, '{\"achievement\":\"Scored 8 SGPA\",\"studID\":3}', '2020-09-14 10:32:42', '2020-09-14 10:09:03', '2020-09-14 10:32:42'),
('1d9ada3a-f6df-433f-984d-fc8fc95b6c50', 'App\\Notifications\\NotifyNSSCreated', 'App\\User', 4, '{\"nss\":\"NSS camp\",\"studID\":5}', '2020-09-20 10:42:23', '2020-09-19 19:11:47', '2020-09-20 10:42:23'),
('27c00959-58c8-4d0a-aac3-2ecce7b5587b', 'App\\Notifications\\NotifyCurricularDeleted', 'App\\User', 4, '{\"activity\":\"Technical HEAD\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:09:19', '2020-09-20 10:42:24'),
('2da01af2-445e-4237-a0b3-fb0996b65afc', 'App\\Notifications\\NotifyAchievementDeleted', 'App\\User', 4, '{\"achievement\":\"Scored 8 SGPA\",\"studID\":3}', '2020-09-14 11:20:01', '2020-09-14 10:49:39', '2020-09-14 11:20:01'),
('2f0d97be-e79d-4605-97b9-227d97a31cf2', 'App\\Notifications\\NotifyAchievementEdited', 'App\\User', 4, '{\"achievement\":\"Scored 8 SGPA\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:06:48', '2020-09-20 10:42:24'),
('2ffd7a7a-49df-4b37-8ead-417c857bbbcc', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"dsadfdd\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:31:10', '2020-09-20 10:42:25'),
('30cdd8c4-5019-49c0-b57e-646d81cedf1d', 'App\\Notifications\\NotifyNSSEdited', 'App\\User', 4, '{\"nss\":\"CSI\",\"studID\":5}', '2020-09-20 10:42:23', '2020-09-19 19:11:28', '2020-09-20 10:42:23'),
('3cbc5761-4881-4bc3-b07e-226c5a29bd8b', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"gffdhhf\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:54:17', '2020-09-20 10:42:25'),
('47cc6aa2-6fd6-41ec-8f10-02a856d8531f', 'App\\Notifications\\NotifyStudentAccepted', 'App\\User', 10, '{\"prof\":[{\"id\":20,\"stud_id\":7,\"professor\":\"Prof.Sushree Satapathy\"}]}', NULL, '2020-09-21 20:55:01', '2020-09-21 20:55:01'),
('4e1e96a1-c984-4ad2-96d7-94887590a2bc', 'App\\Notifications\\NotifyExtraEdited', 'App\\User', 4, '{\"extra\":\"CSI\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:10:39', '2020-09-20 10:42:24'),
('4f6ddc6d-a4b4-4003-ae89-1f42256a96a3', 'App\\Notifications\\NotifyCourseCreated', 'App\\User', 2, '{\"course\":\"MS in Computer Science\",\"uni\":\"SIT , New Jersey\",\"reqID\":14}', '2020-09-15 19:14:45', '2020-09-15 16:59:34', '2020-09-15 19:14:45'),
('50f242c4-0236-4bee-9ada-d7039dda719f', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"xgfgxfg\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:45:55', '2020-09-20 10:42:25'),
('514e07f6-fc95-49ce-8e0e-ed74735b3a9a', 'App\\Notifications\\NotifyStudentAccepted', 'App\\User', 9, '{\"prof\":[{\"id\":18,\"stud_id\":6,\"professor\":\"Prof.Nilesh Ghavate\"}]}', NULL, '2020-09-21 20:36:40', '2020-09-21 20:36:40'),
('60f553bb-e5f1-4d9c-ad9c-df076653f1ce', 'App\\Notifications\\NotifyAchievementEdited', 'App\\User', 4, '{\"achievement\":\"Scored 8 SGPA\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:05:49', '2020-09-20 10:42:24'),
('6207b400-dd8d-4e1c-a922-691541b5365b', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"deweerwe\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:42:40', '2020-09-20 10:42:25'),
('6210680a-f65d-4eb2-9571-5ba03b705f21', 'App\\Notifications\\NotifyStudentAccepted', 'App\\User', 8, '{\"prof\":\"Prof.Sushree Satapathy\"}', '2020-09-18 18:16:12', '2020-09-18 17:54:45', '2020-09-18 18:16:12'),
('71fd06a4-1714-4f4d-827b-5433c595b9c4', 'App\\Notifications\\NotifyStudentAccepted', 'App\\User', 6, '{\"prof\":\"Prof.Sushree Satapathy\"}', '2020-09-13 22:00:08', '2020-09-13 09:13:01', '2020-09-13 22:00:08'),
('72c35587-6516-4fee-8bfa-bbf7379b2429', 'App\\Notifications\\NotifyExtraCreated', 'App\\User', 4, '{\"extra\":\"Hysteria\",\"studID\":5}', '2020-09-20 10:42:23', '2020-09-19 19:10:54', '2020-09-20 10:42:23'),
('795a3b8b-ebe1-4d44-84e2-a2a335a0c1f0', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"dfdsfd\",\"reqID\":15}', '2020-09-20 10:42:26', '2020-09-19 18:27:27', '2020-09-20 10:42:26'),
('832af3d8-5dd2-4742-a990-a6c1b8f61063', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"fsfdf\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:53:22', '2020-09-20 10:42:25'),
('83398f61-f8cf-4039-8934-bd1751699a75', 'App\\Notifications\\NotifyAWPEdited', 'App\\User', 4, '{\"activity\":\"Project Guide\",\"reqID\":15}', '2020-09-20 10:42:26', '2020-09-18 18:22:33', '2020-09-20 10:42:26'),
('8661908c-8ba3-4b72-abdb-80ed01b81281', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"xgfgxfg\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:45:08', '2020-09-20 10:42:25'),
('86de2d2f-19ec-4540-b5b5-410fcf3f04ad', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"v fcvbg\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:34:35', '2020-09-20 10:42:25'),
('87b74225-ed7b-4288-823d-870cacc621f3', 'App\\Notifications\\NotifyAchievementEdited', 'App\\User', 2, '{\"achievement\":\"Scored 7 SGPA\",\"studID\":4}', '2020-09-15 19:12:18', '2020-09-15 14:42:24', '2020-09-15 19:12:18'),
('8c645a76-e2ed-4b6a-9017-f7f1c591fd72', 'App\\Notifications\\NotifyAchievementEdited', 'App\\User', 4, '{\"achievement\":\"Scored 8 SGPA\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:06:17', '2020-09-20 10:42:24'),
('8db0c9c4-0ea4-4512-b8c3-f6a4f0d5bdf3', 'App\\Notifications\\NotifyAWPEdited', 'App\\User', 4, '{\"activity\":\"Project Guide\",\"reqID\":15}', '2020-09-20 10:42:26', '2020-09-19 18:06:45', '2020-09-20 10:42:26'),
('9d64d30d-d3b5-4e99-a0f8-c3fdc058a8a9', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"deweerwe\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:43:15', '2020-09-20 10:42:25'),
('a1f092d9-257c-4fd0-a18d-5b6d67dae1b7', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"fsfdf\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:50:26', '2020-09-20 10:42:25'),
('a2a66836-e722-4e76-a033-17a06b715fa4', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"v fcvbg\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:31:42', '2020-09-20 10:42:25'),
('a564257b-0a4d-40bf-b231-b7d645e50f86', 'App\\Notifications\\NotifyCourseEdited', 'App\\User', 4, '{\"course\":\"MS in Data Science\",\"uni\":\"RU , New Jersey\",\"reqID\":15}', '2020-09-20 10:42:26', '2020-09-19 19:01:25', '2020-09-20 10:42:26'),
('a9bd0088-0366-4c13-be4f-24e125577425', 'App\\Notifications\\NotifyStudentAccepted', 'App\\User', 9, '{\"prof\":[]}', NULL, '2020-09-21 20:36:44', '2020-09-21 20:36:44'),
('aa60dc30-4e2b-4184-809a-acbd0a0b4ecb', 'App\\Notifications\\NotifyCourseDeleted', 'App\\User', 4, '{\"course\":null,\"uni\":\"gfdgfg\",\"reqID\":15}', '2020-09-20 10:42:26', '2020-09-19 19:02:35', '2020-09-20 10:42:26'),
('ae80d33b-09ae-47a8-a1ea-2a25d8799fba', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"ghcgcf\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:30:50', '2020-09-20 10:42:25'),
('b6865ee3-640c-4bca-b4b9-d0b45c19607c', 'App\\Notifications\\NotifyCourseCreated', 'App\\User', 2, '{\"course\":\"MS in Computer Science\",\"uni\":\"SIT , New Jersey\",\"reqID\":14}', '2020-09-15 19:14:45', '2020-09-15 16:46:48', '2020-09-15 19:14:45'),
('bab53f6c-7e82-42db-b1dc-683f3fadd6a9', 'App\\Notifications\\NotifyExtraEdited', 'App\\User', 4, '{\"extra\":\"Hysteria\",\"studID\":5}', '2020-09-20 10:42:23', '2020-09-19 19:11:10', '2020-09-20 10:42:23'),
('bb79ecce-2d6b-413d-8894-ac4e3a28c186', 'App\\Notifications\\NotifyCurricularEdited', 'App\\User', 4, '{\"activity\":\"Technical HEAD\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:08:01', '2020-09-20 10:42:24'),
('cae83f0a-d6e1-4732-852b-aaafd0ccdbf3', 'App\\Notifications\\NotifyExtraDeleted', 'App\\User', 4, '{\"extra\":\"Hysteria\",\"studID\":5}', '2020-09-20 10:42:23', '2020-09-19 19:11:03', '2020-09-20 10:42:23'),
('cb1a587d-75a2-4a30-984f-15cbf751a666', 'App\\Notifications\\NotifyAchievementDeleted', 'App\\User', 4, '{\"achievement\":\"Scored 8 SGPA\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:07:24', '2020-09-20 10:42:24'),
('d1c8a3e4-01c9-423c-9805-c33872ddb86d', 'App\\Notifications\\NotifyStudentAccepted', 'App\\User', 7, '{\"prof\":\"Prof.Nilesh Ghavate\"}', '2020-09-15 12:58:35', '2020-09-15 07:50:39', '2020-09-15 12:58:35'),
('d96e7c9a-4ca7-411c-bbdd-6b1c9809d219', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"dfdsfd\",\"reqID\":15}', '2020-09-20 10:42:25', '2020-09-19 18:29:44', '2020-09-20 10:42:25'),
('e0cd2632-3dab-463f-9bfd-56b0270f807a', 'App\\Notifications\\notifyachievement', 'App\\User', 4, '{\"achievement\":\"Scored 8 SGPA\",\"studID\":3}', '2020-09-14 11:20:01', '2020-09-14 10:46:30', '2020-09-14 11:20:01'),
('e284be75-b6cb-499d-8fa5-51239784421f', 'App\\Notifications\\NotifyAWPEdited', 'App\\User', 2, '{\"activity\":\"Project Guide\",\"reqID\":14}', '2020-09-15 19:12:18', '2020-09-15 19:09:36', '2020-09-15 19:12:18'),
('e328fe0b-6285-49f1-b3e4-5114cd3a20a9', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"gbcfvbvc\",\"reqID\":15}', '2020-09-20 10:42:26', '2020-09-19 18:08:13', '2020-09-20 10:42:26'),
('e6385e75-740b-465c-888d-10c07a2cc077', 'App\\Notifications\\NotifyCurricularEdited', 'App\\User', 4, '{\"activity\":\"Technical HEAD\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:08:46', '2020-09-20 10:42:24'),
('e73a6c4b-44a9-4001-a6e4-13bc6d83ed05', 'App\\Notifications\\NotifyCurricularCreated', 'App\\User', 4, '{\"activity\":\"Technical HEAD\",\"studID\":5}', '2020-09-20 10:42:24', '2020-09-19 19:09:10', '2020-09-20 10:42:24'),
('eb80d88c-b064-4aa1-9025-f8a6eaa1e6ad', 'App\\Notifications\\NotifyCourseDeleted', 'App\\User', 2, '{\"course\":null,\"uni\":\"SIT , New Jersey\",\"reqID\":14}', '2020-09-15 19:14:45', '2020-09-15 16:58:42', '2020-09-15 19:14:45'),
('fe4fd128-a852-46f6-bfc9-23ac3a19fa5b', 'App\\Notifications\\NotifyCourseCreated', 'App\\User', 4, '{\"course\":\"fxffb\",\"uni\":\"gfdgfg\",\"reqID\":15}', '2020-09-20 10:42:26', '2020-09-19 19:02:12', '2020-09-20 10:42:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roa_criterias`
--

CREATE TABLE `roa_criterias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `req_id` bigint(20) UNSIGNED NOT NULL,
  `Intellectual_Level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Written_Communication` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Oral_Communication` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Imagination_Creativity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Work_Ethic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Character` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Class_Rank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Teaching_Ability` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roa_criterias`
--

INSERT INTO `roa_criterias` (`id`, `req_id`, `Intellectual_Level`, `Written_Communication`, `Oral_Communication`, `Imagination_Creativity`, `Work_Ethic`, `Character`, `Class_Rank`, `Teaching_Ability`, `created_at`, `updated_at`) VALUES
(1, 1, 'L50%', 'T50%', 'T50%', 'T50%', 'T50%', 'T50%', 'L50%', 'T50%', '2020-04-14 22:04:02', '2020-04-14 22:04:02'),
(2, 13, '5%', '5%', '5%', '5%', '5%', '5%', '5%', '5%', '2020-09-14 13:57:52', '2020-09-14 13:57:52'),
(3, 14, '5%', '5%', '5%', '5%', '5%', '5%', '5%', '5%', '2020-09-15 19:20:28', '2020-09-15 19:20:28'),
(4, 15, '5%', '5%', '5%', '5%', '5%', '5%', '5%', '5%', '2020-09-18 16:41:56', '2020-09-18 16:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `roa_datas`
--

CREATE TABLE `roa_datas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `req_id` bigint(20) UNSIGNED NOT NULL,
  `years` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interests` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roa_datas`
--

INSERT INTO `roa_datas` (`id`, `req_id`, `years`, `capacity`, `category`, `other_category`, `interests`, `statement`, `created_at`, `updated_at`) VALUES
(1, 1, '4', 'Student', 'Graduate Students', NULL, 'Computer Science', 'I have known the applicant for four years and his strength are that she is mature , has good written and oral communication , academically fair , has a good character . Her weakness is she ca', '2020-04-14 22:04:01', '2020-04-14 22:04:01'),
(2, 13, '4', 'Student', 'Graduate Students', NULL, 'Computer Science', 'I have known the applicant for four years and his strength are that she is mature , has good written and oral communication , academically fair , has a good character .', '2020-09-14 13:57:52', '2020-09-14 13:57:52'),
(3, 14, '4', 'Student', 'Graduate Students', NULL, 'Computer Science', 'I have known the applicant for four years and his strength are that she is mature , has good written and oral communication , academically fair , has a good character .', '2020-09-15 19:20:28', '2020-09-15 19:20:28'),
(4, 15, '4', 'Student', 'Graduate Students', NULL, 'Computer Science', 'I have known the applicant for four years and his strength are that she is mature , has good written and oral communication , academically fair , has a good character .', '2020-09-18 16:41:55', '2020-09-18 16:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `roa_recommends`
--

CREATE TABLE `roa_recommends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `req_id` bigint(20) UNSIGNED NOT NULL,
  `recommend_highly` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommend` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reservations` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `not_recommend` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roa_recommends`
--

INSERT INTO `roa_recommends` (`id`, `req_id`, `recommend_highly`, `recommend`, `reservations`, `not_recommend`, `created_at`, `updated_at`) VALUES
(1, 1, 'MASTER’S PROGRAM', 'MASTER’S PROGRAM', NULL, NULL, '2020-04-14 22:04:02', '2020-04-14 22:04:02'),
(2, 13, 'MASTER’S PROGRAM', 'MASTER’S PROGRAM', 'DOCToral PROGRAM', 'DOCToral PROGRAM', '2020-09-14 13:57:52', '2020-09-14 13:57:52'),
(3, 14, 'MASTER’S PROGRAM', 'MASTER’S PROGRAM', 'DOCToral PROGRAM', NULL, '2020-09-15 19:20:28', '2020-09-15 19:20:28'),
(4, 15, 'MASTER’S PROGRAM', 'MASTER’S PROGRAM', 'DOCToral PROGRAM', NULL, '2020-09-18 16:41:56', '2020-09-18 16:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Student', '2020-03-23 02:52:08', NULL),
(2, 'Professor', '2020-03-23 02:53:06', NULL),
(3, 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sgpa_6s`
--

CREATE TABLE `sgpa_6s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `Sem_1` double NOT NULL,
  `Sem_2` double NOT NULL,
  `Sem_3` double NOT NULL,
  `Sem_4` double NOT NULL,
  `Sem_5` double NOT NULL,
  `Sem_6` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sgpa_7s`
--

CREATE TABLE `sgpa_7s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `Sem_1` double NOT NULL,
  `Sem_2` double NOT NULL,
  `Sem_3` double NOT NULL,
  `Sem_4` double NOT NULL,
  `Sem_5` double NOT NULL,
  `Sem_6` double NOT NULL,
  `Sem_7` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sgpa_7s`
--

INSERT INTO `sgpa_7s` (`id`, `stud_id`, `Sem_1`, `Sem_2`, `Sem_3`, `Sem_4`, `Sem_5`, `Sem_6`, `Sem_7`, `created_at`, `updated_at`) VALUES
(1, 1, 6.25, 6.25, 6.25, 6.25, 7, 8, 8, '2020-03-23 11:48:01', '2020-03-23 11:48:01'),
(2, 3, 6.25, 6.25, 6.25, 6.25, 6.25, 6, 7, '2020-05-26 13:36:44', '2020-05-26 13:36:44'),
(3, 5, 6.25, 6.25, 6.25, 6.25, 6.25, 6, 7, '2020-09-10 14:20:53', '2020-09-10 14:20:53'),
(4, 8, 6.25, 6.25, 6.25, 6.25, 6.25, 6, 8, '2020-09-10 19:00:15', '2020-09-10 19:00:15'),
(5, 10, 6.25, 6.25, 6.25, 6.25, 6.25, 6, 8, '2020-09-10 19:14:41', '2020-09-10 19:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `sgpa_8s`
--

CREATE TABLE `sgpa_8s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_id` bigint(20) UNSIGNED NOT NULL,
  `Sem_1` double NOT NULL,
  `Sem_2` double NOT NULL,
  `Sem_3` double NOT NULL,
  `Sem_4` double NOT NULL,
  `Sem_5` double NOT NULL,
  `Sem_6` double NOT NULL,
  `Sem_7` double NOT NULL,
  `Sem_8` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sgpa_8s`
--

INSERT INTO `sgpa_8s` (`id`, `stud_id`, `Sem_1`, `Sem_2`, `Sem_3`, `Sem_4`, `Sem_5`, `Sem_6`, `Sem_7`, `Sem_8`, `created_at`, `updated_at`) VALUES
(1, 4, 6.25, 6.25, 6.25, 6.25, 6.25, 6.25, 6.25, 6.25, '2020-09-09 17:05:14', '2020-09-09 17:05:14'),
(2, 6, 6.25, 6.25, 6.25, 6.25, 6.25, 6, 7, 8, '2020-09-10 14:27:32', '2020-09-10 14:27:32'),
(3, 9, 6.25, 6.25, 6.25, 6.25, 6.25, 6, 7, 8, '2020-09-10 19:08:57', '2020-09-10 19:08:57');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studID` bigint(20) NOT NULL,
  `yoa` int(11) NOT NULL,
  `yog` int(11) NOT NULL,
  `gre` int(4) NOT NULL,
  `gmat` int(11) NOT NULL,
  `dob` date NOT NULL,
  `sem` int(11) NOT NULL,
  `diploma` tinyint(1) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `role_id`, `name`, `branch`, `studID`, `yoa`, `yog`, `gre`, `gmat`, `dob`, `sem`, `diploma`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Minami Hamabe', 'IT', 2013133512, 2013, 2020, 300, 0, '1995-12-09', 7, 1, 9920878052, '2020-03-23 11:48:01', '2020-03-23 11:48:01'),
(2, 3, 1, 'Ryuji Arima', 'IT', 2013133516, 2016, 2020, 350, 0, '1998-03-11', 7, 0, 4612221895, NULL, NULL),
(3, 6, 1, 'Haruma Miura', 'IT', 1651616516, 2012, 2016, 380, 0, '1994-09-07', 7, 0, 4844564654, '2020-05-26 13:36:44', '2020-05-26 13:36:44'),
(4, 7, 1, 'Tao Tsuchiya', 'IT', 2016133510, 2016, 2020, 300, 0, '1998-01-13', 8, 1, 4545483344, '2020-09-09 17:05:13', '2020-09-09 17:05:13'),
(5, 8, 1, 'Haruna Kawaguchi', 'IT', 2016133511, 2016, 2020, 380, 0, '1998-02-13', 7, 0, 1566541213, '2020-09-10 14:20:53', '2020-09-10 14:20:53'),
(6, 9, 1, 'Mikako Tabe', 'IT', 2016133512, 2016, 2020, 300, 0, '1998-03-13', 8, 1, 6546546546, '2020-09-10 14:27:32', '2020-09-10 14:27:32'),
(7, 10, 1, 'Sota Fukushi', 'IT', 2016133513, 2016, 2020, 350, 0, '1998-04-13', 7, 0, 5166545456, NULL, NULL),
(8, 12, 1, 'Alejandro Beltran', 'IT', 2013133514, 2016, 2020, 350, 0, '1998-05-13', 7, 1, 4684646546, '2020-09-10 19:00:15', '2020-09-10 19:00:15'),
(9, 13, 1, 'Savas Aktan', 'IT', 2013133515, 2016, 2020, 380, 0, '1998-06-13', 8, 0, 5646546546, '2020-09-10 19:08:57', '2020-09-10 19:08:57'),
(10, 14, 1, 'Hugo Centeno', 'IT', 2013133516, 2016, 2020, 350, 350, '1998-07-13', 7, 1, 6644546464, '2020-09-10 19:14:41', '2020-09-10 19:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `transcripts`
--

CREATE TABLE `transcripts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `RPE` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sem` int(2) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transcript_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copies` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `I_agree` tinyint(1) NOT NULL,
  `Letter` tinyint(1) NOT NULL,
  `Done` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transcripts`
--

INSERT INTO `transcripts` (`id`, `user_id`, `RPE`, `sem`, `address`, `transcript_for`, `copies`, `I_agree`, `Letter`, `Done`, `created_at`, `updated_at`) VALUES
(1, 1, 'BE-7-MAY-2019', 0, 'HARSHVARDHAN', 'MASTERS', '4', 1, 1, 1, NULL, NULL),
(2, 3, 'BE-7-DEC-2019', 7, 'KURLA', 'HIGHER STUDIES', '4', 1, 1, 1, '2020-09-22 04:42:01', '2020-09-22 04:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `profile_image`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'images.jfif', 'Minami Hamabe', 'ilgjxalxo@gmail.com', NULL, '$2y$10$EKZlUUEADBG89TaEM9uCfezraK9rnGqlH518skKcXBeDZGLKqnIbe', 1, '8llT50LIsansGbvkMyspwX0WYFGCu4isY0ZnDJrdvGjLUCcApRRCmsrb5gAz', '2020-03-23 11:48:01', '2020-03-23 11:48:01'),
(2, 'img', 'Prof.Nilesh Ghavate', 'nilesh.dbit@gmail.com', NULL, '$2y$10$N3G3Cypk00PAXlkVZe0EduxwoOIzv9vGwQv/MeGT9/wLW6IGnx.0S', 2, 'gqZxvt1xk8CNeyOJ9o7xyjkhHmDK5alOKmsl3PQjxUFNR4htZ1IHeyBPHBPT', '2020-03-27 13:30:09', '2020-03-27 13:30:09'),
(3, 'pic.jfif', 'Ryuji Arima', 'arimaryuji@gmail.com', NULL, '$2y$10$xt3ARcTh9z/HnmUWR5.sd.1CJL5DjoCgkXcD3AyFgvQ8d2SIM2ImO', 1, '7kZ1dTQAMPBwjA0wTrIVPwKrxsushIgymPa6yn64FVN33Ic0cikNiIQXrbT8', '2020-03-30 15:44:48', '2020-03-30 15:44:48'),
(4, 'sp', 'Prof.Sushree Satapathy', 'sushree.dbit@dbclmumbai.org', NULL, '$2y$10$HxQtg4pD4piE4DCjSWlUv.a5J3n7Z8gcskVkKkrlWKHELQYA8WdHK', 2, 'Vuq9iHi4ZKROBxccWQFNX5x2HoonEpqAOgItU8I9O3qSc9gLY63gV6xuK4Dp', '2020-04-09 05:14:25', '2020-04-09 05:14:25'),
(5, 'pic', 'Admin', 'admin.dbit@gmail.com', NULL, '$2y$10$bf08kxH0bM8zcooo9nGTCugCj85/gXyitAQGm3p45SO37CthQynp2', 3, 'vTI63T5VfmkvCP05mkJh5RDHyJ9LQj0NCpaGwgPAQSj13YK4Ja0s4kLDE7Q5', '2020-04-16 23:05:04', '2020-04-16 23:05:04'),
(6, 'ryuji.jpeg', 'Haruma Miura', 'miuraharuma@gmail.com', NULL, '$2y$10$0p7MHOZhVLwV85D3kZZrquDWLHL9sxs3s/UCXrF4C3IE8RFNHeody', 1, 'ZKfLzskN7QXClkhsqS1fBKv2UGZnIOlIF5g5PXSZ7T8lGSSvxzsz6B3QsjaW', '2020-05-26 13:36:43', '2020-05-26 13:36:43'),
(7, 'images.jfif', 'Tao Tsuchiya', 'taotsuchiya@gmail.com', NULL, '$2y$10$awkAynLizyEC/5QGvgvDEeOyGeElpERJt3O5j7Dl119IBu/eXzKWS', 1, 'kSRWj8aTO1jeCc0qrGhr22rYRNiccsUJZDh30WMsJY2HZMCkCIjVQSg7ID6H', '2020-09-09 17:05:13', '2020-09-09 17:05:13'),
(8, 'images.jfif', 'Haruna Kawaguchi', 'kawaguchiharuna@gmail.com', NULL, '$2y$10$kNNs3Q6O/.fuyRMtp5MkA..sNehIC3Gf6vETFTOSh8MZnjukF3SoK', 1, 'Qx9Uyt8uGHl7GZ8Vj5hZBdKhIo34pATY2JCdiuNg0VdyKkohxOGwAqE2TLmY', '2020-09-10 14:20:53', '2020-09-10 14:20:53'),
(9, 'images.jfif', 'Mikako Tabe', 'tabemikako@gmail.com', NULL, '$2y$10$PjhboaJtWT6Zn8ZIeVnDgepX1.fruuYhcrE.MaAeRQiJ12GMnmiZK', 1, 'JbaewBTnJ27mmsmQl3wDD085qzbSQwpnRUw5mFKlnbBAadvLmckwfTy9lPgR', '2020-09-10 14:27:31', '2020-09-10 14:27:31'),
(10, 'download.jfif', 'Sota Fukushi', 'fukushisota@gmail.com', NULL, '$2y$10$F6CAUutWnWtEvATQtP8r1eMIEVTRhhQgVN4LIu6hdg1wOvpA2BQ/.', 1, 'PTgNsXbafk8ZkDUeS3PwDIxGaJYRyN7cyF8Zb70JtrYlWfN3vCnHca7b2jwc', '2020-09-10 14:36:16', '2020-09-10 14:36:16'),
(12, 'download.jfif', 'Alejandro Beltran', 'alejandrobeltran@gmail.com', NULL, '$2y$10$IKDhOnyPOHv9zIkmCqUZDu8hRAu9Za.zkq7sH0D16p3ToFYbG2GnC', 1, 'ubqOUAJqpLM8n18z65yZhBWoA7Awd6EeHnEjEaZUAJyGRheN0cQbWbwUgcq0', '2020-09-10 19:00:15', '2020-09-10 19:00:15'),
(13, 'download.jfif', 'Savas Aktan', 'savasaktan@gmail.com', NULL, '$2y$10$1RPs/E2N1/Hj.GJ6SS/pruBFnowPrkwMsVQjQA7ZM20beEAArsO3i', 1, 'OYR43aY1gb38VMyoUIYOH7sgKIM6PLFSddDSYCq75eI6EhYyI1B6Ne5q97ek', '2020-09-10 19:08:56', '2020-09-10 19:08:56'),
(14, 'download.jfif', 'Hugo Centeno', 'hugocenteno@gmail.com', NULL, '$2y$10$UumwMkFdTDFV.8/OHLihB.C4IhEioBk6Fil00e2R5eR6ZUCzQ4BGG', 1, 'UtTONOzNi27xvhk322OaigsakSRUd39MrsWsWwGdEOkVlBtZO63WmNu81feA', '2020-09-10 19:14:41', '2020-09-10 19:14:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acceptedunis`
--
ALTER TABLE `acceptedunis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acceptedunis_req_id_foreign` (`req_id`);

--
-- Indexes for table `d_sgpis`
--
ALTER TABLE `d_sgpis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `d_sgpis_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `feedback_token_unique` (`token`),
  ADD KEY `feedback_stud_id_foreign` (`stud_id`),
  ADD KEY `feedback_req_id_foreign` (`req_id`);

--
-- Indexes for table `lor_achievements`
--
ALTER TABLE `lor_achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_achievements_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `lor_activities`
--
ALTER TABLE `lor_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_activities_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `lor_courses`
--
ALTER TABLE `lor_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_courses_stud_id_foreign` (`stud_id`),
  ADD KEY `lor_courses_req_id_foreign` (`req_id`);

--
-- Indexes for table `lor_dmarks`
--
ALTER TABLE `lor_dmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_dmarks_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `lor_extras`
--
ALTER TABLE `lor_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_extras_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `lor_marks`
--
ALTER TABLE `lor_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_marks_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `lor_nsses`
--
ALTER TABLE `lor_nsses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_nsses_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `lor_prof_activities`
--
ALTER TABLE `lor_prof_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_prof_activities_stud_id_foreign` (`stud_id`),
  ADD KEY `lor_prof_activities_req_id_foreign` (`req_id`);

--
-- Indexes for table `lor_requests`
--
ALTER TABLE `lor_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_requests_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `lor_universities`
--
ALTER TABLE `lor_universities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lor_universities_stud_id_foreign` (`stud_id`),
  ADD KEY `lor_universities_req_id_foreign` (`req_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roa_criterias`
--
ALTER TABLE `roa_criterias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roa_criterion_req_id_foreign` (`req_id`);

--
-- Indexes for table `roa_datas`
--
ALTER TABLE `roa_datas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roa_data_req_id_foreign` (`req_id`);

--
-- Indexes for table `roa_recommends`
--
ALTER TABLE `roa_recommends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roa_recommendation_req_id_foreign` (`req_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sgpa_6s`
--
ALTER TABLE `sgpa_6s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sgpa_6s_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `sgpa_7s`
--
ALTER TABLE `sgpa_7s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sgpa_7s_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `sgpa_8s`
--
ALTER TABLE `sgpa_8s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sgpa_8s_stud_id_foreign` (`stud_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_user_id_index` (`user_id`),
  ADD KEY `students_role_id_index` (`role_id`);

--
-- Indexes for table `transcripts`
--
ALTER TABLE `transcripts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transcripts_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acceptedunis`
--
ALTER TABLE `acceptedunis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `d_sgpis`
--
ALTER TABLE `d_sgpis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `lor_achievements`
--
ALTER TABLE `lor_achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `lor_activities`
--
ALTER TABLE `lor_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `lor_courses`
--
ALTER TABLE `lor_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lor_dmarks`
--
ALTER TABLE `lor_dmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lor_extras`
--
ALTER TABLE `lor_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `lor_marks`
--
ALTER TABLE `lor_marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lor_nsses`
--
ALTER TABLE `lor_nsses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `lor_prof_activities`
--
ALTER TABLE `lor_prof_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `lor_requests`
--
ALTER TABLE `lor_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `lor_universities`
--
ALTER TABLE `lor_universities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `roa_criterias`
--
ALTER TABLE `roa_criterias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roa_datas`
--
ALTER TABLE `roa_datas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roa_recommends`
--
ALTER TABLE `roa_recommends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sgpa_6s`
--
ALTER TABLE `sgpa_6s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sgpa_7s`
--
ALTER TABLE `sgpa_7s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sgpa_8s`
--
ALTER TABLE `sgpa_8s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transcripts`
--
ALTER TABLE `transcripts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acceptedunis`
--
ALTER TABLE `acceptedunis`
  ADD CONSTRAINT `acceptedunis_req_id_foreign` FOREIGN KEY (`req_id`) REFERENCES `lor_requests` (`id`);

--
-- Constraints for table `d_sgpis`
--
ALTER TABLE `d_sgpis`
  ADD CONSTRAINT `d_sgpis_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_req_id_foreign` FOREIGN KEY (`req_id`) REFERENCES `lor_requests` (`id`),
  ADD CONSTRAINT `feedback_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_achievements`
--
ALTER TABLE `lor_achievements`
  ADD CONSTRAINT `lor_achievements_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_activities`
--
ALTER TABLE `lor_activities`
  ADD CONSTRAINT `lor_activities_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_courses`
--
ALTER TABLE `lor_courses`
  ADD CONSTRAINT `lor_courses_req_id_foreign` FOREIGN KEY (`req_id`) REFERENCES `lor_requests` (`id`),
  ADD CONSTRAINT `lor_courses_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_dmarks`
--
ALTER TABLE `lor_dmarks`
  ADD CONSTRAINT `lor_dmarks_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_extras`
--
ALTER TABLE `lor_extras`
  ADD CONSTRAINT `lor_extras_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_marks`
--
ALTER TABLE `lor_marks`
  ADD CONSTRAINT `lor_marks_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_nsses`
--
ALTER TABLE `lor_nsses`
  ADD CONSTRAINT `lor_nsses_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_prof_activities`
--
ALTER TABLE `lor_prof_activities`
  ADD CONSTRAINT `lor_prof_activities_req_id_foreign` FOREIGN KEY (`req_id`) REFERENCES `lor_requests` (`id`),
  ADD CONSTRAINT `lor_prof_activities_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_requests`
--
ALTER TABLE `lor_requests`
  ADD CONSTRAINT `lor_requests_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `lor_universities`
--
ALTER TABLE `lor_universities`
  ADD CONSTRAINT `lor_universities_req_id_foreign` FOREIGN KEY (`req_id`) REFERENCES `lor_requests` (`id`),
  ADD CONSTRAINT `lor_universities_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `roa_criterias`
--
ALTER TABLE `roa_criterias`
  ADD CONSTRAINT `roa_criterion_req_id_foreign` FOREIGN KEY (`req_id`) REFERENCES `lor_requests` (`id`);

--
-- Constraints for table `roa_datas`
--
ALTER TABLE `roa_datas`
  ADD CONSTRAINT `roa_data_req_id_foreign` FOREIGN KEY (`req_id`) REFERENCES `lor_requests` (`id`);

--
-- Constraints for table `roa_recommends`
--
ALTER TABLE `roa_recommends`
  ADD CONSTRAINT `roa_recommendation_req_id_foreign` FOREIGN KEY (`req_id`) REFERENCES `lor_requests` (`id`);

--
-- Constraints for table `sgpa_6s`
--
ALTER TABLE `sgpa_6s`
  ADD CONSTRAINT `sgpa_6s_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `sgpa_7s`
--
ALTER TABLE `sgpa_7s`
  ADD CONSTRAINT `sgpa_7s_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `sgpa_8s`
--
ALTER TABLE `sgpa_8s`
  ADD CONSTRAINT `sgpa_8s_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transcripts`
--
ALTER TABLE `transcripts`
  ADD CONSTRAINT `transcripts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
