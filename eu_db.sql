-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 12, 2026 at 07:14 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eu_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_requests`
--

CREATE TABLE `access_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `target_file_name` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','denied') DEFAULT 'pending',
  `request_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `access_requests`
--

INSERT INTO `access_requests` (`id`, `user_id`, `dept_id`, `file_id`, `target_file_name`, `reason`, `status`, `request_date`) VALUES
(9, 26, 2, NULL, '65-ONLINE-EVENTS-MANAGEMENT-SYSTEM-WITH-PRICE-QUOTATION-FOR-ARIELS-CATERING-SERVICES.docx', 'sada', 'denied', '2026-04-09 17:27:30'),
(10, 37, 2, NULL, 'Invoice_INV-2026-001.pdf', 'adsad', 'approved', '2026-04-09 19:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `item_name`, `item_type`, `timestamp`) VALUES
(1, NULL, 'Registration', 'janrelzac0130@gmail.com', 'User', '2026-03-02 09:20:54'),
(2, NULL, 'Login', 'janrelzac0130@gmail.com', 'Session', '2026-03-02 09:20:56'),
(3, NULL, 'Registration', 'vsatisfying30@gmail.com', 'User', '2026-03-02 09:24:14'),
(4, NULL, 'Login', 'vsatisfying30@gmail.com', 'Session', '2026-03-02 09:24:21'),
(5, NULL, 'Login', 'janrelzac0130@gmail.com', 'Session', '2026-03-02 13:56:58'),
(6, NULL, 'Login', 'janrelzac0130@gmail.com', 'Session', '2026-03-04 14:22:15'),
(10, NULL, 'Login', 'vsatisfying30@gmail.com', 'Session', '2026-03-04 16:25:28'),
(11, NULL, 'Login', 'janrelzac0130@gmail.com', 'Session', '2026-03-05 05:37:19'),
(12, NULL, 'Update Staff Profile', 'Zac Janrel', 'User Management', '2026-03-05 16:04:10'),
(13, NULL, 'Update Staff Profile', 'Zac Janrel', 'User Management', '2026-03-05 16:05:25'),
(14, NULL, 'Update Staff Profile', ' ', 'User Management', '2026-03-05 16:24:55'),
(15, NULL, 'Update Staff Profile', 'Zac Janrel', 'User Management', '2026-03-05 16:36:49'),
(16, NULL, 'Update Staff Profile', 'Zac Janrel', 'User Management', '2026-03-05 16:38:06'),
(17, NULL, 'Login', 'philippAnne@GMAIL.COM', 'Session', '2026-03-05 16:41:40'),
(24, NULL, 'Login', 'janrelzac0130@gmail.com', 'Session', '2026-03-06 16:26:44'),
(78, NULL, 'Registration', 'vsatisfying30@gmail.com', 'User', '2026-03-08 15:25:35'),
(79, NULL, 'Login', 'vsatisfying30@gmail.com', 'Session', '2026-03-08 15:25:37'),
(80, NULL, 'Update Staff Profile', 'Zac Chavez (ID: 13)', 'User Management', '2026-03-08 15:27:09'),
(81, NULL, 'Login', 'vsatisfying30@gmail.com', 'Session', '2026-03-08 15:33:52'),
(82, NULL, 'Login', 'JAdada@mGmail.com', 'Session', '2026-03-08 15:40:18'),
(83, NULL, 'Login', 'JAdada@mGmail.com', 'Session', '2026-03-08 15:40:49'),
(84, NULL, 'Update Staff Profile', 'ZAC Zac (ID: 15)', 'User Management', '2026-03-08 15:44:01'),
(85, NULL, 'Login', 'vsatisfying30@gmail.com', 'Session', '2026-03-09 06:05:18'),
(86, NULL, 'Login', 'vsatisfying30@gmail.com', 'Session', '2026-03-10 11:19:32'),
(87, NULL, 'Login', 'vsatisfying30@gmail.com', 'Session', '2026-03-10 16:20:33'),
(88, NULL, 'Delete Personnel', 'User ID: 12', 'User Management', '2026-03-11 02:04:10'),
(89, NULL, 'Login', 'nituragian2@gmail.com', 'Session', '2026-03-11 02:40:55'),
(90, NULL, 'Login', 'vsatisfying30@gmail.com', 'Session', '2026-03-28 17:40:48'),
(91, NULL, 'Login', 'vsatisfying30@gmail.com', 'Session', '2026-03-28 17:43:39'),
(92, NULL, 'Update Staff Profile', 'Satis Vit (ID: 14)', 'User Management', '2026-03-28 18:04:49'),
(93, NULL, 'Update Staff Profile', 'Satis Viy (ID: 14)', 'User Management', '2026-03-28 18:05:17'),
(94, NULL, 'Delete Personnel', 'User ID: 15', 'User Management', '2026-03-28 18:11:49'),
(95, NULL, 'Delete Personnel', 'User ID: 19', 'User Management', '2026-03-28 18:16:59'),
(96, NULL, 'Delete Personnel', 'User ID: 18', 'User Management', '2026-03-28 18:17:04'),
(97, NULL, 'Delete Personnel', 'User ID: 16', 'User Management', '2026-03-29 08:21:05'),
(98, NULL, 'Update Staff Profile', 'Zac Chavez (ID: 13)', 'User Management', '2026-04-03 08:01:08'),
(99, NULL, 'Update Staff Profile', 'Zac Chavez (ID: 13)', 'User Management', '2026-04-03 08:01:15'),
(100, NULL, 'Update Staff Profile', 'aZAC CHAVEZ (ID: 13)', 'User Management', '2026-04-03 08:33:44'),
(101, NULL, 'Update Staff Profile', 'ZAc CHAVEZ (ID: 13)', 'User Management', '2026-04-03 08:33:59'),
(102, NULL, 'Update Staff Profile', 'Zac Chavez (ID: 13)', 'User Management', '2026-04-03 08:38:04'),
(103, NULL, 'Update Staff Profile', 'Zac Chavez (ID: 13)', 'User Management', '2026-04-03 08:43:27'),
(104, NULL, 'Logout', '', 'Session', '2026-04-09 08:13:38'),
(105, 26, 'Login', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 08:14:44'),
(106, 26, 'Request DENIED', 'vsatisfying30@gmail.com', 'Access Request', '2026-04-09 08:17:08'),
(107, 26, 'Update Staff Profile', 'Aira Domingo (ID: 22)', 'User Management', '2026-04-09 08:17:33'),
(108, 26, 'Update Staff Profile', 'Aira Domingo (ID: 22)', 'User Management', '2026-04-09 08:17:38'),
(109, 26, 'Logout', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 08:18:27'),
(110, 20, 'Login', 'hr.user@cfm.local', 'Session', '2026-04-09 08:19:37'),
(111, 20, 'Logout', 'hr.user@cfm.local', 'Session', '2026-04-09 08:20:28'),
(112, 24, 'Login', 'docs.user@cfm.local', 'Session', '2026-04-09 08:20:44'),
(113, 24, 'Logout', 'docs.user@cfm.local', 'Session', '2026-04-09 08:20:50'),
(114, NULL, 'Registration', 'HelenVa@gmail.com', 'User', '2026-04-09 08:21:22'),
(115, 26, 'Login', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 08:22:22'),
(116, 26, 'Update Staff Profile', 'Loraine Caca (ID: 28)', 'User Management', '2026-04-09 08:28:46'),
(117, 26, 'Update Staff Profile', 'Liza Santos (ID: 24)', 'User Management', '2026-04-09 08:31:22'),
(118, 26, 'Configure MFA', 'User #28 mfa=on method=esp32', 'Settings', '2026-04-09 08:31:59'),
(119, 26, 'Configure MFA', 'User #28 mfa=off method=none', 'Settings', '2026-04-09 08:32:05'),
(120, 26, 'Logout', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 18:28:19'),
(121, 25, 'Login', 'filing.user@cfm.local', 'Session', '2026-04-09 18:31:10'),
(122, 25, 'Logout', 'filing.user@cfm.local', 'Session', '2026-04-09 18:33:43'),
(123, 20, 'Login', 'hr.user@cfm.local', 'Session', '2026-04-09 18:33:54'),
(124, 20, 'Logout', 'hr.user@cfm.local', 'Session', '2026-04-09 18:48:55'),
(125, 26, 'Login', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 18:49:55'),
(126, 26, 'Logout', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 18:50:40'),
(127, 26, 'Login', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 18:50:57'),
(128, 20, 'Login', 'hr.user@cfm.local', 'Session', '2026-04-09 18:51:57'),
(129, 20, 'Login', 'hr.user@cfm.local', 'Session', '2026-04-09 18:56:24'),
(130, 20, 'Logout', 'hr.user@cfm.local', 'Session', '2026-04-09 18:56:43'),
(131, 20, 'Login', 'hr.user@cfm.local', 'Session', '2026-04-09 18:57:00'),
(132, 20, 'Logout', 'hr.user@cfm.local', 'Session', '2026-04-09 18:59:34'),
(133, 26, 'Login', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 18:59:40'),
(134, 26, 'Logout', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 19:00:16'),
(135, 26, 'Login', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 19:00:45'),
(136, 26, 'Logout', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 19:04:57'),
(137, 26, 'Logout', '', 'Session', '2026-04-09 19:10:42'),
(138, 26, 'Login', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 19:13:00'),
(139, 26, 'Logout', 'vsatisfying30@cfm.local', 'Session', '2026-04-09 19:14:01'),
(140, 37, 'Registration', 'vsatisfying30@gmail.com', 'User', '2026-04-09 19:16:19'),
(141, 37, 'Logout', '', 'Session', '2026-04-09 19:27:39'),
(142, 38, 'Registration', 'janrelzac0130@gmail.com', 'User', '2026-04-09 19:27:53'),
(143, 38, 'Logout', '', 'Session', '2026-04-09 19:28:31'),
(144, 38, 'Logout', '', 'Session', '2026-04-09 19:29:36'),
(145, 37, 'Logout', '', 'Session', '2026-04-09 19:31:30'),
(146, 38, 'Request DENIED', 'vsatisfying30@cfm.local', 'Access Request', '2026-04-09 19:32:29'),
(147, 38, 'Request APPROVED', 'vsatisfying30@gmail.com', 'Access Request', '2026-04-09 19:33:29'),
(148, 37, 'Logout', '', 'Session', '2026-04-09 19:39:07'),
(149, 20, 'Logout', '', 'Session', '2026-04-09 19:39:27'),
(150, 37, 'Logout', '', 'Session', '2026-04-09 19:42:35'),
(151, 26, 'Logout', '', 'Session', '2026-04-09 19:42:53'),
(152, 20, 'Logout', '', 'Session', '2026-04-09 19:46:31'),
(153, 38, 'Delete Personnel', 'User ID: 17', 'User Management', '2026-04-09 19:56:57'),
(154, 38, 'Delete Personnel', 'User ID: 39', 'User Management', '2026-04-09 19:57:29'),
(155, 38, 'Delete Personnel', 'User ID: 27', 'User Management', '2026-04-09 19:57:32'),
(156, 38, 'Configure MFA', 'User #28 mfa=on method=esp32', 'Settings', '2026-04-09 20:14:06'),
(157, 38, 'Update RBAC', 'User #28 -> Admin', 'Settings', '2026-04-09 20:14:09'),
(158, 38, 'Configure MFA', 'User #28 mfa=off method=none', 'Settings', '2026-04-09 20:14:11'),
(159, 38, 'Update RBAC', 'User #28 -> Staff', 'Settings', '2026-04-09 20:14:37'),
(160, 38, 'Logout', '', 'Session', '2026-04-09 20:27:56'),
(161, 38, 'Delete Personnel', 'User ID: 22', 'User Management', '2026-04-09 20:35:14'),
(162, 38, 'Logout', '', 'Session', '2026-04-09 20:35:25'),
(163, 38, 'Logout', '', 'Session', '2026-04-11 16:36:42'),
(164, 38, 'Update Staff Profile', 'Zac Chavez (ID: 40)', 'User Management', '2026-04-11 16:37:36'),
(165, 38, 'Update Staff Profile', 'Zac ZAC (ID: 40)', 'User Management', '2026-04-11 16:37:45'),
(166, 38, 'Logout', '', 'Session', '2026-04-14 11:11:05'),
(167, 38, 'Delete Personnel', 'User ID: 40', 'User Management', '2026-04-22 06:25:31'),
(168, 41, 'Registration', 'aprilcastillo@gmail.com', 'User', '2026-04-22 06:35:09'),
(169, 41, 'Logout', '', 'Session', '2026-04-22 06:36:41'),
(170, 37, 'Logout', '', 'Session', '2026-04-22 06:38:51'),
(171, 38, 'Logout', '', 'Session', '2026-04-22 06:40:01'),
(172, 37, 'Logout', '', 'Session', '2026-04-22 06:42:06'),
(173, 38, 'Logout', '', 'Session', '2026-04-22 06:47:42'),
(174, 37, 'Logout', '', 'Session', '2026-04-22 06:48:58'),
(175, 38, 'Logout', '', 'Session', '2026-04-22 06:49:04'),
(176, 37, 'Logout', '', 'Session', '2026-04-23 04:10:02'),
(177, 38, 'Update Staff Profile', 'Eu Graces (ID: 42)', 'User Management', '2026-04-23 04:13:47'),
(178, 38, 'Delete Personnel', 'User ID: 42', 'User Management', '2026-04-23 04:13:54');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`) VALUES
(1, 'Human Resources Dept.', '2026-03-02 09:12:17'),
(2, 'Collection/Finance Dept.', '2026-03-02 09:12:17'),
(3, 'Accounting Dept.', '2026-03-02 09:12:17'),
(4, 'Marketing Dept.', '2026-03-02 09:12:17'),
(5, 'Documentation Dept', '2026-03-02 09:12:17'),
(6, 'Filing Dept.', '2026-03-02 09:12:17');

