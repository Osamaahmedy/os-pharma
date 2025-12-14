-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for pharmacy_system
CREATE DATABASE IF NOT EXISTS `pharmacy_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pharmacy_system`;

-- Dumping structure for table pharmacy_system.activity_log
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.adjustments
CREATE TABLE IF NOT EXISTS `adjustments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `batch_id` bigint unsigned DEFAULT NULL,
  `old_quantity` int NOT NULL,
  `new_quantity` int NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustments_product_id_foreign` (`product_id`),
  KEY `adjustments_batch_id_foreign` (`batch_id`),
  KEY `adjustments_created_by_foreign` (`created_by`),
  CONSTRAINT `adjustments_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `adjustments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `adjustments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.adjustments: ~0 rows (approximately)

-- Dumping structure for table pharmacy_system.batches
CREATE TABLE IF NOT EXISTS `batches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `supplier_id` bigint unsigned DEFAULT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `purchase_price_per_base` decimal(10,2) NOT NULL,
  `sale_price_per_base` decimal(10,2) DEFAULT NULL,
  `initial_quantity` int NOT NULL,
  `current_quantity` int NOT NULL DEFAULT (0),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batches_product_id_foreign` (`product_id`),
  KEY `batches_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `batches_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `batches_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.batches: ~3 rows (approximately)

-- Dumping structure for table pharmacy_system.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.cache_locks: ~0 rows (approximately)

-- Dumping structure for table pharmacy_system.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.customer_accounts
CREATE TABLE IF NOT EXISTS `customer_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.customer_account_transactions
CREATE TABLE IF NOT EXISTS `customer_account_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` bigint unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_account_transactions_customer_account_id_foreign` (`customer_account_id`),
  KEY `customer_account_transactions_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `customer_account_transactions_customer_account_id_foreign` FOREIGN KEY (`customer_account_id`) REFERENCES `customer_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customer_account_transactions_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.examinations
CREATE TABLE IF NOT EXISTS `examinations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `scientific_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `normal_ratio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` bigint unsigned NOT NULL,
  `unit_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examinations_department_id_foreign` (`department_id`),
  KEY `examinations_unit_id_foreign` (`unit_id`),
  CONSTRAINT `examinations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `examination_departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `examinations_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `examination_units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.examination_departments
CREATE TABLE IF NOT EXISTS `examination_departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.examination_prescriptions
CREATE TABLE IF NOT EXISTS `examination_prescriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.examination_prescription_items
CREATE TABLE IF NOT EXISTS `examination_prescription_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `examination_prescription_id` bigint unsigned NOT NULL,
  `examination_id` bigint unsigned NOT NULL,
  `patient_ratio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examination_prescription_id_foreign` (`examination_prescription_id`),
  KEY `examination_prescription_items_examination_id_foreign` (`examination_id`),
  CONSTRAINT `examination_prescription_id_foreign` FOREIGN KEY (`examination_prescription_id`) REFERENCES `examination_prescriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `examination_prescription_items_examination_id_foreign` FOREIGN KEY (`examination_id`) REFERENCES `examinations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table pharmacy_system.examination_units
CREATE TABLE IF NOT EXISTS `examination_units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping structure for table pharmacy_system.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table pharmacy_system.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('paid','unpaid','partial') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `invoice_date` date NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_invoice_no_unique` (`invoice_no`),
  KEY `invoices_created_by_foreign` (`created_by`),
  CONSTRAINT `invoices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.invoices: ~29 rows (approximately)
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

