-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2020 at 08:36 AM
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
(1, 1, 6.25, 6.25, 6.25, 7, 8, 8, '2020-03-23 11:48:01', '2020-03-23 11:48:01');

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
(112, 1, 'Scored 8 SGPA', 'Scored 8 SGPA in sem 7', 'user-1.achievement.9', '2020-04-12 19:49:45', '2020-04-12 19:49:45');

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
(11, 1, 'Scored 7 SGPA', 'Scored 7 SGPA in sem 6', 'user-1.activity.18', '2020-04-13 14:26:54', '2020-04-13 14:26:54');

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
(1, 1, 'user-1.dmarksheet.pdf', '2020-03-23 11:48:01', '2020-03-23 11:48:01');

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
(10, 1, 'Scored 8 CGPA', 'Scored 8 CGPA in sem 4', 'user-1.extra.9', '2020-04-13 14:20:14', '2020-04-13 14:20:14');

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
(1, 1, 'user-1.marksheet.pdf', '2020-03-23 11:48:01', '2020-03-23 11:48:01');

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
(9, 1, 'Scored 8', 'Scored 8 SGPA in sem 8', 'user-1.nss.13', '2020-04-05 18:34:24', '2020-04-13 02:43:25');

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
(19, 1, 1, 'PR HEAD', 'PR HEAD in CSI', 'Prof.Nilesh Ghavate', '0', 'user-1.prof_activity.12', '2020-04-13 16:52:23', '2020-04-13 17:15:39');

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
(2, 2, 'Prof.Nilesh Ghavate', 0, 0, 'dgnvhnhjhghjhg', '0000-00-00', NULL, NULL),
(7, 1, 'Prof.Sushree Satapathy', 1, 0, 'user-1.lor_draft.pdf', '0000-00-00', '2020-04-09 11:22:41', '2020-04-09 11:22:41');

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
(5, 1, 1, 'MS in Data Science', 'UM , Ann Arbor', 'Computer Science and Engineering', '2020-04-15', '2020-04-14', '2020-03-29 12:31:10', '2020-03-29 12:31:10'),
(7, 1, 1, 'MS in Computer Science', 'NEU , Boston', 'Computing and IT', '2020-04-22', '2020-04-13', '2020-03-29 12:31:11', '2020-04-13 22:30:09'),
(18, 2, 2, 'MS in Data Science', 'UM , Ann Arbor', 'Computer Science and Engineering', '2020-04-15', '0000-00-00', NULL, NULL),
(19, 2, 2, 'MS in Data Science', 'RU , New Jersey', 'Electrical and Computer Engineering\r\n', '2020-04-22', '0000-00-00', NULL, NULL),
(20, 2, 2, 'MS in Computer Science', 'NEU , Boston', 'Computing and IT', '2020-04-22', '0000-00-00', NULL, NULL),
(21, 2, 2, 'MS in Computer Science', 'RIT , Rochester', 'Computer Science', '2020-04-29', '0000-00-00', NULL, NULL),
(22, 2, 2, 'MS in Artificial Intelligence\r\n', 'SIT , New Jersey', 'Electrical and Computer Engineering\r\n', '2020-05-14', '0000-00-00', NULL, NULL),
(23, 1, 1, 'MS in Artificial Intelligence', 'SIT , New Jersey', 'Electrical and Computer Engineering', '2020-04-09', '2020-04-15', '2020-04-06 20:49:30', '2020-04-06 20:49:30'),
(32, 1, 7, 'MS in Data Science', 'UM , Ann Arbor', 'Computer Science and Engineering', '2020-04-11', '0000-00-00', '2020-04-09 11:22:41', '2020-04-09 11:22:41'),
(33, 1, 7, 'MS in Data Science', 'RU , New Jersey', 'Electrical and Computer Engineering', '2020-04-12', '0000-00-00', '2020-04-09 11:22:41', '2020-04-09 11:22:41'),
(35, 1, 1, 'MS in Computer Science', 'USF , San Francisco', 'Computer Science', '2020-04-16', '2020-04-14', '2020-04-13 22:33:04', '2020-04-13 22:33:04');

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
(36, '2020_04_17_045457_transcipt', 8);

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
('21cc5db0-3a4a-4a10-9147-a14d6fae5a64', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"TECHNICAL HEAD\"}', '2020-04-17 05:04:22', '2020-04-13 16:58:46', '2020-04-17 05:04:22'),
('285edb4d-d174-4399-9e39-680354ad38e7', 'App\\Notifications\\NotifyCourseEdited', 'App\\User', 4, '{\"course\":\"MS in Computer Science\"}', '2020-04-17 05:04:22', '2020-04-13 20:36:45', '2020-04-17 05:04:22'),
('37a8d38d-b3c5-45ef-9baf-17289772269d', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"PR HEAD\"}', '2020-04-17 05:04:22', '2020-04-13 16:42:38', '2020-04-17 05:04:22'),
('38176c8c-3a87-486f-a1a7-07fec4aa4921', 'App\\Notifications\\NotifyCourseEdited', 'App\\User', 4, '{\"course\":\"MS in Computer Science\"}', '2020-04-17 05:04:22', '2020-04-13 18:36:45', '2020-04-17 05:04:22'),
('3babe5c5-b89a-48ba-9dc5-df3869f234b7', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"PR HEAD\"}', '2020-04-17 05:04:23', '2020-04-13 03:13:06', '2020-04-17 05:04:23'),
('4cd644b6-2ed9-46c5-8059-6b787ac5a065', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"PR HEAD\"}', '2020-04-17 05:04:23', '2020-04-13 03:07:10', '2020-04-17 05:04:23'),
('58ccc685-7bbc-45ef-a79c-32c100f6c0c5', 'App\\Notifications\\NotifyCourseEdited', 'App\\User', 4, '{\"course\":\"MS in Computer Science\"}', '2020-04-17 05:04:21', '2020-04-13 20:59:48', '2020-04-17 05:04:21'),
('600ad814-41cb-470b-8a19-9addbc5bd1a7', 'App\\Notifications\\NotifyCurricularCreated', 'App\\User', 4, '{\"activity\":\"Scored 7 SGPA\"}', '2020-04-17 05:04:23', '2020-04-13 02:23:38', '2020-04-17 05:04:23'),
('614d39f7-2ef1-4ed0-9249-8a54914e61d3', 'App\\Notifications\\NotifyCourseEdited', 'App\\User', 4, '{\"course\":\"MS in Computer Science\"}', '2020-04-17 05:04:21', '2020-04-13 20:46:25', '2020-04-17 05:04:21'),
('6199efc7-f758-40b6-8d45-51b1f88e0628', 'App\\Notifications\\NotifyNSSEdited', 'App\\User', 4, '{\"nss\":\"Scored 8\"}', '2020-04-17 05:04:23', '2020-04-13 02:43:26', '2020-04-17 05:04:23'),
('6d440a03-91c2-4877-9b50-2d162453ad0c', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"TECHNICAL HEAD\"}', '2020-04-17 05:04:22', '2020-04-13 16:55:55', '2020-04-17 05:04:22'),
('6e33e8b3-2d38-4571-ae63-68e728c19cce', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"PR HEAD\"}', '2020-04-17 05:04:22', '2020-04-13 16:28:45', '2020-04-17 05:04:22'),
('6f34f420-5be5-48a4-b9d6-0cc847b14b00', 'App\\Notifications\\NotifyAWPCreated', 'App\\User', 4, '{\"activity\":\"PR HEAD\"}', '2020-04-17 05:04:23', '2020-04-13 03:53:52', '2020-04-17 05:04:23'),
('86db4066-8b4a-453f-9df3-2a16ac3a1df4', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"PR HEAD\"}', '2020-04-17 05:04:22', '2020-04-13 16:43:58', '2020-04-17 05:04:22'),
('8bb66d70-9286-4973-86b3-d7df636779b7', 'App\\Notifications\\NotifyCourseEdited', 'App\\User', 4, '{\"course\":\"MS in Computer Science\"}', '2020-04-17 05:04:21', '2020-04-13 22:30:09', '2020-04-17 05:04:21'),
('963dc2f0-5635-4fc6-8863-633146817638', 'App\\Notifications\\NotifyAWPEdited', 'App\\User', 4, '{\"activity\":\"PR HEAD\"}', '2020-04-17 05:04:22', '2020-04-13 17:15:39', '2020-04-17 05:04:22'),
('9759908c-e3ec-40a8-a192-8e4f3ba00898', 'App\\Notifications\\NotifyAWPEdited', 'App\\User', 4, '{\"activity\":\"TECHNICAL HEAD\"}', '2020-04-17 05:04:22', '2020-04-13 17:01:00', '2020-04-17 05:04:22'),
('9bdd68ed-1719-4d25-bc61-c07a03c8b64a', 'App\\Notifications\\NotifyAWPDeleted', 'App\\User', 4, '{\"activity\":\"TECHNICAL HEAD\"}', '2020-04-17 05:04:22', '2020-04-13 17:00:17', '2020-04-17 05:04:22');

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
(1, 1, 'L50%', 'T50%', 'T50%', 'T50%', 'T50%', 'T50%', 'L50%', 'T50%', '2020-04-14 22:04:02', '2020-04-14 22:04:02');

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
(1, 1, '4', 'Student', 'Graduate Students', NULL, 'Computer Science', 'I have known the applicant for four years and his strength are that she is mature , has good written and oral communication , academically fair , has a good character . Her weakness is she ca', '2020-04-14 22:04:01', '2020-04-14 22:04:01');

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
(1, 1, 'MASTER’S PROGRAM', 'MASTER’S PROGRAM', NULL, NULL, '2020-04-14 22:04:02', '2020-04-14 22:04:02');

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
(1, 1, 6.25, 6.25, 6.25, 6.25, 7, 8, 8, '2020-03-23 11:48:01', '2020-03-23 11:48:01');

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

INSERT INTO `students` (`id`, `user_id`, `role_id`, `name`, `branch`, `studID`, `yoa`, `yog`, `dob`, `sem`, `diploma`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Genevieve Xalxo', 'IT', 2013133512, 2013, 2020, '1995-12-09', 7, 1, 9920878052, '2020-03-23 11:48:01', '2020-03-23 11:48:01'),
(2, 3, 1, 'Ryuji Arima', 'IT', 2013133516, 2016, 2020, '1998-03-11', 7, 0, 4612221895, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transcripts`
--

CREATE TABLE `transcripts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `RPE` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transcript_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copies` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `I_agree` tinyint(1) NOT NULL,
  `Letter` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transcripts`
--

INSERT INTO `transcripts` (`id`, `user_id`, `RPE`, `address`, `transcript_for`, `copies`, `I_agree`, `Letter`, `created_at`, `updated_at`) VALUES
(1, 1, 'BE-7-MAY-2019', 'HARSHVARDHAN', 'MASTERS', '4', 1, 1, NULL, NULL);

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
(1, 'capture.png', 'Genevieve Xalxo', 'genevievexal@hotmail.com', NULL, '$2y$10$EKZlUUEADBG89TaEM9uCfezraK9rnGqlH518skKcXBeDZGLKqnIbe', 1, 'g5yTP6HOrW1drZnP8szEfY5UoDv4ajGYifEUwMgckHGfmPEXOR47CHRflfOf', '2020-03-23 11:48:01', '2020-03-23 11:48:01'),
(2, 'img', 'Prof.Nilesh Ghavate', 'nilesh.dbit@gmail.com', NULL, '$2y$10$N3G3Cypk00PAXlkVZe0EduxwoOIzv9vGwQv/MeGT9/wLW6IGnx.0S', 2, 'poZQi0bArve8OsAMYYmbPvQEI0ITpA8CEUygIi0Xa8fd5PAdUjPPLCnaByjE', '2020-03-27 13:30:09', '2020-03-27 13:30:09'),
(3, 'pic.jfif', 'Ryuji Arima', 'arimaryuji@gmail.com', NULL, '$2y$10$xt3ARcTh9z/HnmUWR5.sd.1CJL5DjoCgkXcD3AyFgvQ8d2SIM2ImO', 1, 'x8EsV45Zt0SboPz5zrEWKFVMsVYmzCfHILPfsffrb662rxTTef2y5Ahi8ybI', '2020-03-30 15:44:48', '2020-03-30 15:44:48'),
(4, 'sp', 'Prof.Sushree Satapathy', 'sushree.dbit@dbclmumbai.org', NULL, '$2y$10$HxQtg4pD4piE4DCjSWlUv.a5J3n7Z8gcskVkKkrlWKHELQYA8WdHK', 2, 's3wxyukper8xehp1kw7V7BarKvCuUUZSo5n8ACbrQcN9NRoavZtflri2xqQq', '2020-04-09 05:14:25', '2020-04-09 05:14:25'),
(5, 'pic', 'Admin', 'admin.dbit@gmail.com', NULL, '$2y$10$bf08kxH0bM8zcooo9nGTCugCj85/gXyitAQGm3p45SO37CthQynp2', 3, 'WYjl0lUDcHAaniE4vSLh4nj33IlmYE6036ulZ14BPd8PUNrlxj3rSzH5DFyP', '2020-04-16 23:05:04', '2020-04-16 23:05:04');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `d_sgpis`
--
ALTER TABLE `d_sgpis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lor_achievements`
--
ALTER TABLE `lor_achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `lor_activities`
--
ALTER TABLE `lor_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `lor_courses`
--
ALTER TABLE `lor_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lor_dmarks`
--
ALTER TABLE `lor_dmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lor_extras`
--
ALTER TABLE `lor_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lor_marks`
--
ALTER TABLE `lor_marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lor_nsses`
--
ALTER TABLE `lor_nsses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lor_prof_activities`
--
ALTER TABLE `lor_prof_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lor_requests`
--
ALTER TABLE `lor_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lor_universities`
--
ALTER TABLE `lor_universities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `roa_criterias`
--
ALTER TABLE `roa_criterias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roa_datas`
--
ALTER TABLE `roa_datas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roa_recommends`
--
ALTER TABLE `roa_recommends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sgpa_8s`
--
ALTER TABLE `sgpa_8s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transcripts`
--
ALTER TABLE `transcripts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `d_sgpis`
--
ALTER TABLE `d_sgpis`
  ADD CONSTRAINT `d_sgpis_stud_id_foreign` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`);

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
