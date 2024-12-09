/*
 Navicat Premium Data Transfer

 Source Server         : web_backend_y4
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : 206.189.144.45:3334
 Source Schema         : my_first_app_db

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 24/02/2024 20:35:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat` decimal(4,2) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cambodia',
  `image` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_category_id_foreign` (`category_id`),
  CONSTRAINT `brands_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of brands
-- ----------------------------
BEGIN;
INSERT INTO `brands` (`id`, `name`, `vat`, `country`, `image`, `category_id`, `created_at`, `updated_at`) VALUES (1, 'addidas', 10.00, 'Cambodia', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fzh%2Fsearch%2Fadidas-logo&psig=AOvVaw3gD4YNQRgP_uxuU-8h6aVc&ust=1708498880361000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCIjK_LisuYQDFQAAAAAdAAAAABAE', 1, '2024-02-20 07:52:00', '2024-02-20 07:52:00');
INSERT INTO `brands` (`id`, `name`, `vat`, `country`, `image`, `category_id`, `created_at`, `updated_at`) VALUES (2, 'may & marry', 10.00, 'Cambodia', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Feng.marynmay.com%2F&psig=AOvVaw3N6NwGLNpt6QrKt2PxQ1-a&ust=1708498954214000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCPDjitysuYQDFQAAAAAdAAAAABAR', 2, '2024-02-20 07:52:00', '2024-02-20 07:52:00');
COMMIT;

-- ----------------------------
-- Table structure for car_models
-- ----------------------------
DROP TABLE IF EXISTS `car_models`;
CREATE TABLE `car_models` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `car_id` int unsigned NOT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `car_models_car_id_foreign` (`car_id`),
  CONSTRAINT `car_models_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of car_models
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for car_product
-- ----------------------------
DROP TABLE IF EXISTS `car_product`;
CREATE TABLE `car_product` (
  `car_id` int unsigned NOT NULL,
  `product_car_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `car_product_car_id_foreign` (`car_id`),
  KEY `car_product_product_car_id_foreign` (`product_car_id`),
  CONSTRAINT `car_product_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `car_product_product_car_id_foreign` FOREIGN KEY (`product_car_id`) REFERENCES `product_car` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of car_product
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for car_production_dates
-- ----------------------------
DROP TABLE IF EXISTS `car_production_dates`;
CREATE TABLE `car_production_dates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int unsigned NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_production_dates_model_id_foreign` (`model_id`),
  CONSTRAINT `car_production_dates_model_id_foreign` FOREIGN KEY (`model_id`) REFERENCES `car_models` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of car_production_dates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cards
-- ----------------------------
DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `card_owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_user_id_foreign` (`user_id`),
  CONSTRAINT `cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cards
-- ----------------------------
BEGIN;
INSERT INTO `cards` (`id`, `user_id`, `card_owner`, `card_number`, `cvv`, `expire_date`, `created_at`, `updated_at`) VALUES (1, 4, 'vannsann', '123456789', '321', '2/2025', '2024-02-21 06:39:53', '2024-02-21 06:39:53');
INSERT INTO `cards` (`id`, `user_id`, `card_owner`, `card_number`, `cvv`, `expire_date`, `created_at`, `updated_at`) VALUES (2, 4, 'alex john', '987654321', '123', '2/2025', '2024-02-21 06:39:53', '2024-02-21 06:39:53');
COMMIT;

-- ----------------------------
-- Table structure for cars
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `founded` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `qty` decimal(4,2) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of carts
-- ----------------------------
BEGIN;
INSERT INTO `carts` (`id`, `product_id`, `user_id`, `qty`, `price`, `status`, `created_at`, `updated_at`) VALUES (1, 1, 4, 1.00, 10.00, 'pending', '2024-02-21 06:40:12', '2024-02-21 06:40:12');
INSERT INTO `carts` (`id`, `product_id`, `user_id`, `qty`, `price`, `status`, `created_at`, `updated_at`) VALUES (2, 2, 4, 2.00, 20.00, 'pending', '2024-02-21 06:40:12', '2024-02-21 06:40:12');
INSERT INTO `carts` (`id`, `product_id`, `user_id`, `qty`, `price`, `status`, `created_at`, `updated_at`) VALUES (3, 1, 4, 1.00, 10.00, 'pending', '2024-02-21 06:40:20', '2024-02-21 06:40:20');
INSERT INTO `carts` (`id`, `product_id`, `user_id`, `qty`, `price`, `status`, `created_at`, `updated_at`) VALUES (4, 2, 4, 2.00, 20.00, 'pending', '2024-02-21 06:40:20', '2024-02-21 06:40:20');
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'sport', '2024-02-20 07:52:00', '2024-02-20 07:52:00');
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'comestic', '2024-02-20 07:52:00', '2024-02-20 07:52:00');
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'clothes', '2024-02-20 07:52:00', '2024-02-20 07:52:00');
COMMIT;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `commentable_id` bigint unsigned NOT NULL,
  `commentable_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved` int DEFAULT '0',
  `active` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_post_id_foreign` (`post_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
BEGIN;
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (1, 1, 'App\\Models\\Post', 1, 1, 'comment post 1', '2023-12-09 18:02:42', '2023-12-09 18:02:42', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (2, 1, 'App\\Models\\Post', 1, 1, 'comment post 2', '2023-12-09 18:02:42', '2023-12-09 18:02:42', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (3, 1, 'App\\Models\\Post', 1, 2, 'comment post 1', '2023-12-09 18:02:42', '2023-12-09 18:02:42', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (4, 1, 'App\\Models\\Post', 1, 2, 'comment post 2', '2023-12-09 18:02:42', '2023-12-09 18:02:42', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (5, 1, 'App\\Models\\Post', 1, 3, 'comment post 1', '2023-12-09 18:04:25', '2023-12-09 18:04:25', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (6, 1, 'App\\Models\\Post', 1, 3, 'comment post 2', '2023-12-09 18:04:25', '2023-12-09 18:04:25', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (7, 1, 'App\\Models\\Post', 1, 4, 'comment post 1', '2023-12-09 18:04:25', '2023-12-09 18:04:25', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (8, 1, 'App\\Models\\Post', 1, 4, 'comment post 2', '2023-12-09 18:04:25', '2023-12-09 18:04:25', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (9, 1, 'App\\Models\\Post', 1, 9, 'comment post 1', '2023-12-09 18:13:38', '2023-12-09 18:13:38', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (10, 1, 'App\\Models\\Post', 1, 9, 'comment post 2', '2023-12-09 18:13:38', '2023-12-09 18:13:38', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (11, 1, 'App\\Models\\Post', 1, 10, 'comment post 1', '2023-12-09 18:13:38', '2023-12-09 18:13:38', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (12, 1, 'App\\Models\\Post', 1, 10, 'comment post 2', '2023-12-09 18:13:38', '2023-12-09 18:13:38', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (13, 1, 'App\\Models\\Post', 1, 11, 'comment post 1', '2023-12-09 18:13:59', '2023-12-09 18:13:59', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (14, 1, 'App\\Models\\Post', 1, 11, 'comment post 2', '2023-12-09 18:13:59', '2023-12-09 18:13:59', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (15, 1, 'App\\Models\\Post', 1, 12, 'comment post 1', '2023-12-09 18:13:59', '2023-12-09 18:13:59', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (16, 1, 'App\\Models\\Post', 1, 12, 'comment post 2', '2023-12-09 18:13:59', '2023-12-09 18:13:59', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (17, 1, 'App\\Models\\Post', 1, 13, 'comment post 1', '2023-12-09 18:14:16', '2023-12-09 18:14:16', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (18, 1, 'App\\Models\\Post', 1, 13, 'comment post 2', '2023-12-09 18:14:16', '2023-12-09 18:14:16', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (19, 1, 'App\\Models\\Post', 1, 14, 'comment post 1', '2023-12-09 18:14:16', '2023-12-09 18:14:16', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (20, 1, 'App\\Models\\Post', 1, 14, 'comment post 2', '2023-12-09 18:14:16', '2023-12-09 18:14:16', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (21, 1, 'App\\Models\\Post', 2, 4, 'Dicta ullam exercitationem in eos aut rerum.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (22, 1, 'App\\Models\\Post', 5, 20, 'Corrupti necessitatibus id ipsum labore at.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (23, 1, 'App\\Models\\Post', 18, 15, 'Culpa porro et ipsam mollitia.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (24, 1, 'App\\Models\\Post', 12, 17, 'Ut hic consequatur dolor dolores ut dolores.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (25, 1, 'App\\Models\\Post', 7, 2, 'Recusandae voluptatibus ipsum eligendi earum hic sit accusantium.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (26, 1, 'App\\Models\\Post', 3, 10, 'Vitae neque iste veritatis et cupiditate.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (27, 1, 'App\\Models\\Post', 11, 15, 'Autem pariatur fugiat maiores.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (28, 1, 'App\\Models\\Post', 9, 12, 'Et qui qui veritatis impedit vero eligendi pariatur nihil.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (29, 1, 'App\\Models\\Post', 12, 10, 'Sit corporis voluptas quo quia incidunt.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (30, 1, 'App\\Models\\Post', 18, 20, 'Dolores et aliquid perferendis possimus nemo.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (31, 1, 'App\\Models\\Post', 4, 3, 'Perferendis cupiditate amet voluptatem ipsa at consequatur.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (32, 1, 'App\\Models\\Post', 15, 16, 'Culpa ratione accusantium est labore quia enim.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (33, 1, 'App\\Models\\Post', 1, 1, 'Aliquid eius sunt repudiandae ut optio officiis.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (34, 1, 'App\\Models\\Post', 3, 10, 'Fugit eos voluptas veniam deleniti.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (35, 1, 'App\\Models\\Post', 17, 16, 'Omnis corporis quidem et necessitatibus.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (36, 1, 'App\\Models\\Post', 20, 13, 'Quod et esse voluptates aut voluptatum ut sapiente.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (37, 1, 'App\\Models\\Post', 2, 4, 'Et vitae laudantium laboriosam magnam debitis laudantium.', '2023-12-10 03:31:07', '2023-12-10 03:31:07', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (39, 1, 'App\\Models\\Post', 6, 2, 'Ea aut expedita aut possimus.', '2023-12-10 04:41:06', '2023-12-10 04:41:06', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (40, 1, 'App\\Models\\Post', 14, 20, 'Voluptatem amet eum aut praesentium necessitatibus distinctio sunt rerum.', '2023-12-10 04:41:06', '2023-12-10 04:41:06', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (41, 1, 'App\\Models\\Post', 16, 4, 'Ab sit suscipit asperiores aliquam hic necessitatibus voluptatem.', '2023-12-10 04:41:06', '2023-12-10 04:41:06', 0, 0);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (43, 1, 'App\\Models\\Post', 1, 55, 'comment post 1', '2023-12-10 08:46:49', '2023-12-10 08:46:49', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (44, 1, 'App\\Models\\Post', 1, 55, 'comment post 2', '2023-12-10 08:46:49', '2023-12-10 08:46:49', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (45, 1, 'App\\Models\\Post', 1, 56, 'comment post 1', '2023-12-10 08:46:49', '2023-12-10 08:46:49', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (46, 1, 'App\\Models\\Post', 1, 56, 'comment post 2', '2023-12-10 08:46:49', '2023-12-10 08:46:49', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (47, 1, 'App\\Models\\Post', 1, 57, 'comment post 1', '2023-12-10 08:56:23', '2023-12-10 08:56:23', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (48, 1, 'App\\Models\\Post', 1, 57, 'comment post 2', '2023-12-10 08:56:23', '2023-12-10 08:56:23', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (49, 1, 'App\\Models\\Post', 1, 58, 'comment post 1', '2023-12-10 08:56:23', '2023-12-10 08:56:23', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (50, 1, 'App\\Models\\Post', 1, 58, 'comment post 2', '2023-12-10 08:56:23', '2023-12-10 08:56:23', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (51, 1, 'App\\Models\\Post', 1, 59, 'comment post 1', '2023-12-10 08:57:51', '2023-12-10 08:57:51', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (52, 1, 'App\\Models\\Post', 1, 59, 'comment post 2', '2023-12-10 08:57:51', '2023-12-10 08:57:51', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (53, 1, 'App\\Models\\Post', 1, 60, 'comment post 1', '2023-12-10 08:57:51', '2023-12-10 08:57:51', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (54, 1, 'App\\Models\\Post', 1, 60, 'comment post 2', '2023-12-10 08:57:51', '2023-12-10 08:57:51', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (55, 1, 'App\\Models\\Post', 1, 61, 'comment post 1', '2023-12-10 10:31:35', '2023-12-10 10:31:35', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (56, 1, 'App\\Models\\Post', 1, 61, 'comment post 2', '2023-12-10 10:31:35', '2023-12-10 10:31:35', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (57, 1, 'App\\Models\\Post', 1, 62, 'comment post 1', '2023-12-10 10:31:35', '2023-12-10 10:31:35', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (58, 1, 'App\\Models\\Post', 1, 62, 'comment post 2', '2023-12-10 10:31:35', '2023-12-10 10:31:35', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (59, 1, 'App\\Models\\Post', 1, 63, 'comment post 1', '2023-12-10 10:31:42', '2023-12-10 10:31:42', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (60, 1, 'App\\Models\\Post', 1, 63, 'comment post 2', '2023-12-10 10:31:42', '2023-12-10 10:31:42', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (61, 1, 'App\\Models\\Post', 1, 64, 'comment post 1', '2023-12-10 10:31:42', '2023-12-10 10:31:42', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (62, 1, 'App\\Models\\Post', 1, 64, 'comment post 2', '2023-12-10 10:31:42', '2023-12-10 10:31:42', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (63, 1, 'App\\Models\\Post', 1, 65, 'comment post 1', '2023-12-15 07:34:10', '2023-12-15 07:34:10', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (64, 1, 'App\\Models\\Post', 1, 65, 'comment post 2', '2023-12-15 07:34:10', '2023-12-15 07:34:10', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (65, 1, 'App\\Models\\Post', 1, 66, 'comment post 1', '2023-12-15 07:34:10', '2023-12-15 07:34:10', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (66, 1, 'App\\Models\\Post', 1, 66, 'comment post 2', '2023-12-15 07:34:10', '2023-12-15 07:34:10', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (67, 1, 'App\\Models\\Post', 1, 69, 'comment post 1', '2024-01-12 09:23:18', '2024-01-12 09:23:18', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (68, 1, 'App\\Models\\Post', 1, 69, 'comment post 2', '2024-01-12 09:23:18', '2024-01-12 09:23:18', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (69, 1, 'App\\Models\\Post', 1, 70, 'comment post 1', '2024-01-12 09:23:18', '2024-01-12 09:23:18', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (70, 1, 'App\\Models\\Post', 1, 70, 'comment post 2', '2024-01-12 09:23:18', '2024-01-12 09:23:18', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (71, 1, 'App\\Models\\Post', 2, 71, 'comment post 1', '2024-01-12 09:23:39', '2024-01-12 09:23:39', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (72, 1, 'App\\Models\\Post', 2, 71, 'comment post 2', '2024-01-12 09:23:39', '2024-01-12 09:23:39', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (73, 1, 'App\\Models\\Post', 2, 72, 'comment post 1', '2024-01-12 09:23:39', '2024-01-12 09:23:39', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (74, 1, 'App\\Models\\Post', 2, 72, 'comment post 2', '2024-01-12 09:23:39', '2024-01-12 09:23:39', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (75, 1, 'App\\Models\\Post', 3, 73, 'comment post 1', '2024-01-12 09:26:52', '2024-01-12 09:26:52', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (76, 1, 'App\\Models\\Post', 3, 73, 'comment post 2', '2024-01-12 09:26:52', '2024-01-12 09:26:52', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (77, 1, 'App\\Models\\Post', 3, 74, 'comment post 1', '2024-01-12 09:26:52', '2024-01-12 09:26:52', 1, 1);
INSERT INTO `comments` (`id`, `commentable_id`, `commentable_type`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `approved`, `active`) VALUES (78, 1, 'App\\Models\\Post', 3, 74, 'comment post 2', '2024-01-12 09:26:52', '2024-01-12 09:26:52', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of employees
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for engines
-- ----------------------------
DROP TABLE IF EXISTS `engines`;
CREATE TABLE `engines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int unsigned NOT NULL,
  `engine_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `engines_model_id_foreign` (`model_id`),
  CONSTRAINT `engines_model_id_foreign` FOREIGN KEY (`model_id`) REFERENCES `car_models` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of engines
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
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

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for headquarters
-- ----------------------------
DROP TABLE IF EXISTS `headquarters`;
CREATE TABLE `headquarters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `car_id` int unsigned NOT NULL,
  `headquarters` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `headquarters_car_id_foreign` (`car_id`),
  CONSTRAINT `headquarters_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of headquarters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint unsigned NOT NULL,
  `imageable_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of images
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of job_batches
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '2016_06_01_000001_create_oauth_auth_codes_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2016_06_01_000002_create_oauth_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2016_06_01_000004_create_oauth_clients_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11, '2022_11_05_163108_create_return_settings_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12, '2022_11_05_164517_create_reasons_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13, '2022_11_05_164552_create_sub_reasons_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14, '2022_11_11_034201_create_table_posts', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15, '2022_11_13_013346_create_students_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16, '2022_11_13_090348_create_phones_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (19, '2022_11_19_041059_create_comments_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (20, '2022_11_19_075437_create_employees_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (21, '2022_11_21_042751_add_isadmin_to_users', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (22, '2022_11_22_160245_create_notifications_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (23, '2022_11_27_040907_create_sales_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (24, '2022_11_27_072643_create_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25, '2022_11_27_134013_create_job_batches_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (26, '2022_12_03_102135_create_cars_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (27, '2022_12_03_125933_create_headquarters_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (28, '2022_12_03_132445_create_engines_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (29, '2022_12_03_150413_create_car_production_dates_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (30, '2022_12_03_153331_create_product_c_s_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (31, '2022_12_03_153433_create_car_products_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (32, '2022_12_07_035325_create_images_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (33, '2022_12_07_070808_create_videos_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (34, '2022_12_07_071718_create_tags_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (35, '2022_12_07_071824_creates_taggables_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (37, '2022_12_27_124134_create_new_letters_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (38, '2023_01_11_152125_alter_string_reference', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (39, '2023_10_16_033227_add_column_approve_to_posts', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (40, '2023_10_23_090506_add_column_activate_to_phones', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (41, '2023_10_28_081654_add_column_uuid_to_users', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (46, '2022_11_13_133420_create_roles_table', 3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (48, '2023_12_10_043901_create_permission_tables', 4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (49, '2022_11_13_133710_create_role_users_table', 5);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (50, '2022_12_09_092217_add_colum_status_to_role_users', 5);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (51, '2024_01_12_065826_add_column_metadata_to_posts', 6);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (52, '2024_01_12_091454_add_column_enum_role_to_users', 7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (53, '2024_01_27_165213_create_vistited_places_table', 8);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (56, '2024_02_01_153025_order_detail', 9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (58, '2024_02_07_160853_create_categories_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (60, '2024_02_16_054256_create_sub_category', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (62, '2024_02_16_061102_create_planed_vists_places_table', 11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (63, '2024_02_16_073435_create_planed_vists_place_details_table', 12);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (66, '2024_02_17_144902_add_column_title_to_planed_visit_places', 14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (67, '2024_02_07_161015_create_brands_table', 15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (68, '2022_10_15_074214_create_products_table', 16);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (69, '2024_02_16_054717_add_column_subcategory_to_product', 17);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (70, '2024_02_20_150005_create_carts_table', 18);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (71, '2024_02_20_162125_create_verification_codes_table', 18);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (72, '2024_02_20_162438_add_column_phone_to_users', 18);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (73, '2024_02_20_164926_create_cards_table', 18);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (74, '2024_02_01_152856_order', 19);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (75, '2024_02_21_055945_add_column_is_card_info_enable_to_users', 20);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (76, '2024_02_21_060044_create_payment_methods_table', 20);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (77, '2024_02_21_060107_create_transactions_table', 20);
COMMIT;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for new_letters
-- ----------------------------
DROP TABLE IF EXISTS `new_letters`;
CREATE TABLE `new_letters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of new_letters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_order_id_foreign` (`order_id`),
  KEY `order_details_product_id_foreign` (`product_id`),
  CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_details
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `grant_qty` decimal(4,2) NOT NULL,
  `grant_total` decimal(4,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `items` json NOT NULL,
  `address` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` (`id`, `grant_qty`, `grant_total`, `status`, `items`, `address`, `created_at`, `updated_at`) VALUES (1, 10.00, 20.00, 'pending', '[1, 2, 3, 4]', '{\"city\": \"Phnom penh\", \"name\": \"up\", \"address\": \"1st 225 psa depo2\", \"country\": \"Cambodia\", \"phone number\": \"097878765\"}', '2024-02-21 06:40:58', '2024-02-21 06:40:58');
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (1, 'view users', 'web', '2023-12-10 05:10:17', '2023-12-10 05:10:17');
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (2, 'create users', 'web', '2023-12-10 05:10:17', '2023-12-10 05:10:17');
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (3, 'edit users', 'web', '2023-12-10 05:10:17', '2023-12-10 05:10:17');
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (4, 'delete users', 'web', '2023-12-10 05:10:17', '2023-12-10 05:10:17');
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (1, 'App\\Models\\User', 1, 'API TOKEN', '226d363241507242527d286a230d1fbc9aad953358b22b7aa1902d4ab8093db6', '[\"*\"]', '2024-01-12 09:26:52', NULL, '2023-12-10 10:28:50', '2024-01-12 09:26:52');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (2, 'App\\Models\\User', 4, 'API TOKEN', 'a615fa189309c0bedd313afd5924068fe6121bf99ccab3122b506c1a5f3dcee3', '[\"*\"]', '2024-02-16 13:35:28', NULL, '2024-01-28 13:41:09', '2024-02-16 13:35:28');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (3, 'App\\Models\\User', 4, 'API TOKEN', '456ed8627473243b9ade1c63538125043eabed4f6610c06d41c9bfca4db9d37b', '[\"*\"]', '2024-02-17 16:11:37', NULL, '2024-02-16 15:57:47', '2024-02-17 16:11:37');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (4, 'App\\Models\\User', 4, 'API TOKEN', '56b7a1c509b4e8b0415e77dc9713fa1c93cd362be0b552d4900d605365417c83', '[\"*\"]', NULL, NULL, '2024-02-17 08:56:28', '2024-02-17 08:56:28');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (5, 'App\\Models\\User', 4, 'API TOKEN', 'bab8b4805d8fa0be612803270e29a2ecd02b8d9deeae54d27c23f76d9004ab0f', '[\"*\"]', '2024-02-24 09:47:06', NULL, '2024-02-17 08:57:04', '2024-02-24 09:47:06');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (6, 'App\\Models\\User', 4, 'API TOKEN', '322483e6b925550858afd16bd1282a774f1dd3705d8501cc3ef84b796d237d16', '[\"*\"]', '2024-02-24 08:40:47', NULL, '2024-02-17 17:03:00', '2024-02-24 08:40:47');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (7, 'App\\Models\\User', 4, 'API TOKEN', 'b084e499ccb4e1d0b7b42d9fca4a709c6be5cd158e3c0b8f8944017917aacfc4', '[\"*\"]', NULL, NULL, '2024-02-18 07:26:43', '2024-02-18 07:26:43');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (8, 'App\\Models\\User', 4, 'API TOKEN', '944a7143f1399f5f367a2f3f154e84f527d9ee5b76fddecaa77b86c5527cd5c7', '[\"*\"]', '2024-02-24 12:27:35', NULL, '2024-02-18 15:56:18', '2024-02-24 12:27:35');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (9, 'App\\Models\\User', 4, 'API TOKEN', 'd318d93975f7e001ffdee14622a79d30f42892898635ef5152f16ec335e82721', '[\"*\"]', '2024-02-20 17:13:30', NULL, '2024-02-20 17:12:55', '2024-02-20 17:13:30');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (10, 'App\\Models\\User', 4, 'API TOKEN', '2980af67ca634f189849979343493451b0b31f5cbbc8ee11e1c0d4332bf8cabd', '[\"*\"]', '2024-02-21 14:22:10', NULL, '2024-02-21 02:42:43', '2024-02-21 14:22:10');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (11, 'App\\Models\\User', 4, 'API TOKEN', '5778ed3f6ec30f1ac5008f80e631f93eaf357e1687198bca8fa694af5ccdadc8', '[\"*\"]', '2024-02-21 06:41:34', NULL, '2024-02-21 06:35:11', '2024-02-21 06:41:34');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (12, 'App\\Models\\User', 4, 'API TOKEN', 'd02aa65f6cd6afae5f18ae1e36db69afb3cd68231014f2cd96fa7cb4903f001f', '[\"*\"]', NULL, NULL, '2024-02-21 10:32:27', '2024-02-21 10:32:27');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (13, 'App\\Models\\User', 4, 'API TOKEN', '70ff059755cc9b45e37bd7962b5a63e834581f2bcafbe563eab0ce7a3da85a3e', '[\"*\"]', NULL, NULL, '2024-02-21 10:33:17', '2024-02-21 10:33:17');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (14, 'App\\Models\\User', 4, 'API TOKEN', '987aa62f5dfa0a5aef0cae845014fb46dc7a551b7e62be6b1d8f3e0c55594c70', '[\"*\"]', NULL, NULL, '2024-02-21 10:33:59', '2024-02-21 10:33:59');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (15, 'App\\Models\\User', 4, 'Laravel9PassportAuth', 'c25179463a968114f8162f7dfb012d4d38c8333f78f973e93853275e7b60d175', '[\"*\"]', NULL, NULL, '2024-02-21 10:34:39', '2024-02-21 10:34:39');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (16, 'App\\Models\\User', 4, 'Laravel9PassportAuth', 'c967c15da0245aea88155df777a28d777dd0e393fa56a63ec1f54081b5f5bf37', '[\"*\"]', NULL, NULL, '2024-02-21 10:35:01', '2024-02-21 10:35:01');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (17, 'App\\Models\\User', 4, 'Laravel9PassportAuth', 'c2d47b9eaa0b2b83c0ee21767dac6c6d5eca7b731da38bdb97c67e318ec596da', '[\"*\"]', NULL, NULL, '2024-02-21 10:35:17', '2024-02-21 10:35:17');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (18, 'App\\Models\\User', 4, 'Laravel9PassportAuth', '890f9b28b8630836cdcb86cd4f474d034364c95e96ed59e926dea4001d93c455', '[\"*\"]', NULL, NULL, '2024-02-21 10:35:35', '2024-02-21 10:35:35');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (19, 'App\\Models\\User', 4, 'Laravel9PassportAuth', '027294a939f89689cd703709420ca623306e2aa083168909b9d16dcd1bf3de81', '[\"*\"]', NULL, NULL, '2024-02-21 10:36:34', '2024-02-21 10:36:34');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (20, 'App\\Models\\User', 4, 'API TOKEN', '67e272646a74e6a3ea631d5afbf4147e0df1d612e4d6817f25164a3fe3c767d0', '[\"*\"]', '2024-02-24 02:30:30', NULL, '2024-02-22 15:17:42', '2024-02-24 02:30:30');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (21, 'App\\Models\\User', 4, 'API TOKEN', 'c5e68c0b29a673170c41530c6a4844cfa693ef7804f0c1d0189a4d3904929111', '[\"*\"]', NULL, NULL, '2024-02-22 18:18:22', '2024-02-22 18:18:22');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (22, 'App\\Models\\User', 4, 'API TOKEN', '76ef9dae9e19be372d321fe583d0f0ed9934d38d6e54e38e41f32e64fbb22b3b', '[\"*\"]', NULL, NULL, '2024-02-22 18:20:12', '2024-02-22 18:20:12');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (23, 'App\\Models\\User', 4, 'API TOKEN', '695881242c529bc036a12bc729b66e93f3707e0c124d78bce20d2d64a796969b', '[\"*\"]', NULL, NULL, '2024-02-22 18:21:43', '2024-02-22 18:21:43');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (24, 'App\\Models\\User', 4, 'API TOKEN', 'a1b8eccd18636c13395abfdaacf530fb1dee678d306c3645eebcb6f51f3bada4', '[\"*\"]', NULL, NULL, '2024-02-22 18:22:43', '2024-02-22 18:22:43');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (25, 'App\\Models\\User', 4, 'API TOKEN', '35d3751a590a8eff49687b0b938010367e865897c101e8ff349223f4f8e02b82', '[\"*\"]', NULL, NULL, '2024-02-22 18:50:56', '2024-02-22 18:50:56');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (26, 'App\\Models\\User', 4, 'API TOKEN', 'b537d78d83e7d090932287d01b59aba0f97ae0ab8a849c356e9aa55212b71a2e', '[\"*\"]', NULL, NULL, '2024-02-22 18:52:27', '2024-02-22 18:52:27');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (27, 'App\\Models\\User', 4, 'API TOKEN', '7288a28c3076210271393facd0b07365af3e274de37fb4713f075b0dbcf3fed3', '[\"*\"]', NULL, NULL, '2024-02-22 18:53:30', '2024-02-22 18:53:30');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (28, 'App\\Models\\User', 4, 'API TOKEN', '93ad9fc87f73dba5b5562f745a8916b19f631ac6d212f82d49f4bc9e2bbc1b4c', '[\"*\"]', NULL, NULL, '2024-02-22 19:01:03', '2024-02-22 19:01:03');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (29, 'App\\Models\\User', 5, 'API TOKEN', '80c207ec25585455c0e2f09c7a654d6e711feafa58f5735ddc18900af0a6dfa7', '[\"*\"]', NULL, NULL, '2024-02-22 19:03:17', '2024-02-22 19:03:17');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (30, 'App\\Models\\User', 4, 'API TOKEN', '793263442c1d9330436107fc07cecdb5e639106808429a31ba34c8e48518a79a', '[\"*\"]', '2024-02-24 11:58:49', NULL, '2024-02-22 19:27:41', '2024-02-24 11:58:49');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (31, 'App\\Models\\User', 7, 'API TOKEN', 'e9a2cced9374878941ebca3f1b13038c6ebc3c02f78c4a70796c9f218b66aa42', '[\"*\"]', '2024-02-24 12:04:44', NULL, '2024-02-24 02:31:12', '2024-02-24 12:04:44');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (32, 'App\\Models\\User', 4, 'API TOKEN', '041de96386a79b3d5bd7812f0d7963ff3f017854b641be1dbd80a80811ad693d', '[\"*\"]', '2024-02-24 13:13:29', NULL, '2024-02-24 08:34:45', '2024-02-24 13:13:29');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (33, 'App\\Models\\User', 4, 'API TOKEN', 'dde176ca0a5ffbfb9c7b0b3fdb57e6995961af7155e95acaef472ed5dd85b6cf', '[\"*\"]', '2024-02-24 12:39:47', NULL, '2024-02-24 09:25:44', '2024-02-24 12:39:47');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (34, 'App\\Models\\User', 4, 'API TOKEN', '7c32c552bcd1d89862acbfbe1f1c6abe12de17bdfa13b59c1cc2e01a87203d95', '[\"*\"]', '2024-02-24 12:52:21', NULL, '2024-02-24 12:49:57', '2024-02-24 12:52:21');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (35, 'App\\Models\\User', 4, 'API TOKEN', 'ad506db2de476b30821d7edc10a95914e99fb24b52661d25664283373273814a', '[\"*\"]', '2024-02-24 13:13:39', NULL, '2024-02-24 13:09:41', '2024-02-24 13:13:39');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (36, 'App\\Models\\User', 4, 'API TOKEN', 'ba608e9fe3ae45fed949f23f7d1c91353a68823784a18697fb3c208c035d7e39', '[\"*\"]', '2024-02-24 13:22:28', NULL, '2024-02-24 13:22:22', '2024-02-24 13:22:28');
COMMIT;

-- ----------------------------
-- Table structure for phones
-- ----------------------------
DROP TABLE IF EXISTS `phones`;
CREATE TABLE `phones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activate` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phones_user_id_foreign` (`user_id`),
  CONSTRAINT `phones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of phones
-- ----------------------------
BEGIN;
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (33, '099 123 123', 1, '2023-12-10 08:46:49', '2023-12-10 08:46:49', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (34, '099 123 213', 1, '2023-12-10 08:46:49', '2023-12-10 08:46:49', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (35, '099 123 312', 1, '2023-12-10 08:46:49', '2023-12-10 08:46:49', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (36, '099 123 231', 1, '2023-12-10 08:46:49', '2023-12-10 08:46:49', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (37, '099 123 123', 1, '2023-12-10 08:56:23', '2023-12-10 08:56:23', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (38, '099 123 213', 1, '2023-12-10 08:56:23', '2023-12-10 08:56:23', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (39, '099 123 312', 1, '2023-12-10 08:56:23', '2023-12-10 08:56:23', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (40, '099 123 231', 1, '2023-12-10 08:56:23', '2023-12-10 08:56:23', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (41, '099 123 123', 1, '2023-12-10 08:57:51', '2023-12-10 08:57:51', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (42, '099 123 213', 1, '2023-12-10 08:57:51', '2023-12-10 08:57:51', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (43, '099 123 312', 1, '2023-12-10 08:57:51', '2023-12-10 08:57:51', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (44, '099 123 231', 1, '2023-12-10 08:57:51', '2023-12-10 08:57:51', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (45, '099 123 123', 1, '2023-12-10 10:31:35', '2023-12-10 10:31:35', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (46, '099 123 213', 1, '2023-12-10 10:31:35', '2023-12-10 10:31:35', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (47, '099 123 312', 1, '2023-12-10 10:31:35', '2023-12-10 10:31:35', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (48, '099 123 231', 1, '2023-12-10 10:31:35', '2023-12-10 10:31:35', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (49, '099 123 123', 1, '2023-12-10 10:31:42', '2023-12-10 10:31:42', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (50, '099 123 213', 1, '2023-12-10 10:31:42', '2023-12-10 10:31:42', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (51, '099 123 312', 1, '2023-12-10 10:31:42', '2023-12-10 10:31:42', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (52, '099 123 231', 1, '2023-12-10 10:31:42', '2023-12-10 10:31:42', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (53, '099 123 123', 1, '2023-12-15 07:34:10', '2023-12-15 07:34:10', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (54, '099 123 213', 1, '2023-12-15 07:34:10', '2023-12-15 07:34:10', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (55, '099 123 312', 1, '2023-12-15 07:34:10', '2023-12-15 07:34:10', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (56, '099 123 231', 1, '2023-12-15 07:34:10', '2023-12-15 07:34:10', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (57, '099 123 123', 1, '2024-01-12 09:23:18', '2024-01-12 09:23:18', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (58, '099 123 213', 1, '2024-01-12 09:23:18', '2024-01-12 09:23:18', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (59, '099 123 312', 1, '2024-01-12 09:23:18', '2024-01-12 09:23:18', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (60, '099 123 231', 1, '2024-01-12 09:23:18', '2024-01-12 09:23:18', 1);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (61, '099 123 123', 1, '2024-01-12 09:23:39', '2024-01-12 09:23:39', 2);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (62, '099 123 213', 1, '2024-01-12 09:23:39', '2024-01-12 09:23:39', 2);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (63, '099 123 312', 1, '2024-01-12 09:23:39', '2024-01-12 09:23:39', 2);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (64, '099 123 231', 1, '2024-01-12 09:23:39', '2024-01-12 09:23:39', 2);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (65, '099 123 123', 1, '2024-01-12 09:26:52', '2024-01-12 09:26:52', 3);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (66, '099 123 213', 1, '2024-01-12 09:26:52', '2024-01-12 09:26:52', 3);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (67, '099 123 312', 1, '2024-01-12 09:26:52', '2024-01-12 09:26:52', 3);
INSERT INTO `phones` (`id`, `phone`, `activate`, `created_at`, `updated_at`, `user_id`) VALUES (68, '099 123 231', 1, '2024-01-12 09:26:52', '2024-01-12 09:26:52', 3);
COMMIT;

-- ----------------------------
-- Table structure for places
-- ----------------------------
DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visited` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of places
-- ----------------------------
BEGIN;
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (12, 'Berlin', 0);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (13, 'Budapest', 0);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (14, 'Cincinnati', 1);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (15, 'Denver', 0);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (16, 'Helsinki', 0);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (17, 'Lisbon', 0);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (18, 'Moscow', 1);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (19, 'Nairobi', 0);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (20, 'Oslo', 1);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (21, 'Rio', 0);
INSERT INTO `places` (`id`, `name`, `visited`) VALUES (22, 'Tokyo', 0);
COMMIT;

-- ----------------------------
-- Table structure for planed_visit_places
-- ----------------------------
DROP TABLE IF EXISTS `planed_visit_places`;
CREATE TABLE `planed_visit_places` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'untitle',
  PRIMARY KEY (`id`),
  KEY `planed_visit_places_user_id_foreign` (`user_id`),
  CONSTRAINT `planed_visit_places_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of planed_visit_places
-- ----------------------------
BEGIN;
INSERT INTO `planed_visit_places` (`id`, `start_date`, `end_date`, `user_id`, `created_at`, `updated_at`, `title`) VALUES (1, '2024-02-27 00:00:00', '2024-02-29 00:00:00', 4, '2024-02-24 13:13:30', '2024-02-24 13:13:30', 'Siem Reap');
COMMIT;

-- ----------------------------
-- Table structure for planed_vists_place_details
-- ----------------------------
DROP TABLE IF EXISTS `planed_vists_place_details`;
CREATE TABLE `planed_vists_place_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `day` int NOT NULL,
  `plan_visit_place_id` bigint unsigned NOT NULL,
  `visit_place_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `planed_vists_place_details_plan_visit_place_id_foreign` (`plan_visit_place_id`),
  KEY `planed_vists_place_details_visit_place_id_foreign` (`visit_place_id`),
  CONSTRAINT `planed_vists_place_details_plan_visit_place_id_foreign` FOREIGN KEY (`plan_visit_place_id`) REFERENCES `planed_visit_places` (`id`) ON DELETE CASCADE,
  CONSTRAINT `planed_vists_place_details_visit_place_id_foreign` FOREIGN KEY (`visit_place_id`) REFERENCES `visited_places` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of planed_vists_place_details
-- ----------------------------
BEGIN;
INSERT INTO `planed_vists_place_details` (`id`, `day`, `plan_visit_place_id`, `visit_place_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, 1, NULL, NULL);
INSERT INTO `planed_vists_place_details` (`id`, `day`, `plan_visit_place_id`, `visit_place_id`, `created_at`, `updated_at`) VALUES (2, 1, 1, 2, NULL, NULL);
INSERT INTO `planed_vists_place_details` (`id`, `day`, `plan_visit_place_id`, `visit_place_id`, `created_at`, `updated_at`) VALUES (3, 2, 1, 3, NULL, NULL);
INSERT INTO `planed_vists_place_details` (`id`, `day`, `plan_visit_place_id`, `visit_place_id`, `created_at`, `updated_at`) VALUES (4, 2, 1, 4, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `approved` int DEFAULT '0',
  `active` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
BEGIN;
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (1, 'title 1', 'body testing', 1, 0, 0, '2023-12-09 18:02:42', '2024-01-12 07:15:08', '{\"tags\":[\"eloquent\",\"eloquent\",\"eloquent\"]}');
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (2, 'title 2', 'body testing', 1, 0, 0, '2023-12-09 18:02:42', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (3, 'title 1', 'body testing', 1, 0, 0, '2023-12-09 18:04:25', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (4, 'title 2', 'body testing', 1, 0, 0, '2023-12-09 18:04:25', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (9, 'title 1', 'body testing', 1, 0, 0, '2023-12-09 18:13:37', '2023-12-09 18:13:38', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (10, 'title 2', 'body testing', 1, 0, 0, '2023-12-09 18:13:37', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (11, 'title 1', 'body testing', 1, 0, 0, '2023-12-09 18:13:59', '2023-12-09 18:13:59', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (12, 'title 2', 'body testing', 1, 0, 0, '2023-12-09 18:13:59', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (13, 'title 1', 'body testing', 1, 0, 0, '2023-12-09 18:14:16', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (14, 'title 2', 'body testing', 1, 0, 0, '2023-12-09 18:14:16', '2023-12-09 18:14:16', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (15, 'Voluptatem iure dolor nesciunt aperiam hic est.', 'Vel doloremque at alias deleniti. Asperiores vel vero molestiae qui ad dolores. Fugiat animi omnis mollitia earum quasi.', 13, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (16, 'Harum magni tempore facilis et et incidunt.', 'Doloremque rerum tempora et quo consequuntur recusandae. Optio laudantium et quia. Ut quo dolore est dolorum. Delectus quis asperiores veritatis sit aut qui.', 10, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (17, 'Animi incidunt non quia voluptatem ullam.', 'Quasi dolorem nesciunt quasi sapiente. Veritatis nam inventore dolorem explicabo occaecati tenetur quia. Vel perferendis et voluptatum earum.', 12, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (18, 'Sit distinctio quisquam saepe nihil explicabo molestiae et ut.', 'Saepe consequatur ut quam id labore aut animi. Nulla ea placeat autem et saepe nemo porro. Voluptatem eaque sit quidem corrupti id magni et. Vel et ad nihil et.', 8, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (19, 'Quam recusandae ex dolor qui provident.', 'Rerum minima sunt quibusdam beatae sit. Assumenda delectus debitis qui ea nihil dolores labore. Et expedita dolores dolorem molestias voluptas quidem. Aut repellendus voluptas eius in.', 17, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (20, 'Dolores minima nostrum laudantium delectus deleniti autem quis.', 'Voluptatem facilis consectetur nemo ratione reprehenderit perferendis. Eum eius et eum iste.', 16, 0, 0, '2023-12-10 03:31:07', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (21, 'Consequatur rerum et quibusdam in corporis.', 'Et nulla quis ea placeat vitae tempore. Natus voluptates ullam sunt iste distinctio. Distinctio natus hic qui ut repellat consequuntur molestiae.', 6, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (22, 'Autem id delectus molestiae perferendis nihil doloribus.', 'Magnam perferendis et illo fuga. Aperiam ab dolores dolorum quis itaque aspernatur.', 19, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (23, 'Ea voluptas consequatur rem quo iste corporis.', 'Incidunt iure est fugit. Accusamus provident sequi explicabo ipsam laborum.', 18, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (24, 'Iusto quae voluptatibus eaque dolores dicta excepturi eum nobis.', 'Molestias est harum adipisci ut numquam aut. Quidem sit non beatae quam quia. Sit voluptate eaque qui aut ad praesentium asperiores voluptates.', 9, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (25, 'Aspernatur enim minus expedita nihil aspernatur perferendis.', 'Iusto suscipit culpa excepturi in. Ut et voluptates et. Quis quis eaque dolores asperiores repudiandae rerum voluptatem numquam.', 16, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (26, 'Sed aut enim ab ipsam.', 'Illum eius dignissimos commodi enim aut qui aliquid. Suscipit nihil voluptas alias voluptatibus. Unde ut possimus voluptatum iure voluptas.', 1, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (27, 'Rem tenetur autem dicta dolores.', 'Illum dignissimos aut dolor molestiae exercitationem fuga. Omnis assumenda ratione possimus omnis voluptatem quidem. Libero animi sint et illo dolore et dolorem.', 1, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (28, 'Ea eveniet quia in.', 'Dignissimos laboriosam reprehenderit et. Libero quis praesentium saepe necessitatibus aut nulla. Est voluptatem totam maiores molestiae.', 1, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (29, 'Dignissimos dignissimos ut nobis eveniet quas.', 'Et enim qui quod similique est nobis. Voluptas qui eum recusandae in. Est omnis saepe quisquam minus suscipit. Iste aut quasi voluptate quo.', 18, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (30, 'Id harum ut ipsam sed.', 'Eum aut esse eaque quas dolore quibusdam recusandae. Eveniet ex quod quam similique delectus enim et. Est laudantium labore veniam.', 13, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (31, 'Commodi est repellendus asperiores explicabo amet.', 'Recusandae et architecto aspernatur voluptatem blanditiis et voluptatem voluptas. Maxime neque quam voluptate dolore. Cupiditate illo repudiandae non autem et accusamus.', 3, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (32, 'Dignissimos odit fugit reiciendis debitis veritatis quaerat est nesciunt.', 'Et minus autem expedita est quis tenetur. Sit sed quis architecto. Possimus quaerat et suscipit et. Est voluptates aut cumque eos omnis quod.', 17, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (33, 'Ut et voluptate voluptates id.', 'Consectetur sunt unde vel consequatur vel excepturi. Fuga quaerat perferendis earum cum omnis consequatur ipsa. Perspiciatis et voluptatem iure atque. Voluptas veniam iusto facere.', 8, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (34, 'Quisquam suscipit temporibus possimus similique corporis beatae rerum.', 'Nostrum aperiam culpa ab et deserunt est. Sit qui libero eius quaerat. Aspernatur quo porro vitae.', 10, 0, 0, '2023-12-10 03:31:07', '2023-12-10 03:31:07', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (35, 'Asperiores ad et vel consequatur ut.', 'Praesentium aliquam sit hic. A sint animi officiis unde ut ratione. Expedita fuga est molestiae laborum sint est culpa. Ad minima vel fugiat repellendus a est veniam quas.', 20, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (36, 'Aspernatur mollitia ex ad sint.', 'Provident consequuntur dignissimos minima voluptas repellat nisi magnam. Ipsa laboriosam quia sit est illo et est ratione. Cupiditate enim cumque dolor non.', 20, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (37, 'Vitae aut sunt culpa aut est nobis.', 'Molestiae modi impedit doloremque quisquam. Laudantium et temporibus et quasi qui quia atque. Dolore rem quia nihil sint atque. Officiis pariatur ab numquam omnis.', 5, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (38, 'Praesentium mollitia iusto rerum qui excepturi.', 'Aut dolorem ut magnam inventore vel id aliquid. Aperiam fugiat ratione earum in rem rerum. Dolorem maiores officiis totam blanditiis odio ex. Qui iusto deserunt modi qui ad nihil.', 15, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (39, 'Tempore dolorem et eligendi.', 'Est dolorem et sunt reiciendis laboriosam alias. Quia quas accusamus voluptatem qui. Amet modi deleniti cum impedit est. Qui hic unde et.', 7, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (40, 'Est nulla delectus blanditiis modi tempora accusantium omnis.', 'Dolorem hic tenetur voluptatem incidunt excepturi fugit. Debitis quidem voluptate facilis quia. Laborum aut nulla cupiditate consequatur deleniti et. Magni aspernatur tenetur cupiditate sint.', 16, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (41, 'Nihil qui consequatur doloremque dolorem qui in.', 'Ducimus amet tempore aut illum itaque pariatur hic. Nihil nisi sed autem. Et veritatis reiciendis aut ipsa eum. Distinctio corporis corporis nisi corrupti ab quo.', 6, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (42, 'Ut facere iste voluptatem vitae facilis.', 'Est eius consequatur et ratione. Vel neque culpa et cumque.', 7, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (43, 'Voluptatem ipsam nobis repudiandae aut necessitatibus sit expedita.', 'Aut hic autem provident cupiditate officiis veniam soluta ipsa. Nemo et voluptatem cupiditate commodi quas dicta.', 9, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (44, 'Tenetur placeat velit dicta error praesentium ex neque.', 'Ratione harum sit aut occaecati magnam. Omnis odit repellendus iusto enim possimus ut nulla. Totam consectetur temporibus repellat natus laudantium fuga aut.', 18, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (45, 'Rerum commodi mollitia ut fuga est expedita.', 'Animi sequi non voluptas ullam at sit laudantium. Qui eaque quis consequatur excepturi. Qui veritatis numquam quia sunt quisquam. Sed quisquam facilis voluptate.', 12, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (46, 'Accusantium quisquam voluptas alias.', 'Eum ullam quam ut repudiandae. Molestias laborum id perferendis qui id labore. Dicta quibusdam aut quisquam iusto atque. Natus nihil aperiam rem velit ut.', 18, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (47, 'Qui eos sit suscipit molestias atque tempore aperiam.', 'Sint omnis et nobis sit quia consequatur qui. Sint enim eligendi deleniti explicabo in ut qui. Ipsum ea nisi iste voluptatibus sed soluta nihil et. Fugit est occaecati et maiores.', 17, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (48, 'Tempora dolorem est ipsam consequatur.', 'Autem qui molestias optio ex deleniti. Sequi omnis sunt quasi nisi rerum optio aut. Commodi qui dolor mollitia ut nostrum doloribus qui. Aut sed et sapiente facere nesciunt dolores voluptate.', 11, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (49, 'Officia sit eveniet dolorem atque laboriosam.', 'Eos asperiores sit repudiandae in voluptatem eos. Ad minima non aut odit nihil quis. Non qui esse veniam. Explicabo voluptate architecto sapiente est occaecati aut non.', 11, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (50, 'Ut nostrum nesciunt quia consequatur quo cum.', 'Quisquam est quibusdam sequi est commodi ut et. Magnam qui odio iusto voluptatibus cupiditate. Libero deleniti libero illum laborum aut. Qui aliquam earum harum.', 17, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (51, 'Harum aliquid totam id repudiandae est aut.', 'Eos qui debitis et. Dolorem rem cum et omnis doloremque. Voluptas consequuntur voluptatem cumque ut nam corporis.', 5, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (52, 'A officiis reiciendis placeat ut.', 'Error et deleniti corrupti voluptates vitae ut. Voluptatem et inventore sint perferendis et quaerat quisquam et. Eius velit placeat laborum officiis harum.', 12, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (53, 'Voluptatem quia a veritatis aliquid tenetur quis iusto ea.', 'Expedita accusamus recusandae ut quis ex perferendis. Eligendi possimus doloremque aut enim eveniet. Eligendi ea tenetur necessitatibus ad qui.', 18, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (54, 'Autem enim aspernatur hic.', 'Et vitae totam sit. Ipsam qui ut illum rem harum quia.', 14, 0, 0, '2023-12-10 04:41:06', '2023-12-10 04:41:06', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (55, 'title 1', 'body testing', 1, 0, 0, '2023-12-10 08:46:49', '2023-12-10 08:46:49', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (56, 'title 2', 'body testing', 1, 0, 0, '2023-12-10 08:46:49', '2023-12-10 08:46:49', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (57, 'title 1', 'body testing', 1, 0, 0, '2023-12-10 08:56:23', '2023-12-10 08:56:23', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (58, 'title 2', 'body testing', 1, 0, 0, '2023-12-10 08:56:23', '2023-12-10 08:56:23', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (59, 'title 1', 'body testing', 1, 0, 0, '2023-12-10 08:57:51', '2023-12-10 08:57:51', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (60, 'title 2', 'body testing', 1, 0, 0, '2023-12-10 08:57:51', '2023-12-10 08:57:51', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (61, 'title 1', 'body testing', 1, 0, 0, '2023-12-10 10:31:35', '2023-12-10 10:31:35', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (62, 'title 2', 'body testing', 1, 0, 0, '2023-12-10 10:31:35', '2023-12-10 10:31:35', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (63, 'title 1', 'body testing', 1, 0, 0, '2023-12-10 10:31:42', '2023-12-10 10:31:42', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (64, 'title 2', 'body testing', 1, 0, 0, '2023-12-10 10:31:42', '2023-12-10 10:31:42', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (65, 'title 1', 'body testing', 1, 0, 0, '2023-12-15 07:34:10', '2023-12-15 07:34:10', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (66, 'title 2', 'body testing', 1, 0, 0, '2023-12-15 07:34:10', '2023-12-15 07:34:10', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (67, 'Sample Post Title', 'Sample Post body', 1, 0, 0, '2024-01-12 07:07:51', '2024-01-12 07:07:51', '{\"author\":\"Prevail E.\",\"tags\":[\"laravel\",\"json\"]}');
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (68, 'Sample Post Title', 'Sample Post body', 1, 0, 0, '2024-01-12 07:13:52', '2024-01-12 07:43:38', '{\"tags\":[\"eloquent test\",\"eloquent test\"],\"key\":[\"test\"]}');
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (69, 'title 1', 'body testing', 1, 0, 0, '2024-01-12 09:23:18', '2024-01-12 09:23:18', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (70, 'title 2', 'body testing', 1, 0, 0, '2024-01-12 09:23:18', '2024-01-12 09:23:18', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (71, 'title 1', 'body testing', 2, 0, 0, '2024-01-12 09:23:39', '2024-01-12 09:23:39', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (72, 'title 2', 'body testing', 2, 0, 0, '2024-01-12 09:23:39', '2024-01-12 09:23:39', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (73, 'title 1', 'body testing', 3, 0, 0, '2024-01-12 09:26:52', '2024-01-12 09:26:52', NULL);
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `approved`, `active`, `created_at`, `updated_at`, `metadata`) VALUES (74, 'title 2', 'body testing', 3, 0, 0, '2024-01-12 09:26:52', '2024-01-12 09:26:52', NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_car
-- ----------------------------
DROP TABLE IF EXISTS `product_car`;
CREATE TABLE `product_car` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_car
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `size` json NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `brand_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sub_category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_sub_category_id_foreign` (`sub_category_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (1, 'samba classic shoes', 'sambaClassicShoes', 1.00, 90.00, 'detail', 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/02b5819cd7bb4bfd8a3fa7fd012d9359_9366/Samba_Classic_Shoes_White_772109_04_standard.jpg', '[\"M6\", \"M7\", \"M8\", \"M9\"]', 'A FAITHFUL REPRODUCTION OF THE 1950 SAMBA SNEAKER.Getting up and down the field with speed is the name of the indoor game. The Samba has dominated indoor soccer for decades for a reason. These legendary shoes feature a leather upper and a lightweight EVA midsole for better response on indoor surfaces.', 1, '2024-02-20 07:52:00', '2024-02-20 07:52:00', 1);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (2, 'grand court 2.0 shoes', 'grandCourt2.0Shoes', 1.00, 56.00, 'detail', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bbc94634d9d84bcb9aaea2a15de52872_9366/Grand_Court_2.0_Shoes_Blue_ID2969_04_standard.jpg', '[\"M6\", \"M7\", \"M8\", \"M9\"]', 'EVERYDAY CASUAL SHOES MADE IN PART WITH RECYCLED MATERIALS.Meet your new go-to pair. These adidas Grand Court shoes come to life through a modern refresh of all the iconic design elements. Comfort gets an upgrade thanks to increased forefoot flexibility, while the Cloudfoam midsole keeps your feet happy from commute to coffee run. No matter where the day takes you, Grand Court 2.0 provides unmatched comfort and versatility to keep you grounded yet on the go.This product features at least 20% recycled materials. By reusing materials that have already been created, we help to reduce waste and our reliance on finite resources and reduce the footprint of the products we make.', 1, '2024-02-20 07:52:00', '2024-02-20 07:52:00', 1);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (3, 'samba shoes', 'sambaShoes', 1.00, 150.00, 'detail', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/52c951e30dcb4ff1bfdfd053405a6f75_9366/Samba_Shoes_Pink_IG1243_01_standard.jpg', '[\"M6\", \"M7\", \"M8\", \"M9\"]', 'VINTAGE-STYLE SHOES IN WEARABLE EARTH TONES.Still making an impression. After adidas\' Samba shoes made their name in sports they went on to find a place among the fashion-forward in numerous subcultures. These updated shoes take minimalist design cues from the classic silhouette and push even further with subtle accents and barely-there 3-Stripes. Lace-up and let history repeat itself looking as fresh as ever.', 1, '2024-02-20 07:52:00', '2024-02-20 07:52:00', 1);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (4, 'ultraboost light shoes', 'ultraboostLightShoes', 1.00, 190.00, 'detail', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/603054f90779462f92ccbc56321755e9_9366/Ultraboost_Light_Running_Shoes_Black_GY9351_HM3_hover.jpg', '[\"M6\", \"M7\", \"M8\", \"M9\"]', 'EPIC ENERGY. LIGHTEST EVER.Experience epic energy with the new Ultraboost Light, our lightest Ultraboost ever. The magic lies in the Light BOOST midsole, a new generation of adidas BOOST. Its unique molecule design achieves the lightest BOOST foam to date. With hundreds of BOOST capsules bursting with energy and ultimate cushioning and comfort, some feet really can have it all.', 1, '2024-02-20 07:52:01', '2024-02-20 07:52:01', 2);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (5, 'supernova rise shoes', 'supernovaRiseShoes', 1.00, 140.00, 'detail', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a60dd09c810e4ec19d592b249c670695_9366/Supernova_Rise_Shoes_Blue_IF9837_HM1.jpg', '[\"M6\", \"M7\", \"M8\", \"M9\"]', 'SUPERCOMFORT. SUPERNOVA.We\'ve designed the Supernova Rise to deliver maximum comfort in every stride. Our Dreamstrike+ technology cushions the midsole with ​re-engineered super foam. What makes it so super, you ask? It offers the ideal balance of comfort and support to keep you comfy mile after mile. Additionally you will get a system of denser foam Support Rods which means in the real world worry-free transition from heel to toe. Finally, our Comfort Heel Fit combines cushy foam and soft textile for a more secure fit so that it feels like the shoe is giving your heel a hug.', 1, '2024-02-20 07:52:01', '2024-02-20 07:52:01', 2);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (6, 'adicolor classics 3-stripes hoodie', 'adicolorClassics3StripesHoodie', 1.00, 56.00, 'detail', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/05f220749ecb43dfa48bafd000b5e15f_9366/Adicolor_Classics_3-Stripes_Hoodie_Black_IM2088_21_model.jpg', '[\"XS\", \"S\", \"M\", \"L\", \"XL\"]', 'A QUINTESSENTIAL HOODIE SPORTING THE ICONIC TREFOIL LOGO.You can\'t go wrong with a classic. A beloved style for a reason, this hoodie is packed with OG adidas style from the signature 3-Stripes to the embroidered Trefoil logo on the chest. The casual, regular fit makes it easy to slip on for an extra layer of warmth around the house or while seizing the day with friends.Comfort in the detailsThe soft fleece build guarantees long lasting warmth. On cool or windy days, the built-in drawcord-adjustable hood adds an extra layer of comfort. A large front kangaroo pocket is a great place to stash small essentials or to warm cold hands.The cotton in this product has been sourced through Better Cotton. Better Cotton is sourced via a chain of custody model called mass balance. This means that Better Cotton is not physically traceable to end products.Find out more here: https://bettercotton.org/who-we-are/our-logo/', 1, '2024-02-20 07:52:01', '2024-02-20 07:52:01', 3);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (7, 'team issue pullover hoodie', 'teamIssuePulloverHoodie', 1.00, 48.00, 'detail', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d1a3ce3a480e4809b36aaeb6018a6f22_9366/Team_Issue_Pullover_Hoodie_Grey_HI3084_21_model.jpg', '[\"XS\", \"S\", \"M\", \"L\", \"XL\"]', 'A PULLOVER HOODIE WITH A ZIP POCKET, MADE WITH RECYCLED MATERIALS.This adidas hoodie is destined to be the one you reach for every time you head out the door. The comfy fleece build is made for all-day comfort, and AEROREADY manages moisture so you stay dry. But what sets this pullover apart is the front zip pocket. Stash your key and card and you\'re good to go.Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 1, '2024-02-20 07:52:01', '2024-02-20 07:52:01', 3);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (8, 'lounge fleece sweatshirt', 'loungeFleeceSweatshirt', 1.00, 65.00, 'detail', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/17fb95b586764dcd919537c4580cfeaa_9366/Lounge_Fleece_Sweatshirt_Pink_IS1598_21_model.jpg', '[\"XS\", \"S\", \"M\", \"L\", \"XL\"]', 'A SOFT CREW MADE IN PART WITH A BLEND OF RECYCLED AND RENEWABLE MATERIALS.Whether you\'re curled up on the couch or running errands around town, this adidas fleece crewneck sweatshirt keeps you cozy while expressing your laid-back style. The soft cotton and polyester blend fleece fabric and ribbed cuffs offer comfort that lasts from your morning latte to an evening chill session. Slip into the weekend in this go-to layer — its modern diamond collar and tonal adidas Badge of Sport add subtle flair so you look put together even when you\'d rather lounge.By choosing recycled, we are able to reuse materials that have already been created, which helps to reduce waste. Renewable materials choices will help us to remove our reliance on finite resources. Our products made with a blend of recycled and renewable materials feature at least 70% total of these materials.', 1, '2024-02-20 07:52:01', '2024-02-20 07:52:01', 3);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (9, 'essentials fleece tapered cuff big logo pants', 'essentialsFleeceTaperedCuffBigLogoPants', 1.00, 50.00, 'detail', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3fc42e6506a5466aa38dafc40076ec44_9366/Essentials_Fleece_Tapered_Cuff_Big_Logo_Pants_Black_IB4025_21_model.jpg', '[\"XS\", \"S\", \"M\", \"L\", \"XL\"]', 'WARM SWEAT PANTS MADE WITH A BLEND OF RECYCLED AND RENEWABLE MATERIALS.The fit is tapered. The fabric is seriously cozy. These adidas sweat pants are a comfortable choice whether you\'re lounging around, working from home or ticking other tasks off your list. Why not add your favorite hoodie and give your whole body a hug?A minimum of 70% of this product is a blend of recycled and renewable materials.', 1, '2024-02-20 07:52:01', '2024-02-20 07:52:01', 4);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (10, 'tiro 23 league pants', 'tiro23LeaguePants', 1.00, 50.00, 'detail', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bf9cb1cf4d5541e984e9aefa00b6e59d_9366/Tiro_23_League_Pants_Black_HS7232_21_model.jpg', '[\"XS\", \"S\", \"M\", \"L\", \"XL\"]', 'MOISTURE-MANAGING TRACK PANTS FOR TRAINING, MADE WITH RECYCLED MATERIALS.Born for the beautiful game. Part of the Tiro 23 League range, these adidas soccer pants use AEROREADY to channel moisture away from your skin and keep you firing on all cylinders. Ankle zips mean they\'re easy to slide off when your session is done.', 1, '2024-02-20 07:52:01', '2024-02-20 07:52:01', 4);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (11, 'Mary&May Idebenone+Blackberry Complex Serum 30ml', 'Mary&MayIdebenone+BlackberryComplexSerum30ml', 1.00, 15.00, 'Wrinkle, Firming, Skin Tone Up, Fragrance Free, Korean Skincare, marynmayVisit the Mary&May Store', 'https://cdn.imweb.me/thumbnail/20230111/a90605c0e51bf.jpg', '[\"30ml\"]', 'A fast-absorbing serum formulated with highly concentrated Idebenone that works in synergy with Blackberry Complex, maximizing the antioxidant effect on skinFormulated with EWG verified green grade ingredientsInternational products have separate terms, are sold from abroad and may differ from local products, including fit, age ratings, and language of product, labeling or instructions', 2, '2024-02-20 07:52:01', '2024-02-20 07:52:01', 5);
INSERT INTO `products` (`id`, `name`, `sku`, `quantity`, `price`, `detail`, `image`, `size`, `description`, `brand_id`, `created_at`, `updated_at`, `sub_category_id`) VALUES (12, 'Mary&May Idebenone+Blackberry Intense Cream 70g', 'Mary&MayIdebenone+BlackberryIntenseCream70g', 1.00, 20.00, 'Aging Control, Firming, Skin Tone Up, Skin Barrier, Ceramide, Korean Skincare, marynmay', 'https://cdn.imweb.me/thumbnail/20220817/0a47f4260226b.jpg', '[\"70g\"]', 'A multi-functional cream formulated with 63% Blackberry Complex and Idebenone (500ppm) that have powerful antioxidant property, restoring youthful looking skin.Contains 5 kinds of Ceramides and Phytosphingosine to create strong skin moisture barrier and prevent natural water loss.Delivers intense hydration to parched skin with a thick and smooth cream texture.Refines the appearance of visible wrinkles and provides a skin-whitening effect.', 2, '2024-02-20 07:52:01', '2024-02-20 07:52:01', 5);
COMMIT;

-- ----------------------------
-- Table structure for reasons
-- ----------------------------
DROP TABLE IF EXISTS `reasons`;
CREATE TABLE `reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of reasons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for return_settings
-- ----------------------------
DROP TABLE IF EXISTS `return_settings`;
CREATE TABLE `return_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of return_settings
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
BEGIN;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (1, 1);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (2, 1);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (3, 1);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (4, 1);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (1, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (2, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (3, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (1, 3);
COMMIT;

-- ----------------------------
-- Table structure for role_users
-- ----------------------------
DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `role_users_user_id_foreign` (`user_id`),
  KEY `role_users_role_id_foreign` (`role_id`),
  CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_users
-- ----------------------------
BEGIN;
INSERT INTO `role_users` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`, `status`) VALUES (1, 1, 1, '2023-12-10 08:46:49', '2023-12-10 15:46:49', 1);
INSERT INTO `role_users` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`, `status`) VALUES (2, 2, 1, '2024-01-12 09:23:39', '2024-01-12 16:23:39', 1);
INSERT INTO `role_users` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`, `status`) VALUES (3, 3, 1, '2024-01-12 09:26:52', '2024-01-12 16:26:52', 1);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (1, 'admin', 'web', '2023-12-10 05:10:17', '2023-12-10 05:10:17');
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (2, 'user', 'web', '2023-12-10 05:10:17', '2023-12-10 05:10:17');
COMMIT;

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Item Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sales Channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Order Priority` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Order Date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Order ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ship Date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Units Sold` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Unit Price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Unit Cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Total Revenue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Total Cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Total Profit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sales
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profileimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of students
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sub_category
-- ----------------------------
DROP TABLE IF EXISTS `sub_category`;
CREATE TABLE `sub_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_category_category_id_foreign` (`category_id`),
  CONSTRAINT `sub_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sub_category
-- ----------------------------
BEGIN;
INSERT INTO `sub_category` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES (1, 'sneacker', 1, '2024-02-20 07:52:00', '2024-02-20 07:52:00');
INSERT INTO `sub_category` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES (2, 'running', 1, '2024-02-20 07:52:00', '2024-02-20 07:52:00');
INSERT INTO `sub_category` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES (3, 'hoodie', 3, '2024-02-20 07:52:00', '2024-02-20 07:52:00');
INSERT INTO `sub_category` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES (4, 'pant', 3, '2024-02-20 07:52:00', '2024-02-20 07:52:00');
INSERT INTO `sub_category` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES (5, 'serum', 2, '2024-02-20 07:52:00', '2024-02-20 07:52:00');
INSERT INTO `sub_category` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES (6, 'cream', 2, '2024-02-20 07:52:00', '2024-02-20 07:52:00');
COMMIT;

-- ----------------------------
-- Table structure for sub_reasons
-- ----------------------------
DROP TABLE IF EXISTS `sub_reasons`;
CREATE TABLE `sub_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sub_reasons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for taggables
-- ----------------------------
DROP TABLE IF EXISTS `taggables`;
CREATE TABLE `taggables` (
  `tag_id` bigint unsigned NOT NULL,
  `taggable_id` bigint unsigned NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of taggables
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `receiver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of transactions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enum_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'guest',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_card_info_enable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`, `phone`, `is_card_info_enable`) VALUES (1, 'John333', 'john333@example.com', NULL, '$2y$10$C/BLQqiM69CYjtQSwvHQlOa/xa00EOByu7yeo49hGtsw2QbayOwn6', NULL, '2023-12-10 08:08:38', '2023-12-10 08:08:38', 1, '8cd89773-220b-4c52-8c3a-1e5333694895', 'guest', NULL, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`, `phone`, `is_card_info_enable`) VALUES (2, 'John3333', 'john333@example.com', NULL, '$2y$10$M5WCJ5AiHS7/CJt89wT3qu2urPSokDfKwsPKrB0iEBrsh0bmiIzEq', NULL, '2024-01-12 09:23:39', '2024-01-12 09:23:39', 1, 'c2127b2f-df3f-4592-a2a3-f8541eb9aba9', 'admin', NULL, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`, `phone`, `is_card_info_enable`) VALUES (3, 'John333412', 'john333@example.com', NULL, '$2y$10$APpBlqYceO.JSpXoyKul.OQBEn1C0uuiwWneLEoGl.JHQAkusEA9m', NULL, '2024-01-12 09:26:52', '2024-01-12 09:26:52', 1, '385e8a66-c33e-42f5-b85e-066b76a2851a', 'admin', NULL, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`, `phone`, `is_card_info_enable`) VALUES (4, 'vannsann', 'vannsann1@gmail.com', NULL, '$2y$10$ASeyEMWd5HaE5nZfrMWNjOMnzWuUg9pV19mf8/IE4INV1hng205ou', NULL, '2024-01-28 13:40:47', '2024-01-28 13:40:47', 0, '06aefb2e-4e10-41dc-90d6-1c5be2cb2101', 'guest', NULL, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`, `phone`, `is_card_info_enable`) VALUES (5, 'yonghai', 'admin@admin.com', NULL, '$2y$10$2wCsfMnVbqh/y7lnigoNEO.eIDxv.Lwc/dsboMIU3anc.d4PziJf.', NULL, '2024-02-22 18:49:03', '2024-02-22 18:49:03', 0, 'a4930e0f-9844-4bbf-930a-a1560107a4d2', 'guest', NULL, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`, `phone`, `is_card_info_enable`) VALUES (6, 'chhun', 'admin2@admin.com', NULL, '$2y$10$KLBOwQAoCq0oiu6PLkyRhe8DMkh86YanS9Wo.ymNYRIG.0shQYNqW', NULL, '2024-02-22 19:03:54', '2024-02-22 19:03:54', 0, 'b51ae38d-d069-4056-bd3a-4e0bc8a451c1', 'guest', NULL, 0);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`, `phone`, `is_card_info_enable`) VALUES (7, 'chhun', 'chhun7174@gmail.com', NULL, '$2y$10$PyRBbBxDqLq7Gz3XwwI/uOC0EP/3i8CoSNNEuBTKYdYPVbT.2mjBq', NULL, '2024-02-24 02:26:08', '2024-02-24 02:26:08', 0, '31831354-c744-42a3-8022-7689853e1b64', 'guest', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for verification_codes
-- ----------------------------
DROP TABLE IF EXISTS `verification_codes`;
CREATE TABLE `verification_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of verification_codes
-- ----------------------------
BEGIN;
INSERT INTO `verification_codes` (`id`, `user_id`, `otp`, `expire_at`, `created_at`, `updated_at`) VALUES (1, 4, '991116', '2024-02-21 12:39:43', '2024-02-21 12:34:43', '2024-02-21 12:34:43');
INSERT INTO `verification_codes` (`id`, `user_id`, `otp`, `expire_at`, `created_at`, `updated_at`) VALUES (2, 4, '539952', '2024-02-21 12:41:05', '2024-02-21 12:36:05', '2024-02-21 12:36:05');
INSERT INTO `verification_codes` (`id`, `user_id`, `otp`, `expire_at`, `created_at`, `updated_at`) VALUES (3, 4, '850205', '2024-02-21 12:41:46', '2024-02-21 12:36:46', '2024-02-21 12:36:46');
COMMIT;

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of videos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for visited_places
-- ----------------------------
DROP TABLE IF EXISTS `visited_places`;
CREATE TABLE `visited_places` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate_star` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` decimal(4,2) NOT NULL,
  `evaluation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewer_population` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_show_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories` json DEFAULT NULL,
  `openingTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `closingTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `googleMapsLink` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_on_map` json DEFAULT NULL,
  `images` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of visited_places
-- ----------------------------
BEGIN;
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (1, 'Angkor Wat', 'Siem Reap', 'Krong Siem Reap, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"temple\", \"travel\"]', '5:00 AM', '6:00 PM', 'A UNESCO World Heritage site, Angkor Wat is the largest religious monument in the world and a symbol of Cambodia.', 'https://maps.app.goo.gl/6kJ69LMALQNhPjTT9', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://ik.imgkit.net/3vlqs5axxjf/TAW/uploadedImages/All_Gateways/ASPAC/Hotel_Review/Angkor%20Wat%20Hotels_HERO-2.jpg?tr=w-1200%2Cfo-auto\", \"title\": \"Angkor Wat\"}, {\"img\": \"https://upload.wikimedia.org/wikipedia/commons/6/60/Angkor_Wat_Temple.jpg\", \"title\": \"Angkor Wat\"}, {\"img\": \"https://cdn.mos.cms.futurecdn.net/veQKQrhqeLXwXHw4Q6qM3N.jpg\", \"title\": \"Angkor Wat\"}, {\"img\": \"https://live.staticflickr.com/2895/14310893720_ea766aa3ac_b.jpg\", \"title\": \"Angkor Wat\"}, {\"img\": \"https://live.staticflickr.com/841/42768480665_d7ec14df67_b.jpg\", \"title\": \"Angkor Wat\"}, {\"img\": \"https://www.holidify.com/images/cmsuploads/compressed/2452357411712c53d5c31o_20201207194155.jpg\", \"title\": \"Angkor Wat\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (2, 'Bayon Temple', 'Siem Reap', 'Angkor Thom, Siem Reap, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"temple\", \"travel\"]', '7: 30 AM', '5: 30 PM', 'Known for its serene stone faces, Bayon stands at the center of Angkor Thom and represents the intersection of heaven and earth.', 'https://maps.app.goo.gl/We6TGarNJW7ndVxo6', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://a.cdn-hotels.com/gdcs/production169/d199/1aa9d4a4-6733-44f4-881a-4036a59b525b.jpg\", \"title\": \"Bayon Temple\"}, {\"img\": \"https://cambodiatravel.com/images/2020/12/Bayon-Temple-angkor-thom-cambodia-1.jpg\", \"title\": \"Bayon Temple\"}, {\"img\": \"https://www.visitsoutheastasia.travel/wp-content/uploads/2019/10/Cambodia-Bayon-Temple.jpg\", \"title\": \"Bayon Temple\"}, {\"img\": \"https://gadttravel.com/uploads/cambodia/phnom-penh/bac74c7535fc9079461678dd8737d5d1-bayon.jpg\", \"title\": \"Bayon Temple\"}, {\"img\": \"https://content.api.news/v3/images/bin/c01e82719a9b9d1507cf7d0f809d170d?width=2048\", \"title\": \"Bayon Temple\"}, {\"img\": \"https://www.thepoortraveler.net/wp-content/uploads/2012/11/bayon.jpg\", \"title\": \"Bayon Temple\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (3, 'Ta Prohm', 'Siem Reap', 'Angkor Archaeological Park, Siem Reap, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"temple\", \"travel\"]', '7: 30 AM', '5: 30 PM', 'Famous for its overgrown trees and ruins entangled with roots, Ta Prohm offers a picturesque and atmospheric experience.', 'https://maps.app.goo.gl/NbFopsKLuNsHM1U58', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://upload.wikimedia.org/wikipedia/commons/8/8c/Ta_Prohm_%28III%29.jpg\", \"title\": \"Ta Prohm\"}, {\"img\": \"https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/2c/f9/d7.jpg\", \"title\": \"Ta Prohm\"}, {\"img\": \"https://i0.wp.com/helloangkor.com/wp-content/uploads/2021/01/HA5D6976.jpg?fit=1200%2C800&ssl=1\", \"title\": \"Ta Prohm\"}, {\"img\": \"https://envirohistorynz.files.wordpress.com/2011/05/a-temple-eating-tree-at-ta-prohm-cambodia.jpg\", \"title\": \"Ta Prohm\"}, {\"img\": \"https://previews.123rf.com/images/ckchiu/ckchiu1201/ckchiu120100056/12072549-ta-prohm-temple-angkor-near-siem-reap-cambodia.jpg\", \"title\": \"Ta Prohm\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (4, 'Banteay Srei', 'Siem Reap', 'Near Siem Reap, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"temple\", \"travel\"]', '7:30 AM', '5:30 PM', 'Often referred to as the \'jewel of Khmer art\', Banteay Srei is renowned for its intricate red sandstone carvings.', 'https://maps.app.goo.gl/6CnoSb7kW4ED9NQeA', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://files.intocambodia.org/content/big/803ed6899fcb4ebdbefaa9fedd358b68.jpg\", \"title\": \"Banteay Srey\"}, {\"img\": \"https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/2c/f0/57.jpg\", \"title\": \"Banteay Srey\"}, {\"img\": \"https://toursbyjeeps.com/wp-content/uploads/2021/01/BTS-Temple.jpg\", \"title\": \"Banteay Srey\"}, {\"img\": \"https://evivatour.com/wp-content/uploads/2021/09/Banteay-Srei-Temple-Siem-Reap-Cambodia.jpg\", \"title\": \"Banteay Srey\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (5, 'Angkor National Museum', 'Siem Reap', 'Charles de Gaulle Blvd, Krong Siem Reap, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"history\", \"travel\", \"museum\"]', '8:30 AM', '6:30 PM', 'This museum enhances understanding of the cultural heritage of the Khmer civilization and Angkor temples.', 'https://maps.app.goo.gl/HYZ2h5hgUZjyx7pv5', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/8f/7d/8b/the-exterior-of-the-museum.jpg?w=1200&h=-1&s=1\", \"title\": \"Angkor National Museum\"}, {\"img\": \"https://www.lotusblancresort.com/uploads/attraction-gallery/national-museum-02.jpg\", \"title\": \"Angkor National Museum\"}, {\"img\": \"https://www.alexinwanderland.com/wp-content/uploads/2011/11/IMG_6707_1.jpg\", \"title\": \"Angkor National Museum\"}, {\"img\": \"https://www.privilegefloor.com/uploads/page-gallery/national-museum-03.jpg\", \"title\": \"Angkor National Museum\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (6, 'Preah Khan', 'Siem Reap', 'North of Angkor Thom, Siem Reap, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"temple\", \"travel\"]', '7:30 AM', '5:30 PM', 'A temple built by King Jayavarman VII, Preah Khan is a labyrinth of vaulted corridors, fine carvings, and lichen-clad stonework.', 'https://maps.app.goo.gl/vVXkz9QDqR8sYygh7', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://upload.wikimedia.org/wikipedia/commons/e/e7/Preah_Khan%2C_Angkor%2C_Camboya%2C_2013-08-17%2C_DD_26.JPG\", \"title\": \"Preah Khan\"}, {\"img\": \"https://a.cdn-hotels.com/gdcs/production186/d922/538d59d8-598c-4f93-be62-c1426024d73c.jpg\", \"title\": \"Preah Khan\"}, {\"img\": \"https://d2d3n9ufwugv3m.cloudfront.net/w1200-h900-cfill/topics/w6hdv-preah%20khan%20temple%20siem%20reap%202.jpg\", \"title\": \"Preah Khan\"}, {\"img\": \"https://www.renown-travel.com/images/preah-khan-l.jpg\", \"title\": \"Preah Khan\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (7, 'Terrace of the Elephants', 'Siem Reap', 'Angkor Thom, Siem Reap, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"temple\", \"travel\"]', '7:30 AM', '5:30 PM', 'Part of the walled city of Angkor Thom, the terrace was used by King Jayavarman VII to view his victorious returning army.', 'https://maps.app.goo.gl/SHiMqhs6XhTXQnVVA', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://www.renown-travel.com/images/terrace-of-the-elephants-l.jpg\", \"title\": \"Elephants Terrace\"}, {\"img\": \"https://a.cdn-hotels.com/gdcs/production134/d1195/01b44185-2882-4e2a-8e15-fb85d5440880.jpg\", \"title\": \"Elephants Terrace\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (8, 'Beng Mealea Temple', 'Siem Reap', '40 km east of the main group of temples at Angkor, Siem Reap Province, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"temple\", \"travel\"]', '7:30 AM', '5:30 PM', 'Comparable to Ta Prohm, Beng Mealea is largely overrun by vegetation and very lightly toured, giving it an adventurous, lost temple feel.', 'https://maps.app.goo.gl/T1kLzPyEdbvnghnK6', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://upload.wikimedia.org/wikipedia/commons/6/6d/Beng_Melea%2C_Cambodia_%282212306460%29.jpg\", \"title\": \"Beng Melea Temple\"}, {\"img\": \"https://www.angkorphotographytours.com/wp-content/uploads/2015/11/IMG_4858.jpg\", \"title\": \"Beng Melea Temple\"}, {\"img\": \"https://a.cdn-hotels.com/gdcs/production196/d1/9902ceb2-f452-449d-bdf3-d1ff7be5b464.jpg\", \"title\": \"Beng Melea Temple\"}, {\"img\": \"https://toursbyjeeps.com/wp-content/uploads/2021/06/BML.jpg\", \"title\": \"Beng Melea Temple\"}, {\"img\": \"https://travellenz.in/wp-content/uploads/2019/08/DSC_0713A.jpg\", \"title\": \"Beng Melea Temple\"}, {\"img\": \"https://journeyofanomadicfamily.com/wp-content/uploads/16-10954-post/DSC_8108.jpg\", \"title\": \"Beng Melea Temple\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (9, 'Phnom Kulen National Park', 'Siem Reap', 'Siem Reap, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"park\", \"travel\", \"waterfall\", \"mountain\"]', '7:00 AM', '5:00 PM', 'A sacred mountain in Cambodian history, known for its carvings, temples, and waterfalls.', 'https://maps.app.goo.gl/L2XH8UiAqKnJxK9T8', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://live.staticflickr.com/5735/23345795526_ee6f22a38b_b.jpg\", \"title\": \"Phnom Kulen\"}, {\"img\": \"https://www.siemreap.net/wp-content/uploads/2017/12/phnom-kulen-waterfall.jpg\", \"title\": \"Phnom Kulen\"}, {\"img\": \"https://cdn.getyourguide.com/img/tour/6482d67390b67.jpeg/145.jpg\", \"title\": \"Phnom Kulen\"}, {\"img\": \"https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/6e/ec/8c.jpg\", \"title\": \"Phnom Kulen\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (10, 'Pub Street', 'Siem Reap', 'Downtown Siem Reap, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"travel\", \"chill\"]', 'Varies', 'Late night', 'A bustling street in Siem Reap known for its vibrant nightlife, restaurants, and bars.', 'https://maps.app.goo.gl/6Tubwj6kBPPp8z3M8', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://a.cdn-hotels.com/gdcs/production85/d1952/83ba4f3b-a86d-4bf4-8113-46987328a108.jpg\", \"title\": \"Pub Street\"}, {\"img\": \"https://d13jio720g7qcs.cloudfront.net/images/destinations/origin/5fa25bf66eed9.jpg\", \"title\": \"Pub Street\"}, {\"img\": \"https://smartsinntravel.com/userfiles/pub-street-smart-sinn-travel4.jpg\", \"title\": \"Pub Street\"}, {\"img\": \"https://live.staticflickr.com/1763/43271516892_0aed5ef0eb_b.jpg\", \"title\": \"Pub Street\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (11, 'Bokor Hill Station', 'Kampot', 'Kampot, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"mountain\", \"travel\", \"water fall\"]', '7:00 AM', '5:00 PM', 'An abandoned French hill station in the Bokor National Park offering stunning views and historical ruins.', 'https://goo.gl/maps/PEX2vVH2qkN2', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://angkorfocus.com/backoffice/uploads/attraction-Bokor%20Mountain%20Kampot%20Province.jpg\", \"title\": \"Bokor Mountain Kampot Province\"}, {\"img\": \"https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/ytypkwshot105fytptyp/Bokor%20Mountain%20Day%20Trip%20from%20Sihanoukville%2C%20Cambodia.jpg\", \"title\": \"Bokor Mountain Day Trip from Sihanoukville, Cambodia\"}, {\"img\": \"https://movetocambodia.com/wp-content/uploads/Bokor-Mountain-Sampov-Pram-Pagoda.jpg\", \"title\": \"Bokor Mountain Sampov Pram Pagoda\"}, {\"img\": \"https://www.greeneratravel.com/userfiles/850bokormountain.jpg\", \"title\": \"Bokor Mountain\"}, {\"img\": \"https://bayontabitour.com/userfiles/bokor-mountain-att-b.jpg\", \"title\": \"Bokor Mountain\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (12, 'Kampot Pepper Farm', 'Kampot', 'Kampot, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"farm\"]', '8:00 AM', '5:00 PM', 'Famous for producing world-renowned Kampot pepper, these farms offer tours to learn about pepper cultivation.', 'https://goo.gl/maps/T4Qd8d7h7Jo', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://www.khmertimeskh.com/wp-content/uploads/2020/08/8064.jpg\", \"title\": \"Kampot Pepper Farm\"}, {\"img\": \"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/26/94/24/5a/caption.jpg?w=1200&h=-1&s=1\", \"title\": \"Kampot Pepper Farm\"}, {\"img\": \"https://pppenglish.sgp1.digitaloceanspaces.com/image/main/field/image/the_land_designated_for_kampot_pepper_cultivation_has_increased_from_10ha_in_2010_to_290ha_as_of_april_last_year_which_can_yield_82.78_tonnes_each_year._supplied.jpg\", \"title\": \"Kampot Pepper Cultivation Land\"}, {\"img\": \"https://www.allworld.com/wp-content/uploads/2017/11/kampot-pepper-farm-1024x683.jpg\", \"title\": \"Kampot Pepper Farm\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (13, 'Phnom Chhngok Cave Temple', 'Kampot', 'Kampot, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"cave\"]', '8:00 AM', '4:00 PM', 'A natural cave featuring a 7th-century brick temple dedicated to Shiva, set in a beautiful rural area.', 'https://goo.gl/maps/Vq2xQm7PmzH2', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://www.khmertimeskh.com/wp-content/uploads/2020/10/10767.jpg\", \"title\": \"Phnom Chhngok Cave Temple\"}, {\"img\": \"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/2e/24/98/phnom-chhngok-cave-temple.jpg?w=1200&h=-1&s=1\", \"title\": \"Phnom Chhngok Cave Temple\"}, {\"img\": \"https://www.cambodiaacountryfullofcharm.com/wp-content/uploads/2022/11/phnom-chhngok-temple-kampot-cambodia-scaled-e1669742974341.jpg\", \"title\": \"Phnom Chhngok Temple, Kampot, Cambodia\"}, {\"img\": \"https://www.travelauthenticasia.com/photos/tours/cambodia/gallery/kampot/phnom-chngok-8.jpg\", \"title\": \"Phnom Chngok\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (14, 'Kampot River Cruise', 'Kampot', 'Kampot, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"cruise\", \"river\"]', 'Varies', 'Varies', 'Scenic river cruises offering spectacular views of Kampot\'s natural beauty and sunsets.', 'https://goo.gl/maps/3kx9qW6f3Dx', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://britadventures.com/wp-content/uploads/2022/03/firefly-boat-tour-kampot.jpg\", \"title\": \"Firefly Boat Tour Kampot\"}, {\"img\": \"https://cambotours.com/userfiles/river-cruise-sunset-day-tour.jpg\", \"title\": \"River Cruise Sunset Day Tour\"}, {\"img\": \"https://cambotours.com/userfiles/thumbs/private-sunset-cruise-in-kep-city.jpg\", \"title\": \"Private Sunset Cruise in Kep City\"}, {\"img\": \"https://pbs.twimg.com/media/FA12yHvUYAQcbzW.jpg\", \"title\": \"Kampot River Cruise\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (15, 'Teuk Chhou Rapids', 'Kampot', 'Kampot, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"water fall\"]', '9:00 AM', '5:00 PM', 'A popular local getaway spot where visitors can relax and enjoy the natural rapids and scenic surroundings.', 'https://goo.gl/maps/juBQzgyVrRv', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/7a/c1/cc/teuk-chhou-rapids.jpg?w=1200&h=-1&s=1\", \"title\": \"Teuk Chhou Rapids\"}, {\"img\": \"https://www.guidetrip.info/asset/img/gallery_resort/5abc7d5e27179.jpg\", \"title\": \"Teuk Chhou\"}, {\"img\": \"https://www.guidetrip.info/asset/img/gallery_album/5cf9c4bfd3429.jpg\", \"title\": \"Teuk Chhou\"}, {\"img\": \"https://ak-d.tripcdn.com/images/0ww5g12000c7qphadB163.jpg?proc=source%2Ftrip\", \"title\": \"Teuk Chhou\"}, {\"img\": \"https://live.staticflickr.com/4355/37096755931_2f5616840e_b.jpg\", \"title\": \"Teuk Chhou\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (16, 'Kampot Provincial Museum', 'Kampot', 'Kampot, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"museum\", \"history\"]', '8:00 AM', '5:00 PM', 'A museum showcasing the history, culture, and traditions of Kampot province.', 'https://goo.gl/maps/Kn7xS7TJy572', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/dc/c5/a1/the-buitiful-french-colonial.jpg?w=1200&h=-1&s=1\", \"title\": \"Beautiful French Colonial Building\"}, {\"img\": \"https://kampottourism.gov.kh/wp-content/uploads/2018/08/IMG_8873-1078x516.jpg\", \"title\": \"Kampot Provincial Museum Exterior\"}, {\"img\": \"https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/2016_Kampot%2C_Muzeum_Prowincji_Kampot_%2801%29.jpg/2560px-2016_Kampot%2C_Muzeum_Prowincji_Kampot_%2801%29.jpg\", \"title\": \"2016 Kampot Provincial Museum\"}, {\"img\": \"https://mangoesandmandalas.com/wp-content/uploads/2022/12/Kampot-Museum.jpg\", \"title\": \"Kampot Museum Interior\"}, {\"img\": \"https://kampottourism.gov.kh/wp-content/uploads/2018/08/IMG_8913-1024x768.jpg\", \"title\": \"Kampot Provincial Museum Display\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (17, 'Salt Fields', 'Kampot', 'Kampot, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"farm\"]', '7:30 AM', '6:30 PM', 'Kampot\'s salt fields offer a glimpse into the salt production process and are particularly striking at sunset.', 'https://goo.gl/maps/L2iCX6PuQaJ2', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://cambodia-images.com/wp-content/uploads/2018/04/Kampot-salt-fields-sunset.jpg\", \"title\": \"Kampot Salt Fields at Sunset\"}, {\"img\": \"https://smartsinntravel.com/userfiles/salt-fields-smart-sinn-travel8.jpg\", \"title\": \"Kampot Salt Fields\"}, {\"img\": \"https://www.familycoreladventures.com/wp-content/uploads/2016/10/11-844-post/X3A7112.jpg\", \"title\": \"Kampot Salt Fields View\"}, {\"img\": \"https://www.neverendingvoyage.com/wp-content/uploads/2014/03/salt-fields-kampot-sunrise-cambodia-main.jpg\", \"title\": \"Salt Fields Kampot Sunrise\"}]', NULL, NULL);
INSERT INTO `visited_places` (`id`, `name`, `country`, `location`, `rate_star`, `grade`, `evaluation`, `reviewer_population`, `btn_show_price`, `categories`, `openingTime`, `closingTime`, `description`, `googleMapsLink`, `show_on_map`, `images`, `created_at`, `updated_at`) VALUES (18, 'La Plantation', 'Kampot', 'Kampot, Cambodia', '4', 9.30, 'Wonderful', '787', 'add to plan', '[\"farm\"]', '9:00 AM', '5:00 PM', 'A sustainable and organic farm specializing in Kampot pepper, with guided tours and a restaurant.', 'https://goo.gl/maps/5QsBN5vBqGn', '{\"link\": \"http://etc\", \"metre\": \"km\", \"content\": \"show on map\", \"distance\": 0.8}', '[{\"img\": \"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/75/44/89/la-plantation-6.jpg?w=1200&h=-1&s=1\", \"title\": \"La Plantation View\"}, {\"img\": \"https://www.travona.net/_next/image?url=https%3A%2F%2Fapi.travona.net%2Fv1%2Ffiles%2F5fec85edd560c86ed9f433a9&w=3840&q=75\", \"title\": \"La Plantation Scenery\"}, {\"img\": \"https://live.staticflickr.com/65535/48029901928_b261be5f15_b.jpg\", \"title\": \"La Plantation Fields\"}, {\"img\": \"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/03-La_Plantation_Pepper_Farm%2C_Kampot_Province-nX-1.jpg/2560px-03-La_Plantation_Pepper_Farm%2C_Kampot_Province-nX-1.jpg\", \"title\": \"La Plantation Pepper Farm\"}]', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
