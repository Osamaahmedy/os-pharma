-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 03, 2026 at 04:13 PM
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
-- Database: `pharma`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'manufacturer', 'إضافة شركة مصنعة جديدة', 'App\\Models\\Manufacturer', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"تكامل فارما\"}}', NULL, '2025-12-13 09:28:40', '2025-12-13 09:28:40'),
(2, 'category', 'إضافة قسم جديد', 'App\\Models\\Category', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"شراب\", \"description\": null}}', NULL, '2025-12-13 09:28:51', '2025-12-13 09:28:51'),
(3, 'supplier', 'إضافة مزود جديد', 'App\\Models\\Supplier', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"علي صلاح\", \"email\": null, \"phone\": null, \"address\": null}}', NULL, '2025-12-13 09:29:11', '2025-12-13 09:29:11'),
(4, 'product', 'إضافة منتج جديد', 'App\\Models\\Product', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"برستا مول\", \"barcode\": \"54548\", \"is_active\": 1, \"description\": null, \"generic_name\": \"par\", \"category.name\": \"شراب\", \"reorder_level\": 0}}', NULL, '2025-12-13 09:30:09', '2025-12-13 09:30:09'),
(5, 'unit', 'إضافة وحدة جديدة', 'App\\Models\\Unit', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"علبة\", \"abbreviation\": \"علبة\"}}', NULL, '2025-12-13 09:30:56', '2025-12-13 09:30:56'),
(6, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2025-12-13\", \"payment_status\": \"unpaid\"}}', NULL, '2025-12-13 09:36:07', '2025-12-13 09:36:07'),
(7, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 4, \"unit_price\": \"44.00\", \"total_price\": \"176.00\"}}', NULL, '2025-12-13 09:36:07', '2025-12-13 09:36:07'),
(8, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 1, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"176.00\"}}', NULL, '2025-12-13 09:36:07', '2025-12-13 09:36:07'),
(9, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2025-12-13\", \"total_amount\": \"0.00\"}}', NULL, '2025-12-13 09:37:27', '2025-12-13 09:37:27'),
(10, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": \"2\", \"quantity\": 2}}', NULL, '2025-12-13 09:37:27', '2025-12-13 09:37:27'),
(11, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 1, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"88.00\"}}', NULL, '2025-12-13 09:37:27', '2025-12-13 09:37:27'),
(12, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2025-12-13\", \"total_amount\": \"0.00\"}}', NULL, '2025-12-13 09:51:22', '2025-12-13 09:51:22'),
(13, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 5}}', NULL, '2025-12-13 09:51:22', '2025-12-13 09:51:22'),
(14, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 2, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"220.00\"}}', NULL, '2025-12-13 09:51:22', '2025-12-13 09:51:22'),
(15, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2025-12-13\", \"payment_status\": \"partial\"}}', NULL, '2025-12-13 09:55:07', '2025-12-13 09:55:07'),
(16, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 454, \"unit_price\": \"55.00\", \"total_price\": \"24970.00\"}}', NULL, '2025-12-13 09:55:07', '2025-12-13 09:55:07'),
(17, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 2, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"24970.00\"}}', NULL, '2025-12-13 09:55:07', '2025-12-13 09:55:07'),
(20, 'unit', 'إضافة وحدة جديدة', 'App\\Models\\Unit', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"درزن\", \"abbreviation\": \"6\"}}', NULL, '2025-12-13 10:00:56', '2025-12-13 10:00:56'),
(27, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"55.00\", \"discount\": \"0.00\", \"invoice_date\": \"2025-12-13\", \"total_amount\": \"0.00\", \"payment_status\": \"partial\"}}', NULL, '2025-12-13 10:09:10', '2025-12-13 10:09:10'),
(28, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"50.00\", \"total_price\": \"50.00\"}}', NULL, '2025-12-13 10:09:10', '2025-12-13 10:09:10'),
(29, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 7, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"50.00\"}}', NULL, '2025-12-13 10:09:10', '2025-12-13 10:09:10'),
(30, 'user', 'إضافة مستخدم جديد', 'App\\Models\\User', 'created', 5, NULL, NULL, '{\"attributes\": {\"name\": \"Admin\", \"email\": \"admin@admin.com\"}}', NULL, '2026-03-07 10:22:53', '2026-03-07 10:22:53'),
(31, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-03-07\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-03-07 10:24:14', '2026-03-07 10:24:14'),
(32, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 65, \"unit_price\": \"50.00\", \"total_price\": \"3250.00\"}}', NULL, '2026-03-07 10:24:14', '2026-03-07 10:24:14'),
(33, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 8, 'App\\Models\\User', 1, '{\"old\": {\"paid\": null, \"total_amount\": 0}, \"attributes\": {\"paid\": \"0.00\", \"total_amount\": \"3250.00\"}}', NULL, '2026-03-07 10:24:14', '2026-03-07 10:24:14'),
(34, 'category', 'إضافة قسم جديد', 'App\\Models\\Category', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"حبه\", \"description\": \"ي\"}}', NULL, '2026-03-07 10:25:11', '2026-03-07 10:25:11'),
(35, 'category', 'تعديل بيانات القسم', 'App\\Models\\Category', 'updated', 2, 'App\\Models\\User', 1, '{\"old\": {\"description\": \"ي\"}, \"attributes\": {\"description\": \"ممم\\n\"}}', NULL, '2026-03-07 10:25:30', '2026-03-07 10:25:30'),
(36, 'manufacturer', 'إضافة شركة مصنعة جديدة', 'App\\Models\\Manufacturer', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"عوض\"}}', NULL, '2026-03-07 10:25:47', '2026-03-07 10:25:47'),
(37, 'manufacturer', 'حذف الشركة المصنعة', 'App\\Models\\Manufacturer', 'deleted', 2, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"عوض\"}}', NULL, '2026-03-07 10:25:52', '2026-03-07 10:25:52'),
(38, 'product', 'إضافة منتج جديد', 'App\\Models\\Product', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Osama Ahmed\", \"barcode\": \"54565\", \"is_active\": 1, \"description\": \"ث\", \"generic_name\": \"ثث\", \"category.name\": \"حبه\", \"reorder_level\": 4}}', NULL, '2026-03-07 10:26:26', '2026-03-07 10:26:26'),
(43, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-03-07\", \"payment_status\": \"partial\"}}', NULL, '2026-03-07 10:32:00', '2026-03-07 10:32:00'),
(44, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 50, \"unit_price\": \"5.00\", \"total_price\": \"250.00\"}}', NULL, '2026-03-07 10:32:00', '2026-03-07 10:32:00'),
(45, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 3, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"250.00\"}}', NULL, '2026-03-07 10:32:00', '2026-03-07 10:32:00'),
(46, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-03-07\", \"payment_status\": \"partial\"}}', NULL, '2026-03-07 10:33:11', '2026-03-07 10:33:11'),
(47, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 50, \"unit_price\": \"5.00\", \"total_price\": \"250.00\"}}', NULL, '2026-03-07 10:33:11', '2026-03-07 10:33:11'),
(48, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 4, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"250.00\"}}', NULL, '2026-03-07 10:33:11', '2026-03-07 10:33:11'),
(51, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"500.00\", \"invoice_date\": \"2026-05-02\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(52, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 70, \"unit_price\": \"50.00\", \"total_price\": \"3500.00\"}}', NULL, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(53, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 10, \"unit_price\": \"55.00\", \"total_price\": \"550.00\"}}', NULL, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(54, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"50.00\", \"total_price\": \"50.00\"}}', NULL, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(55, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"55.00\", \"total_price\": \"55.00\"}}', NULL, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(56, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 14, 'App\\Models\\User', 1, '{\"old\": {\"paid\": null, \"total_amount\": 0}, \"attributes\": {\"paid\": \"0.00\", \"total_amount\": \"4155.00\"}}', NULL, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(57, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 14, 'App\\Models\\User', 1, '{\"old\": {\"paid\": \"0.00\", \"payment_status\": \"unpaid\"}, \"attributes\": {\"paid\": \"50.00\", \"payment_status\": \"partial\"}}', NULL, '2026-05-02 13:38:18', '2026-05-02 13:38:18'),
(58, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 14, 'App\\Models\\User', 1, '{\"old\": {\"paid\": \"50.00\"}, \"attributes\": {\"paid\": \"500.00\"}}', NULL, '2026-05-02 13:38:29', '2026-05-02 13:38:29'),
(59, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"5.00\", \"invoice_date\": \"2026-05-07\", \"total_amount\": \"0.00\", \"payment_status\": \"partial\"}}', NULL, '2026-05-02 13:43:15', '2026-05-02 13:43:15'),
(60, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"55.00\", \"total_price\": \"55.00\"}}', NULL, '2026-05-02 13:43:15', '2026-05-02 13:43:15'),
(61, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"55.00\", \"total_price\": \"55.00\"}}', NULL, '2026-05-02 13:43:15', '2026-05-02 13:43:15'),
(62, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 15, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"110.00\"}}', NULL, '2026-05-02 13:43:15', '2026-05-02 13:43:15'),
(63, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 7, 'App\\Models\\User', 1, '{\"old\": {\"paid\": \"55.00\"}, \"attributes\": {\"paid\": \"555.00\"}}', NULL, '2026-05-02 13:44:18', '2026-05-02 13:44:18'),
(64, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 15, 'App\\Models\\User', 1, '{\"old\": {\"paid\": \"0.00\"}, \"attributes\": {\"paid\": \"4.00\"}}', NULL, '2026-05-02 13:46:27', '2026-05-02 13:46:27'),
(65, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 15, 'App\\Models\\User', 1, '{\"old\": [], \"attributes\": []}', NULL, '2026-05-02 13:48:15', '2026-05-02 13:48:15'),
(66, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"55.00\", \"total_price\": \"55.00\"}}', NULL, '2026-05-02 13:48:15', '2026-05-02 13:48:15'),
(67, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"55.00\", \"total_price\": \"55.00\"}}', NULL, '2026-05-02 13:48:15', '2026-05-02 13:48:15'),
(68, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 15, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": \"110.00\"}, \"attributes\": {\"total_amount\": \"605.00\"}}', NULL, '2026-05-02 14:24:37', '2026-05-02 14:24:37'),
(69, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"555.00\", \"total_price\": \"555.00\"}}', NULL, '2026-05-02 14:24:37', '2026-05-02 14:24:37'),
(70, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"55.00\", \"total_price\": \"55.00\"}}', NULL, '2026-05-02 14:24:37', '2026-05-02 14:24:37'),
(71, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 15, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": \"605.00\"}, \"attributes\": {\"total_amount\": \"1106.00\"}}', NULL, '2026-05-02 14:24:46', '2026-05-02 14:24:46'),
(72, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"555.00\", \"total_price\": \"555.00\"}}', NULL, '2026-05-02 14:24:46', '2026-05-02 14:24:46'),
(73, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"556.00\", \"total_price\": \"556.00\"}}', NULL, '2026-05-02 14:24:46', '2026-05-02 14:24:46'),
(74, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 15, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": \"1106.00\"}, \"attributes\": {\"total_amount\": \"2218.00\"}}', NULL, '2026-05-02 14:25:07', '2026-05-02 14:25:07'),
(75, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"555.00\", \"total_price\": \"555.00\"}}', NULL, '2026-05-02 14:25:07', '2026-05-02 14:25:07'),
(76, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 18, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 3, \"unit_price\": \"556.00\", \"total_price\": \"1668.00\"}}', NULL, '2026-05-02 14:25:07', '2026-05-02 14:25:07'),
(77, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 15, 'App\\Models\\User', 1, '{\"old\": {\"paid\": \"4.00\"}, \"attributes\": {\"paid\": \"4666666.00\"}}', NULL, '2026-05-02 14:25:22', '2026-05-02 14:25:22'),
(78, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"555.00\", \"total_price\": \"555.00\"}}', NULL, '2026-05-02 14:25:22', '2026-05-02 14:25:22'),
(79, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 20, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 3, \"unit_price\": \"556.00\", \"total_price\": \"1668.00\"}}', NULL, '2026-05-02 14:25:22', '2026-05-02 14:25:22'),
(82, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2026-05-02\", \"total_amount\": \"0.00\"}}', NULL, '2026-05-02 14:34:09', '2026-05-02 14:34:09'),
(83, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 1}}', NULL, '2026-05-02 14:34:09', '2026-05-02 14:34:09'),
(84, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 5, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"555.00\"}}', NULL, '2026-05-02 14:34:09', '2026-05-02 14:34:09'),
(85, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2026-05-02\", \"total_amount\": \"0.00\"}}', NULL, '2026-05-02 14:35:33', '2026-05-02 14:35:33'),
(86, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 2}}', NULL, '2026-05-02 14:35:33', '2026-05-02 14:35:33'),
(87, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 6, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"1110.00\"}}', NULL, '2026-05-02 14:35:33', '2026-05-02 14:35:33'),
(88, 'product_return', 'إضافة مرتجع جديد', 'App\\Models\\ProductReturn', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\": {\"return_date\": \"2026-05-07\", \"total_amount\": \"0.00\"}}', NULL, '2026-05-03 05:16:05', '2026-05-03 05:16:05'),
(89, 'returned_item', 'إضافة عنصر جديد', 'App\\Models\\ReturnItem', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\": {\"reason\": null, \"quantity\": 50}}', NULL, '2026-05-03 05:16:05', '2026-05-03 05:16:05'),
(90, 'product_return', 'تعديل بيانات المرتجع', 'App\\Models\\ProductReturn', 'updated', 7, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"250.00\"}}', NULL, '2026-05-03 05:16:05', '2026-05-03 05:16:05'),
(91, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"35.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:20:03', '2026-05-03 05:20:03'),
(92, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:26:08', '2026-05-03 05:26:08'),
(93, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 18, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:26:30', '2026-05-03 05:26:30'),
(94, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"4250.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:27:28', '2026-05-03 05:27:28'),
(95, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 20, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:32:47', '2026-05-03 05:32:47'),
(96, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 21, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"5.00\", \"total_price\": \"5.00\"}}', NULL, '2026-05-03 05:32:47', '2026-05-03 05:32:47'),
(97, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 21, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"200.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:36:47', '2026-05-03 05:36:47'),
(98, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 22, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 40, \"unit_price\": \"5.00\", \"total_price\": \"200.00\"}}', NULL, '2026-05-03 05:36:47', '2026-05-03 05:36:47'),
(99, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 22, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"0.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:37:15', '2026-05-03 05:37:15'),
(100, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 23, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"5.00\", \"total_price\": \"5.00\"}}', NULL, '2026-05-03 05:37:15', '2026-05-03 05:37:15'),
(101, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 23, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"8250.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:37:50', '2026-05-03 05:37:50'),
(102, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 24, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 150, \"unit_price\": \"55.00\", \"total_price\": \"8250.00\"}}', NULL, '2026-05-03 05:37:50', '2026-05-03 05:37:50'),
(103, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 24, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"100.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:39:26', '2026-05-03 05:39:26'),
(104, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 25, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 2, \"unit_price\": \"50.00\", \"total_price\": \"100.00\"}}', NULL, '2026-05-03 05:39:26', '2026-05-03 05:39:26'),
(105, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 25, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"5.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:43:44', '2026-05-03 05:43:44'),
(106, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 26, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"5.00\", \"total_price\": \"5.00\"}}', NULL, '2026-05-03 05:43:44', '2026-05-03 05:43:44'),
(107, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 26, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"5.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:44:02', '2026-05-03 05:44:02'),
(108, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 27, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"5.00\", \"total_price\": \"5.00\"}}', NULL, '2026-05-03 05:44:02', '2026-05-03 05:44:02'),
(109, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 27, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"70.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:44:25', '2026-05-03 05:44:25'),
(110, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 28, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 14, \"unit_price\": \"5.00\", \"total_price\": \"70.00\"}}', NULL, '2026-05-03 05:44:25', '2026-05-03 05:44:25'),
(111, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 28, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"15850.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:51:58', '2026-05-03 05:51:58'),
(112, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 29, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 317, \"unit_price\": \"50.00\", \"total_price\": \"15850.00\"}}', NULL, '2026-05-03 05:51:58', '2026-05-03 05:51:58'),
(113, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-05-03\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:56:18', '2026-05-03 05:56:18'),
(114, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 50, \"unit_price\": \"5.00\", \"total_price\": \"250.00\"}}', NULL, '2026-05-03 05:56:18', '2026-05-03 05:56:18'),
(115, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 5, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"250.00\"}}', NULL, '2026-05-03 05:56:18', '2026-05-03 05:56:18'),
(116, 'purchase', 'إضافة عملية شراء جديدة', 'App\\Models\\Purchase', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"total_amount\": \"0.00\", \"purchase_date\": \"2026-06-05\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:57:20', '2026-05-03 05:57:20'),
(117, 'purchase_item', 'إضافة عنصر مشترى جديد', 'App\\Models\\PurchaseItem', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 50, \"unit_price\": \"5.00\", \"total_price\": \"250.00\"}}', NULL, '2026-05-03 05:57:20', '2026-05-03 05:57:20'),
(118, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 6, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"250.00\"}}', NULL, '2026-05-03 05:57:20', '2026-05-03 05:57:20'),
(119, 'manufacturer', 'إضافة شركة مصنعة جديدة', 'App\\Models\\Manufacturer', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"ش\"}}', NULL, '2026-05-03 05:57:30', '2026-05-03 05:57:30'),
(120, 'invoice', 'إضافة فاتورة جديدة', 'App\\Models\\Invoice', 'created', 29, 'App\\Models\\User', 1, '{\"attributes\": {\"paid\": \"0.00\", \"discount\": \"0.00\", \"invoice_date\": \"2026-05-03\", \"total_amount\": \"80.00\", \"payment_status\": \"unpaid\"}}', NULL, '2026-05-03 05:58:46', '2026-05-03 05:58:46'),
(121, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 30, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 05:58:46', '2026-05-03 05:58:46'),
(122, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 31, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"5.00\", \"total_price\": \"5.00\"}}', NULL, '2026-05-03 05:58:46', '2026-05-03 05:58:46'),
(123, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 32, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"50.00\", \"total_price\": \"50.00\"}}', NULL, '2026-05-03 05:58:46', '2026-05-03 05:58:46'),
(124, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": \"80.00\"}, \"attributes\": {\"total_amount\": \"850.00\"}}', NULL, '2026-05-03 05:59:00', '2026-05-03 05:59:00'),
(125, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 33, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 05:59:00', '2026-05-03 05:59:00'),
(126, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 34, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 155, \"unit_price\": \"5.00\", \"total_price\": \"775.00\"}}', NULL, '2026-05-03 05:59:00', '2026-05-03 05:59:00'),
(127, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 35, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"50.00\", \"total_price\": \"50.00\"}}', NULL, '2026-05-03 05:59:00', '2026-05-03 05:59:00'),
(128, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": [], \"attributes\": []}', NULL, '2026-05-03 05:59:01', '2026-05-03 05:59:01'),
(129, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 36, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 05:59:01', '2026-05-03 05:59:01'),
(130, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 37, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 155, \"unit_price\": \"5.00\", \"total_price\": \"775.00\"}}', NULL, '2026-05-03 05:59:01', '2026-05-03 05:59:01'),
(131, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 38, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1, \"unit_price\": \"50.00\", \"total_price\": \"50.00\"}}', NULL, '2026-05-03 05:59:01', '2026-05-03 05:59:01'),
(132, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": \"850.00\"}, \"attributes\": {\"total_amount\": \"8050.00\"}}', NULL, '2026-05-03 06:00:47', '2026-05-03 06:00:47'),
(133, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 39, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 06:00:47', '2026-05-03 06:00:47'),
(134, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 40, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 155, \"unit_price\": \"5.00\", \"total_price\": \"775.00\"}}', NULL, '2026-05-03 06:00:47', '2026-05-03 06:00:47'),
(135, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 41, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 145, \"unit_price\": \"50.00\", \"total_price\": \"7250.00\"}}', NULL, '2026-05-03 06:00:47', '2026-05-03 06:00:47'),
(136, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": [], \"attributes\": []}', NULL, '2026-05-03 06:00:49', '2026-05-03 06:00:49'),
(137, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 42, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 06:00:49', '2026-05-03 06:00:49'),
(138, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 43, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 155, \"unit_price\": \"5.00\", \"total_price\": \"775.00\"}}', NULL, '2026-05-03 06:00:49', '2026-05-03 06:00:49'),
(139, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 44, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 145, \"unit_price\": \"50.00\", \"total_price\": \"7250.00\"}}', NULL, '2026-05-03 06:00:49', '2026-05-03 06:00:49'),
(140, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": \"8050.00\"}, \"attributes\": {\"total_amount\": \"73550.00\"}}', NULL, '2026-05-03 06:01:12', '2026-05-03 06:01:12'),
(141, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 45, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 06:01:12', '2026-05-03 06:01:12'),
(142, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 46, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 155, \"unit_price\": \"5.00\", \"total_price\": \"775.00\"}}', NULL, '2026-05-03 06:01:13', '2026-05-03 06:01:13'),
(143, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 47, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1455, \"unit_price\": \"50.00\", \"total_price\": \"72750.00\"}}', NULL, '2026-05-03 06:01:13', '2026-05-03 06:01:13'),
(144, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": \"73550.00\"}, \"attributes\": {\"total_amount\": \"80555.00\"}}', NULL, '2026-05-03 06:01:49', '2026-05-03 06:01:49'),
(145, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 48, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 06:01:49', '2026-05-03 06:01:49'),
(146, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 49, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1556, \"unit_price\": \"5.00\", \"total_price\": \"7780.00\"}}', NULL, '2026-05-03 06:01:49', '2026-05-03 06:01:49'),
(147, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 50, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1455, \"unit_price\": \"50.00\", \"total_price\": \"72750.00\"}}', NULL, '2026-05-03 06:01:49', '2026-05-03 06:01:49'),
(148, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": [], \"attributes\": []}', NULL, '2026-05-03 06:01:51', '2026-05-03 06:01:51'),
(149, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 51, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 06:01:51', '2026-05-03 06:01:51'),
(150, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 52, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1556, \"unit_price\": \"5.00\", \"total_price\": \"7780.00\"}}', NULL, '2026-05-03 06:01:51', '2026-05-03 06:01:51'),
(151, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 53, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1455, \"unit_price\": \"50.00\", \"total_price\": \"72750.00\"}}', NULL, '2026-05-03 06:01:51', '2026-05-03 06:01:51'),
(152, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": \"80555.00\"}, \"attributes\": {\"total_amount\": \"2580555.00\"}}', NULL, '2026-05-03 06:03:47', '2026-05-03 06:03:47'),
(153, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 54, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 06:03:47', '2026-05-03 06:03:47'),
(154, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 55, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1556, \"unit_price\": \"5.00\", \"total_price\": \"7780.00\"}}', NULL, '2026-05-03 06:03:47', '2026-05-03 06:03:47'),
(155, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 56, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 51455, \"unit_price\": \"50.00\", \"total_price\": \"2572750.00\"}}', NULL, '2026-05-03 06:03:47', '2026-05-03 06:03:47'),
(156, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": [], \"attributes\": []}', NULL, '2026-05-03 06:03:48', '2026-05-03 06:03:48'),
(157, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 57, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 06:03:48', '2026-05-03 06:03:48'),
(158, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 58, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 1556, \"unit_price\": \"5.00\", \"total_price\": \"7780.00\"}}', NULL, '2026-05-03 06:03:48', '2026-05-03 06:03:48'),
(159, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 59, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 51455, \"unit_price\": \"50.00\", \"total_price\": \"2572750.00\"}}', NULL, '2026-05-03 06:03:48', '2026-05-03 06:03:48'),
(160, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": {\"total_amount\": \"2580555.00\"}, \"attributes\": {\"total_amount\": \"2650055.00\"}}', NULL, '2026-05-03 06:03:55', '2026-05-03 06:03:55'),
(161, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 60, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 06:03:55', '2026-05-03 06:03:55'),
(162, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 61, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 15456, \"unit_price\": \"5.00\", \"total_price\": \"77280.00\"}}', NULL, '2026-05-03 06:03:55', '2026-05-03 06:03:55'),
(163, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 62, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 51455, \"unit_price\": \"50.00\", \"total_price\": \"2572750.00\"}}', NULL, '2026-05-03 06:03:55', '2026-05-03 06:03:55'),
(164, 'invoice', 'تعديل بيانات الفاتورة', 'App\\Models\\Invoice', 'updated', 29, 'App\\Models\\User', 1, '{\"old\": [], \"attributes\": []}', NULL, '2026-05-03 06:03:56', '2026-05-03 06:03:56'),
(165, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 63, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 5, \"unit_price\": \"5.00\", \"total_price\": \"25.00\"}}', NULL, '2026-05-03 06:03:56', '2026-05-03 06:03:56'),
(166, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 64, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 15456, \"unit_price\": \"5.00\", \"total_price\": \"77280.00\"}}', NULL, '2026-05-03 06:03:56', '2026-05-03 06:03:56'),
(167, 'invoice_item', 'إضافة عنصر فاتورة جديد', 'App\\Models\\InvoiceItem', 'created', 65, 'App\\Models\\User', 1, '{\"attributes\": {\"quantity\": 51455, \"unit_price\": \"50.00\", \"total_price\": \"2572750.00\"}}', NULL, '2026-05-03 06:03:56', '2026-05-03 06:03:56'),
(168, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 4, 'App\\Models\\User', 1, '{\"old\": {\"payment_status\": \"partial\"}, \"attributes\": {\"payment_status\": \"paid\"}}', NULL, '2026-05-03 06:04:35', '2026-05-03 06:04:35'),
(169, 'purchase', 'تعديل بيانات عملية الشراء', 'App\\Models\\Purchase', 'updated', 5, 'App\\Models\\User', 1, '{\"old\": {\"payment_status\": \"unpaid\"}, \"attributes\": {\"payment_status\": \"paid\"}}', NULL, '2026-05-03 06:04:53', '2026-05-03 06:04:53');

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
  `reason` text COLLATE utf8mb4_unicode_ci,
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
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `purchase_price_per_base` decimal(10,2) NOT NULL,
  `sale_price_per_base` decimal(10,2) DEFAULT NULL,
  `initial_quantity` int NOT NULL,
  `current_quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `product_id`, `supplier_id`, `batch_no`, `expiry_date`, `purchase_price_per_base`, `sale_price_per_base`, `initial_quantity`, `current_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'BATCH-693D5DB7365BD', '2025-12-13', 44.00, NULL, 4, 0, '2025-12-13 09:36:07', '2025-12-13 09:51:22'),
(2, 1, 1, 'BATCH-693D622BA390F', '2025-12-04', 55.00, NULL, 454, 0, '2025-12-13 09:55:07', '2026-05-03 05:51:58'),
(3, 2, 1, 'BATCH-69AC28D0BEAE2', '2026-03-07', 5.00, NULL, 100, 0, '2026-03-07 10:32:00', '2026-05-03 06:03:56'),
(4, 2, 1, 'BATCH-69F70DB2913D8', '2026-03-07', 5.00, NULL, 50, 44, '2026-05-03 05:56:18', '2026-05-03 05:58:46'),
(5, 1, NULL, 'BATCH-69F70DF045F03', '2026-03-07', 5.00, NULL, 50, 49, '2026-05-03 05:57:20', '2026-05-03 06:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:1;', 1777795834),
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1777795834;', 1777795834),
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:0:{}s:11:\"permissions\";a:0:{}s:5:\"roles\";a:0:{}}', 1777822959);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'شراب', NULL, '2025-12-13 09:28:51', '2025-12-13 09:28:51'),
(2, 'حبه', 'ممم\n', '2026-03-07 10:25:11', '2026-03-07 10:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `customer_account_transactions`
--

CREATE TABLE `customer_account_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_account_id` bigint UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_account_transactions`
--

INSERT INTO `customer_account_transactions` (`id`, `customer_account_id`, `customer_name`, `type`, `invoice_id`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(2, NULL, 'اسامه', 'debt', 8, 50.00, NULL, '2026-03-07 10:24:14', '2026-03-07 10:28:50'),
(3, NULL, 'r', 'debt', 14, 3600.00, NULL, '2026-05-02 13:34:55', '2026-05-02 14:37:03'),
(4, NULL, 'و', 'debt', 15, 105.00, NULL, '2026-05-02 13:43:15', '2026-05-02 13:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `examinations`
--

CREATE TABLE `examinations` (
  `id` bigint UNSIGNED NOT NULL,
  `scientific_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `normal_ratio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_departments`
--

CREATE TABLE `examination_departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_prescriptions`
--

CREATE TABLE `examination_prescriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `patient_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_prescription_items`
--

CREATE TABLE `examination_prescription_items` (
  `id` bigint UNSIGNED NOT NULL,
  `examination_prescription_id` bigint UNSIGNED NOT NULL,
  `examination_id` bigint UNSIGNED NOT NULL,
  `patient_ratio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_units`
--

CREATE TABLE `examination_units` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `invoice_date` date NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_no`, `total_amount`, `discount`, `paid`, `payment_status`, `invoice_date`, `customer_name`, `note`, `created_by`, `created_at`, `updated_at`) VALUES
(7, 'INV-20251213-00001', 50.00, 0.00, 555.00, 'partial', '2025-12-13', 'اسامه', NULL, 1, '2025-12-13 10:09:10', '2026-05-02 13:44:18'),
(8, 'INV-20260307-00001', 3250.00, 0.00, 0.00, 'unpaid', '2026-03-07', 'اسامه', '5', 1, '2026-03-07 10:24:14', '2026-03-07 10:24:14'),
(14, 'INV-20260502-00001', 4155.00, 500.00, 500.00, 'partial', '2026-05-02', 'r', 'wd', 1, '2026-05-02 13:34:55', '2026-05-02 13:38:29'),
(15, 'INV-20260502-00002', 2218.00, 5.00, 4666666.00, 'partial', '2026-05-07', 'و', 'ن', 1, '2026-05-02 13:43:15', '2026-05-02 14:25:22'),
(16, 'INV-2026-05-0003', 35.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:20:03', '2026-05-03 05:20:03'),
(17, 'INV-2026-00017', 0.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:26:08', '2026-05-03 05:26:08'),
(18, 'INV-2026-00018', 0.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:26:30', '2026-05-03 05:26:30'),
(19, 'INV-2026-00019', 4250.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:27:28', '2026-05-03 05:27:28'),
(20, 'INV-2026-00020', 0.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:32:47', '2026-05-03 05:32:47'),
(21, 'INV-2026-00021', 200.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:36:47', '2026-05-03 05:36:47'),
(22, 'INV-2026-00022', 0.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:37:15', '2026-05-03 05:37:15'),
(23, 'INV-2026-00023', 8250.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:37:50', '2026-05-03 05:37:50'),
(24, 'INV-2026-00024', 100.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:39:26', '2026-05-03 05:39:26'),
(25, 'INV-2026-00025', 5.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:43:44', '2026-05-03 05:43:44'),
(26, 'INV-2026-00026', 5.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:44:02', '2026-05-03 05:44:02'),
(27, 'INV-2026-00027', 70.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:44:25', '2026-05-03 05:44:25'),
(28, 'INV-2026-00028', 15850.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:51:58', '2026-05-03 05:51:58'),
(29, 'INV-2026-00029', 2650055.00, 0.00, 0.00, 'unpaid', '2026-05-03', NULL, NULL, 1, '2026-05-03 05:58:46', '2026-05-03 06:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `quantity_base` int NOT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `product_id`, `unit_id`, `quantity`, `quantity_base`, `unit_price`, `base_price`, `total_price`, `created_at`, `updated_at`) VALUES
(2, 8, 1, 1, 65, 65, 50.00, NULL, 3250.00, '2026-03-07 10:24:14', '2026-03-07 10:24:14'),
(19, 15, 2, 4, 1, 12, 555.00, 5.00, 555.00, '2026-05-02 14:25:22', '2026-05-02 14:25:22'),
(20, 15, 2, 4, 3, 12, 556.00, 5.00, 1668.00, '2026-05-02 14:25:22', '2026-05-02 14:25:22'),
(21, 20, 2, 3, 1, 0, 5.00, 5.00, 5.00, '2026-05-03 05:32:47', '2026-05-03 05:32:47'),
(22, 21, 2, 3, 40, 0, 5.00, 5.00, 200.00, '2026-05-03 05:36:47', '2026-05-03 05:36:47'),
(23, 22, 2, 3, 1, 0, 5.00, 5.00, 5.00, '2026-05-03 05:37:15', '2026-05-03 05:37:15'),
(24, 23, 2, 4, 150, 0, 55.00, 5.00, 8250.00, '2026-05-03 05:37:50', '2026-05-03 05:37:50'),
(25, 24, 1, 1, 2, 0, 50.00, 0.00, 100.00, '2026-05-03 05:39:26', '2026-05-03 05:39:26'),
(26, 25, 2, 3, 1, 0, 5.00, 5.00, 5.00, '2026-05-03 05:43:44', '2026-05-03 05:43:44'),
(27, 26, 2, 3, 1, 0, 5.00, 5.00, 5.00, '2026-05-03 05:44:02', '2026-05-03 05:44:02'),
(28, 27, 2, 3, 14, 0, 5.00, 5.00, 70.00, '2026-05-03 05:44:25', '2026-05-03 05:44:25'),
(29, 28, 1, 1, 317, 317, 50.00, 0.00, 15850.00, '2026-05-03 05:51:58', '2026-05-03 05:51:58'),
(63, 29, 2, 3, 5, 5, 5.00, 5.00, 25.00, '2026-05-03 06:03:56', '2026-05-03 06:03:56'),
(64, 29, 2, 3, 15456, 1, 5.00, 5.00, 77280.00, '2026-05-03 06:03:56', '2026-05-03 06:03:56'),
(65, 29, 1, 1, 51455, 1, 50.00, 0.00, 2572750.00, '2026-05-03 06:03:56', '2026-05-03 06:03:56');

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
(2, 2, 2, 65);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'تكامل فارما', '2025-12-13 09:28:40', '2025-12-13 09:28:40'),
(3, 'ش', '2026-05-03 05:57:30', '2026-05-03 05:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(18, '2025_10_23_193643_create_stock_movements_table', 1),
(19, '2025_10_30_210154_create_invoice_item_batches_table', 1),
(20, '2025_11_28_230855_create_notifications_table', 1),
(21, '2025_11_29_152608_create_permission_tables', 1),
(22, '2025_11_30_143857_create_activity_log_table', 1),
(23, '2025_11_30_143858_add_event_column_to_activity_log_table', 1),
(24, '2025_11_30_143859_add_batch_uuid_column_to_activity_log_table', 1),
(25, '2025_12_02_121839_create_customers_table', 1),
(26, '2025_12_02_232516_create_customer_accounts_table', 1),
(27, '2025_12_02_232555_create_customer_account_transactions_table', 1),
(28, '2025_12_03_212413_create_supplier_accounts_table', 1),
(29, '2025_12_03_212424_create_supplier_account_transactions_table', 1),
(30, '2025_12_05_191003_create_examination_departments_table', 1),
(31, '2025_12_05_192108_create_examination_units_table', 1),
(32, '2025_12_05_192109_create_examinations_table', 1),
(33, '2025_12_05_193836_create_examination_prescriptions_table', 1),
(34, '2025_12_05_193932_create_examination_prescription_items_table', 1),
(35, '2025_12_08_141431_create_sales_representatives_table', 1),
(36, '2025_12_13_123502_add_conversion_factor_to_product_units', 2),
(37, '2025_12_13_124720_fix_product_units_conversion', 3),
(38, '2026_05_02_162901_remove_unique_from_invoice_items', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `manufacturer_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generic_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `reorder_level` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `manufacturer_id`, `name`, `generic_name`, `barcode`, `description`, `reorder_level`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'برستا مول', 'par', '54548', NULL, 0, 1, '2025-12-13 09:30:09', '2025-12-13 09:30:09'),
(2, 2, 1, 'Osama Ahmed', 'ثث', '54565', 'ث', 4, 1, '2026-03-07 10:26:26', '2026-03-07 10:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('invoice','purchase') COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'purchase', 1, 88.00, '2025-12-13', 1, '2025-12-13 09:37:27', '2025-12-13 09:37:27'),
(2, 'purchase', 1, 220.00, '2025-12-13', 1, '2025-12-13 09:51:21', '2025-12-13 09:51:22'),
(5, 'invoice', 15, 555.00, '2026-05-02', 1, '2026-05-02 14:34:09', '2026-05-02 14:34:09'),
(6, 'invoice', 15, 1110.00, '2026-05-02', 1, '2026-05-02 14:35:33', '2026-05-02 14:35:33'),
(7, 'purchase', 4, 250.00, '2026-05-07', 1, '2026-05-03 05:16:05', '2026-05-03 05:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

CREATE TABLE `product_units` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `unit_id` bigint UNSIGNED NOT NULL,
  `is_base` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `conversion_factor` decimal(10,4) NOT NULL DEFAULT '1.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_units`
--

INSERT INTO `product_units` (`id`, `product_id`, `unit_id`, `is_base`, `price`, `created_at`, `updated_at`, `conversion_factor`) VALUES
(1, 1, 1, 0, 50.00, '2025-12-13 09:48:11', '2025-12-13 09:48:11', 1.0000),
(2, 1, 2, 0, 600.00, '2025-12-13 10:01:46', '2025-12-13 10:01:46', 12.0000),
(3, 2, 1, 1, 5.00, '2026-03-07 10:27:49', '2026-03-07 10:27:49', 1.0000),
(4, 2, 2, 0, 55.00, '2026-03-07 10:28:23', '2026-03-07 10:28:23', 12.0000);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED DEFAULT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
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
(1, 1, 'PUR-20251213-00001', 176.00, 'unpaid', NULL, '2025-12-13', 1, '2025-12-13 09:36:07', '2025-12-13 09:36:07'),
(2, 1, 'PUR-20251213-00002', 24970.00, 'partial', 100.00, '2025-12-13', 1, '2025-12-13 09:55:07', '2025-12-13 09:55:07'),
(3, 1, 'PUR-20260307-00001', 250.00, 'partial', 0.00, '2026-03-07', 1, '2026-03-07 10:32:00', '2026-03-07 10:32:00'),
(4, 1, 'PUR-20260307-00002', 250.00, 'paid', 50.00, '2026-03-07', 1, '2026-03-07 10:33:11', '2026-05-03 06:04:35'),
(5, 1, 'PUR-20260503-00001', 250.00, 'paid', NULL, '2026-05-03', 1, '2026-05-03 05:56:18', '2026-05-03 06:04:53'),
(6, NULL, 'PUR-20260503-00002', 250.00, 'unpaid', NULL, '2026-06-05', 1, '2026-05-03 05:57:20', '2026-05-03 05:57:20');

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
(1, 1, 1, 1, 4, 44.00, 176.00, '2025-12-13 09:36:07', '2025-12-13 09:36:07'),
(2, 2, 1, 2, 454, 55.00, 24970.00, '2025-12-13 09:55:07', '2025-12-13 09:55:07'),
(3, 3, 2, 3, 50, 5.00, 250.00, '2026-03-07 10:32:00', '2026-03-07 10:32:00'),
(4, 4, 2, 3, 50, 5.00, 250.00, '2026-03-07 10:33:11', '2026-03-07 10:33:11'),
(5, 5, 2, 4, 50, 5.00, 250.00, '2026-05-03 05:56:18', '2026-05-03 05:56:18'),
(6, 6, 1, 5, 50, 5.00, 250.00, '2026-05-03 05:57:20', '2026-05-03 05:57:20');

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
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_items`
--

INSERT INTO `return_items` (`id`, `return_id`, `product_id`, `batch_id`, `quantity`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, '2', '2025-12-13 09:37:27', '2025-12-13 09:37:27'),
(2, 2, 1, 1, 5, NULL, '2025-12-13 09:51:22', '2025-12-13 09:51:22'),
(5, 5, 2, 3, 1, NULL, '2026-05-02 14:34:09', '2026-05-02 14:34:09'),
(6, 6, 2, 3, 2, NULL, '2026-05-02 14:35:33', '2026-05-02 14:35:33'),
(7, 7, 2, 3, 50, NULL, '2026-05-03 05:16:05', '2026-05-03 05:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_representatives`
--

CREATE TABLE `sales_representatives` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vJ1u2LMTmNNSYb3cX6xzLqpgvWasmTNMVIrzryKJ', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiTzBJZHVYRmRlemF1Yms4c0tWOURGcUhidWdnU3YxY0Vla3hxcktxNyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQyOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vcHVyY2hhc2UtZGVidHMiO3M6NToicm91dGUiO3M6NDU6ImZpbGFtZW50LmFkbWluLnJlc291cmNlcy5wdXJjaGFzZS1kZWJ0cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRRQlhHSUxZM1RrSHdnNzV3RzNqLkJPSldTOThtZ3U1WHlKZDIxU1MublQ0b0xJS05pelhFTyI7czo2OiJ0YWJsZXMiO2E6MTQ6e3M6NDA6IjcxZTFjZjhkZmI0NDNkYjI4NTFjYzcwNWM5NTg1ZWU1X2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJkZXNjcmlwdGlvbiI7czo1OiJsYWJlbCI7czoxMToiRGVzY3JpcHRpb24iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJwcm9wZXJ0aWVzIjtzOjU6ImxhYmVsIjtzOjEwOiJQcm9wZXJ0aWVzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiY2F1c2VyLm5hbWUiO3M6NToibGFiZWwiO3M6NDoiVXNlciI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MjU6Itiq2KfYsdmK2K4g2KfZhNin2LbYp9mB2KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6ImRjYTU3ZDM5ZDUzNDJiMWI3OWU1Mzg2NDFkNWNhZmNlX2NvbHVtbnMiO2E6OTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJwcm9kdWN0Lm5hbWUiO3M6NToibGFiZWwiO3M6MTI6Itin2YTZhdmG2KrYrCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTM6InN1cHBsaWVyLm5hbWUiO3M6NToibGFiZWwiO3M6MTI6Itin2YTZhdmI2LHYryI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6ODoiYmF0Y2hfbm8iO3M6NToibGFiZWwiO3M6MTk6Itix2YLZhSDYp9mE2K/Zgdi52KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJleHBpcnlfZGF0ZSI7czo1OiJsYWJlbCI7czoyNzoi2KrYp9ix2YrYriDYp9mE2KfZhtiq2YfYp9ihIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoyMzoicHVyY2hhc2VfcHJpY2VfcGVyX2Jhc2UiO3M6NToibGFiZWwiO3M6NDk6Itiz2LnYsSDYp9mE2LTYsdin2KEg2YTZhNmI2K3Yr9ipINin2YTYp9iz2KfYs9mK2KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE2OiJpbml0aWFsX3F1YW50aXR5IjtzOjU6ImxhYmVsIjtzOjEyOiLYp9mE2YPZhdmK2KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo2O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE2OiJjdXJyZW50X3F1YW50aXR5IjtzOjU6ImxhYmVsIjtzOjI3OiLYp9mE2YPZhdmK2Kkg2KfZhNit2KfZhNmK2KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo3O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTo4O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6IjM1MzYzZDZlNTc0ODcxMzI4YjUyMzJkNDVkMGI4MGU5X2NvbHVtbnMiO2E6Mzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYp9iz2YUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6Ijk1NDY2ZTBkZjY5YWI1ZGJiNjVhYTRhMTg4YTQ2NGE0X2NvbHVtbnMiO2E6Mzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYp9iz2YUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJVcGRhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6Ijc2NzZmZTkyYjQ2Mzk2NjEwOWUyYTZiNzQxNzRhMmFhX2NvbHVtbnMiO2E6Mzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6Im1lc3NhZ2UiO3M6NToibGFiZWwiO3M6MTQ6Itin2YTYsdiz2KfZhNipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJyZWFkX2F0IjtzOjU6ImxhYmVsIjtzOjI1OiLYqtin2LHZitiuINin2YTZgtix2KfYodipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoyNToi2KrYp9ix2YrYriDYp9mE2KfYttin2YHYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiMzUzMzZhODA4Nzc4ODM0Zjg5NDE3NDcxMTJjMjY0M2VfY29sdW1ucyI7YToyOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czoxMDoi2KfZhNin2LPZhSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjQ6InBlcm1pc3Npb25zLmRpc3BsYXlfbmFtZSI7czo1OiJsYWJlbCI7czoxODoi2KfZhNi12YTYp9it2YrYp9iqIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiI4ZmFjNmViMWNlYzI2ODAzYjNmN2ZiNDQwYTI3MTExYl9jb2x1bW5zIjthOjk6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoiY2F0ZWdvcnkubmFtZSI7czo1OiJsYWJlbCI7czoxMDoi2KfZhNmC2LPZhSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTc6Im1hbnVmYWN0dXJlci5uYW1lIjtzOjU6ImxhYmVsIjtzOjI3OiLYp9mE2LTYsdmD2Kkg2KfZhNmF2LXZhti52KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYp9iz2YUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJnZW5lcmljX25hbWUiO3M6NToibGFiZWwiO3M6MjE6Itin2YTYp9iz2YUg2KfZhNi52KfZhSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NzoiYmFyY29kZSI7czo1OiJsYWJlbCI7czoxNjoi2KfZhNio2KfYsdmD2YjYryI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTM6InJlb3JkZXJfbGV2ZWwiO3M6NToibGFiZWwiO3M6MzI6ItmF2LPYqtmI2Ykg2KXYudin2K/YqSDYp9mE2LfZhNioIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJpc19hY3RpdmUiO3M6NToibGFiZWwiO3M6Njoi2YbYtNi3IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiQ3JlYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6ODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiJiODRmMjc4NzcwNTIyYzc3ZmJhN2IyZDNkM2Y2MDA0Y19jb2x1bW5zIjthOjI6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoic3VwcGxpZXIubmFtZSI7czo1OiJsYWJlbCI7czoxMDoi2KfZhNin2LPZhSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NzoiYmFsYW5jZSI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmF2KjZhNi6IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiI3OWUzZDlkMGU1NmY4YTQwNzhmMDIxNDU3NDU5OWM0MF9jb2x1bW5zIjthOjY6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxOToicHVyY2hhc2UuaW52b2ljZV9ubyI7czo1OiJsYWJlbCI7czoxOToi2LHZgtmFINin2YTZhdix2KzYuSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTI6InRvdGFsX2Ftb3VudCI7czo1OiJsYWJlbCI7czoyOToi2KfZhNmF2KjZhNi6INin2YTYp9is2YXYp9mE2YoiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJyZXR1cm5fZGF0ZSI7czo1OiJsYWJlbCI7czoyNToi2KrYp9ix2YrYriDYp9mE2KfYsdis2KfYuSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6ImNyZWF0ZWRCeS5uYW1lIjtzOjU6ImxhYmVsIjtzOjIyOiLYp9mP2LbZitmBINmF2YYg2YLYqNmEIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoyNToi2KrYp9ix2YrYriDYp9mE2KfYttin2YHYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxOToi2KfZkdiu2LEg2KrYudiv2YrZhCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI5OWY0NzQ0YmRjNzg2YjYyNmJjOGY4N2RmODVkZTFiOF9jb2x1bW5zIjthOjg6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoic3VwcGxpZXIubmFtZSI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmF2YjYsdivIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiaW52b2ljZV9ubyI7czo1OiJsYWJlbCI7czoyMzoi2LHZgtmFINin2YTZgdin2KrZiNix2KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJ0b3RhbF9hbW91bnQiO3M6NToibGFiZWwiO3M6Mjk6Itin2YTZhdio2YTYuiDYp9mE2KfYrNmF2KfZhNmKIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoicGF5bWVudF9zdGF0dXMiO3M6NToibGFiZWwiO3M6MTk6Itit2KfZhNipINin2YTYr9mB2LkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJwdXJjaGFzZV9kYXRlIjtzOjU6ImxhYmVsIjtzOjIzOiLYqtin2LHZitiuINin2YTYtNix2KfYoSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6ImNyZWF0ZWRCeS5uYW1lIjtzOjU6ImxhYmVsIjtzOjIyOiLYp9mP2LbZitmBINmF2YYg2YLYqNmEIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoyNToi2KrYp9ix2YrYriDYp9mE2KfYttin2YHYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6NzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxOToi2KfZkdiu2LEg2KrYudiv2YrZhCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI4YjViYjE4OGY0ZmRhZDhkODM1YjY0ZjdmYTcxZjFlZF9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjEwOiLYp9mE2KfYs9mFIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoic3VwcGxpZXIubmFtZSI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmF2YjYsdivIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJwaG9uZSI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmH2KfYqtmBIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJlbWFpbCI7czo1OiJsYWJlbCI7czo0NDoi2LnZhtmI2KfZhiDYp9mE2KjYsdmK2K8g2KfZhNin2YTZg9iq2LHZiNmG2YoiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6ImI1NmRmMjJiZTQ1OTJiN2IxZWJiNGYzNTIxNmM3OTVlX2NvbHVtbnMiO2E6NTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYp9iz2YUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6InBob25lIjtzOjU6ImxhYmVsIjtzOjEyOiLYp9mE2YfYp9iq2YEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6ImVtYWlsIjtzOjU6ImxhYmVsIjtzOjQ0OiLYudmG2YjYp9mGINin2YTYqNix2YrYryDYp9mE2KfZhNmD2KrYsdmI2YbZiiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkNyZWF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IlVwZGF0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiYTI0ZjhlYTE1OTQ0NTQyN2VhYjQ5NGNjYzcwOTdjZDBfY29sdW1ucyI7YTo5OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6Imludm9pY2Vfbm8iO3M6NToibGFiZWwiO3M6MjM6Itix2YLZhSDYp9mE2YHYp9iq2YjYsdipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoidG90YWxfYW1vdW50IjtzOjU6ImxhYmVsIjtzOjI5OiLYp9mE2YXYqNmE2Log2KfZhNin2KzZhdin2YTZiiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6ODoiZGlzY291bnQiO3M6NToibGFiZWwiO3M6MTA6Itin2YTYrti12YUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6InBhaWQiO3M6NToibGFiZWwiO3M6MTQ6Itin2YTZhdiv2YHZiNi5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoicGF5bWVudF9zdGF0dXMiO3M6NToibGFiZWwiO3M6MTk6Itit2KfZhNipINin2YTYr9mB2LkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJpbnZvaWNlX2RhdGUiO3M6NToibGFiZWwiO3M6Mjc6Itiq2KfYsdmK2K4g2KfZhNmB2KfYqtmI2LHYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6ImNyZWF0ZWRCeS5uYW1lIjtzOjU6ImxhYmVsIjtzOjIyOiLYp9mP2LbZitmBINmF2YYg2YLYqNmEIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czoyNToi2KrYp9ix2YrYriDYp9mE2KfYttin2YHYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6ODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxOToi2KfZkdiu2LEg2KrYudiv2YrZhCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI1MDU3NjdlMmM5ZGY4ZTkwNmVkNmNmODM5YzQ1NWIwOF9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxOToicHVyY2hhc2UuaW52b2ljZV9ubyI7czo1OiJsYWJlbCI7czoyMzoi2LHZgtmFINin2YTZgdin2KrZiNix2KkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6InR5cGUiO3M6NToibGFiZWwiO3M6MTA6Itin2YTZhtmI2LkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjY6ImFtb3VudCI7czo1OiJsYWJlbCI7czoxMjoi2KfZhNmF2KjZhNi6IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiZGVzY3JpcHRpb24iO3M6NToibGFiZWwiO3M6MTI6ItmF2YTYp9it2LjYqSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319fXM6ODoiZmlsYW1lbnQiO2E6MDp7fX0=', 1777799101);

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `batch_id` bigint UNSIGNED DEFAULT NULL,
  `movement_type` enum('invoice','purchase','return','adjustment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_type` enum('invoice','purchase','product_return','adjustment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int NOT NULL,
  `direction` enum('in','out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_movements`
--

INSERT INTO `stock_movements` (`id`, `product_id`, `batch_id`, `movement_type`, `reference_type`, `reference_id`, `quantity`, `direction`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'purchase', 'purchase', 1, 4, 'in', 1, '2025-12-13 09:36:07', '2025-12-13 09:36:07'),
(2, 1, 1, 'return', 'product_return', 1, 2, 'out', 1, '2025-12-13 09:37:27', '2025-12-13 09:37:27'),
(3, 1, 1, 'return', 'product_return', 2, 5, 'out', 1, '2025-12-13 09:51:22', '2025-12-13 09:51:22'),
(4, 1, NULL, 'purchase', 'purchase', 2, 454, 'in', 1, '2025-12-13 09:55:07', '2025-12-13 09:55:07'),
(6, 1, 2, 'invoice', 'invoice', 7, 1, 'out', 1, '2025-12-13 10:09:10', '2025-12-13 10:09:10'),
(7, 1, 2, 'invoice', 'invoice', 8, 65, 'out', 1, '2026-03-07 10:24:14', '2026-03-07 10:24:14'),
(8, 2, NULL, 'purchase', 'purchase', 3, 50, 'in', 1, '2026-03-07 10:32:00', '2026-03-07 10:32:00'),
(9, 2, 3, 'purchase', 'purchase', 4, 50, 'in', 1, '2026-03-07 10:33:11', '2026-03-07 10:33:11'),
(11, 1, 2, 'invoice', 'invoice', 14, 70, 'out', 1, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(12, 2, 3, 'invoice', 'invoice', 14, 10, 'out', 1, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(13, 1, 2, 'invoice', 'invoice', 14, 1, 'out', 1, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(14, 2, 3, 'invoice', 'invoice', 14, 12, 'out', 1, '2026-05-02 13:34:55', '2026-05-02 13:34:55'),
(15, 2, 3, 'invoice', 'invoice', 15, 12, 'out', 1, '2026-05-02 13:43:15', '2026-05-02 13:43:15'),
(16, 2, 3, 'invoice', 'invoice', 15, 12, 'out', 1, '2026-05-02 13:43:15', '2026-05-02 13:43:15'),
(18, 2, 3, 'return', 'product_return', 5, 1, 'in', 1, '2026-05-02 14:34:09', '2026-05-02 14:34:09'),
(19, 2, 3, 'return', 'product_return', 6, 2, 'in', 1, '2026-05-02 14:35:33', '2026-05-02 14:35:33'),
(20, 2, 3, 'return', 'product_return', 7, 50, 'out', 1, '2026-05-03 05:16:05', '2026-05-03 05:16:05'),
(21, 2, NULL, 'purchase', 'purchase', 5, 50, 'in', 1, '2026-05-03 05:56:18', '2026-05-03 05:56:18'),
(22, 1, NULL, 'purchase', 'purchase', 6, 50, 'in', 1, '2026-05-03 05:57:20', '2026-05-03 05:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'علي صلاح', NULL, NULL, NULL, '2025-12-13 09:29:11', '2025-12-13 09:29:11');

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
(1, 1, -51.00, '2025-12-13 09:36:07', '2026-05-03 06:04:53');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_account_transactions`
--

CREATE TABLE `supplier_account_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_account_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_account_transactions`
--

INSERT INTO `supplier_account_transactions` (`id`, `supplier_account_id`, `type`, `purchase_id`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'debt', 1, 176.00, NULL, '2025-12-13 09:36:07', '2025-12-13 09:36:07'),
(2, 1, 'payment', 1, 2.00, NULL, '2025-12-13 09:38:38', '2025-12-13 09:38:38'),
(3, 1, 'payment', 1, 55.00, NULL, '2025-12-13 09:38:58', '2025-12-13 09:38:58'),
(4, 1, 'debt', 2, 24870.00, NULL, '2025-12-13 09:55:07', '2025-12-13 09:55:07'),
(5, 1, 'debt', 3, 250.00, NULL, '2026-03-07 10:32:00', '2026-03-07 10:32:00'),
(6, 1, 'debt', 4, 200.00, NULL, '2026-03-07 10:33:11', '2026-03-07 10:33:11'),
(7, 1, 'payment', 4, 4.00, NULL, '2026-05-02 14:37:37', '2026-05-02 14:37:37'),
(8, 1, 'payment', 4, 250.00, 'مرتجع', '2026-05-03 05:16:05', '2026-05-03 05:16:05'),
(9, 1, 'debt', 5, 250.00, NULL, '2026-05-03 05:56:18', '2026-05-03 05:56:18'),
(10, 1, 'payment', 4, 6.00, NULL, '2026-05-03 06:04:35', '2026-05-03 06:04:35'),
(11, 1, 'payment', 5, 545.00, NULL, '2026-05-03 06:04:53', '2026-05-03 06:04:53');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `abbreviation`, `created_at`, `updated_at`) VALUES
(1, 'علبة', 'علبة', '2025-12-13 09:30:56', '2025-12-13 09:30:56'),
(2, 'درزن', '6', '2025-12-13 10:00:56', '2025-12-13 10:00:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'asaam4292@gmail.com', NULL, '$2y$12$QBXGILY3TkHwg75wG3j.BOJWS98mgu5XyJd21SS.nT4oLIKNizXEO', '8qF0aDPPxMvh6j6iPnjJjiROcaUDS4FXaIHewEcTDPobPMSNJRpPfNH6ljkP', '2025-10-26 12:03:08', '2025-10-26 12:03:08'),
(4, 'محمد سالم', 'mohammed.salem701@gmail.com', NULL, '$2y$12$Lu70xMmGfxdRyXGfHo6llOJJfX/J0OOmL6oUvgh5Nn9Ie/za73Vy6', NULL, '2025-12-01 09:31:32', '2025-12-01 09:31:32'),
(5, 'Admin', 'admin@admin.com', NULL, '$2y$12$MnqCB58ssOPRLmGw/ZhUOOyEKKrYSCg4nVzQj1BJhKmp7rZL8l7.e', NULL, '2026-03-07 10:22:53', '2026-03-07 10:22:53');

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
  ADD UNIQUE KEY `batches_batch_no_unique` (`batch_no`),
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
  ADD KEY `invoice_items_product_id_foreign` (`product_id`),
  ADD KEY `invoice_items_unit_id_foreign` (`unit_id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`);

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
  ADD UNIQUE KEY `purchases_invoice_no_unique` (`invoice_no`),
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_accounts`
--
ALTER TABLE `customer_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_account_transactions`
--
ALTER TABLE `customer_account_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `examinations`
--
ALTER TABLE `examinations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `examination_departments`
--
ALTER TABLE `examination_departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `examination_prescriptions`
--
ALTER TABLE `examination_prescriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `examination_prescription_items`
--
ALTER TABLE `examination_prescription_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `examination_units`
--
ALTER TABLE `examination_units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `invoice_item_batches`
--
ALTER TABLE `invoice_item_batches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `return_items`
--
ALTER TABLE `return_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_representatives`
--
ALTER TABLE `sales_representatives`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `batches_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

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
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `product_units` (`id`) ON DELETE CASCADE;

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