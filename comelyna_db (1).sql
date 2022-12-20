-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 13, 2022 at 09:53 AM
-- Server version: 10.3.37-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comelyna_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_sessions`
--

CREATE TABLE `academic_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `session_name` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_sessions`
--

INSERT INTO `academic_sessions` (`id`, `created_at`, `updated_at`, `session_name`, `enabled`, `sort_order`, `description`, `parent_id`) VALUES
(1, '2022-08-02 10:03:45', '2022-11-28 09:34:35', '2020/2021', 1, NULL, 'Academic session for 2020/2021', NULL),
(2, '2022-08-02 10:04:51', '2022-11-27 20:52:29', '2021/2022', 0, NULL, 'Academic session for 2021/2022', NULL),
(3, '2022-08-02 10:06:18', '2022-08-17 12:50:01', '2022/2023', 0, NULL, 'Academic session for 2022/2023', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_role_id` bigint(20) UNSIGNED NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 1,
  `about` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `public` tinyint(1) DEFAULT 1,
  `social_facebook` varchar(191) DEFAULT NULL,
  `social_twitter` varchar(191) DEFAULT NULL,
  `social_linkedin` varchar(191) DEFAULT NULL,
  `social_instagram` varchar(191) DEFAULT NULL,
  `social_website` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `created_at`, `updated_at`, `admin_role_id`, `notify`, `about`, `user_id`, `public`, `social_facebook`, `social_twitter`, `social_linkedin`, `social_instagram`, `social_website`) VALUES
