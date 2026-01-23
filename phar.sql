-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 23, 2026 at 08:10 PM
-- Server version: 8.0.44-0ubuntu0.24.04.2
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phar`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'انشاء فاتورة', 'App\\Models\\Invoice', NULL, 31, 'App\\Models\\User', 1, '[]', NULL, '2025-11-30 19:42:07', '2025-11-30 19:42:07'),
(2, 'user', 'User has been created', 'App\\Models\\User', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\": {\"id\": 3, \"name\": \"محمد\", \"email\": \"mohammed.salem701@gmail.com\", \"password\": \"$2y$12$RfUoTjyD10Ijy4V5TjnZKeAF2uiw85V69ZoS942Bqi7FvjH5vOIOC\", \"created_at\": \"2025-12-01T14:23:30.000000Z\", \"updated_at\": \"2025-12-01T14:23:30.000000Z\", \"remember_token\": null, \"email_verified_at\": null}}', NULL, '2025-12-01 11:23:30', '2025-12-01 11:23:30'),
(3, 'user', 'User has been updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"old\": {\"id\": 3, \"name\": \"محمد\", \"email\": \"mohammed.salem701@gmail.com\", \"password\": \"$2y$12$RfUoTjyD10Ijy4V5TjnZKeAF2uiw85V69ZoS942Bqi7FvjH5vOIOC\", \"created_at\": \"2025-12-01T14:23:30.000000Z\", \"updated_at\": \"2025-12-01T14:23:30.000000Z\", \"remember_token\": null, \"email_verified_at\": null}, \"attributes\": {\"id\": 3, \"name\": \"محمد سالم\", \"email\": \"mohammed.salem701@gmail.com\", \"password\": \"$2y$12$RfUoTjyD10Ijy4V5TjnZKeAF2uiw85V69ZoS942Bqi7FvjH5vOIOC\", \"created_at\": \"2025-12-01T14:23:30.000000Z\", \"updated_at\": \"2025-12-01T14:25:01.000000Z\", \"remember_token\": null, \"email_verified_at\": null}}', NULL, '2025-12-01 11:25:01', '2025-12-01 11:25:01'),
(4, 'user', 'User has been updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '[]', NULL, '2025-12-01 11:30:28', '2025-12-01 11:30:28'),
(5, 'user', 'User has been updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"محمد\"}, \"attributes\": {\"name\": \"محمد سالم\"}}', NULL, '2025-12-01 11:37:15', '2025-12-01 11:37:15'),
(6, 'user', 'User has been updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"محمد سالم\"}, \"attributes\": {\"name\": \"محمد\"}}', NULL, '2025-12-01 12:20:59', '2025-12-01 12:20:59'),
(7, 'user', 'User has been updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"محمد\"}, \"attributes\": {\"name\": \"محمد سالم\"}}', NULL, '2025-12-01 12:21:40', '2025-12-01 12:21:40'),
(8, 'user', 'User has been updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"محمد سالم\"}, \"attributes\": {\"name\": \"محمد \"}}', NULL, '2025-12-01 12:26:01', '2025-12-01 12:26:01'),
(9, 'user', 'تعديل بيانات المستخدم', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"محمد \"}, \"attributes\": {\"name\": \"محمد سالم\"}}', NULL, '2025-12-01 12:30:30', '2025-12-01 12:30:30'),
(10, 'user', 'حذف المستخدم', 'App\\Models\\User', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"محمد سالم\", \"email\": \"mohammed.salem701@gmail.com\"}}', NULL, '2025-12-01 12:30:44', '2025-12-01 12:30:44'),
(11, 'user', 'إضافة مستخدم جديد', 'App\\Models\\User', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"محمد سالم\", \"email\": \"mohammed.salem701@gmail.com\"}}', NULL, '2025-12-01 12:31:32', '2025-12-01 12:31:32'),
(12, 'customer', 'تعديل بيانات العميل', 'App\\Models\\Customer', 'updated', 1, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"محمد سالم\", \"phone\": \"736903344\", \"address\": \"ADen\"}, \"attributes\": {\"name\": \"محمد \", \"phone\": \"736903345\", \"address\": \"Aden\"}}', NULL, '2025-12-02 11:20:37', '2025-12-02 11:20:37'),
(21, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 36, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": null, \"discount\": \"0.00\", \"invoice_date\": \"2025-12-31\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 10:58:22', '2025-12-03 10:58:22'),
(22, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 26, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"100.00\", \"total_price\": \"100.00\"}}', NULL, '2025-12-03 10:58:22', '2025-12-03 10:58:22'),
(23, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 36, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"100.00\"}}', NULL, '2025-12-03 10:58:22', '2025-12-03 10:58:22'),
(42, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 43, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": null, \"discount\": \"0.00\", \"invoice_date\": \"2025-12-09\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 17:24:18', '2025-12-03 17:24:18'),
(43, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 33, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"100.00\", \"total_price\": \"500.00\"}}', NULL, '2025-12-03 17:24:18', '2025-12-03 17:24:18'),
(44, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 43, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"500.00\"}}', NULL, '2025-12-03 17:24:18', '2025-12-03 17:24:18'),
(61, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 52, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": null, \"discount\": \"0.00\", \"invoice_date\": \"2026-01-03\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 17:32:09', '2025-12-03 17:32:09'),
(62, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 42, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 2, \"unit_price\": \"100.00\", \"total_price\": \"200.00\"}}', NULL, '2025-12-03 17:32:09', '2025-12-03 17:32:09'),
(63, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 52, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"200.00\"}}', NULL, '2025-12-03 17:32:09', '2025-12-03 17:32:09'),
(79, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 65, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": null, \"discount\": \"0.00\", \"invoice_date\": \"2025-12-16\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 17:44:58', '2025-12-03 17:44:58'),
(80, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 46, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"100.00\", \"total_price\": \"100.00\"}}', NULL, '2025-12-03 17:44:58', '2025-12-03 17:44:58'),
(81, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 65, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"100.00\"}}', NULL, '2025-12-03 17:44:58', '2025-12-03 17:44:58'),
(82, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 66, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"300.00\", \"discount\": \"0.00\", \"invoice_date\": \"2025-12-09\", \"total_amount\": \"0.00\", \"payment_status\": \"partial\"}}', NULL, '2025-12-03 17:46:15', '2025-12-03 17:46:15'),
(83, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 47, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 4, \"unit_price\": \"100.00\", \"total_price\": \"400.00\"}}', NULL, '2025-12-03 17:46:15', '2025-12-03 17:46:15'),
(84, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 66, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"400.00\"}}', NULL, '2025-12-03 17:46:15', '2025-12-03 17:46:15'),
(85, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 67, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"300.00\", \"discount\": \"0.00\", \"invoice_date\": \"2025-12-17\", \"total_amount\": \"0.00\", \"payment_status\": \"partial\"}}', NULL, '2025-12-03 17:47:38', '2025-12-03 17:47:38'),
(86, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 48, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 4, \"unit_price\": \"100.00\", \"total_price\": \"400.00\"}}', NULL, '2025-12-03 17:47:38', '2025-12-03 17:47:38'),
(87, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 67, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"400.00\"}}', NULL, '2025-12-03 17:47:38', '2025-12-03 17:47:38'),
(88, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 68, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": null, \"discount\": \"100.00\", \"invoice_date\": \"2025-12-18\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 17:50:26', '2025-12-03 17:50:26'),
(89, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 49, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 4, \"unit_price\": \"100.00\", \"total_price\": \"400.00\"}}', NULL, '2025-12-03 17:50:26', '2025-12-03 17:50:26'),
(90, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 68, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"400.00\"}}', NULL, '2025-12-03 17:50:26', '2025-12-03 17:50:26'),
(91, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 69, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": null, \"discount\": \"100.00\", \"invoice_date\": \"2026-01-06\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 17:52:54', '2025-12-03 17:52:54'),
(92, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 50, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 4, \"unit_price\": \"100.00\", \"total_price\": \"400.00\"}}', NULL, '2025-12-03 17:52:54', '2025-12-03 17:52:54'),
(93, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 69, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"400.00\"}}', NULL, '2025-12-03 17:52:54', '2025-12-03 17:52:54'),
(94, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 70, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"100.00\", \"discount\": \"100.00\", \"invoice_date\": \"2025-12-23\", \"total_amount\": \"0.00\", \"payment_status\": \"partial\"}}', NULL, '2025-12-03 17:53:55', '2025-12-03 17:53:55'),
(95, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 51, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 4, \"unit_price\": \"100.00\", \"total_price\": \"400.00\"}}', NULL, '2025-12-03 17:53:56', '2025-12-03 17:53:56'),
(96, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 70, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"400.00\"}}', NULL, '2025-12-03 17:53:56', '2025-12-03 17:53:56'),
(97, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 71, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"100.00\", \"discount\": \"100.00\", \"invoice_date\": \"2025-12-30\", \"total_amount\": \"0.00\", \"payment_status\": \"partial\"}}', NULL, '2025-12-03 17:55:05', '2025-12-03 17:55:05'),
(98, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 52, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 4, \"unit_price\": \"100.00\", \"total_price\": \"400.00\"}}', NULL, '2025-12-03 17:55:05', '2025-12-03 17:55:05'),
(99, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 71, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"400.00\"}}', NULL, '2025-12-03 17:55:05', '2025-12-03 17:55:05'),
(100, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 72, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": null, \"discount\": \"300.00\", \"invoice_date\": \"2025-12-17\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 17:55:39', '2025-12-03 17:55:39'),
(101, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 53, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"100.00\", \"total_price\": \"500.00\"}}', NULL, '2025-12-03 17:55:39', '2025-12-03 17:55:39'),
(102, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 72, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"500.00\"}}', NULL, '2025-12-03 17:55:39', '2025-12-03 17:55:39'),
(103, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 73, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"100.00\", \"discount\": \"300.00\", \"invoice_date\": \"2025-12-09\", \"total_amount\": \"0.00\", \"payment_status\": \"partial\"}}', NULL, '2025-12-03 17:56:28', '2025-12-03 17:56:28'),
(104, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 54, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"100.00\", \"total_price\": \"500.00\"}}', NULL, '2025-12-03 17:56:28', '2025-12-03 17:56:28'),
(105, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 73, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"500.00\"}}', NULL, '2025-12-03 17:56:28', '2025-12-03 17:56:28'),
(112, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 77, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": null, \"discount\": \"0.00\", \"invoice_date\": \"2025-12-14\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 18:09:42', '2025-12-03 18:09:42'),
(113, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 58, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"100.00\", \"total_price\": \"100.00\"}}', NULL, '2025-12-03 18:09:42', '2025-12-03 18:09:42'),
(114, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 77, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"100.00\"}}', NULL, '2025-12-03 18:09:42', '2025-12-03 18:09:42'),
(116, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2025-12-26\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 18:59:46', '2025-12-03 18:59:46'),
(117, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1000, \"unit_price\": \"200.00\", \"total_price\": \"200000.00\"}}', NULL, '2025-12-03 18:59:46', '2025-12-03 18:59:46'),
(118, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 4, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"200000.00\"}}', NULL, '2025-12-03 18:59:46', '2025-12-03 18:59:46'),
(119, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-01-02\", \"payment_status\": \"partial\"}}', NULL, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(120, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1000, \"unit_price\": \"50.00\", \"total_price\": \"50000.00\"}}', NULL, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(121, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1000, \"unit_price\": \"60.00\", \"total_price\": \"60000.00\"}}', NULL, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(122, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 5, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"110000.00\"}}', NULL, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(123, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2025-12-26\", \"payment_status\": \"partial\"}}', NULL, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
(124, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1000, \"unit_price\": \"100.00\", \"total_price\": \"100000.00\"}}', NULL, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
(125, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 6, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"100000.00\"}}', NULL, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
(126, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-01-07\", \"payment_status\": \"paid\"}}', NULL, '2025-12-03 19:11:59', '2025-12-03 19:11:59'),
(127, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 100, \"unit_price\": \"100.00\", \"total_price\": \"10000.00\"}}', NULL, '2025-12-03 19:11:59', '2025-12-03 19:11:59'),
(128, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 7, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"10000.00\"}}', NULL, '2025-12-03 19:11:59', '2025-12-03 19:11:59'),
(129, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-01-03\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-03 19:13:02', '2025-12-03 19:13:02'),
(130, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 100, \"unit_price\": \"100.00\", \"total_price\": \"10000.00\"}}', NULL, '2025-12-03 19:13:02', '2025-12-03 19:13:02'),
(131, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 8, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"10000.00\"}}', NULL, '2025-12-03 19:13:02', '2025-12-03 19:13:02'),
(132, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-01-10\", \"payment_status\": \"paid\"}}', NULL, '2025-12-03 19:14:02', '2025-12-03 19:14:02'),
(133, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 50, \"unit_price\": \"100.00\", \"total_price\": \"5000.00\"}}', NULL, '2025-12-03 19:14:02', '2025-12-03 19:14:02'),
(134, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 9, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"5000.00\"}}', NULL, '2025-12-03 19:14:02', '2025-12-03 19:14:02'),
(135, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-01-07\", \"payment_status\": \"partial\"}}', NULL, '2025-12-03 19:14:52', '2025-12-03 19:14:52'),
(136, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 100, \"unit_price\": \"100.00\", \"total_price\": \"10000.00\"}}', NULL, '2025-12-03 19:14:52', '2025-12-03 19:14:52'),
(137, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 10, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"10000.00\"}}', NULL, '2025-12-03 19:14:52', '2025-12-03 19:14:52'),
(138, 'notification', 'تم قراءة الإشعار', 'App\\Models\\Notification', 'updated', 3, 'App\\Models\\User', 1, '{\"old\": {\"read_at\": null}, \"attributes\": {\"read_at\": \"2025-12-03 22:46:02\"}}', NULL, '2025-12-03 19:46:02', '2025-12-03 19:46:02'),
(139, 'notification', 'تم قراءة الإشعار', 'App\\Models\\Notification', 'updated', 3, 'App\\Models\\User', 1, '{\"old\": {\"message\": \"لا توجد كمية كافية في المخزون لهذا المنتج: بندول\", \"read_at\": null}, \"attributes\": {\"message\": \"لا توجد كمية كافية في المخزون لهذا المنتج: بندول\", \"read_at\": \"2025-12-03 22:46:57\"}}', NULL, '2025-12-03 19:46:57', '2025-12-03 19:46:57'),
(140, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 78, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-01-10\", \"total_amount\": \"0.00\", \"payment_status\": \"partial\"}}', NULL, '2025-12-05 18:07:20', '2025-12-05 18:07:20'),
(141, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 59, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"100.00\", \"total_price\": \"100.00\"}}', NULL, '2025-12-05 18:07:20', '2025-12-05 18:07:20'),
(142, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 78, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"100.00\"}}', NULL, '2025-12-05 18:07:20', '2025-12-05 18:07:20'),
(145, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2025-12-17\", \"total_amount\": \"0.00\"}}', NULL, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(146, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 10}}', NULL, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(147, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 10}}', NULL, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(148, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 10}}', NULL, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(149, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 14, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"1600.00\"}}', NULL, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(150, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2025-12-26\", \"total_amount\": \"0.00\"}}', NULL, '2025-12-07 19:36:32', '2025-12-07 19:36:32'),
(151, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 100}}', NULL, '2025-12-07 19:36:32', '2025-12-07 19:36:32'),
(152, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 15, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"10000.00\"}}', NULL, '2025-12-07 19:36:32', '2025-12-07 19:36:32'),
(153, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 4, 'App\\Models\\User', 1, '{\"old\": {\"payment_status\": \"unpaid\"}, \"attributes\": {\"payment_status\": \"paid\"}}', NULL, '2025-12-08 10:36:47', '2025-12-08 10:36:47'),
(154, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2025-12-17\", \"total_amount\": \"0.00\"}}', NULL, '2025-12-08 10:59:59', '2025-12-08 10:59:59'),
(155, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": \"منتهي\", \"quantity\": 100}}', NULL, '2025-12-08 10:59:59', '2025-12-08 10:59:59'),
(156, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 16, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"10000.00\"}}', NULL, '2025-12-08 10:59:59', '2025-12-08 10:59:59'),
(157, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2025-12-11\", \"total_amount\": \"0.00\"}}', NULL, '2025-12-08 11:03:48', '2025-12-08 11:03:48'),
(158, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 50}}', NULL, '2025-12-08 11:03:48', '2025-12-08 11:03:48'),
(159, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 17, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"5000.00\"}}', NULL, '2025-12-08 11:03:48', '2025-12-08 11:03:48'),
(160, 'sales_representative', 'إضافة مندوب جديد', 'App\\Models\\SalesRepresentative', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"محمد حمدي\", \"email\": \"dawa@phrma.com\", \"phone\": \"77884455\", \"address\": \"عدن\"}}', NULL, '2025-12-08 14:32:59', '2025-12-08 14:32:59'),
(161, 'sales_representative', 'تعديل بيانات المندوب', 'App\\Models\\SalesRepresentative', 'updated', 1, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"محمد حمدي\", \"address\": \"عدن\"}, \"attributes\": {\"name\": \"محمد\", \"address\": \"عدن الشعب\"}}', NULL, '2025-12-08 14:49:50', '2025-12-08 14:49:50'),
(162, 'sales_representative', 'حذف المندوب', 'App\\Models\\SalesRepresentative', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"محمد\", \"email\": \"dawa@phrma.com\", \"phone\": \"77884455\", \"address\": \"عدن الشعب\"}}', NULL, '2025-12-08 14:50:06', '2025-12-08 14:50:06'),
(163, 'sales_representative', 'إضافة مندوب جديد', 'App\\Models\\SalesRepresentative', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"محمد حمدي\", \"email\": \"dawa@phrma.com\", \"phone\": \"77884455\", \"address\": \"عدن الشعب\"}}', NULL, '2025-12-08 14:54:19', '2025-12-08 14:54:19'),
(164, 'product', 'تعديل بيانات المنتج', 'App\\Models\\Product', 'updated', 1, 'App\\Models\\User', 1, '{\"old\": {\"barcode\": null}, \"attributes\": {\"barcode\": \"34565465\"}}', NULL, '2025-12-08 20:15:34', '2025-12-08 20:15:34'),
(165, 'product', 'تعديل بيانات المنتج', 'App\\Models\\Product', 'updated', 2, 'App\\Models\\User', 1, '{\"old\": {\"barcode\": \"224445588\"}, \"attributes\": {\"barcode\": null}}', NULL, '2025-12-08 20:20:16', '2025-12-08 20:20:16'),
(166, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 66, 'App\\Models\\User', 1, '{\"old\": {\"paid\": \"300.00\", \"payment_status\": \"partial\"}, \"attributes\": {\"paid\": null, \"payment_status\": \"paid\"}}', NULL, '2025-12-09 10:50:17', '2025-12-09 10:50:17'),
(167, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 68, 'App\\Models\\User', 1, '{\"old\": {\"payment_status\": \"unpaid\"}, \"attributes\": {\"payment_status\": \"paid\"}}', NULL, '2025-12-09 10:53:10', '2025-12-09 10:53:10'),
(168, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-01-06\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-26 13:00:41', '2025-12-26 13:00:41'),
(169, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 10, \"unit_price\": \"100.00\", \"total_price\": \"1000.00\"}}', NULL, '2025-12-26 13:00:41', '2025-12-26 13:00:41'),
(170, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 10, \"unit_price\": \"100.00\", \"total_price\": \"1000.00\"}}', NULL, '2025-12-26 13:00:41', '2025-12-26 13:00:41'),
(171, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 11, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"2000.00\"}}', NULL, '2025-12-26 13:00:41', '2025-12-26 13:00:41'),
(175, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2025-12-26\", \"total_amount\": \"0.00\"}}', NULL, '2025-12-26 13:04:41', '2025-12-26 13:04:41'),
(176, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 10}}', NULL, '2025-12-26 13:04:41', '2025-12-26 13:04:41'),
(177, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 19, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"1000.00\"}}', NULL, '2025-12-26 13:04:41', '2025-12-26 13:04:41'),
(180, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 21, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2026-01-23\", \"total_amount\": \"0.00\"}}', NULL, '2026-01-23 15:54:13', '2026-01-23 15:54:13'),
(181, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 21, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": \"j\", \"quantity\": 500}}', NULL, '2026-01-23 15:54:13', '2026-01-23 15:54:13'),
(182, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 21, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"50000.00\"}}', NULL, '2026-01-23 15:54:13', '2026-01-23 15:54:13'),
(183, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 22, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2026-01-14\", \"total_amount\": \"0.00\"}}', NULL, '2026-01-23 16:48:58', '2026-01-23 16:48:58'),
(184, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 22, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 4}}', NULL, '2026-01-23 16:48:58', '2026-01-23 16:48:58'),
(185, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 22, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"400.00\"}}', NULL, '2026-01-23 16:48:58', '2026-01-23 16:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint UNSIGNED DEFAULT NULL,
  `old_quantity` int NOT NULL,
  `new_quantity` int NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED DEFAULT NULL,
  `batch_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `purchase_price_per_base` decimal(10,2) NOT NULL,
  `sale_price_per_base` decimal(10,2) DEFAULT NULL,
  `initial_quantity` int NOT NULL,
  `current_quantity` int NOT NULL DEFAULT (0),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `product_id`, `supplier_id`, `batch_no`, `expiry_date`, `purchase_price_per_base`, `sale_price_per_base`, `initial_quantity`, `current_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '5544', '2027-07-29', 80.00, 100.00, 1550, 0, '2025-10-29 05:27:57', '2026-01-23 15:54:13'),
(2, 2, 1, 'BATCH-6930B2D28A5FE', '2025-12-30', 200.00, NULL, 3010, 3000, '2025-12-03 18:59:46', '2025-12-26 13:00:41'),
(3, 1, 1, 'BATCH-6930B4B80347F', '2026-01-10', 50.00, NULL, 1010, 984, '2025-12-03 19:07:52', '2026-01-23 16:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:2;', 1769194150),
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1769194150;', 1769194150),
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:5:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:12:\"display_name\";s:1:\"d\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:62:{i:0;a:5:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"create batch\";s:1:\"c\";s:25:\"اضافة الدفعات\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"view batch\";s:1:\"c\";s:21:\"عرض الدفعات\";s:1:\"d\";s:3:\"web\";}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:12:\"update batch\";s:1:\"c\";s:25:\"تحديث الدفعات\";s:1:\"d\";s:3:\"web\";}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:12:\"delete batch\";s:1:\"c\";s:21:\"حذف الدفعات\";s:1:\"d\";s:3:\"web\";}i:4;a:5:{s:1:\"a\";i:5;s:1:\"b\";s:15:\"create category\";s:1:\"c\";s:25:\"اضافة الاقسام\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:5;a:5:{s:1:\"a\";i:6;s:1:\"b\";s:13:\"view category\";s:1:\"c\";s:21:\"عرض الاقسام\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:15:\"update category\";s:1:\"c\";s:25:\"تحديث الاقسام\";s:1:\"d\";s:3:\"web\";}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:15:\"delete category\";s:1:\"c\";s:21:\"حذف الاقسام\";s:1:\"d\";s:3:\"web\";}i:8;a:5:{s:1:\"a\";i:9;s:1:\"b\";s:14:\"create invoice\";s:1:\"c\";s:27:\"اضافة الفواتير\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:12:\"view invoice\";s:1:\"c\";s:23:\"عرض الفواتير\";s:1:\"d\";s:3:\"web\";}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:14:\"update invoice\";s:1:\"c\";s:27:\"تحديث الفواتير\";s:1:\"d\";s:3:\"web\";}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:14:\"delete invoice\";s:1:\"c\";s:23:\"حذف الفواتير\";s:1:\"d\";s:3:\"web\";}i:12;a:5:{s:1:\"a\";i:13;s:1:\"b\";s:19:\"create manufacturer\";s:1:\"c\";s:40:\"اضافة الشركات المصنعة\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:17:\"view manufacturer\";s:1:\"c\";s:36:\"عرض الشركات المصنعة\";s:1:\"d\";s:3:\"web\";}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:19:\"update manufacturer\";s:1:\"c\";s:40:\"تحديث الشركات المصنعة\";s:1:\"d\";s:3:\"web\";}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:19:\"delete manufacturer\";s:1:\"c\";s:36:\"حذف الشركات المصنعة\";s:1:\"d\";s:3:\"web\";}i:16;a:5:{s:1:\"a\";i:17;s:1:\"b\";s:13:\"create return\";s:1:\"c\";s:29:\"اضافة المرتجعات\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:11:\"view return\";s:1:\"c\";s:25:\"عرض المرتجعات\";s:1:\"d\";s:3:\"web\";}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:13:\"update return\";s:1:\"c\";s:29:\"تحديث المرتجعات\";s:1:\"d\";s:3:\"web\";}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:13:\"delete return\";s:1:\"c\";s:25:\"حذف المرتجعات\";s:1:\"d\";s:3:\"web\";}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:14:\"create product\";s:1:\"c\";s:27:\"اضافة المنتجات\";s:1:\"d\";s:3:\"web\";}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"view product\";s:1:\"c\";s:23:\"عرض المنتجات\";s:1:\"d\";s:3:\"web\";}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:14:\"update product\";s:1:\"c\";s:27:\"تحديث المنتجات\";s:1:\"d\";s:3:\"web\";}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:14:\"delete product\";s:1:\"c\";s:23:\"حذف المنتجات\";s:1:\"d\";s:3:\"web\";}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"create purchase\";s:1:\"c\";s:29:\"اضافة المشتريات\";s:1:\"d\";s:3:\"web\";}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:13:\"view purchase\";s:1:\"c\";s:25:\"عرض المشتريات\";s:1:\"d\";s:3:\"web\";}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"update purchase\";s:1:\"c\";s:29:\"تحديث المشتريات\";s:1:\"d\";s:3:\"web\";}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:15:\"delete purchase\";s:1:\"c\";s:25:\"حذف المشتريات\";s:1:\"d\";s:3:\"web\";}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:11:\"create role\";s:1:\"c\";s:25:\"اضافة الادوار\";s:1:\"d\";s:3:\"web\";}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:9:\"view role\";s:1:\"c\";s:21:\"عرض الادوار\";s:1:\"d\";s:3:\"web\";}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:11:\"update role\";s:1:\"c\";s:25:\"تحديث الادوار\";s:1:\"d\";s:3:\"web\";}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:11:\"delete role\";s:1:\"c\";s:21:\"حذف الادوار\";s:1:\"d\";s:3:\"web\";}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:15:\"create supplier\";s:1:\"c\";s:27:\"اضافة المزودين\";s:1:\"d\";s:3:\"web\";}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:13:\"view supplier\";s:1:\"c\";s:23:\"عرض المزودين\";s:1:\"d\";s:3:\"web\";}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:15:\"update supplier\";s:1:\"c\";s:27:\"تحديث المزودين\";s:1:\"d\";s:3:\"web\";}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:15:\"delete supplier\";s:1:\"c\";s:23:\"حذف المزودين\";s:1:\"d\";s:3:\"web\";}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:11:\"create unit\";s:1:\"c\";s:25:\"اضافة الوحدات\";s:1:\"d\";s:3:\"web\";}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:9:\"view unit\";s:1:\"c\";s:21:\"عرض الوحدات\";s:1:\"d\";s:3:\"web\";}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:11:\"update unit\";s:1:\"c\";s:25:\"تحديث الوحدات\";s:1:\"d\";s:3:\"web\";}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:11:\"delete unit\";s:1:\"c\";s:21:\"حذف الوحدات\";s:1:\"d\";s:3:\"web\";}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:11:\"create user\";s:1:\"c\";s:31:\"اضافة المستخدمين\";s:1:\"d\";s:3:\"web\";}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:9:\"view user\";s:1:\"c\";s:27:\"عرض المستخدمين\";s:1:\"d\";s:3:\"web\";}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:11:\"update user\";s:1:\"c\";s:31:\"تحديث المستخدمين\";s:1:\"d\";s:3:\"web\";}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:11:\"delete user\";s:1:\"c\";s:27:\"حذف المستخدمين\";s:1:\"d\";s:3:\"web\";}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:15:\"create customer\";s:1:\"c\";s:25:\"اضافة العملاء\";s:1:\"d\";s:3:\"web\";}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:13:\"view customer\";s:1:\"c\";s:21:\"عرض العملاء\";s:1:\"d\";s:3:\"web\";}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:15:\"update customer\";s:1:\"c\";s:25:\"تحديث العملاء\";s:1:\"d\";s:3:\"web\";}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:15:\"delete customer\";s:1:\"c\";s:21:\"حذف العملاء\";s:1:\"d\";s:3:\"web\";}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:17:\"view notification\";s:1:\"c\";s:25:\"عرض الإشعارات\";s:1:\"d\";s:3:\"web\";}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:24:\"mark notification unread\";s:1:\"c\";s:36:\"تمييز الإشعار مقروء\";s:1:\"d\";s:3:\"web\";}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:33:\"view customer account transaction\";s:1:\"c\";s:37:\"عرض سجل ديون العملاء\";s:1:\"d\";s:3:\"web\";}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:35:\"create customer account transaction\";s:1:\"c\";s:39:\"انشاء سجل دين للعملاء\";s:1:\"d\";s:3:\"web\";}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:35:\"update customer account transaction\";s:1:\"c\";s:41:\"تحديث سجل ديون العملاء\";s:1:\"d\";s:3:\"web\";}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:35:\"delete customer account transaction\";s:1:\"c\";s:41:\"حذف سجلات ديون العملاء\";s:1:\"d\";s:3:\"web\";}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:25:\"view sales representative\";s:1:\"c\";s:36:\"عرض مندوبي المبيعات\";s:1:\"d\";s:3:\"web\";}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:27:\"create sales representative\";s:1:\"c\";s:36:\"اضافة مندوبي مبيعات\";s:1:\"d\";s:3:\"web\";}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:27:\"update sales representative\";s:1:\"c\";s:40:\"تحديث مندوبي المبيعات\";s:1:\"d\";s:3:\"web\";}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:27:\"delete sales representative\";s:1:\"c\";s:36:\"حذف مندوبي المبيعات\";s:1:\"d\";s:3:\"web\";}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:21:\"view supplier account\";s:1:\"c\";s:39:\"عرض سجل ديون الموردين\";s:1:\"d\";s:3:\"web\";}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:23:\"create supplier account\";s:1:\"c\";s:43:\"اضافة سجل ديون الموردين\";s:1:\"d\";s:3:\"web\";}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:23:\"update supplier account\";s:1:\"c\";s:43:\"تحديث سجل ديون الموردين\";s:1:\"d\";s:3:\"web\";}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:23:\"delete supplier account\";s:1:\"c\";s:39:\"حذف سجل ديون الموردين\";s:1:\"d\";s:3:\"web\";}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:8:\"مشرف\";s:1:\"d\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:21:\"مدخل بيانات\";s:1:\"d\";s:3:\"web\";}}}', 1769280543),
('pms-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:2;', 1766764013),
('pms-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1766764013;', 1766764013),
('pms-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:5:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:12:\"display_name\";s:1:\"d\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:62:{i:0;a:5:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"create batch\";s:1:\"c\";s:25:\"اضافة الدفعات\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"view batch\";s:1:\"c\";s:21:\"عرض الدفعات\";s:1:\"d\";s:3:\"web\";}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:12:\"update batch\";s:1:\"c\";s:25:\"تحديث الدفعات\";s:1:\"d\";s:3:\"web\";}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:12:\"delete batch\";s:1:\"c\";s:21:\"حذف الدفعات\";s:1:\"d\";s:3:\"web\";}i:4;a:5:{s:1:\"a\";i:5;s:1:\"b\";s:15:\"create category\";s:1:\"c\";s:25:\"اضافة الاقسام\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:5;a:5:{s:1:\"a\";i:6;s:1:\"b\";s:13:\"view category\";s:1:\"c\";s:21:\"عرض الاقسام\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:3;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:15:\"update category\";s:1:\"c\";s:25:\"تحديث الاقسام\";s:1:\"d\";s:3:\"web\";}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:15:\"delete category\";s:1:\"c\";s:21:\"حذف الاقسام\";s:1:\"d\";s:3:\"web\";}i:8;a:5:{s:1:\"a\";i:9;s:1:\"b\";s:14:\"create invoice\";s:1:\"c\";s:27:\"اضافة الفواتير\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:12:\"view invoice\";s:1:\"c\";s:23:\"عرض الفواتير\";s:1:\"d\";s:3:\"web\";}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:14:\"update invoice\";s:1:\"c\";s:27:\"تحديث الفواتير\";s:1:\"d\";s:3:\"web\";}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:14:\"delete invoice\";s:1:\"c\";s:23:\"حذف الفواتير\";s:1:\"d\";s:3:\"web\";}i:12;a:5:{s:1:\"a\";i:13;s:1:\"b\";s:19:\"create manufacturer\";s:1:\"c\";s:40:\"اضافة الشركات المصنعة\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:17:\"view manufacturer\";s:1:\"c\";s:36:\"عرض الشركات المصنعة\";s:1:\"d\";s:3:\"web\";}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:19:\"update manufacturer\";s:1:\"c\";s:40:\"تحديث الشركات المصنعة\";s:1:\"d\";s:3:\"web\";}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:19:\"delete manufacturer\";s:1:\"c\";s:36:\"حذف الشركات المصنعة\";s:1:\"d\";s:3:\"web\";}i:16;a:5:{s:1:\"a\";i:17;s:1:\"b\";s:13:\"create return\";s:1:\"c\";s:29:\"اضافة المرتجعات\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:11:\"view return\";s:1:\"c\";s:25:\"عرض المرتجعات\";s:1:\"d\";s:3:\"web\";}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:13:\"update return\";s:1:\"c\";s:29:\"تحديث المرتجعات\";s:1:\"d\";s:3:\"web\";}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:13:\"delete return\";s:1:\"c\";s:25:\"حذف المرتجعات\";s:1:\"d\";s:3:\"web\";}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:14:\"create product\";s:1:\"c\";s:27:\"اضافة المنتجات\";s:1:\"d\";s:3:\"web\";}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"view product\";s:1:\"c\";s:23:\"عرض المنتجات\";s:1:\"d\";s:3:\"web\";}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:14:\"update product\";s:1:\"c\";s:27:\"تحديث المنتجات\";s:1:\"d\";s:3:\"web\";}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:14:\"delete product\";s:1:\"c\";s:23:\"حذف المنتجات\";s:1:\"d\";s:3:\"web\";}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"create purchase\";s:1:\"c\";s:29:\"اضافة المشتريات\";s:1:\"d\";s:3:\"web\";}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:13:\"view purchase\";s:1:\"c\";s:25:\"عرض المشتريات\";s:1:\"d\";s:3:\"web\";}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"update purchase\";s:1:\"c\";s:29:\"تحديث المشتريات\";s:1:\"d\";s:3:\"web\";}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:15:\"delete purchase\";s:1:\"c\";s:25:\"حذف المشتريات\";s:1:\"d\";s:3:\"web\";}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:11:\"create role\";s:1:\"c\";s:25:\"اضافة الادوار\";s:1:\"d\";s:3:\"web\";}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:9:\"view role\";s:1:\"c\";s:21:\"عرض الادوار\";s:1:\"d\";s:3:\"web\";}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:11:\"update role\";s:1:\"c\";s:25:\"تحديث الادوار\";s:1:\"d\";s:3:\"web\";}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:11:\"delete role\";s:1:\"c\";s:21:\"حذف الادوار\";s:1:\"d\";s:3:\"web\";}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:15:\"create supplier\";s:1:\"c\";s:27:\"اضافة المزودين\";s:1:\"d\";s:3:\"web\";}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:13:\"view supplier\";s:1:\"c\";s:23:\"عرض المزودين\";s:1:\"d\";s:3:\"web\";}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:15:\"update supplier\";s:1:\"c\";s:27:\"تحديث المزودين\";s:1:\"d\";s:3:\"web\";}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:15:\"delete supplier\";s:1:\"c\";s:23:\"حذف المزودين\";s:1:\"d\";s:3:\"web\";}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:11:\"create unit\";s:1:\"c\";s:25:\"اضافة الوحدات\";s:1:\"d\";s:3:\"web\";}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:9:\"view unit\";s:1:\"c\";s:21:\"عرض الوحدات\";s:1:\"d\";s:3:\"web\";}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:11:\"update unit\";s:1:\"c\";s:25:\"تحديث الوحدات\";s:1:\"d\";s:3:\"web\";}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:11:\"delete unit\";s:1:\"c\";s:21:\"حذف الوحدات\";s:1:\"d\";s:3:\"web\";}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:11:\"create user\";s:1:\"c\";s:31:\"اضافة المستخدمين\";s:1:\"d\";s:3:\"web\";}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:9:\"view user\";s:1:\"c\";s:27:\"عرض المستخدمين\";s:1:\"d\";s:3:\"web\";}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:11:\"update user\";s:1:\"c\";s:31:\"تحديث المستخدمين\";s:1:\"d\";s:3:\"web\";}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:11:\"delete user\";s:1:\"c\";s:27:\"حذف المستخدمين\";s:1:\"d\";s:3:\"web\";}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:15:\"create customer\";s:1:\"c\";s:25:\"اضافة العملاء\";s:1:\"d\";s:3:\"web\";}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:13:\"view customer\";s:1:\"c\";s:21:\"عرض العملاء\";s:1:\"d\";s:3:\"web\";}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:15:\"update customer\";s:1:\"c\";s:25:\"تحديث العملاء\";s:1:\"d\";s:3:\"web\";}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:15:\"delete customer\";s:1:\"c\";s:21:\"حذف العملاء\";s:1:\"d\";s:3:\"web\";}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:17:\"view notification\";s:1:\"c\";s:25:\"عرض الإشعارات\";s:1:\"d\";s:3:\"web\";}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:24:\"mark notification unread\";s:1:\"c\";s:36:\"تمييز الإشعار مقروء\";s:1:\"d\";s:3:\"web\";}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:33:\"view customer account transaction\";s:1:\"c\";s:37:\"عرض سجل ديون العملاء\";s:1:\"d\";s:3:\"web\";}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:35:\"create customer account transaction\";s:1:\"c\";s:39:\"انشاء سجل دين للعملاء\";s:1:\"d\";s:3:\"web\";}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:35:\"update customer account transaction\";s:1:\"c\";s:41:\"تحديث سجل ديون العملاء\";s:1:\"d\";s:3:\"web\";}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:35:\"delete customer account transaction\";s:1:\"c\";s:41:\"حذف سجلات ديون العملاء\";s:1:\"d\";s:3:\"web\";}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:25:\"view sales representative\";s:1:\"c\";s:36:\"عرض مندوبي المبيعات\";s:1:\"d\";s:3:\"web\";}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:27:\"create sales representative\";s:1:\"c\";s:36:\"اضافة مندوبي مبيعات\";s:1:\"d\";s:3:\"web\";}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:27:\"update sales representative\";s:1:\"c\";s:40:\"تحديث مندوبي المبيعات\";s:1:\"d\";s:3:\"web\";}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:27:\"delete sales representative\";s:1:\"c\";s:36:\"حذف مندوبي المبيعات\";s:1:\"d\";s:3:\"web\";}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:21:\"view supplier account\";s:1:\"c\";s:39:\"عرض سجل ديون الموردين\";s:1:\"d\";s:3:\"web\";}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:23:\"create supplier account\";s:1:\"c\";s:43:\"اضافة سجل ديون الموردين\";s:1:\"d\";s:3:\"web\";}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:23:\"update supplier account\";s:1:\"c\";s:43:\"تحديث سجل ديون الموردين\";s:1:\"d\";s:3:\"web\";}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:23:\"delete supplier account\";s:1:\"c\";s:39:\"حذف سجل ديون الموردين\";s:1:\"d\";s:3:\"web\";}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:8:\"مشرف\";s:1:\"d\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:21:\"مدخل بيانات\";s:1:\"d\";s:3:\"web\";}}}', 1766849626);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'أدوية الزكام', 'دواء الزكام', '2025-10-26 17:30:11', '2025-10-27 11:09:42'),
(2, 'ادوية الحمى', NULL, '2025-10-27 11:09:15', '2025-10-27 11:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'محمد ', 'mohammed.salem701@gmail.com', '736903345', 'Aden', '2025-12-02 11:15:34', '2025-12-02 11:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `customer_accounts`
--

CREATE TABLE `customer_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_accounts`
--

INSERT INTO `customer_accounts` (`id`, `customer_id`, `balance`, `created_at`, `updated_at`) VALUES
(2, 1, 1200.00, '2025-12-03 17:24:18', '2025-12-03 17:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `customer_account_transactions`
--

CREATE TABLE `customer_account_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_account_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_account_transactions`
--

INSERT INTO `customer_account_transactions` (`id`, `customer_account_id`, `type`, `invoice_id`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(5, 2, 'dept', 69, 300.00, NULL, '2025-12-03 17:52:54', '2025-12-03 17:52:54'),
(6, 2, 'dept', 71, 200.00, NULL, '2025-12-03 17:55:05', '2025-12-03 17:55:05'),
(7, NULL, 'debt', 78, 100.00, NULL, '2025-12-05 18:07:20', '2025-12-05 18:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `examinations`
--

CREATE TABLE `examinations` (
  `id` bigint UNSIGNED NOT NULL,
  `scientific_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `normal_ratio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `examinations`
--

INSERT INTO `examinations` (`id`, `scientific_name`, `normal_ratio`, `department_id`, `unit_id`, `created_at`, `updated_at`) VALUES
(1, 'فحص متخصص', '50', 1, 1, '2025-12-11 19:10:33', '2025-12-11 19:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `examination_departments`
--

CREATE TABLE `examination_departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `examination_departments`
--

