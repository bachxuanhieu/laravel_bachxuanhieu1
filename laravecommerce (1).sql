-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 11, 2023 lúc 04:40 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laravecommerce`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `category_id`) VALUES
(6, 'Iphone', 'iphone', 0, '2023-07-31 03:12:07', '2023-08-03 00:55:14', 3),
(7, 'Samsung', 'samsung', 0, '2023-07-31 03:12:40', '2023-08-03 00:55:05', 3),
(8, 'Oppo', 'oppo', 0, '2023-07-31 03:12:50', '2023-08-03 00:54:54', 3),
(9, 'Mi', 'mi', 0, '2023-07-31 03:12:58', '2023-08-03 00:46:03', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_color_id` int(11) DEFAULT NULL,
  `quanlity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=visible,1=hidden',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `meta_title`, `meta_keyword`, `meta_description`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Laptop', 'laptop', 'Laptop', 'uploads/category/1691000733.jpg', 'Laptop', 'Laptop', 'Laptop', 0, '2023-07-30 22:46:40', '2023-08-02 11:25:33'),
(5, 'Điện Thoại', 'dien-thoai', 'Điện Thoại Chính Hãng', 'uploads/category/1691582081.jpg', 'Điện Thoại Chính Hãng', 'Điện Thoại Chính Hãng', 'Điện Thoại Chính Hãng', 0, '2023-08-09 04:54:41', '2023-08-09 04:54:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Red', 'red', 1, '2023-08-01 08:19:36', '2023-08-01 08:19:36'),
(5, 'Blue', 'blue', 0, '2023-08-01 08:19:55', '2023-08-01 08:19:55'),
(6, 'green', 'green', 0, '2023-08-01 08:20:08', '2023-08-01 08:20:08'),
(7, 'while', 'while', 0, '2023-08-01 08:20:23', '2023-08-01 08:20:23'),
(8, 'black', 'black', 0, '2023-08-01 08:20:33', '2023-08-01 08:20:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_30_092811_add_details_to_users_table', 2),
(6, '2023_07_30_134154_create_categories_table', 3),
(7, '2023_07_31_055825_create_brands_table', 4),
(10, '2023_07_31_124730_create_products_table', 5),
(14, '2023_08_01_095127_create_colors_table', 6),
(15, '2023_08_01_155442_create_product_colors_table', 7),
(16, '2023_08_02_070740_create_sliders_table', 8),
(17, '2023_08_03_073508_add_category_id_to_brands_table', 9),
(18, '2023_08_03_181523_create_wishlists_table', 10),
(19, '2023_08_04_150600_create_carts_table', 11),
(20, '2023_08_05_121942_create_orders_table', 12),
(21, '2023_08_05_122853_create_order_items_table', 12),
(25, '2023_08_08_090406_create_settings_table', 13),
(26, '2023_08_09_073930_create_user_details_table', 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `tracking_no` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `address` mediumtext NOT NULL,
  `status_message` varchar(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `tracking_no`, `fullname`, `email`, `phone`, `pincode`, `address`, `status_message`, `payment_mode`, `payment_id`, `created_at`, `updated_at`) VALUES
(10, 1, 'funda-XlazbfaW43', 'Bach Xuan Hieu', 'hieupro@gmail.com', '0815663667', '663663', 'tp Ho chi minh', 'in progress', 'Cash on Delivery', NULL, '2023-08-05 09:27:29', '2023-08-05 09:27:29'),
(11, 1, 'funda-qIwpNhUvnL', 'Bach Xuan Hieu', 'hieupro@gmail.com', '1234567891', '156412', 'daklak', 'in progress', 'Cash on Delivery', NULL, '2023-08-05 09:32:59', '2023-08-05 09:32:59'),
(12, 1, 'funda-NXUOliwKyS', 'Bach Xuan Hieu', 'hieupro@gmail.com', '0815663667', '123456', 'ho chi minh', 'completed', 'Cash on Delivery', NULL, '2023-08-06 10:25:59', '2023-08-06 11:51:46'),
(13, 1, 'funda-6hD78pOP4B', 'Bach Xuan Hieu', 'hieupro@gmail.com', '0815663667', '123456', '12 trinh dinh thao', 'in progress', 'Cash on Delivery', NULL, '2023-08-09 08:10:14', '2023-08-09 08:10:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_color_id` int(11) DEFAULT NULL,
  `quanlity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_color_id`, `quanlity`, `price`, `created_at`, `updated_at`) VALUES
