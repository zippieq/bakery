-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jan 19, 2022 at 02:26 AM
-- Server version: 10.6.5-MariaDB-1:10.6.5+maria~focal
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theoctofood`
--
CREATE DATABASE IF NOT EXISTS `theoctofood` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `theoctofood`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add account', 6, 'add_account'),
(22, 'Can change account', 6, 'change_account'),
(23, 'Can delete account', 6, 'delete_account'),
(24, 'Can view account', 6, 'view_account'),
(25, 'Can add address', 7, 'add_address'),
(26, 'Can change address', 7, 'change_address'),
(27, 'Can delete address', 7, 'delete_address'),
(28, 'Can view address', 7, 'view_address'),
(29, 'Can add cart', 8, 'add_cart'),
(30, 'Can change cart', 8, 'change_cart'),
(31, 'Can delete cart', 8, 'delete_cart'),
(32, 'Can view cart', 8, 'view_cart'),
(33, 'Can add Category', 9, 'add_category'),
(34, 'Can change Category', 9, 'change_category'),
(35, 'Can delete Category', 9, 'delete_category'),
(36, 'Can view Category', 9, 'view_category'),
(37, 'Can add item', 10, 'add_item'),
(38, 'Can change item', 10, 'change_item'),
(39, 'Can delete item', 10, 'delete_item'),
(40, 'Can view item', 10, 'view_item'),
(41, 'Can add review', 11, 'add_review'),
(42, 'Can change review', 11, 'change_review'),
(43, 'Can delete review', 11, 'delete_review'),
(44, 'Can view review', 11, 'view_review'),
(45, 'Can add transaction', 12, 'add_transaction'),
(46, 'Can change transaction', 12, 'change_transaction'),
(47, 'Can delete transaction', 12, 'delete_transaction'),
(48, 'Can view transaction', 12, 'view_transaction'),
(49, 'Can add invoice', 13, 'add_invoice'),
(50, 'Can change invoice', 13, 'change_invoice'),
(51, 'Can delete invoice', 13, 'delete_invoice'),
(52, 'Can view invoice', 13, 'view_invoice'),
(53, 'Can add detail', 14, 'add_detail'),
(54, 'Can change detail', 14, 'change_detail'),
(55, 'Can delete detail', 14, 'delete_detail'),
(56, 'Can view detail', 14, 'view_detail');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-01-19 01:44:41.502665', '1', 'Cơm', 1, '[{\"added\": {}}]', 9, 1),
(2, '2022-01-19 01:45:17.724276', '2', 'Gà rán', 1, '[{\"added\": {}}]', 9, 1),
(3, '2022-01-19 01:45:59.119075', '3', 'Trà sữa', 1, '[{\"added\": {}}]', 9, 1),
(4, '2022-01-19 01:46:18.638094', '4', 'Bánh mì', 1, '[{\"added\": {}}]', 9, 1),
(5, '2022-01-19 01:46:44.109162', '5', 'Cháo', 1, '[{\"added\": {}}]', 9, 1),
(6, '2022-01-19 01:47:00.345221', '6', 'Pizza', 1, '[{\"added\": {}}]', 9, 1),
(7, '2022-01-19 01:47:34.766416', '7', 'Cơm tấm', 1, '[{\"added\": {}}]', 9, 1),
(8, '2022-01-19 01:47:57.748626', '7', 'Cơm tấm', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 9, 1),
(9, '2022-01-19 01:48:24.306056', '8', 'Burger', 1, '[{\"added\": {}}]', 9, 1),
(10, '2022-01-19 01:48:44.921880', '9', 'Mì Ý', 1, '[{\"added\": {}}]', 9, 1),
(11, '2022-01-19 01:49:16.423495', '10', 'Hủ tiếu', 1, '[{\"added\": {}}]', 9, 1),
(12, '2022-01-19 01:49:57.049424', '11', 'Ăn vặt', 1, '[{\"added\": {}}]', 9, 1),
(13, '2022-01-19 01:50:18.284930', '12', 'Rau trộn', 1, '[{\"added\": {}}]', 9, 1),
(14, '2022-01-19 01:57:18.843405', '1', 'Cơm - Phở', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 9, 1),
(15, '2022-01-19 02:01:04.691998', '1', 'Cơm rang đùi gà + 1 Coca', 1, '[{\"added\": {}}]', 10, 1),
(16, '2022-01-19 02:02:33.180710', '2', 'Cơm rang dưa bò + 1 Coca', 1, '[{\"added\": {}}]', 10, 1),
(17, '2022-01-19 02:02:59.516951', '1', 'Cơm rang đùi gà + 1 Coca', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(18, '2022-01-19 02:04:46.153029', '3', 'Cơm đảo gà chiên', 1, '[{\"added\": {}}]', 10, 1),
(19, '2022-01-19 02:05:31.172979', '4', 'Cơm rang thập cẩm', 1, '[{\"added\": {}}]', 10, 1),
(20, '2022-01-19 02:06:07.303719', '5', 'Cơm rang trứng', 1, '[{\"added\": {}}]', 10, 1),
(21, '2022-01-19 02:06:21.183803', '3', 'Cơm đảo gà chiên', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(22, '2022-01-19 02:06:38.543858', '4', 'Cơm rang thập cẩm', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(23, '2022-01-19 02:07:42.600269', '6', 'Cơm đảo đùi gà sốt quay', 1, '[{\"added\": {}}]', 10, 1),
(24, '2022-01-19 02:08:51.480465', '7', 'Cơm đảo gà sốt nấm', 1, '[{\"added\": {}}]', 10, 1),
(25, '2022-01-19 02:10:11.610032', '8', 'Phở gà', 1, '[{\"added\": {}}]', 10, 1),
(26, '2022-01-19 02:12:41.542360', '9', 'Phở tái', 1, '[{\"added\": {}}]', 10, 1),
(27, '2022-01-19 02:13:44.660227', '10', 'Phở xào', 1, '[{\"added\": {}}]', 10, 1),
(28, '2022-01-19 02:14:02.039797', '9', 'Phở tái + Fanta', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(29, '2022-01-19 02:14:12.549412', '9', 'Phở tái + Fanta', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(30, '2022-01-19 02:14:23.908936', '10', 'Phở xào + Sprite', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(31, '2022-01-19 02:15:48.201407', '11', 'Phở tái lăn', 1, '[{\"added\": {}}]', 10, 1),
(32, '2022-01-19 02:16:16.959970', '12', 'Phở tái gầu', 1, '[{\"added\": {}}]', 10, 1),
(33, '2022-01-19 02:19:19.602840', '13', 'Gà xốt sả', 1, '[{\"added\": {}}]', 10, 1),
(34, '2022-01-19 02:20:33.151747', '14', 'Gà rán', 1, '[{\"added\": {}}]', 10, 1),
(35, '2022-01-19 02:21:27.184035', '15', 'Cánh gà', 1, '[{\"added\": {}}]', 10, 1),
(36, '2022-01-19 02:24:31.229048', '16', 'Gà lắc phô mai', 1, '[{\"added\": {}}]', 10, 1),
(37, '2022-01-19 02:24:43.704274', '15', 'Cánh gà', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(14, 'orders', 'detail'),
(13, 'orders', 'invoice'),
(12, 'orders', 'transaction'),
(9, 'products', 'category'),
(10, 'products', 'item'),
(11, 'products', 'review'),
(5, 'sessions', 'session'),
(6, 'users', 'account'),
(7, 'users', 'address'),
(8, 'users', 'cart');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'users', '0001_initial', '2022-01-19 01:25:32.448225'),
(2, 'contenttypes', '0001_initial', '2022-01-19 01:25:32.504890'),
(3, 'admin', '0001_initial', '2022-01-19 01:25:32.610416'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-01-19 01:25:32.621205'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-01-19 01:25:32.632348'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-01-19 01:25:32.707362'),
(7, 'auth', '0001_initial', '2022-01-19 01:25:32.944570'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-01-19 01:25:32.995632'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-01-19 01:25:33.011756'),
(10, 'auth', '0004_alter_user_username_opts', '2022-01-19 01:25:33.028313'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-01-19 01:25:33.036190'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-01-19 01:25:33.038281'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-01-19 01:25:33.044361'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-01-19 01:25:33.050211'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-01-19 01:25:33.056021'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-01-19 01:25:33.076183'),
(17, 'auth', '0011_update_proxy_permissions', '2022-01-19 01:25:33.090695'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-01-19 01:25:33.098249'),
(19, 'users', '0002_account_date_joined_account_is_staff_and_more', '2022-01-19 01:25:33.175422'),
(20, 'users', '0003_account_is_superuser_account_username_and_more', '2022-01-19 01:25:33.297314'),
(21, 'users', '0004_address', '2022-01-19 01:25:33.366444'),
(22, 'users', '0005_address_is_default', '2022-01-19 01:25:33.413060'),
(23, 'products', '0001_initial', '2022-01-19 01:25:33.628808'),
(24, 'users', '0006_cart', '2022-01-19 01:25:33.752045'),
(25, 'users', '0007_alter_address_options', '2022-01-19 01:25:33.767862'),
(26, 'orders', '0001_initial', '2022-01-19 01:25:34.081892'),
(27, 'orders', '0002_remove_invoice_zip_code_alter_invoice_status', '2022-01-19 01:25:34.139812'),
(28, 'orders', '0003_alter_invoice_phone_number', '2022-01-19 01:25:34.227701'),
(29, 'orders', '0004_alter_invoice_tax_alter_invoice_total', '2022-01-19 01:25:34.348784'),
(30, 'sessions', '0001_initial', '2022-01-19 01:25:34.393860'),
(31, 'users', '0008_remove_address_zip_code', '2022-01-19 01:25:34.435202');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('z4khexxfqf1zui0ze3sjmlj9tt9oiog0', '.eJxVjEEOwiAQAP_C2ZDSwhY8eu8byC672KqBpLQn499Nkx70OjOZt4q4b3Pcm6xxYXVVRl1-GWF6SjkEP7Dcq061bOtC-kj0aZueKsvrdrZ_gxnbfGztKH0GCyOAmCBMkplooJwMOO4AvOus6wky2sF4nwZEcGP2LgTXs_p8AefBN7k:1n9zzc:FD37svXiToUTyq3U9m11fpdwuJpmyRNw8ZrNUCNGJT8', '2022-02-02 01:42:32.253552');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE `orders_detail` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders_invoice`
--