INSERT INTO `examination_departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'فحص الدم', '2025-12-11 19:07:11', '2025-12-11 19:07:11');

-- --------------------------------------------------------

--
-- Table structure for table `examination_prescriptions`
--

CREATE TABLE `examination_prescriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `patient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `gender` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `examination_prescriptions`
--

INSERT INTO `examination_prescriptions` (`id`, `patient_name`, `age`, `gender`, `created_at`, `updated_at`) VALUES
(1, 'علوي صالح احمد', 35, 'male', '2025-12-11 19:11:31', '2025-12-11 19:11:31'),
(2, 'مجيدة فيصل', 44, 'female', '2025-12-11 19:19:37', '2025-12-11 19:19:37'),
(3, 'jkjh', 65, 'male', '2025-12-31 07:31:17', '2025-12-31 07:31:17'),
(4, 'علي صالح سعيد سعد', 50, 'male', '2026-01-23 16:26:52', '2026-01-23 16:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `examination_prescription_items`
--

CREATE TABLE `examination_prescription_items` (
  `id` bigint UNSIGNED NOT NULL,
  `examination_prescription_id` bigint UNSIGNED NOT NULL,
  `examination_id` bigint UNSIGNED NOT NULL,
  `patient_ratio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `examination_prescription_items`
--

