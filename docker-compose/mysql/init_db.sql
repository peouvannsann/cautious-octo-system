/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100615 (10.6.15-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : laravel

 Target Server Type    : MySQL
 Target Server Version : 100615 (10.6.15-MariaDB)
 File Encoding         : 65001

 Date: 23/01/2024 12:11:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car_models
-- ----------------------------
DROP TABLE IF EXISTS `car_models`;
CREATE TABLE `car_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `car_id` int(10) unsigned NOT NULL,
  `model_name` varchar(255) NOT NULL,
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
  `car_id` int(10) unsigned NOT NULL,
  `product_car_id` int(10) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned NOT NULL,
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
-- Table structure for cars
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `founded` int(11) NOT NULL,
  `description` longtext NOT NULL,
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
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `commentable_id` bigint(20) unsigned NOT NULL,
  `commentable_type` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved` int(11) DEFAULT 0,
  `active` int(11) DEFAULT 0,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned NOT NULL,
  `engine_name` varchar(255) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `car_id` int(10) unsigned NOT NULL,
  `headquarters` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `imageable_id` bigint(20) unsigned NOT NULL,
  `imageable_type` varchar(100) DEFAULT 'text',
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
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '2022_10_15_074214_create_products_table', 1);
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
COMMIT;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
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
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
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
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
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
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
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
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
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
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
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
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (1, 'App\\Models\\User', 1, 'API TOKEN', '226d363241507242527d286a230d1fbc9aad953358b22b7aa1902d4ab8093db6', '[\"*\"]', '2024-01-12 09:26:52', NULL, '2023-12-10 10:28:50', '2024-01-12 09:26:52');
COMMIT;

-- ----------------------------
-- Table structure for phones
-- ----------------------------
DROP TABLE IF EXISTS `phones`;
CREATE TABLE `phones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `activate` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
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
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `approved` int(11) DEFAULT 0,
  `active` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for reasons
-- ----------------------------
DROP TABLE IF EXISTS `reasons`;
CREATE TABLE `reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
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
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (1, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (1, 3);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (2, 1);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (2, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (3, 1);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (3, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (4, 1);
COMMIT;

-- ----------------------------
-- Table structure for role_users
-- ----------------------------
DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Region` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Item Type` varchar(255) DEFAULT NULL,
  `Sales Channel` varchar(255) DEFAULT NULL,
  `Order Priority` varchar(255) DEFAULT NULL,
  `Order Date` varchar(255) DEFAULT NULL,
  `Order ID` varchar(255) DEFAULT NULL,
  `Ship Date` varchar(255) DEFAULT NULL,
  `Units Sold` varchar(255) DEFAULT NULL,
  `Unit Price` varchar(255) DEFAULT NULL,
  `Unit Cost` varchar(255) DEFAULT NULL,
  `Total Revenue` varchar(255) DEFAULT NULL,
  `Total Cost` varchar(255) DEFAULT NULL,
  `Total Profit` varchar(255) DEFAULT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `profileimage` varchar(255) DEFAULT NULL,
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
-- Table structure for sub_reasons
-- ----------------------------
DROP TABLE IF EXISTS `sub_reasons`;
CREATE TABLE `sub_reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `tag_id` bigint(20) unsigned NOT NULL,
  `taggable_id` bigint(20) unsigned NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
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
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `uuid` char(36) NOT NULL,
  `enum_role` varchar(255) NOT NULL DEFAULT 'guest',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`) VALUES (1, 'John333', 'john333@example.com', NULL, '$2y$10$C/BLQqiM69CYjtQSwvHQlOa/xa00EOByu7yeo49hGtsw2QbayOwn6', NULL, '2023-12-10 08:08:38', '2023-12-10 08:08:38', 1, '8cd89773-220b-4c52-8c3a-1e5333694895', 'guest');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`) VALUES (2, 'John3333', 'john333@example.com', NULL, '$2y$10$M5WCJ5AiHS7/CJt89wT3qu2urPSokDfKwsPKrB0iEBrsh0bmiIzEq', NULL, '2024-01-12 09:23:39', '2024-01-12 09:23:39', 1, 'c2127b2f-df3f-4592-a2a3-f8541eb9aba9', 'admin');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `uuid`, `enum_role`) VALUES (3, 'John333412', 'john333@example.com', NULL, '$2y$10$APpBlqYceO.JSpXoyKul.OQBEn1C0uuiwWneLEoGl.JHQAkusEA9m', NULL, '2024-01-12 09:26:52', '2024-01-12 09:26:52', 1, '385e8a66-c33e-42f5-b85e-066b76a2851a', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of videos
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