-- Dumping structure for table pharmacy_system.invoice_items
CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `unit_id` bigint unsigned NOT NULL,
  `batch_id` bigint unsigned DEFAULT NULL,
  `quantity` int NOT NULL,
  `quantity_base` decimal(10,2) NOT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_product_id_foreign` (`product_id`),
  KEY `invoice_items_batch_id_foreign` (`batch_id`),
  KEY `FK_invoice_items_units` (`unit_id`),
  CONSTRAINT `FK_invoice_items_units` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.invoice_items: ~28 rows (approximately)
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

-- Dumping structure for table pharmacy_system.invoice_item_batches
CREATE TABLE IF NOT EXISTS `invoice_item_batches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_item_id` bigint unsigned NOT NULL,
  `batch_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_item_batches_invoice_item_id_foreign` (`invoice_item_id`),
  KEY `invoice_item_batches_batch_id_foreign` (`batch_id`),
  CONSTRAINT `invoice_item_batches_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_item_batches_invoice_item_id_foreign` FOREIGN KEY (`invoice_item_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.invoice_item_batches: ~23 rows (approximately)
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

-- Dumping structure for table pharmacy_system.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.jobs: ~6 rows (approximately)
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
	(1, 'default', '{"uuid":"e8cf1369-8b0e-46d1-9d6c-fe420ac53bdf","displayName":"Filament\\\\Notifications\\\\DatabaseNotification","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications","command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":3:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:1;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}s:12:\\"notification\\";O:43:\\"Filament\\\\Notifications\\\\DatabaseNotification\\":2:{s:4:\\"data\\";a:11:{s:7:\\"actions\\";a:0:{}s:4:\\"body\\";N;s:5:\\"color\\";N;s:8:\\"duration\\";s:10:\\"persistent\\";s:4:\\"icon\\";N;s:9:\\"iconColor\\";N;s:6:\\"status\\";N;s:5:\\"title\\";s:18:\\"Saved successfully\\";s:4:\\"view\\";N;s:8:\\"viewData\\";a:0:{}s:6:\\"format\\";s:8:\\"filament\\";}s:2:\\"id\\";s:36:\\"117b223e-eb32-49c7-9718-a0ee8482987b\\";}s:8:\\"channels\\";a:1:{i:0;s:8:\\"database\\";}}"},"createdAt":1764608643,"delay":null}', 0, NULL, 1764608643, 1764608643),
	(2, 'default', '{"uuid":"c8b19465-024e-4954-9620-af69a1035577","displayName":"Filament\\\\Notifications\\\\DatabaseNotification","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications","command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":3:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:1;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}s:12:\\"notification\\";O:43:\\"Filament\\\\Notifications\\\\DatabaseNotification\\":2:{s:4:\\"data\\";a:11:{s:7:\\"actions\\";a:0:{}s:4:\\"body\\";N;s:5:\\"color\\";N;s:8:\\"duration\\";s:10:\\"persistent\\";s:4:\\"icon\\";N;s:9:\\"iconColor\\";N;s:6:\\"status\\";N;s:5:\\"title\\";s:18:\\"Saved successfully\\";s:4:\\"view\\";N;s:8:\\"viewData\\";a:0:{}s:6:\\"format\\";s:8:\\"filament\\";}s:2:\\"id\\";s:36:\\"073a69d6-a97d-40c8-9fd7-c2e25d2cf283\\";}s:8:\\"channels\\";a:1:{i:0;s:8:\\"database\\";}}"},"createdAt":1764608669,"delay":null}', 0, NULL, 1764608669, 1764608669),
	(3, 'default', '{"uuid":"ebd43c34-5302-47b7-8b8d-e30014f7aa7a","displayName":"Filament\\\\Notifications\\\\DatabaseNotification","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications","command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":3:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:1;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}s:12:\\"notification\\";O:43:\\"Filament\\\\Notifications\\\\DatabaseNotification\\":2:{s:4:\\"data\\";a:11:{s:7:\\"actions\\";a:0:{}s:4:\\"body\\";N;s:5:\\"color\\";N;s:8:\\"duration\\";s:10:\\"persistent\\";s:4:\\"icon\\";N;s:9:\\"iconColor\\";N;s:6:\\"status\\";N;s:5:\\"title\\";s:18:\\"Saved successfully\\";s:4:\\"view\\";N;s:8:\\"viewData\\";a:0:{}s:6:\\"format\\";s:8:\\"filament\\";}s:2:\\"id\\";s:36:\\"f2ee5971-6933-4f24-9110-513af724931f\\";}s:8:\\"channels\\";a:1:{i:0;s:8:\\"database\\";}}"},"createdAt":1764608670,"delay":null}', 0, NULL, 1764608670, 1764608670),
	(4, 'default', '{"uuid":"33214072-fa31-43bb-bac8-9e600926871a","displayName":"Filament\\\\Notifications\\\\DatabaseNotification","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications","command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":3:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:1;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}s:12:\\"notification\\";O:43:\\"Filament\\\\Notifications\\\\DatabaseNotification\\":2:{s:4:\\"data\\";a:11:{s:7:\\"actions\\";a:0:{}s:4:\\"body\\";N;s:5:\\"color\\";N;s:8:\\"duration\\";s:10:\\"persistent\\";s:4:\\"icon\\";N;s:9:\\"iconColor\\";N;s:6:\\"status\\";N;s:5:\\"title\\";s:18:\\"Saved successfully\\";s:4:\\"view\\";N;s:8:\\"viewData\\";a:0:{}s:6:\\"format\\";s:8:\\"filament\\";}s:2:\\"id\\";s:36:\\"cc59785b-b5b4-43dd-bc8c-98b9be30cfe9\\";}s:8:\\"channels\\";a:1:{i:0;s:8:\\"database\\";}}"},"createdAt":1764608676,"delay":null}', 0, NULL, 1764608676, 1764608676),
	(5, 'default', '{"uuid":"cf7037ab-b357-4b7e-80ea-3b147fb50574","displayName":"Filament\\\\Notifications\\\\DatabaseNotification","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications","command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":3:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:1;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}s:12:\\"notification\\";O:43:\\"Filament\\\\Notifications\\\\DatabaseNotification\\":2:{s:4:\\"data\\";a:11:{s:7:\\"actions\\";a:0:{}s:4:\\"body\\";N;s:5:\\"color\\";N;s:8:\\"duration\\";s:10:\\"persistent\\";s:4:\\"icon\\";N;s:9:\\"iconColor\\";N;s:6:\\"status\\";N;s:5:\\"title\\";s:18:\\"Saved successfully\\";s:4:\\"view\\";N;s:8:\\"viewData\\";a:0:{}s:6:\\"format\\";s:8:\\"filament\\";}s:2:\\"id\\";s:36:\\"1916c2ce-f63b-4a55-b00b-20803be35566\\";}s:8:\\"channels\\";a:1:{i:0;s:8:\\"database\\";}}"},"createdAt":1764608724,"delay":null}', 0, NULL, 1764608724, 1764608724),
	(6, 'default', '{"uuid":"816a82d7-f688-41eb-b647-d5a805d39a8c","displayName":"Filament\\\\Notifications\\\\DatabaseNotification","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications","command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":3:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:1;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}s:12:\\"notification\\";O:43:\\"Filament\\\\Notifications\\\\DatabaseNotification\\":2:{s:4:\\"data\\";a:11:{s:7:\\"actions\\";a:0:{}s:4:\\"body\\";N;s:5:\\"color\\";N;s:8:\\"duration\\";s:10:\\"persistent\\";s:4:\\"icon\\";N;s:9:\\"iconColor\\";N;s:6:\\"status\\";N;s:5:\\"title\\";s:18:\\"Saved successfully\\";s:4:\\"view\\";N;s:8:\\"viewData\\";a:0:{}s:6:\\"format\\";s:8:\\"filament\\";}s:2:\\"id\\";s:36:\\"f63565cc-5056-4f81-8516-80732cd03480\\";}s:8:\\"channels\\";a:1:{i:0;s:8:\\"database\\";}}"},"createdAt":1764608731,"delay":null}', 0, NULL, 1764608731, 1764608731);