(5, 10, 13, NULL, 2, 16, '2023-08-05 09:27:29', '2023-08-05 09:27:29'),
(6, 10, 10, NULL, 1, 22, '2023-08-05 09:27:29', '2023-08-05 09:27:29'),
(7, 10, 13, NULL, 3, 16, '2023-08-05 09:27:29', '2023-08-05 09:27:29'),
(8, 10, 10, NULL, 1, 22, '2023-08-05 09:27:29', '2023-08-05 09:27:29'),
(9, 11, 13, NULL, 2, 16, '2023-08-05 09:32:59', '2023-08-05 09:32:59'),
(10, 11, 10, NULL, 1, 22, '2023-08-05 09:32:59', '2023-08-05 09:32:59'),
(11, 11, 13, NULL, 3, 16, '2023-08-05 09:32:59', '2023-08-05 09:32:59'),
(12, 11, 10, NULL, 1, 22, '2023-08-05 09:32:59', '2023-08-05 09:32:59'),
(13, 12, 6, NULL, 1, 15, '2023-08-05 10:25:59', '2023-08-05 10:25:59'),
(14, 13, 13, NULL, 1, 16, '2023-08-09 08:10:14', '2023-08-09 08:10:14'),
(15, 13, 13, NULL, 1, 16, '2023-08-09 08:10:14', '2023-08-09 08:10:14'),
(16, 13, 14, NULL, 1, 140, '2023-08-09 08:10:14', '2023-08-09 08:10:14'),
(17, 13, 14, NULL, 1, 140, '2023-08-09 08:10:14', '2023-08-09 08:10:14'),
(18, 13, 14, NULL, 1, 140, '2023-08-09 08:10:14', '2023-08-09 08:10:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `small_description` mediumtext DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `quanlity` int(11) NOT NULL,
  `trending` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=trending, 0=not-trending',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=hidden, 0=visiable',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `brand`, `small_description`, `description`, `original_price`, `selling_price`, `quanlity`, `trending`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `created_at`, `updated_at`) VALUES