INSERT INTO `examination_prescription_items` (`id`, `examination_prescription_id`, `examination_id`, `patient_ratio`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '40', '2025-12-11 19:11:31', '2025-12-11 19:11:31'),
(2, 2, 1, '45', '2025-12-11 19:19:37', '2025-12-11 19:19:37'),
(3, 3, 1, '21', '2025-12-31 07:31:17', '2025-12-31 07:31:17'),
(4, 4, 1, '51', '2026-01-23 16:26:52', '2026-01-23 16:26:52'),
(5, 4, 1, '54', '2026-01-23 16:26:52', '2026-01-23 16:26:52'),
(6, 4, 1, '4797', '2026-01-23 16:41:22', '2026-01-23 16:41:22'),
(7, 1, 1, '54', '2026-01-23 16:42:34', '2026-01-23 16:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `examination_units`
--

CREATE TABLE `examination_units` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `examination_units`
--

INSERT INTO `examination_units` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'sm', '2025-12-11 19:09:08', '2026-01-23 16:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('paid','unpaid','partial') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `invoice_date` date NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_no`, `total_amount`, `discount`, `paid`, `payment_status`, `invoice_date`, `customer_name`, `note`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '5453', 10000.00, 10.00, 1000.00, 'unpaid', '2025-10-30', NULL, NULL, 1, '2025-10-29 08:39:23', '2025-10-29 08:39:23'),
(2, '20251029143830-609', 0.00, 10.00, 0.00, 'unpaid', '2025-10-22', NULL, NULL, 1, '2025-10-29 11:38:30', '2025-10-29 11:38:30'),
(5, '20251029202149-491', 5.00, 55.00, 0.00, 'unpaid', '2025-10-28', NULL, NULL, 1, '2025-10-29 17:21:49', '2025-10-29 17:21:49'),
(7, 'INV20251030-001', 1000.00, 100.00, 1000.00, 'paid', '2025-10-30', NULL, NULL, 1, '2025-10-30 11:15:50', '2025-10-30 11:15:50'),
(9, 'INV20251030-002', 1000.00, 0.00, 1000.00, 'paid', '2025-10-30', NULL, NULL, 1, '2025-10-30 11:25:35', '2025-10-30 11:25:35'),
(10, 'INV20251030-003', 1000.00, 0.00, 354.00, 'unpaid', '2025-10-30', NULL, NULL, 1, '2025-10-30 11:35:41', '2025-10-30 11:35:41'),
(14, 'INV20251030-004', 100.00, 0.00, 0.00, 'unpaid', '2025-10-30', NULL, NULL, 1, '2025-10-30 12:22:28', '2025-10-30 12:22:28'),
(20, 'INV20251030-005', 10.00, 0.00, 10.00, 'paid', '2025-10-31', NULL, NULL, 1, '2025-10-30 19:39:46', '2025-10-30 19:39:46'),
(21, 'INV20251030-006', 2.00, 0.00, 2.00, 'paid', '2025-10-31', NULL, NULL, 1, '2025-10-30 19:43:20', '2025-10-30 19:43:20'),
(24, 'INV-20251103-00001', 100.00, 0.00, 0.00, 'unpaid', '2025-11-11', NULL, NULL, 1, '2025-11-03 04:01:57', '2025-11-03 04:01:57'),
(25, 'INV-20251103-00002', 1200.00, 0.00, 0.00, 'unpaid', '2025-11-10', NULL, NULL, 1, '2025-11-03 04:03:07', '2025-11-03 04:03:07'),
(28, 'INV-20251103-00003', 1200.00, 0.00, 0.00, 'unpaid', '2025-11-04', NULL, NULL, 1, '2025-11-03 04:12:22', '2025-11-03 04:12:22'),
(29, 'INV-20251103-00004', 1200.00, 0.00, 0.00, 'unpaid', '2025-11-16', NULL, NULL, 1, '2025-11-03 04:37:18', '2025-11-03 04:37:18'),
(30, 'INV-20251129-00001', 200.00, 0.00, 0.00, 'unpaid', '2025-12-03', NULL, NULL, 1, '2025-11-29 18:22:08', '2025-11-29 18:22:08'),
(31, 'INV-20251130-00001', 100.00, 0.00, NULL, 'paid', '2025-12-23', NULL, NULL, 1, '2025-11-30 19:42:07', '2025-11-30 19:42:07'),
(36, 'INV-20251203-00001', 100.00, 0.00, NULL, 'unpaid', '2025-12-31', NULL, NULL, 1, '2025-12-03 10:58:22', '2025-12-03 10:58:22'),
(43, 'INV-20251203-00002', 500.00, 0.00, NULL, 'unpaid', '2025-12-09', NULL, NULL, 1, '2025-12-03 17:24:18', '2025-12-03 17:24:18'),
(52, 'INV-20251203-00003', 200.00, 0.00, NULL, 'unpaid', '2026-01-03', NULL, NULL, 1, '2025-12-03 17:32:09', '2025-12-03 17:32:09'),
(65, 'INV-20251203-00004', 100.00, 0.00, NULL, 'unpaid', '2025-12-16', NULL, NULL, 1, '2025-12-03 17:44:58', '2025-12-03 17:44:58'),
(66, 'INV-20251203-00005', 400.00, 0.00, NULL, 'paid', '2025-12-09', NULL, NULL, 1, '2025-12-03 17:46:15', '2025-12-09 10:50:16'),
(67, 'INV-20251203-00006', 400.00, 0.00, 300.00, 'partial', '2025-12-17', NULL, NULL, 1, '2025-12-03 17:47:38', '2025-12-03 17:47:38'),
(68, 'INV-20251203-00007', 400.00, 100.00, NULL, 'paid', '2025-12-18', NULL, NULL, 1, '2025-12-03 17:50:26', '2025-12-09 10:53:10'),
(69, 'INV-20251203-00008', 400.00, 100.00, NULL, 'unpaid', '2026-01-06', NULL, NULL, 1, '2025-12-03 17:52:54', '2025-12-03 17:52:54'),
(70, 'INV-20251203-00009', 400.00, 100.00, 100.00, 'partial', '2025-12-23', NULL, NULL, 1, '2025-12-03 17:53:55', '2025-12-03 17:53:56'),
(71, 'INV-20251203-00010', 400.00, 100.00, 100.00, 'partial', '2025-12-30', NULL, NULL, 1, '2025-12-03 17:55:05', '2025-12-03 17:55:05'),
(72, 'INV-20251203-00011', 500.00, 300.00, NULL, 'unpaid', '2025-12-17', NULL, NULL, 1, '2025-12-03 17:55:39', '2025-12-03 17:55:39'),
(73, 'INV-20251203-00012', 500.00, 300.00, 100.00, 'partial', '2025-12-09', NULL, NULL, 1, '2025-12-03 17:56:28', '2025-12-03 17:56:28'),
(77, 'INV-20251203-00013', 100.00, 0.00, NULL, 'unpaid', '2025-12-14', NULL, NULL, 1, '2025-12-03 18:09:42', '2025-12-03 18:09:42'),
(78, 'INV-20251205-00001', 100.00, 0.00, 0.00, 'partial', '2026-01-10', NULL, 'ترك عندنا جوال', 1, '2025-12-05 18:07:20', '2025-12-05 18:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int NOT NULL,
  `quantity_base` decimal(10,2) NOT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `product_id`, `unit_id`, `batch_id`, `quantity`, `quantity_base`, `base_price`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 3, NULL, 1, 0.00, NULL, 5.00, 5.00, '2025-10-29 17:21:49', '2025-10-29 17:21:49'),
(3, 7, 1, 3, NULL, 100, 0.00, NULL, 10.00, 1000.00, '2025-10-30 11:15:50', '2025-10-30 11:15:50'),
(4, 9, 1, 4, NULL, 1, 0.00, NULL, 1000.00, 1000.00, '2025-10-30 11:25:35', '2025-10-30 11:25:35'),
(5, 10, 1, 3, NULL, 10, 0.00, NULL, 100.00, 1000.00, '2025-10-30 11:35:41', '2025-10-30 11:35:41'),
(9, 14, 1, 3, NULL, 10, 120.00, NULL, 10.00, 100.00, '2025-10-30 12:22:28', '2025-10-30 12:22:28'),
(15, 20, 1, 3, NULL, 1, 12.00, NULL, 10.00, 10.00, '2025-10-30 19:39:46', '2025-10-30 19:39:46'),
(16, 21, 1, 4, NULL, 1, 240.00, NULL, 2.00, 2.00, '2025-10-30 19:43:20', '2025-10-30 19:43:20'),
(17, 24, 1, 3, NULL, 1, 12.00, 100.00, 100.00, 100.00, '2025-11-03 04:01:57', '2025-11-03 04:01:57'),
(18, 25, 1, 4, NULL, 1, 240.00, NULL, 1200.00, 1200.00, '2025-11-03 04:03:07', '2025-11-03 04:03:07'),
(19, 28, 1, 4, NULL, 1, 240.00, 100.00, 1200.00, 1200.00, '2025-11-03 04:12:22', '2025-11-03 04:12:22'),
(20, 29, 1, 4, NULL, 1, 12.00, 100.00, 1200.00, 1200.00, '2025-11-03 04:37:18', '2025-11-03 04:37:18'),
(21, 30, 1, 3, NULL, 1, 2.00, 100.00, 100.00, 100.00, '2025-11-29 18:22:08', '2025-11-29 18:22:08'),
(22, 30, 1, 3, NULL, 1, 2.00, 100.00, 100.00, 100.00, '2025-11-29 18:22:08', '2025-11-29 18:22:08'),
(23, 31, 1, 3, NULL, 1, 2.00, 100.00, 100.00, 100.00, '2025-11-30 19:42:07', '2025-11-30 19:42:07'),
(26, 36, 1, 3, NULL, 1, 2.00, 100.00, 100.00, 100.00, '2025-12-03 10:58:22', '2025-12-03 10:58:22'),
(33, 43, 1, 3, NULL, 5, 10.00, 100.00, 100.00, 500.00, '2025-12-03 17:24:18', '2025-12-03 17:24:18'),
(42, 52, 1, 3, NULL, 2, 4.00, 100.00, 100.00, 200.00, '2025-12-03 17:32:09', '2025-12-03 17:32:09'),
(46, 65, 1, 3, NULL, 1, 2.00, 100.00, 100.00, 100.00, '2025-12-03 17:44:58', '2025-12-03 17:44:58'),
(47, 66, 1, 3, NULL, 4, 8.00, 100.00, 100.00, 400.00, '2025-12-03 17:46:15', '2025-12-03 17:46:15'),
(48, 67, 1, 3, NULL, 4, 8.00, 100.00, 100.00, 400.00, '2025-12-03 17:47:38', '2025-12-03 17:47:38'),
(49, 68, 1, 3, NULL, 4, 8.00, 100.00, 100.00, 400.00, '2025-12-03 17:50:26', '2025-12-03 17:50:26'),
(50, 69, 1, 3, NULL, 4, 8.00, 100.00, 100.00, 400.00, '2025-12-03 17:52:54', '2025-12-03 17:52:54'),
(51, 70, 1, 3, NULL, 4, 8.00, 100.00, 100.00, 400.00, '2025-12-03 17:53:56', '2025-12-03 17:53:56'),
(52, 71, 1, 3, NULL, 4, 8.00, 100.00, 100.00, 400.00, '2025-12-03 17:55:05', '2025-12-03 17:55:05'),
(53, 72, 1, 3, NULL, 5, 10.00, 100.00, 100.00, 500.00, '2025-12-03 17:55:39', '2025-12-03 17:55:39'),
(54, 73, 1, 3, NULL, 5, 10.00, 100.00, 100.00, 500.00, '2025-12-03 17:56:28', '2025-12-03 17:56:28'),
(58, 77, 1, 3, NULL, 1, 2.00, 100.00, 100.00, 100.00, '2025-12-03 18:09:42', '2025-12-03 18:09:42'),
(59, 78, 1, 3, NULL, 1, 2.00, 100.00, 100.00, 100.00, '2025-12-05 18:07:20', '2025-12-05 18:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item_batches`
--

CREATE TABLE `invoice_item_batches` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_item_id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_item_batches`
--

INSERT INTO `invoice_item_batches` (`id`, `invoice_item_id`, `batch_id`, `quantity`) VALUES
(1, 15, 1, 12),
(2, 16, 1, 240),
(3, 17, 1, 12),
(4, 18, 1, 240),
(5, 19, 1, 240),
(6, 20, 1, 12),
(7, 21, 1, 2),
(8, 22, 1, 2),
(9, 23, 1, 2),
(12, 26, 1, 2),
(19, 33, 1, 10),
(28, 42, 1, 4),
(32, 46, 1, 2),
(33, 47, 1, 8),
(34, 48, 1, 8),
(35, 49, 1, 8),
(36, 50, 1, 8),
(37, 51, 1, 8),
(38, 52, 1, 8),
(39, 53, 1, 10),
(40, 54, 1, 10),
(44, 58, 1, 2),
(45, 59, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"e8cf1369-8b0e-46d1-9d6c-fe420ac53bdf\",\"displayName\":\"Filament\\\\Notifications\\\\DatabaseNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:43:\\\"Filament\\\\Notifications\\\\DatabaseNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";s:10:\\\"persistent\\\";s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:6:\\\"status\\\";N;s:5:\\\"title\\\";s:18:\\\"Saved successfully\\\";s:4:\\\"view\\\";N;s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"117b223e-eb32-49c7-9718-a0ee8482987b\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"},\"createdAt\":1764608643,\"delay\":null}', 0, NULL, 1764608643, 1764608643),
(2, 'default', '{\"uuid\":\"c8b19465-024e-4954-9620-af69a1035577\",\"displayName\":\"Filament\\\\Notifications\\\\DatabaseNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:43:\\\"Filament\\\\Notifications\\\\DatabaseNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";s:10:\\\"persistent\\\";s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:6:\\\"status\\\";N;s:5:\\\"title\\\";s:18:\\\"Saved successfully\\\";s:4:\\\"view\\\";N;s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"073a69d6-a97d-40c8-9fd7-c2e25d2cf283\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"},\"createdAt\":1764608669,\"delay\":null}', 0, NULL, 1764608669, 1764608669),
(3, 'default', '{\"uuid\":\"ebd43c34-5302-47b7-8b8d-e30014f7aa7a\",\"displayName\":\"Filament\\\\Notifications\\\\DatabaseNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:43:\\\"Filament\\\\Notifications\\\\DatabaseNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";s:10:\\\"persistent\\\";s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:6:\\\"status\\\";N;s:5:\\\"title\\\";s:18:\\\"Saved successfully\\\";s:4:\\\"view\\\";N;s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"f2ee5971-6933-4f24-9110-513af724931f\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"},\"createdAt\":1764608670,\"delay\":null}', 0, NULL, 1764608670, 1764608670),
(4, 'default', '{\"uuid\":\"33214072-fa31-43bb-bac8-9e600926871a\",\"displayName\":\"Filament\\\\Notifications\\\\DatabaseNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:43:\\\"Filament\\\\Notifications\\\\DatabaseNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";s:10:\\\"persistent\\\";s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:6:\\\"status\\\";N;s:5:\\\"title\\\";s:18:\\\"Saved successfully\\\";s:4:\\\"view\\\";N;s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"cc59785b-b5b4-43dd-bc8c-98b9be30cfe9\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"},\"createdAt\":1764608676,\"delay\":null}', 0, NULL, 1764608676, 1764608676),
(5, 'default', '{\"uuid\":\"cf7037ab-b357-4b7e-80ea-3b147fb50574\",\"displayName\":\"Filament\\\\Notifications\\\\DatabaseNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:43:\\\"Filament\\\\Notifications\\\\DatabaseNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";s:10:\\\"persistent\\\";s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:6:\\\"status\\\";N;s:5:\\\"title\\\";s:18:\\\"Saved successfully\\\";s:4:\\\"view\\\";N;s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"1916c2ce-f63b-4a55-b00b-20803be35566\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"},\"createdAt\":1764608724,\"delay\":null}', 0, NULL, 1764608724, 1764608724),
(6, 'default', '{\"uuid\":\"816a82d7-f688-41eb-b647-d5a805d39a8c\",\"displayName\":\"Filament\\\\Notifications\\\\DatabaseNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:43:\\\"Filament\\\\Notifications\\\\DatabaseNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";s:10:\\\"persistent\\\";s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:6:\\\"status\\\";N;s:5:\\\"title\\\";s:18:\\\"Saved successfully\\\";s:4:\\\"view\\\";N;s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"f63565cc-5056-4f81-8516-80732cd03480\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"},\"createdAt\":1764608731,\"delay\":null}', 0, NULL, 1764608731, 1764608731);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pharma', '2025-10-26 17:40:24', '2025-10-26 17:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_23_192952_create_suppliers_table', 1),
(5, '2025_10_23_193002_create_manufacturers_table', 1),
(6, '2025_10_23_193106_create_categories_table', 1),
(7, '2025_10_23_193135_create_products_table', 1),
(8, '2025_10_23_193200_create_units_table', 1),
(9, '2025_10_23_193210_create_product_units_table', 1),
(10, '2025_10_23_193240_create_batches_table', 1),
(11, '2025_10_23_193307_create_purchases_table', 1),
(12, '2025_10_23_193327_create_purchase_items_table', 1),
(13, '2025_10_23_193351_create_invoices_table', 1),
(14, '2025_10_23_193410_create_invoice_items_table', 1),
(15, '2025_10_23_193514_create_product_returns_table', 1),
(16, '2025_10_23_193536_create_return_items_table', 1),
(17, '2025_10_23_193615_create_adjustments_table', 1),
(18, '2025_10_23_193643_create_stock_movments_table', 1),
(19, '2025_10_23_193643_create_stock_movements_table', 2),
(20, '2025_10_30_210154_create_invoice_item_batches_table', 2),
(23, '2025_11_28_230855_create_notifications_table', 3),
(24, '2025_11_29_152608_create_permission_tables', 3),
(25, '2025_11_30_143857_create_activity_log_table', 4),
(26, '2025_11_30_143858_add_event_column_to_activity_log_table', 4),
(27, '2025_11_30_143859_add_batch_uuid_column_to_activity_log_table', 4),
(28, '2025_12_02_121839_create_customers_table', 5),
(29, '2025_12_02_232516_create_customer_accounts_table', 6),
(30, '2025_12_02_232555_create_customer_account_transactions_table', 6),
(31, '2025_12_03_212413_create_supplier_accounts_table', 7),
(32, '2025_12_03_212424_create_supplier_account_transactions_table', 7),
(33, '2025_12_08_141431_create_sales_representatives_table', 8),
(43, '2025_12_05_191003_create_examination_departments_table', 9),
(44, '2025_12_05_192108_create_examination_units_table', 9),
(45, '2025_12_05_192109_create_examinations_table', 9),
(46, '2025_12_05_193836_create_examination_prescriptions_table', 9),
(47, '2025_12_05_193932_create_examination_prescription_items_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `message`, `status`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'المنتج يوشك على النفاذ', '', '2025-12-03 09:12:09', '2025-12-02 11:54:16', '2025-12-03 09:12:09'),
(2, 'المنتج التالي قارب على الانتهاء', '', '2025-12-02 16:17:45', NULL, '2025-12-02 16:17:45'),
(3, 'لا توجد كمية كافية في المخزون لهذا المنتج: بندول', '', '2025-12-03 19:46:57', '2025-12-03 18:09:42', '2025-12-03 19:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'create batch', 'اضافة الدفعات', 'web', NULL, NULL),
(2, 'view batch', 'عرض الدفعات', 'web', NULL, NULL),
(3, 'update batch', 'تحديث الدفعات', 'web', NULL, NULL),
(4, 'delete batch', 'حذف الدفعات', 'web', NULL, NULL),
(5, 'create category', 'اضافة الاقسام', 'web', NULL, NULL),
(6, 'view category', 'عرض الاقسام', 'web', NULL, NULL),
(7, 'update category', 'تحديث الاقسام', 'web', NULL, NULL),
(8, 'delete category', 'حذف الاقسام', 'web', NULL, NULL),
(9, 'create invoice', 'اضافة الفواتير', 'web', NULL, NULL),
(10, 'view invoice', 'عرض الفواتير', 'web', NULL, NULL),
(11, 'update invoice', 'تحديث الفواتير', 'web', NULL, NULL),
(12, 'delete invoice', 'حذف الفواتير', 'web', NULL, NULL),
(13, 'create manufacturer', 'اضافة الشركات المصنعة', 'web', NULL, NULL),
(14, 'view manufacturer', 'عرض الشركات المصنعة', 'web', NULL, NULL),
(15, 'update manufacturer', 'تحديث الشركات المصنعة', 'web', NULL, NULL),
(16, 'delete manufacturer', 'حذف الشركات المصنعة', 'web', NULL, NULL),
(17, 'create return', 'اضافة المرتجعات', 'web', NULL, NULL),
(18, 'view return', 'عرض المرتجعات', 'web', NULL, NULL),
(19, 'update return', 'تحديث المرتجعات', 'web', NULL, NULL),
(20, 'delete return', 'حذف المرتجعات', 'web', NULL, NULL),
(21, 'create product', 'اضافة المنتجات', 'web', NULL, NULL),
(22, 'view product', 'عرض المنتجات', 'web', NULL, NULL),
(23, 'update product', 'تحديث المنتجات', 'web', NULL, NULL),
(24, 'delete product', 'حذف المنتجات', 'web', NULL, NULL),
(25, 'create purchase', 'اضافة المشتريات', 'web', NULL, NULL),
(26, 'view purchase', 'عرض المشتريات', 'web', NULL, NULL),
(27, 'update purchase', 'تحديث المشتريات', 'web', NULL, NULL),
(28, 'delete purchase', 'حذف المشتريات', 'web', NULL, NULL),
(29, 'create role', 'اضافة الادوار', 'web', NULL, NULL),
(30, 'view role', 'عرض الادوار', 'web', NULL, NULL),
(31, 'update role', 'تحديث الادوار', 'web', NULL, NULL),
(32, 'delete role', 'حذف الادوار', 'web', NULL, NULL),
(33, 'create supplier', 'اضافة المزودين', 'web', NULL, NULL),
(34, 'view supplier', 'عرض المزودين', 'web', NULL, NULL),
(35, 'update supplier', 'تحديث المزودين', 'web', NULL, NULL),
(36, 'delete supplier', 'حذف المزودين', 'web', NULL, NULL),
(37, 'create unit', 'اضافة الوحدات', 'web', NULL, NULL),
(38, 'view unit', 'عرض الوحدات', 'web', NULL, NULL),
(39, 'update unit', 'تحديث الوحدات', 'web', NULL, NULL),
(40, 'delete unit', 'حذف الوحدات', 'web', NULL, NULL),
(41, 'create user', 'اضافة المستخدمين', 'web', NULL, NULL),
(42, 'view user', 'عرض المستخدمين', 'web', NULL, NULL),
(43, 'update user', 'تحديث المستخدمين', 'web', NULL, NULL),
(44, 'delete user', 'حذف المستخدمين', 'web', NULL, NULL),
(45, 'create customer', 'اضافة العملاء', 'web', NULL, NULL),
(46, 'view customer', 'عرض العملاء', 'web', NULL, NULL),
(47, 'update customer', 'تحديث العملاء', 'web', NULL, NULL),
(48, 'delete customer', 'حذف العملاء', 'web', NULL, NULL),
(49, 'view notification', 'عرض الإشعارات', 'web', NULL, NULL),
(50, 'mark notification unread', 'تمييز الإشعار مقروء', 'web', NULL, NULL),
(51, 'view customer account transaction', 'عرض سجل ديون العملاء', 'web', NULL, NULL),
(52, 'create customer account transaction', 'انشاء سجل دين للعملاء', 'web', NULL, NULL),
(53, 'update customer account transaction', 'تحديث سجل ديون العملاء', 'web', NULL, NULL),
(54, 'delete customer account transaction', 'حذف سجلات ديون العملاء', 'web', NULL, NULL),
(55, 'view sales representative', 'عرض مندوبي المبيعات', 'web', NULL, NULL),
(56, 'create sales representative', 'اضافة مندوبي مبيعات', 'web', NULL, NULL),
(57, 'update sales representative', 'تحديث مندوبي المبيعات', 'web', NULL, NULL),
(58, 'delete sales representative', 'حذف مندوبي المبيعات', 'web', NULL, NULL),
(59, 'view supplier account', 'عرض سجل ديون الموردين', 'web', NULL, NULL),
(60, 'create supplier account', 'اضافة سجل ديون الموردين', 'web', NULL, NULL),
(61, 'update supplier account', 'تحديث سجل ديون الموردين', 'web', NULL, NULL),
(62, 'delete supplier account', 'حذف سجل ديون الموردين', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `manufacturer_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `generic_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reorder_level` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `manufacturer_id`, `name`, `generic_name`, `barcode`, `description`, `reorder_level`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'بندول', 'باراسيتامول', '34565465', NULL, 15, 1, '2025-10-26 15:18:21', '2025-12-08 20:15:34'),
(2, 2, 1, 'دواء الحما', 'Fever', NULL, NULL, 5, 1, '2025-11-29 17:59:59', '2025-12-08 20:20:16');

-- --------------------------------------------------------

--
-- Table structure for table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('invoice','purchase') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `return_date` date NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_returns`
--

INSERT INTO `product_returns` (`id`, `type`, `reference_id`, `total_amount`, `return_date`, `created_by`, `created_at`, `updated_at`) VALUES
(5, 'invoice', 1, 2200.00, '2025-11-13', 1, '2025-11-01 17:46:57', '2025-11-01 17:46:57'),
(6, 'invoice', 1, 2200.00, '2025-11-13', 1, '2025-11-01 17:50:28', '2025-11-01 17:50:28'),
(7, 'invoice', 1, 2200.00, '2025-11-13', 1, '2025-11-01 17:51:21', '2025-11-01 17:51:21'),
(8, 'purchase', 2, 1000.00, '2025-11-25', 1, '2025-11-29 19:03:03', '2025-11-29 19:03:03'),
(10, 'invoice', 30, 1000.00, '2025-11-19', 1, '2025-11-29 19:24:32', '2025-11-29 19:24:32'),
(11, 'invoice', 30, 1000.00, '2025-11-25', 1, '2025-11-29 19:28:00', '2025-11-29 19:28:00'),
(12, 'purchase', 2, 1000.00, '2025-12-03', 1, '2025-11-29 19:29:23', '2025-11-29 19:29:23'),
(14, 'purchase', 5, 1600.00, '2025-12-17', 1, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(15, 'purchase', 7, 10000.00, '2025-12-26', 1, '2025-12-07 19:36:32', '2025-12-07 19:36:32'),
(16, 'invoice', 73, 10000.00, '2025-12-17', 1, '2025-12-08 10:59:59', '2025-12-08 10:59:59'),
(17, 'invoice', 78, 5000.00, '2025-12-11', 1, '2025-12-08 11:03:48', '2025-12-08 11:03:48'),
(19, 'purchase', 11, 1000.00, '2025-12-26', 1, '2025-12-26 13:04:41', '2025-12-26 13:04:41'),
(21, 'purchase', 11, 50000.00, '2026-01-23', 1, '2026-01-23 15:54:13', '2026-01-23 15:54:13'),
(22, 'purchase', 11, 400.00, '2026-01-14', 1, '2026-01-23 16:48:58', '2026-01-23 16:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

CREATE TABLE `product_units` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `conversion_factor` decimal(10,3) NOT NULL,
  `is_base` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_units`
--

INSERT INTO `product_units` (`id`, `product_id`, `unit_id`, `conversion_factor`, `is_base`, `price`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 2.000, 1, 100.00, '2025-10-29 03:44:35', '2025-10-29 03:53:20'),
(4, 1, 3, 12.000, 0, 1200.00, '2025-10-29 03:50:25', '2025-10-29 03:50:25'),
(5, 1, 4, 240.000, 0, 12000.00, '2025-10-29 03:51:19', '2025-10-29 03:51:19'),
(6, 2, 2, 1.000, 1, 100.00, '2025-11-29 18:20:42', '2025-11-29 18:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED DEFAULT NULL,
  `invoice_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_status` enum('paid','unpaid','partial') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `paid` decimal(10,2) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `supplier_id`, `invoice_no`, `total_amount`, `payment_status`, `paid`, `purchase_date`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 1, 'PUR-20251127-00001', 500.00, 'paid', 0.00, '2025-11-27', 1, '2025-11-27 19:14:43', '2025-11-27 19:14:43'),
(4, 1, 'PUR-20251203-00001', 200000.00, 'paid', NULL, '2025-12-26', 1, '2025-12-03 18:59:46', '2025-12-08 10:36:47'),
(5, 1, 'PUR-20251203-00002', 110000.00, 'partial', 0.00, '2026-01-02', 1, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(6, 1, 'PUR-20251203-00003', 100000.00, 'partial', 5000.00, '2025-12-26', 1, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
(7, 1, 'PUR-20251203-00004', 10000.00, 'paid', NULL, '2026-01-07', 1, '2025-12-03 19:11:59', '2025-12-03 19:11:59'),
(8, NULL, 'PUR-20251203-00005', 10000.00, 'unpaid', NULL, '2026-01-03', 1, '2025-12-03 19:13:02', '2025-12-03 19:13:02'),
(9, NULL, 'PUR-20251203-00006', 5000.00, 'paid', NULL, '2026-01-10', 1, '2025-12-03 19:14:02', '2025-12-03 19:14:02'),
(10, NULL, 'PUR-20251203-00007', 10000.00, 'partial', 500.00, '2026-01-07', 1, '2025-12-03 19:14:52', '2025-12-03 19:14:52'),
(11, 1, 'PUR-20251226-00001', 2000.00, 'unpaid', NULL, '2026-01-06', 1, '2025-12-26 13:00:41', '2025-12-26 13:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `batch_id`, `quantity`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 5, 100.00, 500.00, '2025-11-27 19:14:43', '2025-11-27 19:14:43'),
(2, 4, 2, 2, 1000, 200.00, 200000.00, '2025-12-03 18:59:46', '2025-12-03 18:59:46'),
(3, 5, 1, 3, 1000, 50.00, 50000.00, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(4, 5, 2, 2, 1000, 60.00, 60000.00, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(5, 6, 2, 2, 1000, 100.00, 100000.00, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
(6, 7, 1, 1, 100, 100.00, 10000.00, '2025-12-03 19:11:59', '2025-12-03 19:11:59'),
(7, 8, 1, 1, 100, 100.00, 10000.00, '2025-12-03 19:13:02', '2025-12-03 19:13:02'),
(8, 9, 1, 1, 50, 100.00, 5000.00, '2025-12-03 19:14:02', '2025-12-03 19:14:02'),
(9, 10, 1, 1, 100, 100.00, 10000.00, '2025-12-03 19:14:52', '2025-12-03 19:14:52'),
(10, 11, 1, 3, 10, 100.00, 1000.00, '2025-12-26 13:00:41', '2025-12-26 13:00:41'),
(11, 11, 2, 2, 10, 100.00, 1000.00, '2025-12-26 13:00:41', '2025-12-26 13:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `return_items`
--

CREATE TABLE `return_items` (
  `id` bigint UNSIGNED NOT NULL,
  `return_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_items`
--

INSERT INTO `return_items` (`id`, `return_id`, `product_id`, `batch_id`, `quantity`, `reason`, `created_at`, `updated_at`) VALUES
(4, 5, 1, 1, 22, 'لا يوجد', '2025-11-01 17:46:57', '2025-11-01 17:46:57'),
(5, 6, 1, 1, 22, 'لا يوجد', '2025-11-01 17:50:28', '2025-11-01 17:50:28'),
(6, 7, 1, 1, 22, 'لا يوجد', '2025-11-01 17:51:21', '2025-11-01 17:51:21'),
(7, 8, 1, 1, 10, NULL, '2025-11-29 19:03:03', '2025-11-29 19:03:03'),
(8, 10, 1, 1, 10, 'منتهي', '2025-11-29 19:24:32', '2025-11-29 19:24:32'),
(9, 11, 1, 1, 10, NULL, '2025-11-29 19:28:00', '2025-11-29 19:28:00'),
(10, 12, 1, 1, 10, NULL, '2025-11-29 19:29:23', '2025-11-29 19:29:23'),
(12, 14, 1, 3, 10, NULL, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(13, 14, 2, 2, 10, NULL, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(14, 14, 1, 1, 10, NULL, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(15, 15, 1, 3, 100, NULL, '2025-12-07 19:36:32', '2025-12-07 19:36:32'),
(16, 16, 1, 3, 100, 'منتهي', '2025-12-08 10:59:59', '2025-12-08 10:59:59'),
(17, 17, 1, 1, 50, NULL, '2025-12-08 11:03:48', '2025-12-08 11:03:48'),
(19, 19, 1, 3, 10, NULL, '2025-12-26 13:04:41', '2025-12-26 13:04:41'),
(21, 21, 1, 1, 500, 'j', '2026-01-23 15:54:13', '2026-01-23 15:54:13'),
(22, 22, 1, 3, 4, NULL, '2026-01-23 16:48:58', '2026-01-23 16:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'مشرف', 'web', '2025-11-29 16:52:31', '2025-11-29 16:52:31'),
(3, 'مدخل بيانات', 'web', '2025-11-29 16:58:15', '2025-11-29 16:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(5, 2),
(9, 2),
(13, 2),
(17, 2),
(5, 3),
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sales_representatives`
--

CREATE TABLE `sales_representatives` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_representatives`
--

INSERT INTO `sales_representatives` (`id`, `name`, `phone`, `email`, `address`, `supplier_id`, `created_at`, `updated_at`) VALUES
(2, 'محمد حمدي', '77884455', 'dawa@phrma.com', 'عدن الشعب', 1, '2025-12-08 14:54:19', '2025-12-08 14:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vLp1pLP43myXddkqRzVia8rzGzrDcLF1Q0YLFDaj', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiQW5Ibkc1NEcyaWZMWUNjemRINW9HREc0UksyQkpuSVhZdTMxRFYxRiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQ0OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vcHVyY2hhc2UtcmV0dXJucyI7czo1OiJyb3V0ZSI7czo0NzoiZmlsYW1lbnQuYWRtaW4ucmVzb3VyY2VzLnB1cmNoYXNlLXJldHVybnMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkUUJYR0lMWTNUa0h3Zzc1d0czai5CT0pXUzk4bWd1NVh5SmQyMVNTLm5UNG9MSUtOaXpYRU8iO3M6NjoidGFibGVzIjthOjE3OntzOjQwOiI4ZmFjNmViMWNlYzI2ODAzYjNmN2ZiNDQwYTI3MTExYl9jb2x1bW5zIjthOjk6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoiY2F0ZWdvcnkubmFtZSI7czo1OiJsYWJlbCI7czoxMDoi2KfZhNmC2LPZhSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTc6Im1hbnVmYWN0dXJlci5uYW1lIjtzOjU6ImxhYmVsIjtzOjI3OiLYp9mE2LTYsdmD2Kkg2KfZhNmF2LXZhti52KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYp9iz2YUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJnZW5lcmljX25hbWUiO3M6NToibGFiZWwiO3M6MjE6Itin2YTYp9iz2YUg2KfZhNi52KfZhSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NzoiYmFyY29kZSI7czo1OiJsYWJlbCI7czoxNjoi2KfZhNio2KfYsdmD2YjYryI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTM6InJlb3JkZXJfbGV2ZWwiO3M6NToibGFiZWwiO3M6MzI6ItmF2LPYqtmI2Ykg2KXYudin2K/YqSDYp9mE2LfZhNioIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJpc19hY3RpdmUiO3M6NToibGFiZWwiO3M6Njoi2YbYtNi3IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6ODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI5NTQ2NmUwZGY2OWFiNWRiYjY1YWE0YTE4OGE0NjRhNF9jb2x1bW5zIjthOjM6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjEwOiLYp9mE2KfYs9mFIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI3MWUxY2Y4ZGZiNDQzZGIyODUxY2M3MDVjOTU4NWVlNV9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiZGVzY3JpcHRpb24iO3M6NToibGFiZWwiO3M6MTE6IkRlc2NyaXB0aW9uIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoicHJvcGVydGllcyI7czo1OiJsYWJlbCI7czoxMDoiUHJvcGVydGllcyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImNhdXNlci5uYW1lIjtzOjU6ImxhYmVsIjtzOjQ6IlVzZXIiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjI1OiLYqtin2LHZitiuINin2YTYp9i22KfZgdipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiJkY2E1N2QzOWQ1MzQyYjFiNzllNTM4NjQxZDVjYWZjZV9jb2x1bW5zIjthOjk6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoicHJvZHVjdC5uYW1lIjtzOjU6ImxhYmVsIjtzOjEyOiLYp9mE2YXZhtiq2KwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJzdXBwbGllci5uYW1lIjtzOjU6ImxhYmVsIjtzOjEyOiLYp9mE2YXZiNix2K8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjg6ImJhdGNoX25vIjtzOjU6ImxhYmVsIjtzOjE5OiLYsdmC2YUg2KfZhNiv2YHYudipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiZXhwaXJ5X2RhdGUiO3M6NToibGFiZWwiO3M6Mjc6Itiq2KfYsdmK2K4g2KfZhNin2YbYqtmH2KfYoSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjM6InB1cmNoYXNlX3ByaWNlX3Blcl9iYXNlIjtzOjU6ImxhYmVsIjtzOjQ5OiLYs9i52LEg2KfZhNi02LHYp9ihINmE2YTZiNit2K/YqSDYp9mE2KfYs9in2LPZitipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNjoiaW5pdGlhbF9xdWFudGl0eSI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmD2YXZitipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNjoiY3VycmVudF9xdWFudGl0eSI7czo1OiJsYWJlbCI7czoyNzoi2KfZhNmD2YXZitipINin2YTYrdin2YTZitipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6ODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI4YjViYjE4OGY0ZmRhZDhkODM1YjY0ZjdmYTcxZjFlZF9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjEwOiLYp9mE2KfYs9mFIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoic3VwcGxpZXIubmFtZSI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmF2YjYsdivIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJwaG9uZSI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmH2KfYqtmBIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJlbWFpbCI7czo1OiJsYWJlbCI7czo0NDoi2LnZhtmI2KfZhiDYp9mE2KjYsdmK2K8g2KfZhNin2YTZg9iq2LHZiNmG2YoiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6ImI1NmRmMjJiZTQ1OTJiN2IxZWJiNGYzNTIxNmM3OTVlX2NvbHVtbnMiO2E6NTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYp9iz2YUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6InBob25lIjtzOjU6ImxhYmVsIjtzOjEyOiLYp9mE2YfYp9iq2YEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6ImVtYWlsIjtzOjU6ImxhYmVsIjtzOjQ0OiLYudmG2YjYp9mGINin2YTYqNix2YrYryDYp9mE2KfZhNmD2KrYsdmI2YbZiiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiYjg0ZjI3ODc3MDUyMmM3N2ZiYTdiMmQzZDNmNjAwNGNfY29sdW1ucyI7YToyOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTM6InN1cHBsaWVyLm5hbWUiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYp9iz2YUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6ImJhbGFuY2UiO3M6NToibGFiZWwiO3M6MTI6Itin2YTZhdio2YTYuiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiOTlmNDc0NGJkYzc4NmI2MjZiYzhmODdkZjg1ZGUxYjhfY29sdW1ucyI7YTo4OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTM6InN1cHBsaWVyLm5hbWUiO3M6NToibGFiZWwiO3M6MTI6Itin2YTZhdmI2LHYryI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6Imludm9pY2Vfbm8iO3M6NToibGFiZWwiO3M6MjM6Itix2YLZhSDYp9mE2YHYp9iq2YjYsdipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoidG90YWxfYW1vdW50IjtzOjU6ImxhYmVsIjtzOjI5OiLYp9mE2YXYqNmE2Log2KfZhNin2KzZhdin2YTZiiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6InBheW1lbnRfc3RhdHVzIjtzOjU6ImxhYmVsIjtzOjE5OiLYrdin2YTYqSDYp9mE2K/Zgdi5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoicHVyY2hhc2VfZGF0ZSI7czo1OiJsYWJlbCI7czoyMzoi2KrYp9ix2YrYriDYp9mE2LTYsdin2KEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE0OiJjcmVhdGVkQnkubmFtZSI7czo1OiJsYWJlbCI7czoyMjoi2KfZj9i22YrZgSDZhdmGINmC2KjZhCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MjU6Itiq2KfYsdmK2K4g2KfZhNin2LbYp9mB2KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjc7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTk6Itin2ZHYrtixINiq2LnYr9mK2YQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiNTA1NzY3ZTJjOWRmOGU5MDZlZDZjZjgzOWM0NTViMDhfY29sdW1ucyI7YTo0OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTk6InB1cmNoYXNlLmludm9pY2Vfbm8iO3M6NToibGFiZWwiO3M6MjM6Itix2YLZhSDYp9mE2YHYp9iq2YjYsdipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJ0eXBlIjtzOjU6ImxhYmVsIjtzOjEwOiLYp9mE2YbZiNi5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo2OiJhbW91bnQiO3M6NToibGFiZWwiO3M6MTI6Itin2YTZhdio2YTYuiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjU6ImxhYmVsIjtzOjEyOiLZhdmE2KfYrdi42KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6Ijc5ZTNkOWQwZTU2ZjhhNDA3OGYwMjE0NTc0NTk5YzQwX2NvbHVtbnMiO2E6Njp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE5OiJwdXJjaGFzZS5pbnZvaWNlX25vIjtzOjU6ImxhYmVsIjtzOjE5OiLYsdmC2YUg2KfZhNmF2LHYrNi5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoidG90YWxfYW1vdW50IjtzOjU6ImxhYmVsIjtzOjI5OiLYp9mE2YXYqNmE2Log2KfZhNin2KzZhdin2YTZiiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6InJldHVybl9kYXRlIjtzOjU6ImxhYmVsIjtzOjI1OiLYqtin2LHZitiuINin2YTYp9ix2KzYp9i5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoiY3JlYXRlZEJ5Lm5hbWUiO3M6NToibGFiZWwiO3M6MjI6Itin2Y/YttmK2YEg2YXZhiDZgtio2YQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjI1OiLYqtin2LHZitiuINin2YTYp9i22KfZgdipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjE5OiLYp9mR2K7YsSDYqti52K/ZitmEIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6IjA4MTA0MzQ5YzZmYWQ2MzcwN2JhZTc3ZmFkOWUyZTI2X2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJjdXN0b21lcl9uYW1lIjtzOjU6ImxhYmVsIjtzOjE5OiLYp9iz2YUg2KfZhNi52YXZitmEIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxODoiaW52b2ljZS5pbnZvaWNlX25vIjtzOjU6ImxhYmVsIjtzOjIzOiLYsdmC2YUg2KfZhNmB2KfYqtmI2LHYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NjoiYW1vdW50IjtzOjU6ImxhYmVsIjtzOjEyOiLYp9mE2YXYqNmE2LoiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJpbnZvaWNlLm5vdGUiO3M6NToibGFiZWwiO3M6MTI6ItmF2YTYp9it2LjYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiYTI0ZjhlYTE1OTQ0NTQyN2VhYjQ5NGNjYzcwOTdjZDBfY29sdW1ucyI7YTo5OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6Imludm9pY2Vfbm8iO3M6NToibGFiZWwiO3M6MjM6Itix2YLZhSDYp9mE2YHYp9iq2YjYsdipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoidG90YWxfYW1vdW50IjtzOjU6ImxhYmVsIjtzOjI5OiLYp9mE2YXYqNmE2Log2KfZhNin2KzZhdin2YTZiiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6ODoiZGlzY291bnQiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYrti12YUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6InBhaWQiO3M6NToibGFiZWwiO3M6MTQ6Itin2YTZhdiv2YHZiNi5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoicGF5bWVudF9zdGF0dXMiO3M6NToibGFiZWwiO3M6MTk6Itit2KfZhNipINin2YTYr9mB2LkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJpbnZvaWNlX2RhdGUiO3M6NToibGFiZWwiO3M6Mjc6Itiq2KfYsdmK2K4g2KfZhNmB2KfYqtmI2LHYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6ImNyZWF0ZWRCeS5uYW1lIjtzOjU6ImxhYmVsIjtzOjIyOiLYp9mP2LbZitmBINmF2YYg2YLYqNmEIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoyNToi2KrYp9ix2YrYriDYp9mE2KfYttin2YHYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6ODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxOToi2KfZkdiu2LEg2KrYudiv2YrZhCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiJhYWRjNDA5YWZhNzk0YmUzYzI5ZjEzODlkYTUxMTA0ZF9jb2x1bW5zIjthOjY6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoyOiJpZCI7czo1OiJsYWJlbCI7czoxOiIjIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNToic2NpZW50aWZpY19uYW1lIjtzOjU6ImxhYmVsIjtzOjIzOiLYp9mE2KfYs9mFINin2YTYudmE2YXZiiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTI6Im5vcm1hbF9yYXRpbyI7czo1OiJsYWJlbCI7czoyOToi2KfZhNmG2LPYqNipINin2YTYt9io2YrYudmK2KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6InVuaXQubmFtZSI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmI2K3Yr9ipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNToiZGVwYXJ0bWVudC5uYW1lIjtzOjU6ImxhYmVsIjtzOjEwOiLYp9mE2YLYs9mFIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoyNToi2KrYp9ix2YrYriDYp9mE2KXZhti02KfYoSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiYzAxZWZkZTZiYzFhNzQyNDBiNzE5OTgyMmRhYTA4NjlfY29sdW1ucyI7YTo1OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTI6InBhdGllbnRfbmFtZSI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmF2LHZiti2IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czozOiJhZ2UiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYudmF2LEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjY6ImdlbmRlciI7czo1OiJsYWJlbCI7czoxMDoi2KfZhNis2YbYsyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6Iml0ZW1zX2NvdW50IjtzOjU6ImxhYmVsIjtzOjE5OiLYudiv2K8g2KfZhNmB2K3ZiNi1IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo2OiJyYXRpb3MiO3M6NToibGFiZWwiO3M6MTA6Itin2YTZhtiz2KgiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6ImU3NzBhNTVlNjYyYTJjNzkyYTE1OTY2ZDc0YzM0OGViX2NvbHVtbnMiO2E6Njp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE4OiJpbnZvaWNlLmludm9pY2Vfbm8iO3M6NToibGFiZWwiO3M6MjM6Itix2YLZhSDYp9mE2YHYp9iq2YjYsdipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoidG90YWxfYW1vdW50IjtzOjU6ImxhYmVsIjtzOjI5OiLYp9mE2YXYqNmE2Log2KfZhNin2KzZhdin2YTZiiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6InJldHVybl9kYXRlIjtzOjU6ImxhYmVsIjtzOjI1OiLYqtin2LHZitiuINin2YTYp9ix2KzYp9i5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoiY3JlYXRlZEJ5Lm5hbWUiO3M6NToibGFiZWwiO3M6MjI6Itin2Y/YttmK2YEg2YXZhiDZgtio2YQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjI1OiLYqtin2LHZitiuINin2YTYp9i22KfZgdipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjE5OiLYp9mR2K7YsSDYqti52K/ZitmEIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6IjJkOGFjMTIzMWUxYTlhYmU2MDQzYmQyMTZjYWQwYmYyX2NvbHVtbnMiO2E6Mzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6NDoiTmFtZSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiYmI4OGRjN2Q4MDRjNTBkN2I3YWRiY2E1OGE3MTY4MjJfY29sdW1ucyI7YToyOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjoiaWQiO3M6NToibGFiZWwiO3M6MjoiSUQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6MTc6Itin2LPZhSDYp9mE2YLYs9mFIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX19czo4OiJmaWxhbWVudCI7YTowOnt9fQ==', 1769197776);

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint UNSIGNED DEFAULT NULL,
  `movement_type` enum('return','purchase','invoice','adjustment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_type` enum('invoice','purchase','product_return','adjustment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int NOT NULL,
  `direction` enum('in','out') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_movements`
--

INSERT INTO `stock_movements` (`id`, `product_id`, `batch_id`, `movement_type`, `reference_type`, `reference_id`, `quantity`, `direction`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 'invoice', 'invoice', 20, 12, 'out', 1, '2025-10-30 19:39:46', '2025-10-30 19:39:46'),
(5, 1, 1, 'invoice', 'invoice', 21, 240, 'out', 1, '2025-10-30 19:43:20', '2025-10-30 19:43:20'),
(6, 1, 1, 'return', 'product_return', 1, 22, 'in', 1, '2025-11-01 17:46:57', '2025-11-01 17:46:57'),
(7, 1, 1, 'return', 'product_return', 6, 22, 'in', 1, '2025-11-01 17:50:28', '2025-11-01 17:50:28'),
(8, 1, 1, 'return', 'product_return', 7, 22, 'in', 1, '2025-11-01 17:51:21', '2025-11-01 17:51:21'),
(9, 1, 1, 'invoice', 'invoice', 24, 12, 'out', 1, '2025-11-03 04:01:57', '2025-11-03 04:01:57'),
(10, 1, 1, 'invoice', 'invoice', 25, 240, 'out', 1, '2025-11-03 04:03:07', '2025-11-03 04:03:07'),
(11, 1, 1, 'invoice', 'invoice', 28, 240, 'out', 1, '2025-11-03 04:12:22', '2025-11-03 04:12:22'),
(12, 1, 1, 'invoice', 'invoice', 29, 12, 'out', 1, '2025-11-03 04:37:18', '2025-11-03 04:37:18'),
(13, 1, 1, 'purchase', 'purchase', 2, 5, 'in', 1, '2025-11-27 19:14:43', '2025-11-27 19:14:43'),
(14, 1, 1, 'invoice', 'invoice', 30, 2, 'out', 1, '2025-11-29 18:22:08', '2025-11-29 18:22:08'),
(15, 1, 1, 'invoice', 'invoice', 30, 2, 'out', 1, '2025-11-29 18:22:08', '2025-11-29 18:22:08'),
(16, 1, 1, 'return', 'product_return', 8, 10, 'out', 1, '2025-11-29 19:03:03', '2025-11-29 19:03:03'),
(17, 1, 1, 'return', 'product_return', 10, 10, 'in', 1, '2025-11-29 19:24:32', '2025-11-29 19:24:32'),
(18, 1, 1, 'return', 'product_return', 11, 10, 'in', 1, '2025-11-29 19:28:00', '2025-11-29 19:28:00'),
(19, 1, 1, 'return', 'product_return', 12, 10, 'out', 1, '2025-11-29 19:29:23', '2025-11-29 19:29:23'),
(20, 1, 1, 'invoice', 'invoice', 31, 2, 'out', 1, '2025-11-30 19:42:07', '2025-11-30 19:42:07'),
(23, 1, 1, 'invoice', 'invoice', 36, 2, 'out', 1, '2025-12-03 10:58:22', '2025-12-03 10:58:22'),
(30, 1, 1, 'invoice', 'invoice', 43, 10, 'out', 1, '2025-12-03 17:24:18', '2025-12-03 17:24:18'),
(39, 1, 1, 'invoice', 'invoice', 52, 4, 'out', 1, '2025-12-03 17:32:09', '2025-12-03 17:32:09'),
(43, 1, 1, 'invoice', 'invoice', 65, 2, 'out', 1, '2025-12-03 17:44:58', '2025-12-03 17:44:58'),
(44, 1, 1, 'invoice', 'invoice', 66, 8, 'out', 1, '2025-12-03 17:46:15', '2025-12-03 17:46:15'),
(45, 1, 1, 'invoice', 'invoice', 67, 8, 'out', 1, '2025-12-03 17:47:38', '2025-12-03 17:47:38'),
(46, 1, 1, 'invoice', 'invoice', 68, 8, 'out', 1, '2025-12-03 17:50:26', '2025-12-03 17:50:26'),
(47, 1, 1, 'invoice', 'invoice', 69, 8, 'out', 1, '2025-12-03 17:52:54', '2025-12-03 17:52:54'),
(48, 1, 1, 'invoice', 'invoice', 70, 8, 'out', 1, '2025-12-03 17:53:56', '2025-12-03 17:53:56'),
(49, 1, 1, 'invoice', 'invoice', 71, 8, 'out', 1, '2025-12-03 17:55:05', '2025-12-03 17:55:05'),
(50, 1, 1, 'invoice', 'invoice', 72, 10, 'out', 1, '2025-12-03 17:55:39', '2025-12-03 17:55:39'),
(51, 1, 1, 'invoice', 'invoice', 73, 10, 'out', 1, '2025-12-03 17:56:28', '2025-12-03 17:56:28'),
(55, 1, 1, 'invoice', 'invoice', 77, 2, 'out', 1, '2025-12-03 18:09:42', '2025-12-03 18:09:42'),
(56, 2, NULL, 'purchase', 'purchase', 4, 1000, 'in', 1, '2025-12-03 18:59:46', '2025-12-03 18:59:46'),
(57, 1, NULL, 'purchase', 'purchase', 5, 1000, 'in', 1, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(58, 2, 2, 'purchase', 'purchase', 5, 1000, 'in', 1, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(59, 2, 2, 'purchase', 'purchase', 6, 1000, 'in', 1, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
(60, 1, 1, 'purchase', 'purchase', 7, 100, 'in', 1, '2025-12-03 19:11:59', '2025-12-03 19:11:59'),
(61, 1, 1, 'purchase', 'purchase', 8, 100, 'in', 1, '2025-12-03 19:13:02', '2025-12-03 19:13:02'),
(62, 1, 1, 'purchase', 'purchase', 9, 50, 'in', 1, '2025-12-03 19:14:02', '2025-12-03 19:14:02'),
(63, 1, 1, 'purchase', 'purchase', 10, 100, 'in', 1, '2025-12-03 19:14:52', '2025-12-03 19:14:52'),
(64, 1, 3, 'invoice', 'invoice', 78, 2, 'out', 1, '2025-12-05 18:07:20', '2025-12-05 18:07:20'),
(65, 1, 3, 'return', 'product_return', 14, 10, 'out', 1, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(66, 2, 2, 'return', 'product_return', 14, 10, 'out', 1, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(67, 1, 1, 'return', 'product_return', 14, 10, 'out', 1, '2025-12-07 19:22:38', '2025-12-07 19:22:38'),
(68, 1, 3, 'return', 'product_return', 15, 100, 'out', 1, '2025-12-07 19:36:32', '2025-12-07 19:36:32'),
(69, 1, 3, 'return', 'product_return', 16, 100, 'in', 1, '2025-12-08 10:59:59', '2025-12-08 10:59:59'),
(70, 1, 1, 'return', 'product_return', 17, 50, 'in', 1, '2025-12-08 11:03:48', '2025-12-08 11:03:48'),
(71, 1, 3, 'purchase', 'purchase', 11, 10, 'in', 1, '2025-12-26 13:00:41', '2025-12-26 13:00:41'),
(72, 2, 2, 'purchase', 'purchase', 11, 10, 'in', 1, '2025-12-26 13:00:41', '2025-12-26 13:00:41'),
(74, 1, 3, 'return', 'product_return', 19, 10, 'out', 1, '2025-12-26 13:04:41', '2025-12-26 13:04:41'),
(76, 1, 1, 'return', 'product_return', 21, 500, 'out', 1, '2026-01-23 15:54:13', '2026-01-23 15:54:13'),
(77, 1, 3, 'return', 'product_return', 22, 4, 'out', 1, '2026-01-23 16:48:58', '2026-01-23 16:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'شركة ادوية', '77884455', 'dawa@phrma.com', 'القاهرة شارع الادوية', '2025-10-28 12:09:21', '2025-10-28 12:09:21');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_accounts`
--

CREATE TABLE `supplier_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_accounts`
--

INSERT INTO `supplier_accounts` (`id`, `supplier_id`, `balance`, `created_at`, `updated_at`) VALUES
(1, 1, 400.00, '2025-12-03 18:59:46', '2026-01-23 16:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_account_transactions`
--

CREATE TABLE `supplier_account_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_account_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_account_transactions`
--

INSERT INTO `supplier_account_transactions` (`id`, `supplier_account_id`, `type`, `purchase_id`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'debt', 4, 200000.00, NULL, '2025-12-03 18:59:46', '2025-12-03 18:59:46'),
(2, 1, 'debt', 5, 110000.00, NULL, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
(3, 1, 'debt', 6, 95000.00, NULL, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
(4, 1, 'payment', 6, 5000.00, 'تم الدفع', '2025-12-06 18:05:28', '2025-12-06 18:05:28'),
(5, 1, 'payment', 5, 100000.00, 'دفع مئة الف', '2025-12-06 18:24:00', '2025-12-06 18:24:00'),
(6, 1, 'payment', 4, 100000.00, NULL, '2025-12-08 10:34:36', '2025-12-08 10:34:36'),
(8, 1, 'payment', 4, 100000.00, NULL, '2025-12-08 10:36:47', '2025-12-08 10:36:47'),
(9, 1, 'debt', 11, 2000.00, NULL, '2025-12-26 13:00:41', '2025-12-26 13:00:41'),
(10, 1, 'payment', 11, 1000.00, 'مرتجع', '2025-12-26 13:04:41', '2025-12-26 13:04:41'),
(11, 1, 'payment', 11, 500.00, 'jk', '2026-01-23 15:54:50', '2026-01-23 15:54:50'),
(12, 1, 'payment', 11, 400.00, 'مرتجع', '2026-01-23 16:48:58', '2026-01-23 16:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `abbreviation`, `created_at`, `updated_at`) VALUES
(2, 'حبة', 'ح', '2025-10-29 03:36:02', '2025-10-29 03:36:02'),
(3, 'باكت', 'ب', '2025-10-29 03:37:28', '2025-10-29 03:49:56'),
(4, 'كرتون', 'ك', '2025-10-29 03:37:47', '2025-10-29 03:50:04'),
(5, 'حبة', 'ح', '2025-10-29 03:38:06', '2025-10-29 03:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$12$QBXGILY3TkHwg75wG3j.BOJWS98mgu5XyJd21SS.nT4oLIKNizXEO', '8qF0aDPPxMvh6j6iPnjJjiROcaUDS4FXaIHewEcTDPobPMSNJRpPfNH6ljkP', '2025-10-26 15:03:08', '2025-10-26 15:03:08'),
(4, 'محمد سالم', 'mohammed.salem701@gmail.com', NULL, '$2y$12$Lu70xMmGfxdRyXGfHo6llOJJfX/J0OOmL6oUvgh5Nn9Ie/za73Vy6', NULL, '2025-12-01 12:31:32', '2025-12-01 12:31:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustments_product_id_foreign` (`product_id`),
  ADD KEY `adjustments_batch_id_foreign` (`batch_id`),
  ADD KEY `adjustments_created_by_foreign` (`created_by`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batches_product_id_foreign` (`product_id`),
  ADD KEY `batches_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_accounts`
--
ALTER TABLE `customer_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_accounts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_account_transactions`
--
ALTER TABLE `customer_account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_account_transactions_customer_account_id_foreign` (`customer_account_id`),
  ADD KEY `customer_account_transactions_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `examinations`
--
ALTER TABLE `examinations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examinations_department_id_foreign` (`department_id`),
  ADD KEY `examinations_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `examination_departments`
--
ALTER TABLE `examination_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examination_prescriptions`
--
ALTER TABLE `examination_prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examination_prescription_items`
--
ALTER TABLE `examination_prescription_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examination_prescription_id_foreign` (`examination_prescription_id`),
  ADD KEY `examination_prescription_items_examination_id_foreign` (`examination_id`);

--
-- Indexes for table `examination_units`
--
ALTER TABLE `examination_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_no_unique` (`invoice_no`),
  ADD KEY `invoices_created_by_foreign` (`created_by`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_product_id_foreign` (`product_id`),
  ADD KEY `invoice_items_batch_id_foreign` (`batch_id`),
  ADD KEY `FK_invoice_items_units` (`unit_id`);

--
-- Indexes for table `invoice_item_batches`
--
ALTER TABLE `invoice_item_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_item_batches_invoice_item_id_foreign` (`invoice_item_id`),
  ADD KEY `invoice_item_batches_batch_id_foreign` (`batch_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_barcode_unique` (`barcode`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_manufacturer_id_foreign` (`manufacturer_id`);

--
-- Indexes for table `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_returns_created_by_foreign` (`created_by`);

--
-- Indexes for table `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_units_product_id_foreign` (`product_id`),
  ADD KEY `product_units_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchases_created_by_foreign` (`created_by`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_items_product_id_foreign` (`product_id`),
  ADD KEY `purchase_items_batch_id_foreign` (`batch_id`);

--
-- Indexes for table `return_items`
--
ALTER TABLE `return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_items_return_id_foreign` (`return_id`),
  ADD KEY `return_items_product_id_foreign` (`product_id`),
  ADD KEY `return_items_batch_id_foreign` (`batch_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales_representatives`
--
ALTER TABLE `sales_representatives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_representatives_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_movements_product_id_foreign` (`product_id`),
  ADD KEY `stock_movements_batch_id_foreign` (`batch_id`),
  ADD KEY `stock_movements_created_by_foreign` (`created_by`),
  ADD KEY `stock_movements_reference_type_reference_id_index` (`reference_type`,`reference_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_accounts`
--
ALTER TABLE `supplier_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_accounts_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `supplier_account_transactions`
--
ALTER TABLE `supplier_account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_account_transactions_supplier_account_id_foreign` (`supplier_account_id`),
  ADD KEY `supplier_account_transactions_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_accounts`
--
ALTER TABLE `customer_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_account_transactions`
--
ALTER TABLE `customer_account_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `examinations`
--
ALTER TABLE `examinations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `examination_departments`
--
ALTER TABLE `examination_departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `examination_prescriptions`
--
ALTER TABLE `examination_prescriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `examination_prescription_items`
--
ALTER TABLE `examination_prescription_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `examination_units`
--
ALTER TABLE `examination_units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `invoice_item_batches`
--
ALTER TABLE `invoice_item_batches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `return_items`
--
ALTER TABLE `return_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_representatives`
--
ALTER TABLE `sales_representatives`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_accounts`
--
ALTER TABLE `supplier_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_account_transactions`
--
ALTER TABLE `supplier_account_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD CONSTRAINT `adjustments_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adjustments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adjustments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `batches_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `batches_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_accounts`
--
ALTER TABLE `customer_accounts`
  ADD CONSTRAINT `customer_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_account_transactions`
--
ALTER TABLE `customer_account_transactions`
  ADD CONSTRAINT `customer_account_transactions_customer_account_id_foreign` FOREIGN KEY (`customer_account_id`) REFERENCES `customer_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_account_transactions_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `examinations`
--
ALTER TABLE `examinations`
  ADD CONSTRAINT `examinations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `examination_departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `examinations_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `examination_units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `examination_prescription_items`
--
ALTER TABLE `examination_prescription_items`
  ADD CONSTRAINT `examination_prescription_id_foreign` FOREIGN KEY (`examination_prescription_id`) REFERENCES `examination_prescriptions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `examination_prescription_items_examination_id_foreign` FOREIGN KEY (`examination_id`) REFERENCES `examinations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `FK_invoice_items_units` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_item_batches`
--
ALTER TABLE `invoice_item_batches`
  ADD CONSTRAINT `invoice_item_batches_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_item_batches_invoice_item_id_foreign` FOREIGN KEY (`invoice_item_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_returns`
--
ALTER TABLE `product_returns`
  ADD CONSTRAINT `product_returns_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_units`
--
ALTER TABLE `product_units`
  ADD CONSTRAINT `product_units_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_units_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `return_items`
--
ALTER TABLE `return_items`
  ADD CONSTRAINT `return_items_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `return_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `return_items_return_id_foreign` FOREIGN KEY (`return_id`) REFERENCES `product_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_representatives`
--
ALTER TABLE `sales_representatives`
  ADD CONSTRAINT `sales_representatives_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD CONSTRAINT `stock_movements_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `stock_movements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_movements_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_accounts`
--
ALTER TABLE `supplier_accounts`
  ADD CONSTRAINT `supplier_accounts_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supplier_account_transactions`
--
ALTER TABLE `supplier_account_transactions`
  ADD CONSTRAINT `supplier_account_transactions_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supplier_account_transactions_supplier_account_id_foreign` FOREIGN KEY (`supplier_account_id`) REFERENCES `supplier_accounts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