-- Dumping structure for table pharmacy_system.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.job_batches: ~0 rows (approximately)

-- Dumping structure for table pharmacy_system.manufacturers
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.manufacturers: ~1 rows (approximately)
INSERT INTO `manufacturers` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Pharma', '2025-10-26 17:40:24', '2025-10-26 17:40:24');

-- Dumping structure for table pharmacy_system.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.migrations: ~36 rows (approximately)
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

-- Dumping structure for table pharmacy_system.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.model_has_permissions: ~0 rows (approximately)

-- Dumping structure for table pharmacy_system.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.model_has_roles: ~1 rows (approximately)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(3, 'App\\Models\\User', 4);

-- Dumping structure for table pharmacy_system.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.notifications: ~3 rows (approximately)
INSERT INTO `notifications` (`id`, `message`, `status`, `read_at`, `created_at`, `updated_at`) VALUES
	(1, 'المنتج يوشك على النفاذ', '', '2025-12-03 09:12:09', '2025-12-02 11:54:16', '2025-12-03 09:12:09'),
	(2, 'المنتج التالي قارب على الانتهاء', '', '2025-12-02 16:17:45', NULL, '2025-12-02 16:17:45'),
	(3, 'لا توجد كمية كافية في المخزون لهذا المنتج: بندول', '', '2025-12-03 19:46:57', '2025-12-03 18:09:42', '2025-12-03 19:46:57');