(1, '2022-07-18 09:01:20', '2022-07-19 08:30:12', 1, 1, 'I am a NIMET qualified instructor', 1, 1, NULL, NULL, NULL, NULL, NULL),
(2, '2022-07-19 08:39:19', '2022-12-12 11:22:17', 3, 1, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL),
(3, '2022-08-02 11:30:09', '2022-12-12 11:20:27', 3, 1, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL),
(4, '2022-08-02 11:32:02', '2022-12-12 11:18:04', 3, 1, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL),
(5, '2022-08-02 11:33:20', '2022-12-12 11:16:46', 3, 1, NULL, 6, 1, NULL, NULL, NULL, NULL, NULL),
(6, '2022-08-02 11:35:12', '2022-12-12 11:15:46', 3, 1, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL),
(7, '2022-08-02 12:28:40', '2022-12-12 11:14:10', 3, 1, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL),
(8, '2022-08-02 12:30:27', '2022-12-12 11:11:51', 3, 1, NULL, 9, 1, NULL, NULL, NULL, NULL, NULL),
(9, '2022-08-02 12:33:32', '2022-12-12 11:13:21', 3, 1, NULL, 10, 1, NULL, NULL, NULL, NULL, NULL),
(10, '2022-08-02 12:36:16', '2022-12-12 11:10:44', 3, 1, NULL, 11, 1, NULL, NULL, NULL, NULL, NULL),
(11, '2022-08-02 12:38:52', '2022-12-12 11:09:48', 3, 1, NULL, 12, 1, NULL, NULL, NULL, NULL, NULL),
(12, '2022-08-02 12:41:06', '2022-12-12 11:08:55', 3, 1, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL),
(13, '2022-08-02 12:44:11', '2022-12-12 11:07:14', 3, 1, NULL, 14, 1, NULL, NULL, NULL, NULL, NULL),
(14, '2022-08-02 12:46:25', '2022-12-12 11:06:23', 3, 1, NULL, 15, 1, NULL, NULL, NULL, NULL, NULL),
(15, '2022-08-02 12:50:08', '2022-12-12 11:03:14', 3, 1, NULL, 16, 1, NULL, NULL, NULL, NULL, NULL),
(16, '2022-08-02 12:52:02', '2022-12-12 11:02:07', 3, 1, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL),
(17, '2022-12-12 11:28:02', '2022-12-12 11:28:02', 3, 1, NULL, 73, 1, NULL, NULL, NULL, NULL, NULL),
(18, '2022-12-12 11:29:45', '2022-12-12 11:29:45', 3, 1, NULL, 74, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_admin_role`
--

CREATE TABLE `admin_admin_role` (
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `admin_role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_course`
--

CREATE TABLE `admin_course` (
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_course`
--

INSERT INTO `admin_course` (`admin_id`, `course_id`) VALUES
(2, 7),
(3, 7),
(4, 6),
(5, 6),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `admin_discussion`
--

CREATE TABLE `admin_discussion` (
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `discussion_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_discussion`
--

INSERT INTO `admin_discussion` (`admin_id`, `discussion_id`) VALUES
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, '2022-07-18 09:01:14', '2022-07-18 09:01:14', 'Super Administrator'),
(2, '2022-07-18 09:01:14', '2022-07-18 09:01:14', 'Administrator'),
(3, '2022-07-19 08:38:21', '2022-07-19 08:38:21', 'Instructor'),
(4, '2022-07-19 13:26:30', '2022-07-19 13:26:30', 'Assitant instructor');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permission`
--

CREATE TABLE `admin_role_permission` (
  `admin_role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permission`
--

INSERT INTO `admin_role_permission` (`admin_role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(1, 134),
(1, 135),
(1, 136),
(1, 137),
(1, 138),
(1, 139),
(1, 140),
(1, 141),
(1, 142),
(1, 143),
(1, 144),
(1, 145),
(1, 146),
(1, 147),
(1, 148),
(1, 149),
(1, 150),
(1, 151),
(1, 152),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(2, 92),
(2, 93),
(2, 94),
(2, 95),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 116),
(2, 117),
(2, 118),
(2, 119),
(2, 120),
(2, 125),
(2, 126),
(2, 127),
(2, 128),
(2, 129),
(2, 140),
(2, 141),
(2, 142),
(2, 143),
(2, 144),
(2, 145),
(2, 146),
(2, 147),
(2, 148),
(2, 149),
(2, 150),
(2, 151),
(2, 152),
(1, 153),
(1, 154),
(1, 155),
(1, 156),
(1, 157),
(1, 158),
(1, 159),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 153),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 90),
(3, 91),
(3, 92),
(3, 93),
(3, 94),
(3, 95),
(3, 96),
(3, 97),
(3, 98),
(3, 99),
(3, 100),
(3, 55),
(3, 56),
(3, 57),
(3, 58),
(3, 59),
(3, 60),
(3, 61),
(3, 62),
(3, 63),
(3, 64),
(3, 65),
(3, 66),
(3, 67),
(3, 101),
(3, 102),
(3, 103),
(3, 104),
(3, 105),
(3, 106),
(3, 107),
(3, 108),
(4, 1),
(4, 2),
(4, 153);

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `content` text DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `mobile` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `created_at`, `updated_at`, `title`, `content`, `slug`, `enabled`, `meta_title`, `meta_description`, `mobile`) VALUES
(1, NULL, NULL, 'Who We Are', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'who-we-are', 1, 'Who We Are', NULL, 0),
(2, NULL, NULL, 'Our Services', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'our-services', 1, 'Our Services', NULL, 0),
(3, NULL, NULL, 'FAQ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'faq', 1, 'FAQs', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `type` char(191) NOT NULL,
  `instruction` text DEFAULT NULL,
  `passmark` double(8,2) DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `allow_late` tinyint(1) DEFAULT 0,
  `opening_date` timestamp NULL DEFAULT NULL,
  `schedule_type` char(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `created_at`, `updated_at`, `title`, `course_id`, `lesson_id`, `admin_id`, `due_date`, `type`, `instruction`, `passmark`, `notify`, `allow_late`, `opening_date`, `schedule_type`) VALUES
(1, '2022-07-19 13:21:44', '2022-08-17 00:21:37', 'Test Assignment', 7, NULL, 1, '2022-08-30 23:00:00', 'f', '<p>Test instructions</p>', 50.00, NULL, 1, '2022-08-15 23:00:00', 's');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_certificate`
--

CREATE TABLE `assignment_certificate` (
  `certificate_id` bigint(20) UNSIGNED NOT NULL,
  `assignment_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submissions`
--

CREATE TABLE `assignment_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `assignment_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `content` text DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `grade` double(8,2) DEFAULT NULL,
  `editable` tinyint(1) NOT NULL DEFAULT 0,
  `admin_comment` text DEFAULT NULL,
  `submitted` tinyint(1) NOT NULL DEFAULT 0,
  `student_comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignment_submissions`
--

INSERT INTO `assignment_submissions` (`id`, `created_at`, `updated_at`, `assignment_id`, `student_id`, `content`, `file_path`, `grade`, `editable`, `admin_comment`, `submitted`, `student_comment`) VALUES
(1, '2022-08-17 03:03:49', '2022-08-17 03:12:32', 1, 2, NULL, 'usermedia/student_uploads/2022_08/16607090292_hp2.jpg', 55.00, 0, 'Good work', 1, 'l have done all my homework.');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_blog_post`
--

CREATE TABLE `blog_category_blog_post` (
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `blog_post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `content` text DEFAULT NULL,
  `cover_photo` varchar(191) DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_page_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `orientation` char(191) NOT NULL,
  `description` text DEFAULT NULL,
  `html` text DEFAULT NULL,
  `any_session` tinyint(1) DEFAULT 0,
  `max_downloads` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_exam`
--

CREATE TABLE `certificate_exam` (
  `certificate_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_lesson`
--

CREATE TABLE `certificate_lesson` (
  `certificate_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_test`
--

CREATE TABLE `certificate_test` (
  `certificate_id` bigint(20) UNSIGNED NOT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `iso_code_2` varchar(191) NOT NULL,
  `iso_code_3` varchar(191) NOT NULL,
  `currency_name` varchar(191) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `symbol_left` varchar(191) NOT NULL,
  `symbol_right` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `created_at`, `updated_at`, `name`, `iso_code_2`, `iso_code_3`, `currency_name`, `currency_code`, `symbol_left`, `symbol_right`) VALUES
(1, NULL, NULL, 'Aaland Islands', 'AX', 'ALA', 'Euro', 'EUR', '€', ''),
(2, NULL, NULL, 'Afghanistan', 'AF', 'AFG', 'Afghani', 'AFN', '?', ''),
(3, NULL, NULL, 'Albania', 'AL', 'ALB', 'Lek', 'ALL', 'L', ''),
(4, NULL, NULL, 'Algeria', 'DZ', 'DZA', 'Algerian Dinar', 'DZD', '?.?', ''),
(5, NULL, NULL, 'American Samoa', 'AS', 'ASM', 'Euros', 'EUR', '$', ''),
(6, NULL, NULL, 'Andorra', 'AD', 'AND', 'Euros', 'EUR', '€', ''),
(7, NULL, NULL, 'Angola', 'AO', 'AGO', 'Angolan kwanza', 'AOA', 'Kz', ''),
(8, NULL, NULL, 'Anguilla', 'AI', 'AIA', 'East Caribbean Dollar', 'XCD', '$', ''),
(9, NULL, NULL, 'Antarctica', 'AQ', 'ATA', 'Antarctican dollar', 'AQD', '$', ''),
(10, NULL, NULL, 'Antigua and Barbuda', 'AG', 'ATG', 'East Caribbean Dollar', 'XCD', '$', ''),
(11, NULL, NULL, 'Argentina', 'AR', 'ARG', 'Peso', 'ARS', '$', ''),
(12, NULL, NULL, 'Armenia', 'AM', 'ARM', 'Dram', 'AMD', '', ''),
(13, NULL, NULL, 'Aruba', 'AW', 'ABW', 'Netherlands Antilles Guilder', 'ANG', 'ƒ', ''),
(14, NULL, NULL, 'Australia', 'AU', 'AUS', 'Australian Dollars', 'AUD', '$', ''),
(15, NULL, NULL, 'Austria', 'AT', 'AUT', 'Euros', 'EUR', '€', ''),
(16, NULL, NULL, 'Azerbaijan', 'AZ', 'AZE', 'Manat', 'AZN', '', ''),
(17, NULL, NULL, 'Bahamas', 'BS', 'BHS', 'Bahamian Dollar', 'BSD', '$', ''),
(18, NULL, NULL, 'Bahrain', 'BH', 'BHR', 'Bahraini Dinar', 'BHD', '.?.?', ''),
(19, NULL, NULL, 'Bangladesh', 'BD', 'BGD', 'Taka', 'BDT', '?', ''),
(20, NULL, NULL, 'Barbados', 'BB', 'BRB', 'Barbadian Dollar', 'BBD', '$', ''),
(21, NULL, NULL, 'Belarus', 'BY', 'BLR', 'Belarus Ruble', 'BYR', 'Br', ''),
(22, NULL, NULL, 'Belgium', 'BE', 'BEL', 'Euros', 'EUR', '€', ''),
(23, NULL, NULL, 'Belize', 'BZ', 'BLZ', 'Belizean Dollar', 'BZD', '$', ''),
(24, NULL, NULL, 'Benin', 'BJ', 'BEN', 'CFA Franc BCEAO', 'XOF', 'Fr', ''),
(25, NULL, NULL, 'Bermuda', 'BM', 'BMU', 'Bermudian Dollar', 'BMD', '$', ''),
(26, NULL, NULL, 'Bhutan', 'BT', 'BTN', 'Indian Rupee', 'INR', '₹', ''),
(27, NULL, NULL, 'Bolivia', 'BO', 'BOL', 'Boliviano', 'BOB', 'Bs.', ''),
(28, NULL, NULL, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 'United States Dollar', 'USD', '$', ''),
(29, NULL, NULL, 'Bosnia and Herzegovina', 'BA', 'BIH', 'Bosnia and Herzegovina convertible mark', 'BAM', '', ''),
(30, NULL, NULL, 'Botswana', 'BW', 'BWA', 'Pula', 'BWP', 'P', ''),
(31, NULL, NULL, 'Bouvet Island', 'BV', 'BVT', 'Norwegian Krone', 'NOK', 'kr', ''),
(32, NULL, NULL, 'Brazil', 'BR', 'BRA', 'Brazil', 'BRL', 'R$', ''),
(33, NULL, NULL, 'British Indian Ocean Territory', 'IO', 'IOT', 'United States Dollar', 'USD', '$', ''),
(34, NULL, NULL, 'Brunei Darussalam', 'BN', 'BRN', 'Bruneian Dollar', 'BND', '$', ''),
(35, NULL, NULL, 'Bulgaria', 'BG', 'BGR', 'Lev', 'BGN', '??', ''),
(36, NULL, NULL, 'Burkina Faso', 'BF', 'BFA', 'CFA Franc BCEAO', 'XOF', 'Fr', ''),
(37, NULL, NULL, 'Burundi', 'BI', 'BDI', 'Burundi Franc', 'BIF', 'Fr', ''),
(38, NULL, NULL, 'Cambodia', 'KH', 'KHM', 'Riel', 'KHR', '?', ''),
(39, NULL, NULL, 'Cameroon', 'CM', 'CMR', 'CFA Franc BEAC', 'XAF', 'Fr', ''),
(40, NULL, NULL, 'Canada', 'CA', 'CAN', 'Canadian Dollar', 'CAD', '$', ''),
(41, NULL, NULL, 'Canary Islands', 'IC', 'ICA', 'Euro', 'EUR', '', ''),
(42, NULL, NULL, 'Cape Verde', 'CV', 'CPV', 'Escudo', 'CVE', 'Esc', ''),
(43, NULL, NULL, 'Cayman Islands', 'KY', 'CYM', 'Caymanian Dollar', 'KYD', '$', ''),
(44, NULL, NULL, 'Central African Republic', 'CF', 'CAF', 'CFA Franc BEAC', 'XAF', 'Fr', ''),
(45, NULL, NULL, 'Chad', 'TD', 'TCD', 'CFA Franc BEAC', 'XAF', 'Fr', ''),
(46, NULL, NULL, 'Chile', 'CL', 'CHL', 'Chilean Peso', 'CLP', '$', ''),
(47, NULL, NULL, 'China', 'CN', 'CHN', 'Yuan Renminbi', 'CNY', '¥', ''),
(48, NULL, NULL, 'Christmas Island', 'CX', 'CXR', 'Australian Dollars', 'AUD', '$', ''),
(49, NULL, NULL, 'Cocos (Keeling) Islands', 'CC', 'CCK', 'Australian Dollars', 'AUD', '$', ''),
(50, NULL, NULL, 'Colombia', 'CO', 'COL', 'Peso', 'COP', '$', ''),
(51, NULL, NULL, 'Comoros', 'KM', 'COM', 'Comoran Franc', 'KMF', 'Fr', ''),
(52, NULL, NULL, 'Congo', 'CG', 'COG', 'CFA Franc BEAC', 'XAF', 'Fr', ''),
(53, NULL, NULL, 'Cook Islands', 'CK', 'COK', 'New Zealand Dollars', 'NZD', '$', ''),
(54, NULL, NULL, 'Costa Rica', 'CR', 'CRI', 'Costa Rican Colon', 'CRC', '?', ''),
(55, NULL, NULL, 'Cote D\'Ivoire', 'CI', 'CIV', 'CFA Franc BCEAO', 'XOF', 'Fr', ''),
(56, NULL, NULL, 'Croatia', 'HR', 'HRV', 'Croatian Dinar', 'HRK', 'kn', ''),
(57, NULL, NULL, 'Cuba', 'CU', 'CUB', 'Cuban Peso', 'CUP', '$', ''),
(58, NULL, NULL, 'Curacao', 'CW', 'CUW', 'Netherlands Antillean guilder', 'NAF', 'ƒ', ''),
(59, NULL, NULL, 'Cyprus', 'CY', 'CYP', 'Cypriot Pound', 'CYP', '€', ''),
(60, NULL, NULL, 'Czech Republic', 'CZ', 'CZE', 'Koruna', 'CZK', 'K?', ''),
(61, NULL, NULL, 'Democratic Republic of Congo', 'CD', 'COD', 'Congolese Frank', 'CDF', 'Fr', ''),
(62, NULL, NULL, 'Denmark', 'DK', 'DNK', 'Danish Krone', 'DKK', 'kr', ''),
(63, NULL, NULL, 'Djibouti', 'DJ', 'DJI', 'Djiboutian Franc', 'DJF', 'Fr', ''),
(64, NULL, NULL, 'Dominica', 'DM', 'DMA', 'East Caribbean Dollar', 'XCD', '$', ''),
(65, NULL, NULL, 'Dominican Republic', 'DO', 'DOM', 'Dominican Peso', 'DOP', '$', ''),
(66, NULL, NULL, 'East Timor', 'TL', 'TLS', 'United States Dollar', 'USD', '$', ''),
(67, NULL, NULL, 'Ecuador', 'EC', 'ECU', 'Sucre', 'ECS', '$', ''),
(68, NULL, NULL, 'Egypt', 'EG', 'EGY', 'Egyptian Pound', 'EGP', '£', ''),
(69, NULL, NULL, 'El Salvador', 'SV', 'SLV', 'Salvadoran Colon', 'SVC', '$', ''),
(70, NULL, NULL, 'Equatorial Guinea', 'GQ', 'GNQ', 'CFA Franc BEAC', 'XAF', 'Fr', ''),
(71, NULL, NULL, 'Eritrea', 'ER', 'ERI', 'Ethiopian Birr', 'ETB', 'Nfk', ''),
(72, NULL, NULL, 'Estonia', 'EE', 'EST', 'Estonian Kroon', 'EEK', '€', ''),
(73, NULL, NULL, 'Ethiopia', 'ET', 'ETH', 'Ethiopian Birr', 'ETB', 'Br', ''),
(74, NULL, NULL, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 'Falkland Pound', 'FKP', '£', ''),
(75, NULL, NULL, 'Faroe Islands', 'FO', 'FRO', 'Danish Krone', 'DKK', 'kr', ''),
(76, NULL, NULL, 'Fiji', 'FJ', 'FJI', 'Fijian Dollar', 'FJD', '$', ''),
(77, NULL, NULL, 'Finland', 'FI', 'FIN', 'Euros', 'EUR', '€', ''),
(78, NULL, NULL, 'France, Metropolitan', 'FR', 'FRA', 'Euros', 'EUR', '€', ''),
(79, NULL, NULL, 'French Guiana', 'GF', 'GUF', 'Euros', 'EUR', '€', ''),
(80, NULL, NULL, 'French Polynesia', 'PF', 'PYF', 'CFP Franc', 'XPF', 'Fr', ''),
(81, NULL, NULL, 'French Southern Territories', 'TF', 'ATF', 'Euros', 'EUR', '€', ''),
(82, NULL, NULL, 'FYROM', 'MK', 'MKD', 'Denar', 'MKD', '???', ''),
(83, NULL, NULL, 'Gabon', 'GA', 'GAB', 'CFA Franc BEAC', 'XAF', 'Fr', ''),
(84, NULL, NULL, 'Gambia', 'GM', 'GMB', 'Dalasi', 'GMD', 'D', ''),
(85, NULL, NULL, 'Georgia', 'GE', 'GEO', 'Lari', 'GEL', '?', ''),
(86, NULL, NULL, 'Germany', 'DE', 'DEU', 'Euros', 'EUR', '€', ''),
(87, NULL, NULL, 'Ghana', 'GH', 'GHA', 'Ghana cedi', 'GHS', 'GH¢', ''),
(88, NULL, NULL, 'Gibraltar', 'GI', 'GIB', 'Gibraltar Pound', 'GIP', '£', ''),
(89, NULL, NULL, 'Greece', 'GR', 'GRC', 'Euros', 'EUR', '€', ''),
(90, NULL, NULL, 'Greenland', 'GL', 'GRL', 'Danish Krone', 'DKK', 'kr', ''),
(91, NULL, NULL, 'Grenada', 'GD', 'GRD', 'East Caribbean Dollar', 'XCD', '$', ''),
(92, NULL, NULL, 'Guadeloupe', 'GP', 'GLP', 'Euros', 'EUR', '€', ''),
(93, NULL, NULL, 'Guam', 'GU', 'GUM', 'United States Dollar', 'USD', '$', ''),
(94, NULL, NULL, 'Guatemala', 'GT', 'GTM', 'Quetzal', 'GTQ', 'Q', ''),
(95, NULL, NULL, 'Guernsey', 'GG', 'GGY', 'Guernsey pound', 'GGP', '£', ''),
(96, NULL, NULL, 'Guinea', 'GN', 'GIN', 'Guinean Franc', 'GNF', 'Fr', ''),
(97, NULL, NULL, 'Guinea-Bissau', 'GW', 'GNB', 'CFA Franc BCEAO', 'XOF', 'Fr', ''),
(98, NULL, NULL, 'Guyana', 'GY', 'GUY', 'Guyanaese Dollar', 'GYD', '$', ''),
(99, NULL, NULL, 'Haiti', 'HT', 'HTI', 'Gourde', 'HTG', 'G', ''),
(100, NULL, NULL, 'Heard and Mc Donald Islands', 'HM', 'HMD', 'Australian Dollars', 'AUD', '$', ''),
(101, NULL, NULL, 'Honduras', 'HN', 'HND', 'Lempira', 'HNL', 'L', ''),
(102, NULL, NULL, 'Hong Kong', 'HK', 'HKG', 'HKD', 'HKD', '$', ''),
(103, NULL, NULL, 'Hungary', 'HU', 'HUN', 'Forint', 'HUF', 'Ft', ''),
(104, NULL, NULL, 'Iceland', 'IS', 'ISL', 'Icelandic Krona', 'ISK', 'kr', ''),
(105, NULL, NULL, 'India', 'IN', 'IND', 'Indian Rupee', 'INR', '₹', ''),
(106, NULL, NULL, 'Indonesia', 'ID', 'IDN', 'Indonesian Rupiah', 'IDR', 'Rp', ''),
(107, NULL, NULL, 'Iran (Islamic Republic of)', 'IR', 'IRN', 'Iranian Rial', 'IRR', '?', ''),
(108, NULL, NULL, 'Iraq', 'IQ', 'IRQ', 'Iraqi Dinar', 'IQD', '?.?', ''),
(109, NULL, NULL, 'Ireland', 'IE', 'IRL', 'Euros', 'EUR', '€', ''),
(110, NULL, NULL, 'Israel', 'IL', 'ISR', 'Shekel', 'ILS', '?', ''),
(111, NULL, NULL, 'Italy', 'IT', 'ITA', 'Euros', 'EUR', '€', ''),
(112, NULL, NULL, 'Jamaica', 'JM', 'JAM', 'Jamaican Dollar', 'JMD', '$', ''),
(113, NULL, NULL, 'Japan', 'JP', 'JPN', 'Japanese Yen', 'JPY', '¥', ''),
(114, NULL, NULL, 'Jersey', 'JE', 'JEY', 'Pound Sterling', 'GBP', '£', ''),
(115, NULL, NULL, 'Jordan', 'JO', 'JOR', 'Jordanian Dinar', 'JOD', '?.?', ''),
(116, NULL, NULL, 'Kazakhstan', 'KZ', 'KAZ', 'Tenge', 'KZT', '', ''),
(117, NULL, NULL, 'Kenya', 'KE', 'KEN', 'Kenyan Shilling', 'KES', 'Sh', ''),
(118, NULL, NULL, 'Kiribati', 'KI', 'KIR', 'Australian Dollars', 'AUD', '$', ''),
(119, NULL, NULL, 'Korea, Republic of', 'KR', 'KOR', 'Won', 'KRW', '?', ''),
(120, NULL, NULL, 'Kuwait', 'KW', 'KWT', 'Kuwaiti Dinar', 'KWD', '?.?', ''),
(121, NULL, NULL, 'Kyrgyzstan', 'KG', 'KGZ', 'Som', 'KGS', '?', ''),
(122, NULL, NULL, 'Lao People\'s Democratic Republic', 'LA', 'LAO', 'Kip', 'LAK', '?', ''),
(123, NULL, NULL, 'Latvia', 'LV', 'LVA', 'Lat', 'LVL', '€', ''),
(124, NULL, NULL, 'Lebanon', 'LB', 'LBN', 'Lebanese Pound', 'LBP', '?.?', ''),
(125, NULL, NULL, 'Lesotho', 'LS', 'LSO', 'Loti', 'LSL', 'L', ''),
(126, NULL, NULL, 'Liberia', 'LR', 'LBR', 'Liberian Dollar', 'LRD', '$', ''),
(127, NULL, NULL, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 'Libyan Dinar', 'LYD', '?.?', ''),
(128, NULL, NULL, 'Liechtenstein', 'LI', 'LIE', 'Swiss Franc', 'CHF', 'Fr', ''),
(129, NULL, NULL, 'Lithuania', 'LT', 'LTU', 'Lita', 'LTL', '€', ''),
(130, NULL, NULL, 'Luxembourg', 'LU', 'LUX', 'Euros', 'EUR', '€', ''),
(131, NULL, NULL, 'Macau', 'MO', 'MAC', 'Pataca', 'MOP', 'P', ''),
(132, NULL, NULL, 'Madagascar', 'MG', 'MDG', 'Malagasy Franc', 'MGA', 'Ar', ''),
(133, NULL, NULL, 'Malawi', 'MW', 'MWI', 'Malawian Kwacha', 'MWK', 'MK', ''),
(134, NULL, NULL, 'Malaysia', 'MY', 'MYS', 'Ringgit', 'MYR', 'RM', ''),
(135, NULL, NULL, 'Maldives', 'MV', 'MDV', 'Rufiyaa', 'MVR', '.?', ''),
(136, NULL, NULL, 'Mali', 'ML', 'MLI', 'CFA Franc BCEAO', 'XOF', 'Fr', ''),
(137, NULL, NULL, 'Malta', 'MT', 'MLT', 'Maltese Lira', 'MTL', '€', ''),
(138, NULL, NULL, 'Marshall Islands', 'MH', 'MHL', 'United States Dollar', 'USD', '$', ''),
(139, NULL, NULL, 'Martinique', 'MQ', 'MTQ', 'Euros', 'EUR', '€', ''),
(140, NULL, NULL, 'Mauritania', 'MR', 'MRT', 'Ouguiya', 'MRO', 'UM', ''),
(141, NULL, NULL, 'Mauritius', 'MU', 'MUS', 'Mauritian Rupee', 'MUR', '?', ''),
(142, NULL, NULL, 'Mayotte', 'YT', 'MYT', 'Euros', 'EUR', '€', ''),
(143, NULL, NULL, 'Mexico', 'MX', 'MEX', 'Peso', 'MXN', '$', ''),
(144, NULL, NULL, 'Micronesia, Federated States of', 'FM', 'FSM', 'United States Dollar', 'USD', '$', ''),
(145, NULL, NULL, 'Moldova, Republic of', 'MD', 'MDA', 'Leu', 'MDL', 'L', ''),
(146, NULL, NULL, 'Monaco', 'MC', 'MCO', 'Euros', 'EUR', '€', ''),
(147, NULL, NULL, 'Mongolia', 'MN', 'MNG', 'Tugrik', 'MNT', '?', ''),
(148, NULL, NULL, 'Montenegro', 'ME', 'MNE', 'Euro', 'EUR', '€', ''),
(149, NULL, NULL, 'Montserrat', 'MS', 'MSR', 'East Caribbean Dollar', 'XCD', '$', ''),
(150, NULL, NULL, 'Morocco', 'MA', 'MAR', 'Dirham', 'MAD', '?.?.', ''),
(151, NULL, NULL, 'Mozambique', 'MZ', 'MOZ', 'Metical', 'MZN', 'MT', ''),
(152, NULL, NULL, 'Myanmar', 'MM', 'MMR', 'Kyat', 'MMK', 'Ks', ''),
(153, NULL, NULL, 'Namibia', 'NA', 'NAM', 'Dollar', 'NAD', '$', ''),
(154, NULL, NULL, 'Nauru', 'NR', 'NRU', 'Australian Dollars', 'AUD', '$', ''),
(155, NULL, NULL, 'Nepal', 'NP', 'NPL', 'Nepalese Rupee', 'NPR', '?', ''),
(156, NULL, NULL, 'Netherlands', 'NL', 'NLD', 'Euros', 'EUR', '€', ''),
(157, NULL, NULL, 'Netherlands Antilles', 'AN', 'ANT', 'Netherlands Antilles Guilder', 'ANG', '', ''),
(158, NULL, NULL, 'New Caledonia', 'NC', 'NCL', 'CFP Franc', 'XPF', 'Fr', ''),
(159, NULL, NULL, 'New Zealand', 'NZ', 'NZL', 'New Zealand Dollars', 'NZD', '$', ''),
(160, NULL, NULL, 'Nicaragua', 'NI', 'NIC', 'Cordoba Oro', 'NIO', 'C$', ''),
(161, NULL, NULL, 'Niger', 'NE', 'NER', 'CFA Franc BCEAO', 'XOF', 'Fr', ''),
(162, NULL, NULL, 'Nigeria', 'NG', 'NGA', 'Naira', 'NGN', '₦', ''),
(163, NULL, NULL, 'Niue', 'NU', 'NIU', 'New Zealand Dollars', 'NZD', '$', ''),
(164, NULL, NULL, 'Norfolk Island', 'NF', 'NFK', 'Australian Dollars', 'AUD', '$', ''),
(165, NULL, NULL, 'North Korea', 'KP', 'PRK', 'Won', 'KPW', '?', ''),
(166, NULL, NULL, 'Northern Mariana Islands', 'MP', 'MNP', 'United States Dollar', 'USD', '$', ''),
(167, NULL, NULL, 'Norway', 'NO', 'NOR', 'Norwegian Krone', 'NOK', 'kr', ''),
(168, NULL, NULL, 'Oman', 'OM', 'OMN', 'Sul Rial', 'OMR', '?.?.', ''),
(169, NULL, NULL, 'Pakistan', 'PK', 'PAK', 'Rupee', 'PKR', '?', ''),
(170, NULL, NULL, 'Palau', 'PW', 'PLW', 'United States Dollar', 'USD', '$', ''),
(171, NULL, NULL, 'Palestinian Territory, Occupied', 'PS', 'PSE', 'Jordanian dinar', 'JOD', '?', ''),
(172, NULL, NULL, 'Panama', 'PA', 'PAN', 'Balboa', 'PAB', 'B/.', ''),
(173, NULL, NULL, 'Papua New Guinea', 'PG', 'PNG', 'Kina', 'PGK', 'K', ''),
(174, NULL, NULL, 'Paraguay', 'PY', 'PRY', 'Guarani', 'PYG', '?', ''),
(175, NULL, NULL, 'Peru', 'PE', 'PER', 'Nuevo Sol', 'PEN', 'S/.', ''),
(176, NULL, NULL, 'Philippines', 'PH', 'PHL', 'Peso', 'PHP', '?', ''),
(177, NULL, NULL, 'Pitcairn', 'PN', 'PCN', 'New Zealand Dollars', 'NZD', '$', ''),
(178, NULL, NULL, 'Poland', 'PL', 'POL', 'Zloty', 'PLN', 'z?', ''),
(179, NULL, NULL, 'Portugal', 'PT', 'PRT', 'Euros', 'EUR', '€', ''),
(180, NULL, NULL, 'Puerto Rico', 'PR', 'PRI', 'United States Dollar', 'USD', '$', ''),
(181, NULL, NULL, 'Qatar', 'QA', 'QAT', 'Rial', 'QAR', '?.?', ''),
(182, NULL, NULL, 'Reunion', 'RE', 'REU', 'Euros', 'EUR', '€', ''),
(183, NULL, NULL, 'Romania', 'RO', 'ROM', 'Leu', 'RON', 'lei', ''),
(184, NULL, NULL, 'Russian Federation', 'RU', 'RUS', 'Ruble', 'RUB', '?', ''),
(185, NULL, NULL, 'Rwanda', 'RW', 'RWA', 'Rwanda Franc', 'RWF', 'Fr', ''),
(186, NULL, NULL, 'Saint Kitts and Nevis', 'KN', 'KNA', 'East Caribbean Dollar', 'XCD', '$', ''),
(187, NULL, NULL, 'Saint Lucia', 'LC', 'LCA', 'East Caribbean Dollar', 'XCD', '$', ''),
(188, NULL, NULL, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 'East Caribbean Dollar', 'XCD', '$', ''),
(189, NULL, NULL, 'Samoa', 'WS', 'WSM', 'Euros', 'EUR', 'T', ''),
(190, NULL, NULL, 'San Marino', 'SM', 'SMR', 'Euros', 'EUR', '€', ''),
(191, NULL, NULL, 'Sao Tome and Principe', 'ST', 'STP', 'Dobra', 'STD', 'Db', ''),
(192, NULL, NULL, 'Saudi Arabia', 'SA', 'SAU', 'Riyal', 'SAR', '?.?', ''),
(193, NULL, NULL, 'Senegal', 'SN', 'SEN', 'CFA Franc BCEAO', 'XOF', 'Fr', ''),
(194, NULL, NULL, 'Serbia', 'RS', 'SRB', 'Serbian dinar', 'RSD', '???.', ''),
(195, NULL, NULL, 'Seychelles', 'SC', 'SYC', 'Rupee', 'SCR', '?', ''),
(196, NULL, NULL, 'Sierra Leone', 'SL', 'SLE', 'Leone', 'SLL', 'Le', ''),
(197, NULL, NULL, 'Singapore', 'SG', 'SGP', 'Dollar', 'SGD', '$', ''),
(198, NULL, NULL, 'Slovak Republic', 'SK', 'SVK', 'Koruna', 'SKK', '€', ''),
(199, NULL, NULL, 'Slovenia', 'SI', 'SVN', 'Euros', 'EUR', '€', ''),
(200, NULL, NULL, 'Solomon Islands', 'SB', 'SLB', 'Solomon Islands Dollar', 'SBD', '$', ''),
(201, NULL, NULL, 'Somalia', 'SO', 'SOM', 'Shilling', 'SOS', 'Sh', ''),
(202, NULL, NULL, 'South Africa', 'ZA', 'ZAF', 'Rand', 'ZAR', 'R', ''),
(203, NULL, NULL, 'South Georgia & South Sandwich Islands', 'GS', 'SGS', 'Pound Sterling', 'GBP', '£', ''),
(204, NULL, NULL, 'South Sudan', 'SS', 'SSD', 'South Sudanese Pound', 'SSP', '£', ''),
(205, NULL, NULL, 'Spain', 'ES', 'ESP', 'Euros', 'EUR', '€', ''),
(206, NULL, NULL, 'Sri Lanka', 'LK', 'LKA', 'Rupee', 'LKR', 'Rs', ''),
(207, NULL, NULL, 'St. Barthelemy', 'BL', 'BLM', 'Euro', 'EUR', '€', ''),
(208, NULL, NULL, 'St. Helena', 'SH', 'SHN', 'Pound Sterling', 'GBP', '£', ''),
(209, NULL, NULL, 'St. Martin (French part)', 'MF', 'MAF', 'Netherlands Antillean guilder', 'ANG', '€', ''),
(210, NULL, NULL, 'St. Pierre and Miquelon', 'PM', 'SPM', 'Euro', 'EUR', '€', ''),
(211, NULL, NULL, 'Sudan', 'SD', 'SDN', 'Dinar', 'SDG', '?.?.', ''),
(212, NULL, NULL, 'Suriname', 'SR', 'SUR', 'Surinamese Guilder', 'SRD', '$', ''),
(213, NULL, NULL, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 'Norwegian Krone', 'NOK', 'kr', ''),
(214, NULL, NULL, 'Swaziland', 'SZ', 'SWZ', 'Lilangeni', 'SZL', 'L', ''),
(215, NULL, NULL, 'Sweden', 'SE', 'SWE', 'Krona', 'SEK', 'kr', ''),
(216, NULL, NULL, 'Switzerland', 'CH', 'CHE', 'Swiss Franc', 'CHF', 'Fr', ''),
(217, NULL, NULL, 'Syrian Arab Republic', 'SY', 'SYR', 'Syrian Pound', 'SYP', '£', ''),
(218, NULL, NULL, 'Taiwan', 'TW', 'TWN', 'Dollar', 'TWD', '$', ''),
(219, NULL, NULL, 'Tajikistan', 'TJ', 'TJK', 'Tajikistan Ruble', 'TJS', '??', ''),
(220, NULL, NULL, 'Tanzania, United Republic of', 'TZ', 'TZA', 'Shilling', 'TZS', 'Sh', ''),
(221, NULL, NULL, 'Thailand', 'TH', 'THA', 'Baht', 'THB', '?', ''),
(222, NULL, NULL, 'Togo', 'TG', 'TGO', 'CFA Franc BCEAO', 'XOF', 'Fr', ''),
(223, NULL, NULL, 'Tokelau', 'TK', 'TKL', 'New Zealand Dollars', 'NZD', '$', ''),
(224, NULL, NULL, 'Tonga', 'TO', 'TON', 'PaÕanga', 'TOP', 'T$', ''),
(225, NULL, NULL, 'Trinidad and Tobago', 'TT', 'TTO', 'Trinidad and Tobago Dollar', 'TTD', '$', ''),
(226, NULL, NULL, 'Tunisia', 'TN', 'TUN', 'Tunisian Dinar', 'TND', '?.?', ''),
(227, NULL, NULL, 'Turkey', 'TR', 'TUR', 'Lira', 'TRY', '', ''),
(228, NULL, NULL, 'Turkmenistan', 'TM', 'TKM', 'Manat', 'TMT', 'm', ''),
(229, NULL, NULL, 'Turks and Caicos Islands', 'TC', 'TCA', 'United States Dollar', 'USD', '$', ''),
(230, NULL, NULL, 'Tuvalu', 'TV', 'TUV', 'Australian Dollars', 'AUD', '$', ''),
(231, NULL, NULL, 'Uganda', 'UG', 'UGA', 'Shilling', 'UGX', 'Sh', ''),
(232, NULL, NULL, 'Ukraine', 'UA', 'UKR', 'Hryvnia', 'UAH', '?', ''),
(233, NULL, NULL, 'United Arab Emirates', 'AE', 'ARE', 'Dirham', 'AED', '?.?', ''),
(234, NULL, NULL, 'United Kingdom', 'GB', 'GBR', 'Pound Sterling', 'GBP', '£', ''),
(235, NULL, NULL, 'United States', 'US', 'USA', 'United States Dollar', 'USD', '$', ''),
(236, NULL, NULL, 'United States Minor Outlying Islands', 'UM', 'UMI', 'United States Dollar', 'USD', '$', ''),
(237, NULL, NULL, 'Uruguay', 'UY', 'URY', 'Peso', 'UYU', '$', ''),
(238, NULL, NULL, 'Uzbekistan', 'UZ', 'UZB', 'Som', 'UZS', '', ''),
(239, NULL, NULL, 'Vanuatu', 'VU', 'VUT', 'Vatu', 'VUV', 'Vt', ''),
(240, NULL, NULL, 'Vatican City State (Holy See)', 'VA', 'VAT', 'Euros', 'EUR', '€', ''),
(241, NULL, NULL, 'Venezuela', 'VE', 'VEN', 'Bolivar', 'VEF', 'Bs F', ''),
(242, NULL, NULL, 'Viet Nam', 'VN', 'VNM', 'Dong', 'VND', '?', ''),
(243, NULL, NULL, 'Virgin Islands (British)', 'VG', 'VGB', 'United States Dollar', 'USD', '$', ''),
(244, NULL, NULL, 'Virgin Islands (U.S.)', 'VI', 'VIR', 'United States Dollar', 'USD', '$', ''),
(245, NULL, NULL, 'Wallis and Futuna Islands', 'WF', 'WLF', 'CFP Franc', 'XPF', 'Fr', ''),
(246, NULL, NULL, 'Western Sahara', 'EH', 'ESH', 'Dirham', 'MAD', '?.?.', ''),
(247, NULL, NULL, 'Yemen', 'YE', 'YEM', 'Rial', 'YER', '?', ''),
(248, NULL, NULL, 'Zambia', 'ZM', 'ZMB', 'Kwacha', 'ZMK', 'ZK', ''),
(249, NULL, NULL, 'Zimbabwe', 'ZW', 'ZWE', 'Zimbabwe Dollar', 'ZWD', 'P', '');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `discount` int(11) NOT NULL,
  `expires_on` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL,
  `type` char(191) NOT NULL,
  `total` double DEFAULT NULL,
  `date_start` timestamp NULL DEFAULT NULL,
  `uses_total` int(11) DEFAULT NULL,
  `uses_customer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_course`
--

CREATE TABLE `coupon_course` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_course_category`
--

CREATE TABLE `coupon_course_category` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `course_category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_invoice`
--

CREATE TABLE `coupon_invoice` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_code` varchar(50) DEFAULT NULL,
  `credit_unit` bigint(22) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `enrollment_closes` timestamp NULL DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `payment_required` tinyint(1) DEFAULT NULL,
  `fee` double(8,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `venue` text DEFAULT NULL,
  `type` char(191) NOT NULL,
  `picture` varchar(191) DEFAULT NULL,
  `enable_discussion` tinyint(1) NOT NULL DEFAULT 1,
  `enable_chat` tinyint(1) NOT NULL DEFAULT 1,
  `enforce_order` tinyint(1) NOT NULL DEFAULT 1,
  `effort` varchar(191) DEFAULT NULL,
  `length` varchar(191) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `introduction` text DEFAULT NULL,
  `enable_forum` tinyint(1) NOT NULL DEFAULT 1,
  `enforce_capacity` tinyint(1) DEFAULT 0,
  `session_id` bigint(20) DEFAULT NULL,
  `semester_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `created_at`, `updated_at`, `course_code`, `credit_unit`, `name`, `admin_id`, `enabled`, `start_date`, `end_date`, `enrollment_closes`, `capacity`, `payment_required`, `fee`, `description`, `venue`, `type`, `picture`, `enable_discussion`, `enable_chat`, `enforce_order`, `effort`, `length`, `short_description`, `introduction`, `enable_forum`, `enforce_capacity`, `session_id`, `semester_id`) VALUES
(5, '2022-07-19 10:53:57', '2022-12-12 03:00:38', 'BIP 113', 3, 'Physics (Heat)', 1, 1, NULL, NULL, NULL, 200, 0, NULL, '<h2>BIP 113 - PHYSICS (HEAT)</h2>\r\n\r\n<ol>\r\n	<li>Concept of heat, heat sources, temperature and temperature scales</li>\r\n	<li>Thermometers: liquid-in-class, gas and electrical thermometers</li>\r\n	<li>Effect of heat on matter: solids, liquids and gases. Solids: thermal expansion &ndash; linear, area and volume. Liquids: apparent, real and absolute; expansion of water, Gases: adiabatic</li>\r\n	<li>Application: Bimetallic strips, Heat capacity, specific heat capacity and calorimetry, land and sea breezes, phase change, latent heat</li>\r\n	<li>Heat transfer: conduction, convection and radiation. Solar and terrestrial radiation.</li>\r\n	<li>Gas laws: Boyles, Charles, pressure and Dalton&rsquo;s law</li>\r\n	<li>Kinetic theory of gases. Boiling, evaporation, condensation, vapour pressure.</li>\r\n</ol>\r\n\r\n<h3>LEARNING OUTCOME FOR PHYSICS (HEAT)</h3>\r\n\r\n<p>Understanding of the physical laws and its application to atmospheric science.</p>', NULL, 'c', 'usermedia/WhatsApp_Image_2022-08-16_at_17.50.48.jpeg', 1, 1, 1, '12', '12 Months', 'Short description to Introduction to Remote Sensing and Gis', '<p>Introduction to&nbsp;Introduction to Remote Sensing and Gis</p>', 1, 1, 1, 1),
(6, '2022-07-19 13:17:40', '2022-12-12 09:00:50', 'BIP 112', 3, 'General Meteorology', 1, 1, NULL, NULL, NULL, 300, 0, NULL, '<h2>BIP 112 - GENERAL METEOROLOGY</h2>\r\n\r\n<ol>\r\n	<li>The layers and composition of the atmosphere: water vapour; carbon dioxide; etc Vertical divisions of the atmosphere &ndash; troposphere; stratosphere; mesosphere; thermosphere; ionosphere.</li>\r\n	<li>Heat exchange processes in the atmosphere; solar and terrestrial radiation; Conduction and convection; advection; energy budget of the atmosphere; effect of radiation at the earth&rsquo;s surface; temperature difference between land and sea surfaces.</li>\r\n	<li>Elementary knowledge of synoptic and dynamic meteorology; air motion; Significance of scale; the winds and their causes; rudiments of the General circulation in the tropics and in non-tropical regions; local Winds; diurnal wind variation (breezes) and annual wind variations (monsoons); relation between the horizontal pressure gradient and the Winds; BuysBallot&rsquo;s law and the geostrophic wind; cyclones and Anticyclones; air masses and fronts; thunderstorms; synoptic chart analyses; Weather associated with synoptic systems.</li>\r\n	<li>Atmospheric temperature; horizontal and vertical variations of air Temperature, troposphere and stratosphere. The effect of gravity on the atmosphere, air density, Atmospheric pressure, Variations in pressure; mean sea level pressure; horizontal and vertical pressures; significance of pressure gradient.</li>\r\n	<li>The three states of water; vapour pressure; saturation vapour pressure; evaporation, condensation; freezing; sublimation; isobaric and adiabatic processes; latent heat; Moisture indicators; relative humidity; mixing ratio and dew point.</li>\r\n	<li>Rudiments of cloud, fog and precipitation formation; visibility, the influence of water vapour, of water drops and dust (aerosols).</li>\r\n	<li>Basic knowledge of the vertical stability or instability; non-saturated air and saturated air; isobaric expansion and adiabatic expansion; the influence of condensation.</li>\r\n</ol>', NULL, 'c', 'usermedia/student_uploads/pexels.jpg', 1, 1, 1, '6 hours per week', '12 Months', 'Short description for General Meteorology', '<p>Introduction to&nbsp;General Meteorology</p>', 1, 0, 1, 1),
(7, '2022-07-19 13:39:06', '2022-12-12 02:52:49', 'BIP 111', 4, 'Codes & Observation I', 1, 1, NULL, NULL, NULL, 200, 0, NULL, '<h2>BIP 111 - Codes and observations I</h2>\r\n\r\n<p>Measurement of meteorological variables and procedure of observation. Specific features of Meteorological measurements; Direct and Indirect. Measurement of Temperatures; Air, Maximum, Minimum etc. Measurement of Humidity; Relative Humidity autographic instruments, Derived values with aid of Humidity slide rule, Measurement of Atmospheric Pressures (Barometers,) Barographs). Measurement of Clouds: Forms, Types, Amount, Height of base (Ceilometers, ceiling Ascent, CloudAtlas and Pictures) Measurement of surface Winds.Direction and speed; (Anemometers, and Beaufort scale for estimation). Precipitation Measurements (Rates and Records of precipitation) Solid orLiquid, Gauges units.</p>\r\n\r\n<p>Measurement of Evaporation &ndash; PicheEvaporimeters, Class A PAN/ Tank Evaporimeter Visibility; General unit measurements, Definition of visibility parameters, visibility estimation using visibility targets, andVisibility at night. Measurement of solar radiation (Sunshine recorders, cards andGun-Bellani radiation Integrators).</p>\r\n\r\n<p>Methods and procedures of weather observations,Standard time, accuracy and measurement (UTC unit) Standard International Block and stations numbers e.g. Nigerian Stations Codes Applications of SYNOP code for observation Section O -5 Cloud; Type, form, height of base, Present weather, Visibilityand (Direction and speed), Precipitation (Amount and Duration).</p>\r\n\r\n<p>Application of METAR and SPECI Codes. Application of Question Codes i.e. QCodes.</p>\r\n\r\n<h3>LEARNING OUTCOME ON CODES &amp; OBSERVATION</h3>\r\n\r\n<ul>\r\n	<li>To be able to identify and understand the principle behind the formation and associated weather events</li>\r\n	<li>Ability to collate climatic data for research purposes</li>\r\n	<li>To be able to identify hydrometeors and their method of observation</li>\r\n	<li>To be able to code and transmit information</li>\r\n	<li>Ability to collate climatic data for research purposes</li>\r\n	<li>To be able to conduct necessary observations and understand the techniques</li>\r\n	<li>To be able to identify clouds and their associated characteristics and formation</li>\r\n</ul>', NULL, 'c', 'usermedia/WhatsApp_Image_2022-08-16_at_17.51.14.jpeg', 1, 1, 1, NULL, '24 Months', 'Short description for Codes & Observation I', '<p>Introduction to&nbsp;Codes &amp; Observation I</p>', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `created_at`, `updated_at`, `name`, `enabled`, `sort_order`, `description`, `parent_id`) VALUES
(7, '2022-12-12 02:39:50', '2022-12-12 02:39:50', 'METEOROLOGICAL RESEARCH AND TRAINING', 1, 1, 'METEOROLOGICAL RESEARCH AND TRAINING', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_course_category`
--

CREATE TABLE `course_course_category` (
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `course_category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_course_category`
--

INSERT INTO `course_course_category` (`course_id`, `course_category_id`) VALUES
(7, 7),
(6, 7),
(5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `course_download`
--

CREATE TABLE `course_download` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_exam`
--

CREATE TABLE `course_exam` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `opening_date` timestamp NULL DEFAULT NULL,
  `closing_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_exam`
--

INSERT INTO `course_exam` (`id`, `course_id`, `exam_id`, `opening_date`, `closing_date`) VALUES
(1, 7, 3, '2022-08-10 23:00:00', '2022-08-30 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `course_lesson`
--

CREATE TABLE `course_lesson` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_date` timestamp NULL DEFAULT NULL,
  `lesson_venue` text DEFAULT NULL,
  `lesson_start` varchar(191) DEFAULT NULL,
  `lesson_end` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_lesson`
--

INSERT INTO `course_lesson` (`id`, `course_id`, `lesson_id`, `lesson_date`, `lesson_venue`, `lesson_start`, `lesson_end`, `sort_order`) VALUES
(4, 5, 2, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_lesson_admins`
--

CREATE TABLE `course_lesson_admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_survey`
--

CREATE TABLE `course_survey` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `survey_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_test`
--

CREATE TABLE `course_test` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `opening_date` timestamp NULL DEFAULT NULL,
  `closing_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `exchange_rate` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `created_at`, `updated_at`, `country_id`, `exchange_rate`) VALUES
(1, NULL, NULL, 235, 0.00),
(2, '2022-07-18 09:13:01', '2022-07-18 09:13:01', 162, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `currency_payment_method`
--

CREATE TABLE `currency_payment_method` (
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `question` text DEFAULT NULL,
  `replied` tinyint(1) NOT NULL DEFAULT 0,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`id`, `created_at`, `updated_at`, `student_id`, `subject`, `question`, `replied`, `course_id`, `lecture_id`, `admin`) VALUES
(1, '2022-08-17 06:29:26', '2022-08-17 06:30:02', 2, 'hello', 'what?', 1, 7, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `discussion_replies`
--

CREATE TABLE `discussion_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discussion_id` bigint(20) UNSIGNED NOT NULL,
  `reply` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussion_replies`
--

INSERT INTO `discussion_replies` (`id`, `created_at`, `updated_at`, `discussion_id`, `reply`, `user_id`) VALUES
(1, '2022-08-17 06:30:02', '2022-08-17 06:30:02', 1, 'ok oooh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE `downloads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `description` text DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download_files`
--

CREATE TABLE `download_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `download_id` bigint(20) UNSIGNED NOT NULL,
  `path` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `default` text DEFAULT NULL,
  `placeholders` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `default_subject` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `created_at`, `updated_at`, `name`, `description`, `message`, `default`, `placeholders`, `subject`, `default_subject`) VALUES
(1, NULL, NULL, 'Upcoming class reminder (physical location)', 'This message is sent to students to remind them when a class is scheduled to hold.', '\n                Please be reminded that the class <strong>\'[CLASS_NAME]\'</strong> is scheduled to hold as follows: <br/>\n\n<div><strong>Date:</strong> [CLASS_DATE]</div>\n<div><strong>Session:</strong> [SESSION_NAME]</div>\n<div><strong>Venue:</strong> [CLASS_VENUE] </div>\n<div><strong>Starts:</strong> [CLASS_START_TIME]</div>\n<div><strong>Ends:</strong> [CLASS_END_TIME]</div>\n                ', '\n   Please be reminded that the class <strong>\'[CLASS_NAME]\'</strong> is scheduled to hold as follows: <br/>\n\n<div><strong>Date:</strong> [CLASS_DATE]</div>\n<div><strong>Session:</strong> [SESSION_NAME]</div>\n<div><strong>Venue:</strong> [CLASS_VENUE] </div>\n<div><strong>Starts:</strong> [CLASS_START_TIME]</div>\n<div><strong>Ends:</strong> [CLASS_END_TIME]</div>\n                ', '\n                <ul>\n                <li>[CLASS_NAME] : The name of the class</li>\n                <li>[CLASS_DATE] : The class date</li>\n                <li>[SESSION_NAME] : The name of the session the class is attached to</li>\n                <li>[CLASS_VENUE] : The venue of the class</li>\n                <li>[CLASS_START_TIME] : The start time for the class</li>\n                <li>[CLASS_END_TIME] : The end time for the class</li>\n                <li>[RECIPIENT_FIRST_NAME] : The first name of the recipient </li>\n                <li>[RECIPIENT_LAST_NAME] : The last name of the recipient </li>\n                </ul>\n                ', 'Upcoming Class: [CLASS_NAME]', 'Upcoming Class: [CLASS_NAME]'),
(2, NULL, NULL, 'Upcoming class reminder (online class)', 'This message is sent to students to remind them when an online class is scheduled to open.', '\n                Please be reminded that the class <strong>\'[CLASS_NAME]\'</strong> is scheduled as follows: <br/>\n\n<div><strong>Course:</strong> [COURSE_NAME]</div>\n<div><strong>Starts:</strong> [CLASS_DATE]</div>\n                ', '\n   Please be reminded that the class <strong>\'[CLASS_NAME]\'</strong> is scheduled as follows: <br/>\n\n<div><strong>Course:</strong> [COURSE_NAME]</div>\n<div><strong>Starts:</strong> [CLASS_DATE]</div>\n                ', '\n                <ul>\n                <li>[CLASS_NAME] : The name of the class</li>\n                <li>[CLASS_DATE] : The class date</li>\n                <li>[COURSE_NAME] : The name of the session the class is attached to</li>\n                <li>[RECIPIENT_FIRST_NAME] : The first name of the recipient </li>\n                <li>[RECIPIENT_LAST_NAME] : The last name of the recipient </li>\n                </ul>\n                ', 'Upcoming Class: [CLASS_NAME]', 'Upcoming Class: [CLASS_NAME]'),
(3, NULL, NULL, 'Upcoming Test reminder', 'This message is sent to users when there is an upcoming test in a session/course they are enrolled in', '\n                    Please be reminded that the test <strong>\'[TEST_NAME]\'</strong> is scheduled as follows: <br/>\n<div><strong>Session/Course:</strong> [SESSION_NAME] </div>\n<div><strong>Opens:</strong> [OPENING_DATE]</div>\n<div><strong>Closes:</strong> [CLOSING_DATE]</div>\n<div>Please ensure you take the test before the closing date.</div>\n                ', '\n                    Please be reminded that the test <strong>\'[TEST_NAME]\'</strong> is scheduled as follows: <br/>\n<div><strong>Session/Course:</strong> [SESSION_NAME] </div>\n<div><strong>Opens:</strong> [OPENING_DATE]</div>\n<div><strong>Closes:</strong> [CLOSING_DATE]</div>\n<div>Please ensure you take the test before the closing date.</div>\n                ', '\n                <ul>\n                <li>[TEST_NAME] : The name of the test</li>\n                <li>[TEST_DESCRIPTION] : The description of the test</li>\n                <li>[SESSION_NAME] : The name of the session or course the test is attached to</li>\n                <li>[OPENING_DATE] : The opening date of the test</li>\n                <li>[CLOSING_DATE] : The closing date of the test</li>\n                <li>[PASSMARK] : The test passmark e.g. 50%</li>\n                <li>[MINUTES_ALLOWED]: The number of minutes allowed for the test</li>\n                <li>[RECIPIENT_FIRST_NAME] : The first name of the recipient </li>\n                <li>[RECIPIENT_LAST_NAME] : The last name of the recipient </li>\n                </ul>\n                ', 'Upcoming Test: [TEST_NAME]', 'Upcoming Test: [TEST_NAME]'),
(4, NULL, NULL, 'Online Class start notification', 'This message is sent to students when a scheduled online class opens', '\n                Please be reminded that the class <strong>\'[CLASS_NAME]\'</strong> for the course \'[COURSE_NAME]\' has started. <br/>\nClick this link to take this class now: <a href=\\\"[CLASS_URL]\\\">[CLASS_URL]</a><br/>\n                ', '\n               Please be reminded that the class <strong>\'[CLASS_NAME]\'</strong> for the course \'[COURSE_NAME]\' has started. <br/>\nClick this link to take this class now: <a href=\\\"[CLASS_URL]\\\">[CLASS_URL]</a><br/>\n                ', '\n                <ul>\n                <li>[CLASS_NAME] : The name of the class</li>\n                <li>[CLASS_URL] : The url of the class</li>\n                <li>[COURSE_NAME] : The name of the course the class belongs to</li>\n                <li>[RECIPIENT_FIRST_NAME] : The first name of the recipient </li>\n                <li>[RECIPIENT_LAST_NAME] : The last name of the recipient </li>\n                </ul>\n                ', 'Class [CLASS_NAME] is open', 'Class [CLASS_NAME] is open'),
(5, NULL, NULL, 'Homework reminder', 'This message is sent to students reminding them when a homework is due', '\n                Please be reminded that the homework <strong>\'[HOMEWORK_NAME]\'</strong> is due on [DUE_DATE]. <br/>\nPlease click this link to submit your homework now: <a href=\\\"[HOMEWORK_URL]\\\">[HOMEWORK_URL]</a>\n                ', '\n                Please be reminded that the homework <strong>\'[HOMEWORK_NAME]\'</strong> is due on [DUE_DATE]. <br/>\nPlease click this link to submit your homework now: <a href=\\\"[HOMEWORK_URL]\\\">[HOMEWORK_URL]</a>\n                ', '\n                <ul>\n                <li>[NUMBER_OF_DAYS] : The number of days remaining till the homework due date e.g. 1,2,3</li>\n                <li>[DAY_TEXT] : The \'day\' text. Defaults to \'day\' if [NUMBER_OF_DAYS] is 1 and \'days\' if greater than 1.</li>\n                <li>[HOMEWORK_NAME] : The name of the homework</li>\n                <li>[HOMEWORK_URL] : The homework url</li>\n                <li>[HOMEWORK_INSTRUCTION] : The instructions for the homework</li>\n                <li>[PASSMARK] : The passmark for the homework</li>\n                 <li>[RECIPIENT_FIRST_NAME] : The first name of the recipient </li>\n                <li>[RECIPIENT_LAST_NAME] : The last name of the recipient </li>\n                <li>[DUE_DATE] : The homework due date</li>\n                <li>[OPENING_DATE] : The homework opening date</li>\n                </ul>\n                ', 'Homework due in [NUMBER_OF_DAYS] [DAY_TEXT]', 'Homework due in [NUMBER_OF_DAYS] [DAY_TEXT]'),
(6, NULL, NULL, 'Course closing reminder', 'Warning email sent to enrolled students about a course that will close soon.', '\n                Please be reminded that the course <strong>\'[COURSE_NAME]\'</strong> closes on [CLOSING_DATE]. <br/>\nPlease click this link to complete the course now: <a href=\\\"[COURSE_URL]\\\">[COURSE_URL]</a>\n                ', '\n                Please be reminded that the course <strong>\'[COURSE_NAME]\'</strong> closes on [CLOSING_DATE]. <br/>\nPlease click this link to complete the course now: <a href=\\\"[COURSE_URL]\\\">[COURSE_URL]</a>\n                ', '\n                <ul>\n                <li>[COURSE_NAME] : The name of the course</li>\n                <li>[COURSE_URL] : The course URL</li>\n                <li>[CLOSING_DATE] : The closing date for the course</li>\n                 <li>[NUMBER_OF_DAYS] : The number of days remaining till the closing date e.g. 1,2,3</li>\n                <li>[DAY_TEXT] : The \'day\' text. Defaults to \'day\' if [NUMBER_OF_DAYS] is 1 and \'days\' if greater than 1.</li>\n\n                <li>[RECIPIENT_FIRST_NAME] : The first name of the recipient </li>\n                <li>[RECIPIENT_LAST_NAME] : The last name of the recipient </li>\n                </ul>\n                ', 'Course ends in [NUMBER_OF_DAYS] [DAY_TEXT]', 'Course ends in [NUMBER_OF_DAYS] [DAY_TEXT]');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `minutes` int(11) DEFAULT NULL,
  `allow_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `passmark` double(8,2) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `show_result` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `created_at`, `updated_at`, `admin_id`, `name`, `description`, `enabled`, `minutes`, `allow_multiple`, `passmark`, `private`, `show_result`) VALUES
(3, '2022-08-11 07:15:03', '2022-08-11 08:45:59', 1, 'Introduction to Remote Sensing and GIS', '<p>Answer all questions</p>', 1, 120, 1, 40.00, 1, 1),
(4, '2022-08-16 15:45:52', '2022-08-16 15:45:52', 1, 'testing', '<p>answer all questions</p>', 1, 60, 1, 40.00, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_grades`
--

CREATE TABLE `exam_grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `grade` varchar(191) NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_grades`
--

INSERT INTO `exam_grades` (`id`, `created_at`, `updated_at`, `grade`, `min`, `max`) VALUES
(1, '2022-08-11 10:18:23', '2022-08-11 10:18:23', 'A', 40, 100);

-- --------------------------------------------------------

--
-- Table structure for table `exam_options`
--

CREATE TABLE `exam_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_question_id` bigint(20) UNSIGNED NOT NULL,
  `option` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_options`
--

INSERT INTO `exam_options` (`id`, `created_at`, `updated_at`, `exam_question_id`, `option`, `is_correct`) VALUES
(6, '2022-08-16 15:47:04', '2022-08-16 15:47:04', 2, 'Remote sensing does not have any type', 0),
(7, '2022-08-16 15:47:04', '2022-08-16 15:47:04', 2, 'There are two types of remote sensing', 0),
(8, '2022-08-16 15:47:04', '2022-08-16 15:47:04', 2, 'We have two broad categories inactive and active', 0),
(9, '2022-08-16 15:47:04', '2022-08-16 15:47:04', 2, 'We have two broad categories passive and active', 0),
(10, '2022-08-16 15:47:04', '2022-08-16 15:47:04', 2, 'We have one broad category which is passive only', 1),
(11, '2022-08-16 15:51:19', '2022-08-16 15:51:19', 3, 'Remote sensing does not have any type', 0),
(12, '2022-08-16 15:51:19', '2022-08-16 15:51:19', 3, 'There are two types of remote sensing', 0),
(13, '2022-08-16 15:51:19', '2022-08-16 15:51:19', 3, 'We have two broad categories inactive and active', 0),
(14, '2022-08-16 15:51:19', '2022-08-16 15:51:19', 3, 'We have two broad categories passive and active', 0),
(15, '2022-08-16 15:51:19', '2022-08-16 15:51:19', 3, 'We have one broad category which is passive only', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `created_at`, `updated_at`, `exam_id`, `question`, `sort_order`) VALUES
(2, '2022-08-16 15:47:04', '2022-08-16 15:47:04', 4, '<p>What is remote sensing?</p>', NULL),
(3, '2022-08-16 15:51:19', '2022-08-17 00:13:24', 3, '<p>What is remote sensing?</p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `amount` varchar(191) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `created_at`, `updated_at`, `name`, `amount`, `enabled`, `sort_order`, `description`, `parent_id`) VALUES
(1, '2022-08-04 06:28:49', '2022-11-28 02:56:22', 'NIMET School Fees', '45000', 1, NULL, 'School fees for 2020/2021', NULL),
(2, '2022-08-04 06:35:57', '2022-08-12 15:53:33', 'Tuition Fees', '36000', 1, NULL, 'Tuition Fees', NULL),
(3, '2022-11-27 21:03:40', '2022-11-27 21:03:40', 'Test Fees', '3600', 1, NULL, '1st Assessment Fees', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `footer_menus`
--

CREATE TABLE `footer_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `label` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `type` char(191) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `new_window` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_menus`
--

INSERT INTO `footer_menus` (`id`, `created_at`, `updated_at`, `name`, `label`, `url`, `type`, `sort_order`, `parent_id`, `new_window`) VALUES
(1, NULL, NULL, 'Custom', 'Quick Links', '#', 'c', 1, 0, 0),
(2, NULL, NULL, 'Courses', 'Online Courses', '/courses', 'p', 1, 1, 0),
(3, NULL, NULL, 'Sessions', 'Upcoming Sessions', '/sessions', 'p', 2, 1, 0),
(4, NULL, NULL, 'Blog', 'Blog', '/blog', 'p', 3, 1, 0),
(5, NULL, NULL, 'Contact', 'Contact', '/contact', 'p', 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_participants`
--

CREATE TABLE `forum_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `forum_topic_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `notify` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_participants`
--

INSERT INTO `forum_participants` (`id`, `created_at`, `updated_at`, `forum_topic_id`, `user_id`, `notify`) VALUES
(1, '2022-08-17 06:26:52', '2022-08-17 06:26:52', 1, 1, 1),
(2, '2022-08-17 06:28:30', '2022-08-17 06:28:30', 1, 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `forum_topic_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_reply_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_posts`
--

INSERT INTO `forum_posts` (`id`, `created_at`, `updated_at`, `forum_topic_id`, `message`, `user_id`, `post_reply_id`) VALUES
(1, '2022-08-17 06:26:51', '2022-08-17 06:26:51', 1, '<p>hook</p>', 1, NULL),
(2, '2022-08-17 06:27:09', '2022-08-17 06:27:09', 1, '<p>hmm</p>', 1, 1),
(3, '2022-08-17 06:28:30', '2022-08-17 06:28:30', 1, '<p>ok ooo</p>', 18, 2);

-- --------------------------------------------------------

--
-- Table structure for table `forum_topics`
--

CREATE TABLE `forum_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_topics`
--

INSERT INTO `forum_topics` (`id`, `created_at`, `updated_at`, `title`, `user_id`, `course_id`, `lecture_id`) VALUES
(1, '2022-08-17 06:26:51', '2022-08-17 06:26:51', 'gooo', 1, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `header_menus`
--

CREATE TABLE `header_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `label` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `type` char(191) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `new_window` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `header_menus`
--

INSERT INTO `header_menus` (`id`, `created_at`, `updated_at`, `name`, `label`, `url`, `type`, `sort_order`, `parent_id`, `new_window`) VALUES
(1, NULL, NULL, 'Home Page', 'Home', '/', 'p', 1, 0, 0),
(2, NULL, NULL, 'Custom', 'Info', '#', 'c', 2, 0, 0),
(3, NULL, NULL, 'Article: Who We Are', 'Who We Are', '/who-we-are', 'a', 1, 2, 0),
(4, NULL, NULL, 'Article: Our Services', 'Our Services', '/our-services', 'a', 2, 2, 0),
(5, NULL, NULL, 'Article: FAQ', 'FAQ', '/faq', 'a', 3, 2, 0),
(6, NULL, NULL, 'Courses', 'Courses', '/courses', 'p', 3, 0, 0),
(7, NULL, NULL, 'Sessions', 'Sessions', '/sessions', 'p', 4, 0, 0),
(8, NULL, NULL, 'Blog', 'Blog', '/blog', 'p', 5, 0, 0),
(9, NULL, NULL, 'Contact', 'Contact', '/contact', 'p', 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `cart` text DEFAULT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_transactions`
--

CREATE TABLE `invoice_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `status` char(191) NOT NULL DEFAULT 'p',
  `amount` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ips`
--

CREATE TABLE `ips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip` varchar(191) NOT NULL,
  `country` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecture_files`
--

CREATE TABLE `lecture_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lecture_id` bigint(20) UNSIGNED NOT NULL,
  `path` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecture_notes`
--

CREATE TABLE `lecture_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` bigint(20) UNSIGNED NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecture_pages`
--

CREATE TABLE `lecture_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lecture_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `content` text DEFAULT NULL,
  `type` char(191) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `audio_code` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `picture` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `test_required` tinyint(1) DEFAULT NULL,
  `test_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` char(191) NOT NULL,
  `introduction` text DEFAULT NULL,
  `enforce_lecture_order` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `created_at`, `updated_at`, `name`, `admin_id`, `picture`, `description`, `sort_order`, `test_required`, `test_id`, `type`, `introduction`, `enforce_lecture_order`) VALUES
(1, '2022-07-18 10:39:10', '2022-07-18 10:39:10', 'vbvb', 1, 'usermedia/banner-2.jpg', '<p>vbvb</p>', NULL, NULL, NULL, 's', NULL, 1),
(2, '2022-07-19 10:54:44', '2022-07-19 10:54:44', 'testing 123', 1, 'usermedia/banner-2.jpg', NULL, NULL, NULL, NULL, 'c', NULL, NULL),
(3, '2022-11-27 20:41:34', '2022-11-27 20:41:34', 'Electronics', 1, NULL, '<p>Electronics</p>', NULL, NULL, NULL, 's', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_files`
--

CREATE TABLE `lesson_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `path` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_groups`
--

CREATE TABLE `lesson_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_lesson_group`
--

CREATE TABLE `lesson_lesson_group` (
  `lesson_group_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_04_07_171722_create_students_table', 1),
(5, '2020_04_10_144311_create_admins_table', 1),
(6, '2020_04_10_144327_create_articles_table', 1),
(7, '2020_04_10_144335_create_courses_table', 1),
(8, '2020_04_10_144445_create_lessons_table', 1),
(9, '2020_04_10_144504_create_lectures_table', 1),
(10, '2020_04_10_144517_create_assignments_table', 1),
(11, '2020_04_10_144537_create_assignment_submissions_table', 1),
(12, '2020_04_10_144547_create_attendances_table', 1),
(13, '2020_04_10_144557_create_bookmarks_table', 1),
(14, '2020_04_10_144609_create_certificates_table', 1),
(15, '2020_04_10_144617_create_certificate_assignments_table', 1),
(16, '2020_04_10_144632_create_certificate_lessons_table', 1),
(17, '2020_04_10_144714_create_tests_table', 1),
(18, '2020_04_10_144723_create_certificate_tests_table', 1),
(19, '2020_04_10_144741_create_countries_table', 1),
(20, '2020_04_10_144818_create_coupons_table', 1),
(21, '2020_04_10_144854_create_course_categories_table', 1),
(22, '2020_04_10_144958_create_coupon_categories_table', 1),
(23, '2020_04_10_150647_create_currencies_table', 1),
(24, '2020_04_10_150716_create_payment_methods_table', 1),
(25, '2020_04_10_150731_create_invoices_table', 1),
(26, '2020_04_10_150802_create_coupon_invoices_table', 1),
(27, '2020_04_10_153758_create_coupon_courses_table', 1),
(28, '2020_04_10_153826_create_discussions_table', 1),
(29, '2020_04_10_153849_create_discussion_admins_table', 1),
(30, '2020_04_10_154910_create_discussion_replies_table', 1),
(31, '2020_04_10_154934_create_downloads_table', 1),
(32, '2020_04_10_155002_create_download_files_table', 1),
(33, '2020_04_10_155014_create_download_courses_table', 1),
(34, '2020_04_10_155051_create_email_templates_table', 1),
(35, '2020_04_10_155114_create_forum_topics_table', 1),
(36, '2020_04_10_155126_create_forum_posts_table', 1),
(37, '2020_04_10_155138_create_forum_participants_table', 1),
(38, '2020_04_10_155251_create_revision_notes_table', 1),
(39, '2020_04_10_155309_create_invoice_transactions_table', 1),
(40, '2020_04_10_155325_create_ips_table', 1),
(41, '2020_04_10_155352_create_lecture_files_table', 1),
(42, '2020_04_10_155405_create_lecture_notes_table', 1),
(43, '2020_04_10_160903_create_lecture_pages_table', 1),
(44, '2020_04_13_103711_create_lesson_files_table', 1),
(45, '2020_04_13_103723_create_lesson_groups_table', 1),
(46, '2020_04_13_104351_lesson_lesson_group_pivot', 1),
(47, '2020_04_13_104433_create_blog_posts_table', 1),
(48, '2020_04_13_104445_create_blog_categories_table', 1),
(49, '2020_04_13_110020_blog_category_pivot', 1),
(50, '2020_04_13_110506_payment_method_currency_pivot', 1),
(51, '2020_04_13_110821_create_payment_method_fields_table', 1),
(52, '2020_04_13_110937_create_permission_groups_table', 1),
(53, '2020_04_13_122949_create_permissions_table', 1),
(54, '2020_04_13_123037_create_student_fields_table', 1),
(55, '2020_04_13_123120_create_related_courses_table', 1),
(56, '2020_04_13_130436_create_roles_table', 1),
(57, '2020_04_13_130506_add_role_to_users', 1),
(58, '2020_04_13_134615_admin_permission_pivot', 1),
(59, '2020_04_13_142536_add_role_user_pivot', 1),
(60, '2020_04_13_142737_create_course_category_pivot', 1),
(61, '2020_04_13_142836_admin_course_pivot', 1),
(62, '2020_04_13_175310_create_course_lessons_table', 1),
(63, '2020_04_14_121252_create_course_lesson_admins_table', 1),
(64, '2020_04_14_121954_create_surveys_table', 1),
(65, '2020_04_14_122043_add_course_survey_pivot', 1),
(66, '2020_04_14_122132_create_course_tests_table', 1),
(67, '2020_04_14_122557_create_settings_table', 1),
(68, '2020_04_14_122642_create_sms_gateways_table', 1),
(69, '2020_04_14_122704_create_sms_gateway_fields_table', 1),
(70, '2020_04_14_122725_create_sms_templates_table', 1),
(71, '2020_04_14_122905_create_student_certificates_table', 1),
(72, '2020_04_15_125950_create_student_certificate_downloads_table', 1),
(73, '2020_04_15_130241_student_field_pivot', 1),
(74, '2020_04_15_130411_create_student_lectures_table', 1),
(75, '2020_04_15_130546_create_pending_students_table', 1),
(76, '2020_04_15_130650_create_student_courses_table', 1),
(77, '2020_04_15_130709_create_student_course_logs_table', 1),
(78, '2020_04_15_130729_create_student_tests_table', 1),
(79, '2020_04_15_130954_create_survey_questions_table', 1),
(80, '2020_04_15_131008_create_survey_options_table', 1),
(81, '2020_04_15_131027_create_survey_responses_table', 1),
(82, '2020_04_15_131349_create_survey_response_options_table', 1),
(83, '2020_04_15_131713_create_templates_table', 1),
(84, '2020_04_15_131726_create_template_options_table', 1),
(85, '2020_04_15_131740_create_template_colors_table', 1),
(86, '2020_04_15_131821_create_test_grades_table', 1),
(87, '2020_04_15_131945_create_test_questions_table', 1),
(88, '2020_04_15_131949_create_test_options_table', 1),
(89, '2020_04_15_132020_create_transactions_table', 1),
(90, '2020_04_15_132049_create_videos_table', 1),
(91, '2020_04_15_132207_create_student_videos_table', 1),
(92, '2020_04_15_133642_add_picture_to_users', 1),
(93, '2020_04_21_105018_create_widgets_table', 1),
(94, '2020_04_21_105033_create_widget_values_table', 1),
(95, '2020_04_28_130903_make_lesson_pivot', 1),
(96, '2020_04_28_145614_make_course_test', 1),
(97, '2020_05_12_102430_add_settings', 1),
(98, '2020_05_12_113650_seed_permission_groups', 1),
(99, '2020_05_12_124843_seed_permissions', 1),
(100, '2020_05_20_193453_add_user_to_admins', 1),
(101, '2020_05_20_200723_add_default_admin_roles', 1),
(102, '2020_08_11_140753_add_parent_to_course_category', 1),
(103, '2020_08_11_170723_add_ft_to_lessons', 1),
(104, '2020_08_25_122904_add_message_permission', 1),
(105, '2020_08_25_124942_add_video_permissions', 1),
(106, '2020_08_26_124622_add_capacity_display', 1),
(107, '2020_08_27_112622_seed_countries', 1),
(108, '2020_08_27_134249_add_default_currency', 1),
(109, '2020_09_02_135904_fix_lesson_test', 1),
(110, '2020_09_03_111646_make_intro_nullable', 1),
(111, '2020_09_03_111802_make_lecture_order_nullable', 1),
(112, '2020_09_04_170057_add_dates_to_course_test', 1),
(113, '2020_09_09_105230_add_pk_to_course_tests', 1),
(114, '2020_09_09_160235_add_last_name_users', 1),
(115, '2020_09_10_110652_fix_students_userid_fk', 1),
(116, '2020_09_10_140553_add_ft_to_courses', 1),
(117, '2020_09_10_140803_add_ft_to_users', 1),
(118, '2020_09_22_151500_add_video_settings', 1),
(119, '2020_09_22_160543_add_video_fields', 1),
(120, '2020_09_22_172335_add_ft_to_videos', 1),
(121, '2020_09_23_180106_add_id_to_course_lesson', 1),
(122, '2020_09_24_165641_make_late_nullable', 1),
(123, '2020_09_25_143442_add_id_to_course_download', 1),
(124, '2020_09_29_151537_remove_forum_fk', 1),
(125, '2020_10_05_125959_add_id_to_course_survery', 1),
(126, '2020_10_05_161754_add_certificate_flag', 1),
(127, '2020_10_07_112359_add_blog_permission', 1),
(128, '2020_10_08_121006_add_widget_fields', 1),
(129, '2020_10_09_160438_set_coupon_total_nullable', 1),
(130, '2020_10_09_170447_set_notification_messages', 1),
(131, '2020_10_09_172338_set_sms_notification_messages', 1),
(132, '2020_10_12_100131_create_header_menus_table', 1),
(133, '2020_10_12_100144_create_footer_menus_table', 1),
(134, '2020_10_12_101049_add_default_template', 1),
(135, '2020_10_13_092538_remove_payment_method_fields', 1),
(136, '2020_10_13_105815_update_payment_table', 1),
(137, '2020_10_13_134003_rename_currency_field', 1),
(138, '2020_10_14_104256_remove_sms_fields_table', 1),
(139, '2020_10_14_104456_update_sms_table', 1),
(140, '2020_10_16_124938_change_invoice_fields', 1),
(141, '2020_10_23_123026_update_setting_menu_values', 1),
(142, '2020_11_02_093438_fix_admin_discussion_fk', 1),
(143, '2020_11_04_124333_create_demo_builder', 1),
(144, '2020_11_10_120724_add_user_login_token', 1),
(145, '2020_11_10_142950_create_pending_student_files_table', 1),
(146, '2020_11_11_151858_add_billing_details', 1),
(147, '2020_11_12_070922_set_invoice_increment', 1),
(148, '2020_11_13_145240_add_transaction_increment', 1),
(149, '2020_11_17_122359_add_sms_default', 1),
(150, '2020_11_17_124231_add_base_url', 1),
(151, '2020_11_18_115144_add_mobile_to_articles', 1),
(152, '2020_11_27_091941_add_admin_details', 1),
(153, '2020_11_27_093838_add_admin_url', 1),
(154, '2020_12_02_172012_add_admin_account', 1),
(155, '2020_12_03_154614_modify_certificate', 1),
(156, '2020_12_04_124356_remove_auto_enroll', 1),
(157, '2021_01_11_104057_enable_registration', 1),
(158, '2021_01_15_141233_add_enrollment_message', 1),
(159, '2021_01_22_104902_remove_invalid_menu_settings', 1);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `amount` varchar(191) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duration` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `created_at`, `updated_at`, `name`, `amount`, `enabled`, `sort_order`, `description`, `parent_id`, `duration`) VALUES
(1, '2022-12-06 21:51:33', '2022-12-06 21:55:15', 'Basic', '15000', 1, NULL, 'payment for basic package', NULL, '60');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `narration` text DEFAULT NULL,
  `payment_reference` varchar(50) DEFAULT NULL,
  `processor_id` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `total_amount` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `session_id` bigint(22) DEFAULT NULL,
  `semester_id` bigint(22) DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `fee_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment_histories`
--

INSERT INTO `payment_histories` (`id`, `user_id`, `amount`, `narration`, `payment_reference`, `processor_id`, `transaction_id`, `message`, `total_amount`, `payment_status`, `payment_method`, `session_id`, `semester_id`, `currency_id`, `fee_id`, `created_at`, `updated_at`) VALUES
(1, 18, '440000', 'Fee payment', '340008718296', '0098989765', 'a63a5b5ab9f74b71a193d50f4dee4275', 'Payment successful', '704150', '0', NULL, 1, 2, 2, NULL, '2022-08-08 14:23:28', '2022-08-08 14:23:28'),
(2, 18, '650000', 'Payment for my school fees', '340008718296', NULL, 'a63a5b5ab9f74b71a193d50f4dee4275', NULL, '704150', '0', NULL, 1, 2, 2, NULL, '2022-08-08 16:11:16', '2022-08-08 16:11:16'),
(3, 18, '650000', 'Payment for my school fees', '340008718296', NULL, 'a63a5b5ab9f74b71a193d50f4dee4275', NULL, '704150', '0', NULL, 1, 2, 2, NULL, '2022-08-08 16:12:19', '2022-08-08 16:12:19'),
(4, 18, '650000', 'Payment for my school fees', '340008718296', NULL, 'a63a5b5ab9f74b71a193d50f4dee4275', NULL, '704150', '0', NULL, 1, 2, 2, NULL, '2022-08-08 16:13:53', '2022-08-08 16:13:53'),
(5, 18, '650000', 'Payment for my school fees', '330008718559', NULL, 'da5bd909d4364ca98568a703bf945d5e', NULL, '704150', '0', NULL, 1, 2, 2, NULL, '2022-08-08 16:36:07', '2022-08-08 16:36:07'),
(6, 18, '650000', 'fee payment', '320008719134', NULL, '024cc2881c8f45b28d42323869bbbb05', NULL, '704150', '0', NULL, 1, 2, 2, NULL, '2022-08-08 17:22:11', '2022-08-08 17:22:11'),
(7, 18, '650000', 'Payment for my school fees', '100008725943', NULL, 'd7033497c7ab4279aca93923cde3b628', NULL, '704150', '1', 'Remita', 1, 2, 2, 1, '2022-08-09 10:12:44', '2022-08-09 10:12:44'),
(8, 22, '36000', 'pay all my school fees', 'T370855676584528', 'T370855676584528', '2028848213', NULL, '36000', '1', 'Online', 1, 1, 2, NULL, '2022-08-17 00:46:22', '2022-08-17 00:46:22'),
(9, 18, '36000', 'Demo Narration', 'T933337400407807', 'T933337400407807', '2030085314', NULL, '36000', '1', 'Online', 1, 1, 2, NULL, '2022-08-17 13:23:36', '2022-08-17 13:23:36'),
(10, 45, '36000', 'good', 'T970382590269461', 'T970382590269461', '2319122560', NULL, '36000', '1', 'Online', 1, 1, 2, NULL, '2022-11-27 20:19:03', '2022-11-27 20:19:03'),
(11, 47, '36000', 'tuition fees payment', 'T034207645053103', 'T034207645053103', '2319374247', NULL, '36000', '1', 'Online', 1, 1, 2, NULL, '2022-11-27 22:17:16', '2022-11-27 22:17:16'),
(12, 48, '39600', 'Tuition', 'T107112973034369', 'T107112973034369', '2320058865', NULL, '39600', '1', 'Online', 1, 1, 2, NULL, '2022-11-28 06:50:05', '2022-11-28 06:50:05'),
(13, 51, '3600', 'payment', 'T697458377862380', 'T697458377862380', '2358808216', NULL, '3600', '1', 'Online', 1, 1, 2, NULL, '2022-12-12 05:36:17', '2022-12-12 05:36:17'),
(14, 68, '3600', 'School fees payment', 'T722589330403991', 'T722589330403991', '2359537568', NULL, '3600', '1', 'Online', 1, 1, 2, NULL, '2022-12-12 10:44:10', '2022-12-12 10:44:10'),
(15, 69, '3600', 'School fees payment', 'T114030255016707', 'T114030255016707', '2359546369', NULL, '3600', '1', 'Online', 1, 1, 2, NULL, '2022-12-12 10:49:04', '2022-12-12 10:49:04');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `directory` varchar(191) NOT NULL,
  `supported_currencies` text DEFAULT NULL,
  `label` varchar(191) NOT NULL,
  `is_global` tinyint(1) NOT NULL,
  `settings` text DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `created_at`, `updated_at`, `name`, `enabled`, `sort_order`, `directory`, `supported_currencies`, `label`, `is_global`, `settings`, `details`) VALUES
(1, '2022-08-03 13:05:01', '2022-08-04 11:48:22', 'Paystack', 0, NULL, 'paystack', 'NGN GHS ZAR USD', 'Paystack', 0, NULL, NULL),
(2, '2022-08-04 11:48:32', '2022-08-05 06:22:15', 'Bank Transfer/Cash Deposit', 1, NULL, 'bank', 'default.any', 'Bank Transfer/Cash Deposit', 0, 'a:4:{s:4:\"text\";s:146:\"<p><b>Pay into the following bank account details:</b></p><p>Account Number: 0000000000</p><p>Account Name: NIMET</p><p>Bank Name: Zenith Bank</p>\";s:5:\"files\";N;s:5:\"label\";s:26:\"Bank Transfer/Cash Deposit\";s:10:\"sort_order\";N;}', '<p><b>Pay into the following bank account details:</b></p><p>Account Number: 0000000000</p><p>Account Name: NIMET</p><p>Bank Name: Zenith Bank</p>');

-- --------------------------------------------------------

--
-- Table structure for table `pending_students`
--

CREATE TABLE `pending_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` text NOT NULL,
  `hash` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pending_student_files`
--

CREATE TABLE `pending_student_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pending_student_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `file_path` varchar(191) NOT NULL,
  `field_id` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `permission_group_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `created_at`, `updated_at`, `name`, `permission_group_id`) VALUES
(1, NULL, NULL, 'view_students', 1),
(2, NULL, NULL, 'add_student', 1),
(3, NULL, NULL, 'view_student', 1),
(4, NULL, NULL, 'edit_student', 1),
(5, NULL, NULL, 'delete_student', 1),
(6, NULL, NULL, 'bulk_enroll', 1),
(7, NULL, NULL, 'enroll', 1),
(8, NULL, NULL, 'view_sessions', 2),
(9, NULL, NULL, 'add_session', 2),
(10, NULL, NULL, 'edit_session', 2),
(11, NULL, NULL, 'delete_session', 2),
(12, NULL, NULL, 'export_student', 2),
(13, NULL, NULL, 'export_student_attendance', 2),
(14, NULL, NULL, 'view_attendance_sheet', 2),
(15, NULL, NULL, 'set_attendance', 3),
(16, NULL, NULL, 'set_bulk_attendance', 3),
(17, NULL, NULL, 'set_import_attendance', 3),
(18, NULL, NULL, 'create_certificate_list', 3),
(19, NULL, NULL, 'set_attendance_dates', 3),
(20, NULL, NULL, 'view_classes', 4),
(21, NULL, NULL, 'add_class', 4),
(22, NULL, NULL, 'edit_class', 4),
(23, NULL, NULL, 'delete_class', 4),
(24, NULL, NULL, 'view_notes', 5),
(25, NULL, NULL, 'add_note', 5),
(26, NULL, NULL, 'edit_note', 5),
(27, NULL, NULL, 'delete_note', 5),
(28, NULL, NULL, 'view_blog', 6),
(29, NULL, NULL, 'add_blog', 6),
(30, NULL, NULL, 'edit_blog', 6),
(31, NULL, NULL, 'delete_blog', 6),
(32, NULL, NULL, 'manage_files', 7),
(33, NULL, NULL, 'view_articles', 8),
(34, NULL, NULL, 'add_article', 8),
(35, NULL, NULL, 'edit_article', 8),
(36, NULL, NULL, 'delete_article', 8),
(37, NULL, NULL, 'view_widgets', 9),
(38, NULL, NULL, 'create_widget', 9),
(39, NULL, NULL, 'delete_widget', 9),
(40, NULL, NULL, 'view_registration_fields', 9),
(41, NULL, NULL, 'add_registration_field', 9),
(42, NULL, NULL, 'delete_registration_field', 9),
(43, NULL, NULL, 'edit_registration_field', 9),
(44, NULL, NULL, 'edit_site_settings', 9),
(45, NULL, NULL, 'view_roles', 9),
(46, NULL, NULL, 'add_role', 9),
(47, NULL, NULL, 'edit_role', 9),
(48, NULL, NULL, 'delete_role', 9),
(49, NULL, NULL, 'view_payment_methods', 9),
(50, NULL, NULL, 'edit_payment_methods', 9),
(51, NULL, NULL, 'view_admins', 9),
(52, NULL, NULL, 'add_admin', 9),
(53, NULL, NULL, 'edit_admin', 9),
(54, NULL, NULL, 'view_transactions', 2),
(55, NULL, NULL, 'view_tests', 10),
(56, NULL, NULL, 'add_test', 10),
(57, NULL, NULL, 'add_options', 10),
(58, NULL, NULL, 'add_question', 10),
(59, NULL, NULL, 'delete_question', 10),
(60, NULL, NULL, 'delete_option', 10),
(61, NULL, NULL, 'duplicate_question', 10),
(62, NULL, NULL, 'edit_question', 10),
(63, NULL, NULL, 'edit_option', 10),
(64, NULL, NULL, 'export_result', 10),
(65, NULL, NULL, 'manage_questions', 10),
(66, NULL, NULL, 'view_results', 10),
(67, NULL, NULL, 'view_result', 10),
(68, NULL, NULL, 'view_payments', 2),
(69, NULL, NULL, 'view_discussions', 11),
(70, NULL, NULL, 'view_discussion', 11),
(71, NULL, NULL, 'reply_discussion', 11),
(72, NULL, NULL, 'delete_discussion', 11),
(73, NULL, NULL, 'view_instructors', 2),
(74, NULL, NULL, 'set_instructors', 2),
(75, NULL, NULL, 'upgrade_database', 9),
(76, NULL, NULL, 'view_certificates', 12),
(77, NULL, NULL, 'edit_certificate', 12),
(78, NULL, NULL, 'add_certificate', 12),
(79, NULL, NULL, 'delete_certificate', 12),
(80, NULL, NULL, 'view_downloads', 13),
(81, NULL, NULL, 'edit_download', 13),
(82, NULL, NULL, 'add_download', 13),
(83, NULL, NULL, 'delete_download', 13),
(84, NULL, NULL, 'global_resource_access', 14),
(85, NULL, NULL, 'add_course', 2),
(86, NULL, NULL, 'view_course_categories', 2),
(87, NULL, NULL, 'add_course_category', 2),
(88, NULL, NULL, 'edit_course_category', 2),
(89, NULL, NULL, 'delete_course_category', 2),
(90, NULL, NULL, 'view_class_groups', 4),
(91, NULL, NULL, 'add_class_group', 4),
(92, NULL, NULL, 'edit_class_group', 4),
(93, NULL, NULL, 'delete_class_group', 4),
(94, NULL, NULL, 'manage_class_downloads', 4),
(95, NULL, NULL, 'view_lectures', 4),
(96, NULL, NULL, 'add_lecture', 4),
(97, NULL, NULL, 'edit_lecture', 4),
(98, NULL, NULL, 'delete_lecture', 4),
(99, NULL, NULL, 'manage_lecture_downloads', 4),
(100, NULL, NULL, 'manage_lecture_content', 4),
(101, NULL, NULL, 'add_homework', 15),
(102, NULL, NULL, 'view_homework_list', 15),
(103, NULL, NULL, 'edit_homework', 15),
(104, NULL, NULL, 'view_homework', 15),
(105, NULL, NULL, 'delete_homework', 15),
(106, NULL, NULL, 'view_homework_submissions', 15),
(107, NULL, NULL, 'view_homework_submission', 15),
(108, NULL, NULL, 'export_homework_results', 15),
(109, NULL, NULL, 'view_themes', 9),
(110, NULL, NULL, 'customize_theme', 9),
(111, NULL, NULL, 'install_theme', 9),
(112, NULL, NULL, 'configure_sms_gateways', 9),
(113, NULL, NULL, 'edit_sms_gateway', 9),
(114, NULL, NULL, 'install_gateway', 9),
(115, NULL, NULL, 'uninstall_gateway', 9),
(116, NULL, NULL, 'view_forum_topics', 11),
(117, NULL, NULL, 'add_forum_topic', 11),
(118, NULL, NULL, 'view_forum_topic', 11),
(119, NULL, NULL, 'reply_forum_topic', 11),
(120, NULL, NULL, 'delete_forum_topic', 11),
(121, NULL, NULL, 'view_test_grades', 9),
(122, NULL, NULL, 'add_test_grade', 9),
(123, NULL, NULL, 'edit_test_grade', 9),
(124, NULL, NULL, 'delete_test_grade', 9),
(125, NULL, NULL, 'view_report_page', 16),
(126, NULL, NULL, 'view_class_report', 16),
(127, NULL, NULL, 'view_students_report', 16),
(128, NULL, NULL, 'view_tests_report', 16),
(129, NULL, NULL, 'view_homework_report', 16),
(130, NULL, NULL, 'view_email_notifications', 9),
(131, NULL, NULL, 'edit_email_notification', 9),
(132, NULL, NULL, 'view_sms_notifications', 9),
(133, NULL, NULL, 'edit_sms_notification', 9),
(134, NULL, NULL, 'view_coupons', 9),
(135, NULL, NULL, 'add_coupon', 9),
(136, NULL, NULL, 'edit_coupon', 9),
(137, NULL, NULL, 'delete_coupon', 9),
(138, NULL, NULL, 'manage_currencies', 9),
(139, NULL, NULL, 'delete_currencies', 9),
(140, NULL, NULL, 'view_surveys', 17),
(141, NULL, NULL, 'add_survey', 17),
(142, NULL, NULL, 'add_survey_options', 17),
(143, NULL, NULL, 'add_survey_question', 17),
(144, NULL, NULL, 'delete_survey_question', 17),
(145, NULL, NULL, 'delete_survey_option', 17),
(146, NULL, NULL, 'duplicate_survey_question', 17),
(147, NULL, NULL, 'edit_survey_question', 17),
(148, NULL, NULL, 'edit_survey_option', 17),
(149, NULL, NULL, 'export_survey_result', 17),
(150, NULL, NULL, 'manage_survey_questions', 17),
(151, NULL, NULL, 'view_survey_results', 17),
(152, NULL, NULL, 'view_survey_result', 17),
(153, NULL, NULL, 'message_students', 1),
(154, NULL, NULL, 'view_videos', 18),
(155, NULL, NULL, 'add_video', 18),
(156, NULL, NULL, 'edit_video', 18),
(157, NULL, NULL, 'delete_video', 18),
(158, NULL, NULL, 'play_video', 18),
(159, NULL, NULL, 'view_video_space', 18),
(160, '2022-07-18 09:01:18', '2022-07-18 09:01:18', 'manage_blog_categories', 6);

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `created_at`, `updated_at`, `name`, `sort_order`) VALUES
(1, NULL, NULL, 'student', 1),
(2, NULL, NULL, 'course', 2),
(3, NULL, NULL, 'attendance', 3),
(4, NULL, NULL, 'classes', 4),
(5, NULL, NULL, 'revision_notes', 5),
(6, NULL, NULL, 'blog', 6),
(7, NULL, NULL, 'files', 7),
(8, NULL, NULL, 'articles', 8),
(9, NULL, NULL, 'settings', 9),
(10, NULL, NULL, 'tests', 10),
(11, NULL, NULL, 'discussions', 11),
(12, NULL, NULL, 'certificates', 12),
(13, NULL, NULL, 'downloads', 13),
(14, NULL, NULL, 'miscellaneous', 14),
(15, NULL, NULL, 'homework', 15),
(16, NULL, NULL, 'reports', 16),
(17, NULL, NULL, 'survey', 17),
(18, NULL, NULL, 'video', 18);

-- --------------------------------------------------------

--
-- Table structure for table `related_courses`
--

CREATE TABLE `related_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `related_course_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revision_notes`
--

CREATE TABLE `revision_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `content` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, '2022-07-18 09:01:07', '2022-07-18 09:01:07', 'Admin'),
(2, '2022-07-18 09:01:07', '2022-07-18 09:01:07', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `semester_name` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `created_at`, `updated_at`, `semester_name`, `enabled`, `sort_order`, `description`, `parent_id`, `duration`) VALUES
(1, '2022-08-03 07:54:01', '2022-08-03 15:30:38', 'First Semester', 1, NULL, 'Description for first semester', NULL, '17 Weeks'),
(2, '2022-08-03 07:55:44', '2022-11-27 20:57:15', 'Second Semester', 0, NULL, 'Description for second semester', NULL, '17 Weeks');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(191) NOT NULL,
  `placeholder` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `options` text DEFAULT NULL,
  `class` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `key`, `placeholder`, `value`, `type`, `options`, `class`, `sort_order`) VALUES
(1, NULL, '2022-07-18 09:01:19', 'general_site_name', NULL, 'NIMET', 'text', '', '', NULL),
(2, NULL, '2022-07-18 09:01:21', 'regis_enable_registration', NULL, '1', 'radio', '1=Yes,0=No', '', NULL),
(3, NULL, '2022-07-18 09:01:19', 'general_homepage_title', NULL, 'NIMET NIGERIA', 'text', '', '', NULL),
(4, NULL, NULL, 'general_homepage_meta_desc', NULL, NULL, 'textarea', '', '', NULL),
(5, NULL, '2022-07-18 09:01:19', 'general_admin_email', NULL, 'test@comelynation.com', 'text', '', '', NULL),
(6, NULL, NULL, 'color_navbar', NULL, NULL, 'text', '', '', NULL),
(7, NULL, NULL, 'color_primary_color', NULL, NULL, 'text', '', '', NULL),
(8, NULL, NULL, 'color_navtext', NULL, NULL, 'text', '', '', NULL),
(9, NULL, NULL, 'color_footer', NULL, NULL, 'text', '', '', NULL),
(10, NULL, NULL, 'color_footertext', NULL, NULL, 'text', '', '', NULL),
(11, NULL, '2022-07-18 09:01:19', 'image_logo', NULL, 'usermedia/logo-1-1536x379.png', 'hidden', '', '', NULL),
(12, NULL, NULL, 'regis_registration_instructions', NULL, NULL, 'textarea', '', 'rte', NULL),
(13, NULL, NULL, 'footer_about', NULL, NULL, 'textarea', '', 'rte', NULL),
(14, NULL, NULL, 'footer_address', NULL, NULL, 'textarea', '', '', NULL),
(15, NULL, NULL, 'footer_email', NULL, NULL, 'text', '', '', NULL),
(16, NULL, NULL, 'footer_tel', NULL, NULL, 'text', '', '', NULL),
(17, NULL, '2022-07-18 09:01:19', 'image_icon', NULL, 'usermedia/logo-1.png', 'hidden', '', '', NULL),
(18, NULL, '2022-07-18 09:01:15', 'country_id', NULL, '162', 'select', '', '', NULL),
(20, NULL, NULL, 'general_ssl', NULL, '0', 'radio', '1=Yes,0=No', '', NULL),
(21, NULL, NULL, 'footer_newsletter_code', NULL, NULL, 'textarea', '', '', NULL),
(22, NULL, NULL, 'footer_credits', NULL, NULL, 'text', '', '', NULL),
(23, NULL, NULL, 'general_header_scripts', NULL, NULL, 'textarea', '', '', NULL),
(24, NULL, NULL, 'general_foot_scripts', NULL, NULL, 'textarea', '', '', NULL),
(25, NULL, '2022-07-18 09:01:18', 'menu_show_courses', NULL, '1', 'radio', '1=Yes,0=No', '', NULL),
(26, NULL, '2022-07-18 09:01:18', 'menu_show_sessions', NULL, '1', 'radio', '1=Yes,0=No', '', NULL),
(30, NULL, NULL, 'footer_show_sicons', NULL, NULL, 'radio', '1=Yes,0=No', '', NULL),
(31, NULL, NULL, 'footer_show_newsletter', NULL, NULL, 'radio', '1=Yes,0=No', '', NULL),
(32, NULL, NULL, 'footer_show_about', NULL, NULL, 'radio', '1=Yes,0=No', '', NULL),
(33, NULL, NULL, 'footer_show_contact', NULL, NULL, 'radio', '1=Yes,0=No', '', NULL),
(34, NULL, NULL, 'regis_email_message', NULL, NULL, 'textarea', '', 'rte', NULL),
(35, NULL, NULL, 'color_page_title', NULL, NULL, 'text', '', '', NULL),
(36, NULL, NULL, 'color_page_title_text', NULL, NULL, 'text', '', '', NULL),
(37, NULL, NULL, 'regis_enrollment_alert', NULL, '0', 'radio', '1=Yes,0=No', '', NULL),
(38, NULL, NULL, 'regis_signup_alert', NULL, '0', 'radio', '1=Yes,0=No', '', NULL),
(39, NULL, NULL, 'general_disqus', NULL, NULL, 'text', '', '', NULL),
(40, NULL, NULL, 'label_enroll', NULL, NULL, 'text', '', '', NULL),
(41, NULL, NULL, 'label_discussion', NULL, NULL, 'text', '', '', NULL),
(42, NULL, NULL, 'label_classes_attended', NULL, NULL, 'text', '', '', NULL),
(43, NULL, NULL, 'label_revision_notes', NULL, NULL, 'text', '', '', NULL),
(44, NULL, NULL, 'label_take_test', NULL, NULL, 'text', '', '', NULL),
(45, NULL, NULL, 'label_classes', NULL, NULL, 'text', '', '', NULL),
(46, NULL, NULL, 'label_sessions', NULL, NULL, 'text', '', '', NULL),
(47, NULL, NULL, 'label_blog', NULL, NULL, 'text', '', '', NULL),
(48, NULL, NULL, 'label_contact_us', NULL, NULL, 'text', '', '', NULL),
(49, NULL, NULL, 'label_about_us', NULL, NULL, 'text', '', '', NULL),
(50, NULL, NULL, 'label_follow_us', NULL, NULL, 'text', '', '', NULL),
(51, NULL, NULL, 'general_discussion_instructions', NULL, NULL, 'textarea', '', 'rte', NULL),
(52, NULL, NULL, 'mail_protocol', NULL, 'smtp', 'select', 'mail=Mail,smtp=SMTP', '', NULL),
(53, NULL, NULL, 'mail_smtp_host', NULL, 'mail@comelynation.com', 'text', '', '', NULL),
(54, NULL, NULL, 'mail_smtp_username', NULL, 'mailer@comelynation.com', 'text', '', '', NULL),
(55, NULL, NULL, 'mail_smtp_password', NULL, 'zs0&b!Bml_V$', 'text', '', '', NULL),
(56, NULL, NULL, 'mail_smtp_port', NULL, '465', 'text', '', '', NULL),
(57, NULL, NULL, 'mail_smtp_timeout', NULL, NULL, 'text', '', '', NULL),
(58, NULL, NULL, 'general_show_fee', NULL, '0', 'radio', '1=Yes,0=No', '', NULL),
(59, NULL, '2022-07-18 09:01:18', 'menu_show_discussions', NULL, '1', 'radio', '1=Yes,0=No', '', NULL),
(60, NULL, '2022-07-18 09:01:18', 'menu_show_tests', NULL, '1', 'radio', '1=Yes,0=No', '', NULL),
(61, NULL, '2022-07-18 09:01:18', 'menu_show_notes', NULL, '1', 'radio', '1=Yes,0=No', '', NULL),
(63, NULL, NULL, 'general_site_ip', NULL, NULL, 'text', '', '', NULL),
(64, NULL, NULL, 'general_send_reminder', NULL, '0', 'radio', '1=Yes,0=No', '', NULL),
(65, NULL, NULL, 'general_reminder_days', NULL, NULL, 'text', '', 'number', NULL),
(66, NULL, NULL, 'general_timezone', NULL, 'Africa/Lagos', 'select', 'Australia/Adelaide,Australia/Broken_Hill,Australia/Darwin,Australia/North,Australia/South,Australia/Yancowinna,America/Porto_Acre,Australia/Adelaide,America/Eirunepe,America/Rio_Branco,Brazil/Acre,Asia/Jayapura,Australia/Broken_Hill,Australia/Darwin,Australia/North,Australia/South,Australia/Yancowinna,America/Porto_Acre,America/Eirunepe,America/Rio_Branco,Brazil/Acre,Australia/Eucla,Australia/Eucla,America/Goose_Bay,America/Pangnirtung,America/Halifax,America/Barbados,America/Blanc-Sablon,America/Glace_Bay,America/Goose_Bay,America/Martinique,America/Moncton,America/Pangnirtung,America/Thule,Atlantic/Bermuda,Canada/Atlantic,Asia/Baghdad,Australia/Melbourne,Antarctica/Macquarie,Australia/ACT,Australia/Brisbane,Australia/Canberra,Australia/Currie,Australia/Hobart,Australia/Lindeman,Australia/NSW,Australia/Queensland,Australia/Sydney,Australia/Tasmania,Australia/Victoria,Australia/Melbourne,Antarctica/Macquarie,Australia/ACT,Australia/Brisbane,Australia/Canberra,Australia/Currie,Australia/Hobart,Australia/LHI,Australia/Lindeman,Australia/Lord_Howe,Australia/NSW,Australia/Queensland,Australia/Sydney,Australia/Tasmania,Australia/Victoria,Asia/Kabul,Asia/Kabul,America/Anchorage,America/Anchorage,America/Adak,America/Atka,America/Anchorage,America/Juneau,America/Nome,America/Sitka,America/Yakutat,America/Anchorage,America/Juneau,America/Nome,America/Sitka,America/Yakutat,Asia/Aqtobe,Asia/Aqtobe,Asia/Aqtobe,Asia/Aqtobe,Asia/Almaty,Asia/Almaty,Asia/Almaty,Asia/Yerevan,Asia/Yerevan,America/Boa_Vista,America/Campo_Grande,America/Cuiaba,America/Manaus,America/Porto_Velho,America/Santarem,Brazil/West,Asia/Yerevan,Asia/Yerevan,America/Asuncion,America/Boa_Vista,America/Campo_Grande,America/Cuiaba,America/Eirunepe,America/Manaus,America/Porto_Acre,America/Porto_Velho,America/Rio_Branco,America/Santarem,Brazil/Acre,Brazil/West,Europe/Amsterdam,Europe/Athens,Asia/Anadyr,Asia/Anadyr,Asia/Anadyr,Asia/Anadyr,Asia/Anadyr,Asia/Anadyr,America/Curacao,America/Aruba,America/Kralendijk,America/Lower_Princes,America/Halifax,America/Blanc-Sablon,America/Glace_Bay,America/Moncton,America/Pangnirtung,America/Puerto_Rico,Canada/Atlantic,Asia/Aqtau,Asia/Aqtau,Asia/Aqtobe,Asia/Aqtau,Asia/Aqtau,Asia/Aqtobe,America/Buenos_Aires,America/Buenos_Aires,America/Argentina/Buenos_Aires,America/Argentina/Catamarca,America/Argentina/ComodRivadavia,America/Argentina/Cordoba,America/Argentina/Jujuy,America/Argentina/La_Rioja,America/Argentina/Mendoza,America/Argentina/Rio_Gallegos,America/Argentina/Salta,America/Argentina/San_Juan,America/Argentina/San_Luis,America/Argentina/Tucuman,America/Argentina/Ushuaia,America/Catamarca,America/Cordoba,America/Jujuy,America/Mendoza,America/Rosario,Antarctica/Palmer,America/Argentina/Buenos_Aires,America/Argentina/Catamarca,America/Argentina/ComodRivadavia,America/Argentina/Cordoba,America/Argentina/Jujuy,America/Argentina/La_Rioja,America/Argentina/Mendoza,America/Argentina/Rio_Gallegos,America/Argentina/Salta,America/Argentina/San_Juan,America/Argentina/San_Luis,America/Argentina/Tucuman,America/Argentina/Ushuaia,America/Catamarca,America/Cordoba,America/Jujuy,America/Mendoza,America/Rosario,Antarctica/Palmer,America/Buenos_Aires,America/Buenos_Aires,America/Argentina/Buenos_Aires,America/Argentina/Catamarca,America/Argentina/ComodRivadavia,America/Argentina/Cordoba,America/Argentina/Jujuy,America/Argentina/La_Rioja,America/Argentina/Mendoza,America/Argentina/Rio_Gallegos,America/Argentina/Salta,America/Argentina/San_Juan,America/Argentina/San_Luis,America/Argentina/Tucuman,America/Argentina/Ushuaia,America/Catamarca,America/Cordoba,America/Jujuy,America/Mendoza,America/Rosario,Antarctica/Palmer,America/Argentina/Buenos_Aires,America/Argentina/Catamarca,America/Argentina/ComodRivadavia,America/Argentina/Cordoba,America/Argentina/Jujuy,America/Argentina/La_Rioja,America/Argentina/Mendoza,America/Argentina/Rio_Gallegos,America/Argentina/Salta,America/Argentina/San_Juan,America/Argentina/San_Luis,America/Argentina/Tucuman,America/Argentina/Ushuaia,America/Catamarca,America/Cordoba,America/Jujuy,America/Mendoza,America/Rosario,Antarctica/Palmer,Asia/Ashkhabad,Asia/Ashkhabad,Asia/Ashgabat,Asia/Ashgabat,Asia/Ashkhabad,Asia/Ashkhabad,Asia/Ashgabat,Asia/Ashgabat,Asia/Riyadh,America/Anguilla,America/Antigua,America/Aruba,America/Barbados,America/Blanc-Sablon,America/Curacao,America/Dominica,America/Glace_Bay,America/Goose_Bay,America/Grand_Turk,America/Grenada,America/Guadeloupe,America/Halifax,America/Kralendijk,America/Lower_Princes,America/Marigot,America/Martinique,America/Miquelon,America/Moncton,America/Montserrat,America/Pangnirtung,America/Port_of_Spain,America/Puerto_Rico,America/Santo_Domingo,America/St_Barthelemy,America/St_Kitts,America/St_Lucia,America/St_Thomas,America/St_Vincent,America/Thule,America/Tortola,America/Virgin,Atlantic/Bermuda,Canada/Atlantic,Asia/Aden,Asia/Baghdad,Asia/Bahrain,Asia/Kuwait,Asia/Qatar,Australia/Perth,Australia/West,Australia/Perth,Antarctica/Casey,Australia/West,America/Halifax,America/Blanc-Sablon,America/Glace_Bay,America/Moncton,America/Pangnirtung,America/Puerto_Rico,Canada/Atlantic,Atlantic/Azores,Atlantic/Azores,Atlantic/Azores,Atlantic/Azores,Atlantic/Azores,Asia/Baku,Asia/Baku,Asia/Baku,Asia/Baku,Asia/Baku,Asia/Baku,Asia/Baku,Asia/Baku,Europe/London,Asia/Dacca,Asia/Dhaka,Europe/Belfast,Europe/Gibraltar,Europe/Guernsey,Europe/Isle_of_Man,Europe/Jersey,GB,America/Adak,Asia/Dacca,America/Atka,America/Nome,Asia/Dhaka,Africa/Mogadishu,Africa/Addis_Ababa,Africa/Asmara,Africa/Asmera,Africa/Dar_es_Salaam,Africa/Djibouti,Africa/Kampala,Africa/Nairobi,Indian/Antananarivo,Indian/Comoro,Indian/Mayotte,Africa/Nairobi,Africa/Addis_Ababa,Africa/Asmara,Africa/Asmera,Africa/Dar_es_Salaam,Africa/Djibouti,Africa/Kampala,Africa/Mogadishu,Indian/Antananarivo,Indian/Comoro,Indian/Mayotte,America/Barbados,Europe/Tiraspol,America/Bogota,Asia/Baghdad,Asia/Bangkok,Asia/Phnom_Penh,Asia/Vientiane,Asia/Jakarta,Europe/Bucharest,Europe/Chisinau,Asia/Brunei,Asia/Brunei,Asia/Kuching,Asia/Kuching,Asia/Kuching,America/La_Paz,America/La_Paz,America/Sao_Paulo,America/Araguaina,America/Bahia,America/Belem,America/Fortaleza,America/Maceio,America/Recife,Brazil/East,America/Sao_Paulo,America/Araguaina,America/Bahia,America/Belem,America/Fortaleza,America/Maceio,America/Recife,America/Santarem,Brazil/East,Europe/London,Europe/London,America/Adak,America/Atka,America/Nome,Pacific/Midway,Pacific/Pago_Pago,Pacific/Samoa,Europe/Belfast,Europe/Guernsey,Europe/Isle_of_Man,Europe/Jersey,GB,Europe/Belfast,Europe/Dublin,Europe/Gibraltar,Europe/Guernsey,Europe/Isle_of_Man,Europe/Jersey,GB,Pacific/Bougainville,Asia/Thimbu,Asia/Thimphu,Asia/Kolkata,Asia/Calcutta,Asia/Dacca,Asia/Dhaka,Asia/Rangoon,Atlantic/Canary,America/Anchorage,Australia/Adelaide,Africa/Juba,Africa/Khartoum,Antarctica/Casey,America/Anchorage,Africa/Khartoum,Africa/Blantyre,Africa/Bujumbura,Africa/Gaborone,Africa/Harare,Africa/Juba,Africa/Kigali,Africa/Lubumbashi,Africa/Lusaka,Africa/Maputo,Africa/Windhoek,America/Anchorage,Indian/Cocos,America/Rankin_Inlet,America/Resolute,America/Chicago,Asia/Shanghai,America/Havana,America/Atikokan,America/Bahia_Banderas,America/Belize,America/Cambridge_Bay,America/Cancun,America/Chihuahua,America/Coral_Harbour,America/Costa_Rica,America/El_Salvador,America/Fort_Wayne,America/Guatemala,America/Indiana/Indianapolis,America/Indiana/Knox,America/Indiana/Marengo,America/Indiana/Petersburg,America/Indiana/Tell_City,America/Indiana/Vevay,America/Indiana/Vincennes,America/Indiana/Winamac,America/Indianapolis,America/Iqaluit,America/Kentucky/Louisville,America/Kentucky/Monticello,America/Knox_IN,America/Louisville,America/Managua,America/Matamoros,America/Menominee,America/Merida,America/Mexico_City,America/Monterrey,America/North_Dakota/Beulah,America/North_Dakota/Center,America/North_Dakota/New_Salem,America/Ojinaga,America/Pangnirtung,America/Rainy_River,America/Rankin_Inlet,America/Resolute,America/Tegucigalpa,America/Winnipeg,Canada/Central,Mexico/General,Asia/Chongqing,Asia/Chungking,Asia/Harbin,Asia/Taipei,PRC,ROC,Europe/Berlin,Europe/Berlin,Europe/Kaliningrad,Africa/Algiers,Africa/Ceuta,Africa/Tripoli,Africa/Tunis,Antarctica/Troll,Arctic/Longyearbyen,Atlantic/Jan_Mayen,Europe/Amsterdam,Europe/Andorra,Europe/Athens,Europe/Belgrade,Europe/Bratislava,Europe/Brussels,Europe/Budapest,Europe/Busingen,Europe/Chisinau,Europe/Copenhagen,Europe/Gibraltar,Europe/Kaliningrad,Europe/Kiev,Europe/Lisbon,Europe/Ljubljana,Europe/Luxembourg,Europe/Madrid,Europe/Malta,Europe/Minsk,Europe/Monaco,Europe/Oslo,Europe/Paris,Europe/Podgorica,Europe/Prague,Europe/Riga,Europe/Rome,Europe/San_Marino,Europe/Sarajevo,Europe/Simferopol,Europe/Skopje,Europe/Sofia,Europe/Stockholm,Europe/Tallinn,Europe/Tirane,Europe/Tiraspol,Europe/Uzhgorod,Europe/Vaduz,Europe/Vatican,Europe/Vienna,Europe/Vilnius,Europe/Warsaw,Europe/Zagreb,Europe/Zaporozhye,Europe/Zurich,Europe/Berlin,Europe/Kaliningrad,Africa/Algiers,Africa/Casablanca,Africa/Ceuta,Africa/Tripoli,Africa/Tunis,Arctic/Longyearbyen,Atlantic/Jan_Mayen,Europe/Amsterdam,Europe/Andorra,Europe/Athens,Europe/Belgrade,Europe/Bratislava,Europe/Brussels,Europe/Budapest,Europe/Busingen,Europe/Chisinau,Europe/Copenhagen,Europe/Gibraltar,Europe/Kaliningrad,Europe/Kiev,Europe/Lisbon,Europe/Ljubljana,Europe/Luxembourg,Europe/Madrid,Europe/Malta,Europe/Minsk,Europe/Monaco,Europe/Oslo,Europe/Paris,Europe/Podgorica,Europe/Prague,Europe/Riga,Europe/Rome,Europe/San_Marino,Europe/Sarajevo,Europe/Simferopol,Europe/Skopje,Europe/Sofia,Europe/Stockholm,Europe/Tallinn,Europe/Tirane,Europe/Tiraspol,Europe/Uzhgorod,Europe/Vaduz,Europe/Vatican,Europe/Vienna,Europe/Vilnius,Europe/Warsaw,Europe/Zagreb,Europe/Zaporozhye,Europe/Zurich,America/Scoresbysund,America/Scoresbysund,Pacific/Chatham,Pacific/Chatham,Pacific/Chatham,America/Belize,Asia/Choibalsan,Asia/Choibalsan,Asia/Choibalsan,Asia/Choibalsan,Pacific/Chuuk,Pacific/Truk,Pacific/Yap,Pacific/Rarotonga,Pacific/Rarotonga,Pacific/Rarotonga,America/Santiago,America/Santiago,Antarctica/Palmer,Chile/Continental,Chile/Continental,America/Santiago,America/Santiago,America/Santiago,Antarctica/Palmer,Chile/Continental,Antarctica/Palmer,Chile/Continental,Chile/Continental,America/Argentina/Buenos_Aires,America/Argentina/Catamarca,America/Argentina/ComodRivadavia,America/Argentina/Cordoba,America/Argentina/Jujuy,America/Argentina/La_Rioja,America/Argentina/Mendoza,America/Argentina/Rio_Gallegos,America/Argentina/Salta,America/Argentina/San_Juan,America/Argentina/San_Luis,America/Argentina/Tucuman,America/Argentina/Ushuaia,America/Buenos_Aires,America/Catamarca,America/Cordoba,America/Jujuy,America/Mendoza,America/Rosario,America/Caracas,America/La_Paz,America/Cayman,America/Panama,Europe/Chisinau,Europe/Tiraspol,America/Bogota,America/Bogota,America/Chicago,America/Atikokan,America/Coral_Harbour,America/Fort_Wayne,America/Indiana/Indianapolis,America/Indiana/Knox,America/Indiana/Marengo,America/Indiana/Petersburg,America/Indiana/Tell_City,America/Indiana/Vevay,America/Indiana/Vincennes,America/Indiana/Winamac,America/Indianapolis,America/Kentucky/Louisville,America/Kentucky/Monticello,America/Knox_IN,America/Louisville,America/Menominee,America/Rainy_River,America/Winnipeg,Canada/Central,America/Chicago,America/Havana,America/Atikokan,America/Bahia_Banderas,America/Belize,America/Cambridge_Bay,America/Cancun,America/Chihuahua,America/Coral_Harbour,America/Costa_Rica,America/Detroit,America/El_Salvador,America/Fort_Wayne,America/Guatemala,America/Hermosillo,America/Indiana/Indianapolis,America/Indiana/Knox,America/Indiana/Marengo,America/Indiana/Petersburg,America/Indiana/Tell_City,America/Indiana/Vevay,America/Indiana/Vincennes,America/Indiana/Winamac,America/Indianapolis,America/Iqaluit,America/Kentucky/Louisville,America/Kentucky/Monticello,America/Knox_IN,America/Louisville,America/Managua,America/Matamoros,America/Mazatlan,America/Menominee,America/Merida,America/Mexico_City,America/Monterrey,America/North_Dakota/Beulah,America/North_Dakota/Center,America/North_Dakota/New_Salem,America/Ojinaga,America/Pangnirtung,America/Rainy_River,America/Rankin_Inlet,America/Regina,America/Resolute,America/Swift_Current,America/Tegucigalpa,America/Thunder_Bay,America/Winnipeg,Canada/Central,Canada/East-Saskatchewan,Canada/Saskatchewan,Mexico/BajaSur,Mexico/General,Asia/Chongqing,Asia/Chungking,Asia/Harbin,Asia/Macao,Asia/Macau,Asia/Shanghai,Asia/Taipei,PRC,ROC,Europe/Zaporozhye,Atlantic/Cape_Verde,Atlantic/Cape_Verde,Atlantic/Cape_Verde,America/Chicago,America/Atikokan,America/Coral_Harbour,America/Fort_Wayne,America/Indiana/Indianapolis,America/Indiana/Knox,America/Indiana/Marengo,America/Indiana/Petersburg,America/Indiana/Tell_City,America/Indiana/Vevay,America/Indiana/Vincennes,America/Indiana/Winamac,America/Indianapolis,America/Kentucky/Louisville,America/Kentucky/Monticello,America/Knox_IN,America/Louisville,America/Menominee,America/Mexico_City,America/Rainy_River,America/Winnipeg,Canada/Central,Mexico/General,Indian/Christmas,Pacific/Guam,Pacific/Saipan,Asia/Dacca,Asia/Dhaka,Antarctica/Davis,Antarctica/Davis,Antarctica/DumontDUrville,Europe/Dublin,Asia/Dushanbe,Asia/Dushanbe,Asia/Dushanbe,Asia/Dushanbe,Chile/EasterIsland,Chile/EasterIsland,Pacific/Easter,Pacific/Easter,Chile/EasterIsland,Chile/EasterIsland,Chile/EasterIsland,Pacific/Easter,Pacific/Easter,Pacific/Easter,Africa/Khartoum,Africa/Addis_Ababa,Africa/Asmara,Africa/Asmera,Africa/Dar_es_Salaam,Africa/Djibouti,Africa/Juba,Africa/Kampala,Africa/Mogadishu,Africa/Nairobi,Indian/Antananarivo,Indian/Comoro,Indian/Mayotte,America/Guayaquil,Pacific/Galapagos,America/Iqaluit,America/New_York,America/Cancun,America/Detroit,America/Fort_Wayne,America/Grand_Turk,America/Indiana/Indianapolis,America/Indiana/Marengo,America/Indiana/Petersburg,America/Indiana/Tell_City,America/Indiana/Vevay,America/Indiana/Vincennes,America/Indiana/Winamac,America/Indianapolis,America/Iqaluit,America/Jamaica,America/Kentucky/Louisville,America/Kentucky/Monticello,America/Louisville,America/Montreal,America/Nassau,America/Nipigon,America/Pangnirtung,America/Port-au-Prince,America/Santo_Domingo,America/Thunder_Bay,America/Toronto,Canada/Eastern,Europe/Helsinki,Africa/Cairo,Asia/Amman,Asia/Beirut,Asia/Damascus,Asia/Gaza,Asia/Hebron,Asia/Istanbul,Asia/Nicosia,Europe/Athens,Europe/Bucharest,Europe/Chisinau,Europe/Istanbul,Europe/Kaliningrad,Europe/Kiev,Europe/Mariehamn,Europe/Minsk,Europe/Moscow,Europe/Nicosia,Europe/Riga,Europe/Samara,Europe/Simferopol,Europe/Sofia,Europe/Tallinn,Europe/Tiraspol,Europe/Uzhgorod,Europe/Vilnius,Europe/Warsaw,Europe/Zaporozhye,Europe/Helsinki,Asia/Gaza,Asia/Hebron,Africa/Cairo,Africa/Tripoli,Asia/Amman,Asia/Beirut,Asia/Damascus,Asia/Gaza,Asia/Hebron,Asia/Istanbul,Asia/Nicosia,Europe/Athens,Europe/Bucharest,Europe/Chisinau,Europe/Istanbul,Europe/Kaliningrad,Europe/Kiev,Europe/Mariehamn,Europe/Minsk,Europe/Moscow,Europe/Nicosia,Europe/Riga,Europe/Simferopol,Europe/Sofia,Europe/Tallinn,Europe/Tiraspol,Europe/Uzhgorod,Europe/Vilnius,Europe/Warsaw,Europe/Zaporozhye,America/Scoresbysund,America/Scoresbysund,America/Santo_Domingo,Chile/EasterIsland,Pacific/Easter,America/New_York,America/Detroit,America/Iqaluit,America/Montreal,America/Nipigon,America/Thunder_Bay,America/Toronto,Canada/Eastern,America/New_York,America/Atikokan,America/Cambridge_Bay,America/Cancun,America/Cayman,America/Chicago,America/Coral_Harbour,America/Detroit,America/Fort_Wayne,America/Grand_Turk,America/Indiana/Indianapolis,America/Indiana/Knox,America/Indiana/Marengo,America/Indiana/Petersburg,America/Indiana/Tell_City,America/Indiana/Vevay,America/Indiana/Vincennes,America/Indiana/Winamac,America/Indianapolis,America/Iqaluit,America/Jamaica,America/Kentucky/Louisville,America/Kentucky/Monticello,America/Knox_IN,America/Louisville,America/Managua,America/Menominee,America/Merida,America/Moncton,America/Montreal,America/Nassau,America/Nipigon,America/Panama,America/Pangnirtung,America/Port-au-Prince,America/Rankin_Inlet,America/Resolute,America/Santo_Domingo,America/Thunder_Bay,America/Toronto,Canada/Eastern,America/New_York,America/Detroit,America/Iqaluit,America/Montreal,America/Nipigon,America/Thunder_Bay,America/Toronto,Canada/Eastern,Europe/Kaliningrad,Europe/Minsk,America/Martinique,Pacific/Fiji,Pacific/Fiji,Atlantic/Stanley,Atlantic/Stanley,Atlantic/Stanley,Atlantic/Stanley,Atlantic/Stanley,Atlantic/Madeira,America/Noronha,Brazil/DeNoronha,America/Noronha,Brazil/DeNoronha,Asia/Aqtau,Asia/Aqtau,Asia/Bishkek,Asia/Bishkek,Asia/Bishkek,Asia/Bishkek,Pacific/Galapagos,Pacific/Gambier,America/Guyana,Asia/Tbilisi,Asia/Tbilisi,Asia/Tbilisi,Asia/Tbilisi,America/Cayenne,America/Cayenne,Africa/Accra,Pacific/Tarawa,Africa/Abidjan,Africa/Accra,Africa/Bamako,Africa/Banjul,Africa/Bissau,Africa/Conakry,Africa/Dakar,Africa/Freetown,Africa/Lome,Africa/Monrovia,Africa/Nouakchott,Africa/Ouagadougou,Africa/Sao_Tome,Africa/Timbuktu,America/Danmarkshavn,Atlantic/Reykjavik,Atlantic/St_Helena,Etc/GMT,Etc/Greenwich,Europe/Belfast,Europe/Dublin,Europe/Gibraltar,Europe/Guernsey,Europe/Isle_of_Man,Europe/Jersey,Europe/London,GB,Asia/Dubai,Atlantic/South_Georgia,Asia/Bahrain,Asia/Muscat,Asia/Qatar,Pacific/Guam,Pacific/Saipan,America/Guyana,America/Guyana,America/Guyana,America/Adak,America/Atka,America/Adak,America/Atka,Pacific/Honolulu,Pacific/Johnston,Asia/Hong_Kong,Asia/Hong_Kong,America/Havana,Atlantic/Azores,Asia/Calcutta,Asia/Dacca,Asia/Dhaka,Asia/Kolkata,Europe/Helsinki,Europe/Mariehamn,Asia/Hovd,Asia/Hovd,Asia/Hovd,Pacific/Honolulu,Pacific/Honolulu,Pacific/Johnston,Pacific/Johnston,Asia/Bangkok,Asia/Ho_Chi_Minh,Asia/Phnom_Penh,Asia/Saigon,Asia/Vientiane,Asia/Jerusalem,Asia/Tel_Aviv,Asia/Jerusalem,Asia/Gaza,Asia/Hebron,Asia/Tel_Aviv,Asia/Ho_Chi_Minh,Asia/Saigon,Asia/Colombo,Asia/Irkutsk,Asia/Istanbul,Europe/Istanbul,Indian/Chagos,Indian/Chagos,Asia/Tehran,Asia/Tehran,Asia/Irkutsk,Asia/Irkutsk,Asia/Irkutsk,Asia/Irkutsk,Asia/Irkutsk,Asia/Chita,Asia/Tehran,Asia/Tehran,Atlantic/Reykjavik,Asia/Jerusalem,Atlantic/Reykjavik,Asia/Calcutta,Asia/Colombo,Asia/Dacca,Asia/Dhaka,Asia/Karachi,Asia/Kathmandu,Asia/Katmandu,Asia/Kolkata,Asia/Thimbu,Asia/Thimphu,Europe/Dublin,Asia/Calcutta,Asia/Colombo,Asia/Karachi,Asia/Kolkata,Europe/Dublin,Europe/Dublin,Asia/Gaza,Asia/Hebron,Asia/Tel_Aviv,Asia/Jakarta,Asia/Pyongyang,Asia/Sakhalin,Asia/Seoul,Asia/Tokyo,ROK,Asia/Tokyo,Asia/Jerusalem,Asia/Tel_Aviv,Asia/Tokyo,Asia/Dili,Asia/Ho_Chi_Minh,Asia/Hong_Kong,Asia/Jakarta,Asia/Kuala_Lumpur,Asia/Kuching,Asia/Makassar,Asia/Manila,Asia/Pontianak,Asia/Pyongyang,Asia/Rangoon,Asia/Saigon,Asia/Sakhalin,Asia/Seoul,Asia/Singapore,Asia/Taipei,Asia/Ujung_Pandang,Pacific/Bougainville,Pacific/Nauru,ROC,ROK,Asia/Taipei,ROC,Asia/Karachi,Asia/Seoul,Asia/Seoul,ROK,ROK,Asia/Bishkek,Asia/Bishkek,Asia/Bishkek,Asia/Qyzylorda,Asia/Qyzylorda,Asia/Qyzylorda,Asia/Qyzylorda,Europe/Vilnius,America/Grand_Turk,America/Jamaica,Europe/Kiev,Pacific/Kosrae,Pacific/Kosrae,Asia/Krasnoyarsk,Asia/Krasnoyarsk,Asia/Novokuznetsk,Asia/Novokuznetsk,Asia/Krasnoyarsk,Asia/Krasnoyarsk,Asia/Krasnoyarsk,Asia/Novokuznetsk,Asia/Novokuznetsk,Asia/Seoul,Asia/Pyongyang,Asia/Seoul,Asia/Pyongyang,ROK,ROK,Europe/Samara,Europe/Samara,Europe/Samara,Pacific/Kwajalein,Australia/LHI,Australia/Lord_Howe,Australia/LHI,Australia/Lord_Howe,Australia/Lord_Howe,Australia/LHI,Pacific/Kiritimati,Pacific/Kiritimati,Pacific/Kiritimati,Asia/Colombo,Asia/Colombo,Africa/Monrovia,Europe/Riga,Atlantic/Madeira,Atlantic/Madeira,Atlantic/Madeira,Asia/Magadan,Asia/Magadan,Asia/Srednekolymsk,Asia/Ust-Nera,Asia/Srednekolymsk,Asia/Ust-Nera,Asia/Magadan,Asia/Magadan,Asia/Magadan,Asia/Srednekolymsk,Asia/Ust-Nera,Asia/Srednekolymsk,Asia/Ust-Nera,Asia/Srednekolymsk,Asia/Ust-Nera,Asia/Singapore,Asia/Kuala_Lumpur,Asia/Singapore,Asia/Singapore,Asia/Singapore,Asia/Kuala_Lumpur,Asia/Kuala_Lumpur,Asia/Kuala_Lumpur,Pacific/Marquesas,Antarctica/Mawson,Antarctica/Mawson,America/Cambridge_Bay,America/Yellowknife,Europe/Moscow,America/Denver,America/Bahia_Banderas,America/Boise,America/Cambridge_Bay,America/Chihuahua,America/Edmonton,America/Hermosillo,America/Inuvik,America/Mazatlan,America/North_Dakota/Beulah,America/North_Dakota/Center,America/North_Dakota/New_Salem,America/Ojinaga,America/Phoenix,America/Regina,America/Shiprock,America/Swift_Current,America/Yellowknife,Canada/East-Saskatchewan,Canada/Mountain,Canada/Saskatchewan,Mexico/BajaSur,Pacific/Kwajalein,Pacific/Kwajalein,Pacific/Majuro,Pacific/Majuro,Antarctica/Macquarie,Europe/Moscow,Europe/Moscow,America/Montevideo,America/Managua,Africa/Monrovia,Indian/Maldives,Asia/Colombo,Asia/Rangoon,Asia/Makassar,Asia/Ujung_Pandang,Europe/Minsk,Asia/Macao,Asia/Macau,Asia/Macao,Asia/Macau,America/Denver,America/Boise,America/Cambridge_Bay,America/Edmonton,America/North_Dakota/Beulah,America/North_Dakota/Center,America/North_Dakota/New_Salem,America/Regina,America/Shiprock,America/Swift_Current,America/Yellowknife,Canada/East-Saskatchewan,Canada/Mountain,Canada/Saskatchewan,Europe/Moscow,Europe/Chisinau,Europe/Kaliningrad,Europe/Kiev,Europe/Minsk,Europe/Riga,Europe/Samara,Europe/Simferopol,Europe/Tallinn,Europe/Tiraspol,Europe/Uzhgorod,Europe/Vilnius,Europe/Volgograd,Europe/Zaporozhye,Europe/Moscow,Europe/Moscow,Europe/Chisinau,Europe/Kaliningrad,Europe/Kiev,Europe/Minsk,Europe/Riga,Europe/Samara,Europe/Simferopol,Europe/Tallinn,Europe/Tiraspol,Europe/Uzhgorod,Europe/Vilnius,Europe/Volgograd,Europe/Zaporozhye,Europe/Simferopol,Europe/Volgograd,Europe/Moscow,America/Denver,America/Bahia_Banderas,America/Boise,America/Cambridge_Bay,America/Chihuahua,America/Creston,America/Dawson_Creek,America/Edmonton,America/Ensenada,America/Hermosillo,America/Inuvik,America/Mazatlan,America/Mexico_City,America/North_Dakota/Beulah,America/North_Dakota/Center,America/North_Dakota/New_Salem,America/Ojinaga,America/Phoenix,America/Regina,America/Santa_Isabel,America/Shiprock,America/Swift_Current,America/Tijuana,America/Yellowknife,Canada/East-Saskatchewan,Canada/Mountain,Canada/Saskatchewan,Mexico/BajaNorte,Mexico/BajaSur,Mexico/General,Europe/Moscow,Indian/Mauritius,Indian/Mauritius,Indian/Maldives,America/Denver,America/Boise,America/Cambridge_Bay,America/Edmonton,America/North_Dakota/Beulah,America/North_Dakota/Center,America/North_Dakota/New_Salem,America/Phoenix,America/Regina,America/Shiprock,America/Swift_Current,America/Yellowknife,Canada/East-Saskatchewan,Canada/Mountain,Canada/Saskatchewan,Asia/Kuala_Lumpur,Asia/Kuching,Pacific/Noumea,Pacific/Noumea,America/St_Johns,Canada/Newfoundland,America/St_Johns,America/St_Johns,America/Goose_Bay,Canada/Newfoundland,America/Goose_Bay,Canada/Newfoundland,America/Paramaribo,Europe/Amsterdam,Europe/Amsterdam,Pacific/Norfolk,Pacific/Norfolk,Asia/Novosibirsk,Asia/Novosibirsk,Asia/Novokuznetsk,Asia/Novosibirsk,Asia/Novosibirsk,Asia/Novokuznetsk,Asia/Novokuznetsk,America/St_Johns,Asia/Katmandu,America/Adak,America/Atka,America/Nome,America/Goose_Bay,Canada/Newfoundland,Asia/Kathmandu,Pacific/Nauru,Pacific/Nauru,America/St_Johns,America/St_Johns,Europe/Amsterdam,America/Goose_Bay,Canada/Newfoundland,America/Goose_Bay,Canada/Newfoundland,America/Adak,America/Atka,America/Nome,Pacific/Midway,Pacific/Pago_Pago,Pacific/Samoa,Pacific/Niue,Pacific/Niue,Pacific/Niue,America/St_Johns,America/Adak,America/Atka,America/Nome,America/Goose_Bay,Canada/Newfoundland,Pacific/Auckland,Antarctica/McMurdo,Antarctica/South_Pole,NZ,Pacific/Auckland,Antarctica/McMurdo,Antarctica/South_Pole,NZ,Pacific/Auckland,Pacific/Auckland,Pacific/Auckland,Antarctica/McMurdo,Antarctica/South_Pole,NZ,Antarctica/McMurdo,Antarctica/South_Pole,NZ,Antarctica/McMurdo,Antarctica/South_Pole,NZ,Asia/Omsk,Asia/Omsk,Asia/Omsk,Asia/Omsk,Asia/Omsk,Asia/Oral,Asia/Oral,Asia/Oral,America/Inuvik,America/Los_Angeles,America/Boise,America/Dawson,America/Dawson_Creek,America/Ensenada,America/Juneau,America/Metlakatla,America/Santa_Isabel,America/Sitka,America/Tijuana,America/Vancouver,America/Whitehorse,Canada/Pacific,Canada/Yukon,Mexico/BajaNorte,America/Lima,Asia/Kamchatka,Asia/Kamchatka,Asia/Kamchatka,Asia/Kamchatka,America/Lima,Pacific/Bougainville,Pacific/Port_Moresby,Pacific/Enderbury,Pacific/Enderbury,Pacific/Enderbury,Asia/Manila,Asia/Manila,Asia/Karachi,Asia/Karachi,Asia/Ho_Chi_Minh,Asia/Saigon,America/Miquelon,America/Miquelon,America/Paramaribo,America/Paramaribo,Antarctica/DumontDUrville,Asia/Yekaterinburg,Asia/Pontianak,Africa/Algiers,Africa/Tunis,Europe/Monaco,Europe/Paris,Pacific/Pitcairn,Pacific/Pohnpei,Pacific/Ponape,America/Port-au-Prince,America/Los_Angeles,America/Dawson_Creek,America/Ensenada,America/Juneau,America/Metlakatla,America/Santa_Isabel,America/Sitka,America/Tijuana,America/Vancouver,Canada/Pacific,Mexico/BajaNorte,America/Los_Angeles,America/Bahia_Banderas,America/Boise,America/Creston,America/Dawson,America/Dawson_Creek,America/Ensenada,America/Hermosillo,America/Inuvik,America/Juneau,America/Mazatlan,America/Metlakatla,America/Santa_Isabel,America/Sitka,America/Tijuana,America/Vancouver,America/Whitehorse,Canada/Pacific,Canada/Yukon,Mexico/BajaNorte,Mexico/BajaSur,Pacific/Pitcairn,America/Los_Angeles,America/Dawson_Creek,America/Ensenada,America/Juneau,America/Metlakatla,America/Santa_Isabel,America/Sitka,America/Tijuana,America/Vancouver,Canada/Pacific,Mexico/BajaNorte,Pacific/Palau,America/Asuncion,America/Asuncion,America/Asuncion,America/Guayaquil,Asia/Qyzylorda,Asia/Qyzylorda,Asia/Qyzylorda,Indian/Reunion,Europe/Riga,Asia/Rangoon,Antarctica/Rothera,Asia/Sakhalin,Asia/Sakhalin,Asia/Sakhalin,Asia/Sakhalin,Asia/Samarkand,Europe/Samara,Europe/Samara,Asia/Samarkand,Asia/Samarkand,Europe/Samara,Europe/Samara,Africa/Johannesburg,Africa/Johannesburg,Africa/Johannesburg,Africa/Maseru,Africa/Mbabane,Africa/Windhoek,Africa/Maseru,Africa/Mbabane,Africa/Maseru,Africa/Mbabane,Africa/Windhoek,Pacific/Guadalcanal,Indian/Mahe,America/Santo_Domingo,Pacific/Apia,Asia/Singapore,Asia/Singapore,Asia/Aqtau,Asia/Aqtau,Asia/Aqtau,America/Costa_Rica,Atlantic/Stanley,America/Santiago,Chile/Continental,Asia/Kuala_Lumpur,Asia/Singapore,Europe/Simferopol,Asia/Srednekolymsk,America/Paramaribo,America/Paramaribo,Pacific/Samoa,Pacific/Apia,Pacific/Midway,Pacific/Pago_Pago,Europe/Volgograd,Europe/Volgograd,Asia/Yekaterinburg,Asia/Yekaterinburg,Asia/Yekaterinburg,Asia/Yekaterinburg,Africa/Windhoek,Antarctica/Syowa,Pacific/Tahiti,Asia/Samarkand,Asia/Tashkent,Asia/Tashkent,Asia/Samarkand,Asia/Tashkent,Asia/Tashkent,Asia/Tbilisi,Asia/Tbilisi,Asia/Tbilisi,Asia/Tbilisi,Asia/Tbilisi,Indian/Kerguelen,Asia/Dushanbe,Pacific/Fakaofo,Pacific/Fakaofo,Asia/Dili,Asia/Dili,Asia/Tehran,Europe/Tallinn,Asia/Ashgabat,Asia/Ashkhabad,Asia/Ashgabat,Asia/Ashkhabad,Pacific/Tongatapu,Pacific/Tongatapu,Pacific/Tongatapu,Europe/Istanbul,Asia/Istanbul,Europe/Istanbul,Asia/Istanbul,Europe/Volgograd,Pacific/Funafuti,Etc/UCT,Asia/Ulaanbaatar,Asia/Ulan_Bator,Asia/Ulaanbaatar,Asia/Ulaanbaatar,Asia/Choibalsan,Asia/Ulan_Bator,Asia/Choibalsan,Asia/Ulan_Bator,Asia/Oral,Asia/Oral,Asia/Oral,Asia/Oral,Asia/Oral,Antarctica/Troll,Etc/Universal,Etc/UTC,Etc/Zulu,UTC,UTC,America/Montevideo,America/Montevideo,America/Montevideo,America/Montevideo,America/Montevideo,Asia/Samarkand,Asia/Tashkent,Asia/Samarkand,Asia/Tashkent,America/Caracas,America/Caracas,Asia/Vladivostok,Asia/Vladivostok,Asia/Khandyga,Asia/Vladivostok,Asia/Vladivostok,Asia/Vladivostok,Asia/Khandyga,Asia/Ust-Nera,Asia/Khandyga,Asia/Ust-Nera,Europe/Volgograd,Europe/Volgograd,Europe/Volgograd,Europe/Volgograd,Antarctica/Vostok,Pacific/Efate,Pacific/Efate,Pacific/Wake,America/Mendoza,America/Argentina/Jujuy,America/Argentina/Mendoza,America/Argentina/San_Luis,America/Jujuy,America/Mendoza,America/Argentina/Catamarca,America/Argentina/ComodRivadavia,America/Argentina/Cordoba,America/Argentina/Jujuy,America/Argentina/La_Rioja,America/Argentina/Mendoza,America/Argentina/Rio_Gallegos,America/Argentina/Salta,America/Argentina/San_Juan,America/Argentina/San_Luis,America/Argentina/Tucuman,America/Argentina/Ushuaia,America/Catamarca,America/Cordoba,America/Jujuy,America/Rosario,Africa/Windhoek,Africa/Ndjamena,Africa/Brazzaville,Africa/Bissau,Africa/El_Aaiun,Africa/Bangui,Africa/Douala,Africa/Kinshasa,Africa/Lagos,Africa/Libreville,Africa/Luanda,Africa/Malabo,Africa/Ndjamena,Africa/Niamey,Africa/Porto-Novo,Africa/Windhoek,Europe/Lisbon,Europe/Madrid,Europe/Monaco,Europe/Paris,Europe/Paris,Europe/Luxembourg,Africa/Algiers,Africa/Casablanca,Africa/Ceuta,Africa/El_Aaiun,Atlantic/Canary,Atlantic/Faeroe,Atlantic/Faroe,Atlantic/Madeira,Europe/Brussels,Europe/Lisbon,Europe/Luxembourg,Europe/Madrid,Europe/Monaco,Europe/Paris,Europe/Luxembourg,Africa/Algiers,Africa/Casablanca,Africa/Ceuta,Africa/El_Aaiun,Atlantic/Azores,Atlantic/Canary,Atlantic/Faeroe,Atlantic/Faroe,Atlantic/Madeira,Europe/Andorra,Europe/Brussels,Europe/Lisbon,Europe/Luxembourg,Europe/Madrid,Europe/Monaco,Pacific/Wallis,America/Godthab,America/Danmarkshavn,America/Godthab,America/Danmarkshavn,Asia/Jakarta,Asia/Pontianak,Asia/Jakarta,Asia/Pontianak,Asia/Jakarta,Asia/Pontianak,Asia/Dili,Asia/Makassar,Asia/Pontianak,Asia/Ujung_Pandang,Asia/Jayapura,Europe/Vilnius,Europe/Warsaw,Pacific/Apia,Pacific/Apia,Pacific/Apia,Asia/Kashgar,Asia/Urumqi,Asia/Yakutsk,Asia/Yakutsk,Asia/Chita,Asia/Khandyga,Asia/Chita,Asia/Khandyga,Asia/Yakutsk,Asia/Yakutsk,Asia/Yakutsk,Asia/Chita,Asia/Khandyga,Asia/Ust-Nera,Asia/Chita,Asia/Khandyga,Asia/Ust-Nera,Asia/Chita,Asia/Khandyga,America/Dawson,America/Whitehorse,Canada/Yukon,America/Dawson,America/Juneau,America/Whitehorse,America/Yakutat,Canada/Yukon,Asia/Yekaterinburg,Asia/Yekaterinburg,Asia/Yekaterinburg,Asia/Yerevan,Asia/Yerevan,Asia/Yerevan,Asia/Yerevan,America/Dawson,America/Whitehorse,America/Yakutat,Canada/Yukon,America/Anchorage,America/Dawson,America/Juneau,America/Nome,America/Sitka,America/Whitehorse,America/Yakutat,Canada/Yukon,America/Dawson,America/Whitehorse,America/Yakutat,Canada/Yukon,Antarctica/Davis,America/Cambridge_Bay,America/Inuvik,America/Iqaluit,America/Pangnirtung,America/Rankin_Inlet,America/Resolute,America/Yellowknife,Antarctica/Casey,Antarctica/DumontDUrville,Antarctica/Macquarie,Antarctica/Mawson,Antarctica/Palmer,Antarctica/Rothera,Antarctica/Syowa,Antarctica/Troll,Antarctica/Vostok,Indian/Kerguelen', '', NULL),
(67, NULL, NULL, 'general_reminder_hour', NULL, '0', 'select', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23', '', NULL),
(68, NULL, NULL, 'label_certificates', NULL, NULL, 'text', '', '', NULL),
(69, NULL, '2022-07-18 09:01:18', 'menu_show_certificates', NULL, '1', 'radio', '1=Yes,0=No', '', NULL),
(70, NULL, '2022-07-18 09:01:18', 'menu_show_downloads', NULL, '1', 'radio', '1=Yes,0=No', '', NULL),
(71, NULL, NULL, 'label_downloads', NULL, NULL, 'text', '', '', NULL),
(72, NULL, NULL, 'general_chat_code', NULL, NULL, 'textarea', '', '', NULL),
(73, NULL, '2022-07-18 09:01:18', 'menu_show_homework', NULL, '1', 'radio', '1=Yes,0=No', '', NULL),
(74, NULL, NULL, 'label_courses', NULL, NULL, 'text', '', '', NULL),
(75, NULL, NULL, 'label_my_sessions', NULL, NULL, 'text', '', '', NULL),
(76, NULL, NULL, 'label_homework', NULL, NULL, 'text', '', '', NULL),
(77, NULL, NULL, 'regis_confirm_email', NULL, '0', 'radio', '1=Yes,0=No', '', NULL),
(78, NULL, NULL, 'label_featured', NULL, NULL, 'text', '', '', NULL),
(79, NULL, NULL, 'label_calendar', NULL, NULL, 'text', '', '', NULL),
(80, NULL, NULL, 'label_blog_posts', NULL, NULL, 'text', '', '', NULL),
(81, NULL, NULL, 'label_register', NULL, NULL, 'text', '', '', NULL),
(82, NULL, NULL, 'info_terms', NULL, NULL, 'textarea', '', 'rte', NULL),
(83, NULL, NULL, 'info_privacy', NULL, NULL, 'textarea', '', 'rte', NULL),
(84, NULL, '2022-07-18 09:01:19', 'general_address', NULL, '<p>P2E Technology&nbsp;Ltd.&nbsp;No. 3, Adeleye street, Utako, Abuja</p>', 'textarea', '', 'rte', NULL),
(85, NULL, '2022-07-18 09:01:19', 'general_tel', NULL, '+234 8000000000', 'text', '', '', NULL),
(86, NULL, '2022-07-18 09:01:19', 'general_contact_email', NULL, 'info@p2enigeria.com', 'text', '', '', NULL),
(87, NULL, NULL, 'social_enable_facebook', NULL, '0', 'radio', '1=Yes,0=No', '', NULL),
(88, NULL, NULL, 'social_facebook_secret', NULL, NULL, 'text', '', '', NULL),
(89, NULL, NULL, 'social_facebook_app_id', NULL, NULL, 'text', '', '', NULL),
(90, NULL, NULL, 'social_enable_google', NULL, '0', 'radio', '1=Yes,0=No', '', NULL),
(91, NULL, NULL, 'social_google_secret', NULL, NULL, 'text', '', '', NULL),
(92, NULL, NULL, 'social_google_id', NULL, NULL, 'text', '', '', NULL),
(93, NULL, NULL, 'sms_enabled', NULL, NULL, 'checkbox', '', '', NULL),
(94, NULL, NULL, 'sms_sender_name', NULL, NULL, 'text', '', '', NULL),
(95, NULL, NULL, 'label_sessions_courses', NULL, NULL, 'text', '', '', NULL),
(96, NULL, NULL, 'label_session_course', NULL, NULL, 'text', '', '', NULL),
(97, NULL, NULL, 'banner_status', NULL, '0', 'radio', '1=Yes,0=No', '', NULL),
(98, NULL, NULL, 'banner_app_name', NULL, NULL, 'text', '', '', NULL),
(99, NULL, NULL, 'banner_android_id', NULL, NULL, 'text', '', '', NULL),
(100, NULL, NULL, 'banner_ios_id', NULL, NULL, 'text', '', '', NULL),
(101, NULL, NULL, 'banner_icon_url', NULL, NULL, 'text', '', '', NULL),
(102, NULL, NULL, 'regis_captcha_type', NULL, 'image', 'select', 'image=Image,google=Google reCAPTCHA v3', '', NULL),
(103, NULL, NULL, 'regis_recaptcha_key', NULL, NULL, 'text', '', '', NULL),
(104, NULL, NULL, 'regis_recaptcha_secret', NULL, NULL, 'text', '', '', NULL),
(105, NULL, NULL, 'config_language', NULL, NULL, 'text', '', '', NULL),
(106, '2022-07-18 09:01:17', '2022-07-18 09:01:17', 'general_video_max_size', 'Size in megabytes', '500', 'text', NULL, NULL, NULL),
(107, '2022-07-18 09:01:20', '2022-12-13 05:39:37', 'config_baseurl', NULL, 'http://test.comelynation.com', 'text', NULL, NULL, NULL),
(108, '2022-07-18 09:01:21', '2022-07-18 09:01:21', 'regis_enroll_mail', NULL, NULL, 'textarea', NULL, 'rte', NULL),
(109, '2022-07-18 09:01:21', '2022-07-18 09:01:21', 'academic_session_id', NULL, '1', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gateway_name` varchar(191) NOT NULL,
  `directory` varchar(191) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  `default` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `default` text DEFAULT NULL,
  `placeholders` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `created_at`, `updated_at`, `name`, `description`, `message`, `default`, `placeholders`) VALUES
(1, NULL, NULL, 'Upcoming class reminder (physical location)', 'This message is sent to students to remind them when a class is scheduled to hold.', 'Reminder! The [SESSION_NAME] class \'[SESSION_NAME]\' holds on [CLASS_DATE]. Venue: [CLASS_VENUE] . Starts: [CLASS_START_TIME] . Ends: [CLASS_END_TIME]', 'Reminder! The [SESSION_NAME] class \'[SESSION_NAME]\' holds on [CLASS_DATE]. Venue: [CLASS_VENUE] . Starts: [CLASS_START_TIME] . Ends: [CLASS_END_TIME]', '\n                <ul>\n                <li>[CLASS_NAME] : The name of the class</li>\n                <li>[CLASS_DATE] : The class date</li>\n                <li>[SESSION_NAME] : The name of the session the class is attached to</li>\n                <li>[CLASS_VENUE] : The venue of the class</li>\n                <li>[CLASS_START_TIME] : The start time for the class</li>\n                <li>[CLASS_END_TIME] : The end time for the class</li>\n                </ul>\n                '),
(2, NULL, NULL, 'Upcoming class reminder (online class)', 'This message is sent to students to remind them when an online class is scheduled to open.', 'Reminder! The [COURSE_NAME] class \'[CLASS_NAME]\' starts on  [CLASS_DATE]', 'Reminder! The [COURSE_NAME] class \'[CLASS_NAME]\' starts on  [CLASS_DATE]', '\n                <ul>\n                <li>[CLASS_NAME] : The name of the class</li>\n                <li>[CLASS_DATE] : The class date</li>\n                <li>[COURSE_NAME] : The name of the session the class is attached to</li>\n                </ul>\n                '),
(3, NULL, NULL, 'Upcoming Test reminder', 'This message is sent to users when there is an upcoming test in a session/course they are enrolled in', 'Reminder: The \'[SESSION_NAME]\' test \'[TEST_NAME]\' opens on [OPENING_DATE] and closes on [CLOSING_DATE]', 'Reminder: The \'[SESSION_NAME]\' test \'[TEST_NAME]\' opens on [OPENING_DATE] and closes on [CLOSING_DATE]', '\n                <ul>\n                <li>[TEST_NAME] : The name of the test</li>\n                <li>[TEST_DESCRIPTION] : The description of the test</li>\n                <li>[SESSION_NAME] : The name of the session or course the test is attached to</li>\n                <li>[OPENING_DATE] : The opening date of the test</li>\n                <li>[CLOSING_DATE] : The closing date of the test</li>\n                <li>[PASSMARK] : The test passmark e.g. 50%</li>\n                <li>[MINUTES_ALLOWED]: The number of minutes allowed for the test</li>\n                </ul>\n                '),
(4, NULL, NULL, 'Online Class start notification', 'This message is sent to students when a scheduled online class opens', 'Please be reminded that the class \'[CLASS_NAME]\' for the course \'[COURSE_NAME]\' has started. <br/>\nVisit this link to take this class now: [CLASS_URL]', 'Please be reminded that the class \'[CLASS_NAME]\' for the course \'[COURSE_NAME]\' has started. <br/>\nVisit this link to take this class now: [CLASS_URL]', '\n                <ul>\n                <li>[CLASS_NAME] : The name of the class</li>\n                <li>[CLASS_URL] : The url of the class</li>\n                <li>[COURSE_NAME] : The name of the course the class belongs to</li>\n                </ul>\n                '),
(5, NULL, NULL, 'Homework reminder', 'This message is sent to students reminding them when a homework is due', 'Please be reminded that the homework \'[HOMEWORK_NAME]\' is due on [DUE_DATE].\nPlease click this link to submit your homework now: [HOMEWORK_URL]', 'Please be reminded that the homework \'[HOMEWORK_NAME]\' is due on [DUE_DATE].\nPlease click this link to submit your homework now: [HOMEWORK_URL]', '\n                <ul>\n                <li>[NUMBER_OF_DAYS] : The number of days remaining till the homework due date e.g. 1,2,3</li>\n                <li>[DAY_TEXT] : The \'day\' text. Defaults to \'day\' if [NUMBER_OF_DAYS] is 1 and \'days\' if greater than 1.</li>\n                <li>[HOMEWORK_NAME] : The name of the homework</li>\n                <li>[HOMEWORK_URL] : The homework url</li>\n                <li>[HOMEWORK_INSTRUCTION] : The instructions for the homework</li>\n                <li>[PASSMARK] : The passmark for the homework</li>\n                 <li>[DUE_DATE] : The homework due date</li>\n                <li>[OPENING_DATE] : The homework opening date</li>\n\n                </ul>\n                '),
(6, NULL, NULL, 'Course closing reminder', 'Warning email sent to enrolled students about a course that will close soon.', 'Please be reminded that the course \'[COURSE_NAME]\' closes on [CLOSING_DATE].\nPlease click this link to complete the course now: [COURSE_URL]', 'Please be reminded that the course \'[COURSE_NAME]\' closes on [CLOSING_DATE].\nPlease click this link to complete the course now: [COURSE_URL]', '\n                <ul>\n                <li>[COURSE_NAME] : The name of the course</li>\n                <li>[COURSE_URL] : The course URL</li>\n                <li>[CLOSING_DATE] : The closing date for the course</li>\n                 <li>[NUMBER_OF_DAYS] : The number of days remaining till the closing date e.g. 1,2,3</li>\n                <li>[DAY_TEXT] : The \'day\' text. Defaults to \'day\' if [NUMBER_OF_DAYS] is 1 and \'days\' if greater than 1.</li>\n\n                </ul>\n                ');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `mobile_number` varchar(191) DEFAULT NULL,
  `api_token` varchar(191) DEFAULT NULL,
  `token_expires` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `created_at`, `updated_at`, `user_id`, `mobile_number`, `api_token`, `token_expires`) VALUES
(1, '2022-07-18 10:24:58', '2022-08-03 10:34:13', 2, NULL, NULL, NULL),
(29, '2022-11-26 19:35:30', '2022-11-26 19:35:30', 45, '09087676565', NULL, NULL),
(30, '2022-11-27 18:37:49', '2022-11-27 18:37:49', 46, '09087877676', NULL, NULL),
(31, '2022-11-27 20:14:49', '2022-11-27 20:14:49', 47, '08098767676', NULL, NULL),
(32, '2022-11-28 04:47:21', '2022-11-28 04:47:21', 48, '08165553905', NULL, NULL),
(35, '2022-12-11 16:04:06', '2022-12-11 16:04:06', 51, '0909090909', NULL, NULL),
(49, '2022-12-12 06:51:10', '2022-12-12 06:51:10', 65, '08098765678', NULL, NULL),
(53, '2022-12-12 08:47:24', '2022-12-12 08:47:24', 69, '08098765678', NULL, NULL),
(54, '2022-12-12 08:57:01', '2022-12-12 08:57:01', 70, '08134305556', NULL, NULL),
(55, '2022-12-12 09:13:54', '2022-12-12 09:13:54', 71, '08098766567', NULL, NULL),
(56, '2022-12-12 09:42:48', '2022-12-12 09:42:48', 72, '08134305556', NULL, NULL),
(64, '2022-12-12 18:25:21', '2022-12-12 18:25:21', 82, '09098909899', NULL, NULL),
(65, '2022-12-13 01:51:06', '2022-12-13 01:51:06', 83, '090909090', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_certificates`
--

CREATE TABLE `student_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `certificate_id` bigint(20) UNSIGNED NOT NULL,
  `tracking_number` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_certificate_downloads`
--

CREATE TABLE `student_certificate_downloads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `certificate_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `reg_code` varchar(191) DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `session_id` bigint(20) DEFAULT NULL,
  `semester_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`id`, `created_at`, `updated_at`, `student_id`, `course_id`, `reg_code`, `completed`, `session_id`, `semester_id`) VALUES
(1, '2022-08-08 23:00:00', '2022-08-08 23:00:00', 2, 7, 'uifhd', 0, NULL, NULL),
(2, '2022-08-08 23:00:00', '2022-08-08 23:00:00', 2, 6, 'xo3st', 0, NULL, NULL),
(3, '2022-08-08 23:00:00', '2022-08-08 23:00:00', 2, 5, 'noy0g', 0, NULL, NULL),
(4, '2022-08-15 23:00:00', '2022-08-15 23:00:00', 6, 7, '39mb2', 0, NULL, NULL),
(5, '2022-08-15 23:00:00', '2022-08-15 23:00:00', 6, 6, 'tcmk6', 0, NULL, NULL),
(6, '2022-08-15 23:00:00', '2022-08-15 23:00:00', 6, 5, 'dp5e5', 0, NULL, NULL),
(7, '2022-11-26 22:00:00', '2022-11-26 22:00:00', 29, 7, 'px0t5', 0, NULL, NULL),
(8, '2022-11-26 22:00:00', '2022-11-26 22:00:00', 31, 7, 'kcs2a', 0, NULL, NULL),
(9, '2022-12-10 22:00:00', '2022-12-10 22:00:00', 35, 7, '5lwtj', 0, NULL, NULL),
(10, '2022-12-10 22:00:00', '2022-12-10 22:00:00', 35, 6, '5lwtj', 0, NULL, NULL),
(39, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 49, 7, 'chc1y', 0, 1, 1),
(40, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 49, 6, 'chc1y', 0, 1, 1),
(47, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 53, 5, 'hwue4', 0, 1, 1),
(48, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 53, 6, 'hwue4', 0, 1, 1),
(49, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 53, 7, 'hwue4', 0, 1, 1),
(50, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 54, 5, '2ezwi', 0, 1, 1),
(51, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 54, 6, '2ezwi', 0, 1, 1),
(52, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 54, 7, '2ezwi', 0, 1, 1),
(53, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 55, 5, 'aoixn', 0, 1, 1),
(54, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 55, 6, 'aoixn', 0, 1, 1),
(55, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 55, 7, 'aoixn', 0, 1, 1),
(56, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 56, 5, 'ryeev', 0, 1, 1),
(57, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 56, 6, 'ryeev', 0, 1, 1),
(58, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 56, 7, 'ryeev', 0, 1, 1),
(80, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 64, 5, 'nfisj', 0, 1, 1),
(81, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 64, 6, 'nfisj', 0, 1, 1),
(82, '2022-12-11 22:00:00', '2022-12-11 22:00:00', 64, 7, 'nfisj', 0, 1, 1),
(83, '2022-12-12 22:00:00', '2022-12-12 22:00:00', 65, 5, 'yhtk4', 0, 1, 1),
(84, '2022-12-12 22:00:00', '2022-12-12 22:00:00', 65, 6, 'yhtk4', 0, 1, 1),
(85, '2022-12-12 22:00:00', '2022-12-12 22:00:00', 65, 7, 'yhtk4', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_course_logs`
--

CREATE TABLE `student_course_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_exams`
--

CREATE TABLE `student_exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `score` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_exams`
--

INSERT INTO `student_exams` (`id`, `created_at`, `updated_at`, `student_id`, `exam_id`, `score`) VALUES
(2, '2022-08-11 09:08:08', '2022-08-11 09:08:24', 2, 3, 100.00),
(6, '2022-08-16 15:47:58', '2022-08-16 15:48:08', 6, 3, 0.00),
(7, '2022-08-16 15:48:32', '2022-08-16 15:48:40', 6, 3, 0.00),
(8, '2022-08-16 15:51:50', '2022-08-16 15:52:07', 6, 3, 100.00),
(9, '2022-08-17 12:24:30', '2022-08-17 12:25:02', 2, 3, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `student_exam_exam_option`
--

CREATE TABLE `student_exam_exam_option` (
  `student_exam_id` bigint(20) UNSIGNED NOT NULL,
  `exam_option_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_exam_exam_option`
--

INSERT INTO `student_exam_exam_option` (`student_exam_id`, `exam_option_id`) VALUES
(8, 15),
(9, 15);

-- --------------------------------------------------------

--
-- Table structure for table `student_fields`
--

CREATE TABLE `student_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `options` text DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `placeholder` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_lectures`
--

CREATE TABLE `student_lectures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_student_field`
--

CREATE TABLE `student_student_field` (
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `student_field_id` bigint(20) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_tests`
--

CREATE TABLE `student_tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `score` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_tests`
--

INSERT INTO `student_tests` (`id`, `created_at`, `updated_at`, `student_id`, `test_id`, `score`) VALUES
(5, '2022-12-12 09:10:58', '2022-12-12 09:11:11', 53, 4, 100.00),
(8, '2022-12-12 09:38:17', '2022-12-12 09:38:28', 53, 4, 100.00),
(12, '2022-12-12 09:47:28', '2022-12-12 09:47:28', 55, 4, 0.00),
(13, '2022-12-12 09:55:56', '2022-12-12 09:55:56', 55, 4, 0.00),
(14, '2022-12-12 09:58:29', '2022-12-12 10:01:16', 55, 4, 100.00),
(15, '2022-12-12 10:01:34', '2022-12-12 10:01:41', 55, 4, 100.00),
(16, '2022-12-12 10:05:04', '2022-12-12 10:05:12', 55, 4, 100.00),
(17, '2022-12-12 10:15:17', '2022-12-12 10:15:23', 53, 4, 100.00),
(18, '2022-12-12 10:29:06', '2022-12-12 10:29:06', 53, 4, 0.00),
(19, '2022-12-12 10:35:21', '2022-12-12 10:35:21', 53, 4, 0.00),
(20, '2022-12-12 10:40:34', '2022-12-12 10:40:40', 53, 4, 100.00),
(21, '2022-12-12 10:42:24', '2022-12-12 10:42:32', 49, 4, 100.00),
(22, '2022-12-12 11:26:55', '2022-12-12 11:27:32', 53, 4, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `student_test_test_option`
--

CREATE TABLE `student_test_test_option` (
  `student_test_id` bigint(20) UNSIGNED NOT NULL,
  `test_option_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_test_test_option`
--

INSERT INTO `student_test_test_option` (`student_test_id`, `test_option_id`) VALUES
(5, 11),
(8, 11),
(14, 11),
(14, 11),
(14, 11),
(15, 11),
(16, 11),
(17, 11),
(20, 11),
(21, 11),
(22, 11);

-- --------------------------------------------------------

--
-- Table structure for table `student_video`
--

CREATE TABLE `student_video` (
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `narration` text DEFAULT NULL,
  `payment_reference` varchar(50) DEFAULT NULL,
  `processor_id` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `total_amount` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `session_id` bigint(22) DEFAULT NULL,
  `semester_id` bigint(22) DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `fee_id` bigint(20) DEFAULT NULL,
  `package_id` bigint(20) DEFAULT NULL,
  `start_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `amount`, `narration`, `payment_reference`, `processor_id`, `transaction_id`, `message`, `total_amount`, `payment_status`, `payment_method`, `session_id`, `semester_id`, `currency_id`, `fee_id`, `package_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 2, '15000', 'payment for online e-library subscription', 'T769445792582904', 'T769445792582904', '2344967308', NULL, '15000', '1', 'Online', 1, 1, 2, NULL, NULL, '2022-12-06', '1970-01-01', '2022-12-06 23:49:31', '2022-12-06 23:49:31'),
(2, 2, '15000', 'good', 'T937331139648959', 'T937331139648959', '2344968897', NULL, '15000', '1', 'Online', 1, 1, 2, NULL, NULL, '2022-12-06', '1970-01-01 00:01:00', '2022-12-06 23:51:21', '2022-12-06 23:51:21'),
(3, 2, '15000', 'Testing the payment system', 'T618467053827382', 'T618467053827382', '2344971141', NULL, '15000', '1', 'Online', 1, 1, 2, NULL, NULL, '2022-12-06', '2023-02-04 23:02:42', '2022-12-06 23:53:42', '2022-12-06 23:53:42'),
(4, 2, '15000', 'bnbnb', 'T925462507685209', 'T925462507685209', '2345059793', NULL, '15000', '1', 'Online', 1, 1, 2, NULL, NULL, '2022-12-07', '2023-02-05', '2022-12-07 00:52:37', '2022-12-07 00:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `hash` varchar(191) NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `survey_options`
--

CREATE TABLE `survey_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `survey_question_id` bigint(20) UNSIGNED NOT NULL,
  `option` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `survey_questions`
--

CREATE TABLE `survey_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `survey_id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `survey_responses`
--

CREATE TABLE `survey_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `survey_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `survey_response_survey_option`
--

CREATE TABLE `survey_response_survey_option` (
  `survey_response_id` bigint(20) UNSIGNED NOT NULL,
  `survey_option_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `directory` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `created_at`, `updated_at`, `name`, `enabled`, `directory`) VALUES
(1, '2022-07-18 09:01:18', '2022-07-18 09:29:17', 'Buson', 0, 'buson'),
(2, '2022-07-18 09:29:17', '2022-07-18 09:29:17', 'Education', 1, 'education');

-- --------------------------------------------------------

--
-- Table structure for table `template_colors`
--

CREATE TABLE `template_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `template_id` bigint(20) UNSIGNED NOT NULL,
  `original_color` varchar(191) DEFAULT NULL,
  `user_color` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template_colors`
--

INSERT INTO `template_colors` (`id`, `created_at`, `updated_at`, `template_id`, `original_color`, `user_color`) VALUES
(1, '2022-07-18 09:38:54', '2022-07-18 09:38:54', 2, '2d3092', '006400'),
(2, '2022-07-18 09:38:54', '2022-07-18 09:38:54', 2, 'f4f4f4', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `template_options`
--

CREATE TABLE `template_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `template_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template_options`
--

INSERT INTO `template_options` (`id`, `created_at`, `updated_at`, `template_id`, `name`, `value`, `enabled`) VALUES
(1, '2022-07-18 09:01:19', '2022-07-18 09:01:19', 1, 'top-bar', 'a:11:{s:6:\"_token\";s:40:\"FJCotq9TzWxE17MEEaYWfJhLXyEwDDMqsF9bglnK\";s:7:\"enabled\";s:1:\"1\";s:14:\"office_address\";s:16:\"234, Jersey Road\";s:5:\"email\";s:14:\"info@email.com\";s:8:\"bg_color\";N;s:10:\"font_color\";N;s:15:\"social_facebook\";s:1:\"#\";s:14:\"social_twitter\";s:1:\"#\";s:16:\"social_instagram\";s:1:\"#\";s:14:\"social_youtube\";s:1:\"#\";s:15:\"social_linkedin\";s:1:\"#\";}', 1),
(2, '2022-07-18 09:01:19', '2022-07-18 09:01:19', 1, 'navigation', 'a:5:{s:6:\"_token\";s:40:\"FJCotq9TzWxE17MEEaYWfJhLXyEwDDMqsF9bglnK\";s:7:\"enabled\";s:1:\"1\";s:8:\"bg_color\";N;s:10:\"font_color\";N;s:12:\"order_button\";s:1:\"1\";}', 1),
(3, '2022-07-18 09:01:19', '2022-07-18 09:01:19', 1, 'slideshow', 'a:72:{s:6:\"_token\";s:40:\"gCOeCtTPQaESMEVTShGLb7rbvYf3hAPnbYXSSdm0\";s:7:\"enabled\";s:1:\"1\";s:5:\"file1\";s:68:\"img/demo/slide1.jpg\";s:14:\"slide_heading1\";s:27:\"Professional Courses\";s:19:\"heading_font_color1\";N;s:11:\"slide_text1\";s:33:\"Get the best courses!\";s:16:\"text_font_color1\";N;s:12:\"button_text1\";s:10:\"Learn More\";s:4:\"url1\";s:1:\"#\";s:5:\"file2\";s:68:\"img/demo/slide2.png\";s:14:\"slide_heading2\";s:26:\"Training Sessions\";s:19:\"heading_font_color2\";N;s:11:\"slide_text2\";s:36:\"Get the best training\";s:16:\"text_font_color2\";N;s:12:\"button_text2\";s:10:\"Learn More\";s:4:\"url2\";s:1:\"#\";s:5:\"file3\";N;s:14:\"slide_heading3\";N;s:19:\"heading_font_color3\";N;s:11:\"slide_text3\";N;s:16:\"text_font_color3\";N;s:12:\"button_text3\";N;s:4:\"url3\";N;s:5:\"file4\";N;s:14:\"slide_heading4\";N;s:19:\"heading_font_color4\";N;s:11:\"slide_text4\";N;s:16:\"text_font_color4\";N;s:12:\"button_text4\";N;s:4:\"url4\";N;s:5:\"file5\";N;s:14:\"slide_heading5\";N;s:19:\"heading_font_color5\";N;s:11:\"slide_text5\";N;s:16:\"text_font_color5\";N;s:12:\"button_text5\";N;s:4:\"url5\";N;s:5:\"file6\";N;s:14:\"slide_heading6\";N;s:19:\"heading_font_color6\";N;s:11:\"slide_text6\";N;s:16:\"text_font_color6\";N;s:12:\"button_text6\";N;s:4:\"url6\";N;s:5:\"file7\";N;s:14:\"slide_heading7\";N;s:19:\"heading_font_color7\";N;s:11:\"slide_text7\";N;s:16:\"text_font_color7\";N;s:12:\"button_text7\";N;s:4:\"url7\";N;s:5:\"file8\";N;s:14:\"slide_heading8\";N;s:19:\"heading_font_color8\";N;s:11:\"slide_text8\";N;s:16:\"text_font_color8\";N;s:12:\"button_text8\";N;s:4:\"url8\";N;s:5:\"file9\";N;s:14:\"slide_heading9\";N;s:19:\"heading_font_color9\";N;s:11:\"slide_text9\";N;s:16:\"text_font_color9\";N;s:12:\"button_text9\";N;s:4:\"url9\";N;s:6:\"file10\";N;s:15:\"slide_heading10\";N;s:20:\"heading_font_color10\";N;s:12:\"slide_text10\";N;s:17:\"text_font_color10\";N;s:13:\"button_text10\";N;s:5:\"url10\";N;}', 1),
(4, '2022-07-18 09:01:19', '2022-07-18 09:01:19', 1, 'homepage-services', 'a:12:{s:6:\"_token\";s:40:\"gCOeCtTPQaESMEVTShGLb7rbvYf3hAPnbYXSSdm0\";s:7:\"enabled\";s:1:\"1\";s:5:\"file1\";s:68:\"img/demo/service1.jpg\";s:8:\"heading1\";s:14:\"Quality Training\";s:5:\"text1\";s:129:\"<p>We provide high quality in person training at all our locations.</p>\";s:5:\"file2\";s:68:\"img/demo/service2.jpg\";s:8:\"heading2\";s:18:\"Online Training\";s:5:\"text2\";s:176:\"Enrol for one of our online courses and learn at your own pace! We have different modules available for all your learning needs!<br>\";s:12:\"info_heading\";s:23:\"The Best Training Company\";s:9:\"info_text\";s:167:\"<p>We are the best training service provider in our Industry! Get quality training now!<br></p>\";s:11:\"button_text\";s:10:\"Learn More\";s:3:\"url\";s:1:\"#\";}', 1),
(5, '2022-07-18 09:01:19', '2022-07-18 09:01:19', 1, 'homepage-about', 'a:7:{s:6:\"_token\";s:40:\"gCOeCtTPQaESMEVTShGLb7rbvYf3hAPnbYXSSdm0\";s:7:\"enabled\";s:1:\"1\";s:7:\"heading\";s:28:\"1000 Clients and counting...\";s:4:\"text\";s:318:\"<p>Over the years, we are proud to have serviced more than 1000 satisfied clients! Our client list is spread across all states of the federation. </p><p>Some of our clients include:</p><ol><li>Supertech Limited</li><li>Super Schools Limited</li><li>Andre Montessori School</li><li>Kings Elementary School<br></li></ol>\";s:11:\"button_text\";s:9:\"Read more\";s:10:\"button_url\";s:1:\"#\";s:5:\"image\";s:68:\"img/demo/about.jpg\";}', 1),
(6, '2022-07-18 09:01:19', '2022-07-18 09:01:19', 1, 'testimonials', 'a:28:{s:6:\"_token\";s:40:\"8jnb6kBKNB2moNVBP322DvRN1xDSTpkha0PSlQ6w\";s:7:\"enabled\";s:1:\"1\";s:11:\"sub_heading\";s:12:\"Testimonials\";s:7:\"heading\";s:16:\"What Parents Say\";s:5:\"name1\";s:7:\"Shola A\";s:5:\"role1\";s:3:\"Mom\";s:6:\"image1\";s:67:\"img/demo/tes1.png\";s:5:\"text1\";s:445:\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\";s:5:\"name2\";s:8:\"Tolulope\";s:5:\"role2\";s:3:\"Dad\";s:6:\"image2\";s:67:\"img/demo/tes2.png\";s:5:\"text2\";s:445:\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\";s:5:\"name3\";s:5:\"Bunmi\";s:5:\"role3\";s:3:\"Mom\";s:6:\"image3\";s:67:\"img/demo/tes3.png\";s:5:\"text3\";s:445:\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\";s:5:\"name4\";N;s:5:\"role4\";N;s:6:\"image4\";N;s:5:\"text4\";N;s:5:\"name5\";N;s:5:\"role5\";N;s:6:\"image5\";N;s:5:\"text5\";N;s:5:\"name6\";N;s:5:\"role6\";N;s:6:\"image6\";N;s:5:\"text6\";N;}', 1),
(7, '2022-07-18 09:01:19', '2022-07-18 09:01:19', 1, 'blog', 'a:5:{s:6:\"_token\";s:40:\"8jnb6kBKNB2moNVBP322DvRN1xDSTpkha0PSlQ6w\";s:7:\"enabled\";s:1:\"1\";s:11:\"sub_heading\";s:4:\"Blog\";s:7:\"heading\";s:12:\"Latest Posts\";s:5:\"limit\";s:1:\"3\";}', 0),
(8, '2022-07-18 09:01:19', '2022-07-18 09:01:19', 1, 'contact-form', 'a:6:{s:6:\"_token\";s:40:\"gCOeCtTPQaESMEVTShGLb7rbvYf3hAPnbYXSSdm0\";s:7:\"enabled\";s:1:\"1\";s:7:\"heading\";s:12:\"Get in touch\";s:4:\"text\";s:129:\"<p>Do you have any questions about our services? Get in touch with us now and we will be glad to get back to you shortly.<br></p>\";s:8:\"bg_color\";N;s:10:\"font_color\";N;}', 1),
(9, '2022-07-18 09:01:19', '2022-07-18 09:01:19', 1, 'footer', 'a:13:{s:6:\"_token\";s:40:\"FJCotq9TzWxE17MEEaYWfJhLXyEwDDMqsF9bglnK\";s:7:\"enabled\";s:1:\"1\";s:4:\"text\";s:60:\"We are the best agency for all your training needs!\";s:15:\"newsletter-code\";N;s:7:\"credits\";s:20:\"© 2020 Training Company\";s:8:\"bg_color\";N;s:10:\"font_color\";N;s:5:\"image\";N;s:15:\"social_facebook\";s:1:\"#\";s:14:\"social_twitter\";s:1:\"#\";s:16:\"social_instagram\";s:1:\"#\";s:14:\"social_youtube\";s:1:\"#\";s:15:\"social_linkedin\";s:1:\"#\";}', 1),
(10, '2022-07-18 09:46:17', '2022-07-18 09:56:04', 2, 'top-bar', 'a:12:{s:7:\"enabled\";s:1:\"1\";s:5:\"email\";s:23:\"support@piratech.com.ng\";s:9:\"telephone\";s:17:\"+234 813 430 5556\";s:8:\"bg_color\";s:3:\"fff\";s:10:\"font_color\";N;s:4:\"cart\";s:1:\"0\";s:15:\"social_bg_color\";s:6:\"86878a\";s:15:\"social_facebook\";s:24:\"https://www.facebook.com\";s:14:\"social_twitter\";s:23:\"https://www.twitter.com\";s:16:\"social_instagram\";s:25:\"https://www.instagram.com\";s:14:\"social_youtube\";s:23:\"https://www.youtube.com\";s:15:\"social_linkedin\";s:24:\"https://www.linkedin.com\";}', 1),
(11, '2022-07-18 09:57:59', '2022-07-18 10:02:38', 2, 'navigation', 'a:5:{s:7:\"enabled\";s:1:\"1\";s:8:\"bg_color\";N;s:10:\"font_color\";s:6:\"86878a\";s:7:\"logo_bg\";N;s:11:\"search_form\";s:1:\"1\";}', 1),
(12, '2022-07-18 10:11:57', '2022-07-18 10:15:27', 2, 'slideshow', 'a:72:{s:7:\"enabled\";s:1:\"1\";s:17:\"slider_background\";N;s:5:\"file1\";s:67:\"uploads/template_files/uOhFonzWuEfVyNBKE9pmUm3dt1qNL6lWN3aFU7FA.png\";s:14:\"slide_heading1\";s:21:\"Popular Online Course\";s:19:\"heading_font_color1\";N;s:11:\"slide_text1\";s:43:\"Learn From Thoursands Of Our Online Courses\";s:16:\"text_font_color1\";N;s:12:\"button_text1\";s:11:\"Get Started\";s:4:\"url1\";s:1:\"#\";s:5:\"file2\";N;s:14:\"slide_heading2\";N;s:19:\"heading_font_color2\";N;s:11:\"slide_text2\";N;s:16:\"text_font_color2\";N;s:12:\"button_text2\";N;s:4:\"url2\";N;s:5:\"file3\";N;s:14:\"slide_heading3\";N;s:19:\"heading_font_color3\";N;s:11:\"slide_text3\";N;s:16:\"text_font_color3\";N;s:12:\"button_text3\";N;s:4:\"url3\";N;s:5:\"file4\";N;s:14:\"slide_heading4\";N;s:19:\"heading_font_color4\";N;s:11:\"slide_text4\";N;s:16:\"text_font_color4\";N;s:12:\"button_text4\";N;s:4:\"url4\";N;s:5:\"file5\";N;s:14:\"slide_heading5\";N;s:19:\"heading_font_color5\";N;s:11:\"slide_text5\";N;s:16:\"text_font_color5\";N;s:12:\"button_text5\";N;s:4:\"url5\";N;s:5:\"file6\";N;s:14:\"slide_heading6\";N;s:19:\"heading_font_color6\";N;s:11:\"slide_text6\";N;s:16:\"text_font_color6\";N;s:12:\"button_text6\";N;s:4:\"url6\";N;s:5:\"file7\";N;s:14:\"slide_heading7\";N;s:19:\"heading_font_color7\";N;s:11:\"slide_text7\";N;s:16:\"text_font_color7\";N;s:12:\"button_text7\";N;s:4:\"url7\";N;s:5:\"file8\";N;s:14:\"slide_heading8\";N;s:19:\"heading_font_color8\";N;s:11:\"slide_text8\";N;s:16:\"text_font_color8\";N;s:12:\"button_text8\";N;s:4:\"url8\";N;s:5:\"file9\";N;s:14:\"slide_heading9\";N;s:19:\"heading_font_color9\";N;s:11:\"slide_text9\";N;s:16:\"text_font_color9\";N;s:12:\"button_text9\";N;s:4:\"url9\";N;s:6:\"file10\";N;s:15:\"slide_heading10\";N;s:20:\"heading_font_color10\";N;s:12:\"slide_text10\";N;s:17:\"text_font_color10\";N;s:13:\"button_text10\";N;s:5:\"url10\";N;}', 1),
(13, '2022-07-19 08:17:25', '2022-07-19 08:23:50', 2, 'featured-courses', 'a:4:{s:7:\"enabled\";s:1:\"1\";s:11:\"sub_heading\";s:32:\"Most popular courses of the week\";s:7:\"heading\";s:19:\"Our Popular Courses\";s:7:\"courses\";a:3:{i:0;s:1:\"3\";i:1;s:1:\"2\";i:2;s:1:\"1\";}}', 1),
(14, '2022-07-19 08:25:56', '2022-07-19 10:29:41', 2, 'instructors', 'a:4:{s:7:\"enabled\";s:1:\"1\";s:11:\"sub_heading\";s:52:\"All qualified teachers with professional certificate\";s:7:\"heading\";s:14:\"NIMET Teachers\";s:11:\"instructors\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}}', 1),
(15, '2022-07-19 08:33:00', '2022-07-19 08:33:00', 2, 'footer', 'a:12:{s:7:\"enabled\";s:1:\"1\";s:4:\"text\";N;s:15:\"newsletter-code\";N;s:7:\"credits\";N;s:8:\"bg_color\";N;s:10:\"font_color\";N;s:5:\"image\";N;s:15:\"social_facebook\";s:1:\"#\";s:14:\"social_twitter\";s:1:\"#\";s:16:\"social_instagram\";s:1:\"#\";s:14:\"social_youtube\";s:1:\"#\";s:15:\"social_linkedin\";N;}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `minutes` int(11) DEFAULT NULL,
  `allow_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `passmark` double(8,2) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `show_result` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `created_at`, `updated_at`, `admin_id`, `name`, `description`, `enabled`, `minutes`, `allow_multiple`, `passmark`, `private`, `show_result`) VALUES
(4, '2022-12-12 09:03:15', '2022-12-12 09:03:15', 1, '2023 election in Nigeria', '<p>All questions are compulsory</p>', 1, 30, 1, 70.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_grades`
--

CREATE TABLE `test_grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `grade` varchar(191) NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_grades`
--

INSERT INTO `test_grades` (`id`, `created_at`, `updated_at`, `grade`, `min`, `max`) VALUES
(1, '2022-08-11 09:58:38', '2022-08-11 09:58:38', 'A', 75, 100);

-- --------------------------------------------------------

--
-- Table structure for table `test_options`
--

CREATE TABLE `test_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `test_question_id` bigint(20) UNSIGNED NOT NULL,
  `option` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_options`
--

INSERT INTO `test_options` (`id`, `created_at`, `updated_at`, `test_question_id`, `option`, `is_correct`) VALUES
(11, '2022-12-12 09:08:53', '2022-12-12 09:08:53', 3, 'Bola Ahmed Tinubu (Jagaban) APC', 1),
(12, '2022-12-12 09:08:53', '2022-12-12 09:08:53', 3, 'Atiku Abubakar PDP', 0),
(13, '2022-12-12 09:08:53', '2022-12-12 09:08:53', 3, 'Peter Obi LP', 0),
(14, '2022-12-12 09:08:53', '2022-12-12 09:08:53', 3, 'Sowore Omoyele AAC', 0),
(15, '2022-12-12 09:08:53', '2022-12-12 09:08:53', 3, 'Musa Rabiu Kwankwaso', 0);

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`id`, `created_at`, `updated_at`, `test_id`, `question`, `sort_order`) VALUES
(3, '2022-12-12 09:08:53', '2022-12-12 09:08:53', 4, '<p>Who will win the 2023 presidential election?</p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `picture` varchar(191) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `last_seen` timestamp NULL DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `login_token` varchar(191) DEFAULT NULL,
  `login_token_expires` timestamp NULL DEFAULT NULL,
  `billing_firstname` varchar(191) DEFAULT NULL,
  `billing_lastname` varchar(191) DEFAULT NULL,
  `billing_country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_state` varchar(191) DEFAULT NULL,
  `billing_city` varchar(191) DEFAULT NULL,
  `billing_address_1` text DEFAULT NULL,
  `billing_address_2` varchar(191) DEFAULT NULL,
  `billing_zip` varchar(191) DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT NULL,
  `session` varchar(50) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `olevel_result` varchar(191) DEFAULT NULL,
  `course_of_study` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `picture`, `enabled`, `last_seen`, `last_name`, `login_token`, `login_token_expires`, `billing_firstname`, `billing_lastname`, `billing_country_id`, `billing_state`, `billing_city`, `billing_address_1`, `billing_address_2`, `billing_zip`, `payment_status`, `session`, `semester`, `olevel_result`, `course_of_study`) VALUES
(1, 'Admin', 'admin@nimet.gov.ng', NULL, '$2y$10$NAnxgl66V92sSqlwvG1f1O/U5Ay5/am1FyVnAK30P.4MIDxqkUkWC', 'XUdCEd6yM5tMYdMy9jTBVZG97DOB5ii06Ek48G5gdisKlQgNWjb8awcFud6n', '2022-07-18 09:01:20', '2022-07-19 08:30:12', 1, NULL, 1, NULL, 'Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Bill', 'student@nimet.gov.ng', NULL, '$2y$10$9xEniEZvWobuEBwAjyoxqeT8NEfFyfhsHHRqkXgWQ0bHHEqilP9QW', NULL, '2022-07-18 10:24:58', '2022-08-03 13:14:27', 2, NULL, 1, NULL, 'Gate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL),
(3, 'AREMU', 'olusegunaremu69@gmail.com', NULL, '$2y$10$j86Vn7aSWS2EgHbkpr/TVOoGWtTyY.P4rVN7TfL95LOteVCCM/TVC', NULL, '2022-07-19 08:39:19', '2022-12-12 11:22:17', 1, NULL, 1, NULL, 'OLUSEGUN AMOS.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'ORAMALUGO', 'foramalugo@gmail.com', NULL, '$2y$10$nxg69/OfhEWFVcn24HbNNeXCutRJiJN9GSqy0LrcUxPnkO0iKFynS', NULL, '2022-08-02 11:30:09', '2022-12-12 11:20:27', 1, NULL, 1, NULL, 'FELICIA NNEAMAKA.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'SHOLADEMI', 'msholademi@gmail.com', NULL, '$2y$10$YzVRl1qcKncfrLU1h9JTBewyLqDb03.6M0Fq5J75ZOAfrbp4VN43O', NULL, '2022-08-02 11:32:02', '2022-12-12 11:18:04', 1, NULL, 1, NULL, 'MUTIAT O.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'OJO', 'i.ojo@nimet.gov.ng', NULL, '$2y$10$ENTcpchh1bMcVGZ2D9/sz.imAfY40BWdIuKFoOkQSkhvWUG0MktRS', NULL, '2022-08-02 11:33:20', '2022-12-12 11:16:46', 1, NULL, 1, NULL, 'A. ILESANMI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'NAJIBOLA', 'olumideajibola62@gmail.com', NULL, '$2y$10$1js9m102t91h9HwgKMev8u/T8UTNp5mmCyo7gLqFXCR0ocThIsXi.', NULL, '2022-08-02 11:35:12', '2022-12-12 11:15:46', 1, NULL, 1, NULL, 'OLUMIDE M.AME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'YEKINI-OJA', 'omolara@gmail.com', NULL, '$2y$10$6m4HkPJ/UimkiXLtKIiGg.03vTUVgAd5Mf4usQnSxsZOLLAZnoJOW', NULL, '2022-08-02 12:28:40', '2022-12-12 11:14:10', 1, NULL, 1, NULL, 'MUHIBAT OMOLARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'OLATOKE', 'segunolatoke123@gmail.com', NULL, '$2y$10$unlMHZpXsW4qxQ7Mu8Hlpesg0IMIkPCOjpG3PbPQdk/0FZlAGIvom', NULL, '2022-08-02 12:30:27', '2022-12-12 11:11:51', 1, NULL, 1, NULL, 'RAMAT OMOTAYO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'KOLADE', 'lanrekolad@gmail.com', NULL, '$2y$10$Mh/24wqZiD//ezDdKOQ4we3QgQpEzg4qJX.TsTh0M7CmLbX7Wz9dq', NULL, '2022-08-02 12:33:32', '2022-12-12 11:13:21', 1, NULL, 1, NULL, 'OLANREWAJU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'OYEGOKE', 'joyce4oye@yahoo.com', NULL, '$2y$10$IellgPfGOWpLCeXLCoDNPOEdrxnVLqyQAiVyc56dK6JHf/ZLERMhq', NULL, '2022-08-02 12:36:16', '2022-12-12 11:10:44', 1, NULL, 1, NULL, 'JOYCE OLUSOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'WILLIAMS', 'agigee2378@yahoo.com', NULL, '$2y$10$6hIJnHzWDxpk8OU6IWGeQO52qQwx5BrsDeFGMaZ7J2k3TVaA3nbni', NULL, '2022-08-02 12:38:52', '2022-12-12 11:09:48', 1, NULL, 1, NULL, 'AGNES INYANG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'IBRAHIM', 'iiirafindadi@gmail.com', NULL, '$2y$10$UU/ZXmlQLn.wLOvT.jxgv.TCNjmT1PdcIL30iiWzidgTMMSS9Spbe', NULL, '2022-08-02 12:41:06', '2022-12-12 11:08:55', 1, NULL, 1, NULL, 'ISMAIL RAFINDADI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'POPOOLA', 't.popoola@nimet.gov.ng', NULL, '$2y$10$ZKAnxmXA5vTAJpFALw/hKeo5NwxA2nHUaUtMuV3LTDk5yvRylfwJC', NULL, '2022-08-02 12:44:11', '2022-12-12 11:07:14', 1, NULL, 1, NULL, 'TEMIDAYO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'MADUAGWU', 'preciousorisakwe@yahoo.com', NULL, '$2y$10$8cgHiC/BeRsNp24i76tU/el3TDAHnzXqWYHT.DsvrOGsn2s1Ouo8O', NULL, '2022-08-02 12:46:25', '2022-12-12 11:06:23', 1, NULL, 1, NULL, 'CHINOMNSO GRACE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'EMMANUEL', 'e.aweda@nimet.gov.ng', NULL, '$2y$10$fw4CAvI1nFqIkXs/9UtSaO6SVcIPHa08p.uSonzU1KozeetSVzzE6', NULL, '2022-08-02 12:50:08', '2022-12-12 11:03:14', 1, NULL, 1, NULL, 'AWEDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'OLUWATOSIN', 'h.oluwatosin@nimet.gov.ng', NULL, '$2y$10$ykOlwKVt4n6XznfaMax36.aMY3Q2ON.Q/xkG9g9jHcbS5lcVIKFJm', NULL, '2022-08-02 12:52:02', '2022-12-12 11:02:07', 1, NULL, 1, NULL, 'HELEN LFEPADE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Sasha', 'sasha@nimet.gov.ng', NULL, '$2y$10$e.wK513uTv2qg9W7HVJkNu6e1TZjQ6WXqkaEa0EcMY7.UIB7LzD3q', 'UrrQXFjL9fqM1BS5rLtabRHCC9ULk62dTk1OuOYygSPE27DM5cUVP1YhMM7L', '2022-08-03 10:57:17', '2022-08-10 14:52:45', 2, 'usermedia/student_uploads/2022_08/16601467652_png_student.png', 1, NULL, 'Banks', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', '1', 'usermedia/student_uploads/2022_08/16601304032_image_of_waec_online_result_sample.png', NULL),
(22, 'Mercy', 'mercy@gmail.com', NULL, '$2y$10$.4M.Vn0HYEETDs8GuPzLie.HxU4ec5XkwuPn.MyBOVKNI.qFrv8FK', NULL, '2022-08-16 15:23:15', '2022-08-16 23:46:22', 2, 'usermedia/student_uploads/2022_08/16606672366_WhatsApp_Image_2022-08-07_at_08.42.24__1_.jpeg', 1, NULL, 'Andrew', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', '1', 'usermedia/student_uploads/2022_08/16606672366_image_of_waec_online_result_sample.png', NULL),
(45, 'Blessing', 'blessing@nimet.gov.ng', NULL, '$2y$10$byF3OiYWQ6vdhyRVjXNV0e4mLTWqiueakdo2d8dEN/BfA5fCibpyC', NULL, '2022-11-26 19:35:30', '2022-11-27 18:19:03', 2, NULL, 1, NULL, 'Atagah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, '3'),
(46, 'user', 'user1@nimet.gov.ng', NULL, '$2y$10$1fnyOG5ipwi30Zzg/P4M0.nJ1k5LuCohnkP0rNVLtsWGBQsI.a6di', NULL, '2022-11-27 18:37:49', '2022-11-27 18:37:49', 2, NULL, 1, NULL, 'my user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL),
(47, 'Paul', 'paul@nimet.gov.ng', NULL, '$2y$10$KLA3kQREGcc9K24Dq1.D9OZK5uHOayRUrDpb6Voob3WaEoo5CMYkG', NULL, '2022-11-27 20:14:49', '2022-11-27 21:57:02', 2, NULL, 1, NULL, 'Logan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, NULL),
(48, 'Chimdi', 'david.abraham@nimet.gov.ng', NULL, '$2y$10$GD9c86nHnizT3gGbrSf7t.2SPPh8IIRLgWdEPTVDInpTkDvTlU5By', NULL, '2022-11-28 04:47:21', '2022-11-28 04:50:05', 2, NULL, 1, NULL, 'Abraham', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, NULL),
(51, 'Test Account', 'test2@nimet.gov.ng', NULL, '$2y$10$CpfiLgrFv1DB9QjwdD.N5e.IXFmYDjUgIRd5e4UBJ4x8ndNjHZy6K', NULL, '2022-12-11 16:04:06', '2022-12-12 03:36:17', 2, NULL, 1, NULL, 'fdklfjd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, '3'),
(65, 'Fine', 'mailer@comelynation.com', NULL, '', NULL, '2022-12-12 06:51:10', '2022-12-12 06:51:10', 2, NULL, 1, NULL, 'Art', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '7'),
(69, 'Test', 'test@nimet.gov.ng', NULL, '$2y$10$e/tFlHDzm1QkuddaPfhLZeW2YDkkLRMd8Es1Gz3ws9zx9B2OF4056', NULL, '2022-12-12 08:47:24', '2022-12-12 08:49:04', 2, NULL, 1, NULL, 'Account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', '1', NULL, '7'),
(70, 'Ilemona', 'ilemonaj@gmail.com', NULL, '', NULL, '2022-12-12 08:57:01', '2022-12-12 08:57:01', 2, NULL, 1, NULL, 'James', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '7'),
(71, 'Test13', 'test13@nimet.gov.ng', NULL, '', NULL, '2022-12-12 09:13:54', '2022-12-12 09:13:54', 2, NULL, 1, NULL, 'Test14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '7'),
(72, 'Ilemona', 'brainhubtech@gmail.com', NULL, '', NULL, '2022-12-12 09:42:48', '2022-12-12 09:42:48', 2, NULL, 1, NULL, 'James', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '7'),
(73, 'ASANIYAN', 'asaniyanomolola@gmail.com', NULL, '$2y$10$Cf8rIrQnTSW2HOcj19wbZeIrJterswFQQaRtepXIStgTt1iGMvUrS', NULL, '2022-12-12 11:28:02', '2022-12-12 11:28:02', 1, NULL, 1, NULL, 'OMOLOLA OLUDARE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'IHEME', 'patiheme@yahoo.com', NULL, '$2y$10$vuAb8C9E9j88zHrX9bZdJel5XiW6qsTpLwaGBGMtBV91O7ISQzzGi', NULL, '2022-12-12 11:29:45', '2022-12-12 11:29:45', 1, NULL, 1, NULL, 'PATRICIA NNENNA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'Paul', 'tacticshustle@gmail.com', NULL, '', NULL, '2022-12-12 18:25:21', '2022-12-12 18:25:21', 2, NULL, 1, NULL, 'Pogba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '7'),
(83, 'jdfkj', 'jdkfjdlf@nimet.gov.ng', NULL, '', NULL, '2022-12-13 01:51:06', '2022-12-13 01:51:06', 2, NULL, 1, NULL, 'ffjdkjfl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '7');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `length` varchar(191) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `file_size` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `virtual_class`
--

CREATE TABLE `virtual_class` (
  `id` int(10) UNSIGNED NOT NULL,
  `meeting_id` varchar(191) NOT NULL,
  `topic` varchar(191) NOT NULL,
  `description` text NOT NULL COMMENT 'agenda',
  `start_date` varchar(100) DEFAULT NULL,
  `end_date` varchar(100) DEFAULT NULL,
  `duration` int(11) NOT NULL COMMENT 'minutes',
  `password` varchar(191) NOT NULL COMMENT 'meeting password',
  `student_limit` int(11) DEFAULT NULL,
  `start_url` text NOT NULL,
  `join_url` text NOT NULL,
  `picture` varchar(191) DEFAULT NULL,
  `admin_id` bigint(22) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Online live classes using zoom api, google meet api etc';

--
-- Dumping data for table `virtual_class`
--

INSERT INTO `virtual_class` (`id`, `meeting_id`, `topic`, `description`, `start_date`, `end_date`, `duration`, `password`, `student_limit`, `start_url`, `join_url`, `picture`, `admin_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(10, '76702199611', 'Test virtual class', '<p>Test description</p>', '1:00 PM', NULL, 45, 'password', NULL, 'https://us04web.zoom.us/s/76702199611?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IjFad1R6bzhnUlVHbUpSdUpJZXlwZ1EiLCJpc3MiOiJ3ZWIiLCJzayI6IjE2MzM1MDU3MTkwNzEyODMxNTQiLCJzdHkiOjEsIndjZCI6InVzMDQiLCJjbHQiOjAsIm1udW0iOiI3NjcwMjE5OTYxMSIsImV4cCI6MTY1ODIzODk2MywiaWF0IjoxNjU4MjMxNzYzLCJhaWQiOiJvb1JST1pjTlJQT0NyWG50TXE1a0NBIiwiY2lkIjoiIn0.fcvZSndB8nMBcsPLGeUTRb3zLNbBtuqOBUuGbprR7jA', 'https://us04web.zoom.us/j/76702199611?pwd=6W6H_040yDEZ7v6eoRRoD_-_a4bOUJ.1', NULL, NULL, '2022-07-19 10:00:02', '2022-07-19 10:00:02', NULL),
(12, '75191832895', 'Advanced machine learning', '<p>Introduction to&nbsp;Advanced machine learning</p>', '4:15 PM', NULL, 45, 'password', 500, 'https://us04web.zoom.us/s/75191832895?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IjFad1R6bzhnUlVHbUpSdUpJZXlwZ1EiLCJpc3MiOiJ3ZWIiLCJzayI6IjE2MzM1MDU3MTkwNzEyODMxNTQiLCJzdHkiOjEsIndjZCI6InVzMDQiLCJjbHQiOjAsIm1udW0iOiI3NTE5MTgzMjg5NSIsImV4cCI6MTY1ODI1MDY1NCwiaWF0IjoxNjU4MjQzNDU0LCJhaWQiOiJvb1JST1pjTlJQT0NyWG50TXE1a0NBIiwiY2lkIjoiIn0.DbfeEgTQcdG75PrpbtqOty1LQ1CxFw5PEBje6sz3mJ8', 'https://us04web.zoom.us/j/75191832895?pwd=Pr05mJ95i7hMpsYaRpIfsF7V-dNhQr.1', NULL, NULL, '2022-07-19 13:14:51', '2022-07-19 13:14:51', NULL),
(13, '75364236061', 'Lesson 1 Chapter 1', '<p>Lesson 1 Chapter 1</p>', '1:30 AM', NULL, 5, '12345678', 20, 'https://us04web.zoom.us/s/75364236061?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IjFad1R6bzhnUlVHbUpSdUpJZXlwZ1EiLCJpc3MiOiJ3ZWIiLCJzayI6IjE2MzM1MDU3MTkwNzEyODMxNTQiLCJzdHkiOjEsIndjZCI6InVzMDQiLCJjbHQiOjAsIm1udW0iOiI3NTM2NDIzNjA2MSIsImV4cCI6MTY2OTU5NTczMiwiaWF0IjoxNjY5NTg4NTMyLCJhaWQiOiJvb1JST1pjTlJQT0NyWG50TXE1a0NBIiwiY2lkIjoiIn0.uJOLN8rjeNd7AhrHd04ML2FxehUjEnSkiE2ITmm9W0Y', 'https://us04web.zoom.us/j/75364236061?pwd=Ln88IWaNRSzjb8dKiF9CC4U1sA0DzL.1', NULL, NULL, '2022-11-27 20:35:32', '2022-11-27 20:35:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `repeat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `created_at`, `updated_at`, `name`, `code`, `repeat`) VALUES
(1, NULL, NULL, 'slideshow', 'slideshow', 10),
(2, NULL, NULL, 'text-and-button', 'textbtn', 0),
(3, NULL, NULL, 'featured-courses', 'courses', 10),
(4, NULL, NULL, 'plain-text', 'text', 0),
(5, NULL, NULL, 'blog', 'blog', 0);

-- --------------------------------------------------------

--
-- Table structure for table `widget_values`
--

CREATE TABLE `widget_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `widget_id` bigint(20) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `visibility` char(191) NOT NULL DEFAULT 'b'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_sessions`
--
ALTER TABLE `academic_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_admin_role_id_foreign` (`admin_role_id`),
  ADD KEY `admins_user_id_foreign` (`user_id`);

--
-- Indexes for table `admin_admin_role`
--
ALTER TABLE `admin_admin_role`
  ADD KEY `admin_admin_role_admin_id_foreign` (`admin_id`),
  ADD KEY `admin_admin_role_admin_role_id_foreign` (`admin_role_id`);

--
-- Indexes for table `admin_course`
--
ALTER TABLE `admin_course`
  ADD KEY `admin_course_admin_id_foreign` (`admin_id`),
  ADD KEY `admin_course_course_id_foreign` (`course_id`);

--
-- Indexes for table `admin_discussion`
--
ALTER TABLE `admin_discussion`
  ADD KEY `admin_discussion_admin_id_foreign` (`admin_id`),
  ADD KEY `admin_discussion_discussion_id_foreign` (`discussion_id`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_role_permission`
--
ALTER TABLE `admin_role_permission`
  ADD KEY `admin_role_permission_admin_role_id_foreign` (`admin_role_id`),
  ADD KEY `admin_role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`);
ALTER TABLE `articles` ADD FULLTEXT KEY `full` (`title`,`content`,`slug`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_course_id_foreign` (`course_id`),
  ADD KEY `assignments_lesson_id_foreign` (`lesson_id`),
  ADD KEY `assignments_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `assignment_certificate`
--
ALTER TABLE `assignment_certificate`
  ADD KEY `assignment_certificate_certificate_id_foreign` (`certificate_id`),
  ADD KEY `assignment_certificate_assignment_id_foreign` (`assignment_id`);

--
-- Indexes for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_submissions_assignment_id_foreign` (`assignment_id`),
  ADD KEY `assignment_submissions_student_id_foreign` (`student_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_lesson_id_foreign` (`lesson_id`),
  ADD KEY `attendances_student_id_foreign` (`student_id`),
  ADD KEY `attendances_course_id_foreign` (`course_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_category_blog_post`
--
ALTER TABLE `blog_category_blog_post`
  ADD KEY `blog_category_blog_post_blog_category_id_foreign` (`blog_category_id`),
  ADD KEY `blog_category_blog_post_blog_post_id_foreign` (`blog_post_id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_admin_id_foreign` (`admin_id`);
ALTER TABLE `blog_posts` ADD FULLTEXT KEY `full` (`title`,`content`,`meta_title`,`meta_description`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmarks_course_id_foreign` (`course_id`),
  ADD KEY `bookmarks_student_id_foreign` (`student_id`),
  ADD KEY `bookmarks_lecture_page_id_foreign` (`lecture_page_id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificates_course_id_foreign` (`course_id`),
  ADD KEY `certificates_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `certificate_exam`
--
ALTER TABLE `certificate_exam`
  ADD KEY `certificate_exam_certificate_id_foreign` (`certificate_id`),
  ADD KEY `certificate_exam_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `certificate_lesson`
--
ALTER TABLE `certificate_lesson`
  ADD KEY `certificate_lesson_certificate_id_foreign` (`certificate_id`),
  ADD KEY `certificate_lesson_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `certificate_test`
--
ALTER TABLE `certificate_test`
  ADD KEY `certificate_test_certificate_id_foreign` (`certificate_id`),
  ADD KEY `certificate_test_test_id_foreign` (`test_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_course`
--
ALTER TABLE `coupon_course`
  ADD KEY `coupon_course_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_course_course_id_foreign` (`course_id`);

--
-- Indexes for table `coupon_course_category`
--
ALTER TABLE `coupon_course_category`
  ADD KEY `coupon_course_category_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_course_category_course_category_id_foreign` (`course_category_id`);

--
-- Indexes for table `coupon_invoice`
--
ALTER TABLE `coupon_invoice`
  ADD KEY `coupon_invoice_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_invoice_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_admin_id_foreign` (`admin_id`);
ALTER TABLE `courses` ADD FULLTEXT KEY `full` (`name`,`description`,`short_description`,`introduction`,`venue`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `course_course_category`
--
ALTER TABLE `course_course_category`
  ADD KEY `course_course_category_course_id_foreign` (`course_id`),
  ADD KEY `course_course_category_course_category_id_foreign` (`course_category_id`);

--
-- Indexes for table `course_download`
--
ALTER TABLE `course_download`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_download_course_id_foreign` (`course_id`),
  ADD KEY `course_download_download_id_foreign` (`download_id`);

--
-- Indexes for table `course_exam`
--
ALTER TABLE `course_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_exams_course_id_foreign` (`course_id`),
  ADD KEY `course_exams_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `course_lesson`
--
ALTER TABLE `course_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_lessons_course_id_foreign` (`course_id`),
  ADD KEY `course_lessons_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `course_lesson_admins`
--
ALTER TABLE `course_lesson_admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_lesson_admins_course_id_foreign` (`course_id`),
  ADD KEY `course_lesson_admins_admin_id_foreign` (`admin_id`),
  ADD KEY `course_lesson_admins_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `course_survey`
--
ALTER TABLE `course_survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_survey_course_id_foreign` (`course_id`),
  ADD KEY `course_survey_survey_id_foreign` (`survey_id`);

--
-- Indexes for table `course_test`
--
ALTER TABLE `course_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_tests_course_id_foreign` (`course_id`),
  ADD KEY `course_tests_test_id_foreign` (`test_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_country_id_foreign` (`country_id`);

--
-- Indexes for table `currency_payment_method`
--
ALTER TABLE `currency_payment_method`
  ADD KEY `currency_payment_method_currency_id_foreign` (`currency_id`),
  ADD KEY `currency_payment_method_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussions_student_id_foreign` (`student_id`),
  ADD KEY `discussions_course_id_foreign` (`course_id`),
  ADD KEY `discussions_lecture_id_foreign` (`lecture_id`);

--
-- Indexes for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `downloads_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `download_files`
--
ALTER TABLE `download_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `download_files_download_id_foreign` (`download_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exams_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `exam_grades`
--
ALTER TABLE `exam_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_options`
--
ALTER TABLE `exam_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_options_exam_question_id_foreign` (`exam_question_id`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_questions_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_menus`
--
ALTER TABLE `footer_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_participants`
--
ALTER TABLE `forum_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_participants_forum_topic_id_foreign` (`forum_topic_id`),
  ADD KEY `forum_participants_user_id_foreign` (`user_id`);

--
-- Indexes for table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_posts_forum_topic_id_foreign` (`forum_topic_id`),
  ADD KEY `forum_posts_user_id_foreign` (`user_id`),
  ADD KEY `forum_posts_post_reply_id_foreign` (`post_reply_id`);

--
-- Indexes for table `forum_topics`
--
ALTER TABLE `forum_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_topics_user_id_foreign` (`user_id`),
  ADD KEY `forum_topics_course_id_foreign` (`course_id`),
  ADD KEY `forum_topics_lecture_id_foreign` (`lecture_id`);

--
-- Indexes for table `header_menus`
--
ALTER TABLE `header_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `invoices_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`);

--
-- Indexes for table `invoice_transactions`
--
ALTER TABLE `invoice_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_transactions_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `ips`
--
ALTER TABLE `ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ips_ip_unique` (`ip`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lectures_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `lecture_files`
--
ALTER TABLE `lecture_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_files_lecture_id_foreign` (`lecture_id`);

--
-- Indexes for table `lecture_notes`
--
ALTER TABLE `lecture_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_notes_student_id_foreign` (`student_id`),
  ADD KEY `lecture_notes_lecture_id_foreign` (`lecture_id`);

--
-- Indexes for table `lecture_pages`
--
ALTER TABLE `lecture_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_pages_lecture_id_foreign` (`lecture_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_admin_id_foreign` (`admin_id`),
  ADD KEY `lessons_test_id_foreign` (`test_id`);
ALTER TABLE `lessons` ADD FULLTEXT KEY `full` (`name`,`description`,`introduction`);

--
-- Indexes for table `lesson_files`
--
ALTER TABLE `lesson_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_files_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `lesson_groups`
--
ALTER TABLE `lesson_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson_lesson_group`
--
ALTER TABLE `lesson_lesson_group`
  ADD KEY `lesson_lesson_group_lesson_group_id_foreign` (`lesson_group_id`),
  ADD KEY `lesson_lesson_group_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_foreign_key` (`user_id`),
  ADD KEY `payment_histories_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pending_students`
--
ALTER TABLE `pending_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pending_student_files`
--
ALTER TABLE `pending_student_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pending_student_files_pending_student_id_foreign` (`pending_student_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD KEY `permissions_permission_group_id_foreign` (`permission_group_id`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `related_courses`
--
ALTER TABLE `related_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_courses_course_id_foreign` (`course_id`),
  ADD KEY `related_courses_related_course_id_foreign` (`related_course_id`);

--
-- Indexes for table `revision_notes`
--
ALTER TABLE `revision_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revision_notes_course_id_foreign` (`course_id`),
  ADD KEY `revision_notes_lesson_id_foreign` (`lesson_id`),
  ADD KEY `revision_notes_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_user_id_foreign` (`user_id`);

--
-- Indexes for table `student_certificates`
--
ALTER TABLE `student_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_certificates_tracking_number_unique` (`tracking_number`),
  ADD KEY `student_certificates_student_id_foreign` (`student_id`),
  ADD KEY `student_certificates_certificate_id_foreign` (`certificate_id`);

--
-- Indexes for table `student_certificate_downloads`
--
ALTER TABLE `student_certificate_downloads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_certificate_downloads_student_id_foreign` (`student_id`),
  ADD KEY `student_certificate_downloads_certificate_id_foreign` (`certificate_id`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_courses_student_id_foreign` (`student_id`),
  ADD KEY `student_courses_course_id_foreign` (`course_id`);

--
-- Indexes for table `student_course_logs`
--
ALTER TABLE `student_course_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_course_logs_student_id_foreign` (`student_id`),
  ADD KEY `student_course_logs_course_id_foreign` (`course_id`),
  ADD KEY `student_course_logs_lecture_id_foreign` (`lecture_id`);

--
-- Indexes for table `student_exams`
--
ALTER TABLE `student_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_exams_student_id_foreign` (`student_id`),
  ADD KEY `student_exams_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `student_exam_exam_option`
--
ALTER TABLE `student_exam_exam_option`
  ADD KEY `student_exam_exam_option_student_exam_id_foreign` (`student_exam_id`),
  ADD KEY `student_exam_exam_option_exam_option_id_foreign` (`exam_option_id`);

--
-- Indexes for table `student_fields`
--
ALTER TABLE `student_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_lectures`
--
ALTER TABLE `student_lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_lectures_student_id_foreign` (`student_id`),
  ADD KEY `student_lectures_course_id_foreign` (`course_id`),
  ADD KEY `student_lectures_lecture_id_foreign` (`lecture_id`);

--
-- Indexes for table `student_student_field`
--
ALTER TABLE `student_student_field`
  ADD KEY `student_student_field_student_id_foreign` (`student_id`),
  ADD KEY `student_student_field_student_field_id_foreign` (`student_field_id`);

--
-- Indexes for table `student_tests`
--
ALTER TABLE `student_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_tests_student_id_foreign` (`student_id`),
  ADD KEY `student_tests_test_id_foreign` (`test_id`);

--
-- Indexes for table `student_test_test_option`
--
ALTER TABLE `student_test_test_option`
  ADD KEY `student_test_test_option_student_test_id_foreign` (`student_test_id`),
  ADD KEY `student_test_test_option_test_option_id_foreign` (`test_option_id`);

--
-- Indexes for table `student_video`
--
ALTER TABLE `student_video`
  ADD KEY `student_video_student_id_foreign` (`student_id`),
  ADD KEY `student_video_video_id_foreign` (`video_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_foreign_key` (`user_id`),
  ADD KEY `subscriptions_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surveys_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `survey_options`
--
ALTER TABLE `survey_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_options_survey_question_id_foreign` (`survey_question_id`);

--
-- Indexes for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_questions_survey_id_foreign` (`survey_id`);

--
-- Indexes for table `survey_responses`
--
ALTER TABLE `survey_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_responses_survey_id_foreign` (`survey_id`),
  ADD KEY `survey_responses_student_id_foreign` (`student_id`);

--
-- Indexes for table `survey_response_survey_option`
--
ALTER TABLE `survey_response_survey_option`
  ADD KEY `survey_response_survey_option_survey_response_id_foreign` (`survey_response_id`),
  ADD KEY `survey_response_survey_option_survey_option_id_foreign` (`survey_option_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `templates_directory_unique` (`directory`);

--
-- Indexes for table `template_colors`
--
ALTER TABLE `template_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_colors_template_id_foreign` (`template_id`);

--
-- Indexes for table `template_options`
--
ALTER TABLE `template_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_options_template_id_foreign` (`template_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tests_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `test_grades`
--
ALTER TABLE `test_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_options`
--
ALTER TABLE `test_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_options_test_question_id_foreign` (`test_question_id`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_questions_test_id_foreign` (`test_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_student_id_foreign` (`student_id`),
  ADD KEY `transactions_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);
ALTER TABLE `users` ADD FULLTEXT KEY `full` (`name`,`email`,`last_name`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_admin_id_foreign` (`admin_id`);
ALTER TABLE `videos` ADD FULLTEXT KEY `full` (`name`,`description`);

--
-- Indexes for table `virtual_class`
--
ALTER TABLE `virtual_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widget_values`
--
ALTER TABLE `widget_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widget_values_widget_id_foreign` (`widget_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_sessions`
--
ALTER TABLE `academic_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_download`
--
ALTER TABLE `course_download`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_exam`
--
ALTER TABLE `course_exam`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_lesson`
--
ALTER TABLE `course_lesson`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_lesson_admins`
--
ALTER TABLE `course_lesson_admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_survey`
--
ALTER TABLE `course_survey`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_test`
--
ALTER TABLE `course_test`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `download_files`
--
ALTER TABLE `download_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_grades`
--
ALTER TABLE `exam_grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_options`
--
ALTER TABLE `exam_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `footer_menus`
--
ALTER TABLE `footer_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `forum_participants`
--
ALTER TABLE `forum_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `forum_topics`
--
ALTER TABLE `forum_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `header_menus`
--
ALTER TABLE `header_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `invoice_transactions`
--
ALTER TABLE `invoice_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- AUTO_INCREMENT for table `ips`
--
ALTER TABLE `ips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lecture_files`
--
ALTER TABLE `lecture_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lecture_notes`
--
ALTER TABLE `lecture_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lecture_pages`
--
ALTER TABLE `lecture_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lesson_files`
--
ALTER TABLE `lesson_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_groups`
--
ALTER TABLE `lesson_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pending_students`
--
ALTER TABLE `pending_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pending_student_files`
--
ALTER TABLE `pending_student_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `related_courses`
--
ALTER TABLE `related_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revision_notes`
--
ALTER TABLE `revision_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `student_certificates`
--
ALTER TABLE `student_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_certificate_downloads`
--
ALTER TABLE `student_certificate_downloads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `student_course_logs`
--
ALTER TABLE `student_course_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_exams`
--
ALTER TABLE `student_exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student_fields`
--
ALTER TABLE `student_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_lectures`
--
ALTER TABLE `student_lectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_tests`
--
ALTER TABLE `student_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey_options`
--
ALTER TABLE `survey_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey_questions`
--
ALTER TABLE `survey_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey_responses`
--
ALTER TABLE `survey_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `template_colors`
--
ALTER TABLE `template_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `template_options`
--
ALTER TABLE `template_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_grades`
--
ALTER TABLE `test_grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test_options`
--
ALTER TABLE `test_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `virtual_class`
--
ALTER TABLE `virtual_class`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `widget_values`
--
ALTER TABLE `widget_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_admin_role_id_foreign` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_admin_role`
--
ALTER TABLE `admin_admin_role`
  ADD CONSTRAINT `admin_admin_role_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_admin_role_admin_role_id_foreign` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_course`
--
ALTER TABLE `admin_course`
  ADD CONSTRAINT `admin_course_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_discussion`
--
ALTER TABLE `admin_discussion`
  ADD CONSTRAINT `admin_discussion_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_discussion_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_role_permission`
--
ALTER TABLE `admin_role_permission`
  ADD CONSTRAINT `admin_role_permission_admin_role_id_foreign` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `assignments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Constraints for table `assignment_certificate`
--
ALTER TABLE `assignment_certificate`
  ADD CONSTRAINT `assignment_certificate_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_certificate_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD CONSTRAINT `assignment_submissions_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submissions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_category_blog_post`
--
ALTER TABLE `blog_category_blog_post`
  ADD CONSTRAINT `blog_category_blog_post_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_category_blog_post_blog_post_id_foreign` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_lecture_page_id_foreign` FOREIGN KEY (`lecture_page_id`) REFERENCES `lecture_pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificate_exam`
--
ALTER TABLE `certificate_exam`
  ADD CONSTRAINT `certificate_exam_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificate_exam_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificate_lesson`
--
ALTER TABLE `certificate_lesson`
  ADD CONSTRAINT `certificate_lesson_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificate_lesson_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificate_test`
--
ALTER TABLE `certificate_test`
  ADD CONSTRAINT `certificate_test_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificate_test_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_course`
--
ALTER TABLE `coupon_course`
  ADD CONSTRAINT `coupon_course_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_course_category`
--
ALTER TABLE `coupon_course_category`
  ADD CONSTRAINT `coupon_course_category_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_course_category_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_invoice`
--
ALTER TABLE `coupon_invoice`
  ADD CONSTRAINT `coupon_invoice_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_invoice_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD CONSTRAINT `course_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `course_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `course_course_category`
--
ALTER TABLE `course_course_category`
  ADD CONSTRAINT `course_course_category_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_course_category_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_download`
--
ALTER TABLE `course_download`
  ADD CONSTRAINT `course_download_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_download_download_id_foreign` FOREIGN KEY (`download_id`) REFERENCES `downloads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_exam`
--
ALTER TABLE `course_exam`
  ADD CONSTRAINT `course_exams_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_exams_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_lesson`
--
ALTER TABLE `course_lesson`
  ADD CONSTRAINT `course_lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_lessons_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_lesson_admins`
--
ALTER TABLE `course_lesson_admins`
  ADD CONSTRAINT `course_lesson_admins_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_lesson_admins_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_lesson_admins_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_survey`
--
ALTER TABLE `course_survey`
  ADD CONSTRAINT `course_survey_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_survey_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_test`
--
ALTER TABLE `course_test`
  ADD CONSTRAINT `course_tests_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_tests_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currencies`
--
ALTER TABLE `currencies`
  ADD CONSTRAINT `currencies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currency_payment_method`
--
ALTER TABLE `currency_payment_method`
  ADD CONSTRAINT `currency_payment_method_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `currency_payment_method_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discussions_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`),
  ADD CONSTRAINT `discussions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  ADD CONSTRAINT `discussion_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `downloads`
--
ALTER TABLE `downloads`
  ADD CONSTRAINT `downloads_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `download_files`
--
ALTER TABLE `download_files`
  ADD CONSTRAINT `download_files_download_id_foreign` FOREIGN KEY (`download_id`) REFERENCES `downloads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_options`
--
ALTER TABLE `exam_options`
  ADD CONSTRAINT `exam_options_exam_question_id_foreign` FOREIGN KEY (`exam_question_id`) REFERENCES `exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `exam_questions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forum_participants`
--
ALTER TABLE `forum_participants`
  ADD CONSTRAINT `forum_participants_forum_topic_id_foreign` FOREIGN KEY (`forum_topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD CONSTRAINT `forum_posts_forum_topic_id_foreign` FOREIGN KEY (`forum_topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `forum_topics`
--
ALTER TABLE `forum_topics`
  ADD CONSTRAINT `forum_topics_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_topics_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_topics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoice_transactions`
--
ALTER TABLE `invoice_transactions`
  ADD CONSTRAINT `invoice_transactions_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lectures`
--
ALTER TABLE `lectures`
  ADD CONSTRAINT `lectures_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lecture_files`
--
ALTER TABLE `lecture_files`
  ADD CONSTRAINT `lecture_files_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lecture_notes`
--
ALTER TABLE `lecture_notes`
  ADD CONSTRAINT `lecture_notes_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lecture_notes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lecture_pages`
--
ALTER TABLE `lecture_pages`
  ADD CONSTRAINT `lecture_pages_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `lessons_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`);

--
-- Constraints for table `lesson_files`
--
ALTER TABLE `lesson_files`
  ADD CONSTRAINT `lesson_files_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_lesson_group`
--
ALTER TABLE `lesson_lesson_group`
  ADD CONSTRAINT `lesson_lesson_group_lesson_group_id_foreign` FOREIGN KEY (`lesson_group_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_lesson_group_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD CONSTRAINT `payment_histories_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pending_student_files`
--
ALTER TABLE `pending_student_files`
  ADD CONSTRAINT `pending_student_files_pending_student_id_foreign` FOREIGN KEY (`pending_student_id`) REFERENCES `pending_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_permission_group_id_foreign` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `related_courses`
--
ALTER TABLE `related_courses`
  ADD CONSTRAINT `related_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `related_courses_related_course_id_foreign` FOREIGN KEY (`related_course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revision_notes`
--
ALTER TABLE `revision_notes`
  ADD CONSTRAINT `revision_notes_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `revision_notes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `revision_notes_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_certificates`
--
ALTER TABLE `student_certificates`
  ADD CONSTRAINT `student_certificates_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_certificates_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_certificate_downloads`
--
ALTER TABLE `student_certificate_downloads`
  ADD CONSTRAINT `student_certificate_downloads_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_certificate_downloads_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `student_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_courses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_course_logs`
--
ALTER TABLE `student_course_logs`
  ADD CONSTRAINT `student_course_logs_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_course_logs_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_course_logs_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_exams`
--
ALTER TABLE `student_exams`
  ADD CONSTRAINT `student_exams_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_exams_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_exam_exam_option`
--
ALTER TABLE `student_exam_exam_option`
  ADD CONSTRAINT `student_exam_exam_option_exam_option_id_foreign` FOREIGN KEY (`exam_option_id`) REFERENCES `exam_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_exam_exam_option_student_exam_id_foreign` FOREIGN KEY (`student_exam_id`) REFERENCES `student_exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_lectures`
--
ALTER TABLE `student_lectures`
  ADD CONSTRAINT `student_lectures_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_lectures_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_lectures_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_student_field`
--
ALTER TABLE `student_student_field`
  ADD CONSTRAINT `student_student_field_student_field_id_foreign` FOREIGN KEY (`student_field_id`) REFERENCES `student_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_student_field_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_tests`
--
ALTER TABLE `student_tests`
  ADD CONSTRAINT `student_tests_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_tests_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_test_test_option`
--
ALTER TABLE `student_test_test_option`
  ADD CONSTRAINT `student_test_test_option_student_test_id_foreign` FOREIGN KEY (`student_test_id`) REFERENCES `student_tests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_test_test_option_test_option_id_foreign` FOREIGN KEY (`test_option_id`) REFERENCES `test_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_video`
--
ALTER TABLE `student_video`
  ADD CONSTRAINT `student_video_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_video_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `surveys`
--
ALTER TABLE `surveys`
  ADD CONSTRAINT `surveys_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `survey_options`
--
ALTER TABLE `survey_options`
  ADD CONSTRAINT `survey_options_survey_question_id_foreign` FOREIGN KEY (`survey_question_id`) REFERENCES `survey_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD CONSTRAINT `survey_questions_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `survey_responses`
--
ALTER TABLE `survey_responses`
  ADD CONSTRAINT `survey_responses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `survey_responses_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `survey_response_survey_option`
--
ALTER TABLE `survey_response_survey_option`
  ADD CONSTRAINT `survey_response_survey_option_survey_option_id_foreign` FOREIGN KEY (`survey_option_id`) REFERENCES `survey_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `survey_response_survey_option_survey_response_id_foreign` FOREIGN KEY (`survey_response_id`) REFERENCES `survey_responses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `template_colors`
--
ALTER TABLE `template_colors`
  ADD CONSTRAINT `template_colors_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `template_options`
--
ALTER TABLE `template_options`
  ADD CONSTRAINT `template_options_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `template_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_options`
--
ALTER TABLE `test_options`
  ADD CONSTRAINT `test_options_test_question_id_foreign` FOREIGN KEY (`test_question_id`) REFERENCES `test_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD CONSTRAINT `test_questions_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `widget_values`
--
ALTER TABLE `widget_values`
  ADD CONSTRAINT `widget_values_widget_id_foreign` FOREIGN KEY (`widget_id`) REFERENCES `widgets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
