-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 04:25 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `site1`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `address_book_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address_format`
--

CREATE TABLE IF NOT EXISTS `address_format` (
  `address_format_id` int(11) NOT NULL,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address_format`
--

INSERT INTO `address_format` (`address_format_id`, `address_format`, `address_summary`) VALUES
(1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country'),
(2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country'),
(3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country'),
(4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country'),
(5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country'),
(6, '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country', '$postcode / $country');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(40) NOT NULL DEFAULT '',
  `prev_pass1` varchar(40) NOT NULL DEFAULT '',
  `prev_pass2` varchar(40) NOT NULL DEFAULT '',
  `prev_pass3` varchar(40) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset_token` varchar(60) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_failed_ip` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_profile`, `admin_pass`, `prev_pass1`, `prev_pass2`, `prev_pass3`, `pwd_last_change_date`, `reset_token`, `last_modified`, `last_login_date`, `last_login_ip`, `failed_logins`, `lockout_expires`, `last_failed_attempt`, `last_failed_ip`) VALUES
(1, 'admin', 'dev@site1.com', 1, 'cf465cf8901c72cb6e0d97ae0009e7a7:20', '2c752c719293c815a7d9bf56dfd7941e:01', '', '', '2022-10-05 16:17:38', '', '2022-10-05 16:14:20', '2022-10-13 21:42:01', '127.0.0.1', 0, 0, '2022-10-05 16:16:43', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_log`
--

CREATE TABLE IF NOT EXISTS `admin_activity_log` (
  `log_id` bigint(15) NOT NULL,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(20) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_activity_log`
--

INSERT INTO `admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`, `flagged`, `attention`, `gzpost`) VALUES
(1, '2022-10-05 16:15:33', 0, 'Log found to be empty. Logging started.', '', '127.0.0.1', 0, '', ''),
(2, '2022-10-05 16:15:33', 0, 'alert_page.php ', '', '127.0.0.1', 0, '', ''),
(3, '2022-10-05 16:16:01', 0, 'alert_page.php ', '', '127.0.0.1', 0, '', ''),
(4, '2022-10-05 16:16:02', 0, 'alert_page.php ', '', '127.0.0.1', 0, '', ''),
(5, '2022-10-05 16:16:35', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(6, '2022-10-05 16:16:43', 0, 'login.php admin', 'camefrom=index.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b282709474948a4b9372334b80023ef9e96081c4e492ccfc3ca0404abea1b16592a19165aa65a2b185a1a5456a9a99a5519299715292a15962a2b969aa522d00),
(7, '2022-10-05 16:16:55', 0, 'login.php ', '', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4dd53534b64c3234b24cb54c34b630b4b4484d33b3344a32334e4a32344b4c34374d55b282a856d2512a2e4dcacd2c010a0443183a4a89c92599f9794091a26282e6d40200),
(8, '2022-10-05 16:17:38', 0, 'login.php ', '', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4dd53534b64c3234b24cb54c34b630b4b4484d33b3344a32334e4a32344b4c34374d55b282a856d2512a2e4dcacd2c010a0443183a4a89c92599f9794091a26282e6d40200),
(9, '2022-10-05 16:17:46', 1, 'categories.php', '', '127.0.0.1', 0, '', ''),
(10, '2022-10-05 16:19:40', 1, 'categories.php', '', '127.0.0.1', 0, '', ''),
(11, '2022-10-05 16:19:41', 1, 'alt_nav.php', '', '127.0.0.1', 0, '', ''),
(12, '2022-10-05 16:19:46', 1, 'configuration.php', 'gID=1&', '127.0.0.1', 0, '', ''),
(13, '2022-10-05 16:19:53', 1, 'configuration.php', 'gID=24&', '127.0.0.1', 0, '', ''),
(14, '2022-10-05 16:23:06', 1, 'configuration.php', 'gID=24&cID=501&action=edit&', '127.0.0.1', 0, '', ''),
(15, '2022-10-05 16:23:14', 1, 'template_select.php', '', '127.0.0.1', 0, '', ''),
(16, '2022-10-05 16:23:22', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(17, '2022-10-05 16:23:25', 1, 'template_select.php', 'page=1&tID=1&action=save&', '127.0.0.1', 0, '', 0xab56cac953b2522ac948cd4d35333050aa0500),
(18, '2022-10-05 16:23:28', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(19, '2022-10-05 16:23:33', 1, 'template_select.php', 'page=1&tID=1&action=save&', '127.0.0.1', 0, '', 0xab56cac953b2522ac948cd4d35333050aa0500),
(20, '2022-10-13 21:41:59', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(21, '2022-10-13 21:42:01', 0, 'login.php admin', 'camefrom=index.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b282709474948a4b9372334b80023ef9e96081c4e492ccfc3ca0404abe8181a58561a2418a459aa199b9798a81594a92a1695a6292458a85514a8a81b1522d00),
(22, '2022-10-13 21:42:09', 1, 'modules.php', 'set=payment&', '127.0.0.1', 0, '', ''),
(23, '2022-10-13 21:42:11', 1, 'modules.php', 'set=payment&action=install&', '127.0.0.1', 0, '', 0xab56cacd4f29cd4955b2524a2c2dc9c82fcaac4acd4b2d51d251cacc2b2e49ccc9712a2d29c9cf8baf002a3036c410ae040a1b1a2bd50200),
(24, '2022-10-13 21:42:11', 1, 'modules.php', 'set=payment&module=authorizenet&action=edit&', '127.0.0.1', 0, '', ''),
(25, '2022-10-13 21:42:14', 1, 'modules.php', 'set=payment&module=paypal&', '127.0.0.1', 0, '', ''),
(26, '2022-10-13 21:42:18', 1, 'modules.php', 'set=payment&action=install&', '127.0.0.1', 0, '', 0xab56cacd4f29cd4955b2522a48ac2c48cc51d251cacc2b2e49ccc9712a2d29c9cf8baf004a191b60085702850d4d956a01),
(27, '2022-10-13 21:42:18', 1, 'modules.php', 'set=payment&module=paypal&action=edit&', '127.0.0.1', 0, '', ''),
(28, '2022-10-13 21:43:16', 1, 'orders.php', '', '127.0.0.1', 0, '', ''),
(29, '2022-10-13 21:43:43', 1, 'gv_queue.php', '', '127.0.0.1', 0, '', ''),
(30, '2022-10-13 21:43:53', 1, 'ezpages.php', '', '127.0.0.1', 0, '', ''),
(31, '2022-10-13 21:44:39', 1, 'ezpages.php', 'page=1&ezID=16&', '127.0.0.1', 0, '', ''),
(32, '2022-10-13 21:44:42', 1, 'ezpages.php', 'page=1&ezID=15&', '127.0.0.1', 0, '', ''),
(33, '2022-10-13 21:44:46', 1, 'ezpages.php', 'page=1&ezID=2&', '127.0.0.1', 0, '', ''),
(34, '2022-10-13 21:44:49', 1, 'ezpages.php', 'page=1&ezID=21&', '127.0.0.1', 0, '', ''),
(35, '2022-10-13 21:44:51', 1, 'ezpages.php', 'page=1&ezID=20&', '127.0.0.1', 0, '', ''),
(36, '2022-10-13 21:44:54', 1, 'ezpages.php', 'page=1&ezID=20&action=new&', '127.0.0.1', 0, '', ''),
(37, '2022-10-13 21:45:15', 1, 'ezpages.php', 'page=1&action=update&', '127.0.0.1', 0, '', 0x7590cb0a02310c457f45ba1651172e0471e12fb80f711a9d426d4a937106c47f3743c70788cb7b726e687377192f2410bcdbbaf5d2cda7ac4123193a70526c54a60170a604897ae843f2dc9bf1ea40101089131145ed045a424fc5d8ca580d205c14b854bef9b8123c9d78782da8e9af7d66d6f7e61a7e5de5069a167335bfde6583098cca4fafdea0d56b04a5418d1e497486c9cf3cc5703371ee302a7465fcb09d8286456ef3fe8a21c1d8de35f570d0c94705db4525e1d8718f27),
(38, '2022-10-13 21:46:08', 1, 'ezpages.php', 'page=1&action=update&', '127.0.0.1', 0, '', 0x7590dd0ac2300c465f457a2da25e782188173e48886b7485ad294dc606e2bb9bd2f903c3bb7ea7e70b6d1e2ee19d04827747b7dfbaf59c356847862e1c151b95f90238518448238c217a1ecd7877200888743311451d045a424fd9d8ce580d209c1538577ef8ba123c5d797a0fa8e9af7d63d6cfe41a96ae72034d8ba99a3fefb28b191465d1ab3b68b5ef406952a34aa22b8c7e550e6660a730e4f25bdb034d9bd4a6738f2142a99e9aba3518e4ab820da21cb174dcf305),
(39, '2022-10-13 21:46:27', 1, 'ezpages.php', 'page=1&action=update&', '127.0.0.1', 0, '', 0x7590c10ac2300c86dfa56711f5e041100f3e48886b7485ae294dc606e2bb9bd1cd09e2f1fffafda1c9d3657c9040f0eee40e3bb799b3068d64e8ca49b151991f8033254834c01092e7c18ca503414024ce4414b51768093d15637b6335807051e052f971752578baf1b80ca8e9af7d67d6cfe41a7e5de5069a167335bffe650f3398949f5ebd41ab5d04a5518d1ac4a8d09769415b9dc66d6ef3a5c39060b2cf4d3d14f4b2aa605d2a09a78e7bbd01),
(40, '2022-10-13 21:46:27', 1, 'ezpages.php', 'page=1&ezID=20&', '127.0.0.1', 0, '', ''),
(41, '2022-10-13 21:48:29', 1, 'ezpages.php', '', '127.0.0.1', 0, '', ''),
(42, '2022-10-13 21:48:32', 1, 'ezpages.php', 'page=1&ezID=20&', '127.0.0.1', 0, '', ''),
(43, '2022-10-13 21:48:34', 1, 'ezpages.php', 'page=1&ezID=20&', '127.0.0.1', 0, '', ''),
(44, '2022-10-13 21:48:36', 1, 'ezpages.php', 'page=1&ezID=20&', '127.0.0.1', 0, '', ''),
(45, '2022-10-13 21:49:12', 1, 'modules.php', 'set=payment&', '127.0.0.1', 0, '', ''),
(46, '2022-10-13 21:49:17', 1, 'modules.php', 'set=payment&module=paypal&', '127.0.0.1', 0, '', ''),
(47, '2022-10-13 21:49:23', 1, 'modules.php', 'set=payment&module=paypal&action=edit&', '127.0.0.1', 0, '', ''),
(48, '2022-10-13 21:53:09', 1, 'modules.php', 'set=payment&module=paypaldp&', '127.0.0.1', 0, '', ''),
(49, '2022-10-13 21:53:14', 1, 'modules.php', 'set=payment&module=paypal&', '127.0.0.1', 0, '', ''),
(50, '2022-10-13 21:53:17', 1, 'modules.php', 'set=payment&module=paypal&action=edit&', '127.0.0.1', 0, '', ''),
(51, '2022-10-13 21:55:13', 1, 'categories.php', '', '127.0.0.1', 0, '', ''),
(52, '2022-10-13 21:55:22', 1, 'categories.php', 'cPath=&cID=6&action=delete_category&', '127.0.0.1', 0, '', ''),
(53, '2022-10-13 21:55:23', 1, 'categories.php', 'action=delete_category_confirm&cPath=&', '127.0.0.1', 0, '', 0xab564a4e2c494dcf2fca4c2d8ecf4c51b2523253aa0500),
(54, '2022-10-13 21:55:23', 1, 'categories.php', 'cPath=&', '127.0.0.1', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE IF NOT EXISTS `admin_menus` (
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`menu_key`, `language_key`, `sort_order`) VALUES
('configuration', 'BOX_HEADING_CONFIGURATION', 1),
('catalog', 'BOX_HEADING_CATALOG', 2),
('modules', 'BOX_HEADING_MODULES', 3),
('customers', 'BOX_HEADING_CUSTOMERS', 4),
('taxes', 'BOX_HEADING_LOCATION_AND_TAXES', 5),
('localization', 'BOX_HEADING_LOCALIZATION', 6),
('reports', 'BOX_HEADING_REPORTS', 7),
('tools', 'BOX_HEADING_TOOLS', 8),
('gv', 'BOX_HEADING_GV_ADMIN', 9),
('access', 'BOX_HEADING_ADMIN_ACCESS', 10),
('extras', 'BOX_HEADING_EXTRAS', 11);

-- --------------------------------------------------------

--
-- Table structure for table `admin_pages`
--

CREATE TABLE IF NOT EXISTS `admin_pages` (
  `page_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(64) NOT NULL DEFAULT '',
  `page_params` varchar(64) NOT NULL DEFAULT '',
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_pages`
--

INSERT INTO `admin_pages` (`page_key`, `language_key`, `main_page`, `page_params`, `menu_key`, `display_on_menu`, `sort_order`) VALUES
('configMyStore', 'BOX_CONFIGURATION_MY_STORE', 'FILENAME_CONFIGURATION', 'gID=1', 'configuration', 'Y', 1),
('configMinimumValues', 'BOX_CONFIGURATION_MINIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=2', 'configuration', 'Y', 2),
('configMaximumValues', 'BOX_CONFIGURATION_MAXIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=3', 'configuration', 'Y', 3),
('configImages', 'BOX_CONFIGURATION_IMAGES', 'FILENAME_CONFIGURATION', 'gID=4', 'configuration', 'Y', 4),
('configCustomerDetails', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', 'FILENAME_CONFIGURATION', 'gID=5', 'configuration', 'Y', 5),
('configShipping', 'BOX_CONFIGURATION_SHIPPING_PACKAGING', 'FILENAME_CONFIGURATION', 'gID=7', 'configuration', 'Y', 6),
('configProductListing', 'BOX_CONFIGURATION_PRODUCT_LISTING', 'FILENAME_CONFIGURATION', 'gID=8', 'configuration', 'Y', 7),
('configStock', 'BOX_CONFIGURATION_STOCK', 'FILENAME_CONFIGURATION', 'gID=9', 'configuration', 'Y', 8),
('configLogging', 'BOX_CONFIGURATION_LOGGING', 'FILENAME_CONFIGURATION', 'gID=10', 'configuration', 'Y', 9),
('configEmail', 'BOX_CONFIGURATION_EMAIL_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=12', 'configuration', 'Y', 10),
('configAttributes', 'BOX_CONFIGURATION_ATTRIBUTE_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=13', 'configuration', 'Y', 11),
('configGzipCompression', 'BOX_CONFIGURATION_GZIP_COMPRESSION', 'FILENAME_CONFIGURATION', 'gID=14', 'configuration', 'Y', 12),
('configSessions', 'BOX_CONFIGURATION_SESSIONS', 'FILENAME_CONFIGURATION', 'gID=15', 'configuration', 'Y', 13),
('configRegulations', 'BOX_CONFIGURATION_REGULATIONS', 'FILENAME_CONFIGURATION', 'gID=11', 'configuration', 'Y', 14),
('configGvCoupons', 'BOX_CONFIGURATION_GV_COUPONS', 'FILENAME_CONFIGURATION', 'gID=16', 'configuration', 'Y', 15),
('configCreditCards', 'BOX_CONFIGURATION_CREDIT_CARDS', 'FILENAME_CONFIGURATION', 'gID=17', 'configuration', 'Y', 16),
('configProductInfo', 'BOX_CONFIGURATION_PRODUCT_INFO', 'FILENAME_CONFIGURATION', 'gID=18', 'configuration', 'Y', 17),
('configLayoutSettings', 'BOX_CONFIGURATION_LAYOUT_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=19', 'configuration', 'Y', 18),
('configWebsiteMaintenance', 'BOX_CONFIGURATION_WEBSITE_MAINTENANCE', 'FILENAME_CONFIGURATION', 'gID=20', 'configuration', 'Y', 19),
('configNewListing', 'BOX_CONFIGURATION_NEW_LISTING', 'FILENAME_CONFIGURATION', 'gID=21', 'configuration', 'Y', 20),
('configFeaturedListing', 'BOX_CONFIGURATION_FEATURED_LISTING', 'FILENAME_CONFIGURATION', 'gID=22', 'configuration', 'Y', 21),
('configAllListing', 'BOX_CONFIGURATION_ALL_LISTING', 'FILENAME_CONFIGURATION', 'gID=23', 'configuration', 'Y', 22),
('configIndexListing', 'BOX_CONFIGURATION_INDEX_LISTING', 'FILENAME_CONFIGURATION', 'gID=24', 'configuration', 'Y', 23),
('configDefinePageStatus', 'BOX_CONFIGURATION_DEFINE_PAGE_STATUS', 'FILENAME_CONFIGURATION', 'gID=25', 'configuration', 'Y', 24),
('configEzPagesSettings', 'BOX_CONFIGURATION_EZPAGES_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=30', 'configuration', 'Y', 25),
('categories', 'BOX_CATALOG_CATEGORIES_PRODUCTS', 'FILENAME_CATEGORIES', '', 'catalog', 'Y', 1),
('productTypes', 'BOX_CATALOG_PRODUCT_TYPES', 'FILENAME_PRODUCT_TYPES', '', 'catalog', 'Y', 2),
('priceManager', 'BOX_CATALOG_PRODUCTS_PRICE_MANAGER', 'FILENAME_PRODUCTS_PRICE_MANAGER', '', 'catalog', 'Y', 3),
('optionNames', 'BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER', 'FILENAME_OPTIONS_NAME_MANAGER', '', 'catalog', 'Y', 4),
('optionValues', 'BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER', 'FILENAME_OPTIONS_VALUES_MANAGER', '', 'catalog', 'Y', 5),
('attributes', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER', 'FILENAME_ATTRIBUTES_CONTROLLER', '', 'catalog', 'Y', 6),
('downloads', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER', 'FILENAME_DOWNLOADS_MANAGER', '', 'catalog', 'Y', 7),
('optionNameSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_NAME', 'FILENAME_PRODUCTS_OPTIONS_NAME', '', 'catalog', 'Y', 8),
('optionValueSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_VALUES', 'FILENAME_PRODUCTS_OPTIONS_VALUES', '', 'catalog', 'Y', 9),
('manufacturers', 'BOX_CATALOG_MANUFACTURERS', 'FILENAME_MANUFACTURERS', '', 'catalog', 'Y', 10),
('reviews', 'BOX_CATALOG_REVIEWS', 'FILENAME_REVIEWS', '', 'catalog', 'Y', 11),
('specials', 'BOX_CATALOG_SPECIALS', 'FILENAME_SPECIALS', '', 'catalog', 'Y', 12),
('featured', 'BOX_CATALOG_FEATURED', 'FILENAME_FEATURED', '', 'catalog', 'Y', 13),
('salemaker', 'BOX_CATALOG_SALEMAKER', 'FILENAME_SALEMAKER', '', 'catalog', 'Y', 14),
('productsExpected', 'BOX_CATALOG_PRODUCTS_EXPECTED', 'FILENAME_PRODUCTS_EXPECTED', '', 'catalog', 'Y', 15),
('product', 'BOX_CATALOG_PRODUCT', 'FILENAME_PRODUCT', '', 'catalog', 'N', 16),
('productsToCategories', 'BOX_CATALOG_PRODUCTS_TO_CATEGORIES', 'FILENAME_PRODUCTS_TO_CATEGORIES', '', 'catalog', 'N', 17),
('payment', 'BOX_MODULES_PAYMENT', 'FILENAME_MODULES', 'set=payment', 'modules', 'Y', 1),
('shipping', 'BOX_MODULES_SHIPPING', 'FILENAME_MODULES', 'set=shipping', 'modules', 'Y', 2),
('orderTotal', 'BOX_MODULES_ORDER_TOTAL', 'FILENAME_MODULES', 'set=ordertotal', 'modules', 'Y', 3),
('customers', 'BOX_CUSTOMERS_CUSTOMERS', 'FILENAME_CUSTOMERS', '', 'customers', 'Y', 1),
('orders', 'BOX_CUSTOMERS_ORDERS', 'FILENAME_ORDERS', '', 'customers', 'Y', 2),
('groupPricing', 'BOX_CUSTOMERS_GROUP_PRICING', 'FILENAME_GROUP_PRICING', '', 'customers', 'Y', 3),
('paypal', 'BOX_CUSTOMERS_PAYPAL', 'FILENAME_PAYPAL', '', 'customers', 'Y', 4),
('invoice', 'BOX_CUSTOMERS_INVOICE', 'FILENAME_ORDERS_INVOICE', '', 'customers', 'N', 5),
('packingslip', 'BOX_CUSTOMERS_PACKING_SLIP', 'FILENAME_ORDERS_PACKINGSLIP', '', 'customers', 'N', 6),
('linkpointReview', 'BOX_CUSTOMERS_LINKPOINT_REVIEW', 'FILENAME_LINKPOINT_REVIEW', '', 'customers', 'Y', 7),
('countries', 'BOX_TAXES_COUNTRIES', 'FILENAME_COUNTRIES', '', 'taxes', 'Y', 1),
('zones', 'BOX_TAXES_ZONES', 'FILENAME_ZONES', '', 'taxes', 'Y', 2),
('geoZones', 'BOX_TAXES_GEO_ZONES', 'FILENAME_GEO_ZONES', '', 'taxes', 'Y', 3),
('taxClasses', 'BOX_TAXES_TAX_CLASSES', 'FILENAME_TAX_CLASSES', '', 'taxes', 'Y', 4),
('taxRates', 'BOX_TAXES_TAX_RATES', 'FILENAME_TAX_RATES', '', 'taxes', 'Y', 5),
('currencies', 'BOX_LOCALIZATION_CURRENCIES', 'FILENAME_CURRENCIES', '', 'localization', 'Y', 1),
('languages', 'BOX_LOCALIZATION_LANGUAGES', 'FILENAME_LANGUAGES', '', 'localization', 'Y', 2),
('ordersStatus', 'BOX_LOCALIZATION_ORDERS_STATUS', 'FILENAME_ORDERS_STATUS', '', 'localization', 'Y', 3),
('reportCustomers', 'BOX_REPORTS_ORDERS_TOTAL', 'FILENAME_STATS_CUSTOMERS', '', 'reports', 'Y', 1),
('reportReferrals', 'BOX_REPORTS_CUSTOMERS_REFERRALS', 'FILENAME_STATS_CUSTOMERS_REFERRALS', '', 'reports', 'Y', 2),
('reportLowStock', 'BOX_REPORTS_PRODUCTS_LOWSTOCK', 'FILENAME_STATS_PRODUCTS_LOWSTOCK', '', 'reports', 'Y', 3),
('reportProductsSold', 'BOX_REPORTS_PRODUCTS_PURCHASED', 'FILENAME_STATS_PRODUCTS_PURCHASED', '', 'reports', 'Y', 4),
('reportProductsViewed', 'BOX_REPORTS_PRODUCTS_VIEWED', 'FILENAME_STATS_PRODUCTS_VIEWED', '', 'reports', 'Y', 5),
('templateSelect', 'BOX_TOOLS_TEMPLATE_SELECT', 'FILENAME_TEMPLATE_SELECT', '', 'tools', 'Y', 1),
('layoutController', 'BOX_TOOLS_LAYOUT_CONTROLLER', 'FILENAME_LAYOUT_CONTROLLER', '', 'tools', 'Y', 2),
('banners', 'BOX_TOOLS_BANNER_MANAGER', 'FILENAME_BANNER_MANAGER', '', 'tools', 'Y', 3),
('mail', 'BOX_TOOLS_MAIL', 'FILENAME_MAIL', '', 'tools', 'Y', 4),
('newsletters', 'BOX_TOOLS_NEWSLETTER_MANAGER', 'FILENAME_NEWSLETTERS', '', 'tools', 'Y', 5),
('server', 'BOX_TOOLS_SERVER_INFO', 'FILENAME_SERVER_INFO', '', 'tools', 'Y', 6),
('whosOnline', 'BOX_TOOLS_WHOS_ONLINE', 'FILENAME_WHOS_ONLINE', '', 'tools', 'Y', 7),
('storeManager', 'BOX_TOOLS_STORE_MANAGER', 'FILENAME_STORE_MANAGER', '', 'tools', 'Y', 9),
('developersToolKit', 'BOX_TOOLS_DEVELOPERS_TOOL_KIT', 'FILENAME_DEVELOPERS_TOOL_KIT', '', 'tools', 'Y', 10),
('ezpages', 'BOX_TOOLS_EZPAGES', 'FILENAME_EZPAGES_ADMIN', '', 'tools', 'Y', 11),
('definePagesEditor', 'BOX_TOOLS_DEFINE_PAGES_EDITOR', 'FILENAME_DEFINE_PAGES_EDITOR', '', 'tools', 'Y', 12),
('sqlPatch', 'BOX_TOOLS_SQLPATCH', 'FILENAME_SQLPATCH', '', 'tools', 'Y', 13),
('couponAdmin', 'BOX_COUPON_ADMIN', 'FILENAME_COUPON_ADMIN', '', 'gv', 'Y', 1),
('couponRestrict', 'BOX_COUPON_RESTRICT', 'FILENAME_COUPON_RESTRICT', '', 'gv', 'N', 1),
('gvQueue', 'BOX_GV_ADMIN_QUEUE', 'FILENAME_GV_QUEUE', '', 'gv', 'Y', 2),
('gvMail', 'BOX_GV_ADMIN_MAIL', 'FILENAME_GV_MAIL', '', 'gv', 'Y', 3),
('gvSent', 'BOX_GV_ADMIN_SENT', 'FILENAME_GV_SENT', '', 'gv', 'Y', 4),
('profiles', 'BOX_ADMIN_ACCESS_PROFILES', 'FILENAME_PROFILES', '', 'access', 'Y', 1),
('users', 'BOX_ADMIN_ACCESS_USERS', 'FILENAME_USERS', '', 'access', 'Y', 2),
('pageRegistration', 'BOX_ADMIN_ACCESS_PAGE_REGISTRATION', 'FILENAME_ADMIN_PAGE_REGISTRATION', '', 'access', 'Y', 3),
('adminlogs', 'BOX_ADMIN_ACCESS_LOGS', 'FILENAME_ADMIN_ACTIVITY', '', 'access', 'Y', 4),
('recordArtists', 'BOX_CATALOG_RECORD_ARTISTS', 'FILENAME_RECORD_ARTISTS', '', 'extras', 'Y', 1),
('recordCompanies', 'BOX_CATALOG_RECORD_COMPANY', 'FILENAME_RECORD_COMPANY', '', 'extras', 'Y', 2),
('musicGenre', 'BOX_CATALOG_MUSIC_GENRE', 'FILENAME_MUSIC_GENRE', '', 'extras', 'Y', 3),
('mediaManager', 'BOX_CATALOG_MEDIA_MANAGER', 'FILENAME_MEDIA_MANAGER', '', 'extras', 'Y', 4),
('mediaTypes', 'BOX_CATALOG_MEDIA_TYPES', 'FILENAME_MEDIA_TYPES', '', 'extras', 'Y', 5),
('PollManager', 'BOX_TOOLS_POLL_MANAGER', 'PM_FILENAME_POLL_MANAGER', '', 'tools', 'Y', 14);

-- --------------------------------------------------------

--
-- Table structure for table `admin_pages_to_profiles`
--

CREATE TABLE IF NOT EXISTS `admin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_profiles`
--

CREATE TABLE IF NOT EXISTS `admin_profiles` (
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_profiles`
--

INSERT INTO `admin_profiles` (`profile_id`, `profile_name`) VALUES
(1, 'Superuser');

-- --------------------------------------------------------

--
-- Table structure for table `authorizenet`
--

CREATE TABLE IF NOT EXISTS `authorizenet` (
  `id` int(11) unsigned NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` bigint(20) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `banners_id` int(11) NOT NULL,
  `banners_title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `banners_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `banners_image` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `banners_group` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `banners_html_text` text COLLATE utf8_unicode_ci,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`banners_id`, `banners_title`, `banners_url`, `banners_image`, `banners_group`, `banners_html_text`, `expires_impressions`, `expires_date`, `date_scheduled`, `date_added`, `date_status_change`, `status`, `banners_open_new_windows`, `banners_on_ssl`, `banners_sort_order`) VALUES
(1, '', 'index.php?main_page=product_info&cPath=1_31_51&products_id=2', 'banner1.jpg', 'banner-1', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(2, '', 'index.php?main_page=product_info&cPath=1_31_51&products_id=1', 'banner2.jpg', 'banner-2', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(3, '', 'index.php?main_page=product_info&cPath=1_31_51&products_id=4', 'banner3.jpg', 'banner-3', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(4, 'Apolis', 'index.php?main_page=product_info&cPath=1_31_51&products_id=3', 'banner4.jpg', 'banner-4', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(5, 'Sale', 'index.php?main_page=product_info&cPath=1_31_52&products_id=25', 'banner5.jpg', 'banner-4', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(6, 'Adipisicing elit sed do', 'index.php?main_page=product_info&cPath=1_31_52&products_id=27', 'banner6.jpg', 'banner-5', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(7, 'Lorem Set', 'index.php?main_page=product_info&cPath=1_31_52&products_id=28', 'banner7.jpg', 'banner-5', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(8, 'Dolore magna ', 'index.php?main_page=product_info&cPath=1_31_52&products_id=26', 'banner8.jpg', 'banner-5', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(9, 'Free Shipping', 'index.php?main_page=product_info&cPath=1_31_57&products_id=6', 'banner9.jpg', 'banner-5', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(10, 'Lorem set', 'index.php?main_page=product_info&cPath=1_31_57&products_id=5', 'banner10.jpg', 'banner-6', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(11, 'Dolore magna aliquaut enim ad', 'index.php?main_page=product_info&cPath=1_31_57&products_id=8', 'banner11.jpg', 'banner-6', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(12, 'Excepteur sint', 'index.php?main_page=product_info&cPath=1_31_57&products_id=7', 'banner12.jpg', 'banner-6', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banners_history`
--

CREATE TABLE IF NOT EXISTS `banners_history` (
  `banners_history_id` int(11) NOT NULL,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banners_history`
--

INSERT INTO `banners_history` (`banners_history_id`, `banners_id`, `banners_shown`, `banners_clicked`, `banners_history_date`) VALUES
(1, 8, 5, 0, '2022-10-05 16:18:05'),
(2, 5, 5, 0, '2022-10-05 16:18:05'),
(3, 9, 5, 0, '2022-10-05 16:18:05'),
(4, 3, 5, 0, '2022-10-05 16:18:05'),
(5, 6, 5, 0, '2022-10-05 16:18:05'),
(6, 1, 4, 0, '2022-10-05 16:23:51'),
(7, 2, 4, 0, '2022-10-05 16:23:51'),
(8, 4, 4, 0, '2022-10-05 16:23:51'),
(9, 7, 4, 0, '2022-10-05 16:23:51'),
(10, 10, 4, 0, '2022-10-05 16:23:51'),
(11, 11, 4, 0, '2022-10-05 16:23:51'),
(12, 12, 4, 0, '2022-10-05 16:23:51'),
(13, 1, 1, 0, '2022-10-06 22:46:19'),
(14, 2, 1, 0, '2022-10-06 22:46:19'),
(15, 3, 1, 0, '2022-10-06 22:46:19'),
(16, 4, 1, 0, '2022-10-06 22:46:19'),
(17, 5, 1, 0, '2022-10-06 22:46:19'),
(18, 6, 1, 0, '2022-10-06 22:46:19'),
(19, 7, 1, 0, '2022-10-06 22:46:19'),
(20, 8, 1, 0, '2022-10-06 22:46:19'),
(21, 9, 1, 0, '2022-10-06 22:46:19'),
(22, 10, 1, 0, '2022-10-06 22:46:19'),
(23, 11, 1, 0, '2022-10-06 22:46:19'),
(24, 12, 1, 0, '2022-10-06 22:46:19'),
(25, 1, 1, 0, '2022-10-09 00:24:09'),
(26, 2, 1, 0, '2022-10-09 00:24:09'),
(27, 3, 1, 0, '2022-10-09 00:24:09'),
(28, 4, 1, 0, '2022-10-09 00:24:09'),
(29, 5, 1, 0, '2022-10-09 00:24:09'),
(30, 6, 1, 0, '2022-10-09 00:24:09'),
(31, 7, 1, 0, '2022-10-09 00:24:09'),
(32, 8, 1, 0, '2022-10-09 00:24:09'),
(33, 9, 1, 0, '2022-10-09 00:24:09'),
(34, 10, 1, 1, '2022-10-09 00:24:09'),
(35, 11, 1, 0, '2022-10-09 00:24:09'),
(36, 12, 1, 0, '2022-10-09 00:24:09'),
(37, 1, 6, 0, '2022-10-13 21:40:22'),
(38, 2, 6, 0, '2022-10-13 21:40:22'),
(39, 3, 6, 0, '2022-10-13 21:40:22'),
(40, 4, 6, 0, '2022-10-13 21:40:22'),
(41, 5, 6, 0, '2022-10-13 21:40:22'),
(42, 6, 6, 0, '2022-10-13 21:40:22'),
(43, 7, 6, 0, '2022-10-13 21:40:22'),
(44, 8, 6, 0, '2022-10-13 21:40:22'),
(45, 9, 6, 0, '2022-10-13 21:40:22'),
(46, 10, 6, 0, '2022-10-13 21:40:22'),
(47, 11, 6, 0, '2022-10-13 21:40:22'),
(48, 12, 6, 0, '2022-10-13 21:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_image` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`, `categories_status`) VALUES
(1, '', 0, 1, NULL, NULL, 1),
(2, '', 0, 2, NULL, NULL, 1),
(3, '', 0, 3, NULL, NULL, 1),
(4, '', 0, 4, NULL, NULL, 1),
(5, '', 0, 5, NULL, NULL, 1),
(31, 'sub1.jpg', 1, 1, NULL, NULL, 1),
(32, 'sub2.jpg', 1, 2, NULL, NULL, 1),
(33, 'sub3.jpg', 1, 3, NULL, NULL, 1),
(34, 'sub4.jpg', 1, 4, NULL, NULL, 1),
(51, 'sub1-1.jpg', 31, 1, NULL, NULL, 1),
(52, 'sub1-2.jpg', 31, 2, NULL, NULL, 1),
(53, 'sub1-3.jpg', 31, 3, NULL, NULL, 1),
(54, 'sub1-4.jpg', 31, 4, NULL, NULL, 1),
(55, 'sub1-5.jpg', 31, 5, NULL, NULL, 1),
(56, 'sub1-6.jpg', 31, 6, NULL, NULL, 1),
(57, 'sub1-7.jpg', 31, 7, NULL, NULL, 1),
(61, 'sub2-1.jpg', 32, 1, NULL, NULL, 1),
(62, 'sub2-2.jpg', 32, 2, NULL, NULL, 1),
(63, 'sub2-3.jpg', 32, 3, NULL, NULL, 1),
(64, 'sub2-4.jpg', 32, 4, NULL, NULL, 1),
(65, 'sub2-5.jpg', 32, 5, NULL, NULL, 1),
(66, 'sub2-6.jpg', 32, 6, NULL, NULL, 1),
(71, 'sub3-1.jpg', 33, 1, NULL, NULL, 1),
(72, 'sub3-2.jpg', 33, 2, NULL, NULL, 1),
(73, 'sub3-3.jpg', 33, 3, NULL, NULL, 1),
(74, 'sub3-4.jpg', 33, 4, NULL, NULL, 1),
(75, 'sub3-5.jpg', 33, 5, NULL, NULL, 1),
(81, 'sub4-1.jpg', 34, 1, NULL, NULL, 1),
(82, 'sub4-2.jpg', 34, 2, NULL, NULL, 1),
(83, 'sub4-3.jpg', 34, 3, NULL, NULL, 1),
(84, 'sub4-4.jpg', 34, 4, NULL, NULL, 1),
(85, 'sub4-5.jpg', 34, 5, NULL, NULL, 1),
(86, 'sub4-6.jpg', 34, 6, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories_description`
--

CREATE TABLE IF NOT EXISTS `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories_description`
--

INSERT INTO `categories_description` (`categories_id`, `language_id`, `categories_name`, `categories_description`) VALUES
(1, 1, 'Cookware', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nullam mattis, augue a pharetra aliquet, turpis magna sagittis odio, non lobortis dolor nulla a massa.'),
(2, 1, 'Bakeware', 'Mauris quis neque vitae velit fringilla tristique. Fusce eu massa ut lacus tincidunt venenatis. Duis facilisis tellus vel velit lacinia.'),
(3, 1, 'Appliances', 'Curabitur porta pretium lectus. Etiam consectetuer, erat in dictum ornare, massa turpis tempus lorem, sit amet gravida mauris lacus nec metus.'),
(4, 1, 'Electrics', 'Integer id libero id orci porttitor tempus. Aliquam mollis, nulla sed nonummy venenatis, eros est elementum est, nec egestas mi dui eu sapien.'),
(5, 1, 'Coffee and Tea', 'Fusce fringilla. Suspendisse venenatis. Maecenas justo. Aenean nunc eros, pharetra facilisis, eleifend vel, eleifend vel, nulla.'),
(31, 1, 'Eusmod tempor', 'Donec eleifend nulla et nisi. Pellentesque orci felis, viverra vel, vulputate ac, euismod faucibus, augue. Proin viverra. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc iaculis elementum nibh. Phasellus imperdiet, lectus vitae feugiat auctor, dui nibh feugiat.'),
(32, 1, 'Labore et dolore magna', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(33, 1, 'Ut enim ad mini', 'In fermentum dignissim est. Cras laoreet mollis erat. Sed adipiscing porttitor est. Donec scelerisque. Cras vehicula libero non diam. Maecenas sed felis at dui convallis ultrices. Suspendisse libero tortor, dictum eu, rutrum vitae, luctus sed, neque. Nulla quis metus. Praesent sem sapien, ullamcorper.'),
(34, 1, 'AliquaUt enim', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(51, 1, 'Lorem ipsum dolor sit', 'Donec eleifend nulla et nisi. Pellentesque orci felis, viverra vel, vulputate ac, euismod faucibus, augue. Proin viverra. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc iaculis elementum nibh. Phasellus imperdiet, lectus vitae feugiat auctor, dui nibh feugiat.'),
(52, 1, 'Amet conse ctetur adipisicing', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(53, 1, 'Elit sed do eiusmod', 'In fermentum dignissim est. Cras laoreet mollis erat. Sed adipiscing porttitor est. Donec scelerisque. Cras vehicula libero non diam. Maecenas sed felis at dui convallis ultrices. Suspendisse libero tortor, dictum eu, rutrum vitae, luctus sed, neque. Nulla quis metus. Praesent sem sapien, ullamcorper.'),
(54, 1, 'Tempor incididunt ut labore', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(55, 1, 'Et dolore magna aliqua', 'Donec eleifend nulla et nisi. Pellentesque orci felis, viverra vel, vulputate ac, euismod faucibus, augue. Proin viverra. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc iaculis elementum nibh. Phasellus imperdiet, lectus vitae feugiat auctor, dui nibh feugiat.'),
(56, 1, 'Ut enim ad minim veniam', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(57, 1, 'Quis nostrud', 'In fermentum dignissim est. Cras laoreet mollis erat. Sed adipiscing porttitor est. Donec scelerisque. Cras vehicula libero non diam. Maecenas sed felis at dui convallis ultrices. Suspendisse libero tortor, dictum eu, rutrum vitae, luctus sed, neque. Nulla quis metus. Praesent sem sapien, ullamcorper.'),
(61, 1, 'Amet conse ctetur adipisicing', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(62, 1, 'Elit sed do eiusmod', 'Donec eleifend nulla et nisi. Pellentesque orci felis, viverra vel, vulputate ac, euismod faucibus, augue. Proin viverra. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc iaculis elementum nibh. Phasellus imperdiet, lectus vitae feugiat auctor, dui nibh feugiat.'),
(63, 1, 'Tempor incididunt ut labore', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(64, 1, 'Et dolore magna aliqua', 'In fermentum dignissim est. Cras laoreet mollis erat. Sed adipiscing porttitor est. Donec scelerisque. Cras vehicula libero non diam. Maecenas sed felis at dui convallis ultrices. Suspendisse libero tortor, dictum eu, rutrum vitae, luctus sed, neque. Nulla quis metus. Praesent sem sapien, ullamcorper.'),
(65, 1, 'Ut enim ad minim veniam', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(66, 1, 'Quis nostrud', 'Donec eleifend nulla et nisi. Pellentesque orci felis, viverra vel, vulputate ac, euismod faucibus, augue. Proin viverra. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc iaculis elementum nibh. Phasellus imperdiet, lectus vitae feugiat auctor, dui nibh feugiat.'),
(71, 1, 'Elit sed do eiusmod', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(72, 1, 'Tempor incididunt ut labore', 'In fermentum dignissim est. Cras laoreet mollis erat. Sed adipiscing porttitor est. Donec scelerisque. Cras vehicula libero non diam. Maecenas sed felis at dui convallis ultrices. Suspendisse libero tortor, dictum eu, rutrum vitae, luctus sed, neque. Nulla quis metus. Praesent sem sapien, ullamcorper.'),
(73, 1, 'Et dolore magna aliqua', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(74, 1, 'Ut enim ad minim veniam', 'Donec eleifend nulla et nisi. Pellentesque orci felis, viverra vel, vulputate ac, euismod faucibus, augue. Proin viverra. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc iaculis elementum nibh. Phasellus imperdiet, lectus vitae feugiat auctor, dui nibh feugiat.'),
(75, 1, 'Quis nostrud', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(81, 1, 'Et dolore magna aliqua', 'In fermentum dignissim est. Cras laoreet mollis erat. Sed adipiscing porttitor est. Donec scelerisque. Cras vehicula libero non diam. Maecenas sed felis at dui convallis ultrices. Suspendisse libero tortor, dictum eu, rutrum vitae, luctus sed, neque. Nulla quis metus. Praesent sem sapien, ullamcorper.'),
(82, 1, 'Ut enim ad minim veniam', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(83, 1, 'Quis nostrud', 'Donec eleifend nulla et nisi. Pellentesque orci felis, viverra vel, vulputate ac, euismod faucibus, augue. Proin viverra. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc iaculis elementum nibh. Phasellus imperdiet, lectus vitae feugiat auctor, dui nibh feugiat.'),
(84, 1, 'Amet conse ctetur adipisicing', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.'),
(85, 1, 'Elit sed do eiusmod', 'In fermentum dignissim est. Cras laoreet mollis erat. Sed adipiscing porttitor est. Donec scelerisque. Cras vehicula libero non diam. Maecenas sed felis at dui convallis ultrices. Suspendisse libero tortor, dictum eu, rutrum vitae, luctus sed, neque. Nulla quis metus. Praesent sem sapien, ullamcorper.'),
(86, 1, 'Tempor incididunt ut labore', 'Ut at justo. Morbi lobortis varius nunc. Aliquam fermentum felis ac ante. Sed placerat tempor dolor. Duis vitae justo in diam pretium scelerisque. Cras dictum nibh sed nulla. Maecenas non pede id mi mollis molestie. Vivamus iaculis blandit mauris. Sed vestibulum viverra libero.');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
  `configuration_id` int(11) NOT NULL,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text
) ENGINE=MyISAM AUTO_INCREMENT=580 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Store Name', 'STORE_NAME', 'site1', 'The name of my store', 1, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(2, 'Store Owner', 'STORE_OWNER', 'dawson', 'The name of my store owner', 1, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(3, 'Telephone - Customer Service', 'STORE_TELEPHONE_CUSTSERVICE', '', 'Enter a telephone number for customers to reach your Customer Service department. This number may be sent as part of payment transaction details.', 1, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(4, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>', 1, 6, NULL, '2022-10-05 16:14:20', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(5, 'Zone', 'STORE_ZONE', '43', 'The zone my store is located in', 1, 7, NULL, '2022-10-05 16:14:20', 'zen_cfg_get_zone_name', 'zen_cfg_pull_down_zone_list('),
(6, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''asc'', ''desc''), '),
(7, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''products_name'', ''date_expected''), '),
(8, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language''s currency when it is changed', 1, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(9, 'Language Selector', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', 'Should the default language be based on the Store preferences, or the customer''s browser settings?<br /><br />Default: Store''s default settings', 1, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''Default'', ''Browser''), '),
(10, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 6, 12, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(11, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(12, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''and'', ''or''), '),
(13, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Customer Service: +1 800 559 6580<br>9870 St Vincent Place,<br>Glasgow, DC 45 Fr 45.<br>', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea('),
(14, 'Show Category Counts', 'SHOW_COUNTS', '0', 'Count recursively how many products are in each category', 1, 19, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(15, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2022-10-05 16:14:20', NULL, NULL),
(16, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(17, 'Display Prices with Tax in Admin', 'DISPLAY_PRICE_WITH_TAX_ADMIN', 'false', 'Display prices with tax included (true) or add the tax at the end (false) in Admin(Invoices)', 1, 21, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(18, 'Basis of Product Tax', 'STORE_PRODUCT_TAX_BASIS', 'Shipping', 'On what basis is Product Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 1, 21, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(19, 'Basis of Shipping Tax', 'STORE_SHIPPING_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone - Can be overriden by correctly written Shipping Module', 1, 21, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(20, 'Sales Tax Display Status', 'STORE_TAX_DISPLAY_STATUS', '0', 'Always show Sales Tax even when amount is $0.00?<br />0= Off<br />1= On', 1, 21, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(21, 'Show Split Tax Lines', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', 'If multiple tax rates apply, show each rate as a separate line at checkout', 1, 22, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(22, 'Admin Session Time Out in Seconds', 'SESSION_TIMEOUT_ADMIN', '900', 'Enter the time in seconds.<br />Max allowed is 900 for PCI Compliance Reasons.<br /> Default=900<br />Example: 900= 15 min <br /><br />Note: Too few seconds can result in timeout issues when adding/editing products', 1, 40, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''900'', ''600'', ''300''), '),
(23, 'Admin Set max_execution_time for processes', 'GLOBAL_SET_TIME_LIMIT', '60', 'Enter the time in seconds for how long the max_execution_time of processes should be. Default=60<br />Example: 60= 1 minute<br /><br />Note: Changing the time limit is only needed if you are having problems with the execution time of a process', 1, 42, NULL, '2022-10-05 16:14:20', NULL, NULL),
(24, 'Show if version update available', 'SHOW_VERSION_UPDATE_IN_HEADER', 'true', 'Automatically check to see if a new version of Zen Cart is available. Enabling this can sometimes slow down the loading of Admin pages. (Displayed on main Index page after login, and Server Info page.)', 1, 44, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(25, 'Store Status', 'STORE_STATUS', '0', 'What is your Store Status<br />0= Normal Store<br />1= Showcase no prices<br />2= Showcase with prices', 1, 25, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(26, 'Server Uptime', 'DISPLAY_SERVER_UPTIME', 'true', 'Displaying Server uptime can cause entries in error logs on some servers. (true = Display, false = don''t display)', 1, 46, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''true'', ''false''),'),
(27, 'Missing Page Check', 'MISSING_PAGE_CHECK', 'Page Not Found', 'Zen Cart can check for missing pages in the URL and redirect to Index page. For debugging you may want to turn this off. <br /><br /><strong>Default=On</strong><br />On = Send missing pages to ''index''<br />Off = Don''t check for missing pages<br />Page Not Found = display the Page-Not-Found page', 1, 48, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''On'', ''Off'', ''Page Not Found''),'),
(28, 'cURL Proxy Status', 'CURL_PROXY_REQUIRED', 'False', 'Does your host require that you use a proxy for cURL communication?', 6, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(29, 'cURL Proxy Address', 'CURL_PROXY_SERVER_DETAILS', '', 'If you have a hosting service that requires use of a proxy to talk to external sites via cURL, enter their proxy address here.<br />format: address:port<br />ie: 127.0.0.1:3128', 6, 51, NULL, '2022-10-05 16:14:20', NULL, NULL),
(30, 'HTML Editor', 'HTML_EDITOR_PREFERENCE', 'NONE', 'Please select the HTML/Rich-Text editor you wish to use for composing Admin-related emails, newsletters, and product descriptions', 1, 110, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_pull_down_htmleditors('),
(31, 'Enable phpBB linkage?', 'PHPBB_LINKS_ENABLED', 'false', 'Should Zen Cart synchronize new account information to your (already-installed) phpBB forum?', 1, 120, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(32, 'Show Category Counts - Admin', 'SHOW_COUNTS_ADMIN', 'true', 'Show Category Counts in Admin?', 1, 19, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(33, 'Currency Conversion Ratio', 'CURRENCY_UPLIFT_RATIO', '1.05', 'When auto-updating currencies, what "uplift" ratio should be used to calculate the exchange rate used by your store?<br />ie: the bank rate is obtained from the currency-exchange servers; how much extra do you want to charge in order to make up the difference between the bank rate and the consumer rate?<br /><br /><strong>Default: 1.05 </strong><br />This will cause the published bank rate to be multiplied by 1.05 to set the currency rates in your store.', 1, 55, NULL, '2022-10-05 16:14:20', NULL, NULL),
(34, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(35, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(36, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(37, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2022-10-05 16:14:20', NULL, NULL),
(38, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2022-10-05 16:14:20', NULL, NULL),
(39, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '0', 'Minimum length of company name', 2, 6, NULL, '2022-10-05 16:14:20', NULL, NULL),
(40, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2022-10-05 16:14:20', NULL, NULL),
(41, 'City', 'ENTRY_CITY_MIN_LENGTH', '2', 'Minimum length of city', 2, 8, NULL, '2022-10-05 16:14:20', NULL, NULL),
(42, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2022-10-05 16:14:20', NULL, NULL),
(43, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2022-10-05 16:14:20', NULL, NULL),
(44, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '7', 'Minimum length of password', 2, 11, NULL, '2022-10-05 16:14:20', NULL, NULL),
(45, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2022-10-05 16:14:20', NULL, NULL),
(46, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2022-10-05 16:14:20', NULL, NULL),
(47, 'Credit Card CVV Number', 'CC_CVV_MIN_LENGTH', '3', 'Minimum length of credit card CVV number', 2, 13, NULL, '2022-10-05 16:14:20', NULL, NULL),
(48, 'Product Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of product review text', 2, 14, NULL, '2022-10-05 16:14:20', NULL, NULL),
(49, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2022-10-05 16:14:20', NULL, NULL),
(50, 'Also Purchased Products', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the ''This Customer Also Purchased'' box', 2, 16, NULL, '2022-10-05 16:14:20', NULL, NULL),
(51, 'Nick Name', 'ENTRY_NICK_MIN_LENGTH', '3', 'Minimum length of Nick Name', 2, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(52, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(53, 'Admin Search Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Number of products to list on an Admin search result page', 3, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(54, 'Prev/Next Navigation Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of ''number'' links use for page-sets', 3, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(55, 'Products on Special ', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '4', 'Number of products on special to display', 3, 4, NULL, '2022-10-05 16:14:20', NULL, NULL),
(56, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '4', 'Number of new products to display in a category', 3, 5, NULL, '2022-10-05 16:14:20', NULL, NULL),
(57, 'Upcoming Products ', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '4', 'Number of ''upcoming'' products to display', 3, 6, NULL, '2022-10-05 16:14:20', NULL, NULL),
(58, 'Manufacturers List - Scroll Box Size/Style', 'MAX_MANUFACTURERS_LIST', '1', 'Number of manufacturers names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2022-10-05 16:14:20', NULL, NULL),
(59, 'Manufacturers List - Verify Product Exist', 'PRODUCTS_MANUFACTURERS_STATUS', '1', 'Verify that at least 1 product exists and is active for the manufacturer name to show<br /><br />Note: When this feature is ON it can produce slower results on sites with a large number of products and/or manufacturers<br />0= off 1= on', 3, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(60, 'Music Genre List - Scroll Box Size/Style', 'MAX_MUSIC_GENRES_LIST', '1', 'Number of music genre names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2022-10-05 16:14:20', NULL, NULL),
(61, 'Record Company List - Scroll Box Size/Style', 'MAX_RECORD_COMPANY_LIST', '1', 'Number of record company names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2022-10-05 16:14:20', NULL, NULL),
(62, 'Length of Record Company Name', 'MAX_DISPLAY_RECORD_COMPANY_NAME_LEN', '15', 'Used in record companies box; maximum length of record company name to display. Longer names will be truncated.', 3, 8, NULL, '2022-10-05 16:14:20', NULL, NULL),
(63, 'Length of Music Genre Name', 'MAX_DISPLAY_MUSIC_GENRES_NAME_LEN', '15', 'Used in music genres box; maximum length of music genre name to display. Longer names will be truncated.', 3, 8, NULL, '2022-10-05 16:14:20', NULL, NULL),
(64, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display. Longer names will be truncated.', 3, 8, NULL, '2022-10-05 16:14:20', NULL, NULL),
(65, 'New Product Reviews Per Page', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Number of new reviews to display on each page', 3, 9, NULL, '2022-10-05 16:14:20', NULL, NULL),
(66, 'Random Product Reviews for SideBox', 'MAX_RANDOM_SELECT_REVIEWS', '1', 'Number of random product REVIEWS to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 10, NULL, '2022-10-05 16:14:20', NULL, NULL),
(67, 'Random New Products for SideBox', 'MAX_RANDOM_SELECT_NEW', '1', 'Number of random NEW products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 11, NULL, '2022-10-05 16:14:20', NULL, NULL),
(68, 'Random Products On Special for SideBox', 'MAX_RANDOM_SELECT_SPECIALS', '1', 'Number of random products on SPECIAL to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 12, NULL, '2022-10-05 16:14:20', NULL, NULL),
(69, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '2', 'How many categories to list per row', 3, 13, NULL, '2022-10-05 16:14:20', NULL, NULL),
(70, 'New Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_NEW', '4', 'Number of new products listed per page', 3, 14, NULL, '2022-10-05 16:14:20', NULL, NULL),
(71, 'Best Sellers For Box', 'MAX_DISPLAY_BESTSELLERS', '5', 'Number of best sellers to display in box', 3, 15, NULL, '2022-10-05 16:14:20', NULL, NULL),
(72, 'Also Purchased Products', 'MAX_DISPLAY_ALSO_PURCHASED', '3', 'Number of products to display in the ''This Customer Also Purchased'' box', 3, 16, NULL, '2022-10-05 16:14:20', NULL, NULL),
(73, 'Recent Purchases Box- NOTE: box is disabled ', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Number of products to display in the recent purchases box', 3, 17, NULL, '2022-10-05 16:14:20', NULL, NULL),
(74, 'Customer Order History List Per Page', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Number of orders to display in the order history list in ''My Account''', 3, 18, NULL, '2022-10-05 16:14:20', NULL, NULL),
(75, 'Maximum Display of Customers on Customers Page', 'MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER', '20', '', 3, 19, NULL, '2022-10-05 16:14:20', NULL, NULL),
(76, 'Maximum Display of Orders on Orders Page', 'MAX_DISPLAY_SEARCH_RESULTS_ORDERS', '20', '', 3, 20, NULL, '2022-10-05 16:14:20', NULL, NULL),
(77, 'Maximum Display of Products on Reports', 'MAX_DISPLAY_SEARCH_RESULTS_REPORTS', '20', '', 3, 21, NULL, '2022-10-05 16:14:20', NULL, NULL),
(78, 'Maximum Categories Products Display List', 'MAX_DISPLAY_RESULTS_CATEGORIES', '4', 'Number of products to list per screen', 3, 22, NULL, '2022-10-05 16:14:20', NULL, NULL),
(79, 'Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_LISTING', '4', 'Maximum Number of Products to list per page on main page', 3, 30, NULL, '2022-10-05 16:14:20', NULL, NULL),
(80, 'Products Attributes - Option Names and Values Display', 'MAX_ROW_LISTS_OPTIONS', '10', 'Maximum number of option names and values to display in the products attributes page', 3, 24, NULL, '2022-10-05 16:14:20', NULL, NULL),
(81, 'Products Attributes - Attributes Controller Display', 'MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER', '30', 'Maximum number of attributes to display in the Attributes Controller page', 3, 25, NULL, '2022-10-05 16:14:20', NULL, NULL),
(82, 'Products Attributes - Downloads Manager Display', 'MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER', '30', 'Maximum number of attributes downloads to display in the Downloads Manager page', 3, 26, NULL, '2022-10-05 16:14:20', NULL, NULL),
(83, 'Featured Products - Number to Display Admin', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN', '10', 'Number of featured products to list per screen - Admin', 3, 27, NULL, '2022-10-05 16:14:20', NULL, NULL),
(84, 'Maximum Display of Featured Products - Main Page', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED', '4', 'Number of featured products to list on main page', 3, 28, NULL, '2022-10-05 16:14:20', NULL, NULL),
(85, 'Maximum Display of Featured Products Page', 'MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS', '4', 'Number of featured products to list per screen', 3, 29, NULL, '2022-10-05 16:14:20', NULL, NULL),
(86, 'Random Featured Products for SideBox', 'MAX_RANDOM_SELECT_FEATURED_PRODUCTS', '1', 'Number of random FEATURED products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 30, NULL, '2022-10-05 16:14:20', NULL, NULL),
(87, 'Maximum Display of Specials Products - Main Page', 'MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX', '4', 'Number of special products to list on main page', 3, 31, NULL, '2022-10-05 16:14:20', NULL, NULL),
(88, 'New Product Listing - Limited to ...', 'SHOW_NEW_PRODUCTS_LIMIT', '0', 'Limit the New Product Listing to<br />0= All Products<br />1= Current Month<br />7= 7 Days<br />14= 14 Days<br />30= 30 Days<br />60= 60 Days<br />90= 90 Days<br />120= 120 Days', 3, 40, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''7'', ''14'', ''30'', ''60'', ''90'', ''120''), '),
(89, 'Maximum Display of Products All Page', 'MAX_DISPLAY_PRODUCTS_ALL', '4', 'Number of products to list per screen', 3, 45, NULL, '2022-10-05 16:14:20', NULL, NULL),
(90, 'Maximum Display of Language Flags in Language Side Box', 'MAX_LANGUAGE_FLAGS_COLUMNS', '3', 'Number of Language Flags per Row', 3, 50, NULL, '2022-10-05 16:14:20', NULL, NULL),
(91, 'Maximum File Upload Size', 'MAX_FILE_UPLOAD_SIZE', '2048000', 'What is the Maximum file size for uploads?<br />Default= 2048000', 3, 60, NULL, '2022-10-05 16:14:20', NULL, NULL),
(92, 'Allowed Filename Extensions for uploading', 'UPLOAD_FILENAME_EXTENSIONS', 'jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip', 'List the permissible filetypes (filename extensions) to be allowed when files are uploaded to your site by customers. Separate multiple values with commas(,). Do not include the dot(.).<br /><br />Suggested setting: "jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip"', 3, 61, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea('),
(93, 'Maximum Orders Detail Display on Admin Orders Listing', 'MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING', '0', 'Maximum number of Order Details<br />0 = Unlimited', 3, 65, NULL, '2022-10-05 16:14:20', NULL, NULL),
(94, 'Maximum PayPal IPN Display on Admin Listing', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', 'Maximum number of PayPal IPN Lisings in Admin<br />Default is 20', 3, 66, NULL, '2022-10-05 16:14:20', NULL, NULL),
(95, 'Maximum Display Columns Products to Multiple Categories Manager', 'MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS', '3', 'Maximum Display Columns Products to Multiple Categories Manager<br />3 = Default', 3, 70, NULL, '2022-10-05 16:14:20', NULL, NULL),
(96, 'Maximum Display EZ-Pages', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', 'Maximum Display EZ-Pages<br />20 = Default', 3, 71, NULL, '2022-10-05 16:14:20', NULL, NULL),
(97, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '190', 'The pixel width of small images', 4, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(98, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '190', 'The pixel height of small images', 4, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(99, 'Heading Image Width - Admin', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', 4, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(100, 'Heading Image Height - Admin', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', 4, 4, NULL, '2022-10-05 16:14:20', NULL, NULL),
(101, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '190', 'The pixel width of subcategory images', 4, 5, NULL, '2022-10-05 16:14:20', NULL, NULL),
(102, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '190', 'The pixel height of subcategory images', 4, 6, NULL, '2022-10-05 16:14:20', NULL, NULL),
(103, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(104, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(105, 'Image - Shopping Cart Status', 'IMAGE_SHOPPING_CART_STATUS', '1', 'Show product image in the shopping cart?<br />0= off 1= on', 4, 9, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(106, 'Image - Shopping Cart Width', 'IMAGE_SHOPPING_CART_WIDTH', '190', 'Default = 50', 4, 10, NULL, '2022-10-05 16:14:20', NULL, NULL),
(107, 'Image - Shopping Cart Height', 'IMAGE_SHOPPING_CART_HEIGHT', '190', 'Default = 40', 4, 11, NULL, '2022-10-05 16:14:20', NULL, NULL),
(108, 'Category Icon Image Width - Product Info Pages', 'CATEGORY_ICON_IMAGE_WIDTH', '190', 'The pixel width of Category Icon heading images for Product Info Pages', 4, 13, NULL, '2022-10-05 16:14:20', NULL, NULL),
(109, 'Category Icon Image Height - Product Info Pages', 'CATEGORY_ICON_IMAGE_HEIGHT', '190', 'The pixel height of Category Icon heading images for Product Info Pages', 4, 14, NULL, '2022-10-05 16:14:20', NULL, NULL),
(110, 'Top Subcategory Image Width', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '190', 'The pixel width of Top subcategory images<br />Top subcategory is when the Category contains subcategories', 4, 15, NULL, '2022-10-05 16:14:20', NULL, NULL),
(111, 'Top Subcategory Image Height', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '190', 'The pixel height of Top subcategory images<br />Top subcategory is when the Category contains subcategories', 4, 16, NULL, '2022-10-05 16:14:20', NULL, NULL),
(112, 'Product Info - Image Width', 'MEDIUM_IMAGE_WIDTH', '190', 'The pixel width of Product Info images', 4, 20, NULL, '2022-10-05 16:14:20', NULL, NULL),
(113, 'Product Info - Image Height', 'MEDIUM_IMAGE_HEIGHT', '190', 'The pixel height of Product Info images', 4, 21, NULL, '2022-10-05 16:14:20', NULL, NULL),
(114, 'Product Info - Image Medium Suffix', 'IMAGE_SUFFIX_MEDIUM', '_MED', 'Product Info Medium Image Suffix<br />Default = _MED', 4, 22, NULL, '2022-10-05 16:14:20', NULL, NULL),
(115, 'Product Info - Image Large Suffix', 'IMAGE_SUFFIX_LARGE', '_LRG', 'Product Info Large Image Suffix<br />Default = _LRG', 4, 23, NULL, '2022-10-05 16:14:20', NULL, NULL),
(116, 'Product Info - Number of Additional Images per Row', 'IMAGES_AUTO_ADDED', '3', 'Product Info - Enter the number of additional images to display per row<br />Default = 3', 4, 30, NULL, '2022-10-05 16:14:20', NULL, NULL),
(117, 'Image - Product Listing Width', 'IMAGE_PRODUCT_LISTING_WIDTH', '190', 'Default = 100', 4, 40, NULL, '2022-10-05 16:14:20', NULL, NULL),
(118, 'Image - Product Listing Height', 'IMAGE_PRODUCT_LISTING_HEIGHT', '190', 'Default = 80', 4, 41, NULL, '2022-10-05 16:14:20', NULL, NULL),
(119, 'Image - Product New Listing Width', 'IMAGE_PRODUCT_NEW_LISTING_WIDTH', '190', 'Default = 100', 4, 42, NULL, '2022-10-05 16:14:20', NULL, NULL),
(120, 'Image - Product New Listing Height', 'IMAGE_PRODUCT_NEW_LISTING_HEIGHT', '190', 'Default = 80', 4, 43, NULL, '2022-10-05 16:14:20', NULL, NULL),
(121, 'Image - New Products Width', 'IMAGE_PRODUCT_NEW_WIDTH', '190', 'Default = 100', 4, 44, NULL, '2022-10-05 16:14:20', NULL, NULL),
(122, 'Image - New Products Height', 'IMAGE_PRODUCT_NEW_HEIGHT', '190', 'Default = 80', 4, 45, NULL, '2022-10-05 16:14:20', NULL, NULL),
(123, 'Image - Featured Products Width', 'IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH', '190', 'Default = 100', 4, 46, NULL, '2022-10-05 16:14:20', NULL, NULL),
(124, 'Image - Featured Products Height', 'IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT', '190', 'Default = 80', 4, 47, NULL, '2022-10-05 16:14:20', NULL, NULL),
(125, 'Image - Product All Listing Width', 'IMAGE_PRODUCT_ALL_LISTING_WIDTH', '190', 'Default = 100', 4, 48, NULL, '2022-10-05 16:14:20', NULL, NULL),
(126, 'Image - Product All Listing Height', 'IMAGE_PRODUCT_ALL_LISTING_HEIGHT', '190', 'Default = 80', 4, 49, NULL, '2022-10-05 16:14:20', NULL, NULL),
(127, 'Product Image - No Image Status', 'PRODUCTS_IMAGE_NO_IMAGE_STATUS', '1', 'Use automatic No Image when none is added to product<br />0= off<br />1= On', 4, 60, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(128, 'Product Image - No Image picture', 'PRODUCTS_IMAGE_NO_IMAGE', 'no_picture.gif', 'Use automatic No Image when none is added to product<br />Default = no_picture.gif', 4, 61, NULL, '2022-10-05 16:14:20', NULL, NULL),
(129, 'Image - Use Proportional Images on Products and Categories', 'PROPORTIONAL_IMAGES_STATUS', '1', 'Use Proportional Images on Products and Categories?<br /><br />NOTE: Do not use 0 height or width settings for Proportion Images<br />0= off 1= on', 4, 75, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(130, 'Email Salutation', 'ACCOUNT_GENDER', 'true', 'Display salutation choice during account creation and with account information', 5, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(131, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth field during account creation and with account information<br />NOTE: Set Minimum Value Date of Birth to blank for not required<br />Set Minimum Value Date of Birth > 0 to require', 5, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(132, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company field during account creation and with account information', 5, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(133, 'Address Line 2', 'ACCOUNT_SUBURB', 'true', 'Display address line 2 field during account creation and with account information', 5, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(134, 'State', 'ACCOUNT_STATE', 'true', 'Display state field during account creation and with account information', 5, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(135, 'State - Always display as pulldown?', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'false', 'When state field is displayed, should it always be a pulldown menu?', 5, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(136, 'Create Account Default Country ID', 'SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY', '223', 'Set Create Account Default Country ID to:<br />Default is 223', 5, 6, NULL, '2022-10-05 16:14:20', 'zen_get_country_name', 'zen_cfg_pull_down_country_list_none('),
(137, 'Fax Number', 'ACCOUNT_FAX_NUMBER', 'true', 'Display fax number field during account creation and with account information', 5, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(138, 'Show Newsletter Checkbox', 'ACCOUNT_NEWSLETTER_STATUS', '1', 'Show Newsletter Checkbox<br />0= off<br />1= Display Unchecked<br />2= Display Checked<br /><strong>Note: Defaulting this to accepted may be in violation of certain regulations for your state or country</strong>', 5, 45, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(139, 'Customer Default Email Preference', 'ACCOUNT_EMAIL_PREFERENCE', '0', 'Set the Default Customer Default Email Preference<br />0= Text<br />1= HTML<br />', 5, 46, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(140, 'Customer Product Notification Status', 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS', '1', 'Customer should be asked about product notifications after checkout success and in account preferences<br />0= Never ask<br />1= Ask (ignored on checkout if has already selected global notifications)<br /><br />Note: Sidebox must be turned off separately', 5, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(141, 'Customer Shop Status - View Shop and Prices', 'CUSTOMERS_APPROVAL', '0', 'Customer must be approved to shop<br />0= Not required<br />1= Must login to browse<br />2= May browse but no prices unless logged in<br />3= Showroom Only<br /><br />It is recommended that Option 2 be used for the purposes of Spiders if you wish customers to login to see prices.', 5, 55, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(142, 'Customer Approval Status - Authorization Pending', 'CUSTOMERS_APPROVAL_AUTHORIZATION', '0', 'Customer must be Authorized to shop<br />0= Not required<br />1= Must be Authorized to Browse<br />2= May browse but no prices unless Authorized<br />3= Customer May Browse and May see Prices but Must be Authorized to Buy<br /><br />It is recommended that Option 2 or 3 be used for the purposes of Spiders', 5, 65, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(143, 'Customer Authorization: filename', 'CUSTOMERS_AUTHORIZATION_FILENAME', 'customers_authorization', 'Customer Authorization filename<br />Note: Do not include the extension<br />Default=customers_authorization', 5, 66, NULL, '2022-10-05 16:14:20', NULL, ''),
(144, 'Customer Authorization: Hide Header', 'CUSTOMERS_AUTHORIZATION_HEADER_OFF', 'false', 'Customer Authorization: Hide Header <br />(true=hide false=show)', 5, 67, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(145, 'Customer Authorization: Hide Column Left', 'CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF', 'false', 'Customer Authorization: Hide Column Left <br />(true=hide false=show)', 5, 68, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(146, 'Customer Authorization: Hide Column Right', 'CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF', 'false', 'Customer Authorization: Hide Column Right <br />(true=hide false=show)', 5, 69, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(147, 'Customer Authorization: Hide Footer', 'CUSTOMERS_AUTHORIZATION_FOOTER_OFF', 'false', 'Customer Authorization: Hide Footer <br />(true=hide false=show)', 5, 70, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(148, 'Customer Authorization: Hide Prices', 'CUSTOMERS_AUTHORIZATION_PRICES_OFF', 'false', 'Customer Authorization: Hide Prices <br />(true=hide false=show)', 5, 71, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(149, 'Customers Referral Status', 'CUSTOMERS_REFERRAL_STATUS', '0', 'Customers Referral Code is created from<br />0= Off<br />1= 1st Discount Coupon Code used<br />2= Customer can add during create account or edit if blank<br /><br />NOTE: Once the Customers Referral Code has been set it can only be changed in the Admin Customer', 5, 80, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(150, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'authorizenet.php;freecharger.php;moneyorder.php;paypal.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: freecharger.php;cod.php;paypal.php)', 6, 0, '2022-10-13 21:42:18', '2022-10-05 16:14:20', NULL, NULL),
(151, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(152, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php;freeshipper.php;item.php;storepickup.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(153, 'Enable Free Shipping', 'MODULE_SHIPPING_FREESHIPPER_STATUS', 'True', 'Do you want to offer Free shipping?', 6, 0, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(154, 'Free Shipping Cost', 'MODULE_SHIPPING_FREESHIPPER_COST', '0.00', 'What is the Shipping cost?', 6, 6, NULL, '2022-10-05 16:14:20', NULL, NULL),
(155, 'Handling Fee', 'MODULE_SHIPPING_FREESHIPPER_HANDLING', '0', 'Handling fee for this shipping method.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(156, 'Tax Class', 'MODULE_SHIPPING_FREESHIPPER_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(157, 'Shipping Zone', 'MODULE_SHIPPING_FREESHIPPER_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(158, 'Sort Order', 'MODULE_SHIPPING_FREESHIPPER_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(159, 'Enable Store Pickup Shipping', 'MODULE_SHIPPING_STOREPICKUP_STATUS', 'True', 'Do you want to offer In Store rate shipping?', 6, 0, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(160, 'Shipping Cost', 'MODULE_SHIPPING_STOREPICKUP_COST', '0.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(161, 'Tax Class', 'MODULE_SHIPPING_STOREPICKUP_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(162, 'Tax Basis', 'MODULE_SHIPPING_STOREPICKUP_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing''), '),
(163, 'Shipping Zone', 'MODULE_SHIPPING_STOREPICKUP_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(164, 'Sort Order', 'MODULE_SHIPPING_STOREPICKUP_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(165, 'Enable Item Shipping', 'MODULE_SHIPPING_ITEM_STATUS', 'True', 'Do you want to offer per item rate shipping?', 6, 0, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(166, 'Shipping Cost', 'MODULE_SHIPPING_ITEM_COST', '2.50', 'The shipping cost will be multiplied by the number of items in an order that uses this shipping method.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(167, 'Handling Fee', 'MODULE_SHIPPING_ITEM_HANDLING', '0', 'Handling fee for this shipping method.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(168, 'Tax Class', 'MODULE_SHIPPING_ITEM_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(169, 'Tax Basis', 'MODULE_SHIPPING_ITEM_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(170, 'Shipping Zone', 'MODULE_SHIPPING_ITEM_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(171, 'Sort Order', 'MODULE_SHIPPING_ITEM_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(172, 'Enable Free Charge Module', 'MODULE_PAYMENT_FREECHARGER_STATUS', 'True', 'Do you want to accept Free Charge payments?', 6, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(173, 'Sort order of display.', 'MODULE_PAYMENT_FREECHARGER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(174, 'Payment Zone', 'MODULE_PAYMENT_FREECHARGER_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2022-10-05 16:14:20', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(175, 'Set Order Status', 'MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(176, 'Enable Check/Money Order Module', 'MODULE_PAYMENT_MONEYORDER_STATUS', 'True', 'Do you want to accept Check/Money Order payments?', 6, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(177, 'Make Payable to:', 'MODULE_PAYMENT_MONEYORDER_PAYTO', 'the Store Owner/Website Name', 'Who should payments be made payable to?', 6, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(178, 'Sort order of display.', 'MODULE_PAYMENT_MONEYORDER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(179, 'Payment Zone', 'MODULE_PAYMENT_MONEYORDER_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2022-10-05 16:14:20', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(180, 'Set Order Status', 'MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(181, 'Include Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX', 'false', 'Include Tax value in amount before discount calculation?', 6, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(182, 'This module is installed', 'MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS', 'true', '', 6, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true''), '),
(183, 'Sort Order', 'MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER', '290', 'Sort order of display.', 6, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(184, 'Include Shipping', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING', 'false', 'Include Shipping value in amount before discount calculation?', 6, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(185, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX', 'Standard', 'Re-Calculate Tax', 6, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''), '),
(186, 'Tax Class', 'MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS', '0', 'Use the following tax class when treating Group Discount as Credit Note.', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(187, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(188, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(189, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(190, 'Tax Basis', 'MODULE_SHIPPING_FLAT_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(191, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(192, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(193, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(194, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(195, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(196, 'Admin configuration_key shows', 'ADMIN_CONFIGURATION_KEY_ON', '0', 'Manually switch to value of 1 to see the configuration_key name in configuration displays', 6, 0, NULL, '2022-10-05 16:14:20', NULL, NULL),
(197, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2022-10-05 16:14:20', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(198, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes. NOTE: For USA zip codes, only use your 5 digit zip code.', 7, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(199, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(200, 'Package Tare Small to Medium - added percentage:weight', 'SHIPPING_BOX_WEIGHT', '0:3', 'What is the weight of typical packaging of small to medium packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', 7, 4, NULL, '2022-10-05 16:14:20', NULL, NULL),
(201, 'Larger packages - added packaging percentage:weight', 'SHIPPING_BOX_PADDING', '10:0', 'What is the weight of typical packaging for Large packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', 7, 5, NULL, '2022-10-05 16:14:20', NULL, NULL),
(202, 'Display Number of Boxes and Weight Status', 'SHIPPING_BOX_WEIGHT_DISPLAY', '3', 'Display Shipping Weight and Number of Boxes?<br /><br />0= off<br />1= Boxes Only<br />2= Weight Only<br />3= Both Boxes and Weight', 7, 15, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(203, 'Shipping Estimator Display Settings for Shopping Cart', 'SHOW_SHIPPING_ESTIMATOR_BUTTON', '1', '<br />0= Off<br />1= Display as Button on Shopping Cart<br />2= Display as Listing on Shopping Cart Page', 7, 20, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(204, 'Display Order Comments on Admin Invoice', 'ORDER_COMMENTS_INVOICE', '1', 'Do you want to display the Order Comments on the Admin Invoice?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', 7, 25, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(205, 'Display Order Comments on Admin Packing Slip', 'ORDER_COMMENTS_PACKING_SLIP', '1', 'Do you want to display the Order Comments on the Admin Packing Slip?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', 7, 26, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(206, 'Order Free Shipping 0 Weight Status', 'ORDER_WEIGHT_ZERO_STATUS', '0', 'If there is no weight to the order, does the order have Free Shipping?<br />0= no<br />1= yes<br /><br />Note: When using Free Shipping, Enable the Free Shipping Module this will only show when shipping is free.', 7, 15, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(207, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(208, 'Display Product Manufacturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(209, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(210, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2022-10-05 16:14:20', NULL, NULL),
(211, 'Display Product Price/Add to Cart', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price/Add to Cart', 8, 5, NULL, '2022-10-05 16:14:20', NULL, NULL),
(212, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2022-10-05 16:14:20', NULL, NULL),
(213, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2022-10-05 16:14:20', NULL, NULL),
(214, 'Display Product Price/Add to Cart Column Width', 'PRODUCTS_LIST_PRICE_WIDTH', '125', 'Define the width of the Price/Add to Cart column<br />Default= 125', 8, 8, NULL, '2022-10-05 16:14:20', NULL, NULL),
(215, 'Display Category/Manufacturer Filter (0=off; 1=on)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(216, 'Prev/Next Split Page Navigation (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '3', 'Sets the location of the Prev/Next Split Page Navigation', 8, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(217, 'Display Product Listing Default Sort Order', 'PRODUCT_LISTING_DEFAULT_SORT_ORDER', '', 'Product Listing Default sort order?<br />NOTE: Leave Blank for Product Sort Order. Sort the Product Listing in the order you wish for the default display to start in to get the sort order setting. Example: 2a', 8, 15, NULL, '2022-10-05 16:14:20', NULL, NULL),
(218, 'Display Product Add to Cart Button (0=off; 1=on; 2=on with Qty Box per Product)', 'PRODUCT_LIST_PRICE_BUY_NOW', '1', 'Do you want to display the Add to Cart Button?<br /><br /><strong>NOTE:</strong> Turn OFF Display Multiple Products Qty Box Status to use Option 2 on with Qty Box per Product', 8, 20, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), ');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(219, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 8, 25, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(220, 'Display Product Description', 'PRODUCT_LIST_DESCRIPTION', '400', 'Do you want to display the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 8, 30, NULL, '2022-10-05 16:14:20', NULL, NULL),
(221, 'Product Listing Ascending Sort Order', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', 'What do you want to use to indicate Sort Order Ascending?<br />Default = +', 8, 40, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea_small('),
(222, 'Product Listing Descending Sort Order', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', 'What do you want to use to indicate Sort Order Descending?<br />Default = -', 8, 41, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea_small('),
(223, 'Include Product Listing Alpha Sorter Dropdown', 'PRODUCT_LIST_ALPHA_SORTER', 'true', 'Do you want to include an Alpha Filter dropdown on the Product Listing?', 8, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(224, 'Include Product Listing Sub Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'true', 'Do you want to include the Sub Categories Image on the Product Listing?', 8, 52, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(225, 'Include Product Listing Top Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'true', 'Do you want to include the Top Categories Image on the Product Listing?', 8, 53, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(226, 'Show SubCategories on Main Page while navigating', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', 'Show Sub-Categories on Main Page while navigating through Categories<br /><br />0= off<br />1= on', 8, 60, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(227, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(228, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(229, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(230, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2022-10-05 16:14:20', NULL, NULL),
(231, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2022-10-05 16:14:20', NULL, NULL),
(232, 'Products status in Catalog when out of stock should be set to', 'SHOW_PRODUCTS_SOLD_OUT', '0', 'Show Products when out of stock<br /><br />0= set product status to OFF<br />1= leave product status ON', 9, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(233, 'Show Sold Out Image in place of Add to Cart', 'SHOW_PRODUCTS_SOLD_OUT_IMAGE', '1', 'Show Sold Out Image instead of Add to Cart Button<br /><br />0= off<br />1= on', 9, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(234, 'Product Quantity Decimals', 'QUANTITY_DECIMALS', '0', 'Allow how many decimals on Quantity<br /><br />0= off', 9, 15, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(235, 'Show Shopping Cart - Delete Checkboxes or Delete Button', 'SHOW_SHOPPING_CART_DELETE', '3', 'Show on Shopping Cart Delete Button and/or Checkboxes<br /><br />1= Delete Button Only<br />2= Checkbox Only<br />3= Both Delete Button and Checkbox', 9, 20, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(236, 'Show Shopping Cart - Update Cart Button Location', 'SHOW_SHOPPING_CART_UPDATE', '3', 'Show on Shopping Cart Update Cart Button Location as:<br /><br />1= Next to each Qty Box<br />2= Below all Products<br />3= Both Next to each Qty Box and Below all Products', 9, 22, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(237, 'Show New Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', 'Show New Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 30, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(238, 'Show Featured Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', 'Show Featured Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 31, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(239, 'Show Special Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', 'Show Special Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 32, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(240, 'Show Upcoming Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', 'Show Upcoming Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 33, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(241, 'Show Notice of Combining Shopping Cart on Login', 'SHOW_SHOPPING_CART_COMBINED', '1', 'When a customer logs in and has a previously stored shopping cart, the products are combined with the existing shopping cart.<br /><br />Do you wish to display a Notice to the customer?<br /><br />0= OFF, do not display a notice<br />1= Yes show notice and go to shopping cart<br />2= Yes show notice, but do not go to shopping cart', 9, 35, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(242, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(243, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', 'C:/xampp/htdocs/site1/cache/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(244, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(245, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'false', 'Display the page parse time on the bottom of each page<br />You do not need to store the times to display them in the Catalog', 10, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(246, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(247, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'PHP', 'Defines the method for sending mail.<br /><strong>PHP</strong> is the default, and uses built-in PHP wrappers for processing.<br />Servers running on Windows and MacOS should change this setting to <strong>SMTP</strong>.<br /><br /><strong>SMTPAUTH</strong> should only be used if your server requires SMTP authorization to send messages. You must also configure your SMTPAUTH settings in the appropriate fields in this admin section.<br /><br /><strong>sendmail</strong> is for linux/unix hosts using the sendmail program on the server<br /><strong>"sendmail-f"</strong> is only for servers which require the use of the -f parameter to send mail. This is a security setting often used to prevent spoofing. Will cause errors if your host mailserver is not configured to use it.<br /><br /><strong>Qmail</strong> is used for linux/unix hosts running Qmail as sendmail wrapper at /var/qmail/bin/sendmail.', 12, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''PHP'', ''sendmail'', ''sendmail-f'', ''smtp'', ''smtpauth'', ''Qmail''),'),
(248, 'SMTP Email Account Mailbox', 'EMAIL_SMTPAUTH_MAILBOX', 'YourEmailAccountNameHere', 'Enter the mailbox account name (me@mydomain.com) supplied by your host. This is the account name that your host requires for SMTP authentication.<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2022-10-05 16:14:20', NULL, NULL),
(249, 'SMTP Email Account Password', 'EMAIL_SMTPAUTH_PASSWORD', 'YourPasswordHere', 'Enter the password for your SMTP mailbox. <br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2022-10-05 16:14:20', 'zen_cfg_password_display', NULL),
(250, 'SMTP Email Mail Host', 'EMAIL_SMTPAUTH_MAIL_SERVER', 'mail.EnterYourDomain.com', 'Enter the DNS name of your SMTP mail server.<br />ie: mail.mydomain.com<br />or 55.66.77.88<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2022-10-05 16:14:20', NULL, NULL),
(251, 'SMTP Email Mail Server Port', 'EMAIL_SMTPAUTH_MAIL_SERVER_PORT', '25', 'Enter the IP port number that your SMTP mailserver operates on.<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2022-10-05 16:14:20', NULL, NULL),
(252, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''LF'', ''CRLF''),'),
(253, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(254, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 6, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(255, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(256, 'Email Archiving Active?', 'EMAIL_ARCHIVE', 'false', 'If you wish to have email messages archived/stored when sent, set this to "true".', 12, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(257, 'E-Mail Friendly-Errors', 'EMAIL_FRIENDLY_ERRORS', 'true', 'Do you want to display friendly errors if emails fail?  Setting this to false will display PHP errors and likely cause the script to fail. Only set to false while troubleshooting, and true for a live shop.', 12, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(258, 'Email Address (Displayed to Contact you)', 'STORE_OWNER_EMAIL_ADDRESS', 'admin@site1.com', 'Email address of Store Owner.  Used as "display only" when informing customers of how to contact you.', 12, 10, NULL, '2022-10-05 16:14:20', NULL, NULL),
(259, 'Email Address (sent FROM)', 'EMAIL_FROM', 'admin@site1.com', 'Address from which email messages will be "sent" by default. Can be over-ridden at compose-time in admin modules.', 12, 11, NULL, '2022-10-05 16:14:20', NULL, NULL),
(260, 'Emails must send from known domain?', 'EMAIL_SEND_MUST_BE_STORE', 'Yes', 'Does your mailserver require that all outgoing emails have their "from" address match a known domain that exists on your webserver?<br /><br />This is often required in order to prevent spoofing and spam broadcasts.  If set to Yes, this will cause the email address (sent FROM) to be used as the "from" address on all outgoing mail.', 12, 11, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(261, 'Email Admin Format?', 'ADMIN_EXTRA_EMAIL_FORMAT', 'TEXT', 'Please select the Admin extra email format', 12, 12, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''TEXT'', ''HTML''), '),
(262, 'Send Copy of Order Confirmation Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', 'admin@site1.com', 'Send COPIES of order confirmation emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 12, NULL, '2022-10-05 16:14:20', NULL, NULL),
(263, 'Send Copy of Create Account Emails To - Status', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS', '0', 'Send copy of Create Account Status<br />0= off 1= on', 12, 13, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(264, 'Send Copy of Create Account Emails To', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO', 'admin@site1.com', 'Send copy of Create Account emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 14, NULL, '2022-10-05 16:14:20', NULL, NULL),
(265, 'Send Copy of Customer GV Send Emails To - Status', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS', '0', 'Send copy of Customer GV Send Status<br />0= off 1= on', 12, 17, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(266, 'Send Copy of Customer GV Send Emails To', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO', 'admin@site1.com', 'Send copy of Customer GV Send emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 18, NULL, '2022-10-05 16:14:20', NULL, NULL),
(267, 'Send Copy of Admin GV Mail Emails To - Status', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin GV Mail Status<br />0= off 1= on', 12, 19, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(268, 'Send Copy of Customer Admin GV Mail Emails To', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO', 'admin@site1.com', 'Send copy of Admin GV Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 20, NULL, '2022-10-05 16:14:20', NULL, NULL),
(269, 'Send Copy of Admin Discount Coupon Mail Emails To - Status', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Discount Coupon Mail Status<br />0= off 1= on', 12, 21, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(270, 'Send Copy of Customer Admin Discount Coupon Mail Emails To', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO', 'admin@site1.com', 'Send copy of Admin Discount Coupon Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 22, NULL, '2022-10-05 16:14:20', NULL, NULL),
(271, 'Send Copy of Admin Orders Status Emails To - Status', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Orders Status Status<br />0= off 1= on', 12, 23, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(272, 'Send Copy of Admin Orders Status Emails To', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO', 'admin@site1.com', 'Send copy of Admin Orders Status emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 24, NULL, '2022-10-05 16:14:20', NULL, NULL),
(273, 'Send Notice of Pending Reviews Emails To - Status', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS', '0', 'Send copy of Pending Reviews Status<br />0= off 1= on', 12, 25, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(274, 'Send Notice of Pending Reviews Emails To', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO', 'admin@site1.com', 'Send copy of Pending Reviews emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 26, NULL, '2022-10-05 16:14:20', NULL, NULL),
(275, 'Set "Contact Us" Email Dropdown List', 'CONTACT_US_LIST', '', 'On the "Contact Us" Page, set the list of email addresses , in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 40, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea('),
(276, 'Contact Us - Show Store Name and Address', 'CONTACT_US_STORE_NAME_ADDRESS', '1', 'Include Store Name and Address<br />0= off 1= on', 12, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(277, 'Send Low Stock Emails', 'SEND_LOWSTOCK_EMAIL', '0', 'When stock level is at or below low stock level send an email<br />0= off<br />1= on', 12, 60, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(278, 'Send Low Stock Emails To', 'SEND_EXTRA_LOW_STOCK_EMAILS_TO', 'admin@site1.com', 'When stock level is at or below low stock level send an email to this address, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 61, NULL, '2022-10-05 16:14:20', NULL, NULL),
(279, 'Display "Newsletter Unsubscribe" Link?', 'SHOW_NEWSLETTER_UNSUBSCRIBE_LINK', 'true', 'Show "Newsletter Unsubscribe" link in the "Information" side-box?', 12, 70, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(280, 'Audience-Select Count Display', 'AUDIENCE_SELECT_DISPLAY_COUNTS', 'true', 'When displaying lists of available audiences/recipients, should the recipients-count be included? <br /><em>(This may make things slower if you have a lot of customers or complex audience queries)</em>', 12, 90, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(281, 'Enable Downloads', 'DOWNLOAD_ENABLED', 'true', 'Enable the products download functions.', 13, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(282, 'Download by Redirect', 'DOWNLOAD_BY_REDIRECT', 'true', 'Use browser redirection for download. Disable on non-Unix systems.<br /><br />Note: Set /pub to 777 when redirect is true', 13, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(283, 'Download by streaming', 'DOWNLOAD_IN_CHUNKS', 'false', 'If download-by-redirect is disabled, and your PHP memory_limit setting is under 8 MB, you might need to enable this setting so that files are streamed in smaller segments to the browser.<br /><br />Has no effect if Download By Redirect is enabled.', 13, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(284, 'Download Expiration (Number of Days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2022-10-05 16:14:20', NULL, ''),
(285, 'Number of Downloads Allowed - Per Product', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2022-10-05 16:14:20', NULL, ''),
(286, 'Downloads Controller Update Status Value', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '4', 'What orders_status resets the Download days and Max Downloads - Default is 4', 13, 10, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(287, 'Downloads Controller Order Status Value >= lower value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', 'Downloads Controller Order Status Value - Default >= 2<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status greater than this value will be available for download. The orders status is set for an order by the Payment Modules. Set the lower range for this range.', 13, 12, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(288, 'Downloads Controller Order Status Value <= upper value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS_END', '4', 'Downloads Controller Order Status Value - Default <= 4<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status less than this value will be available for download. The orders status is set for an order by the Payment Modules.  Set the upper range for this range.', 13, 13, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(289, 'Enable Price Factor', 'ATTRIBUTES_ENABLED_PRICE_FACTOR', 'true', 'Enable the Attributes Price Factor.', 13, 25, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(290, 'Enable Qty Price Discount', 'ATTRIBUTES_ENABLED_QTY_PRICES', 'true', 'Enable the Attributes Quantity Price Discounts.', 13, 26, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(291, 'Enable Attribute Images', 'ATTRIBUTES_ENABLED_IMAGES', 'true', 'Enable the Attributes Images.', 13, 28, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(292, 'Enable Text Pricing by word or letter', 'ATTRIBUTES_ENABLED_TEXT_PRICES', 'true', 'Enable the Attributes Text Pricing by word or letter.', 13, 35, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(293, 'Text Pricing - Spaces are Free', 'TEXT_SPACES_FREE', '1', 'On Text pricing Spaces are Free<br /><br />0= off 1= on', 13, 36, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(294, 'Read Only option type - Ignore for Add to Cart', 'PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED', '1', 'When a Product only uses READONLY attributes, should the Add to Cart button be On or Off?<br />0= OFF<br />1= ON', 13, 37, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(295, 'Enable GZip Compression', 'GZIP_LEVEL', '0', '0= off 1= on', 14, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(296, 'Session Directory', 'SESSION_WRITE_DIRECTORY', 'C:/xampp/htdocs/site1/cache', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(297, 'Cookie Domain', 'SESSION_USE_FQDN', 'True', 'If True the full domain name will be used to store the cookie, e.g. www.mydomain.com. If False only a partial domain name will be used, e.g. mydomain.com. If you are unsure about this, always leave set to true.', 15, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(298, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(299, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(300, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(301, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(302, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(303, 'Recreate Session', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(304, 'IP to Host Conversion Status', 'SESSION_IP_TO_HOST_ADDRESS', 'true', 'Convert IP Address to Host Address<br /><br />Note: on some servers this can slow down the initial start of a session or execution of Emails', 15, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(305, 'Length of the redeem code', 'SECURITY_CODE_LENGTH', '10', 'Enter the length of the redeem code<br />The longer the more secure', 16, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(306, 'Default Order Status For Zero Balance Orders', 'DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID', '2', 'When an order''s balance is zero, this order status will be assigned to it.', 16, 0, NULL, '2022-10-05 16:14:20', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(307, 'New Signup Discount Coupon ID#', 'NEW_SIGNUP_DISCOUNT_COUPON', '', 'Select the coupon<br />', 16, 75, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_coupon_id('),
(308, 'New Signup Gift Voucher Amount', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '', 'Leave blank for none<br />Or enter an amount ie. 10 for $10.00', 16, 76, NULL, '2022-10-05 16:14:20', NULL, NULL),
(309, 'Maximum Discount Coupons Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS', '20', 'Number of Discount Coupons to list per Page', 16, 81, NULL, '2022-10-05 16:14:20', NULL, NULL),
(310, 'Maximum Discount Coupon Report Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS', '20', 'Number of Discount Coupons to list on Reports Page', 16, 81, NULL, '2022-10-05 16:14:20', NULL, NULL),
(311, 'Credit Card Enable Status - VISA', 'CC_ENABLED_VISA', '1', 'Accept VISA 0= off 1= on', 17, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(312, 'Credit Card Enable Status - MasterCard', 'CC_ENABLED_MC', '1', 'Accept MasterCard 0= off 1= on', 17, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(313, 'Credit Card Enable Status - AmericanExpress', 'CC_ENABLED_AMEX', '0', 'Accept AmericanExpress 0= off 1= on', 17, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(314, 'Credit Card Enable Status - Diners Club', 'CC_ENABLED_DINERS_CLUB', '0', 'Accept Diners Club 0= off 1= on', 17, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(315, 'Credit Card Enable Status - Discover Card', 'CC_ENABLED_DISCOVER', '0', 'Accept Discover Card 0= off 1= on', 17, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(316, 'Credit Card Enable Status - JCB', 'CC_ENABLED_JCB', '0', 'Accept JCB 0= off 1= on', 17, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(317, 'Credit Card Enable Status - AUSTRALIAN BANKCARD', 'CC_ENABLED_AUSTRALIAN_BANKCARD', '0', 'Accept AUSTRALIAN BANKCARD 0= off 1= on', 17, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(318, 'Credit Card Enable Status - SOLO', 'CC_ENABLED_SOLO', '0', 'Accept SOLO Card 0= off 1= on', 17, 8, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(319, 'Credit Card Enable Status - Switch', 'CC_ENABLED_SWITCH', '0', 'Accept SWITCH Card 0= off 1= on', 17, 9, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(320, 'Credit Card Enable Status - Maestro', 'CC_ENABLED_MAESTRO', '0', 'Accept MAESTRO Card 0= off 1= on', 17, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(321, 'Credit Card Enabled - Show on Payment', 'SHOW_ACCEPTED_CREDIT_CARDS', '0', 'Show accepted credit cards on Payment page?<br />0= off<br />1= As Text<br />2= As Images<br /><br />Note: images and text must be defined in both the database and language file for specific credit card types.', 17, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(322, 'This module is installed', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true''),'),
(323, 'Sort Order', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '840', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:40', NULL, NULL),
(324, 'Queue Purchases', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', 'Do you want to queue purchases of the Gift Voucher?', 6, 3, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(325, 'Include Shipping', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', 'Include Shipping in calculation', 6, 5, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(326, 'Include Tax', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'true', 'Include Tax in calculation.', 6, 6, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(327, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', 'Re-Calculate Tax', 6, 7, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(328, 'Tax Class', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', 'Use the following tax class when treating Gift Voucher as Credit Note.', 6, 0, NULL, '2003-10-30 22:16:40', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(329, 'Credit including Tax', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', 'Add tax to purchased Gift Voucher when crediting to Account', 6, 8, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(330, 'Set Order Status', 'MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID', '0', 'Set the status of orders made where GV covers full payment', 6, 0, NULL, '2022-10-05 16:14:20', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(331, 'This module is installed', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true''),'),
(332, 'Sort Order', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '400', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:43', NULL, NULL),
(333, 'Allow Low Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', 'Do you want to allow low order fees?', 6, 3, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(334, 'Order Fee For Orders Under', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', 'Add the low order fee to orders under this amount.', 6, 4, NULL, '2003-10-30 22:16:43', 'currencies->format', NULL),
(335, 'Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', 'For Percentage Calculation - include a % Example: 10%<br />For a flat amount just enter the amount - Example: 5 for $5.00', 6, 5, NULL, '2003-10-30 22:16:43', '', NULL),
(336, 'Attach Low Order Fee On Orders Made', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', 'Attach low order fee for orders sent to the set destination.', 6, 6, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(337, 'Tax Class', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', 'Use the following tax class on the low order fee.', 6, 7, NULL, '2003-10-30 22:16:43', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(338, 'No Low Order Fee on Virtual Products', 'MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL', 'false', 'Do not charge Low Order Fee when cart is Virtual Products Only', 6, 8, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(339, 'No Low Order Fee on Gift Vouchers', 'MODULE_ORDER_TOTAL_LOWORDERFEE_GV', 'false', 'Do not charge Low Order Fee when cart is Gift Vouchers Only', 6, 9, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(340, 'This module is installed', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true''),'),
(341, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:46', NULL, NULL),
(342, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(343, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2003-10-30 22:16:46', 'currencies->format', NULL),
(344, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(345, 'This module is installed', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:49', NULL, 'zen_cfg_select_option(array(''true''),'),
(346, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:49', NULL, NULL),
(347, 'This module is installed', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:52', NULL, 'zen_cfg_select_option(array(''true''),'),
(348, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '300', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:52', NULL, NULL),
(349, 'This module is installed', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:55', NULL, 'zen_cfg_select_option(array(''true''),'),
(350, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '999', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:55', NULL, NULL),
(351, 'Tax Class', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', 'Use the following tax class when treating Discount Coupon as Credit Note.', 6, 0, NULL, '2003-10-30 22:16:36', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(352, 'Include Tax', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', 'Include Tax in calculation.', 6, 6, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(353, 'Sort Order', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '280', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:36', NULL, NULL),
(354, 'Include Shipping', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'false', 'Include Shipping in calculation', 6, 5, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(355, 'This module is installed', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true''),'),
(356, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'Standard', 'Re-Calculate Tax', 6, 7, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(357, 'Admin Demo Status', 'ADMIN_DEMO', '0', 'Admin Demo should be on?<br />0= off 1= on', 6, 0, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(358, 'Product option type Select', 'PRODUCTS_OPTIONS_TYPE_SELECT', '0', 'The number representing the Select type of product option.', 0, NULL, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(359, 'Text product option type', 'PRODUCTS_OPTIONS_TYPE_TEXT', '1', 'Numeric value of the text product option type', 6, NULL, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(360, 'Radio button product option type', 'PRODUCTS_OPTIONS_TYPE_RADIO', '2', 'Numeric value of the radio button product option type', 6, NULL, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(361, 'Check box product option type', 'PRODUCTS_OPTIONS_TYPE_CHECKBOX', '3', 'Numeric value of the check box product option type', 6, NULL, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(362, 'File product option type', 'PRODUCTS_OPTIONS_TYPE_FILE', '4', 'Numeric value of the file product option type', 6, NULL, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(363, 'ID for text and file products options values', 'PRODUCTS_OPTIONS_VALUES_TEXT_ID', '0', 'Numeric value of the products_options_values_id used by the text and file attributes.', 6, NULL, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(364, 'Upload prefix', 'UPLOAD_PREFIX', 'upload_', 'Prefix used to differentiate between upload options and other options', 0, NULL, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(365, 'Text prefix', 'TEXT_PREFIX', 'txt_', 'Prefix used to differentiate between text option values and other option values', 0, NULL, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(366, 'Read Only option type', 'PRODUCTS_OPTIONS_TYPE_READONLY', '5', 'Numeric value of the file product option type', 6, NULL, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, NULL),
(367, 'login mode https', 'SSLPWSTATUSCHECK', '', 'System setting. Do not edit.', 6, 99, NULL, '2022-10-05 16:14:20', NULL, NULL),
(368, 'Products Info - Products Option Name Sort Order', 'PRODUCTS_OPTIONS_SORT_ORDER', '0', 'Sort order of Option Names for Products Info<br />0= Sort Order, Option Name<br />1= Option Name', 18, 35, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(369, 'Products Info - Product Option Value of Attributes Sort Order', 'PRODUCTS_OPTIONS_SORT_BY_PRICE', '1', 'Sort order of Product Option Values of Attributes for Products Info<br />0= Sort Order, Price<br />1= Sort Order, Option Value Name', 18, 36, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(370, 'Product Info - Show Option Values Name Below Attributes Image', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES', '1', 'Product Info - Show the name of the Option Value beneath the Attribute Image?<br />0= off 1= on', 18, 41, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(371, 'Product Info - Show Sales Discount Savings Status', 'SHOW_SALE_DISCOUNT_STATUS', '0', 'Product Info - Show the amount of discount savings?<br />0= off 1= on', 18, 45, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(372, 'Product Info - Show Sales Discount Savings Dollars or Percentage', 'SHOW_SALE_DISCOUNT', '1', 'Product Info - Show the amount of discount savings display as:<br />1= % off 2= $amount off', 18, 46, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2''), '),
(373, 'Product Info - Show Sales Discount Savings Percentage Decimals', 'SHOW_SALE_DISCOUNT_DECIMALS', '0', 'Product Info - Show discount savings display as a Percentage with how many decimals?:<br />Default= 0', 18, 47, NULL, '2022-10-05 16:14:20', NULL, NULL),
(374, 'Product Info - Price is Free Image or Text Status', 'OTHER_IMAGE_PRICE_IS_FREE_ON', '1', 'Product Info - Show the Price is Free Image or Text on Displayed Price<br />0= Text<br />1= Image', 18, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(375, 'Product Info - Price is Call for Price Image or Text Status', 'PRODUCTS_PRICE_IS_CALL_IMAGE_ON', '1', 'Product Info - Show the Price is Call for Price Image or Text on Displayed Price<br />0= Text<br />1= Image', 18, 51, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(376, 'Product Quantity Box Status - Adding New Products', 'PRODUCTS_QTY_BOX_STATUS', '1', 'What should the Default Quantity Box Status be set to when adding New Products?<br /><br />0= off<br />1= on<br />NOTE: This will show a Qty Box when ON and default the Add to Cart to 1', 18, 55, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(377, 'Product Reviews Require Approval', 'REVIEWS_APPROVAL', '1', 'Do product reviews require approval?<br /><br />Note: When Review Status is off, it will also not show<br /><br />0= off 1= on', 18, 62, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(378, 'Meta Tags - Include Product Model in Title', 'META_TAG_INCLUDE_MODEL', '1', 'Do you want to include the Product Model in the Meta Tag Title?<br /><br />0= off 1= on', 18, 69, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(379, 'Meta Tags - Include Product Price in Title', 'META_TAG_INCLUDE_PRICE', '1', 'Do you want to include the Product Price in the Meta Tag Title?<br /><br />0= off 1= on', 18, 70, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(380, 'Meta Tags Generated Description Maximum Length?', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', 'Set Generated Meta Tag Description Maximum Length to (words) Default 50:', 18, 71, NULL, '2022-10-05 16:14:20', '', ''),
(381, 'Also Purchased Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS', '3', 'Also Purchased Products Columns per Row<br />0= off or set the sort order', 18, 72, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(382, 'Previous Next - Navigation Bar Position', 'PRODUCT_INFO_PREVIOUS_NEXT', '2', 'Location of Previous/Next Navigation Bar<br />0= off<br />1= Top of Page<br />2= Bottom of Page<br />3= Both Top and Bottom of Page', 18, 21, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''Top of Page''), array(''id''=>''2'', ''text''=>''Bottom of Page''), array(''id''=>''3'', ''text''=>''Both Top & Bottom of Page'')),'),
(383, 'Previous Next - Sort Order', 'PRODUCT_INFO_PREVIOUS_NEXT_SORT', '1', 'Products Display Order by<br />0= Product ID<br />1= Product Name<br />2= Model<br />3= Price, Product Name<br />4= Price, Model<br />5= Product Name, Model<br />6= Product Sort Order', 18, 22, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Product ID''), array(''id''=>''1'', ''text''=>''Name''), array(''id''=>''2'', ''text''=>''Product Model''), array(''id''=>''3'', ''text''=>''Product Price - Name''), array(''id''=>''4'', ''text''=>''Product Price - Model''), array(''id''=>''5'', ''text''=>''Product Name - Model''), array(''id''=>''6'', ''text''=>''Product Sort Order'')),'),
(384, 'Previous Next - Button and Image Status', 'SHOW_PREVIOUS_NEXT_STATUS', '0', 'Button and Product Image status settings are:<br />0= Off<br />1= On', 18, 20, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''On'')),'),
(385, 'Previous Next - Button and Image Settings', 'SHOW_PREVIOUS_NEXT_IMAGES', '0', 'Show Previous/Next Button and Product Image Settings<br />0= Button Only<br />1= Button and Product Image<br />2= Product Image Only', 18, 21, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Button Only''), array(''id''=>''1'', ''text''=>''Button and Product Image''), array(''id''=>''2'', ''text''=>''Product Image Only'')),'),
(386, 'Previous Next - Image Width?', 'PREVIOUS_NEXT_IMAGE_WIDTH', '50', 'Previous/Next Image Width?', 18, 22, NULL, '2022-10-05 16:14:20', '', ''),
(387, 'Previous Next - Image Height?', 'PREVIOUS_NEXT_IMAGE_HEIGHT', '40', 'Previous/Next Image Height?', 18, 23, NULL, '2022-10-05 16:14:20', '', ''),
(388, 'Previous Next - Navigation Includes Category Position', 'PRODUCT_INFO_CATEGORIES', '1', 'Product''s Category Image and Name Alignment Above Previous/Next Navigation Bar<br />0= off<br />1= Align Left<br />2= Align Center<br />3= Align Right', 18, 20, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''Align Left''), array(''id''=>''2'', ''text''=>''Align Center''), array(''id''=>''3'', ''text''=>''Align Right'')),'),
(389, 'Previous Next - Navigation Includes Category Name and Image Status', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', 'Product''s Category Image and Name Status<br />0= Category Name and Image always shows<br />1= Category Name only<br />2= Category Name and Image when not blank', 18, 20, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Category Name and Image Always''), array(''id''=>''1'', ''text''=>''Category Name only''), array(''id''=>''2'', ''text''=>''Category Name and Image when not blank'')),'),
(390, 'Column Width - Left Boxes', 'BOX_WIDTH_LEFT', '210px', 'Width of the Left Column Boxes<br />px may be included<br />Default = 150px', 19, 1, NULL, '2003-11-21 22:16:36', NULL, NULL),
(391, 'Column Width - Right Boxes', 'BOX_WIDTH_RIGHT', '210px', 'Width of the Right Column Boxes<br />px may be included<br />Default = 150px', 19, 2, NULL, '2003-11-21 22:16:36', NULL, NULL),
(392, 'Bread Crumbs Navigation Separator', 'BREAD_CRUMBS_SEPARATOR', '&nbsp;::&nbsp;', 'Enter the separator symbol to appear between the Navigation Bread Crumb trail<br />Note: Include spaces with the &amp;nbsp; symbol if you want them part of the separator.<br />Default = &amp;nbsp;::&amp;nbsp;', 19, 3, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(393, 'Define Breadcrumb Status', 'DEFINE_BREADCRUMB_STATUS', '0', 'Enable the Breadcrumb Trail Links?<br />0= OFF<br />1= ON<br />2= Off for Home Page Only', 19, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(394, 'Bestsellers - Number Padding', 'BEST_SELLERS_FILLER', '&nbsp;', 'What do you want to Pad the numbers with?<br />Default = &amp;nbsp;', 19, 5, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(395, 'Bestsellers - Truncate Product Names', 'BEST_SELLERS_TRUNCATE', '35', 'What size do you want to truncate the Product Names?<br />Default = 35', 19, 6, NULL, '2003-11-21 22:16:36', NULL, NULL),
(396, 'Bestsellers - Truncate Product Names followed by ...', 'BEST_SELLERS_TRUNCATE_MORE', 'true', 'When truncated Product Names follow with ...<br />Default = true', 19, 7, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(397, 'Categories Box - Show Specials Link', 'SHOW_CATEGORIES_BOX_SPECIALS', 'false', 'Show Specials Link in the Categories Box', 19, 8, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(398, 'Categories Box - Show Products New Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_NEW', 'false', 'Show Products New Link in the Categories Box', 19, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(399, 'Shopping Cart Box Status', 'SHOW_SHOPPING_CART_BOX_STATUS', '0', 'Shopping Cart Shows<br />0= Always<br />1= Only when full<br />2= Only when full but not when viewing the Shopping Cart', 19, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(400, 'Categories Box - Show Featured Products Link', 'SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS', 'false', 'Show Featured Products Link in the Categories Box', 19, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(401, 'Categories Box - Show Products All Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_ALL', 'false', 'Show Products All Link in the Categories Box', 19, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(402, 'Column Left Status - Global', 'COLUMN_LEFT_STATUS', '0', 'Show Column Left, unless page override exists?<br />0= Column Left is always off<br />1= Column Left is on, unless page override', 19, 15, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(403, 'Column Right Status - Global', 'COLUMN_RIGHT_STATUS', '1', 'Show Column Right, unless page override exists?<br />0= Column Right is always off<br />1= Column Right is on, unless page override', 19, 16, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(404, 'Column Width - Left', 'COLUMN_WIDTH_LEFT', '210px', 'Width of the Left Column<br />px may be included<br />Default = 150px', 19, 20, NULL, '2003-11-21 22:16:36', NULL, NULL),
(405, 'Column Width - Right', 'COLUMN_WIDTH_RIGHT', '210px', 'Width of the Right Column<br />px may be included<br />Default = 150px', 19, 21, NULL, '2003-11-21 22:16:36', NULL, NULL),
(406, 'Categories Separator between links Status', 'SHOW_CATEGORIES_SEPARATOR_LINK', '1', 'Show Category Separator between Category Names and Links?<br />0= off<br />1= on', 19, 24, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(407, 'Categories Separator between the Category Name and Count', 'CATEGORIES_SEPARATOR', '-&gt;', 'What separator do you want between the Category name and the count?<br />Default = -&amp;gt;', 19, 25, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(408, 'Categories Separator between the Category Name and Sub Categories', 'CATEGORIES_SEPARATOR_SUBS', '', 'What separator do you want between the Category name and Sub Category Name?<br />Default = |_&amp;nbsp;', 19, 26, NULL, '2004-03-25 22:16:36', NULL, 'zen_cfg_textarea_small('),
(409, 'Categories Count Prefix', 'CATEGORIES_COUNT_PREFIX', '&nbsp;(', 'What do you want to Prefix the count with?<br />Default= (', 19, 27, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(410, 'Categories Count Suffix', 'CATEGORIES_COUNT_SUFFIX', ')', 'What do you want as a Suffix to the count?<br />Default= )', 19, 28, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(411, 'Categories SubCategories Indent', 'CATEGORIES_SUBCATEGORIES_INDENT', '&nbsp;&nbsp;', 'What do you want to use as the subcategories indent?<br />Default= &nbsp;&nbsp;', 19, 29, NULL, '2004-06-24 22:16:36', NULL, 'zen_cfg_textarea_small('),
(412, 'Categories with 0 Products Status', 'CATEGORIES_COUNT_ZERO', '0', 'Show Category Count for 0 Products?<br />0= off<br />1= on', 19, 30, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), ');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(413, 'Split Categories Box', 'CATEGORIES_SPLIT_DISPLAY', 'True', 'Split the categories box display by product type', 19, 31, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(414, 'Shopping Cart - Show Totals', 'SHOW_TOTALS_IN_CART', '1', 'Show Totals Above Shopping Cart?<br />0= off<br />1= on: Items Weight Amount<br />2= on: Items Weight Amount, but no weight when 0<br />3= on: Items Amount', 19, 31, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(415, 'Customer Greeting - Show on Index Page', 'SHOW_CUSTOMER_GREETING', '0', 'Always Show Customer Greeting on Index?<br />0= off<br />1= on', 19, 40, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(416, 'Categories - Always Show on Main Page', 'SHOW_CATEGORIES_ALWAYS', '0', 'Always Show Categories on Main Page<br />0= off<br />1= on<br />Default category can be set to Top Level or a Specific Top Level', 19, 45, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(417, 'Main Page - Opens with Category', 'CATEGORIES_START_MAIN', '0', '0= Top Level Categories<br />Or enter the Category ID#<br />Note: Sub Categories can also be used Example: 3_10', 19, 46, NULL, '2022-10-05 16:14:20', '', ''),
(418, 'Categories - Always Open to Show SubCategories', 'SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS', '1', 'Always Show Categories and SubCategories<br />0= off, just show Top Categories<br />1= on, Always show Categories and SubCategories when selected', 19, 47, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(419, 'Banner Display Groups - Header Position 1', 'SHOW_BANNERS_GROUP_SET1', 'banner-1', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 1?<br />Leave blank for none', 19, 55, NULL, '2022-10-05 16:14:20', '', ''),
(420, 'Banner Display Groups - Header Position 2', 'SHOW_BANNERS_GROUP_SET2', 'banner-2', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 2?<br />Leave blank for none', 19, 56, NULL, '2022-10-05 16:14:20', '', ''),
(421, 'Banner Display Groups - Header Position 3', 'SHOW_BANNERS_GROUP_SET3', 'banner-3', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 3?<br />Leave blank for none', 19, 57, NULL, '2022-10-05 16:14:20', '', ''),
(422, 'Banner Display Groups - Footer Position 1', 'SHOW_BANNERS_GROUP_SET4', 'banner-4', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 1?<br />Leave blank for none', 19, 65, NULL, '2022-10-05 16:14:20', '', ''),
(423, 'Banner Display Groups - Footer Position 2', 'SHOW_BANNERS_GROUP_SET5', 'banner-5', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 2?<br />Leave blank for none', 19, 66, NULL, '2022-10-05 16:14:20', '', ''),
(424, 'Banner Display Groups - Footer Position 3', 'SHOW_BANNERS_GROUP_SET6', 'banner-6', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />Default Group is Wide-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 3?<br />Leave blank for none', 19, 67, NULL, '2022-10-05 16:14:20', '', ''),
(425, 'Banner Display Groups - Side Box banner_box', 'SHOW_BANNERS_GROUP_SET7', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box?<br />Leave blank for none', 19, 70, NULL, '2022-10-05 16:14:20', '', ''),
(426, 'Banner Display Groups - Side Box banner_box2', 'SHOW_BANNERS_GROUP_SET8', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box2?<br />Leave blank for none', 19, 71, NULL, '2022-10-05 16:14:20', '', ''),
(427, 'Banner Display Group - Side Box banner_box_all', 'SHOW_BANNERS_GROUP_SET_ALL', 'BannersAll', 'The Banner Display Group may only be from one (1) Banner Group for the Banner All sidebox<br /><br />Default Group is BannersAll<br /><br />What Banner Group do you want to use in the Side Box - banner_box_all?<br />Leave blank for none', 19, 72, NULL, '2022-10-05 16:14:20', '', ''),
(428, 'Footer - Show IP Address status', 'SHOW_FOOTER_IP', '0', 'Show Customer IP Address in the Footer<br />0= off<br />1= on<br />Should the Customer IP Address show in the footer?', 19, 80, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(429, 'Product Discount Quantities - Add how many blank discounts?', 'DISCOUNT_QTY_ADD', '5', 'How many blank discount quantities should be added for Product Pricing?', 19, 90, NULL, '2022-10-05 16:14:20', '', ''),
(430, 'Product Discount Quantities - Display how many per row?', 'DISCOUNT_QUANTITY_PRICES_COLUMN', '5', 'How many discount quantities should show per row on Product Info Pages?', 19, 95, NULL, '2022-10-05 16:14:20', '', ''),
(431, 'Categories/Products Display Sort Order', 'CATEGORIES_PRODUCTS_SORT_ORDER', '0', 'Categories/Products Display Sort Order<br />0= Categories/Products Sort Order/Name<br />1= Categories/Products Name<br />2= Products Model<br />3= Products Qty+, Products Name<br />4= Products Qty-, Products Name<br />5= Products Price+, Products Name<br />6= Products Price-, Products Name', 19, 100, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6''), '),
(432, 'Option Names and Values Global Add, Copy and Delete Features Status', 'OPTION_NAMES_VALUES_GLOBAL_STATUS', '1', 'Option Names and Values Global Add, Copy and Delete Features Status<br />0= Hide Features<br />1= Show Features<br />(Default=1)', 19, 110, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(433, 'Categories-Tabs Menu ON/OFF', 'CATEGORIES_TABS_STATUS', '0', 'Categories-Tabs<br />This enables the display of your store''s categories as a menu across the top of your header. There are many potential creative uses for this.<br />0= Hide Categories Tabs<br />1= Show Categories Tabs', 19, 112, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(434, 'Site Map - include My Account Links?', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', 'Should the links to My Account show up on the site-map?<br />Note: Spiders will try to index this page, and likely should not be sent to secure pages, since there is no benefit in indexing a login page.<br /><br />Default: false', 19, 115, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''Yes'', ''No''), '),
(435, 'Skip 1-prod Categories', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', 'Skip single-product categories<br />If this option is set to True, then if the customer clicks on a link to a category which only contains a single item, then Zen Cart will take them directly to that product-page, rather than present them with another link to click in order to see the product.<br />Default: True', 19, 120, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(436, 'Use split-login page', 'USE_SPLIT_LOGIN_MODE', 'False', 'The login page can be displayed in two modes: Split or Vertical.<br />In Split mode, the create-account options are accessed by clicking a button to get to the create-account page.  In Vertical mode, the create-account input fields are all displayed inline, below the login field, making one less click for the customer to create their account.<br />Default: False', 19, 121, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(437, 'CSS Buttons', 'IMAGE_USE_CSS_BUTTONS', 'No', 'CSS Buttons<br />Use CSS buttons instead of images (GIF/JPG)?<br />Button styles must be configured in the stylesheet if you enable this option.', 19, 147, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(438, '<strong>Down for Maintenance: ON/OFF</strong>', 'DOWN_FOR_MAINTENANCE', 'false', 'Down for Maintenance <br />(true=on false=off)', 20, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(439, 'Down for Maintenance: filename', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance', 'Down for Maintenance filename<br />Note: Do not include the extension<br />Default=down_for_maintenance', 20, 2, NULL, '2022-10-05 16:14:20', NULL, ''),
(440, 'Down for Maintenance: Hide Header', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'false', 'Down for Maintenance: Hide Header <br />(true=hide false=show)', 20, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(441, 'Down for Maintenance: Hide Column Left', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'false', 'Down for Maintenance: Hide Column Left <br />(true=hide false=show)', 20, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(442, 'Down for Maintenance: Hide Column Right', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'false', 'Down for Maintenance: Hide Column Right <br />(true=hide false=show)', 20, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(443, 'Down for Maintenance: Hide Footer', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'false', 'Down for Maintenance: Hide Footer <br />(true=hide false=show)', 20, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(444, 'Down for Maintenance: Hide Prices', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', 'Down for Maintenance: Hide Prices <br />(true=hide false=show)', 20, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(445, 'Down For Maintenance (exclude this IP-Address)', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', 'your IP (ADMIN)', 'This IP Address is able to access the website while it is Down For Maintenance (like webmaster)<br />To enter multiple IP Addresses, separate with a comma. If you do not know your IP Address, check in the Footer of your Shop.', 20, 8, '2003-03-21 13:43:22', '2003-03-21 21:20:07', NULL, NULL),
(446, 'NOTICE PUBLIC Before going Down for Maintenance: ON/OFF', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', 'Give a WARNING some time before you put your website Down for Maintenance<br />(true=on false=off)<br />If you set the ''Down For Maintenance: ON/OFF'' to true this will automaticly be updated to false', 20, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(447, 'Date and hours for notice before maintenance', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '15/05/2003  2-3 PM', 'Date and hours for notice before maintenance website, enter date and hours for maintenance website', 20, 10, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(448, 'Display when webmaster has enabled maintenance', 'DISPLAY_MAINTENANCE_TIME', 'false', 'Display when Webmaster has enabled maintenance <br />(true=on false=off)<br />', 20, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(449, 'Display website maintenance period', 'DISPLAY_MAINTENANCE_PERIOD', 'false', 'Display Website maintenance period <br />(true=on false=off)<br />', 20, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(450, 'Website maintenance period', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', 'Enter Website Maintenance period (hh:mm)', 20, 13, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(451, 'Confirm Terms and Conditions During Checkout Procedure', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'false', 'Show the Terms and Conditions during the checkout procedure which the customer must agree to.', 11, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(452, 'Confirm Privacy Notice During Account Creation Procedure', 'DISPLAY_PRIVACY_CONDITIONS', 'false', 'Show the Privacy Notice during the account creation procedure which the customer must agree to.', 11, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(453, 'Display Product Image', 'PRODUCT_NEW_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(454, 'Display Product Quantity', 'PRODUCT_NEW_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(455, 'Display Product Buy Now Button', 'PRODUCT_NEW_BUY_NOW', '2701', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(456, 'Display Product Name', 'PRODUCT_NEW_LIST_NAME', '2202', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 4, NULL, '2022-10-05 16:14:20', NULL, NULL),
(457, 'Display Product Model', 'PRODUCT_NEW_LIST_MODEL', '2301', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 5, NULL, '2022-10-05 16:14:20', NULL, NULL),
(458, 'Display Product Manufacturer Name', 'PRODUCT_NEW_LIST_MANUFACTURER', '2401', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 6, NULL, '2022-10-05 16:14:20', NULL, NULL),
(459, 'Display Product Price', 'PRODUCT_NEW_LIST_PRICE', '2601', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 7, NULL, '2022-10-05 16:14:20', NULL, NULL),
(460, 'Display Product Weight', 'PRODUCT_NEW_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 8, NULL, '2022-10-05 16:14:20', NULL, NULL),
(461, 'Display Product Date Added', 'PRODUCT_NEW_LIST_DATE_ADDED', '1902', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 9, NULL, '2022-10-05 16:14:20', NULL, NULL),
(462, 'Display Product Description', 'PRODUCT_NEW_LIST_DESCRIPTION', '450', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 21, 10, NULL, '2022-10-05 16:14:20', NULL, NULL),
(463, 'Display Product Display - Default Sort Order', 'PRODUCT_NEW_LIST_SORT_DEFAULT', '6', 'What Sort Order Default should be used for New Products Display?<br />Default= 6 for Date New to Old<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 21, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(464, 'Default Products New Group ID', 'PRODUCT_NEW_LIST_GROUP_ID', '21', 'Warning: Only change this if your Products New Group ID has changed from the default of 21<br />What is the configuration_group_id for New Products Listings?', 21, 12, NULL, '2022-10-05 16:14:20', NULL, NULL),
(465, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART', '0', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 21, 25, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(466, 'Mask Upcoming Products from being include as New Products', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', 'Do you want to mask Upcoming Products from being included as New Products in Listing, Sideboxes and Centerbox?<br />0= off<br />1= on', 21, 30, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(467, 'Display Product Image', 'PRODUCT_FEATURED_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(468, 'Display Product Quantity', 'PRODUCT_FEATURED_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(469, 'Display Product Buy Now Button', 'PRODUCT_FEATURED_BUY_NOW', '2701', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(470, 'Display Product Name', 'PRODUCT_FEATURED_LIST_NAME', '2202', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 4, NULL, '2022-10-05 16:14:20', NULL, NULL),
(471, 'Display Product Model', 'PRODUCT_FEATURED_LIST_MODEL', '2301', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 5, NULL, '2022-10-05 16:14:20', NULL, NULL),
(472, 'Display Product Manufacturer Name', 'PRODUCT_FEATURED_LIST_MANUFACTURER', '2401', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 6, NULL, '2022-10-05 16:14:20', NULL, NULL),
(473, 'Display Product Price', 'PRODUCT_FEATURED_LIST_PRICE', '2601', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 7, NULL, '2022-10-05 16:14:20', NULL, NULL),
(474, 'Display Product Weight', 'PRODUCT_FEATURED_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 8, NULL, '2022-10-05 16:14:20', NULL, NULL),
(475, 'Display Product Date Added', 'PRODUCT_FEATURED_LIST_DATE_ADDED', '1902', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 9, NULL, '2022-10-05 16:14:20', NULL, NULL),
(476, 'Display Product Description', 'PRODUCT_FEATURED_LIST_DESCRIPTION', '450', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 22, 10, NULL, '2022-10-05 16:14:20', NULL, NULL),
(477, 'Display Product Display - Default Sort Order', 'PRODUCT_FEATURED_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for Featured Product Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 22, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(478, 'Default Featured Products Group ID', 'PRODUCT_FEATURED_LIST_GROUP_ID', '22', 'Warning: Only change this if your Featured Products Group ID has changed from the default of 22<br />What is the configuration_group_id for Featured Products Listings?', 22, 12, NULL, '2022-10-05 16:14:20', NULL, NULL),
(479, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART', '0', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 22, 25, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(480, 'Display Product Image', 'PRODUCT_ALL_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 1, NULL, '2022-10-05 16:14:20', NULL, NULL),
(481, 'Display Product Quantity', 'PRODUCT_ALL_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 2, NULL, '2022-10-05 16:14:20', NULL, NULL),
(482, 'Display Product Buy Now Button', 'PRODUCT_ALL_BUY_NOW', '2701', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 3, NULL, '2022-10-05 16:14:20', NULL, NULL),
(483, 'Display Product Name', 'PRODUCT_ALL_LIST_NAME', '2202', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 4, NULL, '2022-10-05 16:14:20', NULL, NULL),
(484, 'Display Product Model', 'PRODUCT_ALL_LIST_MODEL', '2301', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 5, NULL, '2022-10-05 16:14:20', NULL, NULL),
(485, 'Display Product Manufacturer Name', 'PRODUCT_ALL_LIST_MANUFACTURER', '2401', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 6, NULL, '2022-10-05 16:14:20', NULL, NULL),
(486, 'Display Product Price', 'PRODUCT_ALL_LIST_PRICE', '2601', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 7, NULL, '2022-10-05 16:14:20', NULL, NULL),
(487, 'Display Product Weight', 'PRODUCT_ALL_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 8, NULL, '2022-10-05 16:14:20', NULL, NULL),
(488, 'Display Product Date Added', 'PRODUCT_ALL_LIST_DATE_ADDED', '1902', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 9, NULL, '2022-10-05 16:14:20', NULL, NULL),
(489, 'Display Product Description', 'PRODUCT_ALL_LIST_DESCRIPTION', '450', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 23, 10, NULL, '2022-10-05 16:14:20', NULL, NULL),
(490, 'Display Product Display - Default Sort Order', 'PRODUCT_ALL_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for All Products Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 23, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(491, 'Default Products All Group ID', 'PRODUCT_ALL_LIST_GROUP_ID', '23', 'Warning: Only change this if your Products All Group ID has changed from the default of 23<br />What is the configuration_group_id for Products All Listings?', 23, 12, NULL, '2022-10-05 16:14:20', NULL, NULL),
(492, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART', '0', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 23, 25, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(493, 'Show New Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS', '0', 'Show New Products on Main Page<br />0= off or set the sort order', 24, 65, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(494, 'Show Featured Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS', '1', 'Show Featured Products on Main Page<br />0= off or set the sort order', 24, 66, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(495, 'Show Special Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS', '0', 'Show Special Products on Main Page<br />0= off or set the sort order', 24, 67, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(496, 'Show Upcoming Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_UPCOMING', '0', 'Show Upcoming Products on Main Page<br />0= off or set the sort order', 24, 68, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(497, 'Show New Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS', '0', 'Show New Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 70, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(498, 'Show Featured Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 71, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(499, 'Show Special Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 72, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(500, 'Show Upcoming Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING', '4', 'Show Upcoming Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 73, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(501, 'Show New Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS', '1', 'Show New Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 75, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(502, 'Show Featured Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 76, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(503, 'Show Special Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 77, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(504, 'Show Upcoming Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_UPCOMING', '4', 'Show Upcoming Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 78, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(505, 'Show New Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS', '0', 'Show New Products below Product Listing<br />0= off or set the sort order', 24, 85, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(506, 'Show Featured Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS', '0', 'Show Featured Products below Product Listing<br />0= off or set the sort order', 24, 86, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(507, 'Show Special Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS', '0', 'Show Special Products below Product Listing<br />0= off or set the sort order', 24, 87, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(508, 'Show Upcoming Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING', '0', 'Show Upcoming Products below Product Listing<br />0= off or set the sort order', 24, 88, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(509, 'New Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS', '2', 'New Products Columns per Row', 24, 95, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(510, 'Featured Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS', '2', 'Featured Products Columns per Row', 24, 96, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(511, 'Special Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS', '2', 'Special Products Columns per Row', 24, 97, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(512, 'Filter Product Listing for Current Top Level Category When Enabled', 'SHOW_PRODUCT_INFO_ALL_PRODUCTS', '1', 'Filter the products when Product Listing is enabled for current Main Category or show products from all categories?<br />0= Filter Off 1=Filter On ', 24, 100, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(513, 'Define Main Page Status', 'DEFINE_MAIN_PAGE_STATUS', '1', 'Enable the Defined Main Page Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 60, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(514, 'Define Contact Us Status', 'DEFINE_CONTACT_US_STATUS', '1', 'Enable the Defined Contact Us Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 61, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(515, 'Define Privacy Status', 'DEFINE_PRIVACY_STATUS', '1', 'Enable the Defined Privacy Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 62, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(516, 'Define Shipping & Returns', 'DEFINE_SHIPPINGINFO_STATUS', '1', 'Enable the Defined Shipping & Returns Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 63, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(517, 'Define Conditions of Use', 'DEFINE_CONDITIONS_STATUS', '1', 'Enable the Defined Conditions of Use Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 64, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(518, 'Define Checkout Success', 'DEFINE_CHECKOUT_SUCCESS_STATUS', '1', 'Enable the Defined Checkout Success Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 65, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(519, 'Define Discount Coupon', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', 'Enable the Defined Discount Coupon Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 66, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(520, 'Define Site Map Status', 'DEFINE_SITE_MAP_STATUS', '1', 'Enable the Defined Site Map Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 67, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(521, 'Define Page-Not-Found Status', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', 'Enable the Defined Page-Not-Found Text from define-pages?<br />0= Define Text OFF<br />1= Define Text ON', 25, 67, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(522, 'Define Page 2', 'DEFINE_PAGE_2_STATUS', '1', 'Enable the Defined Page 2 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 82, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(523, 'Define Page 3', 'DEFINE_PAGE_3_STATUS', '1', 'Enable the Defined Page 3 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 83, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(524, 'Define Page 4', 'DEFINE_PAGE_4_STATUS', '1', 'Enable the Defined Page 4 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 84, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(525, 'EZ-Pages Display Status - HeaderBar', 'EZPAGES_STATUS_HEADER', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Header Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(526, 'EZ-Pages Display Status - FooterBar', 'EZPAGES_STATUS_FOOTER', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Footer Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(527, 'EZ-Pages Display Status - Sidebox', 'EZPAGES_STATUS_SIDEBOX', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Sidebox<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 12, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(528, 'EZ-Pages Header Link Separator', 'EZPAGES_SEPARATOR_HEADER', '', 'EZ-Pages Header Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 20, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea_small('),
(529, 'EZ-Pages Footer Link Separator', 'EZPAGES_SEPARATOR_FOOTER', '&nbsp;&nbsp;|&nbsp;&nbsp;', 'EZ-Pages Footer Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 21, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea_small('),
(530, 'EZ-Pages Prev/Next Buttons', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', 'Display Prev/Continue/Next buttons on EZ-Pages pages?<br />0=OFF (no buttons)<br />1="Continue"<br />2="Prev/Continue/Next"<br /><br />Default setting: 2.', 30, 30, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(531, 'EZ-Pages Table of Contents for Chapters Status', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', 'Enable EZ-Pages Table of Contents for Chapters?<br />0= OFF<br />1= ON', 30, 35, '2022-10-05 16:14:20', '2022-10-05 16:14:20', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(532, 'EZ-Pages Pages to disable headers', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "header" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 1,5,2<br />or leave blank.', 30, 40, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea_small('),
(533, 'EZ-Pages Pages to disable footers', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "footer" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,7<br />or leave blank.', 30, 41, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea_small('),
(534, 'EZ-Pages Pages to disable left-column', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "left" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 21<br />or leave blank.', 30, 42, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea_small('),
(535, 'EZ-Pages Pages to disable right-column', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "right" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,82,13<br />or leave blank.', 30, 43, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_textarea_small('),
(536, 'Convert currencies for Text emails', 'CURRENCIES_TRANSLATIONS', '', 'What currency conversions do you need for Text emails?<br />Example = &amp;pound;,&pound;:&amp;euro;,&euro;', 12, 120, NULL, '2003-11-21 00:00:00', NULL, 'zen_cfg_textarea_small('),
(537, 'Use root path for cookie path', 'SESSION_USE_ROOT_COOKIE_PATH', 'False', 'Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>', 15, 999, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(538, 'Add period prefix to cookie domain', 'SESSION_ADD_PERIOD_PREFIX', 'True', 'Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>', 15, 999, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(539, 'Social Media Position', 'SOCIAL_POSITION', 'bottom', 'Bar position for social media icons.', 31, 1, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''bottom'', ''both''), '),
(540, 'Social Media Buttons', 'SOCIAL_MEDIA_STATUS', '1', 'Share button display.', 31, 2, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(541, 'Facebook', 'FACEBOOK_STATUS', '1', 'Enable or disable share button on product page.', 31, 3, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(542, 'Twitter', 'TWITTER_STATUS', '1', 'Enable or disable share button on product page.', 31, 4, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(543, 'Delicious', 'DELICIOUS_STATUS', '1', 'Enable or disable share button on product page.', 31, 5, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(544, 'Digg', 'DIGG_STATUS', '1', 'Enable or disable share button on product page.', 31, 6, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(545, 'Stumble', 'STUMBLE_STATUS', '1', 'Enable or disable share button on product page.', 31, 7, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(546, 'Technorati', 'TECHNORATI_STATUS', '1', 'Enable or disable share button on product page.', 31, 8, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(547, 'Reddit', 'REDDIT_STATUS', '1', 'Enable or disable share button on product page.', 31, 9, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(548, 'Goolge', 'GOOGLE_STATUS', '1', 'Enable or disable share button on product page.', 31, 10, NULL, '2022-10-05 16:23:04', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(549, 'Enable Authorize.net Module', 'MODULE_PAYMENT_AUTHORIZENET_STATUS', 'True', 'Do you want to accept Authorize.net payments?', 6, 0, NULL, '2022-10-13 21:42:11', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(550, 'Login ID', 'MODULE_PAYMENT_AUTHORIZENET_LOGIN', 'testing', 'The API Login ID used for the Authorize.net service', 6, 0, NULL, '2022-10-13 21:42:11', NULL, NULL),
(551, 'Transaction Key', 'MODULE_PAYMENT_AUTHORIZENET_TXNKEY', 'Test', 'Transaction Key used for encrypting sent transaction data', 6, 0, NULL, '2022-10-13 21:42:11', 'zen_cfg_password_display', NULL),
(552, 'MD5 Hash', 'MODULE_PAYMENT_AUTHORIZENET_MD5HASH', '*Set A Hash Value at AuthNet Admin*', 'Encryption key used for validating received transaction data (MAX 20 CHARACTERS)', 6, 0, NULL, '2022-10-13 21:42:11', 'zen_cfg_password_display', NULL),
(553, 'Transaction Mode', 'MODULE_PAYMENT_AUTHORIZENET_TESTMODE', 'Test', 'Transaction mode used for processing orders', 6, 0, NULL, '2022-10-13 21:42:11', NULL, 'zen_cfg_select_option(array(''Test'', ''Production''), '),
(554, 'Transaction Method', 'MODULE_PAYMENT_AUTHORIZENET_METHOD', 'Credit Card', 'Transaction method used for processing orders', 6, 0, NULL, '2022-10-13 21:42:11', NULL, 'zen_cfg_select_option(array(''Credit Card''), '),
(555, 'Authorization Type', 'MODULE_PAYMENT_AUTHORIZENET_AUTHORIZATION_TYPE', 'Authorize', 'Do you want submitted credit card transactions to be authorized only, or captured immediately?', 6, 0, NULL, '2022-10-13 21:42:11', NULL, 'zen_cfg_select_option(array(''Authorize'', ''Capture''), '),
(556, 'Request CVV Number', 'MODULE_PAYMENT_AUTHORIZENET_USE_CVV', 'False', 'Do you want to ask the customer for the card''s CVV number', 6, 0, NULL, '2022-10-13 21:42:11', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(557, 'Customer Notifications', 'MODULE_PAYMENT_AUTHORIZENET_EMAIL_CUSTOMER', 'False', 'Should Authorize.Net email a receipt to the customer?', 6, 0, NULL, '2022-10-13 21:42:11', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(558, 'Sort order of display.', 'MODULE_PAYMENT_AUTHORIZENET_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2022-10-13 21:42:11', NULL, NULL),
(559, 'Payment Zone', 'MODULE_PAYMENT_AUTHORIZENET_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2022-10-13 21:42:11', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(560, 'Set Order Status', 'MODULE_PAYMENT_AUTHORIZENET_ORDER_STATUS_ID', '1', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2022-10-13 21:42:11', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(561, 'Gateway Mode', 'MODULE_PAYMENT_AUTHORIZENET_GATEWAY_MODE', 'offsite', 'Where should customer credit card info be collected?<br /><b>onsite</b> = here (requires SSL)<br /><b>offsite</b> = authorize.net site', 6, 0, NULL, '2022-10-13 21:42:11', NULL, 'zen_cfg_select_option(array(''onsite'', ''offsite''), '),
(562, 'Enable Database Storage', 'MODULE_PAYMENT_AUTHORIZENET_STORE_DATA', 'True', 'Do you want to save the gateway communications data to the database?', 6, 0, NULL, '2022-10-13 21:42:11', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(563, 'Debug Mode', 'MODULE_PAYMENT_AUTHORIZENET_DEBUGGING', 'Alerts Only', 'Would you like to enable debug mode?  A  detailed log of failed transactions may be emailed to the store owner.', 6, 0, NULL, '2022-10-13 21:42:11', NULL, 'zen_cfg_select_option(array(''Off'', ''Alerts Only'', ''Log File'', ''Log and Email''), '),
(564, 'Enable PayPal Module', 'MODULE_PAYMENT_PAYPAL_STATUS', 'True', 'Do you want to accept PayPal payments?', 6, 0, NULL, '2022-10-13 21:42:18', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(565, 'Business ID', 'MODULE_PAYMENT_PAYPAL_BUSINESS_ID', 'admin@site1.com', 'Primary email address for your PayPal account.<br />NOTE: This must match <strong>EXACTLY </strong>the primary email address on your PayPal account settings.  It <strong>IS case-sensitive</strong>, so please check your PayPal profile preferences at paypal.com and be sure to enter the EXACT same primary email address here.', 6, 2, NULL, '2022-10-13 21:42:18', NULL, NULL),
(566, 'Transaction Currency', 'MODULE_PAYMENT_PAYPAL_CURRENCY', 'Selected Currency', 'Which currency should the order be sent to PayPal as? <br />NOTE: if an unsupported currency is sent to PayPal, it will be auto-converted to USD.', 6, 3, NULL, '2022-10-13 21:42:18', NULL, 'zen_cfg_select_option(array(''Selected Currency'', ''Only USD'', ''Only AUD'', ''Only CAD'', ''Only EUR'', ''Only GBP'', ''Only CHF'', ''Only CZK'', ''Only DKK'', ''Only HKD'', ''Only HUF'', ''Only JPY'', ''Only NOK'', ''Only NZD'', ''Only PLN'', ''Only SEK'', ''Only SGD'', ''Only THB'', ''Only MXN'', ''Only ILS'', ''Only PHP'', ''Only TWD'', ''Only BRL'', ''Only MYR'', ''Only TKD''), '),
(567, 'Payment Zone', 'MODULE_PAYMENT_PAYPAL_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 4, NULL, '2022-10-13 21:42:18', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(568, 'Set Pending Notification Status', 'MODULE_PAYMENT_PAYPAL_PROCESSING_STATUS_ID', '1', 'Set the status of orders made with this payment module that are not yet completed to this value<br />(''Pending'' recommended)', 6, 5, NULL, '2022-10-13 21:42:18', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(569, 'Set Order Status', 'MODULE_PAYMENT_PAYPAL_ORDER_STATUS_ID', '2', 'Set the status of orders made with this payment module that have completed payment to this value<br />(''Processing'' recommended)', 6, 6, NULL, '2022-10-13 21:42:18', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(570, 'Set Refund Order Status', 'MODULE_PAYMENT_PAYPAL_REFUND_ORDER_STATUS_ID', '1', 'Set the status of orders that have been refunded made with this payment module to this value<br />(''Pending'' recommended)', 6, 7, NULL, '2022-10-13 21:42:18', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(571, 'Sort order of display.', 'MODULE_PAYMENT_PAYPAL_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 8, NULL, '2022-10-13 21:42:18', NULL, NULL),
(572, 'Address Override', 'MODULE_PAYMENT_PAYPAL_ADDRESS_OVERRIDE', '1', 'If set to 1, the customer shipping address selected in Zen Cart will override the customer PayPal-stored address book. The customer will see their address from Zen Cart, but will NOT be able to edit it at PayPal.<br />(An invalid address will be treated by PayPal as not-supplied, or override=0)<br />0=No Override<br />1=ZC address overrides PayPal address choices', 6, 18, NULL, '2022-10-13 21:42:18', NULL, 'zen_cfg_select_option(array(''0'',''1''), '),
(573, 'Shipping Address Requirements?', 'MODULE_PAYMENT_PAYPAL_ADDRESS_REQUIRED', '2', 'The buyers shipping address. If set to 0 your customer will be prompted to include a shipping address. If set to 1 your customer will not be asked for a shipping address. If set to 2 your customer will be required to provide a shipping address.<br />0=Prompt<br />1=Not Asked<br />2=Required<br /><br /><strong>NOTE: If you allow your customers to enter their own shipping address, then MAKE SURE you PERSONALLY manually verify the PayPal confirmation details to verify the proper address when filling orders. When using Website Payments Standard (IPN), Zen Cart does not know if they choose an alternate shipping address at PayPal vs the one entered when placing an order.</strong>', 6, 20, NULL, '2022-10-13 21:42:18', NULL, 'zen_cfg_select_option(array(''0'',''1'',''2''), '),
(574, 'Detailed Line Items in Cart', 'MODULE_PAYMENT_PAYPAL_DETAILED_CART', 'No', 'Do you want to give line-item details to PayPal?  If set to True, line-item details will be shared with PayPal if no discounts apply and if tax and shipping are simple. Otherwise an Aggregate cart summary will be sent.', 6, 22, NULL, '2022-10-13 21:42:18', NULL, 'zen_cfg_select_option(array(''No'',''Yes''), '),
(575, 'Page Style', 'MODULE_PAYMENT_PAYPAL_PAGE_STYLE', 'Primary', 'Sets the Custom Payment Page Style for payment pages. The value of page_style is the same as the Page Style Name you chose when adding or editing the page style. You can add and edit Custom Payment Page Styles from the Profile subtab of the My Account tab on the PayPal site. If you would like to always reference your Primary style, set this to "primary." If you would like to reference the default PayPal page style, set this to "paypal".', 6, 25, NULL, '2022-10-13 21:42:18', NULL, NULL),
(576, 'Mode for PayPal web services<br /><br />Default:<br /><code>www.paypal.com/cgi-bin/webscr</code><br />or<br /><code>www.paypal.com/us/cgi-bin/webscr</code><br />or for the UK,<br /><code>www.paypal.com/uk/cgi-bin/webscr</code>', 'MODULE_PAYMENT_PAYPAL_HANDLER', 'www.paypal.com/cgi-bin/webscr', 'Choose the URL for PayPal live processing', 6, 73, NULL, '2022-10-13 21:42:18', NULL, ''),
(577, 'PDT Token (Payment Data Transfer)', 'MODULE_PAYMENT_PAYPAL_PDTTOKEN', '', 'Enter your PDT Token value here in order to activate transactions immediately after processing (if they pass validation).', 6, 25, NULL, '2022-10-13 21:42:18', 'zen_cfg_password_display', NULL),
(578, 'Debug Mode', 'MODULE_PAYMENT_PAYPAL_IPN_DEBUG', 'Off', 'Enable debug logging? <br />NOTE: This can REALLY clutter your email inbox!<br />Logging goes to the /includes/modules/payment/paypal/logs folder<br />Email goes to the store-owner address.<br />Email option NOT recommended.<br /><strong>Leave OFF for normal operation.</strong>', 6, 71, NULL, '2022-10-13 21:42:18', NULL, 'zen_cfg_select_option(array(''Off'',''Log File'',''Log and Email''), '),
(579, 'Debug Email Address', 'MODULE_PAYMENT_PAYPAL_DEBUG_EMAIL_ADDRESS', 'admin@site1.com', 'The email address to use for PayPal debugging', 6, 72, NULL, '2022-10-13 21:42:18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `configuration_group`
--

CREATE TABLE IF NOT EXISTS `configuration_group` (
  `configuration_group_id` int(11) NOT NULL,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configuration_group`
--

INSERT INTO `configuration_group` (`configuration_group_id`, `configuration_group_title`, `configuration_group_description`, `sort_order`, `visible`) VALUES
(1, 'My Store', 'General information about my store', 1, 1),
(2, 'Minimum Values', 'The minimum values for functions / data', 2, 1),
(3, 'Maximum Values', 'The maximum values for functions / data', 3, 1),
(4, 'Images', 'Image parameters', 4, 1),
(5, 'Customer Details', 'Customer account configuration', 5, 1),
(6, 'Module Options', 'Hidden from configuration', 6, 0),
(7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1),
(8, 'Product Listing', 'Product Listing configuration options', 8, 1),
(9, 'Stock', 'Stock configuration options', 9, 1),
(10, 'Logging', 'Logging configuration options', 10, 1),
(11, 'Regulations', 'Regulation options', 16, 1),
(12, 'E-Mail Options', 'General settings for E-Mail transport and HTML E-Mails', 12, 1),
(13, 'Attribute Settings', 'Configure products attributes settings', 13, 1),
(14, 'GZip Compression', 'GZip compression options', 14, 1),
(15, 'Sessions', 'Session options', 15, 1),
(16, 'GV Coupons', 'Gift Vouchers and Coupons', 16, 1),
(17, 'Credit Cards', 'Credit Cards Accepted', 17, 1),
(18, 'Product Info', 'Product Info Display Options', 18, 1),
(19, 'Layout Settings', 'Layout Options', 19, 1),
(20, 'Website Maintenance', 'Website Maintenance Options', 20, 1),
(21, 'New Listing', 'New Products Listing', 21, 1),
(22, 'Featured Listing', 'Featured Products Listing', 22, 1),
(23, 'All Listing', 'All Products Listing', 23, 1),
(24, 'Index Listing', 'Index Products Listing', 24, 1),
(25, 'Define Page Status', 'Define Main Pages and HTMLArea Options', 25, 1),
(30, 'EZ-Pages Settings', 'EZ-Pages Settings', 30, 1),
(31, 'Social Media Icons', 'Configure Social Media Icons for Product Pages', 31, 1);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE IF NOT EXISTS `counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`startdate`, `counter`) VALUES
('20221005', 56);

-- --------------------------------------------------------

--
-- Table structure for table `counter_history`
--

CREATE TABLE IF NOT EXISTS `counter_history` (
  `startdate` char(8) NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter_history`
--

INSERT INTO `counter_history` (`startdate`, `counter`, `session_counter`) VALUES
('20221005', 23, 1),
('20221006', 6, 1),
('20221007', 1, 1),
('20221009', 3, 1),
('20221014', 23, 2);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `countries_id` int(11) NOT NULL,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`, `address_format_id`) VALUES
(240, 'Aaland Islands', 'AX', 'ALA', 1),
(1, 'Afghanistan', 'AF', 'AFG', 1),
(2, 'Albania', 'AL', 'ALB', 1),
(3, 'Algeria', 'DZ', 'DZA', 1),
(4, 'American Samoa', 'AS', 'ASM', 1),
(5, 'Andorra', 'AD', 'AND', 1),
(6, 'Angola', 'AO', 'AGO', 1),
(7, 'Anguilla', 'AI', 'AIA', 1),
(8, 'Antarctica', 'AQ', 'ATA', 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 1),
(10, 'Argentina', 'AR', 'ARG', 1),
(11, 'Armenia', 'AM', 'ARM', 1),
(12, 'Aruba', 'AW', 'ABW', 1),
(13, 'Australia', 'AU', 'AUS', 1),
(14, 'Austria', 'AT', 'AUT', 5),
(15, 'Azerbaijan', 'AZ', 'AZE', 1),
(16, 'Bahamas', 'BS', 'BHS', 1),
(17, 'Bahrain', 'BH', 'BHR', 1),
(18, 'Bangladesh', 'BD', 'BGD', 1),
(19, 'Barbados', 'BB', 'BRB', 1),
(20, 'Belarus', 'BY', 'BLR', 1),
(21, 'Belgium', 'BE', 'BEL', 1),
(22, 'Belize', 'BZ', 'BLZ', 1),
(23, 'Benin', 'BJ', 'BEN', 1),
(24, 'Bermuda', 'BM', 'BMU', 1),
(25, 'Bhutan', 'BT', 'BTN', 1),
(26, 'Bolivia', 'BO', 'BOL', 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1),
(28, 'Botswana', 'BW', 'BWA', 1),
(29, 'Bouvet Island', 'BV', 'BVT', 1),
(30, 'Brazil', 'BR', 'BRA', 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', 1),
(33, 'Bulgaria', 'BG', 'BGR', 1),
(34, 'Burkina Faso', 'BF', 'BFA', 1),
(35, 'Burundi', 'BI', 'BDI', 1),
(36, 'Cambodia', 'KH', 'KHM', 1),
(37, 'Cameroon', 'CM', 'CMR', 1),
(38, 'Canada', 'CA', 'CAN', 2),
(39, 'Cape Verde', 'CV', 'CPV', 1),
(40, 'Cayman Islands', 'KY', 'CYM', 1),
(41, 'Central African Republic', 'CF', 'CAF', 1),
(42, 'Chad', 'TD', 'TCD', 1),
(43, 'Chile', 'CL', 'CHL', 1),
(44, 'China', 'CN', 'CHN', 1),
(45, 'Christmas Island', 'CX', 'CXR', 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1),
(47, 'Colombia', 'CO', 'COL', 1),
(48, 'Comoros', 'KM', 'COM', 1),
(49, 'Congo', 'CG', 'COG', 1),
(50, 'Cook Islands', 'CK', 'COK', 1),
(51, 'Costa Rica', 'CR', 'CRI', 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', 1),
(53, 'Croatia', 'HR', 'HRV', 1),
(54, 'Cuba', 'CU', 'CUB', 1),
(55, 'Cyprus', 'CY', 'CYP', 1),
(56, 'Czech Republic', 'CZ', 'CZE', 1),
(57, 'Denmark', 'DK', 'DNK', 1),
(58, 'Djibouti', 'DJ', 'DJI', 1),
(59, 'Dominica', 'DM', 'DMA', 1),
(60, 'Dominican Republic', 'DO', 'DOM', 1),
(61, 'Timor-Leste', 'TL', 'TLS', 1),
(62, 'Ecuador', 'EC', 'ECU', 1),
(63, 'Egypt', 'EG', 'EGY', 1),
(64, 'El Salvador', 'SV', 'SLV', 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 1),
(66, 'Eritrea', 'ER', 'ERI', 1),
(67, 'Estonia', 'EE', 'EST', 1),
(68, 'Ethiopia', 'ET', 'ETH', 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1),
(70, 'Faroe Islands', 'FO', 'FRO', 1),
(71, 'Fiji', 'FJ', 'FJI', 1),
(72, 'Finland', 'FI', 'FIN', 1),
(73, 'France', 'FR', 'FRA', 1),
(75, 'French Guiana', 'GF', 'GUF', 1),
(76, 'French Polynesia', 'PF', 'PYF', 1),
(77, 'French Southern Territories', 'TF', 'ATF', 1),
(78, 'Gabon', 'GA', 'GAB', 1),
(79, 'Gambia', 'GM', 'GMB', 1),
(80, 'Georgia', 'GE', 'GEO', 1),
(81, 'Germany', 'DE', 'DEU', 5),
(82, 'Ghana', 'GH', 'GHA', 1),
(83, 'Gibraltar', 'GI', 'GIB', 1),
(84, 'Greece', 'GR', 'GRC', 1),
(85, 'Greenland', 'GL', 'GRL', 1),
(86, 'Grenada', 'GD', 'GRD', 1),
(87, 'Guadeloupe', 'GP', 'GLP', 1),
(88, 'Guam', 'GU', 'GUM', 1),
(89, 'Guatemala', 'GT', 'GTM', 1),
(90, 'Guinea', 'GN', 'GIN', 1),
(91, 'Guinea-bissau', 'GW', 'GNB', 1),
(92, 'Guyana', 'GY', 'GUY', 1),
(93, 'Haiti', 'HT', 'HTI', 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1),
(95, 'Honduras', 'HN', 'HND', 1),
(96, 'Hong Kong', 'HK', 'HKG', 1),
(97, 'Hungary', 'HU', 'HUN', 1),
(98, 'Iceland', 'IS', 'ISL', 1),
(99, 'India', 'IN', 'IND', 1),
(100, 'Indonesia', 'ID', 'IDN', 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1),
(102, 'Iraq', 'IQ', 'IRQ', 1),
(103, 'Ireland', 'IE', 'IRL', 1),
(104, 'Israel', 'IL', 'ISR', 1),
(105, 'Italy', 'IT', 'ITA', 1),
(106, 'Jamaica', 'JM', 'JAM', 1),
(107, 'Japan', 'JP', 'JPN', 1),
(108, 'Jordan', 'JO', 'JOR', 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1),
(110, 'Kenya', 'KE', 'KEN', 1),
(111, 'Kiribati', 'KI', 'KIR', 1),
(112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1),
(113, 'Korea, Republic of', 'KR', 'KOR', 1),
(114, 'Kuwait', 'KW', 'KWT', 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1),
(117, 'Latvia', 'LV', 'LVA', 1),
(118, 'Lebanon', 'LB', 'LBN', 1),
(119, 'Lesotho', 'LS', 'LSO', 1),
(120, 'Liberia', 'LR', 'LBR', 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1),
(122, 'Liechtenstein', 'LI', 'LIE', 1),
(123, 'Lithuania', 'LT', 'LTU', 1),
(124, 'Luxembourg', 'LU', 'LUX', 1),
(125, 'Macao', 'MO', 'MAC', 1),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1),
(127, 'Madagascar', 'MG', 'MDG', 1),
(128, 'Malawi', 'MW', 'MWI', 1),
(129, 'Malaysia', 'MY', 'MYS', 1),
(130, 'Maldives', 'MV', 'MDV', 1),
(131, 'Mali', 'ML', 'MLI', 1),
(132, 'Malta', 'MT', 'MLT', 1),
(133, 'Marshall Islands', 'MH', 'MHL', 1),
(134, 'Martinique', 'MQ', 'MTQ', 1),
(135, 'Mauritania', 'MR', 'MRT', 1),
(136, 'Mauritius', 'MU', 'MUS', 1),
(137, 'Mayotte', 'YT', 'MYT', 1),
(138, 'Mexico', 'MX', 'MEX', 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', 1),
(140, 'Moldova', 'MD', 'MDA', 1),
(141, 'Monaco', 'MC', 'MCO', 1),
(142, 'Mongolia', 'MN', 'MNG', 1),
(143, 'Montserrat', 'MS', 'MSR', 1),
(144, 'Morocco', 'MA', 'MAR', 1),
(145, 'Mozambique', 'MZ', 'MOZ', 1),
(146, 'Myanmar', 'MM', 'MMR', 1),
(147, 'Namibia', 'NA', 'NAM', 1),
(148, 'Nauru', 'NR', 'NRU', 1),
(149, 'Nepal', 'NP', 'NPL', 1),
(150, 'Netherlands', 'NL', 'NLD', 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', 1),
(152, 'New Caledonia', 'NC', 'NCL', 1),
(153, 'New Zealand', 'NZ', 'NZL', 1),
(154, 'Nicaragua', 'NI', 'NIC', 1),
(155, 'Niger', 'NE', 'NER', 1),
(156, 'Nigeria', 'NG', 'NGA', 1),
(157, 'Niue', 'NU', 'NIU', 1),
(158, 'Norfolk Island', 'NF', 'NFK', 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', 1),
(160, 'Norway', 'NO', 'NOR', 1),
(161, 'Oman', 'OM', 'OMN', 1),
(162, 'Pakistan', 'PK', 'PAK', 1),
(163, 'Palau', 'PW', 'PLW', 1),
(164, 'Panama', 'PA', 'PAN', 1),
(165, 'Papua New Guinea', 'PG', 'PNG', 1),
(166, 'Paraguay', 'PY', 'PRY', 1),
(167, 'Peru', 'PE', 'PER', 1),
(168, 'Philippines', 'PH', 'PHL', 1),
(169, 'Pitcairn', 'PN', 'PCN', 1),
(170, 'Poland', 'PL', 'POL', 1),
(171, 'Portugal', 'PT', 'PRT', 1),
(172, 'Puerto Rico', 'PR', 'PRI', 1),
(173, 'Qatar', 'QA', 'QAT', 1),
(174, 'Reunion', 'RE', 'REU', 1),
(175, 'Romania', 'RO', 'ROU', 1),
(176, 'Russian Federation', 'RU', 'RUS', 1),
(177, 'Rwanda', 'RW', 'RWA', 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1),
(179, 'Saint Lucia', 'LC', 'LCA', 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1),
(181, 'Samoa', 'WS', 'WSM', 1),
(182, 'San Marino', 'SM', 'SMR', 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', 1),
(184, 'Saudi Arabia', 'SA', 'SAU', 1),
(185, 'Senegal', 'SN', 'SEN', 1),
(186, 'Seychelles', 'SC', 'SYC', 1),
(187, 'Sierra Leone', 'SL', 'SLE', 1),
(188, 'Singapore', 'SG', 'SGP', 4),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1),
(190, 'Slovenia', 'SI', 'SVN', 1),
(191, 'Solomon Islands', 'SB', 'SLB', 1),
(192, 'Somalia', 'SO', 'SOM', 1),
(193, 'South Africa', 'ZA', 'ZAF', 1),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1),
(195, 'Spain', 'ES', 'ESP', 3),
(196, 'Sri Lanka', 'LK', 'LKA', 1),
(197, 'St. Helena', 'SH', 'SHN', 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1),
(199, 'Sudan', 'SD', 'SDN', 1),
(200, 'Suriname', 'SR', 'SUR', 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1),
(202, 'Swaziland', 'SZ', 'SWZ', 1),
(203, 'Sweden', 'SE', 'SWE', 1),
(204, 'Switzerland', 'CH', 'CHE', 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', 1),
(206, 'Taiwan', 'TW', 'TWN', 1),
(207, 'Tajikistan', 'TJ', 'TJK', 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1),
(209, 'Thailand', 'TH', 'THA', 1),
(210, 'Togo', 'TG', 'TGO', 1),
(211, 'Tokelau', 'TK', 'TKL', 1),
(212, 'Tonga', 'TO', 'TON', 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', 1),
(214, 'Tunisia', 'TN', 'TUN', 1),
(215, 'Turkey', 'TR', 'TUR', 1),
(216, 'Turkmenistan', 'TM', 'TKM', 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', 1),
(218, 'Tuvalu', 'TV', 'TUV', 1),
(219, 'Uganda', 'UG', 'UGA', 1),
(220, 'Ukraine', 'UA', 'UKR', 1),
(221, 'United Arab Emirates', 'AE', 'ARE', 1),
(222, 'United Kingdom', 'GB', 'GBR', 6),
(223, 'United States', 'US', 'USA', 2),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1),
(225, 'Uruguay', 'UY', 'URY', 1),
(226, 'Uzbekistan', 'UZ', 'UZB', 1),
(227, 'Vanuatu', 'VU', 'VUT', 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1),
(229, 'Venezuela', 'VE', 'VEN', 1),
(230, 'Viet Nam', 'VN', 'VNM', 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1),
(234, 'Western Sahara', 'EH', 'ESH', 1),
(235, 'Yemen', 'YE', 'YEM', 1),
(236, 'Serbia', 'RS', 'SRB', 1),
(238, 'Zambia', 'ZM', 'ZMB', 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1),
(241, 'Palestinian Territory', 'PS', 'PSE', 1),
(242, 'Montenegro', 'ME', 'MNE', 1),
(243, 'Guernsey', 'GG', 'GGY', 1),
(244, 'Isle of Man', 'IM', 'IMN', 1),
(245, 'Jersey', 'JE', 'JEY', 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE IF NOT EXISTS `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupons_description`
--

CREATE TABLE IF NOT EXISTS `coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(32) NOT NULL DEFAULT '',
  `coupon_description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_email_track`
--

CREATE TABLE IF NOT EXISTS `coupon_email_track` (
  `unique_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_gv_customer`
--

CREATE TABLE IF NOT EXISTS `coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_gv_queue`
--

CREATE TABLE IF NOT EXISTS `coupon_gv_queue` (
  `unique_id` int(5) NOT NULL,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(32) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_redeem_track`
--

CREATE TABLE IF NOT EXISTS `coupon_redeem_track` (
  `unique_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(32) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_restrict`
--

CREATE TABLE IF NOT EXISTS `coupon_restrict` (
  `restrict_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `currencies_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(24) DEFAULT NULL,
  `symbol_right` varchar(24) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES
(1, 'US Dollar', 'USD', '$', '', '.', ',', '2', 1.00000000, '2022-10-05 16:14:20'),
(2, 'Euro', 'EUR', '&euro;', '', '.', ',', '2', 0.77300000, '2022-10-05 16:14:20'),
(3, 'GB Pound', 'GBP', '&pound;', '', '.', ',', '2', 0.67259997, '2022-10-05 16:14:20'),
(4, 'Canadian Dollar', 'CAD', '$', '', '.', ',', '2', 1.10420001, '2022-10-05 16:14:20'),
(5, 'Australian Dollar', 'AUD', '$', '', '.', ',', '2', 1.17890000, '2022-10-05 16:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customers_id` int(11) NOT NULL,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(40) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket`
--

CREATE TABLE IF NOT EXISTS `customers_basket` (
  `customers_basket_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `customers_basket_date_added` varchar(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket_attributes`
--

CREATE TABLE IF NOT EXISTS `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers_info`
--

CREATE TABLE IF NOT EXISTS `customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `db_cache`
--

CREATE TABLE IF NOT EXISTS `db_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_archive`
--

CREATE TABLE IF NOT EXISTS `email_archive` (
  `archive_id` int(11) NOT NULL,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ezpages`
--

CREATE TABLE IF NOT EXISTS `ezpages` (
  `pages_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `alt_url` varchar(255) NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) NOT NULL DEFAULT '',
  `pages_html_text` mediumtext,
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ezpages`
--

INSERT INTO `ezpages` (`pages_id`, `languages_id`, `pages_title`, `alt_url`, `alt_url_external`, `pages_html_text`, `status_header`, `status_sidebox`, `status_footer`, `status_toc`, `header_sort_order`, `sidebox_sort_order`, `footer_sort_order`, `toc_sort_order`, `page_open_new_window`, `page_is_ssl`, `toc_chapter`) VALUES
(1, 1, 'EZPages', '', '', 'This is the main page listed under the Link EZPages in the Header<br /><br />\r\n\r\n<strong>See: What is EZPages? Link for detailed use of EZPages</strong><br /><br />\r\n\r\nThis Link could show in the Header, Footer or Sidebox or a combination of all three locations.<br /><br />\r\n\r\nThe Chapter and TOC settings are for using this Page in combination with other Pages.<br /><br />\r\n\r\nThe other Pages can be shown either *only* with this Link in the Chapter and TOC or as their own Link in the Header, Footer or Sidebox, depending on how you would like them to appear on your site.<br /><br />\r\n\r\nThere is no true "Master" Link, other than the Links you actually have configured to display. But any Link in a Chapter can be displayed in any of the 3 locations for the Header, Footer or Sidebox or not at all, where it only appears together with the other Links in the Chapter.', 0, 0, 0, 1, 10, 0, 0, 10, 0, 0, 10),
(2, 1, 'A New Page', '', '', 'This is another page that is linked to the Chapter 10 via the Chapter number used and is sorted based on the TOC Order.<br /><br />\r\n\r\nThere is not a link to this page via the Header, Footer nor the Sidebox.<br /><br />\r\n\r\nThis page is only seen if the "main" link is selected and then it will show in the TOC listing.<br /><br />\r\n\r\nThis is a handy way to have numerous links that are related but only show one main link to get to them all.<br /><br />', 0, 0, 0, 1, 0, 0, 0, 30, 0, 0, 10),
(3, 1, 'Another New Page', '', '', 'This is yet another new page or link that is part of Chapter 10<br /><br />\r\n\r\nThe numbering of the Chapters can be done in any manner. But, by number in increments such as 10, 20, 30, etc. you can later insert pages, or links, as needed within the existing pages.<br /><br />\r\n\r\nThere is no limit to the number of pages, or links, that can be grouped together using the Chapter.<br /><br />\r\n\r\nThe display of the Previous/Next and TOC listing is a setting that can be turned on or off.', 0, 0, 0, 1, 0, 0, 0, 40, 0, 0, 10),
(4, 1, 'My Link', '', '', 'This is a single page link that will be shown in the Sidebox.<br /><br />\r\n\r\nThere are no additional pages or links associated with this page as there is no Chapter.<br /><br />\r\n\r\nLater, if you want to expand on this link you can add a Chapter and TOC settings and build a group.<br /><br />\r\n\r\nNotice that the Previous/Next and TOC automatically disable when there isn''t a Chapter. Even with a Chapter, there must be more than one (1) related link or page in the group before these will display.', 0, 1, 0, 0, 0, 10, 0, 0, 0, 0, 0),
(5, 1, 'Anything', '', '', 'The title or link names can be anything that you would like to use.<br /><br />\r\n\r\nYou decide on the content and the link name relative to that content.<br /><br />\r\n\r\nThen, define where you want the link to show: Header, Footer or Sidebox or as a combination of these three locations.<br /><br />\r\n\r\nThe content of the page can be anything you like. Be sure that your content is valid in regard to table and stylesheet rules.<br /><br />\r\n\r\nYou can even set up the links to go to Secure or Non-Secure pages as well as open in the same or a new window.<br /><br />\r\n\r\nLinks can also be setup to use internal or external links vs the HTML Content. See: examples below in the Link URL settings.', 0, 1, 0, 0, 0, 20, 0, 0, 0, 0, 0),
(6, 1, 'Shared', '', '', 'This link is a "shared" link between the Header, Footer and Sidebox.<br /><br />\r\n\r\nThe number on the order was set to 50 on all of the settings just for the sake of an easier notation on entering it.<br /><br />\r\n\r\nThe order can be the same or different for the three locations.<br /><br />\r\n\r\nIf you wanted to really get creative, you could also have this as part of a Chapter not related to the link order.<br /><br />', 0, 1, 0, 0, 50, 50, 50, 0, 0, 0, 0),
(7, 1, 'My Account', 'index.php?main_page=account', '', '', 0, 0, 0, 0, 0, 0, 10, 0, 0, 1, 0),
(8, 1, 'Site Map', 'index.php?main_page=site_map', '', '', 0, 1, 0, 0, 0, 40, 20, 0, 0, 0, 0),
(9, 1, 'Privacy Notice', 'index.php?main_page=privacy', '', '', 0, 0, 0, 0, 30, 0, 40, 0, 0, 0, 0),
(10, 1, 'Zen Cart', '', 'http://www.zen-cart.com', '', 0, 0, 0, 0, 60, 0, 0, 0, 1, 0, 0),
(11, 1, 'Gift Certificates', 'index.php?main_page=index&cPath=21', '', '', 0, 1, 0, 0, 0, 60, 0, 0, 0, 0, 0),
(12, 1, 'Action DVDs', 'index.php?main_page=index&cPath=3_10', '', '', 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0),
(13, 1, 'Google', '', 'http://www.google.com', '', 0, 1, 0, 0, 0, 70, 0, 0, 1, 0, 0),
(14, 1, 'What is EZ-Pages?', '', '', '<table cellspacing="4" cellpadding="4" border="3" align="center" style="width: 80%;"><tbody><tr><td><span style="font-style: italic;">\r\n<span style="font-weight: bold;">Note: This EZ-Page has been written with the help of the HTMLarea Editor.<br /> <br />This means that this EZ-page will not validate correctly based on how HTMLarea or other editors renders the code.</span></span></td></tr></tbody></table><br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Summary</span><br /><br /><span style="font-weight: bold;">EZ-Pages</span> is a fast, easy way of creating links and additional pages.<br /><br />The additional Pages can be for:<br /><ul><li>New Pages</li><li>Internal Links</li><li>External Links</li><li>Secure or Non-Secure pages</li><li>Same or New Window</li></ul>In Addition, there is the ability to create &quot;related&quot; links in the format of a Chapter (group) and its TOC (related pages/links).<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Link Naming</span><br /><br />Links are named by the Page Title. All Links need a Page Title in order to function.<br /><br />If you forget to add a Page Title, then you will not be able to add the Link.<br /><br />If you do not assign an Order for the Header, Sidebox or Footer, then the Link will not display even if you have a Page Title.<br /><br /><span style="font-weight: bold;"><span style="color: rgb(255, 0, 0);">Link Placement</span><br /><br /></span>While you have the option of adding Additional Links to the Header, Footer and Sidebox with EZ-Pages, you are not limited to these three Link locations. Links can be in one or more locations simply by enabling the Order for the Location(s) where the Link should appear..<br /><br />The Link Location Status for the Header, Footer and Sidebox is controlled simply by setting these to Yes or No for each setting. Then, set the Order in which the Link should appear for each location.<br /><br />This means that if you were to set Header to Yes 30 and Sidebox to Yes 50 then the link would appear in both the Header and Sidebox in the Order of your Links.<br /><br />The Order numbering method is up to you. Numbering using 10, 20, 30, etc. will allow you to sort the Links and add additional Links later.<br /><br />Note: a 0 value for the Order will disable the Link from displaying.<br /><br /><span style="font-weight: bold;"><span style="color: rgb(255, 0, 0);">Open in New Window and Secure Pages</span><br /></span><br />With EZ-Pages, each Link can take you to the same, main window for your shop; or, you can have the Link open a brand new New Window. In addition, there is an option for making the Link open as a Secure Page or a Non-Secure Page.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Chapter and TOC</span><br style="font-weight: bold; color: rgb(255, 0, 0);" /><br />The Chapter and TOC, or Table of Contents, are a unique method of building Multiple Links that interact together.<br /><br />While these Links still follow the rules of the Header, Footer and Sidebox placement, the difference is that only one of the Links, the Main Link, needs to be displayed anywhere on the site.<br /><br />If you had, for example, 5 related Links, you could add the first Link as the Main Link by setting its location to the Header, Footer or Sidebox and set its Order, as usual.<br /><br />Next, you need to assign a Chapter or Group number to the Link. This Chapter holds the related Links together.<br /><br />Then, set the TOC or Table of Contents setting. This is a secondary Sort Order for within the Chapter.<br /><br />Again, you can display any of the Links within a Chapter, as well as making any of these Links the Main Link. Whether the Links all show, or just one or more of the Links show, the Chapter is the key to grouping these Links together in the TOC or Previous/Next. <br /><br /><span style="font-weight: bold; font-style: italic;">NOTE: While all Links within a Chapter will display together, you can have the different Links display in the Header, Footer or Sidebox on their own. Or, you can have the additional Links only display when the Main Link or one of the Additional Links within the Chapter has been opened.</span><br style="font-weight: bold; font-style: italic;" /><br />The versitility of EZ-Pages will make adding new Links and Pages extreamly easy for the beginner as well as the advance user.<br /><br />While this page was made in HTMLarea editor, any HTML editor could be used.<br /><br />However, be careful ... HTML editors will often add the opening and closing tags for the &lt;html&gt;, &lt;head&gt; and &lt;body&gt; to the file you are working on.<br /><br />These are already added to the pages via EZ-Pages.<br /><br /><span style="color: rgb(255, 0, 0); font-weight: bold;">External Link URL</span><br /><br />External Link URLs are links to outside pages not within your shop. These can be to any valid URL such as:<br /><br />http://www.sashbox.net<br /><br />You need to include the full URL path to any External Link URL. You may also mark these to open in a New Window or the Same Window.<br /><br /><span style="color: rgb(255, 0, 0); font-weight: bold;">Internal Link URL</span><br /><br />Internal Link URLs are links to internal pages within your shop. These can be to any valid URL, but should be written as relative links such as:<br /><br />index.php?main_page=index&amp;cPath=21<br /><br />The above Link would take you to the Category for categories_id 21<br /><br />While these links can be the Full URL to an Internal Link, it is best to write as a Relative Link so that if you change domains, are work on a temporary domain or an IP Address, the Link will remain valid if moved to another domain, IP Address, etc.<br /><br />Internal Links can also open in a New Window or the Same Window or be for Secure or Non-Secure Pages.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">EZ-Pages Additional Pages vs Internal Links vs External Links</span><br /><br />The Type of Link that you create is based on an order of precidence, where HTML Content will superceed both the Internal Link and the External Link values.<br /><br />The External Link URL will superceed the Internal Link URL.<br /><br />If you try to set a combination of HTML Content, Internal Link and/or External Link, the Link will be flagged in the listing with a read icon to alert you to your mistake.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">WARNING ...</span><br /><br />When using Editors such as HTMLarea, if you hit enter in the HTML Content area <br /> will be added. These will be detected as &quot;content&quot; and will override any Internal Link URL or External Link URL.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Admin Only Display</span><br /><br />Sometimes, when working on EZ-Pages, you will want to be able to work on a Live Site and see the results of your work, but not allow the Customers to see this until you are done.<br /><br />There are 3 settings in the Configuration ... EZ-Pages Settings for the Header, Footer and Sidebox  Status:<br /><ul><li>OFF</li><li>ON</li><li>Admin Only</li></ul>The Admin Only setting is controlled by the IP Address(es) set in the Website Maintenance.<br /><br />This can be very handy when needing to work on a Live Site but not wanting customers to see the work in progress.<br /><br />', 0, 0, 0, 1, 0, 0, 0, 20, 0, 0, 10),
(15, 1, 'Home', 'index.php?main_page=index', '', '', 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
(16, 1, 'New Products', 'index.php?main_page=products_new', '', '', 1, 0, 1, 0, 2, 2, 2, 2, 0, 0, 0),
(17, 1, 'Specials', 'index.php?main_page=specials', '', '', 1, 0, 1, 0, 3, 3, 3, 3, 0, 0, 0),
(18, 1, 'All Products', 'index.php?main_page=products_all', '', '', 1, 0, 1, 0, 4, 4, 4, 4, 0, 0, 0),
(19, 1, 'Reviews', 'index.php?main_page=reviews', '', '', 1, 0, 1, 0, 5, 5, 5, 5, 0, 0, 0),
(20, 1, 'Contacts', 'index.php?main_page=contact_us', '', '', 1, 0, 1, 0, 6, 6, 6, 6, 0, 0, 0),
(21, 1, 'FAQs', 'index.php?main_page=gv_faq', '', '', 1, 0, 1, 0, 7, 7, 7, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `featured`
--

CREATE TABLE IF NOT EXISTS `featured` (
  `featured_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `featured`
--

INSERT INTO `featured` (`featured_id`, `products_id`, `featured_date_added`, `featured_last_modified`, `expires_date`, `date_status_change`, `status`, `featured_date_available`) VALUES
(1, 1, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(2, 2, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(3, 3, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(4, 4, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `files_uploaded`
--

CREATE TABLE IF NOT EXISTS `files_uploaded` (
  `files_uploaded_id` int(11) NOT NULL,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Must always have either a sesskey or customers_id';

-- --------------------------------------------------------

--
-- Table structure for table `geo_zones`
--

CREATE TABLE IF NOT EXISTS `geo_zones` (
  `geo_zone_id` int(11) NOT NULL,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geo_zones`
--

INSERT INTO `geo_zones` (`geo_zone_id`, `geo_zone_name`, `geo_zone_description`, `last_modified`, `date_added`) VALUES
(1, 'Florida', 'Florida local sales tax zone', NULL, '2022-10-05 16:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `get_terms_to_filter`
--

CREATE TABLE IF NOT EXISTS `get_terms_to_filter` (
  `get_term_name` varchar(255) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `get_terms_to_filter`
--

INSERT INTO `get_terms_to_filter` (`get_term_name`, `get_term_table`, `get_term_name_field`) VALUES
('manufacturers_id', 'TABLE_MANUFACTURERS', 'manufacturers_name'),
('music_genre_id', 'TABLE_MUSIC_GENRE', 'music_genre_name'),
('record_company_id', 'TABLE_RECORD_COMPANY', 'record_company_name');

-- --------------------------------------------------------

--
-- Table structure for table `group_pricing`
--

CREATE TABLE IF NOT EXISTS `group_pricing` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `languages_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`languages_id`, `name`, `code`, `image`, `directory`, `sort_order`) VALUES
(1, 'English', 'en', 'icon.gif', 'english', 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout_boxes`
--

CREATE TABLE IF NOT EXISTS `layout_boxes` (
  `layout_id` int(11) NOT NULL,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `layout_boxes`
--

INSERT INTO `layout_boxes` (`layout_id`, `layout_template`, `layout_box_name`, `layout_box_status`, `layout_box_location`, `layout_box_sort_order`, `layout_box_sort_order_single`, `layout_box_status_single`) VALUES
(1, 'default_template_settings', 'banner_box_all.php', 1, 1, 5, 0, 0),
(2, 'default_template_settings', 'banner_box.php', 1, 0, 300, 1, 127),
(3, 'default_template_settings', 'banner_box2.php', 1, 1, 15, 1, 15),
(4, 'default_template_settings', 'best_sellers.php', 1, 1, 30, 70, 1),
(5, 'default_template_settings', 'categories.php', 1, 0, 10, 10, 1),
(6, 'default_template_settings', 'currencies.php', 0, 1, 80, 60, 0),
(7, 'default_template_settings', 'document_categories.php', 1, 0, 0, 0, 0),
(8, 'default_template_settings', 'ezpages.php', 1, 1, -1, 2, 1),
(9, 'default_template_settings', 'featured.php', 1, 0, 45, 0, 0),
(10, 'default_template_settings', 'information.php', 1, 0, 50, 40, 1),
(11, 'default_template_settings', 'languages.php', 0, 1, 70, 50, 0),
(12, 'default_template_settings', 'manufacturers.php', 1, 0, 30, 20, 1),
(13, 'default_template_settings', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(14, 'default_template_settings', 'more_information.php', 1, 0, 200, 200, 1),
(15, 'default_template_settings', 'music_genres.php', 1, 1, 0, 0, 0),
(16, 'default_template_settings', 'order_history.php', 1, 1, 0, 0, 0),
(17, 'default_template_settings', 'product_notifications.php', 1, 1, 55, 85, 1),
(18, 'default_template_settings', 'record_companies.php', 1, 1, 0, 0, 0),
(19, 'default_template_settings', 'reviews.php', 1, 0, 40, 0, 0),
(20, 'default_template_settings', 'search.php', 1, 1, 10, 0, 0),
(21, 'default_template_settings', 'search_header.php', 0, 0, 0, 0, 1),
(22, 'default_template_settings', 'shopping_cart.php', 1, 1, 20, 30, 1),
(23, 'default_template_settings', 'specials.php', 1, 1, 45, 0, 0),
(24, 'default_template_settings', 'whats_new.php', 1, 0, 20, 0, 0),
(25, 'default_template_settings', 'whos_online.php', 1, 1, 200, 200, 1),
(26, 'template_default', 'banner_box_all.php', 1, 1, 5, 0, 0),
(27, 'template_default', 'banner_box.php', 1, 0, 300, 1, 127),
(28, 'template_default', 'banner_box2.php', 1, 1, 15, 1, 15),
(29, 'template_default', 'best_sellers.php', 1, 1, 30, 70, 1),
(30, 'template_default', 'categories.php', 1, 0, 10, 10, 1),
(31, 'template_default', 'currencies.php', 0, 1, 80, 60, 0),
(32, 'template_default', 'ezpages.php', 1, 1, -1, 2, 1),
(33, 'template_default', 'featured.php', 1, 0, 45, 0, 0),
(34, 'template_default', 'information.php', 1, 0, 50, 40, 1),
(35, 'template_default', 'languages.php', 0, 1, 70, 50, 0),
(36, 'template_default', 'manufacturers.php', 1, 0, 30, 20, 1),
(37, 'template_default', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(38, 'template_default', 'more_information.php', 1, 0, 200, 200, 1),
(39, 'template_default', 'my_broken_box.php', 1, 0, 0, 0, 0),
(40, 'template_default', 'order_history.php', 1, 1, 0, 0, 0),
(41, 'template_default', 'product_notifications.php', 1, 1, 55, 85, 1),
(42, 'template_default', 'reviews.php', 1, 0, 40, 0, 0),
(43, 'template_default', 'search.php', 1, 1, 10, 0, 0),
(44, 'template_default', 'search_header.php', 0, 0, 0, 0, 1),
(45, 'template_default', 'shopping_cart.php', 1, 1, 20, 30, 1),
(46, 'template_default', 'specials.php', 1, 1, 45, 0, 0),
(47, 'template_default', 'whats_new.php', 1, 0, 20, 0, 0),
(48, 'template_default', 'whos_online.php', 1, 1, 200, 200, 1),
(49, 'classic', 'banner_box.php', 1, 0, 300, 1, 127),
(50, 'classic', 'banner_box2.php', 1, 1, 15, 1, 15),
(51, 'classic', 'banner_box_all.php', 1, 1, 5, 0, 0),
(52, 'classic', 'best_sellers.php', 1, 1, 30, 70, 1),
(53, 'classic', 'categories.php', 1, 0, 10, 10, 1),
(54, 'classic', 'currencies.php', 0, 1, 80, 60, 0),
(55, 'classic', 'document_categories.php', 1, 0, 0, 0, 0),
(56, 'classic', 'ezpages.php', 1, 1, -1, 2, 1),
(57, 'classic', 'featured.php', 1, 0, 45, 0, 0),
(58, 'classic', 'information.php', 1, 0, 50, 40, 1),
(59, 'classic', 'languages.php', 0, 1, 70, 50, 0),
(60, 'classic', 'manufacturers.php', 1, 0, 30, 20, 1),
(61, 'classic', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(62, 'classic', 'more_information.php', 1, 0, 200, 200, 1),
(63, 'classic', 'music_genres.php', 1, 1, 0, 0, 0),
(64, 'classic', 'order_history.php', 1, 1, 0, 0, 0),
(65, 'classic', 'product_notifications.php', 1, 1, 55, 85, 1),
(66, 'classic', 'record_companies.php', 1, 1, 0, 0, 0),
(67, 'classic', 'reviews.php', 1, 0, 40, 0, 0),
(68, 'classic', 'search.php', 1, 1, 10, 0, 0),
(69, 'classic', 'search_header.php', 0, 0, 0, 0, 1),
(70, 'classic', 'shopping_cart.php', 1, 1, 20, 30, 1),
(71, 'classic', 'specials.php', 1, 1, 45, 0, 0),
(72, 'classic', 'whats_new.php', 1, 0, 20, 0, 0),
(73, 'classic', 'whos_online.php', 1, 1, 200, 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE IF NOT EXISTS `manufacturers` (
  `manufacturers_id` int(11) NOT NULL,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturers_id`, `manufacturers_name`, `manufacturers_image`, `date_added`, `last_modified`) VALUES
(1, 'Example 1', NULL, '0001-01-01 00:00:00', NULL),
(2, 'Example 2', NULL, '0001-01-01 00:00:00', NULL),
(3, 'Example 3', NULL, '0001-01-01 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers_info`
--

CREATE TABLE IF NOT EXISTS `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers_info`
--

INSERT INTO `manufacturers_info` (`manufacturers_id`, `languages_id`, `manufacturers_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, '', 0, NULL),
(2, 1, '', 0, NULL),
(3, 1, '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_clips`
--

CREATE TABLE IF NOT EXISTS `media_clips` (
  `clip_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_manager`
--

CREATE TABLE IF NOT EXISTS `media_manager` (
  `media_id` int(11) NOT NULL,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_to_products`
--

CREATE TABLE IF NOT EXISTS `media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_types`
--

CREATE TABLE IF NOT EXISTS `media_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_types`
--

INSERT INTO `media_types` (`type_id`, `type_name`, `type_ext`) VALUES
(1, 'MP3', '.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags_categories_description`
--

CREATE TABLE IF NOT EXISTS `meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags_products_description`
--

CREATE TABLE IF NOT EXISTS `meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `music_genre`
--

CREATE TABLE IF NOT EXISTS `music_genre` (
  `music_genre_id` int(11) NOT NULL,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE IF NOT EXISTS `newsletters` (
  `newsletters_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(128) NOT NULL DEFAULT '',
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(14,2) DEFAULT NULL,
  `order_tax` decimal(14,2) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE IF NOT EXISTS `orders_products` (
  `orders_products_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_attributes`
--

CREATE TABLE IF NOT EXISTS `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_download`
--

CREATE TABLE IF NOT EXISTS `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE IF NOT EXISTS `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`orders_status_id`, `language_id`, `orders_status_name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Processing'),
(3, 1, 'Delivered'),
(4, 1, 'Update');

-- --------------------------------------------------------

--
-- Table structure for table `orders_status_history`
--

CREATE TABLE IF NOT EXISTS `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_total`
--

CREATE TABLE IF NOT EXISTS `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paypal`
--

CREATE TABLE IF NOT EXISTS `paypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_status`
--

CREATE TABLE IF NOT EXISTS `paypal_payment_status` (
  `payment_status_id` int(11) NOT NULL,
  `payment_status_name` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paypal_payment_status`
--

INSERT INTO `paypal_payment_status` (`payment_status_id`, `payment_status_name`) VALUES
(1, 'Completed'),
(2, 'Pending'),
(3, 'Failed'),
(4, 'Denied'),
(5, 'Refunded'),
(6, 'Canceled_Reversal'),
(7, 'Reversed');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_status_history`
--

CREATE TABLE IF NOT EXISTS `paypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(14) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_session`
--

CREATE TABLE IF NOT EXISTS `paypal_session` (
  `unique_id` int(11) NOT NULL,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_testing`
--

CREATE TABLE IF NOT EXISTS `paypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `p_id` int(11) NOT NULL,
  `p_description` varchar(64) NOT NULL,
  `p_question` varchar(64) NOT NULL,
  `p_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `p_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `p_multivote` enum('Y','N') NOT NULL DEFAULT 'N',
  `p_prim` enum('Y','N') NOT NULL DEFAULT 'N',
  `p_show_cust` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE IF NOT EXISTS `poll_options` (
  `o_id` int(10) unsigned NOT NULL,
  `o_poll_id` int(10) unsigned NOT NULL,
  `o_option` int(10) unsigned NOT NULL DEFAULT '1',
  `o_text` varchar(64) NOT NULL,
  `o_inpf` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poll_results`
--

CREATE TABLE IF NOT EXISTS `poll_results` (
  `r_id` int(11) NOT NULL,
  `r_ip` varchar(15) NOT NULL,
  `r_poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `r_option` int(11) NOT NULL DEFAULT '0',
  `r_option_text` varchar(32) NOT NULL,
  `r_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `products_id` int(11) NOT NULL,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `products_type`, `products_quantity`, `products_model`, `products_image`, `products_price`, `products_virtual`, `products_date_added`, `products_last_modified`, `products_date_available`, `products_weight`, `products_status`, `products_tax_class_id`, `manufacturers_id`, `products_ordered`, `products_quantity_order_min`, `products_quantity_order_units`, `products_priced_by_attribute`, `product_is_free`, `product_is_call`, `products_quantity_mixed`, `product_is_always_free_shipping`, `products_qty_box_status`, `products_quantity_order_max`, `products_sort_order`, `products_discount_type`, `products_discount_type_from`, `products_price_sorter`, `master_categories_id`, `products_mixed_discount_quantity`, `metatags_title_status`, `metatags_products_name_status`, `metatags_model_status`, `metatags_price_status`, `metatags_title_tagline_status`) VALUES
(1, 1, 999, 'Model1', '01.jpg', '550.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 1, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '550.0000', 51, 1, 0, 0, 0, 0, 0),
(2, 1, 999, 'Model2', '02.jpg', '160.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 3, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '160.0000', 51, 1, 0, 0, 0, 0, 0),
(3, 1, 999, 'Model3', '03.jpg', '241.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 4, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '241.0000', 51, 1, 0, 0, 0, 0, 0),
(4, 1, 999, 'Model4', '04.jpg', '651.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '651.0000', 51, 1, 0, 0, 0, 0, 0),
(5, 1, 999, 'Model5', '05.jpg', '211.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '211.0000', 2, 1, 0, 0, 0, 0, 0),
(6, 1, 999, 'Model6', '06.jpg', '83.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '83.0000', 2, 1, 0, 0, 0, 0, 0),
(7, 1, 999, 'Model7', '07.jpg', '503.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 3, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '503.0000', 2, 1, 0, 0, 0, 0, 0),
(8, 1, 999, 'Model8', '08.jpg', '104.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 4, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '104.0000', 2, 1, 0, 0, 0, 0, 0),
(9, 1, 999, 'Model9', '09.jpg', '359.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '359.0000', 3, 1, 0, 0, 0, 0, 0),
(10, 1, 999, 'Model1', '10.jpg', '732.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 6, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '732.0000', 3, 1, 0, 0, 0, 0, 0),
(11, 1, 999, 'Model2', '11.jpg', '653.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 3, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '653.0000', 3, 1, 0, 0, 0, 0, 0),
(12, 1, 999, 'Model3', '12.jpg', '124.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 7, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '124.0000', 3, 1, 0, 0, 0, 0, 0),
(13, 1, 998, 'Model4', '13.jpg', '605.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 9, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '605.0000', 4, 1, 0, 0, 0, 0, 0),
(14, 1, 999, 'Model5', '14.jpg', '991.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 6, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '991.9900', 4, 1, 0, 0, 0, 0, 0),
(15, 1, 999, 'Model6', '15.jpg', '305.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '305.0000', 4, 1, 0, 0, 0, 0, 0),
(16, 1, 999, 'Model7', '16.jpg', '871.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 3, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '871.1400', 4, 1, 0, 0, 0, 0, 0),
(17, 1, 999, 'Model8', '17.jpg', '353.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 1, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '353.0000', 5, 1, 0, 0, 0, 0, 0),
(18, 1, 999, 'Model9', '18.jpg', '292.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '292.2400', 5, 1, 0, 0, 0, 0, 0),
(19, 1, 999, 'Model1', '19.jpg', '785.3200', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '785.3200', 5, 1, 0, 0, 0, 0, 0),
(20, 1, 999, 'Model2', '20.jpg', '999.9900', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '999.9900', 5, 1, 0, 0, 0, 0, 0),
(21, 1, 999, 'Model3', '21.jpg', '550.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 3, 1, 0, 3, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '550.0000', 6, 1, 0, 0, 0, 0, 0),
(22, 1, 999, 'Model4', '22.jpg', '160.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 4, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '160.0000', 6, 1, 0, 0, 0, 0, 0),
(23, 1, 999, 'Model5', '23.jpg', '241.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '241.0000', 6, 1, 0, 0, 0, 0, 0),
(24, 1, 999, 'Model6', '24.jpg', '651.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '651.0000', 6, 1, 0, 0, 0, 0, 0),
(25, 1, 999, 'Model7', '25.jpg', '211.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '211.0000', 52, 1, 0, 0, 0, 0, 0),
(26, 1, 999, 'Model8', '26.jpg', '83.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 6, 1, 0, 0, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '83.0000', 52, 1, 0, 0, 0, 0, 0),
(27, 1, 999, 'Model9', '27.jpg', '503.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 4, 1, 0, 0, 3, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '503.0000', 52, 1, 0, 0, 0, 0, 0),
(28, 1, 999, 'Model1', '28.jpg', '104.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '104.0000', 52, 1, 0, 0, 0, 0, 0),
(29, 1, 999, 'Model2', '29.jpg', '359.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 3, 1, 0, 0, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '359.0000', 53, 1, 0, 0, 0, 0, 0),
(30, 1, 999, 'Model3', '30.jpg', '732.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 0, 3, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '732.0000', 53, 1, 0, 0, 0, 0, 0),
(31, 1, 999, 'Model4', '31.jpg', '653.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 6, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '653.0000', 53, 1, 0, 0, 0, 0, 0),
(32, 1, 999, 'Model5', '32.jpg', '124.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 3, 1, 0, 0, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '124.0000', 53, 1, 0, 0, 0, 0, 0),
(33, 1, 998, 'Model6', '33.jpg', '605.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 6, 1, 0, 0, 3, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '605.0000', 54, 1, 0, 0, 0, 0, 0),
(34, 1, 999, 'Model7', '34.jpg', '991.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 4, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '991.9900', 55, 1, 0, 0, 0, 0, 0),
(35, 1, 999, 'Model8', '35.jpg', '305.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 3, 1, 0, 0, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '305.0000', 55, 1, 0, 0, 0, 0, 0),
(36, 1, 999, 'Model9', '36.jpg', '871.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 0, 3, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '871.1400', 55, 1, 0, 0, 0, 0, 0),
(37, 1, 999, 'Model1', '37.jpg', '353.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 7, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '353.0000', 56, 1, 0, 0, 0, 0, 0),
(38, 1, 999, 'Model2', '38.jpg', '292.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 9, 1, 0, 0, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '292.2400', 56, 1, 0, 0, 0, 0, 0),
(39, 1, 999, 'Model3', '39.jpg', '785.3200', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 0, 3, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '785.3200', 56, 1, 0, 0, 0, 0, 0),
(40, 1, 999, 'Model4', '40.jpg', '999.9900', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '999.9900', 56, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE IF NOT EXISTS `products_attributes` (
  `products_attributes_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(64) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes_download`
--

CREATE TABLE IF NOT EXISTS `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_description`
--

CREATE TABLE IF NOT EXISTS `products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_description`
--

INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(1, 1, 'Applica FP1600B B&amp;D 7 Cup Food Processor', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec mattis. Nulla sagittis tincidunt nibh. Ut non dui vitae enim tempor cursus. Nunc iaculis rutrum elit. Curabitur ligula. Proin sed turpis in metus blandit venenatis. Vivamus ultrices. Aenean at eros. Aliquam quis urna. Proin neque. Morbi pharetra erat. Sed ipsum velit, scelerisque et, iaculis eu, gravida quis, nulla. Mauris mi neque, bibendum eget, ullamcorper vel, pellentesque vel, lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse lacus.\r\n\r\nMorbi non libero sit amet nisi pretium fringilla. Nunc tempus dolor gravida tortor. Sed suscipit ullamcorper nibh. Duis feugiat augue. Donec rutrum diam in augue. Donec ornare, erat vel porta condimentum, justo lacus sodales mauris, sed ullamcorper orci leo eget lectus. Vestibulum vitae orci. Aenean tincidunt ullamcorper est. Aenean nec nulla. Suspendisse tortor nisi, consectetuer nec, rhoncus nec, faucibus eu, nisi. Aenean sed ligula.', '', 8),
(2, 1, 'Bugatti Uma Electronic Kitchen Scale and Timer', 'Praesent risus orci, pretium semper, sagittis sit amet, scelerisque ac, velit. Quisque viverra tortor non lacus. Pellentesque quis ligula. In laoreet arcu ut velit. Sed magna. Nullam feugiat mi at arcu. Morbi et tortor. Donec eu lectus at massa tincidunt posuere. Sed interdum mattis risus. Integer nonummy, sem sed ullamcorper egestas, mauris metus aliquam metus, ut varius magna diam id justo. Donec ipsum sapien, imperdiet laoreet, feugiat quis, posuere in, ante. Sed ultrices. Etiam scelerisque rhoncus mi. Sed vitae tellus. Donec quam lacus, rhoncus eget, varius suscipit, placerat a, mi. Ut faucibus. Aenean dignissim nibh at purus.\r\n\r\nEtiam ac augue a justo sagittis suscipit. Aenean laoreet tincidunt lacus. Sed bibendum nulla et justo. Praesent blandit malesuada augue. Cras sed orci. Donec molestie mauris a dolor. Sed purus. Ut purus leo, pellentesque in, nonummy sed, dignissim vitae, mauris. Morbi egestas nisi non nibh. Vivamus purus nulla, ultricies nec, iaculis vel, mollis ut, quam. Nulla facilisi. Donec scelerisque, erat vitae varius rhoncus, velit lectus mollis tellus, et blandit ligula pede vel dolor. Vivamus magna leo, lacinia sed, ullamcorper et, tristique consectetuer, orci. Ut molestie lectus at velit.', '', 43),
(3, 1, 'Coffee Machine Bugatti Diva', 'Quisque feugiat. Vestibulum eu lacus in orci bibendum vehicula. Mauris in arcu quis erat ultrices venenatis. Suspendisse lacus urna, sodales ac, hendrerit vel, laoreet eget, orci. Duis nisi. Duis nunc turpis, vehicula at, posuere quis, varius non, dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Donec non turpis. Nam suscipit, urna sit amet nonummy porta, nibh purus sagittis ante, a mollis purus lorem sed arcu. Maecenas vitae urna. Nam ultricies mi in elit. In hac habitasse platea dictumst. Proin ullamcorper elit sed ipsum. Sed nec nulla.\r\n\r\nCurabitur nec lacus quis mi ullamcorper tempus. Morbi magna purus, cursus a, pharetra ac, vestibulum ac, tellus. Fusce ut magna ac pede laoreet ornare. Sed sed erat vel magna feugiat posuere. Quisque et dui non dui varius fermentum. Integer at sapien venenatis augue scelerisque interdum. Sed in elit. Curabitur eu elit. Pellentesque id ligula sed felis volutpat suscipit. Fusce ullamcorper, odio id tincidunt hendrerit, enim ipsum pretium ligula, sed pulvinar justo justo a justo. Aenean a lacus. Cras egestas lacus ut nulla. Cras nonummy, lorem non eleifend volutpat, tortor nisi rutrum quam, eu blandit est nunc in ante. Duis eleifend.', '', 6),
(4, 1, 'Coffee Machine Kalorik Aztec', 'Duis tortor quam, lobortis eget, pharetra commodo, euismod sed, tellus. Praesent viverra cursus est. Praesent eu quam ut velit adipiscing interdum. Praesent dictum, metus id luctus vulputate, nisl eros hendrerit libero, sit amet venenatis pede ante id metus. Fusce quis lacus. Phasellus molestie libero quis tortor. Sed dignissim luctus quam. Quisque adipiscing consequat ante. Proin pede. Ut tristique nisi et orci. Nulla in purus quis lacus imperdiet laoreet. Sed quis eros. In volutpat augue non lectus. Nullam at mauris varius arcu condimentum scelerisque. Fusce et turpis vel tellus vestibulum sodales. Mauris dui. Nullam eros purus, scelerisque ac, commodo vitae, faucibus sed, nisl.\r\n\r\nSed leo velit, iaculis ut, sodales et, mollis vitae, felis. Morbi tortor dolor, pharetra ac, ultricies id, accumsan sed, diam. Vivamus lacus. Nulla metus eros, faucibus quis, vulputate in, fringilla ut, felis. Fusce a erat. Cras congue mollis dui. Nulla non nulla. Quisque massa. Duis velit magna, placerat sed, convallis non, condimentum eget, leo. Mauris sed nunc et nunc sodales lobortis. Nunc at dui ut felis nonummy aliquet.', '', 38),
(5, 1, 'Coffee Machine Malongo Espresso-gold', 'Duis vel lacus ut ante lobortis tincidunt. Ut scelerisque imperdiet elit. Quisque facilisis feugiat est. Duis eget nulla. Aenean nisl lacus, tempus id, convallis in, vulputate vulputate, metus. Quisque condimentum aliquet nulla. Nullam dignissim dictum purus. Curabitur ullamcorper. Curabitur a dolor. Morbi tincidunt pede eu ante. Aliquam rhoncus, urna vitae semper pellentesque, lacus lorem tempus elit, sed scelerisque metus metus vel nisi. Aliquam fringilla ligula sed sapien. Phasellus imperdiet, tellus ac vulputate dictum, erat sapien gravida velit, non euismod odio tortor eget mauris. In hac habitasse platea dictumst. Sed urna tellus, mollis sit amet, ultrices et, adipiscing eget, nulla.\r\n\r\nCras accumsan lorem vitae lectus. Aliquam pretium ultricies neque. Cras sodales suscipit erat. In hac habitasse platea dictumst. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam aliquam lectus a nunc. Nam mattis condimentum enim. Donec mi. Pellentesque eget magna id est pulvinar ullamcorper. Vestibulum ullamcorper eros vitae pede. Phasellus accumsan consequat metus. Quisque mauris lorem, luctus volutpat, dignissim mollis, convallis sed, odio. Proin pharetra orci in sapien. Fusce tempus tristique lectus. Integer quis neque. Etiam id velit vel tellus ultrices tincidunt. Etiam non quam.', '', 3),
(6, 1, 'Coffee Maker Bosch Assimo', 'Morbi facilisis sodales mauris. Quisque elementum nulla at ante. Vestibulum adipiscing sodales lorem. Praesent ultricies. Sed vehicula, ante nec vestibulum condimentum, est lacus fermentum lacus, euismod hendrerit quam massa non nunc. Vestibulum egestas. Nullam a erat. Etiam rhoncus velit ac neque. Maecenas ullamcorper feugiat enim. Nam mattis. Vestibulum vestibulum urna sed felis pretium tincidunt. Proin nisl massa, posuere sit amet, pulvinar nec, ultricies at, nisl.\r\n\r\nNullam nec urna. Vestibulum commodo sapien sed augue. Sed ut mauris. Donec eget pede. In eget elit. Sed sit amet metus. Aenean vehicula tempus velit. Quisque pharetra. Vestibulum eros. Etiam eget ligula. Cras at lacus. Nulla metus nunc, iaculis ac, tristique sit amet, pellentesque vitae, nisl. Donec malesuada eros ac magna. In dictum, justo sed consectetuer pretium, mauris erat ultrices enim, et placerat libero nulla eget orci. Proin quis dolor at massa dictum malesuada. Donec nec augue. Fusce posuere. Proin lorem dolor, interdum ac, vehicula vel, malesuada sit amet, sem. Proin lobortis dui at ipsum condimentum fringilla.', '', 4),
(7, 1, 'DEF 18W-804', 'Vestibulum nibh. Nunc non lectus. In metus velit, rhoncus at, tincidunt at, elementum ac, nisl. In faucibus. Nulla hendrerit fringilla nisl. Morbi dui mi, molestie sed, luctus vel, aliquam quis, turpis. Nulla condimentum lacus sed ipsum. Aliquam orci ipsum, tempus ac, volutpat et, scelerisque vel, urna. Curabitur fringilla, pede ut hendrerit ultricies, odio eros consectetuer turpis, quis facilisis nisl libero sit amet nisl. Etiam quis orci. Ut quis nisl quis mauris nonummy molestie.\r\n\r\nNunc posuere, ante quis dignissim rhoncus, nisl quam vulputate sem, mollis feugiat tortor risus non turpis. Donec malesuada mattis lectus. Curabitur mauris odio, luctus feugiat, placerat at, mollis sit amet, lorem. Mauris nec enim. In purus mauris, sodales ac, iaculis eget, suscipit eget, lacus. Nullam nec lectus vitae lorem molestie sodales. Vestibulum consequat sem pellentesque urna. In mattis dui sed est. Curabitur metus pede, malesuada quis, mollis varius, interdum congue, diam. Sed auctor, nisi vitae vulputate lacinia, ante nulla pellentesque elit, sit amet commodo dui odio vitae sem. Nam posuere rhoncus elit. Aliquam sollicitudin, neque at blandit ultricies, elit turpis volutpat odio, a varius ipsum felis non dui. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec vel tortor. Integer tincidunt dapibus augue. Donec nisl. Nunc eget ante. Vivamus pretium.', '', 1),
(8, 1, 'Hamilton Beach 72703 Ensemble 3 Cup Chopper', 'Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Pellentesque laoreet, nisi ut porttitor commodo, purus sapien porttitor sapien, ac viverra mauris mauris eu quam. Morbi metus neque, pulvinar nec, auctor non, suscipit ut, tellus. Sed ut urna. Proin imperdiet molestie risus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi nulla. Etiam purus arcu, blandit a, adipiscing a, vestibulum non, eros. Proin tristique. Aenean nulla eros, rhoncus sed, accumsan id, dapibus sit amet, lacus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec ac erat ut elit elementum facilisis. Donec fermentum quam. Curabitur aliquam, nisl ut lobortis adipiscing, lectus leo elementum odio, et hendrerit nunc pede nec diam. Mauris semper, mauris non eleifend aliquam, massa libero malesuada nulla, nec faucibus neque quam sodales urna. Donec ac turpis a massa rhoncus imperdiet. Cras vitae lorem. Curabitur nec nibh. Nulla facilisi.\r\n\r\nCurabitur risus nulla, ornare et, pretium ullamcorper, interdum nec, tellus. Vivamus quis massa in metus eleifend fringilla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Vivamus nisi. In congue mattis justo. Aenean sit amet urna ullamcorper dolor lobortis pulvinar. Cras rutrum, nulla a ornare rhoncus, metus justo commodo orci, eu accumsan nisl tellus quis erat. Quisque venenatis rhoncus turpis. Morbi ut dolor. Quisque vulputate. Quisque mi ligula, tempor vitae, ultricies eget, volutpat a, purus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vestibulum magna massa, feugiat quis, varius at, tempor non, nisl. Sed sed arcu nec turpis commodo pharetra. Praesent tellus lacus, tempus rutrum, porttitor pharetra, pretium vel, magna. Etiam tristique ultricies diam. Pellentesque pellentesque luctus mi. Suspendisse potenti. Sed in nibh. Maecenas a nunc a sem tincidunt blandit.', '', 0),
(9, 1, 'Hood CDA EVCK4SS 40cm Cylinder', 'Integer convallis malesuada massa. Sed eget sapien a magna volutpat sollicitudin. Nullam sit amet dolor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque nulla. In ut lorem. Cras sit amet lectus. Proin at purus. Praesent accumsan volutpat ante. Etiam vitae nulla. Aliquam erat volutpat. Nullam quam.\r\n\r\nPraesent pellentesque gravida felis. Duis neque. Nunc id eros tincidunt neque consectetuer sollicitudin. Morbi rhoncus, mi quis sollicitudin laoreet, ipsum lacus ultricies urna, quis aliquet mi pede nec lectus. Morbi molestie, ante ut interdum aliquet, nibh ante volutpat diam, ac posuere magna justo ut ipsum. Donec lobortis justo eget felis. Ut urna. Cras laoreet. Vestibulum vel tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent sem orci, vulputate in, vestibulum vitae, facilisis at, sem. Phasellus mattis, lorem non eleifend lacinia, orci mi varius erat, at pharetra lectus sem ac felis.', '', 2),
(10, 1, 'Hood Faber Klima - black', 'Mauris semper velit nec risus. Nullam urna orci, dictum vel, rhoncus non, molestie sit amet, purus. Morbi pretium. Donec felis. Phasellus vitae libero eget nulla tincidunt tempus. Vivamus fringilla eleifend nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque venenatis vestibulum quam. Integer eu ligula egestas quam gravida adipiscing. Suspendisse lorem nunc, interdum nec, suscipit eu, euismod quis, nibh. Donec arcu. Nulla nibh. Fusce lobortis condimentum enim. Suspendisse vitae tellus et ipsum hendrerit vehicula.\r\n\r\nDonec a sem non tortor ornare mollis. Pellentesque iaculis, odio quis elementum tempor, magna pede eleifend tortor, eu dapibus sem mauris quis risus. Etiam at quam. Sed odio turpis, molestie a, rhoncus quis, malesuada quis, nisl. Etiam metus. Pellentesque vitae ipsum a mauris consectetuer consectetuer. Pellentesque pretium, magna ut vehicula suscipit, justo dolor sollicitudin lacus, non luctus erat lacus ut enim. Suspendisse potenti. Proin lobortis viverra magna. Donec sed nibh. Nam eget augue at tellus adipiscing vehicula. Vestibulum quam elit, commodo eget, tincidunt sit amet, consequat vel, mi.', '', 4),
(11, 1, 'Hood Scholtes HSE 159 IX', 'Curabitur ac dolor. Donec gravida, elit vel dignissim vestibulum, orci nibh tempor lacus, eget consequat nisl lorem ac leo. Quisque libero neque, ultrices eu, tempor et, interdum quis, justo. Nullam nisi. Nullam neque lacus, pellentesque at, convallis eu, tempus nec, dolor. In gravida urna ut pede sodales gravida. Integer orci massa, imperdiet non, ultricies vel, luctus sit amet, ante. Curabitur nec ligula eget mauris congue nonummy. Duis tempus diam sit amet urna. Praesent feugiat tortor id turpis. Suspendisse potenti. Sed tincidunt quam non sem. Aenean sodales semper ante. Phasellus felis nisi, eleifend in, egestas eget, vulputate ac, ante. Fusce ultricies posuere felis. Nunc pellentesque, dui nec molestie iaculis, mauris diam tincidunt odio, eget tincidunt lectus mauris id mauris.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec nec lectus et sem eleifend luctus. Nullam vitae ligula id nibh sollicitudin vulputate. Morbi eu nisl. Aliquam erat volutpat. Sed metus metus, luctus id, fringilla laoreet, aliquam at, ligula. Aliquam dignissim, sapien at imperdiet malesuada, diam urna tincidunt diam, id placerat dui nunc sit amet elit. Duis convallis nisi et nibh. Praesent sodales pede in pede. Praesent tristique. Praesent turpis.', '', 2),
(12, 1, 'Hood Whirpool AKR806IX', 'In posuere, mauris nec luctus dignissim, augue nibh ullamcorper mi, id mattis leo velit a mi. Curabitur nunc nisi, consectetuer eget, auctor luctus, pellentesque sed, massa. Donec magna est, dignissim sit amet, hendrerit id, rutrum nec, ipsum. Nullam vitae nunc. Donec est tellus, semper non, pretium eget, placerat eget, odio. Pellentesque et tortor. Aliquam erat volutpat. Donec ullamcorper nunc. Fusce neque orci, sagittis ut, imperdiet eget, faucibus vel, tellus. Sed a nisl. Aenean interdum, erat vitae pharetra pellentesque, metus mauris faucibus sem, nec rhoncus pede lacus eget eros. In vel libero. Nulla condimentum enim in libero. Maecenas convallis eros.\r\n\r\nNam in dolor. Curabitur a velit vel purus aliquet tempus. Quisque urna neque, condimentum quis, nonummy a, lobortis et, orci. Curabitur auctor placerat massa. Vestibulum eleifend. Mauris ornare, enim a tempor egestas, enim orci iaculis nunc, vitae lobortis eros nibh a dolor. Pellentesque enim. Integer non urna. Aliquam augue. Fusce semper, ligula nec accumsan gravida, sapien arcu convallis metus, ac elementum sem ligula nec nisi. Nam a pede. Curabitur aliquam. Cras molestie eleifend sapien. Nunc nec augue. Vestibulum lorem justo, mattis a, aliquam eget, mattis nec, risus. Nulla laoreet ante et ante. Suspendisse vulputate, ipsum vitae varius condimentum, ligula erat euismod eros, a mollis nunc ipsum accumsan ligula. Cras malesuada dictum eros. Duis ut justo.', '', 2),
(13, 1, 'John Lewis Ceramic Utensil Pot', 'Mauris venenatis congue odio. Nulla id justo vitae velit accumsan gravida. Etiam placerat, est non suscipit tristique, mauris ligula pretium ligula, id condimentum nulla quam vel lorem. Vestibulum ipsum. Nullam sed purus ac arcu pellentesque lobortis. Proin eu dolor. Pellentesque sem purus, porta quis, rutrum vitae, imperdiet quis, tellus. Cras at neque vel eros sollicitudin faucibus. Nullam consectetuer volutpat enim. Sed at tortor non mauris dictum vulputate. Proin ornare erat sed nisl. Curabitur sagittis mattis ipsum. Vestibulum eleifend vehicula dui. Sed metus tortor, molestie eget, blandit vitae, fermentum ut, est. Integer eget enim at lacus auctor adipiscing.\r\n\r\nIn nisl massa, dignissim nec, suscipit ut, consequat vitae, risus. Nulla feugiat massa ac nisi. Proin imperdiet mi id mi. Morbi vitae ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras tempus semper tortor. Morbi erat tortor, accumsan sed, convallis sed, placerat a, nisl. Phasellus quis dui. Sed mi arcu, nonummy et, placerat interdum, laoreet a, urna. Mauris metus. Integer tellus leo, ornare eget, dapibus ut, suscipit sed, purus. Etiam scelerisque. Ut eros sapien, fermentum quis, iaculis vitae, varius vitae, velit. Morbi sem. Maecenas eget libero sed nulla euismod sagittis.', '', 4),
(14, 1, 'John Lewis Classic II Universal', 'Cras nunc nulla, volutpat a, dapibus ut, ultricies ac, arcu. Sed nunc. Sed in enim. Duis ut ipsum. Phasellus et nisl at pede tincidunt venenatis. Sed elementum ullamcorper dolor. Mauris a sem ac eros vehicula feugiat. Fusce vel diam. Suspendisse sollicitudin gravida turpis. Cras lacinia. Morbi rutrum erat quis massa. Phasellus iaculis tincidunt massa. Aliquam quis dui. Integer diam magna, rutrum ut, volutpat id, volutpat sed, nibh. Donec metus nisl, fringilla ut, feugiat ac, porta at, pede.\r\n\r\nSed blandit, lectus at vestibulum lacinia, est massa suscipit odio, eu suscipit nisl dui vel magna. Nam dictum aliquet metus. Suspendisse mollis nibh in tortor. Ut sagittis. Fusce venenatis tristique quam. Ut venenatis tristique libero. Proin tincidunt massa sit amet neque. Aenean egestas feugiat lorem. Pellentesque metus ante, varius non, consectetuer ac, tempor non, diam. Sed quam mi, varius ut, scelerisque et, ornare at, leo. Quisque euismod sapien quis felis. Maecenas et libero id nisi consectetuer aliquam. Sed libero.', '', 0),
(15, 1, 'John Lewis Dome Pedal Bin', 'Suspendisse elementum orci at lectus. Ut tristique risus at elit. Donec nec ligula. Integer tortor dui, iaculis in, imperdiet vel, semper ac, enim. Integer molestie, dolor at adipiscing imperdiet, tortor ligula volutpat pede, vel suscipit augue mauris a orci. Suspendisse ultricies, augue at pharetra semper, nibh libero vehicula nulla, in faucibus turpis lacus sit amet neque. Nullam lorem. Morbi hendrerit orci sit amet arcu. Curabitur mollis vestibulum nibh. Suspendisse potenti. Quisque nec elit. Aenean aliquet nulla non dolor. Etiam at ante. Nulla pharetra bibendum mi. Fusce varius nisl quis quam. Curabitur ornare tortor sed mi. Vestibulum at turpis. Nulla vel urna vitae pede tincidunt lobortis. Cras scelerisque elementum nisi. Maecenas elementum ultrices metus.\r\n\r\nInteger quis magna. In ut sapien. Phasellus turpis mi, fringilla ullamcorper, mattis nec, sagittis non, sem. Nulla facilisi. Praesent congue sollicitudin odio. Morbi sapien. Aliquam sed diam non mauris malesuada sollicitudin. Integer viverra tempor leo. Maecenas convallis. Phasellus suscipit, felis sed ultricies venenatis, eros tellus tristique pede, ac vehicula diam elit ut arcu. Mauris iaculis. Praesent commodo malesuada enim. Praesent iaculis odio at elit. Suspendisse eu urna a nulla interdum congue. Donec faucibus elementum turpis. Nullam laoreet, enim id consequat interdum, ipsum enim commodo diam, non eleifend lectus pede vitae nibh.', '', 1),
(16, 1, 'John Lewis Funky Napkin Holder', 'Integer eget lorem. Sed turpis elit, vulputate sit amet, fermentum quis, mollis nec, ante. Ut interdum, augue a luctus consequat, neque tortor imperdiet est, et ullamcorper risus erat quis sapien. Praesent mollis, risus ut pellentesque rutrum, nisl lectus lobortis nibh, eu imperdiet felis metus vel nisi. Quisque nisl risus, vehicula sit amet, vestibulum ut, faucibus eget, mauris. Nullam condimentum, lorem et mattis accumsan, urna eros imperdiet nibh, ut hendrerit dui ipsum vel quam. Morbi quis velit sed elit varius accumsan. Donec aliquet dui vitae est luctus pharetra. Integer id turpis. Duis nec ante. In tempus rhoncus felis. Maecenas non mi vitae risus imperdiet dapibus. Integer varius, purus vitae consectetuer mattis, odio sem sollicitudin turpis, ullamcorper aliquet elit nulla a tellus. Phasellus pellentesque libero non eros. Sed scelerisque.\r\n\r\nVivamus magna tortor, pretium non, placerat quis, congue sit amet, urna. Vivamus quis nibh vitae ipsum porttitor pellentesque. Duis est lectus, lobortis ut, hendrerit eu, scelerisque a, ipsum. Suspendisse vitae risus. Sed tempus magna eu nibh. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin ac nisl. Nunc vitae mi quis magna blandit porttitor. Ut dapibus. Mauris sapien arcu, dictum sed, euismod a, feugiat nec, arcu. Maecenas erat quam, dictum vitae, pretium sit amet, pharetra hendrerit, magna. Vivamus vitae neque in velit fringilla sagittis. Morbi sollicitudin nonummy lectus. Vestibulum nisi. Suspendisse potenti. Sed lacus enim, porttitor in, vehicula ac, luctus at, odio. Praesent eu est.', '', 0),
(17, 1, 'John Lewis Value Plastic Cutlery Drainer', 'Nam vehicula posuere tortor. Proin nisl metus, lacinia vitae, tincidunt a, lobortis sed, arcu. Mauris non nunc a justo fermentum pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Cras mauris lectus, imperdiet et, dictum vitae, vehicula sit amet, elit. Nunc convallis pretium neque. Sed fringilla, eros id mollis pretium, libero sem vulputate dolor, id adipiscing eros elit non ante. Maecenas fermentum pharetra augue. Pellentesque nulla velit, laoreet condimentum, mattis id, eleifend sed, turpis. Aliquam molestie mi sed lacus. Fusce aliquet. Nullam nisi mi, rhoncus nec, tristique quis, viverra at, urna. Nulla consequat erat sit amet elit. Pellentesque nonummy placerat purus. In rutrum laoreet pede. Pellentesque lectus. Aliquam eu purus. Mauris luctus nonummy justo.\r\n\r\nCurabitur sit amet ipsum. Suspendisse leo. Vivamus bibendum. Cras nonummy. Fusce pharetra magna vitae nulla. Vestibulum id purus sit amet nulla placerat commodo. Donec nonummy commodo lectus. Sed vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisi. Donec libero sapien, aliquet eu, tempus sed, laoreet nec, ipsum. Praesent augue nisl, mollis et, venenatis non, ultricies rhoncus, ante. Aenean viverra odio. Ut pharetra est nec velit. Cras eu nisl. Quisque urna libero, venenatis eget, ornare ac, pulvinar in, magna. Phasellus in magna eu tortor bibendum ullamcorper.', '', 0),
(18, 1, 'Joseph Joseph Nest Food Preparation Set', 'Nam pede massa, venenatis nec, vestibulum non, posuere nec, metus. Vivamus vel libero. Aliquam erat volutpat. Nullam dictum feugiat tortor. Aliquam eleifend ligula et ipsum. Nam non mi vel tortor aliquam varius. Nunc id tellus. In sollicitudin odio eget sem. Fusce vitae sapien. Praesent neque ante, consectetuer eu, sodales in, eleifend et, velit. Donec erat ligula, rutrum ac, vehicula at, molestie semper, leo. Nulla ornare purus eu tellus. Proin dictum, massa nec pretium faucibus, felis elit tristique pede, sollicitudin fringilla dui tortor non libero. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nSuspendisse tincidunt leo sit amet nisi. Mauris lorem erat, tincidunt vel, varius in, lobortis condimentum, pede. Donec fringilla, eros sit amet molestie sodales, nisl nulla hendrerit nibh, non tempus pede leo eu nulla. Quisque nulla nisl, hendrerit vel, ultricies id, porttitor eget, metus. Morbi adipiscing. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed eros. Suspendisse eget nunc eu elit vulputate ultricies. Nunc laoreet. Sed non libero. Phasellus metus augue, tincidunt ut, posuere nec, suscipit vel, nisi. Nullam urna. Fusce enim. Praesent suscipit sodales libero. Nunc ornare, nisi eu aliquet commodo, lorem magna semper lacus, vel fermentum justo turpis sit amet libero.', '', 1),
(19, 1, 'Kalorik Meat Grinder MGR25959 Stainless Steel Blade', 'Ut iaculis lectus eget lectus. Nullam viverra, lacus sed semper aliquet, orci eros pharetra nulla, vel blandit nisi est non risus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur egestas. Sed tortor enim, commodo id, interdum nec, porttitor vitae, diam. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Maecenas varius vulputate diam. Praesent id magna. Sed convallis. Pellentesque elit eros, ornare vitae, tempor vitae, volutpat id, nisi. Sed sagittis. Donec ac pede. Fusce vehicula. Praesent a diam. Donec mattis ante vel justo. Duis sit amet tortor. Proin mauris pede, luctus sed, sagittis in, hendrerit at, felis. Maecenas sodales, justo eu suscipit nonummy, elit augue aliquet urna, vitae pretium elit lorem ut justo. Mauris lacus nunc, tempor sit amet, molestie sit amet, gravida a, tortor.\r\n\r\nUt nisi libero, fringilla eu, fermentum ultricies, auctor non, urna. Nullam venenatis venenatis magna. Vestibulum ut enim. Vestibulum vitae erat vel pede euismod tempus. Ut suscipit malesuada mauris. Nullam ultrices leo et odio. Ut et nulla. Quisque elit justo, auctor ut, tempor sed, fermentum nec, sem. Curabitur auctor, pede ut condimentum adipiscing, enim metus porttitor lacus, ut interdum tellus lorem et neque. Vivamus adipiscing. Aenean vestibulum. Aliquam bibendum libero id erat. Fusce luctus, lectus a semper pellentesque, sem nibh luctus felis, in laoreet felis libero sed odio. Etiam et diam et quam ornare consequat. Morbi ac diam eget est dapibus fermentum. Suspendisse potenti. Cras sem.', '', 0),
(20, 1, 'LG Refrigerator - Floral collection T676', 'Ut aliquam velit id ante. Suspendisse eu massa nec augue rhoncus semper. Maecenas eget lorem sed sem vehicula condimentum. Sed aliquam tellus eget eros. Quisque pharetra ullamcorper magna. Aliquam semper cursus justo. Vivamus congue. Quisque est velit, rutrum sit amet, viverra laoreet, convallis vitae, tellus. Nullam dolor augue, tempor nec, porta sed, pulvinar non, leo. Suspendisse aliquam volutpat pede.\r\n\r\nSed vitae dolor. Etiam eget felis et eros mollis volutpat. Duis tristique mattis odio. Nulla nibh. Aliquam ligula pede, posuere sed, feugiat tincidunt, pellentesque vitae, tortor. Morbi massa elit, adipiscing a, egestas et, congue nec, dui. Maecenas pretium ultrices metus. Nulla mattis tellus et libero tempus euismod. Suspendisse ornare laoreet sapien. Phasellus malesuada. Fusce venenatis, nisi ut dapibus sollicitudin, pede nunc gravida nibh, et imperdiet eros velit vitae ligula. Donec non arcu. Duis tempor dapibus orci. Ut tincidunt cursus purus. Vestibulum arcu mi, lacinia at, porttitor at, elementum sit amet, ipsum. In convallis tempor leo.', '', 0),
(21, 1, 'Mauviel MHeritage Copper and Stainless Steel Rondeau, 28cm', 'Proin neque est, consectetuer non, eleifend eu, placerat vitae, enim. Donec egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas orci nulla, semper quis, vehicula ut, gravida non, augue. Praesent et ligula non justo condimentum convallis. Duis pede. Proin quis nibh. Donec nisi lacus, rhoncus pulvinar, accumsan eu, semper at, enim. Fusce imperdiet, arcu eget fringilla vestibulum, sem orci rhoncus odio, pulvinar fermentum sem turpis et dolor. Quisque fermentum lobortis dui. Nullam tempus urna et tellus. Integer tincidunt urna in turpis. Pellentesque eros tortor, varius et, tristique quis, sagittis id, dolor. Vestibulum molestie.\r\n\r\nNam rhoncus orci ut velit. Phasellus magna odio, convallis non, vehicula a, mollis ac, velit. Phasellus augue diam, laoreet non, malesuada eget, fermentum a, pede. Pellentesque metus sem, ornare nec, mattis id, accumsan et, justo. Nullam at sem quis erat volutpat mattis. Aliquam erat volutpat. Quisque ipsum nisi, luctus vel, gravida ac, porta eget, mauris. Nulla ante eros, congue a, varius eu, laoreet et, massa. Nam consectetuer erat id tellus. Mauris hendrerit, dolor id eleifend ultricies, est ligula auctor risus, eget porttitor metus enim at felis. Praesent posuere, lectus porta volutpat posuere, ante leo volutpat risus, fringilla adipiscing purus eros nec lectus. Donec tempor urna sed libero gravida cursus. Nullam mollis est vel sapien. Fusce viverra suscipit metus. Cras eu risus. Aliquam nec leo. Proin non risus. Suspendisse id felis eget purus ornare sagittis. Maecenas et nibh et velit vestibulum adipiscing.', '', 3),
(22, 1, 'Mauviel MHeritage Copper and Stainless Steel Saute Pan, 24cm', 'Nam in risus. Praesent nec ligula ut dolor egestas gravida. Pellentesque velit augue, vulputate ac, facilisis ut, placerat vitae, est. Quisque augue arcu, scelerisque sit amet, ultrices nec, fringilla a, sem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris sit amet dolor. Mauris tincidunt velit et enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vivamus convallis, dui sed ultrices consectetuer, turpis eros blandit lorem, vel ultricies magna lorem sed magna. Integer tempus. Integer feugiat laoreet ante. Ut eu nisl. Quisque porta lorem vel purus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse mi metus, sodales vitae, consectetuer eu, malesuada eget, velit.\r\n\r\nCras tortor augue, ullamcorper quis, sodales ut, faucibus id, ante. Morbi lacinia ligula et velit. Quisque ante. Aliquam vel neque vel dolor cursus molestie. Vivamus vestibulum. Mauris sit amet nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla lorem est, bibendum ullamcorper, molestie cursus, viverra eget, sapien. Aliquam congue, orci ut convallis tempus, turpis sem tempor mi, quis rhoncus ligula magna placerat mi. Phasellus metus. Nullam id eros. Curabitur sit amet ipsum. Donec venenatis, leo id dapibus egestas, nulla leo iaculis lacus, sit amet sollicitudin tellus nisl eu neque. Suspendisse leo elit, porttitor elementum, vulputate vel, egestas in, nulla. Mauris semper, nunc et pellentesque gravida, nisl pede vulputate mauris, eget vestibulum lacus neque sit amet mauris. Mauris nulla nibh, tincidunt quis, aliquet ac, condimentum sed, nunc. Sed sit amet orci.', '', 1),
(23, 1, 'Mauviel MHeritage Copper and Stainless Steel Stew Pot, 24cm', 'Aliquam erat volutpat. Sed ipsum. In a felis in erat faucibus tempus. Donec vehicula, metus eget ullamcorper suscipit, mauris elit aliquet dui, porttitor tristique enim diam at justo. Ut fringilla, erat in bibendum gravida, odio elit consequat ligula, eget dapibus ante diam id orci. Proin vel tellus. Vivamus neque nisl, lobortis id, sollicitudin et, eleifend eu, dui. Cras tincidunt justo ut libero. Aenean eget felis sit amet nunc rutrum lacinia. Nam molestie mollis purus. Fusce pede libero, porta ac, pulvinar non, fermentum ut, nisl. Cras porta vulputate tortor. Ut non nibh. Ut porttitor purus sit amet nibh.\r\n\r\nSuspendisse congue convallis orci. Etiam non justo in justo sollicitudin consectetuer. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Nam in massa eget tellus vulputate lobortis. Mauris commodo purus vitae turpis. Donec tempus mauris. Fusce diam sapien, commodo quis, euismod ut, malesuada a, nisl. Etiam convallis pede eget turpis. Cras et mi. Phasellus iaculis enim pulvinar ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean tincidunt quam ut lectus. Donec ut orci sit amet pede venenatis hendrerit. Fusce dignissim felis.', '', 15),
(24, 1, 'Meat Grinder  SMG 4382', 'Quisque varius tincidunt enim. Sed augue. Donec nonummy, lacus eu elementum blandit, lectus est consequat est, at tristique eros tortor sit amet lorem. Cras metus ipsum, tincidunt eget, sollicitudin sed, lacinia id, urna. Aliquam vitae justo id justo volutpat placerat. Pellentesque interdum, orci vitae auctor porta, est nunc posuere dolor, et placerat velit est sed mi. Nulla faucibus lacinia diam. Proin eu leo sit amet ligula fermentum adipiscing. Donec tortor lacus, rhoncus a, blandit vel, suscipit a, erat. Morbi nec quam dignissim tortor cursus consectetuer. Suspendisse potenti.\r\n\r\nMorbi purus. In hac habitasse platea dictumst. Morbi sed nunc sit amet ante gravida consequat. Ut lorem neque, porta vitae, blandit id, posuere et, felis. Mauris sapien diam, aliquet quis, suscipit id, vehicula sit amet, massa. Ut vel dolor. Sed vulputate, mauris id rhoncus fringilla, erat elit ullamcorper quam, ut suscipit nulla sem eu velit. In lacus. Fusce mattis. Nullam feugiat lacus nec tellus. In viverra nisl in dolor. Sed vestibulum, dolor nec iaculis dictum, mauris purus porta nisi, sed fringilla nisl lorem et ligula. Quisque tristique placerat nisi. Nam mi. Fusce eget odio. Fusce odio metus, laoreet a, faucibus eu, mattis id, nunc. Aliquam enim ipsum, aliquam eget, viverra vitae, congue vitae, diam. Aenean quam tortor, varius sit amet, viverra ut, sodales ut, nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut vitae libero eu quam vulputate dignissim.', '', 2),
(25, 1, 'MEAT GRINDER Avilla av-0304', 'Pellentesque diam justo, tempus ac, tincidunt in, scelerisque tempus, nibh. Mauris accumsan consectetuer sapien. Nulla facilisis accumsan mauris. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla sit amet mauris. In quis mauris vitae mauris consequat tincidunt. Sed eu neque. In quam eros, pharetra at, volutpat quis, volutpat et, nisi. Cras lacinia elit a leo. Sed urna neque, condimentum in, bibendum vitae, aliquet eu, dui. Vivamus eu pede. Donec accumsan mattis justo. Maecenas ultricies, odio in sollicitudin euismod, nunc sem semper mauris, lacinia pretium nunc tellus eu mauris. In lacus. Cras mattis. Vestibulum varius. Nulla iaculis, diam non fringilla tempor, ligula massa pellentesque augue, sit amet faucibus tellus enim vel turpis. Nam aliquet. Maecenas nonummy, lectus id semper hendrerit, elit arcu pulvinar tortor, et auctor sem diam vestibulum tortor. Phasellus in lectus.\r\n\r\nSed pellentesque, mauris quis pellentesque tristique, enim urna tristique lorem, non pellentesque nunc turpis vitae metus. Morbi varius turpis at nisi. Etiam at justo sed nisl varius vehicula. Curabitur purus est, faucibus in, dapibus posuere, aliquet ut, sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean dui lectus, posuere id, auctor non, molestie ornare, tortor. Nam lobortis, velit vel congue laoreet, tortor diam suscipit mauris, quis blandit nisi mauris id nisi. Fusce sem velit, porta id, rhoncus vulputate, placerat in, nibh. Donec nec libero. Curabitur a orci.', '', 2),
(26, 1, 'Meat Grinder MG-2050(R)', 'Nam blandit quam id justo. Mauris mollis malesuada odio. Vestibulum massa. Fusce quis eros et eros tincidunt dictum. Aenean dui lorem, condimentum nec, iaculis eget, mattis in, libero. Quisque consectetuer odio vel nisi. Fusce luctus leo nec ipsum. Maecenas pretium lectus at felis. Vestibulum vitae tortor at ligula viverra laoreet. Donec adipiscing pellentesque ipsum. Donec vulputate consequat massa. Integer ultrices, tellus ac fringilla vehicula, felis felis egestas ligula, eget suscipit risus velit at arcu. In pede eros, scelerisque eget, tincidunt et, semper eget, erat. Suspendisse tortor enim, sollicitudin feugiat, fringilla quis, laoreet in, dui. Proin ultricies arcu quis pede.\r\n\r\nNulla non massa. Aliquam mollis, ipsum vel sollicitudin congue, libero purus sagittis massa, ut posuere velit lacus non lectus. Maecenas tincidunt. Vestibulum tincidunt augue in est. Nulla facilisi. In gravida, sapien non sodales pulvinar, neque lacus eleifend dolor, a pulvinar ligula dui sed erat. Aliquam diam. Pellentesque vel purus. Duis eget est vel est fermentum egestas. Cras a mi vitae quam porttitor dictum.', '', 12),
(27, 1, 'Mechanical Kitchen Scales', 'Duis eros justo, gravida vel, aliquam sed, bibendum ut, nibh. Donec molestie lorem in massa vehicula malesuada. Aenean vehicula fermentum nisi. Morbi nulla. Quisque nunc. Curabitur lorem mi, pulvinar sed, laoreet sit amet, sollicitudin in, lorem. Sed accumsan, dolor in feugiat euismod, elit elit aliquet erat, sed iaculis sapien est rhoncus mi. Integer lacinia nonummy turpis. Aliquam erat volutpat. Etiam eget arcu non metus tincidunt ultrices.\r\n\r\nCras semper odio sed dolor. Nullam egestas. Vestibulum porta porta quam. Fusce quam libero, malesuada vitae, tempor in, consectetuer vel, arcu. Maecenas tempus est iaculis metus. Nunc consectetuer hendrerit pede. Praesent eget nisi. Morbi fermentum imperdiet magna. In hac habitasse platea dictumst. Nunc libero lacus, interdum ut, tempor quis, hendrerit a, augue.\r\n\r\nSuspendisse eu dolor a nunc posuere vehicula. Nam augue risus, imperdiet sed, vehicula eget, ultrices dapibus, est. Quisque enim. Curabitur sed purus eget purus ornare tincidunt. Quisque mi nulla, egestas in, malesuada sit amet, laoreet at, lacus. Mauris non lectus. Curabitur ac nisl quis metus auctor convallis. Quisque libero massa, ultrices non, imperdiet quis, fringilla et, nunc. Aliquam neque neque, blandit sed, vulputate nec, auctor non, dolor. Pellentesque auctor porttitor lectus. Donec lectus justo, congue vel, blandit quis, euismod vel, tellus. Maecenas ultrices libero ut sem. Cras fermentum. Donec eu lorem a ligula bibendum scelerisque. Vestibulum nisi.', '', 35),
(28, 1, 'Modern fridge freezer Fagor FFA-8865', 'Integer porta risus quis quam. Nam nulla. Phasellus elementum iaculis ipsum. Nunc condimentum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur vehicula dui sagittis dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Nullam quis est accumsan nisl lacinia ornare. Suspendisse dictum felis non lectus. Curabitur id elit et ligula pharetra ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Praesent porttitor ligula quis leo. Aenean vehicula egestas augue. Nulla gravida leo sit amet sem. Ut tincidunt pulvinar turpis. Nunc diam. Donec nisi lacus, ultrices iaculis, feugiat sit amet, fermentum in, est. Sed iaculis, sem ac eleifend facilisis, odio urna interdum elit, hendrerit viverra justo libero ut lectus.\r\n\r\nProin posuere, diam id tincidunt commodo, metus ipsum tristique elit, et sodales est magna eget leo. Aliquam augue velit, vulputate sit amet, hendrerit in, scelerisque a, pede. Mauris dapibus tincidunt ligula. In quis ligula. Aenean pretium hendrerit dolor. Fusce vitae pede. Donec vehicula volutpat enim. Phasellus libero. Proin eu magna. Vestibulum interdum. Morbi ut augue vel orci blandit dapibus. Pellentesque nunc enim, sollicitudin at, tincidunt eu, mollis sit amet, libero. Fusce enim leo, egestas at, consequat eget, porttitor suscipit, nunc. Pellentesque ut magna a justo tincidunt mollis. In pretium, massa at elementum fermentum, turpis est scelerisque pede, quis auctor odio nunc nec ante. Proin quis metus. Pellentesque commodo tortor.', '', 2),
(29, 1, 'Poachpod Silicone Egg Poachers', 'Nullam varius odio a justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Aliquam nisl erat, rutrum ac, mollis id, bibendum id, nunc. Morbi dolor turpis, commodo ut, lacinia ut, tempus quis, tortor. Cras malesuada suscipit lorem. Etiam gravida, metus eu ullamcorper porttitor, pede dui viverra massa, ac imperdiet diam enim vitae velit. Praesent volutpat ultrices elit. Aenean quis massa. Praesent eget dui id diam interdum vulputate. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPellentesque ac est in tortor fermentum tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Morbi cursus risus ac pede. Nunc orci. Praesent risus. Nunc pretium. Cras nisl odio, dapibus quis, viverra vitae, lobortis sit amet, augue. Ut pellentesque tellus interdum elit. Nulla id nisl. Nulla varius. Nulla et dolor. Proin eleifend nibh ultricies pede.', '', 0),
(30, 1, 'Salter Orb Mechanical Kitchen Scale', 'In hac habitasse platea dictumst. Nulla facilisi. Pellentesque nulla orci, viverra eu, convallis nec, ullamcorper sed, felis. Cras fermentum eros eget lorem. In blandit purus sit amet erat. Etiam a justo nec arcu consequat mattis. Quisque pharetra, ante sit amet tincidunt vestibulum, tortor neque venenatis leo, a ultricies purus tellus nec turpis. Phasellus risus pede, consequat nec, viverra a, tempor a, dui. Morbi rhoncus augue non justo. Vivamus vitae mi eget lectus porta consequat. Sed neque. Pellentesque neque augue, accumsan a, ornare vitae, volutpat vel, neque. In euismod fringilla arcu.\r\n\r\nNam ultricies aliquet odio. Cras consequat ligula at libero. Nullam diam augue, sollicitudin et, facilisis nec, auctor a, turpis. Mauris feugiat, ipsum id sollicitudin feugiat, quam velit molestie mi, dapibus dapibus neque diam quis tortor. Aenean vitae massa vel turpis auctor dictum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris a tortor ac massa commodo hendrerit. Praesent in quam. Maecenas venenatis adipiscing mauris. Sed suscipit venenatis odio. Pellentesque porttitor nonummy libero. Etiam non tellus tempus tortor ornare accumsan. Nullam dolor justo, pellentesque sed, ultricies sed, facilisis ac, nunc. Phasellus bibendum bibendum eros. Maecenas orci nulla, gravida ut, pellentesque id, pharetra vitae, orci. In posuere elit ac augue. Nam augue velit, molestie non, tincidunt in, tincidunt in, urna. In velit elit, imperdiet sed, faucibus non, pharetra in, urna. Donec egestas.', '', 3),
(31, 1, 'Side-by-side ELECTROLUX Refrigerator', 'Sed vulputate. Nulla volutpat mollis ligula. Duis lobortis orci in tortor. Donec adipiscing lacinia erat. Duis in massa et lorem tempus ornare. Vestibulum mi enim, rutrum ac, eleifend vel, pellentesque id, leo. In porttitor dolor eget orci. Suspendisse felis ipsum, lobortis porttitor, dapibus quis, posuere non, lectus. Etiam eleifend risus a lectus. Etiam consequat, erat in pellentesque rhoncus, ligula lectus luctus ante, sed accumsan nibh risus at nisl. Nullam placerat, urna non ultricies convallis, pede pede dignissim orci, eget consectetuer urna pede posuere nulla.\r\n\r\nInteger ante risus, rutrum eu, ullamcorper eget, pellentesque a, libero. Integer sed lectus. Sed in leo. Aliquam lorem massa, elementum vel, lacinia a, malesuada sed, felis. Etiam vulputate cursus nisl. Cras dolor turpis, eleifend sit amet, consectetuer at, molestie non, nibh. Etiam sed magna quis dolor tempor ullamcorper. Sed nonummy dolor a nisi. Vestibulum elementum purus nec nunc. Duis egestas lacinia pede. Cras vitae diam eu urna auctor aliquet. Fusce id augue. Fusce tempus magna et nibh. Integer feugiat nisi sed velit. Integer nec metus. Duis tellus ante, semper non, pellentesque vel, elementum cursus, ipsum. Nullam sollicitudin, diam id ultrices vehicula, quam orci adipiscing leo, quis consequat augue tellus eget risus. Nulla vitae ante.', '', 1),
(32, 1, 'Siemens KD-36NA-40 fridge freezer', 'Nam viverra, elit pellentesque dignissim tristique, nulla turpis varius odio, at facilisis libero augue ut velit. Maecenas varius. Fusce non dui. Nunc a sem et ipsum volutpat imperdiet. Suspendisse vel tellus eget felis egestas pretium. Cras dapibus sollicitudin urna. Nam nisi nisi, interdum eu, imperdiet mollis, accumsan sit amet, dolor. Aliquam erat volutpat. Sed congue. Etiam tincidunt. Duis commodo est a turpis. Integer purus. Suspendisse leo. Nulla tincidunt metus in nisl. In hac habitasse platea dictumst. Morbi congue laoreet diam. Integer commodo condimentum nisl. Nullam semper. Duis euismod, risus quis lobortis tempor, mi ante elementum dui, et molestie ligula est eget leo.\r\n\r\nQuisque quis est. Cras id nulla. Praesent id lectus. Sed pharetra, arcu a accumsan iaculis, leo purus commodo eros, at pulvinar purus mauris at lacus. Sed vitae elit et tellus pellentesque auctor. Nam in pede. Praesent quis est sit amet turpis laoreet lacinia. Curabitur fringilla sagittis neque. Proin eu lectus. Cras enim pede, ultrices at, mollis quis, volutpat imperdiet, nibh. Nunc porta laoreet nisi. Donec cursus semper orci. Quisque quis leo vulputate nulla tincidunt cursus. Duis at magna eget neque molestie dictum. Morbi at pede. Mauris consectetuer scelerisque sapien. Aliquam erat volutpat. Vivamus rhoncus tellus a sem. Morbi faucibus, mi sit amet dictum feugiat, metus neque suscipit nibh, non tincidunt urna augue in enim.', '', 38),
(33, 1, 'SMEG - Compact Refrigerator Mini-fridge FAB-10UJ', 'Morbi ipsum metus, eleifend a, venenatis nec, vehicula et, lectus. Duis at magna a leo vehicula volutpat. Etiam quis arcu. Integer sodales venenatis sem. Nullam eleifend porta neque. Proin lectus diam, placerat in, vehicula adipiscing, lobortis in, enim. Curabitur sit amet pede. Sed faucibus volutpat arcu. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ipsum pede, dictum eu, suscipit id, ullamcorper sit amet, lectus. Sed cursus accumsan mi. Nunc accumsan urna nec est. Maecenas mattis velit in pede.\r\n\r\nMaecenas lorem. Mauris vehicula molestie mauris. Vestibulum nulla. Proin convallis. Aenean non nisl sit amet pede cursus bibendum. Proin quis dolor. Sed vehicula elit et eros. Cras luctus vestibulum massa. Ut porttitor. Maecenas ac felis. Nulla facilisi. Ut orci purus, sagittis sed, mollis vehicula, viverra in, turpis. Praesent varius. Vestibulum eu mauris at nibh vehicula feugiat. Fusce a sem.', '', 0),
(34, 1, 'SMEG - Contemporary Refrigerator FPD', 'Nullam nonummy. Nunc sit amet est. Nulla turpis lectus, placerat id, porta vitae, tempor id, erat. Nam mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis tempus pellentesque libero. Integer vehicula pulvinar odio. Donec pede purus, viverra nec, lobortis quis, molestie tempor, urna. Vestibulum scelerisque tincidunt sapien. Nam justo mi, ultricies dignissim, interdum et, viverra a, enim. Duis rhoncus pede nec sapien. Ut congue nibh quis justo. Donec nec libero. Praesent hendrerit pellentesque elit. Curabitur nisi augue, commodo tristique, dapibus in, iaculis id, sapien. Phasellus nunc nisl, mollis ac, auctor ac, dapibus at, tortor. Sed placerat velit at mi.\r\n\r\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Pellentesque nulla ante, interdum vitae, mollis et, dignissim ultricies, turpis. Nulla tempus condimentum lorem. Phasellus bibendum fringilla risus. Duis congue lectus sed nulla. Suspendisse id lectus. Curabitur quis odio. Nunc nisi lorem, ultrices sit amet, porta at, porta commodo, nisi. Donec molestie arcu nec elit accumsan pellentesque. Duis sit amet dui.\r\n\r\nSuspendisse nibh eros, mollis tristique, bibendum at, tempor in, dolor. Donec vel ipsum. Pellentesque varius sagittis mi. Sed ut lorem. In ut elit a nisi facilisis dignissim. Quisque venenatis libero facilisis nulla. Nullam sodales. Proin eget turpis. Suspendisse posuere. Sed turpis massa, tristique cursus, tincidunt at, tempor at, tellus. Phasellus eu mi.', '', 0),
(35, 1, 'Tefal Jamie Oliver Pressure Cooker', 'Duis quis felis a ligula rhoncus tincidunt. Donec at ipsum. Mauris sit amet orci. Aliquam rhoncus fermentum risus. Mauris eu nisl id ligula fringilla bibendum. Sed tempus. Aenean quis massa. In libero. Pellentesque fringilla. Nunc sit amet neque eget orci tincidunt accumsan. Praesent in quam eget orci lobortis rutrum. Aliquam elementum nunc in nulla. Morbi sit amet arcu. Maecenas venenatis, tellus et scelerisque sollicitudin, elit justo ornare turpis, ut tincidunt tortor metus at quam. Nulla laoreet felis. Mauris augue leo, blandit at, faucibus at, accumsan sit amet, purus. In cursus dignissim mi. Curabitur ac lectus ut diam congue varius. Aliquam sed nibh.\r\n\r\nSed molestie consectetuer justo. Fusce eros. Phasellus rutrum. Suspendisse lectus. Duis convallis nibh at eros. In eget metus. Aenean dolor dui, pretium sit amet, nonummy sit amet, accumsan id, quam. Vestibulum vel leo. Quisque tortor odio, pulvinar vitae, tempor in, commodo non, odio. In dapibus erat eget tellus. Donec sagittis nisi sit amet dolor. Ut vitae quam. In nec nibh. Sed metus neque, commodo sed, congue non, vestibulum ut, ligula. Duis ligula velit, laoreet nec, consequat vitae, tristique ac, augue. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla a ligula. Nam vestibulum fermentum ante.', '', 1);
INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(36, 1, 'Typhoon Double Tier Bamboo Steamer', 'Sed ultricies eros placerat tellus. Donec nec elit. Nunc vestibulum auctor augue. Pellentesque imperdiet euismod massa. Curabitur et lectus. Nulla facilisi. Curabitur sodales ullamcorper nibh. Vestibulum blandit adipiscing enim. Etiam luctus felis a metus. Donec congue bibendum diam. Vestibulum bibendum rhoncus sem. Aenean imperdiet accumsan tortor. Nunc faucibus, arcu id congue hendrerit, sem nisi scelerisque elit, et adipiscing pede massa quis pede. Vivamus bibendum turpis non mi. Vivamus venenatis augue eget tellus. Pellentesque hendrerit, erat non pellentesque euismod, diam quam sagittis tortor, sit amet accumsan massa sem vitae sapien. Donec commodo ligula nec metus. Vestibulum feugiat dolor sit amet nunc.\r\n\r\nMorbi tincidunt gravida erat. Nulla id arcu. Suspendisse potenti. Aliquam iaculis justo sit amet tortor. Duis consequat, neque vitae malesuada posuere, ante est blandit turpis, non consectetuer elit enim vitae sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla nisl dolor, placerat quis, mattis eu, tristique vitae, mi. Pellentesque facilisis aliquet urna. Cras eget nisl eu massa posuere tempor. Nullam tellus lectus, cursus vitae, tempus nec, consectetuer adipiscing, ligula. Suspendisse potenti. Fusce rutrum venenatis nibh. Quisque mauris lectus, egestas a, pharetra et, faucibus et, nulla. Vestibulum at elit sit amet nisi hendrerit placerat. Praesent ligula. Phasellus tincidunt, metus pretium vulputate posuere, leo enim varius justo, quis lacinia dolor odio ac metus. Curabitur faucibus pulvinar diam.', '', 0),
(37, 1, 'Umbra Saddle Sink Caddy', 'Donec dolor dolor, porta a, viverra quis, congue in, quam. Sed et quam. Pellentesque ut urna in augue interdum pharetra. Pellentesque quis orci. Nulla sed lacus eget tortor cursus laoreet. Quisque pellentesque arcu vitae quam adipiscing ornare. Integer et mi nec magna pulvinar elementum. Quisque feugiat, mi vulputate consectetuer aliquam, sapien pede hendrerit felis, vulputate tempus ipsum purus ut metus. Pellentesque a tellus eget dui condimentum blandit. Etiam posuere molestie lorem. In sed dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus ac felis eu odio ullamcorper lacinia. Maecenas feugiat pellentesque orci. Cras auctor. Aliquam turpis. Nullam porttitor elementum turpis.\r\n\r\nVivamus dui nunc, vestibulum non, rutrum ut, scelerisque eget, diam. Integer leo velit, facilisis sed, luctus a, aliquam sed, orci. Proin ac augue. Maecenas turpis metus, tempus at, sagittis vitae, gravida in, nulla. Donec consectetuer. Morbi adipiscing sem in neque. In turpis magna, hendrerit ac, egestas nec, suscipit vel, orci. Suspendisse potenti. In eu tellus. Mauris in neque sed augue ultrices ultrices. Nam pellentesque. Nunc sagittis mauris. Maecenas sed felis. Curabitur mattis blandit enim. In ac elit et nisl fermentum tristique. Fusce malesuada ornare odio. Integer sem.', '', 5),
(38, 1, 'Water Kettle SWK 1000OE', 'Quisque sed leo. Vivamus arcu purus, adipiscing et, consequat id, tincidunt sed, ligula. Proin bibendum dignissim sem. Nam tempus. Vestibulum sagittis suscipit urna. Vestibulum malesuada commodo odio. Nam fermentum neque sit amet massa. Nunc blandit lacus in quam. Aliquam fringilla, massa vel malesuada feugiat, enim mi molestie turpis, in rhoncus dui tellus vitae turpis. Donec urna enim, congue ut, hendrerit nec, imperdiet sed, libero.\r\n\r\nNulla ante eros, sagittis et, laoreet in, congue nec, odio. In lectus nisi, scelerisque quis, condimentum a, sollicitudin vitae, ligula. Maecenas blandit. Duis sodales euismod lectus. Sed vel est et orci laoreet ultricies. Mauris consequat placerat diam. Etiam ut libero. Pellentesque aliquet fermentum velit. Nullam risus metus, dignissim interdum, dapibus sed, posuere ac, mi. Mauris condimentum, neque vel tristique faucibus, mauris tortor tincidunt nunc, at pretium turpis dui id elit. Donec sit amet est. Mauris quis erat ac diam tincidunt hendrerit. Fusce malesuada tortor ut leo. Nulla facilisi. Aenean placerat, eros quis ultrices vehicula, enim lacus interdum turpis, non iaculis metus odio sit amet tellus. Pellentesque cursus tempor metus. In aliquam pulvinar nibh.', '', 1),
(39, 1, 'Water Kettler SWK 1051', 'Maecenas lacus. Nulla adipiscing lorem et lacus. Etiam interdum dapibus mauris. Suspendisse dictum nunc in lorem. Mauris nec odio ut ante tincidunt accumsan. Integer dapibus, nisi et sollicitudin aliquam, tortor tortor tempus ante, quis porta justo pede non velit. Nunc tincidunt suscipit nisi. Quisque libero. Sed dignissim orci at sem. Curabitur sed orci non ligula venenatis congue.\r\n\r\nCras convallis, augue at faucibus vehicula, mi eros volutpat tellus, ut dignissim nibh tellus sed neque. Mauris dapibus pharetra odio. Vivamus quis purus. Nam et massa. Etiam sagittis, tellus blandit sollicitudin luctus, nisl nibh placerat nisl, a varius elit nisi at ligula. Nullam et nulla. Vivamus erat nulla, lobortis vel, nonummy eget, nonummy at, odio. Morbi pellentesque luctus metus. Fusce velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', '', 2),
(40, 1, 'Water Kettler SWK 1753', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce bibendum dictum tortor. Etiam malesuada dictum urna. In vel enim quis urna suscipit commodo. Donec sollicitudin lectus. Ut interdum adipiscing tellus. Cras elit nunc, ultrices luctus, ullamcorper sed, tempus at, urna. In a pede. Aliquam nisl tortor, interdum vitae, cursus vitae, pretium at, odio. Etiam sed ante quis nunc elementum interdum. Aenean vel ligula. Aliquam tincidunt volutpat urna. Donec velit velit, interdum eget, dictum at, dictum in, nisl. Etiam tempor. Duis pellentesque.\r\n\r\nCurabitur nunc nibh, dignissim vel, porttitor at, pretium in, massa. Nunc lorem enim, egestas et, fringilla sed, mattis eget, erat. Etiam id tortor. In in nulla. Etiam lacinia. Pellentesque vestibulum massa non neque. Morbi faucibus rhoncus mi. Suspendisse potenti. Suspendisse gravida metus ac ligula. Phasellus sodales ultricies libero. Curabitur dignissim ante nec metus. Vestibulum bibendum. Nullam bibendum, orci ac commodo nonummy, diam neque dictum turpis, quis tincidunt leo tellus sit amet lorem. Nullam porttitor interdum lectus. Nunc nec risus a nibh tempus congue. Quisque tincidunt tincidunt pede. Proin volutpat adipiscing elit. Ut a arcu eu nisl rutrum cursus. Donec libero.', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products_discount_quantity`
--

CREATE TABLE IF NOT EXISTS `products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_notifications`
--

CREATE TABLE IF NOT EXISTS `products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_options`
--

CREATE TABLE IF NOT EXISTS `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(64) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_options_types`
--

CREATE TABLE IF NOT EXISTS `products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Track products_options_types';

--
-- Dumping data for table `products_options_types`
--

INSERT INTO `products_options_types` (`products_options_types_id`, `products_options_types_name`) VALUES
(0, 'Dropdown'),
(1, 'Text'),
(2, 'Radio'),
(3, 'Checkbox'),
(4, 'File'),
(5, 'Read Only');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values`
--

CREATE TABLE IF NOT EXISTS `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_options_values`
--

INSERT INTO `products_options_values` (`products_options_values_id`, `language_id`, `products_options_values_name`, `products_options_values_sort_order`) VALUES
(0, 1, 'TEXT', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values_to_products_options`
--

CREATE TABLE IF NOT EXISTS `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_to_categories`
--

CREATE TABLE IF NOT EXISTS `products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_to_categories`
--

INSERT INTO `products_to_categories` (`products_id`, `categories_id`) VALUES
(1, 51),
(1, 56),
(1, 73),
(2, 51),
(2, 56),
(2, 73),
(3, 51),
(3, 56),
(3, 73),
(4, 51),
(4, 56),
(4, 73),
(5, 2),
(5, 57),
(5, 74),
(6, 2),
(6, 57),
(6, 74),
(7, 2),
(7, 57),
(7, 74),
(8, 2),
(8, 57),
(8, 74),
(9, 3),
(9, 61),
(9, 75),
(10, 3),
(10, 61),
(10, 75),
(11, 3),
(11, 61),
(11, 75),
(12, 3),
(12, 61),
(12, 75),
(13, 4),
(13, 62),
(13, 81),
(14, 4),
(14, 62),
(14, 81),
(15, 4),
(15, 62),
(15, 81),
(16, 4),
(16, 62),
(16, 81),
(17, 5),
(17, 63),
(17, 82),
(18, 5),
(18, 63),
(18, 82),
(19, 5),
(19, 63),
(19, 82),
(20, 5),
(20, 63),
(20, 82),
(21, 64),
(21, 83),
(22, 64),
(22, 83),
(23, 64),
(23, 83),
(24, 64),
(24, 83),
(25, 52),
(25, 65),
(25, 84),
(26, 52),
(26, 65),
(26, 84),
(27, 52),
(27, 65),
(27, 84),
(28, 52),
(28, 65),
(28, 84),
(29, 53),
(29, 66),
(29, 85),
(30, 53),
(30, 66),
(30, 85),
(31, 53),
(31, 66),
(31, 85),
(32, 53),
(32, 66),
(32, 85),
(33, 54),
(33, 71),
(33, 86),
(34, 54),
(34, 71),
(34, 86),
(35, 54),
(35, 71),
(35, 86),
(36, 54),
(36, 71),
(36, 86),
(37, 55),
(37, 72),
(38, 55),
(38, 72),
(39, 55),
(39, 72),
(40, 55),
(40, 72);

-- --------------------------------------------------------

--
-- Table structure for table `product_music_extra`
--

CREATE TABLE IF NOT EXISTS `product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE IF NOT EXISTS `product_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`type_id`, `type_name`, `type_handler`, `type_master_type`, `allow_add_to_cart`, `default_image`, `date_added`, `last_modified`) VALUES
(1, 'Product - General', 'product', 1, 'Y', '', '2022-10-05 16:14:20', '2022-10-05 16:14:20'),
(2, 'Product - Music', 'product_music', 1, 'Y', '', '2022-10-05 16:14:20', '2022-10-05 16:14:20'),
(3, 'Document - General', 'document_general', 3, 'N', '', '2022-10-05 16:14:20', '2022-10-05 16:14:20'),
(4, 'Document - Product', 'document_product', 3, 'Y', '', '2022-10-05 16:14:20', '2022-10-05 16:14:20'),
(5, 'Product - Free Shipping', 'product_free_shipping', 1, 'Y', '', '2022-10-05 16:14:20', '2022-10-05 16:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_types_to_category`
--

CREATE TABLE IF NOT EXISTS `product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_type_layout`
--

CREATE TABLE IF NOT EXISTS `product_type_layout` (
  `configuration_id` int(11) NOT NULL,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_type_layout`
--

INSERT INTO `product_type_layout` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `product_type_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Show Model Number', 'SHOW_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 1, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(2, 'Show Weight', 'SHOW_PRODUCT_INFO_WEIGHT', '1', 'Display Weight on Product Info 0= off 1= on', 1, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(3, 'Show Attribute Weight', 'SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 1, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(4, 'Show Manufacturer', 'SHOW_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 1, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(5, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 1, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(6, 'Show Quantity in Stock', 'SHOW_PRODUCT_INFO_QUANTITY', '1', 'Display Quantity in Stock on Product Info 0= off 1= on', 1, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(7, 'Show Product Reviews Count', 'SHOW_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 1, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(8, 'Show Product Reviews Button', 'SHOW_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 1, 8, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(9, 'Show Date Available', 'SHOW_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 1, 9, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(10, 'Show Date Added', 'SHOW_PRODUCT_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 1, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(11, 'Show Product URL', 'SHOW_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 1, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(12, 'Show Product Additional Images', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 1, 13, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(13, 'Show Starting At text on Price', 'SHOW_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 1, 12, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(14, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 1, 16, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(15, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 1, 100, NULL, '2022-10-05 16:14:20', '', ''),
(16, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 1, 101, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(17, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 1, 102, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(18, 'Show Model Number', 'SHOW_PRODUCT_MUSIC_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 2, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(19, 'Show Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 2, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(20, 'Show Attribute Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 2, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(21, 'Show Artist', 'SHOW_PRODUCT_MUSIC_INFO_ARTIST', '1', 'Display Artists Name on Product Info 0= off 1= on', 2, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(22, 'Show Music Genre', 'SHOW_PRODUCT_MUSIC_INFO_GENRE', '1', 'Display Music Genre on Product Info 0= off 1= on', 2, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(23, 'Show Record Company', 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY', '1', 'Display Record Company on Product Info 0= off 1= on', 2, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(24, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 2, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(25, 'Show Quantity in Stock', 'SHOW_PRODUCT_MUSIC_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', 2, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(26, 'Show Product Reviews Count', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 2, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(27, 'Show Product Reviews Button', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 2, 8, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(28, 'Show Date Available', 'SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 2, 9, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(29, 'Show Date Added', 'SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 2, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(30, 'Show Starting At text on Price', 'SHOW_PRODUCT_MUSIC_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 2, 12, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(31, 'Show Product Additional Images', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 2, 13, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(32, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 2, 16, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(33, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 2, 100, NULL, '2022-10-05 16:14:20', '', ''),
(34, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 2, 101, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(35, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 2, 102, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(36, 'Show Product Reviews Count', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 3, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(37, 'Show Product Reviews Button', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 3, 8, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(38, 'Show Date Available', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 3, 9, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(39, 'Show Date Added', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 3, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(40, 'Show Product URL', 'SHOW_DOCUMENT_GENERAL_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 3, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(41, 'Show Product Additional Images', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 3, 13, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(42, 'Show Model Number', 'SHOW_DOCUMENT_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 4, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(43, 'Show Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 4, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(44, 'Show Attribute Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 4, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(45, 'Show Manufacturer', 'SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 4, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(46, 'Show Quantity in Shopping Cart', 'SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 4, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(47, 'Show Quantity in Stock', 'SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', 4, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(48, 'Show Product Reviews Count', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 4, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(49, 'Show Product Reviews Button', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 4, 8, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(50, 'Show Date Available', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 4, 9, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(51, 'Show Date Added', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 4, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(52, 'Show Product URL', 'SHOW_DOCUMENT_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 4, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(53, 'Show Product Additional Images', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 4, 13, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(54, 'Show Starting At text on Price', 'SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 4, 12, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(55, 'Product Free Shipping Image Status - Catalog', 'SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 4, 16, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(56, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 4, 100, NULL, '2022-10-05 16:14:20', '', ''),
(57, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 4, 101, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(58, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 4, 102, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(59, 'Show Model Number', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 5, 1, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(60, 'Show Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 5, 2, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(61, 'Show Attribute Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 5, 3, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(62, 'Show Manufacturer', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 5, 4, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(63, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 5, 5, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(64, 'Show Quantity in Stock', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY', '1', 'Display Quantity in Stock on Product Info 0= off 1= on', 5, 6, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(65, 'Show Product Reviews Count', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 5, 7, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(66, 'Show Product Reviews Button', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 5, 8, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(67, 'Show Date Available', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE', '0', 'Display Date Available on Product Info 0= off 1= on', 5, 9, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(68, 'Show Date Added', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 5, 10, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(69, 'Show Product URL', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 5, 11, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(70, 'Show Product Additional Images', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 5, 13, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(71, 'Show Starting At text on Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 5, 12, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(72, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '1', 'Show the Free Shipping image/text in the catalog?', 5, 16, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(73, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 5, 100, NULL, '2022-10-05 16:14:20', '', ''),
(74, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 5, 101, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(75, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '1', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 5, 102, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(76, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 1, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(77, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 1, 51, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(78, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 1, 52, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(79, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 1, 53, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(80, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 1, 54, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(81, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 2, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(82, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 2, 51, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(83, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 2, 52, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(84, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 2, 53, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(85, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 2, 54, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(86, 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', 3, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(87, 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', 3, 51, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(88, 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', 3, 54, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(89, 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', 4, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(90, 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', 4, 51, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(91, 'Show Metatags Title Default - Document Model', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Document Model in Meta Tags Title 0= off 1= on', 4, 52, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(92, 'Show Metatags Title Default - Document Price', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Document Price in Meta Tags Title 0= off 1= on', 4, 53, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(93, 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', 4, 54, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(94, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 5, 50, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(95, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 5, 51, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(96, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 5, 52, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(97, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 5, 53, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(98, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 5, 54, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(99, 'PRODUCT Attribute is Display Only - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 1, 200, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(100, 'PRODUCT Attribute is Free - Default', 'DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 1, 201, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(101, 'PRODUCT Attribute is Default - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 1, 202, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(102, 'PRODUCT Attribute is Discounted - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 1, 203, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(103, 'PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 1, 204, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(104, 'PRODUCT Attribute is Required - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 1, 205, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(105, 'PRODUCT Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_PRICE_PREFIX', '1', 'PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 1, 206, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(106, 'PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 1, 207, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(107, 'MUSIC Attribute is Display Only - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY', '0', 'MUSIC Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 2, 200, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(108, 'MUSIC Attribute is Free - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE', '1', 'MUSIC Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 2, 201, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(109, 'MUSIC Attribute is Default - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT', '0', 'MUSIC Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 2, 202, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(110, 'MUSIC Attribute is Discounted - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED', '1', 'MUSIC Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 2, 203, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(111, 'MUSIC Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'MUSIC Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 2, 204, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(112, 'MUSIC Attribute is Required - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED', '0', 'MUSIC Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 2, 205, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(113, 'MUSIC Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX', '1', 'MUSIC Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 2, 206, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(114, 'MUSIC Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'MUSIC Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 2, 207, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(115, 'DOCUMENT GENERAL Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT GENERAL Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 3, 200, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(116, 'DOCUMENT GENERAL Attribute is Free - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT GENERAL Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 3, 201, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(117, 'DOCUMENT GENERAL Attribute is Default - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT GENERAL Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 3, 202, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(118, 'DOCUMENT GENERAL Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT GENERAL Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 3, 203, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(119, 'DOCUMENT GENERAL Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT GENERAL Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 3, 204, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(120, 'DOCUMENT GENERAL Attribute is Required - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT GENERAL Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 3, 205, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(121, 'DOCUMENT GENERAL Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX', '1', 'DOCUMENT GENERAL Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 3, 206, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(122, 'DOCUMENT GENERAL Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT GENERAL Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 3, 207, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(123, 'DOCUMENT PRODUCT Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 4, 200, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(124, 'DOCUMENT PRODUCT Attribute is Free - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 4, 201, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(125, 'DOCUMENT PRODUCT Attribute is Default - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 4, 202, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(126, 'DOCUMENT PRODUCT Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 4, 203, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(127, 'DOCUMENT PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 4, 204, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(128, 'DOCUMENT PRODUCT Attribute is Required - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 4, 205, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(129, 'DOCUMENT PRODUCT Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 4, 206, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(130, 'DOCUMENT PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 4, 207, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(131, 'PRODUCT FREE SHIPPING Attribute is Display Only - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT FREE SHIPPING Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 5, 201, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(132, 'PRODUCT FREE SHIPPING Attribute is Free - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE', '1', 'PRODUCT FREE SHIPPING Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 5, 201, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(133, 'PRODUCT FREE SHIPPING Attribute is Default - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT', '0', 'PRODUCT FREE SHIPPING Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 5, 202, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(134, 'PRODUCT FREE SHIPPING Attribute is Discounted - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT FREE SHIPPING Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 5, 203, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(135, 'PRODUCT FREE SHIPPING Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT FREE SHIPPING Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 5, 204, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(136, 'PRODUCT FREE SHIPPING Attribute is Required - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED', '0', 'PRODUCT FREE SHIPPING Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 5, 205, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(137, 'PRODUCT FREE SHIPPING Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 5, 206, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(138, 'PRODUCT FREE SHIPPING Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 5, 207, NULL, '2022-10-05 16:14:20', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), ');

-- --------------------------------------------------------

--
-- Table structure for table `project_version`
--

CREATE TABLE IF NOT EXISTS `project_version` (
  `project_version_id` tinyint(3) NOT NULL,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking';

--
-- Dumping data for table `project_version`
--

INSERT INTO `project_version` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch1`, `project_version_patch2`, `project_version_patch1_source`, `project_version_patch2_source`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '5.0', '', '', '', '', 'Fresh Installation', '2022-10-05 16:14:20'),
(2, 'Zen-Cart Database', '1', '5.0', '', '', '', '', 'Fresh Installation', '2022-10-05 16:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `project_version_history`
--

CREATE TABLE IF NOT EXISTS `project_version_history` (
  `project_version_id` tinyint(3) NOT NULL,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking History';

--
-- Dumping data for table `project_version_history`
--

INSERT INTO `project_version_history` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '5.0', '', 'Fresh Installation', '2022-10-05 16:14:20'),
(2, 'Zen-Cart Database', '1', '5.0', '', 'Fresh Installation', '2022-10-05 16:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `query_builder`
--

CREATE TABLE IF NOT EXISTS `query_builder` (
  `query_id` int(11) NOT NULL,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores queries for re-use in Admin email and report modules';

--
-- Dumping data for table `query_builder`
--

INSERT INTO `query_builder` (`query_id`, `query_category`, `query_name`, `query_description`, `query_string`, `query_keys_list`) VALUES
(1, 'email', 'All Customers', 'Returns all customers name and email address for sending mass emails (ie: for newsletters, coupons, GVs, messages, etc).', 'select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address', ''),
(2, 'email,newsletters', 'All Newsletter Subscribers', 'Returns name and email address of newsletter subscribers', 'select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = ''1''', ''),
(3, 'email,newsletters', 'Dormant Customers (>3months) (Subscribers)', 'Subscribers who HAVE purchased something, but have NOT purchased for at least three months.', 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC', ''),
(4, 'email,newsletters', 'Active customers in past 3 months (Subscribers)', 'Newsletter subscribers who are also active customers (purchased something) in last 3 months.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = ''1'' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(5, 'email,newsletters', 'Active customers in past 3 months (Regardless of subscription status)', 'All active customers (purchased something) in last 3 months, ignoring newsletter-subscription status.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(6, 'email,newsletters', 'Administrator', 'Just the email account of the current administrator', 'select ''ADMIN'' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', ''),
(7, 'email,newsletters', 'Customers who have never completed a purchase', 'For sending newsletter to all customers who registered but have never completed a purchase', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

-- --------------------------------------------------------

--
-- Table structure for table `record_artists`
--

CREATE TABLE IF NOT EXISTS `record_artists` (
  `artists_id` int(11) NOT NULL,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `record_artists_info`
--

CREATE TABLE IF NOT EXISTS `record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `record_company`
--

CREATE TABLE IF NOT EXISTS `record_company` (
  `record_company_id` int(11) NOT NULL,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `record_company_info`
--

CREATE TABLE IF NOT EXISTS `record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `reviews_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviews_id`, `products_id`, `customers_id`, `customers_name`, `reviews_rating`, `date_added`, `last_modified`, `reviews_read`, `status`) VALUES
(1, 21, 1, 'Lorem Ipsum Dolor', 5, '2011-11-11 00:00:00', NULL, 5, 1),
(2, 22, 1, 'Lorem Ipsum Dolor', 4, '2011-10-10 00:00:00', NULL, 4, 1),
(3, 23, 1, 'Lorem Ipsum Dolor', 3, '2011-09-09 00:00:00', NULL, 3, 1),
(4, 24, 1, 'Lorem Ipsum Dolor', 2, '2011-08-08 00:00:00', NULL, 2, 1),
(5, 25, 1, 'Lorem Ipsum Dolor', 1, '2011-07-07 00:00:00', NULL, 1, 1),
(6, 26, 1, 'Lorem Ipsum Dolor', 5, '2011-06-06 00:00:00', NULL, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reviews_description`
--

CREATE TABLE IF NOT EXISTS `reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews_description`
--

INSERT INTO `reviews_description` (`reviews_id`, `languages_id`, `reviews_text`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet dui. Morbi sed mi. Duis accumsan. Etiam blandit tempus lectus. Proin mattis luctus elit. Nullam porttitor lacus euismod ligula. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur sed lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Etiam sapien ante, rutrum ac, commodo in, posuere ut, nibh. Vivamus non leo. Etiam sodales augue. Sed faucibus ligula. Pellentesque sit amet risus. Etiam imperdiet, dui et luctus mollis, nisi tortor mattis sem, vel ultricies sem purus vel nisl. Etiam eget nunc. Etiam at sem eget justo elementum eleifend.\r\n\r\nUt nec magna. Nunc vel purus. Fusce felis. Suspendisse et ligula non sem volutpat suscipit. Cras sed neque consectetuer lorem ultrices pretium. Curabitur nibh leo, sagittis ut, rhoncus vitae, ornare quis, justo. Sed vel felis eleifend nisl commodo pretium. Etiam bibendum. Quisque porta. Nunc porttitor pretium mauris. Aliquam erat volutpat. Nam dolor nunc, placerat nec, convallis nec, iaculis sit amet, libero. Nam feugiat condimentum libero. Aenean orci mauris, volutpat eget, dignissim quis, placerat sed, enim. Ut dictum mauris ut enim. Aliquam nec lorem. Pellentesque luctus. Pellentesque tempor, lorem id tempus pellentesque, felis eros consectetuer magna, vel congue lectus ante pretium nisl. Etiam non mauris. Pellentesque facilisis.'),
(2, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet dui. Morbi sed mi. Duis accumsan. Etiam blandit tempus lectus. Proin mattis luctus elit. Nullam porttitor lacus euismod ligula. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur sed lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Etiam sapien ante, rutrum ac, commodo in, posuere ut, nibh. Vivamus non leo. Etiam sodales augue. Sed faucibus ligula. Pellentesque sit amet risus. Etiam imperdiet, dui et luctus mollis, nisi tortor mattis sem, vel ultricies sem purus vel nisl. Etiam eget nunc. Etiam at sem eget justo elementum eleifend.\r\n\r\nUt nec magna. Nunc vel purus. Fusce felis. Suspendisse et ligula non sem volutpat suscipit. Cras sed neque consectetuer lorem ultrices pretium. Curabitur nibh leo, sagittis ut, rhoncus vitae, ornare quis, justo. Sed vel felis eleifend nisl commodo pretium. Etiam bibendum. Quisque porta. Nunc porttitor pretium mauris. Aliquam erat volutpat. Nam dolor nunc, placerat nec, convallis nec, iaculis sit amet, libero. Nam feugiat condimentum libero. Aenean orci mauris, volutpat eget, dignissim quis, placerat sed, enim. Ut dictum mauris ut enim. Aliquam nec lorem. Pellentesque luctus. Pellentesque tempor, lorem id tempus pellentesque, felis eros consectetuer magna, vel congue lectus ante pretium nisl. Etiam non mauris. Pellentesque facilisis.'),
(3, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet dui. Morbi sed mi. Duis accumsan. Etiam blandit tempus lectus. Proin mattis luctus elit. Nullam porttitor lacus euismod ligula. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur sed lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Etiam sapien ante, rutrum ac, commodo in, posuere ut, nibh. Vivamus non leo. Etiam sodales augue. Sed faucibus ligula. Pellentesque sit amet risus. Etiam imperdiet, dui et luctus mollis, nisi tortor mattis sem, vel ultricies sem purus vel nisl. Etiam eget nunc. Etiam at sem eget justo elementum eleifend.\r\n\r\nUt nec magna. Nunc vel purus. Fusce felis. Suspendisse et ligula non sem volutpat suscipit. Cras sed neque consectetuer lorem ultrices pretium. Curabitur nibh leo, sagittis ut, rhoncus vitae, ornare quis, justo. Sed vel felis eleifend nisl commodo pretium. Etiam bibendum. Quisque porta. Nunc porttitor pretium mauris. Aliquam erat volutpat. Nam dolor nunc, placerat nec, convallis nec, iaculis sit amet, libero. Nam feugiat condimentum libero. Aenean orci mauris, volutpat eget, dignissim quis, placerat sed, enim. Ut dictum mauris ut enim. Aliquam nec lorem. Pellentesque luctus. Pellentesque tempor, lorem id tempus pellentesque, felis eros consectetuer magna, vel congue lectus ante pretium nisl. Etiam non mauris. Pellentesque facilisis.'),
(4, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris tincidunt viverra ipsum. Mauris placerat arcu non purus. In ut tortor. Duis varius facilisis orci. Aenean in nibh non pede consequat varius. Vestibulum tempus gravida nulla. Nullam et felis. Nullam nulla. Duis felis nibh, suscipit sit amet, mollis eu, mollis id, justo. Nulla vestibulum auctor elit. Aliquam quis mi sit amet odio pretium fringilla. Nulla dictum ipsum eget lectus consectetuer consectetuer. Vivamus sit amet lacus. Vivamus lacus sapien, laoreet in, tincidunt vitae, semper sit amet, ante.\r\n\r\nCurabitur vel sem. Proin massa ligula, scelerisque a, pulvinar sit amet, varius sit amet, lectus. Sed pulvinar porta sapien. Vestibulum condimentum turpis. Etiam nunc. Aliquam eu felis quis libero imperdiet volutpat. Vivamus ut tortor. Aliquam erat volutpat. Curabitur sem risus, sollicitudin non, tempus eu, placerat vitae, sapien. Duis congue elementum erat. Quisque sit amet odio. Aliquam accumsan lorem. Proin vehicula sem rhoncus augue. Phasellus ut sem eu odio vestibulum euismod. Donec pulvinar lobortis lacus.\r\n\r\nPraesent vulputate lacus in justo. Phasellus posuere. Aenean volutpat semper urna. Fusce facilisis accumsan urna. Vestibulum nec dolor a mi fringilla venenatis. Quisque sodales urna. Curabitur pharetra auctor ligula. Maecenas suscipit vestibulum turpis. Nunc dictum mi id sem. Mauris vitae lectus. Aenean consequat. Nulla lobortis imperdiet tortor. Duis posuere purus interdum nibh. Fusce ut diam eget lacus laoreet malesuada.'),
(5, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris tincidunt viverra ipsum. Mauris placerat arcu non purus. In ut tortor. Duis varius facilisis orci. Aenean in nibh non pede consequat varius. Vestibulum tempus gravida nulla. Nullam et felis. Nullam nulla. Duis felis nibh, suscipit sit amet, mollis eu, mollis id, justo. Nulla vestibulum auctor elit. Aliquam quis mi sit amet odio pretium fringilla. Nulla dictum ipsum eget lectus consectetuer consectetuer. Vivamus sit amet lacus. Vivamus lacus sapien, laoreet in, tincidunt vitae, semper sit amet, ante.\r\n\r\nCurabitur vel sem. Proin massa ligula, scelerisque a, pulvinar sit amet, varius sit amet, lectus. Sed pulvinar porta sapien. Vestibulum condimentum turpis. Etiam nunc. Aliquam eu felis quis libero imperdiet volutpat. Vivamus ut tortor. Aliquam erat volutpat. Curabitur sem risus, sollicitudin non, tempus eu, placerat vitae, sapien. Duis congue elementum erat. Quisque sit amet odio. Aliquam accumsan lorem. Proin vehicula sem rhoncus augue. Phasellus ut sem eu odio vestibulum euismod. Donec pulvinar lobortis lacus.\r\n\r\nPraesent vulputate lacus in justo. Phasellus posuere. Aenean volutpat semper urna. Fusce facilisis accumsan urna. Vestibulum nec dolor a mi fringilla venenatis. Quisque sodales urna. Curabitur pharetra auctor ligula. Maecenas suscipit vestibulum turpis. Nunc dictum mi id sem. Mauris vitae lectus. Aenean consequat. Nulla lobortis imperdiet tortor. Duis posuere purus interdum nibh. Fusce ut diam eget lacus laoreet malesuada.'),
(6, 1, 'Praesent urna nibh, auctor sit amet, facilisis gravida, adipiscing vel, sem. Nullam metus mi, pretium in, mattis vitae, tempor quis, ligula. Etiam pulvinar tempor sapien. Proin dictum tristique felis. Nunc odio. Mauris molestie pulvinar nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Pellentesque nonummy justo quis nunc. Quisque non enim. Donec arcu orci, pulvinar eu, mattis ac, ornare ut, turpis. In hac habitasse platea dictumst. Suspendisse lacus turpis, molestie pulvinar, accumsan eu, dictum sed, pede. Sed diam diam, molestie sit amet, ultrices vel, blandit in, lectus. Nullam tempor pede sed mi. Cras consequat mauris eget nisi. Nullam ultricies libero nec lacus. Fusce sed risus.');

-- --------------------------------------------------------

--
-- Table structure for table `salemaker_sales`
--

CREATE TABLE IF NOT EXISTS `salemaker_sales` (
  `sale_id` int(11) NOT NULL,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(30) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `sesskey` varchar(64) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('s869aii17tth3lnqb21nji0vc2', 1665712619, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949774d446b344d5745775a44686d4d5459334e3251774e6d52694d54566d595749345a4467795a4751774d794937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a747a5a57786c5933526c5a46396962336838637a6f784d7a6f69593239755a6d6c6e64584a6864476c7662694937614852746246396c5a476c3062334a6663484a6c5a6d56795a57356a5a56397a6447463064584e38637a6f304f694a4f54303546496a733d),
('5545mdinnou81im40mtoap3nm5', 1665713424, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949774d446b344d5745775a44686d4d5459334e3251774e6d52694d54566d595749345a4467795a4751774d794937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a747a5a57786c5933526c5a46396962336838637a6f784d7a6f69593239755a6d6c6e64584a6864476c7662694937614852746246396c5a476c3062334a6663484a6c5a6d56795a57356a5a56397a6447463064584e38637a6f304f694a4f54303546496a74685a473170626c39705a48787a4f6a4536496a45694f32563658334e76636e526662334a6b5a584a3861546f774f324e686447566e62334a705a584e6663484a765a48566a64484e666332397964463976636d526c636e787a4f6a4536496a41694f3252706333427359586c66593246305a576476636d6c6c6331396b636d39775a473933626e78704f6a4137),
('5ncksvd1kjhc283fobg7ufitc1', 1665713967, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949355a4751795a5749344e575a694e324d7a4e5745335a6a426b59574d334d4751345a6a4d30595468684f5349375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a45304f694a32615756334c577876593246736147397a644349375932467964456c4566484d364d446f69496a746a59584a30664538364d544936496e4e6f623342776157356e51324679644349364f447037637a6f344f694a6a623235305a5735306379493759546f794f6e74704f6a4d334f3245364d547037637a6f7a4f694a7864486b694f3251364d54743961546f324f3245364d547037637a6f7a4f694a7864486b694f3251364d54743966584d364e546f6964473930595777694f3251364e444d324f334d364e6a6f69643256705a326830496a746b4f6a6b37637a6f324f694a6a59584a30535551694f334d364e546f694d444d344d6a4d694f334d364d544936496d4e76626e526c626e526664486c775a534937596a6f774f334d364d546736496d5a795a5756666332687063484270626d64666158526c6253493761546f774f334d364d6a4136496d5a795a5756666332687063484270626d6466643256705a326830496a74704f6a4137637a6f784f546f695a6e4a6c5a56397a61476c7763476c755a313977636d6c6a5a5349375a446f774f33317559585a705a32463061573975664538364d546336496d3568646d6c6e595852706232354961584e3062334a35496a6f794f6e747a4f6a5136496e4268644767694f3245364e54703761546f774f3245364e447037637a6f304f694a775957646c496a747a4f6a5536496d6c755a475634496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c6443493759546f784f6e747a4f6a5536496d4e515958526f496a747a4f6a4936496a6330496a7439637a6f304f694a7762334e30496a74684f6a41366533313961546f784f3245364e447037637a6f304f694a775957646c496a747a4f6a45794f694a77636d396b64574e3058326c755a6d38694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a4d3665334d364e546f6959314268644767694f334d364e7a6f694d56387a4d3138334e434937637a6f784d546f6963484a765a48566a64484e66615751694f334d364d546f694e694937637a6f324f694a6859335270623234694f334d364d544536496d466b5a463977636d396b64574e30496a7439637a6f304f694a7762334e30496a74684f6a41366533313961546f794f3245364e447037637a6f304f694a775957646c496a747a4f6a457a4f694a7a6147397763476c755a31396a59584a30496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c64434937637a6f774f6949694f334d364e446f696347397a6443493759546f774f6e743966576b364d7a74684f6a513665334d364e446f696347466e5a534937637a6f784e7a6f695932686c59327476645852666332687063484270626d63694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a747a4f6a413649694937637a6f304f694a7762334e30496a74684f6a41366533313961546f304f3245364e447037637a6f304f694a775957646c496a747a4f6a5536496d78765a326c75496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c64434937637a6f774f6949694f334d364e446f696347397a6443493759546f774f6e74396658317a4f6a6736496e4e755958427a61473930496a74684f6a513665334d364e446f696347466e5a534937637a6f784e7a6f695932686c59327476645852666332687063484270626d63694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a74684f6a41366533317a4f6a5136496e4276633351694f3245364d447037665831395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4449794c5445774c544530496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a6b36496a45794e7934774c6a41754d534937626d563358334279623252315933527a58326c6b58326c7558324e68636e5238637a6f784f694932496a7432595778705a4639306231396a6147566a61323931644878694f6a4537593246796446396c636e4a76636e4e38637a6f774f6949694f773d3d),
('vrmg3jeogeb3qskj41ge0l0386', 1665713523, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949314f574977595752684f545a685a4756694d7a6b314e4749314d5755315a574e6d5a44466b596a5535596949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a45314f694a4552564e4c564539514c5552555545557a4d6c45694f324e68636e524a5248787a4f6a41364969493759324679644878504f6a45794f694a7a6147397763476c755a304e68636e51694f6a633665334d364f446f69593239756447567564484d694f3245364d44703766584d364e546f6964473930595777694f326b364d44747a4f6a5936496e646c6157646f6443493761546f774f334d364d544936496d4e76626e526c626e526664486c775a534937596a6f774f334d364d546736496d5a795a5756666332687063484270626d64666158526c6253493761546f774f334d364d6a4136496d5a795a5756666332687063484270626d6466643256705a326830496a74704f6a4137637a6f784f546f695a6e4a6c5a56397a61476c7763476c755a313977636d6c6a5a53493761546f774f33317559585a705a32463061573975664538364d546336496d3568646d6c6e595852706232354961584e3062334a35496a6f794f6e747a4f6a5136496e4268644767694f3245364d54703761546f774f3245364e447037637a6f304f694a775957646c496a747a4f6a5536496d6c755a475634496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c64434937637a6f774f6949694f334d364e446f696347397a6443493759546f774f6e74396658317a4f6a6736496e4e755958427a61473930496a74684f6a4136653331395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6336496d56755a327870633267694f327868626d64315957646c633139705a48787a4f6a4536496a45694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a5734694f324e31636e4a6c626d4e3566484d364d7a6f6956564e45496a743062325268655639706333787a4f6a45774f6949794d4449794c5445774c544530496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a4536496a45694f773d3d);

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

CREATE TABLE IF NOT EXISTS `specials` (
  `specials_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specials`
--

INSERT INTO `specials` (`specials_id`, `products_id`, `specials_new_products_price`, `specials_date_added`, `specials_last_modified`, `expires_date`, `date_status_change`, `status`, `specials_date_available`) VALUES
(1, 11, '522.4000', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(2, 12, '105.4000', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(3, 13, '514.2500', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(4, 14, '743.2500', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `tax_class_title`, `tax_class_description`, `last_modified`, `date_added`) VALUES
(1, 'Taxable Goods', 'The following types of products are included: non-food, services, etc', NULL, '2022-10-05 16:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE IF NOT EXISTS `tax_rates` (
  `tax_rates_id` int(11) NOT NULL,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`tax_rates_id`, `tax_zone_id`, `tax_class_id`, `tax_priority`, `tax_rate`, `tax_description`, `last_modified`, `date_added`) VALUES
(1, 1, 1, 1, '7.0000', 'FL TAX 7.0%', '2022-10-05 16:14:20', '2022-10-05 16:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `template_select`
--

CREATE TABLE IF NOT EXISTS `template_select` (
  `template_id` int(11) NOT NULL,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template_select`
--

INSERT INTO `template_select` (`template_id`, `template_dir`, `template_language`) VALUES
(1, 'theme600', '0');

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_exceptions`
--

CREATE TABLE IF NOT EXISTS `upgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL,
  `sql_file` varchar(50) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `errordate` datetime DEFAULT '0001-01-01 00:00:00',
  `sqlstatement` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `whos_online`
--

CREATE TABLE IF NOT EXISTS `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(128) NOT NULL DEFAULT '',
  `ip_address` varchar(20) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `whos_online`
--

INSERT INTO `whos_online` (`customer_id`, `full_name`, `session_id`, `ip_address`, `time_entry`, `time_last_click`, `last_page_url`, `host_address`, `user_agent`) VALUES
(0, '&yen;Guest', 'vrmg3jeogeb3qskj41ge0l0386', '1', '1665712083', '1665712083', '/site1/', 'DESKTOP-DTPE32Q', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36'),
(0, '&yen;Guest', '5ncksvd1kjhc283fobg7ufitc1', '127.0.0.1', '1665711622', '1665712527', '/site1/index.php?main_page=login', 'view-localhost', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE IF NOT EXISTS `zones` (
  `zone_id` int(11) NOT NULL,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES
(1, 223, 'AL', 'Alabama'),
(2, 223, 'AK', 'Alaska'),
(3, 223, 'AS', 'American Samoa'),
(4, 223, 'AZ', 'Arizona'),
(5, 223, 'AR', 'Arkansas'),
(7, 223, 'AA', 'Armed Forces Americas'),
(9, 223, 'AE', 'Armed Forces Europe'),
(11, 223, 'AP', 'Armed Forces Pacific'),
(12, 223, 'CA', 'California'),
(13, 223, 'CO', 'Colorado'),
(14, 223, 'CT', 'Connecticut'),
(15, 223, 'DE', 'Delaware'),
(16, 223, 'DC', 'District of Columbia'),
(17, 223, 'FM', 'Federated States Of Micronesia'),
(18, 223, 'FL', 'Florida'),
(19, 223, 'GA', 'Georgia'),
(20, 223, 'GU', 'Guam'),
(21, 223, 'HI', 'Hawaii'),
(22, 223, 'ID', 'Idaho'),
(23, 223, 'IL', 'Illinois'),
(24, 223, 'IN', 'Indiana'),
(25, 223, 'IA', 'Iowa'),
(26, 223, 'KS', 'Kansas'),
(27, 223, 'KY', 'Kentucky'),
(28, 223, 'LA', 'Louisiana'),
(29, 223, 'ME', 'Maine'),
(30, 223, 'MH', 'Marshall Islands'),
(31, 223, 'MD', 'Maryland'),
(32, 223, 'MA', 'Massachusetts'),
(33, 223, 'MI', 'Michigan'),
(34, 223, 'MN', 'Minnesota'),
(35, 223, 'MS', 'Mississippi'),
(36, 223, 'MO', 'Missouri'),
(37, 223, 'MT', 'Montana'),
(38, 223, 'NE', 'Nebraska'),
(39, 223, 'NV', 'Nevada'),
(40, 223, 'NH', 'New Hampshire'),
(41, 223, 'NJ', 'New Jersey'),
(42, 223, 'NM', 'New Mexico'),
(43, 223, 'NY', 'New York'),
(44, 223, 'NC', 'North Carolina'),
(45, 223, 'ND', 'North Dakota'),
(46, 223, 'MP', 'Northern Mariana Islands'),
(47, 223, 'OH', 'Ohio'),
(48, 223, 'OK', 'Oklahoma'),
(49, 223, 'OR', 'Oregon'),
(50, 163, 'PW', 'Palau'),
(51, 223, 'PA', 'Pennsylvania'),
(52, 223, 'PR', 'Puerto Rico'),
(53, 223, 'RI', 'Rhode Island'),
(54, 223, 'SC', 'South Carolina'),
(55, 223, 'SD', 'South Dakota'),
(56, 223, 'TN', 'Tennessee'),
(57, 223, 'TX', 'Texas'),
(58, 223, 'UT', 'Utah'),
(59, 223, 'VT', 'Vermont'),
(60, 223, 'VI', 'Virgin Islands'),
(61, 223, 'VA', 'Virginia'),
(62, 223, 'WA', 'Washington'),
(63, 223, 'WV', 'West Virginia'),
(64, 223, 'WI', 'Wisconsin'),
(65, 223, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NL', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 81, 'NDS', 'Niedersachsen'),
(80, 81, 'BAW', 'Baden Württemberg'),
(81, 81, 'BAY', 'Bayern'),
(82, 81, 'BER', 'Berlin'),
(83, 81, 'BRG', 'Brandenburg'),
(84, 81, 'BRE', 'Bremen'),
(85, 81, 'HAM', 'Hamburg'),
(86, 81, 'HES', 'Hessen'),
(87, 81, 'MEC', 'Mecklenburg-Vorpommern'),
(88, 81, 'NRW', 'Nordrhein-Westfalen'),
(89, 81, 'RHE', 'Rheinland-Pfalz'),
(90, 81, 'SAR', 'Saarland'),
(91, 81, 'SAS', 'Sachsen'),
(92, 81, 'SAC', 'Sachsen-Anhalt'),
(93, 81, 'SCN', 'Schleswig-Holstein'),
(94, 81, 'THE', 'Thüringen'),
(95, 14, 'WI', 'Wien'),
(96, 14, 'NO', 'Niederösterreich'),
(97, 14, 'OO', 'Oberösterreich'),
(98, 14, 'SB', 'Salzburg'),
(99, 14, 'KN', 'Kärnten'),
(100, 14, 'ST', 'Steiermark'),
(101, 14, 'TI', 'Tirol'),
(102, 14, 'BL', 'Burgenland'),
(103, 14, 'VB', 'Voralberg'),
(104, 204, 'AG', 'Aargau'),
(105, 204, 'AI', 'Appenzell Innerrhoden'),
(106, 204, 'AR', 'Appenzell Ausserrhoden'),
(107, 204, 'BE', 'Bern'),
(108, 204, 'BL', 'Basel-Landschaft'),
(109, 204, 'BS', 'Basel-Stadt'),
(110, 204, 'FR', 'Freiburg'),
(111, 204, 'GE', 'Genf'),
(112, 204, 'GL', 'Glarus'),
(113, 204, 'JU', 'Graubnden'),
(114, 204, 'JU', 'Jura'),
(115, 204, 'LU', 'Luzern'),
(116, 204, 'NE', 'Neuenburg'),
(117, 204, 'NW', 'Nidwalden'),
(118, 204, 'OW', 'Obwalden'),
(119, 204, 'SG', 'St. Gallen'),
(120, 204, 'SH', 'Schaffhausen'),
(121, 204, 'SO', 'Solothurn'),
(122, 204, 'SZ', 'Schwyz'),
(123, 204, 'TG', 'Thurgau'),
(124, 204, 'TI', 'Tessin'),
(125, 204, 'UR', 'Uri'),
(126, 204, 'VD', 'Waadt'),
(127, 204, 'VS', 'Wallis'),
(128, 204, 'ZG', 'Zug'),
(129, 204, 'ZH', 'Zürich'),
(130, 195, 'A Coruña', 'A Coruña'),
(131, 195, 'Álava', 'Álava'),
(132, 195, 'Albacete', 'Albacete'),
(133, 195, 'Alicante', 'Alicante'),
(134, 195, 'Almería', 'Almería'),
(135, 195, 'Asturias', 'Asturias'),
(136, 195, 'Ávila', 'Ávila'),
(137, 195, 'Badajoz', 'Badajoz'),
(138, 195, 'Baleares', 'Baleares'),
(139, 195, 'Barcelona', 'Barcelona'),
(140, 195, 'Burgos', 'Burgos'),
(141, 195, 'Cáceres', 'Cáceres'),
(142, 195, 'Cádiz', 'Cádiz'),
(143, 195, 'Cantabria', 'Cantabria'),
(144, 195, 'Castellón', 'Castellón'),
(145, 195, 'Ceuta', 'Ceuta'),
(146, 195, 'Ciudad Real', 'Ciudad Real'),
(147, 195, 'Córdoba', 'Córdoba'),
(148, 195, 'Cuenca', 'Cuenca'),
(149, 195, 'Girona', 'Girona'),
(150, 195, 'Granada', 'Granada'),
(151, 195, 'Guadalajara', 'Guadalajara'),
(152, 195, 'Guipúzcoa', 'Guipúzcoa'),
(153, 195, 'Huelva', 'Huelva'),
(154, 195, 'Huesca', 'Huesca'),
(155, 195, 'Jaén', 'Jaén'),
(156, 195, 'La Rioja', 'La Rioja'),
(157, 195, 'Las Palmas', 'Las Palmas'),
(158, 195, 'León', 'León'),
(159, 195, 'Lérida', 'Lérida'),
(160, 195, 'Lugo', 'Lugo'),
(161, 195, 'Madrid', 'Madrid'),
(162, 195, 'Málaga', 'Málaga'),
(163, 195, 'Melilla', 'Melilla'),
(164, 195, 'Murcia', 'Murcia'),
(165, 195, 'Navarra', 'Navarra'),
(166, 195, 'Ourense', 'Ourense'),
(167, 195, 'Palencia', 'Palencia'),
(168, 195, 'Pontevedra', 'Pontevedra'),
(169, 195, 'Salamanca', 'Salamanca'),
(170, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 195, 'Segovia', 'Segovia'),
(172, 195, 'Sevilla', 'Sevilla'),
(173, 195, 'Soria', 'Soria'),
(174, 195, 'Tarragona', 'Tarragona'),
(175, 195, 'Teruel', 'Teruel'),
(176, 195, 'Toledo', 'Toledo'),
(177, 195, 'Valencia', 'Valencia'),
(178, 195, 'Valladolid', 'Valladolid'),
(179, 195, 'Vizcaya', 'Vizcaya'),
(180, 195, 'Zamora', 'Zamora'),
(181, 195, 'Zaragoza', 'Zaragoza'),
(182, 13, 'ACT', 'Australian Capital Territory'),
(183, 13, 'NSW', 'New South Wales'),
(184, 13, 'NT', 'Northern Territory'),
(185, 13, 'QLD', 'Queensland'),
(186, 13, 'SA', 'South Australia'),
(187, 13, 'TAS', 'Tasmania'),
(188, 13, 'VIC', 'Victoria'),
(189, 13, 'WA', 'Western Australia'),
(190, 105, 'AG', 'Agrigento'),
(191, 105, 'AL', 'Alessandria'),
(192, 105, 'AN', 'Ancona'),
(193, 105, 'AO', 'Aosta'),
(194, 105, 'AR', 'Arezzo'),
(195, 105, 'AP', 'Ascoli Piceno'),
(196, 105, 'AT', 'Asti'),
(197, 105, 'AV', 'Avellino'),
(198, 105, 'BA', 'Bari'),
(199, 105, 'BT', 'Barletta Andria Trani'),
(200, 105, 'BL', 'Belluno'),
(201, 105, 'BN', 'Benevento'),
(202, 105, 'BG', 'Bergamo'),
(203, 105, 'BI', 'Biella'),
(204, 105, 'BO', 'Bologna'),
(205, 105, 'BZ', 'Bolzano'),
(206, 105, 'BS', 'Brescia'),
(207, 105, 'BR', 'Brindisi'),
(208, 105, 'CA', 'Cagliari'),
(209, 105, 'CL', 'Caltanissetta'),
(210, 105, 'CB', 'Campobasso'),
(211, 105, 'CI', 'Carbonia-Iglesias'),
(212, 105, 'CE', 'Caserta'),
(213, 105, 'CT', 'Catania'),
(214, 105, 'CZ', 'Catanzaro'),
(215, 105, 'CH', 'Chieti'),
(216, 105, 'CO', 'Como'),
(217, 105, 'CS', 'Cosenza'),
(218, 105, 'CR', 'Cremona'),
(219, 105, 'KR', 'Crotone'),
(220, 105, 'CN', 'Cuneo'),
(221, 105, 'EN', 'Enna'),
(222, 105, 'FM', 'Fermo'),
(223, 105, 'FE', 'Ferrara'),
(224, 105, 'FI', 'Firenze'),
(225, 105, 'FG', 'Foggia'),
(226, 105, 'FC', 'Forlì Cesena'),
(227, 105, 'FR', 'Frosinone'),
(228, 105, 'GE', 'Genova'),
(229, 105, 'GO', 'Gorizia'),
(230, 105, 'GR', 'Grosseto'),
(231, 105, 'IM', 'Imperia'),
(232, 105, 'IS', 'Isernia'),
(233, 105, 'AQ', 'Aquila'),
(234, 105, 'SP', 'La Spezia'),
(235, 105, 'LT', 'Latina'),
(236, 105, 'LE', 'Lecce'),
(237, 105, 'LC', 'Lecco'),
(238, 105, 'LI', 'Livorno'),
(239, 105, 'LO', 'Lodi'),
(240, 105, 'LU', 'Lucca'),
(241, 105, 'MC', 'Macerata'),
(242, 105, 'MN', 'Mantova'),
(243, 105, 'MS', 'Massa Carrara'),
(244, 105, 'MT', 'Matera'),
(245, 105, 'VS', 'Medio Campidano'),
(246, 105, 'ME', 'Messina'),
(247, 105, 'MI', 'Milano'),
(248, 105, 'MO', 'Modena'),
(249, 105, 'MB', 'Monza e Brianza'),
(250, 105, 'NA', 'Napoli'),
(251, 105, 'NO', 'Novara'),
(252, 105, 'NU', 'Nuoro'),
(253, 105, 'OG', 'Ogliastra'),
(254, 105, 'OT', 'Olbia-Tempio'),
(255, 105, 'OR', 'Oristano'),
(256, 105, 'PD', 'Padova'),
(257, 105, 'PA', 'Palermo'),
(258, 105, 'PR', 'Parma'),
(259, 105, 'PG', 'Perugia'),
(260, 105, 'PV', 'Pavia'),
(261, 105, 'PU', 'Pesaro Urbino'),
(262, 105, 'PE', 'Pescara'),
(263, 105, 'PC', 'Piacenza'),
(264, 105, 'PI', 'Pisa'),
(265, 105, 'PT', 'Pistoia'),
(266, 105, 'PN', 'Pordenone'),
(267, 105, 'PZ', 'Potenza'),
(268, 105, 'PO', 'Prato'),
(269, 105, 'RG', 'Ragusa'),
(270, 105, 'RA', 'Ravenna'),
(271, 105, 'RC', 'Reggio Calabria'),
(272, 105, 'RE', 'Reggio Emilia'),
(273, 105, 'RI', 'Rieti'),
(274, 105, 'RN', 'Rimini'),
(275, 105, 'RM', 'Roma'),
(276, 105, 'RO', 'Rovigo'),
(277, 105, 'SA', 'Salerno'),
(278, 105, 'SS', 'Sassari'),
(279, 105, 'SV', 'Savona'),
(280, 105, 'SI', 'Siena'),
(281, 105, 'SR', 'Siracusa'),
(282, 105, 'SO', 'Sondrio'),
(283, 105, 'TA', 'Taranto'),
(284, 105, 'TE', 'Teramo'),
(285, 105, 'TR', 'Terni'),
(286, 105, 'TO', 'Torino'),
(287, 105, 'TP', 'Trapani'),
(288, 105, 'TN', 'Trento'),
(289, 105, 'TV', 'Treviso'),
(290, 105, 'TS', 'Trieste'),
(291, 105, 'UD', 'Udine'),
(292, 105, 'VA', 'Varese'),
(293, 105, 'VE', 'Venezia'),
(294, 105, 'VB', 'Verbania'),
(295, 105, 'VC', 'Vercelli'),
(296, 105, 'VR', 'Verona'),
(297, 105, 'VV', 'Vibo Valentia'),
(298, 105, 'VI', 'Vicenza'),
(299, 105, 'VT', 'Viterbo');

-- --------------------------------------------------------

--
-- Table structure for table `zones_to_geo_zones`
--

CREATE TABLE IF NOT EXISTS `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones_to_geo_zones`
--

INSERT INTO `zones_to_geo_zones` (`association_id`, `zone_country_id`, `zone_id`, `geo_zone_id`, `last_modified`, `date_added`) VALUES
(1, 223, 18, 1, NULL, '2022-10-05 16:14:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_book`
--
ALTER TABLE `address_book`
  ADD PRIMARY KEY (`address_book_id`), ADD KEY `idx_address_book_customers_id_zen` (`customers_id`);

--
-- Indexes for table `address_format`
--
ALTER TABLE `address_format`
  ADD PRIMARY KEY (`address_format_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`), ADD KEY `idx_admin_name_zen` (`admin_name`), ADD KEY `idx_admin_email_zen` (`admin_email`), ADD KEY `idx_admin_profile_zen` (`admin_profile`);

--
-- Indexes for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  ADD PRIMARY KEY (`log_id`), ADD KEY `idx_page_accessed_zen` (`page_accessed`), ADD KEY `idx_access_date_zen` (`access_date`), ADD KEY `idx_flagged_zen` (`flagged`), ADD KEY `idx_ip_zen` (`ip_address`);

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD UNIQUE KEY `menu_key` (`menu_key`);

--
-- Indexes for table `admin_pages`
--
ALTER TABLE `admin_pages`
  ADD UNIQUE KEY `page_key` (`page_key`);

--
-- Indexes for table `admin_pages_to_profiles`
--
ALTER TABLE `admin_pages_to_profiles`
  ADD UNIQUE KEY `profile_page` (`profile_id`,`page_key`), ADD UNIQUE KEY `page_profile` (`page_key`,`profile_id`);

--
-- Indexes for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `authorizenet`
--
ALTER TABLE `authorizenet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`banners_id`), ADD KEY `idx_status_group_zen` (`status`,`banners_group`), ADD KEY `idx_expires_date_zen` (`expires_date`), ADD KEY `idx_date_scheduled_zen` (`date_scheduled`);

--
-- Indexes for table `banners_history`
--
ALTER TABLE `banners_history`
  ADD PRIMARY KEY (`banners_history_id`), ADD KEY `idx_banners_id_zen` (`banners_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`), ADD KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`), ADD KEY `idx_status_zen` (`categories_status`), ADD KEY `idx_sort_order_zen` (`sort_order`);

--
-- Indexes for table `categories_description`
--
ALTER TABLE `categories_description`
  ADD PRIMARY KEY (`categories_id`,`language_id`), ADD KEY `idx_categories_name_zen` (`categories_name`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`configuration_id`), ADD UNIQUE KEY `unq_config_key_zen` (`configuration_key`), ADD KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)), ADD KEY `idx_cfg_grp_id_zen` (`configuration_group_id`);

--
-- Indexes for table `configuration_group`
--
ALTER TABLE `configuration_group`
  ADD PRIMARY KEY (`configuration_group_id`), ADD KEY `idx_visible_zen` (`visible`);

--
-- Indexes for table `counter_history`
--
ALTER TABLE `counter_history`
  ADD PRIMARY KEY (`startdate`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countries_id`), ADD KEY `idx_countries_name_zen` (`countries_name`), ADD KEY `idx_address_format_id_zen` (`address_format_id`), ADD KEY `idx_iso_2_zen` (`countries_iso_code_2`), ADD KEY `idx_iso_3_zen` (`countries_iso_code_3`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`), ADD KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`), ADD KEY `idx_coupon_code_zen` (`coupon_code`), ADD KEY `idx_coupon_type_zen` (`coupon_type`);

--
-- Indexes for table `coupons_description`
--
ALTER TABLE `coupons_description`
  ADD PRIMARY KEY (`coupon_id`,`language_id`);

--
-- Indexes for table `coupon_email_track`
--
ALTER TABLE `coupon_email_track`
  ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_coupon_id_zen` (`coupon_id`);

--
-- Indexes for table `coupon_gv_customer`
--
ALTER TABLE `coupon_gv_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `coupon_gv_queue`
--
ALTER TABLE `coupon_gv_queue`
  ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`), ADD KEY `idx_release_flag_zen` (`release_flag`);

--
-- Indexes for table `coupon_redeem_track`
--
ALTER TABLE `coupon_redeem_track`
  ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_coupon_id_zen` (`coupon_id`);

--
-- Indexes for table `coupon_restrict`
--
ALTER TABLE `coupon_restrict`
  ADD PRIMARY KEY (`restrict_id`), ADD KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`currencies_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customers_id`), ADD KEY `idx_email_address_zen` (`customers_email_address`), ADD KEY `idx_referral_zen` (`customers_referral`(10)), ADD KEY `idx_grp_pricing_zen` (`customers_group_pricing`), ADD KEY `idx_nick_zen` (`customers_nick`), ADD KEY `idx_newsletter_zen` (`customers_newsletter`);

--
-- Indexes for table `customers_basket`
--
ALTER TABLE `customers_basket`
  ADD PRIMARY KEY (`customers_basket_id`), ADD KEY `idx_customers_id_zen` (`customers_id`);

--
-- Indexes for table `customers_basket_attributes`
--
ALTER TABLE `customers_basket_attributes`
  ADD PRIMARY KEY (`customers_basket_attributes_id`), ADD KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36));

--
-- Indexes for table `customers_info`
--
ALTER TABLE `customers_info`
  ADD PRIMARY KEY (`customers_info_id`);

--
-- Indexes for table `db_cache`
--
ALTER TABLE `db_cache`
  ADD PRIMARY KEY (`cache_entry_name`);

--
-- Indexes for table `email_archive`
--
ALTER TABLE `email_archive`
  ADD PRIMARY KEY (`archive_id`), ADD KEY `idx_email_to_address_zen` (`email_to_address`), ADD KEY `idx_module_zen` (`module`);

--
-- Indexes for table `ezpages`
--
ALTER TABLE `ezpages`
  ADD PRIMARY KEY (`pages_id`), ADD KEY `idx_lang_id_zen` (`languages_id`), ADD KEY `idx_ezp_status_header_zen` (`status_header`), ADD KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`), ADD KEY `idx_ezp_status_footer_zen` (`status_footer`), ADD KEY `idx_ezp_status_toc_zen` (`status_toc`);

--
-- Indexes for table `featured`
--
ALTER TABLE `featured`
  ADD PRIMARY KEY (`featured_id`), ADD KEY `idx_status_zen` (`status`), ADD KEY `idx_products_id_zen` (`products_id`), ADD KEY `idx_date_avail_zen` (`featured_date_available`), ADD KEY `idx_expires_date_zen` (`expires_date`);

--
-- Indexes for table `files_uploaded`
--
ALTER TABLE `files_uploaded`
  ADD PRIMARY KEY (`files_uploaded_id`), ADD KEY `idx_customers_id_zen` (`customers_id`);

--
-- Indexes for table `geo_zones`
--
ALTER TABLE `geo_zones`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `get_terms_to_filter`
--
ALTER TABLE `get_terms_to_filter`
  ADD PRIMARY KEY (`get_term_name`);

--
-- Indexes for table `group_pricing`
--
ALTER TABLE `group_pricing`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`languages_id`), ADD KEY `idx_languages_name_zen` (`name`);

--
-- Indexes for table `layout_boxes`
--
ALTER TABLE `layout_boxes`
  ADD PRIMARY KEY (`layout_id`), ADD KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`), ADD KEY `idx_layout_box_status_zen` (`layout_box_status`), ADD KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturers_id`), ADD KEY `idx_mfg_name_zen` (`manufacturers_name`);

--
-- Indexes for table `manufacturers_info`
--
ALTER TABLE `manufacturers_info`
  ADD PRIMARY KEY (`manufacturers_id`,`languages_id`);

--
-- Indexes for table `media_clips`
--
ALTER TABLE `media_clips`
  ADD PRIMARY KEY (`clip_id`), ADD KEY `idx_media_id_zen` (`media_id`), ADD KEY `idx_clip_type_zen` (`clip_type`);

--
-- Indexes for table `media_manager`
--
ALTER TABLE `media_manager`
  ADD PRIMARY KEY (`media_id`), ADD KEY `idx_media_name_zen` (`media_name`);

--
-- Indexes for table `media_to_products`
--
ALTER TABLE `media_to_products`
  ADD KEY `idx_media_product_zen` (`media_id`,`product_id`);

--
-- Indexes for table `media_types`
--
ALTER TABLE `media_types`
  ADD PRIMARY KEY (`type_id`), ADD KEY `idx_type_name_zen` (`type_name`);

--
-- Indexes for table `meta_tags_categories_description`
--
ALTER TABLE `meta_tags_categories_description`
  ADD PRIMARY KEY (`categories_id`,`language_id`);

--
-- Indexes for table `meta_tags_products_description`
--
ALTER TABLE `meta_tags_products_description`
  ADD PRIMARY KEY (`products_id`,`language_id`);

--
-- Indexes for table `music_genre`
--
ALTER TABLE `music_genre`
  ADD PRIMARY KEY (`music_genre_id`), ADD KEY `idx_music_genre_name_zen` (`music_genre_name`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`newsletters_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`), ADD KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`), ADD KEY `idx_date_purchased_zen` (`date_purchased`), ADD KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`orders_products_id`), ADD KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`), ADD KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`);

--
-- Indexes for table `orders_products_attributes`
--
ALTER TABLE `orders_products_attributes`
  ADD PRIMARY KEY (`orders_products_attributes_id`), ADD KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`);

--
-- Indexes for table `orders_products_download`
--
ALTER TABLE `orders_products_download`
  ADD PRIMARY KEY (`orders_products_download_id`), ADD KEY `idx_orders_id_zen` (`orders_id`), ADD KEY `idx_orders_products_id_zen` (`orders_products_id`);

--
-- Indexes for table `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`orders_status_id`,`language_id`), ADD KEY `idx_orders_status_name_zen` (`orders_status_name`);

--
-- Indexes for table `orders_status_history`
--
ALTER TABLE `orders_status_history`
  ADD PRIMARY KEY (`orders_status_history_id`), ADD KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`);

--
-- Indexes for table `orders_total`
--
ALTER TABLE `orders_total`
  ADD PRIMARY KEY (`orders_total_id`), ADD KEY `idx_ot_orders_id_zen` (`orders_id`), ADD KEY `idx_ot_class_zen` (`class`);

--
-- Indexes for table `paypal`
--
ALTER TABLE `paypal`
  ADD PRIMARY KEY (`paypal_ipn_id`,`txn_id`), ADD KEY `idx_order_id_zen` (`order_id`);

--
-- Indexes for table `paypal_payment_status`
--
ALTER TABLE `paypal_payment_status`
  ADD PRIMARY KEY (`payment_status_id`);

--
-- Indexes for table `paypal_payment_status_history`
--
ALTER TABLE `paypal_payment_status_history`
  ADD PRIMARY KEY (`payment_status_history_id`), ADD KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`);

--
-- Indexes for table `paypal_session`
--
ALTER TABLE `paypal_session`
  ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_session_id_zen` (`session_id`(36));

--
-- Indexes for table `paypal_testing`
--
ALTER TABLE `paypal_testing`
  ADD PRIMARY KEY (`paypal_ipn_id`,`txn_id`), ADD KEY `idx_order_id_zen` (`order_id`);

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`p_id`), ADD KEY `p_status` (`p_status`), ADD KEY `p_show_cust` (`p_show_cust`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`o_id`), ADD KEY `o_poll_id` (`o_poll_id`);

--
-- Indexes for table `poll_results`
--
ALTER TABLE `poll_results`
  ADD PRIMARY KEY (`r_id`), ADD KEY `r_poll_id` (`r_poll_id`), ADD KEY `r_ip` (`r_ip`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_id`), ADD KEY `idx_products_date_added_zen` (`products_date_added`), ADD KEY `idx_products_status_zen` (`products_status`), ADD KEY `idx_products_date_available_zen` (`products_date_available`), ADD KEY `idx_products_ordered_zen` (`products_ordered`), ADD KEY `idx_products_model_zen` (`products_model`), ADD KEY `idx_products_price_sorter_zen` (`products_price_sorter`), ADD KEY `idx_master_categories_id_zen` (`master_categories_id`), ADD KEY `idx_products_sort_order_zen` (`products_sort_order`), ADD KEY `idx_manufacturers_id_zen` (`manufacturers_id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`products_attributes_id`), ADD KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`), ADD KEY `idx_opt_sort_order_zen` (`products_options_sort_order`);

--
-- Indexes for table `products_attributes_download`
--
ALTER TABLE `products_attributes_download`
  ADD PRIMARY KEY (`products_attributes_id`);

--
-- Indexes for table `products_description`
--
ALTER TABLE `products_description`
  ADD PRIMARY KEY (`products_id`,`language_id`), ADD KEY `idx_products_name_zen` (`products_name`);

--
-- Indexes for table `products_discount_quantity`
--
ALTER TABLE `products_discount_quantity`
  ADD KEY `idx_id_qty_zen` (`products_id`,`discount_qty`);

--
-- Indexes for table `products_notifications`
--
ALTER TABLE `products_notifications`
  ADD PRIMARY KEY (`products_id`,`customers_id`);

--
-- Indexes for table `products_options`
--
ALTER TABLE `products_options`
  ADD PRIMARY KEY (`products_options_id`,`language_id`), ADD KEY `idx_lang_id_zen` (`language_id`), ADD KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`), ADD KEY `idx_products_options_name_zen` (`products_options_name`);

--
-- Indexes for table `products_options_types`
--
ALTER TABLE `products_options_types`
  ADD PRIMARY KEY (`products_options_types_id`);

--
-- Indexes for table `products_options_values`
--
ALTER TABLE `products_options_values`
  ADD PRIMARY KEY (`products_options_values_id`,`language_id`), ADD KEY `idx_products_options_values_name_zen` (`products_options_values_name`), ADD KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`);

--
-- Indexes for table `products_options_values_to_products_options`
--
ALTER TABLE `products_options_values_to_products_options`
  ADD PRIMARY KEY (`products_options_values_to_products_options_id`), ADD KEY `idx_products_options_id_zen` (`products_options_id`), ADD KEY `idx_products_options_values_id_zen` (`products_options_values_id`);

--
-- Indexes for table `products_to_categories`
--
ALTER TABLE `products_to_categories`
  ADD PRIMARY KEY (`products_id`,`categories_id`), ADD KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`);

--
-- Indexes for table `product_music_extra`
--
ALTER TABLE `product_music_extra`
  ADD PRIMARY KEY (`products_id`), ADD KEY `idx_music_genre_id_zen` (`music_genre_id`), ADD KEY `idx_artists_id_zen` (`artists_id`), ADD KEY `idx_record_company_id_zen` (`record_company_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`type_id`), ADD KEY `idx_type_master_type_zen` (`type_master_type`);

--
-- Indexes for table `product_types_to_category`
--
ALTER TABLE `product_types_to_category`
  ADD KEY `idx_category_id_zen` (`category_id`), ADD KEY `idx_product_type_id_zen` (`product_type_id`);

--
-- Indexes for table `product_type_layout`
--
ALTER TABLE `product_type_layout`
  ADD PRIMARY KEY (`configuration_id`), ADD UNIQUE KEY `unq_config_key_zen` (`configuration_key`), ADD KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)), ADD KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`);

--
-- Indexes for table `project_version`
--
ALTER TABLE `project_version`
  ADD PRIMARY KEY (`project_version_id`), ADD UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`);

--
-- Indexes for table `project_version_history`
--
ALTER TABLE `project_version_history`
  ADD PRIMARY KEY (`project_version_id`);

--
-- Indexes for table `query_builder`
--
ALTER TABLE `query_builder`
  ADD PRIMARY KEY (`query_id`), ADD UNIQUE KEY `query_name` (`query_name`);

--
-- Indexes for table `record_artists`
--
ALTER TABLE `record_artists`
  ADD PRIMARY KEY (`artists_id`), ADD KEY `idx_rec_artists_name_zen` (`artists_name`);

--
-- Indexes for table `record_artists_info`
--
ALTER TABLE `record_artists_info`
  ADD PRIMARY KEY (`artists_id`,`languages_id`);

--
-- Indexes for table `record_company`
--
ALTER TABLE `record_company`
  ADD PRIMARY KEY (`record_company_id`), ADD KEY `idx_rec_company_name_zen` (`record_company_name`);

--
-- Indexes for table `record_company_info`
--
ALTER TABLE `record_company_info`
  ADD PRIMARY KEY (`record_company_id`,`languages_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviews_id`), ADD KEY `idx_products_id_zen` (`products_id`), ADD KEY `idx_customers_id_zen` (`customers_id`), ADD KEY `idx_status_zen` (`status`), ADD KEY `idx_date_added_zen` (`date_added`);

--
-- Indexes for table `reviews_description`
--
ALTER TABLE `reviews_description`
  ADD PRIMARY KEY (`reviews_id`,`languages_id`);

--
-- Indexes for table `salemaker_sales`
--
ALTER TABLE `salemaker_sales`
  ADD PRIMARY KEY (`sale_id`), ADD KEY `idx_sale_status_zen` (`sale_status`), ADD KEY `idx_sale_date_start_zen` (`sale_date_start`), ADD KEY `idx_sale_date_end_zen` (`sale_date_end`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sesskey`);

--
-- Indexes for table `specials`
--
ALTER TABLE `specials`
  ADD PRIMARY KEY (`specials_id`), ADD KEY `idx_status_zen` (`status`), ADD KEY `idx_products_id_zen` (`products_id`), ADD KEY `idx_date_avail_zen` (`specials_date_available`), ADD KEY `idx_expires_date_zen` (`expires_date`);

--
-- Indexes for table `tax_class`
--
ALTER TABLE `tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`tax_rates_id`), ADD KEY `idx_tax_zone_id_zen` (`tax_zone_id`), ADD KEY `idx_tax_class_id_zen` (`tax_class_id`);

--
-- Indexes for table `template_select`
--
ALTER TABLE `template_select`
  ADD PRIMARY KEY (`template_id`), ADD KEY `idx_tpl_lang_zen` (`template_language`);

--
-- Indexes for table `upgrade_exceptions`
--
ALTER TABLE `upgrade_exceptions`
  ADD PRIMARY KEY (`upgrade_exception_id`);

--
-- Indexes for table `whos_online`
--
ALTER TABLE `whos_online`
  ADD KEY `idx_ip_address_zen` (`ip_address`), ADD KEY `idx_session_id_zen` (`session_id`), ADD KEY `idx_customer_id_zen` (`customer_id`), ADD KEY `idx_time_entry_zen` (`time_entry`), ADD KEY `idx_time_last_click_zen` (`time_last_click`), ADD KEY `idx_last_page_url_zen` (`last_page_url`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zone_id`), ADD KEY `idx_zone_country_id_zen` (`zone_country_id`), ADD KEY `idx_zone_code_zen` (`zone_code`);

--
-- Indexes for table `zones_to_geo_zones`
--
ALTER TABLE `zones_to_geo_zones`
  ADD PRIMARY KEY (`association_id`), ADD KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_book`
--
ALTER TABLE `address_book`
  MODIFY `address_book_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `address_format`
--
ALTER TABLE `address_format`
  MODIFY `address_format_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  MODIFY `log_id` bigint(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `authorizenet`
--
ALTER TABLE `authorizenet`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `banners_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `banners_history`
--
ALTER TABLE `banners_history`
  MODIFY `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `configuration_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=580;
--
-- AUTO_INCREMENT for table `configuration_group`
--
ALTER TABLE `configuration_group`
  MODIFY `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `countries_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=246;
--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_email_track`
--
ALTER TABLE `coupon_email_track`
  MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_gv_queue`
--
ALTER TABLE `coupon_gv_queue`
  MODIFY `unique_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_redeem_track`
--
ALTER TABLE `coupon_redeem_track`
  MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_restrict`
--
ALTER TABLE `coupon_restrict`
  MODIFY `restrict_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `currencies_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customers_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers_basket`
--
ALTER TABLE `customers_basket`
  MODIFY `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers_basket_attributes`
--
ALTER TABLE `customers_basket_attributes`
  MODIFY `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_archive`
--
ALTER TABLE `email_archive`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ezpages`
--
ALTER TABLE `ezpages`
  MODIFY `pages_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `featured`
--
ALTER TABLE `featured`
  MODIFY `featured_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `files_uploaded`
--
ALTER TABLE `files_uploaded`
  MODIFY `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `geo_zones`
--
ALTER TABLE `geo_zones`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group_pricing`
--
ALTER TABLE `group_pricing`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `languages_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `layout_boxes`
--
ALTER TABLE `layout_boxes`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `media_clips`
--
ALTER TABLE `media_clips`
  MODIFY `clip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media_manager`
--
ALTER TABLE `media_manager`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media_types`
--
ALTER TABLE `media_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `music_genre`
--
ALTER TABLE `music_genre`
  MODIFY `music_genre_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `newsletters_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `orders_products_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_products_attributes`
--
ALTER TABLE `orders_products_attributes`
  MODIFY `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_products_download`
--
ALTER TABLE `orders_products_download`
  MODIFY `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_status_history`
--
ALTER TABLE `orders_status_history`
  MODIFY `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_total`
--
ALTER TABLE `orders_total`
  MODIFY `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal`
--
ALTER TABLE `paypal`
  MODIFY `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_payment_status`
--
ALTER TABLE `paypal_payment_status`
  MODIFY `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `paypal_payment_status_history`
--
ALTER TABLE `paypal_payment_status_history`
  MODIFY `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_session`
--
ALTER TABLE `paypal_session`
  MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_testing`
--
ALTER TABLE `paypal_testing`
  MODIFY `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poll`
--
ALTER TABLE `poll`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `o_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poll_results`
--
ALTER TABLE `poll_results`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products_description`
--
ALTER TABLE `products_description`
  MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `products_options_values_to_products_options`
--
ALTER TABLE `products_options_values_to_products_options`
  MODIFY `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `product_type_layout`
--
ALTER TABLE `product_type_layout`
  MODIFY `configuration_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `project_version`
--
ALTER TABLE `project_version`
  MODIFY `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `project_version_history`
--
ALTER TABLE `project_version_history`
  MODIFY `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `query_builder`
--
ALTER TABLE `query_builder`
  MODIFY `query_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `record_artists`
--
ALTER TABLE `record_artists`
  MODIFY `artists_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `record_company`
--
ALTER TABLE `record_company`
  MODIFY `record_company_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `salemaker_sales`
--
ALTER TABLE `salemaker_sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specials`
--
ALTER TABLE `specials`
  MODIFY `specials_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tax_class`
--
ALTER TABLE `tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `template_select`
--
ALTER TABLE `template_select`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `upgrade_exceptions`
--
ALTER TABLE `upgrade_exceptions`
  MODIFY `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=300;
--
-- AUTO_INCREMENT for table `zones_to_geo_zones`
--
ALTER TABLE `zones_to_geo_zones`
  MODIFY `association_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