(13, 4, 'Dell vina', 'dell', 'Samsung', 'Dell', 'Dell', 18, 16, 10, 1, 0, 'Dell', 'Dell', NULL, '2023-08-03 04:36:50', '2023-08-03 04:36:50'),
(14, 5, 'Iphone 12 mini', 'iphone-12', 'Iphone', 'Điện thoại iPhone 12 Mini 64GB Trắng', 'Mặt lưng được làm bằng kính tạo nên sự thanh lịch và đẳng cấp\r\nMàn hình 5.4 inch, nhỏ gọn dễ dàng thao tác bằng một tay\r\nTấm nền Super Retina XDR mang đến hình ảnh sắc nét\r\nCụm camera kép cho phép chụp ảnh góc rộng và siêu rộng', 145, 140, 100, 1, 0, 'Điện thoại iPhone 12 Mini 64GB Trắng', 'Điện thoại iPhone 12 Mini 64GB Trắng', NULL, '2023-08-09 04:59:04', '2023-08-09 04:59:04'),
(17, 4, 'Iphone 13 mini', 'iphone-13-mini', 'Iphone', 'Iphone 13 mini', 'Iphone 13 mini', 145, 143, 10, 1, 0, 'Iphone 13 mini', 'Iphone 13 mini', NULL, '2023-08-09 09:04:26', '2023-08-09 09:04:26'),
(18, 4, 'iphone 13 pro', 'iphone-13-pro', 'Iphone', 'iphone 13 pro', 'iphone 13 pro', 150, 149, 10, 1, 0, 'iphone 13 pro', 'iphone 13 pro', NULL, '2023-08-09 09:05:26', '2023-08-09 09:05:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quanlity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_colors`
--

INSERT INTO `product_colors` (`id`, `product_id`, `color_id`, `quanlity`, `created_at`, `updated_at`) VALUES
(16, 13, 7, 2, '2023-08-03 04:36:50', '2023-08-09 08:10:14'),
(17, 13, 8, 2, '2023-08-03 04:36:50', '2023-08-09 08:10:14'),
(18, 14, 5, 98, '2023-08-09 04:59:04', '2023-08-09 08:10:14'),
(19, 14, 6, 9, '2023-08-09 04:59:04', '2023-08-09 08:10:14'),
(20, 14, 7, 100, '2023-08-09 04:59:04', '2023-08-09 04:59:04'),
(21, 14, 8, 100, '2023-08-09 04:59:04', '2023-08-09 04:59:04'),
(22, 17, 5, 0, '2023-08-09 09:04:26', '2023-08-09 09:04:26'),
(23, 17, 6, 0, '2023-08-09 09:04:26', '2023-08-09 09:04:26'),
(24, 17, 7, 0, '2023-08-09 09:04:26', '2023-08-09 09:04:26'),
(25, 17, 8, 0, '2023-08-09 09:04:26', '2023-08-09 09:04:26'),
(26, 18, 5, 0, '2023-08-09 09:05:26', '2023-08-09 09:05:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(9, 13, 'uploads/products/16910626101.jpg', '2023-08-03 04:36:50', '2023-08-03 04:36:50'),
(10, 14, 'uploads/products/16915823441.jpg', '2023-08-09 04:59:04', '2023-08-09 04:59:04'),
(12, 17, 'uploads/products/16915970661.jpg', '2023-08-09 09:04:26', '2023-08-09 09:04:26'),
(13, 18, 'uploads/products/16915971261.jpg', '2023-08-09 09:05:26', '2023-08-09 09:05:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_name` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(500) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `email1` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `website_name`, `website_url`, `page_title`, `meta_keyword`, `meta_description`, `address`, `phone1`, `phone2`, `email1`, `email2`, `facebook`, `twitter`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'bachxuanhieu', 'http://127.0.0.1:8000/', 'bachxuanhieu', 'bachxuanhieu', 'bachxuanhieu', '12 trinh dinh thao', '0815663667', '0815663667', 'hieucoganglen@gmail.com', 'hieucoganglen@gmail.com', 'https://www.facebook.com/', 'tw', 'https://www.facebook.com/', NULL, '2023-08-08 05:10:37', '2023-08-08 06:18:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=hidden,0=visiable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Giải pháp thương mại điện tử tốt nhất 1 để nâng cao tên thương hiệu bán hàng', 'Chúng tôi cung cấp một chiến lược tiếp thị kỹ thuật số thành công và định hướng theo ngành giúp khách hàng của chúng tôi\r\n                            trong việc đạt được sự hiện diện trực tuyến mạnh mẽ và lợi nhuận tối đa của công ty.', 'uploads/sliders/1690998529.jpg', 0, '2023-08-02 10:29:53', '2023-08-02 10:48:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=user, 1=admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_as`) VALUES
(1, 'Bach Xuan Hieu', 'hieupro@gmail.com', NULL, '$2y$10$eVfGD/F1G5eBtUvenxzrTOiM6rUVsk3.3BU0w7VhWmAWORbS0r5f2', '14f2J0pl0r4uT7h6nZPoguN0NgEQvJW4nq6M4gyxKUR5JCiP0CwC8Psw7Z1P', '2023-07-30 01:14:24', '2023-08-09 04:05:04', 1),
(2, 'hieupro', 'hieu123@gmail.com', NULL, '$2y$10$27CGath2rSiCtbkQLaJ7b.f1z/gHIWurVqEzINagW1xxEJPVm725O', NULL, '2023-08-05 05:16:15', '2023-08-05 05:16:15', 0),
(4, 'hieupro', 'mo@gmail.com', NULL, '$2y$10$2Duzi9Gw8m0xRfyrgoRHp.Eg5lIFaDAJPEGBDX.3lF48RuSG5B3om', NULL, '2023-08-08 09:41:11', '2023-08-08 10:03:59', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pin_code` varchar(255) NOT NULL,
  `address` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `phone`, `pin_code`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, '0815663667', '123456', 'Thôn 8, Cư Bao, Buôn Hồ, Đakak', '2023-08-09 01:42:32', '2023-08-09 01:42:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 1, 13, '2023-08-04 05:00:23', '2023-08-04 05:00:23'),
(5, 1, 9, '2023-08-04 05:00:51', '2023-08-04 05:00:51'),
(6, 1, 10, '2023-08-04 05:04:19', '2023-08-04 05:04:19'),
(7, 1, 14, '2023-08-09 05:55:45', '2023-08-09 05:55:45');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_foreign` (`product_id`),
  ADD KEY `product_colors_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_image_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_details_user_id_unique` (`user_id`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `products_image_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