-- --------------------------------------------------------

--
-- Table structure for table `enroll_requests`
--

CREATE TABLE `enroll_requests` (
  `user_id` int(11) NOT NULL,
  `step` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `uploader_id` int(11) DEFAULT NULL,
  `display_name` varchar(255) NOT NULL,
  `storage_name` varchar(255) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_trash` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT 0,
  `archived_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `dept_id`, `user_id`, `folder_id`, `uploader_id`, `display_name`, `storage_name`, `file_type`, `file_size`, `uploaded_at`, `is_trash`, `deleted_at`, `is_archived`, `archived_at`) VALUES
(64, NULL, 999, 60, NULL, 'Trash.html', 'priv_69ae7c143d828_1773042708.html', NULL, 35165, '2026-03-09 07:51:48', 0, NULL, 0, NULL),
(68, 1, NULL, 62, NULL, 'Employee_Handbook_2026.pdf', '1775721529_60691723df1c.pdf', 'pdf', 593291, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(69, 1, NULL, 62, NULL, 'Code_of_Conduct.docx', '1775721529_c6d48c580396.docx', 'docx', 782789, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(70, 1, NULL, 63, NULL, 'Payroll_March_2026.xlsx', '1775721529_64ecc3315f49.xlsx', 'xlsx', 879742, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(71, 1, NULL, 63, NULL, 'Tax_Withholding_Summary.pdf', '1775721529_cb2d27b9666c.pdf', 'pdf', 851017, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(72, 1, NULL, 64, NULL, 'New_Hire_Checklist.docx', '1775721529_d5774de78be0.docx', 'docx', 391529, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(73, 1, NULL, NULL, NULL, 'HR_Policy_Memo.pdf', '1775721529_1a5576eab9d4.pdf', 'pdf', 865464, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(74, 2, NULL, 65, NULL, 'Invoice_INV-2026-001.pdf', '1775721529_f578d2a30bcb.pdf', 'pdf', 631890, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(75, 2, NULL, 65, NULL, 'Invoice_INV-2026-002.pdf', '1775721529_0c46e4100a66.pdf', 'pdf', 630276, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(76, 2, NULL, 66, NULL, 'Receipt_OR-1023.pdf', '1775721529_ba195739fa10.pdf', 'pdf', 217192, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(77, 2, NULL, 67, NULL, 'BPI_March_Statement.pdf', '1775721529_083b0c2fcdd2.pdf', 'pdf', 490811, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(78, 2, NULL, NULL, NULL, 'AR_Aging_Report.xlsx', '1775721529_f21c6c2f65d3.xlsx', 'xlsx', 635093, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(79, 3, NULL, 68, NULL, 'General_Ledger_Q1.xlsx', '1775721529_a0316719d910.xlsx', 'xlsx', 69834, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(80, 3, NULL, 68, NULL, 'Trial_Balance_March.xlsx', '1775721529_4c44d61d6b16.xlsx', 'xlsx', 323694, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(81, 3, NULL, 69, NULL, 'BIR_Form_1701_2025.pdf', '1775721529_00500190d0ee.pdf', 'pdf', 284355, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(82, 3, NULL, 69, NULL, 'BIR_Form_2550M_March.pdf', '1775721529_ae032a4144a7.pdf', 'pdf', 374545, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(83, 3, NULL, 70, NULL, 'External_Audit_2025.pdf', '1775721529_06b25387d829.pdf', 'pdf', 884073, '2026-04-09 07:58:49', 0, NULL, 1, '2026-04-10 03:57:48'),
(85, 4, NULL, 71, NULL, 'Q2_Campaign_Brief.docx', '1775721529_28ff7aec519c.docx', 'docx', 253969, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(86, 4, NULL, 71, NULL, 'Social_Media_Calendar.xlsx', '1775721529_000b3f85c26d.xlsx', 'xlsx', 772467, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(87, 4, NULL, 72, NULL, 'CFM_Logo_Primary.png', '1775721529_dd021fbd3cc7.png', 'png', 383796, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(88, 4, NULL, 72, NULL, 'Brand_Guidelines.pdf', '1775721529_7c5463a4738c.pdf', 'pdf', 681613, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(89, 4, NULL, 73, NULL, 'GA4_Report_March.pdf', '1775721529_33b76f75e5c0.pdf', 'pdf', 143211, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(90, 4, NULL, NULL, NULL, 'Press_Release_Draft.docx', '1775721529_cd9e942fb508.docx', 'docx', 20998, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(91, 5, NULL, 74, NULL, 'CFM_System_Manual_v3.pdf', '1775721529_5381b21abc9b.pdf', 'pdf', 919019, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(92, 5, NULL, 74, NULL, 'ESP32_Cabinet_Quickstart.pdf', '1775721529_c1d56856c86d.pdf', 'pdf', 188222, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(93, 5, NULL, 75, NULL, 'SOP_Document_Approval.docx', '1775721529_ddd34ed7e81d.docx', 'docx', 64084, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(94, 5, NULL, 75, NULL, 'SOP_Access_Request.docx', '1775721529_84df12433e89.docx', 'docx', 540190, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(95, 5, NULL, 76, NULL, 'Memo_Template.docx', '1775721529_69c2fbfdc499.docx', 'docx', 391900, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(96, 5, NULL, NULL, NULL, 'Glossary_of_Terms.pdf', '1775721529_fe0a2cfdf77e.pdf', 'pdf', 885546, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(97, 6, NULL, 77, NULL, 'Inbound_Log_March.xlsx', '1775721529_ed5d67f4de06.xlsx', 'xlsx', 256314, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(98, 6, NULL, 77, NULL, 'Courier_Receipts_Mar.pdf', '1775721529_0553d5501f5f.pdf', 'pdf', 112762, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(99, 6, NULL, 78, NULL, 'Outbound_Log_March.xlsx', '1775721529_e351fb666b14.xlsx', 'xlsx', 907643, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(100, 6, NULL, 79, NULL, 'Filing_Index_2025.pdf', '1775721529_2183b5f5dc80.pdf', 'pdf', 563153, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(101, 6, NULL, NULL, NULL, 'Records_Retention_Schedule.pdf', '1775721529_5383ffcadfeb.pdf', 'pdf', 124791, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(115, 3, NULL, NULL, NULL, 'Chart_of_Accounts.docx', '1775759584_525354fc54e2.docx', 'docx', 227593, '2026-04-09 18:33:04', 1, NULL, 0, NULL),
(116, NULL, 37, 84, NULL, 'Verify_MFA.html', 'priv_69d7fb4797905_1775762247.html', NULL, 8113, '2026-04-09 19:17:27', 0, NULL, 0, NULL),
(117, 3, NULL, NULL, 38, 'rename_item.php', '1776838822_69e868a68d418.php', 'php', 739, '2026-04-22 06:20:22', 1, NULL, 0, NULL),
(118, 3, NULL, NULL, 38, 'Updated Manuscript', '1776839015_69e869673cfd5.pdf', 'pdf', 370859, '2026-04-22 06:23:35', 1, NULL, 0, NULL),
(119, NULL, 37, NULL, NULL, 'Dashboard.js', 'file_69e86d527708e_1776840018.js', NULL, 32254, '2026-04-22 06:40:18', 1, NULL, 0, NULL),
(120, 3, NULL, NULL, 38, 'Dashboard.html', '1776840318_69e86e7e30032.html', 'html', 27451, '2026-04-22 06:45:18', 1, NULL, 0, NULL),
(121, 3, NULL, 85, 38, 'Dashboard.html', '1776840448_69e86f004f3b8.html', 'html', 27433, '2026-04-22 06:47:28', 0, NULL, 0, NULL),
(122, NULL, 37, NULL, NULL, 'Dashboard.js', 'file_69e86f1a7a0e3_1776840474.js', NULL, 32254, '2026-04-22 06:47:54', 1, NULL, 0, NULL),
(123, 3, NULL, NULL, 38, 'Chavez, Janrel Zac_Application Form.pdf', '1779537648_6a1196f00b146.pdf', 'pdf', 2251665, '2026-05-23 12:00:48', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_trash` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT 0,
  `archived_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `parent_id`, `dept_id`, `user_id`, `created_by`, `created_at`, `is_trash`, `deleted_at`, `is_archived`, `archived_at`) VALUES
(47, 'ASDASDA', NULL, 5, NULL, NULL, '2026-03-08 17:57:27', 0, NULL, 0, NULL),
(49, 'asdasdaasd', NULL, 3, NULL, NULL, '2026-03-08 17:57:46', 1, NULL, 0, NULL),
(53, 'sdfs', NULL, 3, NULL, NULL, '2026-03-08 18:18:48', 0, NULL, 1, NULL),
(60, 'MEME', NULL, NULL, 999, NULL, '2026-03-09 07:50:31', 0, NULL, 0, NULL),
(62, 'Employee Records', NULL, 1, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(63, 'Payroll', NULL, 1, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(64, 'Onboarding', NULL, 1, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(65, 'Invoices', NULL, 2, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(66, 'Receipts', NULL, 2, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(67, 'Bank Statements', NULL, 2, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(68, 'Ledgers', NULL, 3, NULL, NULL, '2026-04-09 07:58:49', 1, NULL, 0, NULL),
(69, 'Tax Filings', NULL, 3, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 1, NULL),
(70, 'Audit Reports', NULL, 3, NULL, NULL, '2026-04-09 07:58:49', 1, NULL, 0, NULL),
(71, 'Campaigns', NULL, 4, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(72, 'Brand Assets', NULL, 4, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(73, 'Analytics', NULL, 4, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(74, 'Manuals', NULL, 5, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(75, 'SOPs', NULL, 5, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(76, 'Templates', NULL, 5, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(77, 'Inbound', NULL, 6, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(78, 'Outbound', NULL, 6, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(79, 'Archived Logs', NULL, 6, NULL, NULL, '2026-04-09 07:58:49', 0, NULL, 0, NULL),
(83, 'ASDASDA', NULL, NULL, 26, NULL, '2026-04-09 17:20:25', 0, NULL, 0, NULL),
(84, 'asdsad', NULL, NULL, 37, NULL, '2026-04-09 19:17:22', 0, NULL, 0, NULL),
(85, 'PDFs', NULL, 3, NULL, NULL, '2026-04-22 05:37:28', 0, NULL, 0, NULL),
(86, 'ASDASDA - Copy', NULL, 3, NULL, NULL, '2026-04-22 05:39:00', 0, NULL, 1, NULL),
(87, 'ASDASDA - Copy', NULL, 3, NULL, NULL, '2026-04-22 05:39:17', 1, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hardware_auth_log`
--

CREATE TABLE `hardware_auth_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rfid_uid` varchar(100) DEFAULT NULL,
  `fingerprint_id` int(11) DEFAULT NULL,
  `passcode_ok` tinyint(1) NOT NULL DEFAULT 0,
  `rfid_ok` tinyint(1) NOT NULL DEFAULT 0,
  `fingerprint_ok` tinyint(1) NOT NULL DEFAULT 0,
  `result` enum('granted','denied') NOT NULL,
  `device_ip` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `locked_until` datetime DEFAULT NULL,
  `last_attempt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `email`, `ip`, `attempts`, `locked_until`, `last_attempt`) VALUES
(1, 'admin@eugrace.com', '::1', 1, NULL, '2026-04-09 18:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `register_state`
--

CREATE TABLE `register_state` (
  `id` int(11) NOT NULL,
  `step` int(11) DEFAULT 0,
  `active` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register_state`
--

INSERT INTO `register_state` (`id`, `step`, `active`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `relay`
--

CREATE TABLE `relay` (
  `id` int(11) NOT NULL,
  `relay_in` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 0,
  `fired_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relay`
--

INSERT INTO `relay` (`id`, `relay_in`, `active`, `fired_at`) VALUES
(1, 0, 1, '2026-04-10 04:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `approval_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `passcode` varchar(255) DEFAULT NULL,
  `has_passcode` tinyint(1) DEFAULT 0,
  `rfid_uid` varchar(100) DEFAULT NULL,
  `fingerprint_template` blob DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role` enum('Admin','Staff') DEFAULT 'Staff',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Active','Archived') DEFAULT 'Active',
  `has_rfid` tinyint(1) DEFAULT 0,
  `has_fingerprint` tinyint(1) DEFAULT 0,
  `mfa_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `mfa_method` enum('none','esp32','passcode') NOT NULL DEFAULT 'none',
  `fingerprint_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `dept_id`, `email`, `password`, `approval_status`, `passcode`, `has_passcode`, `rfid_uid`, `fingerprint_template`, `profile_picture`, `role`, `created_at`, `status`, `has_rfid`, `has_fingerprint`, `mfa_enabled`, `mfa_method`, `fingerprint_id`) VALUES
(20, 'Helen', 'Reyes', 1, 'hr.user@cfm.local', '$2y$10$33bltZiJtMhN2BDq.U2QQuW1yjkvw4a8gLtG0tAK.JCOeQLFXhFIq', 'approved', '$2y$10$2gIHf1zHWiolqHNv1ZtNbe9kzhyqSllzkiV5MDm/fdS5FOp6HDDJi', 1, NULL, NULL, NULL, 'Staff', '2026-04-09 07:58:49', 'Active', 0, 0, 0, 'none', NULL),
(21, 'Carlos', 'Mendoza', 2, 'finance.user@cfm.local', '$2y$10$33bltZiJtMhN2BDq.U2QQuW1yjkvw4a8gLtG0tAK.JCOeQLFXhFIq', 'approved', '$2y$10$2gIHf1zHWiolqHNv1ZtNbe9kzhyqSllzkiV5MDm/fdS5FOp6HDDJi', 1, NULL, NULL, NULL, 'Staff', '2026-04-09 07:58:49', 'Active', 0, 0, 0, 'none', NULL),
(23, 'Marco', 'Velasquez', 4, 'marketing.user@cfm.local', '$2y$10$33bltZiJtMhN2BDq.U2QQuW1yjkvw4a8gLtG0tAK.JCOeQLFXhFIq', 'approved', '$2y$10$2gIHf1zHWiolqHNv1ZtNbe9kzhyqSllzkiV5MDm/fdS5FOp6HDDJi', 1, NULL, NULL, NULL, 'Staff', '2026-04-09 07:58:49', 'Active', 0, 0, 0, 'none', NULL),
(24, 'Liza', 'Santos', 5, 'docs.user@cfm.local', '$2y$10$33bltZiJtMhN2BDq.U2QQuW1yjkvw4a8gLtG0tAK.JCOeQLFXhFIq', 'approved', '$2y$10$2gIHf1zHWiolqHNv1ZtNbe9kzhyqSllzkiV5MDm/fdS5FOp6HDDJi', 1, NULL, NULL, NULL, 'Staff', '2026-04-09 07:58:49', 'Active', 0, 0, 0, 'none', NULL),
(25, 'Patrick', 'Cruz', 6, 'filing.user@cfm.local', '$2y$10$33bltZiJtMhN2BDq.U2QQuW1yjkvw4a8gLtG0tAK.JCOeQLFXhFIq', 'approved', '$2y$10$2gIHf1zHWiolqHNv1ZtNbe9kzhyqSllzkiV5MDm/fdS5FOp6HDDJi', 1, NULL, NULL, NULL, 'Staff', '2026-04-09 07:58:49', 'Active', 0, 0, 0, 'none', NULL),
(26, 'CFM', 'Admin', 1, 'vsatisfying30@cfm.local', '$2y$10$33bltZiJtMhN2BDq.U2QQuW1yjkvw4a8gLtG0tAK.JCOeQLFXhFIq', 'approved', NULL, 0, NULL, NULL, NULL, 'Admin', '2026-04-09 07:58:49', 'Active', 0, 0, 0, 'none', NULL),
(28, 'Loraine', 'Caca', 6, 'LoraineCaca@gmail.com', '$2y$10$tHBIi0Ips8XutIkrS5/3meJOcwqOoKW5rBuFyNMi6muI4.dMYldNa', 'pending', NULL, 0, NULL, NULL, '../uploads/profiles/1775723326_b0deffd6-54af-4f2e-8ff4-c44fb2f64558.jpeg', 'Staff', '2026-04-09 08:23:43', 'Active', 0, 0, 0, 'none', NULL),
(37, 'Viy', 'Satis', 3, 'vsatisfying30@gmail.com', '$2y$10$c5Gs5tl/cvkuAzO2boXyC.CKwg8cp23HlD/SfxYxpw92NHRqpykUa', 'pending', NULL, 0, NULL, NULL, NULL, 'Staff', '2026-04-09 19:16:19', 'Active', 0, 0, 0, 'none', NULL),
(38, 'Janrel Zac', 'Chavez', 5, 'janrelzac0130@gmail.com', '$2y$10$AGWGVgbcW2LlBU5EnbhCOe2FKcWydRZyy3rLyiWxG3pQCavH45RL.', 'pending', NULL, 0, NULL, NULL, NULL, 'Admin', '2026-04-09 19:27:53', 'Active', 0, 0, 0, 'none', NULL),
(41, 'Aprul', 'Castillo', 6, 'aprilcastillo@gmail.com', '$2y$10$S5g4klf76LX1QbspEIHS..VRlI/tz./Lku2sipdPqlx8Qz.5.2IIK', 'pending', NULL, 0, NULL, NULL, NULL, 'Staff', '2026-04-22 06:35:09', 'Active', 0, 0, 0, 'none', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_requests`
--
ALTER TABLE `access_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `enroll_requests`
--
ALTER TABLE `enroll_requests`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folder_id` (`folder_id`),
  ADD KEY `uploader_id` (`uploader_id`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `folders_ibfk_1` (`parent_id`);

--
-- Indexes for table `hardware_auth_log`
--
ALTER TABLE `hardware_auth_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `register_state`
--
ALTER TABLE `register_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relay`
--
ALTER TABLE `relay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `dept_id` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_requests`
--
ALTER TABLE `access_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `hardware_auth_log`
--
ALTER TABLE `hardware_auth_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `relay`
--
ALTER TABLE `relay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_requests`
--
ALTER TABLE `access_requests`
  ADD CONSTRAINT `access_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `access_requests_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`uploader_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `folders`
--
ALTER TABLE `folders`
  ADD CONSTRAINT `folders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `folders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `folders_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `folders_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