DROP TABLE IF EXISTS `orders_invoice`;
CREATE TABLE `orders_invoice` (
  `id` bigint(20) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `street_address` varchar(50) NOT NULL,
  `ward` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `notes` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders_transaction`
--

DROP TABLE IF EXISTS `orders_transaction`;
CREATE TABLE `orders_transaction` (
  `id` bigint(20) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_category`
--

DROP TABLE IF EXISTS `products_category`;
CREATE TABLE `products_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_category`
--

INSERT INTO `products_category` (`id`, `name`, `slug`, `description`, `image`) VALUES
(1, 'Cơm - Phở', 'com-pho', '', 'categories/com.jpg'),
(2, 'Gà rán', 'ga-ran', '', 'categories/ga-ran.jpg'),
(3, 'Trà sữa', 'tra-sua', '', 'categories/tra-sua.jpg'),
(4, 'Bánh mì', 'banh-mi', '', 'categories/banh-mi.jpeg'),
(5, 'Cháo', 'chao', '', 'categories/chao.jpeg'),
(6, 'Pizza', 'pizza', '', 'categories/pizza.jpg'),
(7, 'Cơm tấm', 'com-tam', '', 'categories/com-tam.jpeg'),
(8, 'Burger', 'burger', '', 'categories/burger.jpg'),
(9, 'Mì Ý', 'mi-y', '', 'categories/mi-y.jpeg'),
(10, 'Hủ tiếu', 'hu-tieu', '', 'categories/hu-tieu.jpeg'),
(11, 'Ăn vặt', 'an-vat', '', 'categories/an-vat.jpeg'),
(12, 'Rau trộn', 'rau-tron', '', 'categories/rau-tron.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products_item`
--

DROP TABLE IF EXISTS `products_item`;
CREATE TABLE `products_item` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_item`
--

INSERT INTO `products_item` (`id`, `name`, `slug`, `description`, `price`, `image`, `stock`, `is_active`, `category_id`) VALUES
(1, 'Cơm rang đùi gà + 1 Coca', 'com-01', 'Bao gồm : 1x Cơm rang đùi gà, 1x Coca 350ml', 35000, 'items/com-01.jpg', 30, 1, 1),
(2, 'Cơm rang dưa bò + 1 Coca', 'com-02', 'Bao gồm : 1x Cơm rang dưa bò, 1x Coca 350ml', 35000, 'items/com-02.jpg', 35, 1, 1),
(3, 'Cơm đảo gà chiên', 'com-03', '', 35000, 'items/com-03.jpg', 15, 1, 1),
(4, 'Cơm rang thập cẩm', 'com-04', '', 25000, 'items/com-04.jpg', 25, 1, 1),
(5, 'Cơm rang trứng', 'com-05', '', 20000, 'items/com-05.jpg', 50, 1, 1),
(6, 'Cơm đảo đùi gà sốt quay', 'com-06', '', 35000, 'items/com-06.jpg', 15, 1, 1),
(7, 'Cơm đảo gà sốt nấm', 'com-07', '', 35000, 'items/com-07.jpg', 25, 1, 1),
(8, 'Phở gà', 'pho-01', '', 30000, 'items/pho-01.jpg', 25, 1, 1),
(9, 'Phở tái + Fanta', 'pho-02', '', 35000, 'items/pho-02.jpg', 30, 1, 1),
(10, 'Phở xào + Sprite', 'pho-03', '', 45000, 'items/pho-03.jpg', 25, 1, 1),
(11, 'Phở tái lăn', 'pho-04', '', 35000, 'items/pho-04.jpg', 35, 1, 1),
(12, 'Phở tái gầu', 'pho-05', '', 35000, 'items/pho-05.jpg', 25, 1, 1),
(13, 'Gà xốt sả', 'ga-ran-01', '', 50000, 'items/ga-ran-01.jpg', 25, 1, 2),
(14, 'Gà rán', 'ga-ran-02', '', 35000, 'items/ga-ran-02.jpeg', 25, 1, 2),
(15, 'Cánh gà', 'ga-ran-03', '', 35000, 'items/ga-ran-03.jpg', 35, 1, 2),
(16, 'Gà lắc phô mai', 'ga-ran-04', '', 35000, 'items/ga-ran-04.jpeg', 25, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products_review`
--

DROP TABLE IF EXISTS `products_review`;
CREATE TABLE `products_review` (
  `id` bigint(20) NOT NULL,
  `comment` longtext NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_account`
--

DROP TABLE IF EXISTS `users_account`;
CREATE TABLE `users_account` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_account`
--

INSERT INTO `users_account` (`id`, `password`, `last_login`, `email`, `first_name`, `last_name`, `phone_number`, `is_active`, `date_joined`, `is_staff`, `is_superuser`, `username`) VALUES
(1, 'pbkdf2_sha256$320000$X0BdqI9U9mDiHULmGBNPpm$LZOJVKUMySLF60Vdvqh6hLQXqHwRywirYIhPMqUrDM4=', '2022-01-19 01:42:32.250923', 'admin@theoctofood.email', 'Octo', 'Hehe', '0123456789', 1, '2022-01-19 01:28:02.905109', 1, 1, 'theoctofood');

-- --------------------------------------------------------

--
-- Table structure for table `users_address`
--

DROP TABLE IF EXISTS `users_address`;
CREATE TABLE `users_address` (
  `id` bigint(20) NOT NULL,
  `street_address` varchar(50) NOT NULL,
  `ward` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `is_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_cart`
--

DROP TABLE IF EXISTS `users_cart`;
CREATE TABLE `users_cart` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_account_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_detail_invoice_id_df420433_fk_orders_invoice_id` (`invoice_id`),
  ADD KEY `orders_detail_item_id_f1f45724_fk_products_item_id` (`item_id`);

--
-- Indexes for table `orders_invoice`
--
ALTER TABLE `orders_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_invoice_transaction_id_f0439459_fk_orders_transaction_id` (`transaction_id`),
  ADD KEY `orders_invoice_user_id_4e63a96b_fk_users_account_id` (`user_id`);

--
-- Indexes for table `orders_transaction`
--
ALTER TABLE `orders_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_transaction_user_id_8acdd0fb_fk_users_account_id` (`user_id`);

--
-- Indexes for table `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_item`
--
ALTER TABLE `products_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `products_item_category_id_4c94af84_fk_products_category_id` (`category_id`);

--
-- Indexes for table `products_review`
--
ALTER TABLE `products_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_review_item_id_cc10330f_fk_products_item_id` (`item_id`),
  ADD KEY `products_review_user_id_2e53b831_fk_users_account_id` (`user_id`);

--
-- Indexes for table `users_account`
--
ALTER TABLE `users_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `users_account_phone_number_ddac4682_uniq` (`phone_number`);

--
-- Indexes for table `users_address`
--
ALTER TABLE `users_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_address_user_id_4c106ba4_fk_users_account_id` (`user_id`);

--
-- Indexes for table `users_cart`
--
ALTER TABLE `users_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_cart_item_id_c5823ab1_fk_products_item_id` (`item_id`),
  ADD KEY `users_cart_user_id_01be2ef5_fk_users_account_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_invoice`
--
ALTER TABLE `orders_invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_transaction`
--
ALTER TABLE `orders_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products_item`
--
ALTER TABLE `products_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products_review`
--
ALTER TABLE `products_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_account`
--
ALTER TABLE `users_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_address`
--
ALTER TABLE `users_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_cart`
--
ALTER TABLE `users_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_invoice_id_df420433_fk_orders_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `orders_invoice` (`id`),
  ADD CONSTRAINT `orders_detail_item_id_f1f45724_fk_products_item_id` FOREIGN KEY (`item_id`) REFERENCES `products_item` (`id`);

--
-- Constraints for table `orders_invoice`
--
ALTER TABLE `orders_invoice`
  ADD CONSTRAINT `orders_invoice_transaction_id_f0439459_fk_orders_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `orders_transaction` (`id`),
  ADD CONSTRAINT `orders_invoice_user_id_4e63a96b_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `orders_transaction`
--
ALTER TABLE `orders_transaction`
  ADD CONSTRAINT `orders_transaction_user_id_8acdd0fb_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `products_item`
--
ALTER TABLE `products_item`
  ADD CONSTRAINT `products_item_category_id_4c94af84_fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`);

--
-- Constraints for table `products_review`
--
ALTER TABLE `products_review`
  ADD CONSTRAINT `products_review_item_id_cc10330f_fk_products_item_id` FOREIGN KEY (`item_id`) REFERENCES `products_item` (`id`),
  ADD CONSTRAINT `products_review_user_id_2e53b831_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `users_address`
--
ALTER TABLE `users_address`
  ADD CONSTRAINT `users_address_user_id_4c106ba4_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);

--
-- Constraints for table `users_cart`
--
ALTER TABLE `users_cart`
  ADD CONSTRAINT `users_cart_item_id_c5823ab1_fk_products_item_id` FOREIGN KEY (`item_id`) REFERENCES `products_item` (`id`),
  ADD CONSTRAINT `users_cart_user_id_01be2ef5_fk_users_account_id` FOREIGN KEY (`user_id`) REFERENCES `users_account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;