-- Dumping structure for table pharmacy_system.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table pharmacy_system.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.permissions: ~62 rows (approximately)
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

-- Dumping structure for table pharmacy_system.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned DEFAULT NULL,
  `manufacturer_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generic_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `reorder_level` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_barcode_unique` (`barcode`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_manufacturer_id_foreign` (`manufacturer_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.products: ~2 rows (approximately)
INSERT INTO `products` (`id`, `category_id`, `manufacturer_id`, `name`, `generic_name`, `barcode`, `description`, `reorder_level`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'بندول', 'باراسيتامول', '34565465', NULL, 15, 1, '2025-10-26 15:18:21', '2025-12-08 20:15:34'),
	(2, 2, 1, 'دواء الحما', 'Fever', NULL, NULL, 5, 1, '2025-11-29 17:59:59', '2025-12-08 20:20:16');

-- Dumping structure for table pharmacy_system.product_returns
CREATE TABLE IF NOT EXISTS `product_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('invoice','purchase') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `return_date` date NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_returns_created_by_foreign` (`created_by`),
  CONSTRAINT `product_returns_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.product_returns: ~11 rows (approximately)
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
	(17, 'invoice', 78, 5000.00, '2025-12-11', 1, '2025-12-08 11:03:48', '2025-12-08 11:03:48');

-- Dumping structure for table pharmacy_system.product_units
CREATE TABLE IF NOT EXISTS `product_units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `unit_id` bigint unsigned NOT NULL,
  `conversion_factor` decimal(10,3) NOT NULL,
  `is_base` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_units_product_id_foreign` (`product_id`),
  KEY `product_units_unit_id_foreign` (`unit_id`),
  CONSTRAINT `product_units_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_units_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.product_units: ~4 rows (approximately)
INSERT INTO `product_units` (`id`, `product_id`, `unit_id`, `conversion_factor`, `is_base`, `price`, `created_at`, `updated_at`) VALUES
	(3, 1, 2, 2.000, 1, 100.00, '2025-10-29 03:44:35', '2025-10-29 03:53:20'),
	(4, 1, 3, 12.000, 0, 1200.00, '2025-10-29 03:50:25', '2025-10-29 03:50:25'),
	(5, 1, 4, 240.000, 0, 12000.00, '2025-10-29 03:51:19', '2025-10-29 03:51:19'),
	(6, 2, 2, 1.000, 1, 100.00, '2025-11-29 18:20:42', '2025-11-29 18:20:42');

-- Dumping structure for table pharmacy_system.purchases
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint unsigned DEFAULT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_status` enum('paid','unpaid','partial') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `paid` decimal(10,2) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_supplier_id_foreign` (`supplier_id`),
  KEY `purchases_created_by_foreign` (`created_by`),
  CONSTRAINT `purchases_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.purchases: ~8 rows (approximately)
INSERT INTO `purchases` (`id`, `supplier_id`, `invoice_no`, `total_amount`, `payment_status`, `paid`, `purchase_date`, `created_by`, `created_at`, `updated_at`) VALUES
	(2, 1, 'PUR-20251127-00001', 500.00, 'paid', 0.00, '2025-11-27', 1, '2025-11-27 19:14:43', '2025-11-27 19:14:43'),
	(4, 1, 'PUR-20251203-00001', 200000.00, 'paid', NULL, '2025-12-26', 1, '2025-12-03 18:59:46', '2025-12-08 10:36:47'),
	(5, 1, 'PUR-20251203-00002', 110000.00, 'partial', 0.00, '2026-01-02', 1, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
	(6, 1, 'PUR-20251203-00003', 100000.00, 'partial', 5000.00, '2025-12-26', 1, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
	(7, 1, 'PUR-20251203-00004', 10000.00, 'paid', NULL, '2026-01-07', 1, '2025-12-03 19:11:59', '2025-12-03 19:11:59'),
	(8, NULL, 'PUR-20251203-00005', 10000.00, 'unpaid', NULL, '2026-01-03', 1, '2025-12-03 19:13:02', '2025-12-03 19:13:02'),
	(9, NULL, 'PUR-20251203-00006', 5000.00, 'paid', NULL, '2026-01-10', 1, '2025-12-03 19:14:02', '2025-12-03 19:14:02'),
	(10, NULL, 'PUR-20251203-00007', 10000.00, 'partial', 500.00, '2026-01-07', 1, '2025-12-03 19:14:52', '2025-12-03 19:14:52');

-- Dumping structure for table pharmacy_system.purchase_items
CREATE TABLE IF NOT EXISTS `purchase_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `batch_id` bigint unsigned DEFAULT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  KEY `purchase_items_product_id_foreign` (`product_id`),
  KEY `purchase_items_batch_id_foreign` (`batch_id`),
  CONSTRAINT `purchase_items_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.purchase_items: ~9 rows (approximately)
INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `batch_id`, `quantity`, `unit_price`, `total_price`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, 1, 5, 100.00, 500.00, '2025-11-27 19:14:43', '2025-11-27 19:14:43'),
	(2, 4, 2, 2, 1000, 200.00, 200000.00, '2025-12-03 18:59:46', '2025-12-03 18:59:46'),
	(3, 5, 1, 3, 1000, 50.00, 50000.00, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
	(4, 5, 2, 2, 1000, 60.00, 60000.00, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
	(5, 6, 2, 2, 1000, 100.00, 100000.00, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
	(6, 7, 1, 1, 100, 100.00, 10000.00, '2025-12-03 19:11:59', '2025-12-03 19:11:59'),
	(7, 8, 1, 1, 100, 100.00, 10000.00, '2025-12-03 19:13:02', '2025-12-03 19:13:02'),
	(8, 9, 1, 1, 50, 100.00, 5000.00, '2025-12-03 19:14:02', '2025-12-03 19:14:02'),
	(9, 10, 1, 1, 100, 100.00, 10000.00, '2025-12-03 19:14:52', '2025-12-03 19:14:52');

-- Dumping structure for table pharmacy_system.return_items
CREATE TABLE IF NOT EXISTS `return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `return_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `batch_id` bigint unsigned DEFAULT NULL,
  `quantity` int NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_items_return_id_foreign` (`return_id`),
  KEY `return_items_product_id_foreign` (`product_id`),
  KEY `return_items_batch_id_foreign` (`batch_id`),
  CONSTRAINT `return_items_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `return_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `return_items_return_id_foreign` FOREIGN KEY (`return_id`) REFERENCES `product_returns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.return_items: ~13 rows (approximately)
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
	(17, 17, 1, 1, 50, NULL, '2025-12-08 11:03:48', '2025-12-08 11:03:48');

-- Dumping structure for table pharmacy_system.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.roles: ~2 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(2, 'مشرف', 'web', '2025-11-29 16:52:31', '2025-11-29 16:52:31'),
	(3, 'مدخل بيانات', 'web', '2025-11-29 16:58:15', '2025-11-29 16:58:15');

-- Dumping structure for table pharmacy_system.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.role_has_permissions: ~7 rows (approximately)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 2),
	(5, 2),
	(9, 2),
	(13, 2),
	(17, 2),
	(5, 3),
	(6, 3);

-- Dumping structure for table pharmacy_system.sales_representatives
CREATE TABLE IF NOT EXISTS `sales_representatives` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_representatives_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `sales_representatives_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.sales_representatives: ~1 rows (approximately)
INSERT INTO `sales_representatives` (`id`, `name`, `phone`, `email`, `address`, `supplier_id`, `created_at`, `updated_at`) VALUES
	(2, 'محمد حمدي', '77884455', 'dawa@phrma.com', 'عدن الشعب', 1, '2025-12-08 14:54:19', '2025-12-08 14:54:19');

-- Dumping structure for table pharmacy_system.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('TFvMM8PEmfn0467ugr9KajlaDd5vfVT3aTbEzbvb', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaGpFQzJMRnZmbk1IQ21jREpVMW9xYVRscUpIZFNFeWN5dnNNUmpGMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJERjVGxmaFRITmxtTUxiOGtCVmFKdmVaSEZ1TXFxeFNOT2JIUjI5ellYYlB5OWhhSFVkR1BDIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0NzoiaHR0cDovL3BoYXJtYWN5LXN5c3RlbS50ZXN0L2FkbWluL2FjdGl2aXR5LWxvZ3MiO31zOjY6InRhYmxlcyI7YToxOntzOjQwOiI3MWUxY2Y4ZGZiNDQzZGIyODUxY2M3MDVjOTU4NWVlNV9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiZGVzY3JpcHRpb24iO3M6NToibGFiZWwiO3M6MTE6IkRlc2NyaXB0aW9uIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoicHJvcGVydGllcyI7czo1OiJsYWJlbCI7czoxMDoiUHJvcGVydGllcyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImNhdXNlci5uYW1lIjtzOjU6ImxhYmVsIjtzOjQ6IlVzZXIiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjI1OiLYqtin2LHZitiuINin2YTYp9i22KfZgdipIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX19fQ==', 1765494808);

-- Dumping structure for table pharmacy_system.stock_movements
CREATE TABLE IF NOT EXISTS `stock_movements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `batch_id` bigint unsigned DEFAULT NULL,
  `movement_type` enum('return','purchase','invoice','adjustment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_type` enum('invoice','purchase','product_return','adjustment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned DEFAULT NULL,
  `quantity` int NOT NULL,
  `direction` enum('in','out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_movements_product_id_foreign` (`product_id`),
  KEY `stock_movements_batch_id_foreign` (`batch_id`),
  KEY `stock_movements_created_by_foreign` (`created_by`),
  KEY `stock_movements_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  CONSTRAINT `stock_movements_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stock_movements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_movements_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.stock_movements: ~45 rows (approximately)
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
	(70, 1, 1, 'return', 'product_return', 17, 50, 'in', 1, '2025-12-08 11:03:48', '2025-12-08 11:03:48');

-- Dumping structure for table pharmacy_system.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.suppliers: ~1 rows (approximately)
INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
	(1, 'شركة ادوية', '77884455', 'dawa@phrma.com', 'القاهرة شارع الادوية', '2025-10-28 12:09:21', '2025-10-28 12:09:21');

-- Dumping structure for table pharmacy_system.supplier_accounts
CREATE TABLE IF NOT EXISTS `supplier_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint unsigned NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_accounts_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `supplier_accounts_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.supplier_accounts: ~1 rows (approximately)
INSERT INTO `supplier_accounts` (`id`, `supplier_id`, `balance`, `created_at`, `updated_at`) VALUES
	(1, 1, 0.00, '2025-12-03 18:59:46', '2025-12-08 10:36:47');

-- Dumping structure for table pharmacy_system.supplier_account_transactions
CREATE TABLE IF NOT EXISTS `supplier_account_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier_account_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_id` bigint unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_account_transactions_supplier_account_id_foreign` (`supplier_account_id`),
  KEY `supplier_account_transactions_purchase_id_foreign` (`purchase_id`),
  CONSTRAINT `supplier_account_transactions_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supplier_account_transactions_supplier_account_id_foreign` FOREIGN KEY (`supplier_account_id`) REFERENCES `supplier_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.supplier_account_transactions: ~7 rows (approximately)
INSERT INTO `supplier_account_transactions` (`id`, `supplier_account_id`, `type`, `purchase_id`, `amount`, `description`, `created_at`, `updated_at`) VALUES
	(1, 1, 'debt', 4, 200000.00, NULL, '2025-12-03 18:59:46', '2025-12-03 18:59:46'),
	(2, 1, 'debt', 5, 110000.00, NULL, '2025-12-03 19:07:52', '2025-12-03 19:07:52'),
	(3, 1, 'debt', 6, 95000.00, NULL, '2025-12-03 19:10:00', '2025-12-03 19:10:00'),
	(4, 1, 'payment', 6, 5000.00, 'تم الدفع', '2025-12-06 18:05:28', '2025-12-06 18:05:28'),
	(5, 1, 'payment', 5, 100000.00, 'دفع مئة الف', '2025-12-06 18:24:00', '2025-12-06 18:24:00'),
	(6, 1, 'payment', 4, 100000.00, NULL, '2025-12-08 10:34:36', '2025-12-08 10:34:36'),
	(8, 1, 'payment', 4, 100000.00, NULL, '2025-12-08 10:36:47', '2025-12-08 10:36:47');

-- Dumping structure for table pharmacy_system.units
CREATE TABLE IF NOT EXISTS `units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.units: ~4 rows (approximately)
INSERT INTO `units` (`id`, `name`, `abbreviation`, `created_at`, `updated_at`) VALUES
	(2, 'حبة', 'ح', '2025-10-29 03:36:02', '2025-10-29 03:36:02'),
	(3, 'باكت', 'ب', '2025-10-29 03:37:28', '2025-10-29 03:49:56'),
	(4, 'كرتون', 'ك', '2025-10-29 03:37:47', '2025-10-29 03:50:04'),
	(5, 'حبة', 'ح', '2025-10-29 03:38:06', '2025-10-29 03:38:06');

-- Dumping structure for table pharmacy_system.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pharmacy_system.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@admin.com', NULL, '$2y$12$DcTlfhTHNlmMLb8kBVaJveZHFuMqqxSNObHR29zYXbPy9haHUdGPC', '8qF0aDPPxMvh6j6iPnjJjiROcaUDS4FXaIHewEcTDPobPMSNJRpPfNH6ljkP', '2025-10-26 15:03:08', '2025-10-26 15:03:08'),
	(4, 'محمد سالم', 'mohammed.salem701@gmail.com', NULL, '$2y$12$Lu70xMmGfxdRyXGfHo6llOJJfX/J0OOmL6oUvgh5Nn9Ie/za73Vy6', NULL, '2025-12-01 12:31:32', '2025-12-01 12:31:32');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
