-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2017 at 03:00 PM
-- Server version: 5.6.15-log
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pitch_discrimination`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ed4a657e986b933bab8313518cf438fb5df092c7', '127.0.0.1', 1503031379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033313333323b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a343a2253617261223b4c6173744e616d657c733a353a224a616d6573223b47656e6465727c733a363a2246656d616c65223b),
('370427675edfdc917654394a00e6e93d0575d911', '127.0.0.1', 1503032716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033323536363b),
('c0a8bd2e6a8fefc4283a99169b41efb74ff1abd4', '127.0.0.1', 1503035662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033353337383b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b5573657249447c693a323b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('837203aa8690176902c67fdfeac979d0a11157c0', '127.0.0.1', 1503035793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033353732353b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('79dae9f99093ce15d764e9cbc22059164f682a0f', '127.0.0.1', 1503036776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033363531333b557365724e616d657c733a363a2253616d706c65223b4c6173744e616d657c733a343a2254657374223b47656e6465727c733a363a2246656d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b5573657249447c693a333b),
('9bb6ce4298f667514720b0f74966072d286bfc4d', '127.0.0.1', 1503036942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033363833323b557365724e616d657c733a363a2253616d706c65223b4c6173744e616d657c733a343a2254657374223b47656e6465727c733a363a2246656d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('70d421fd7e98f696ba977fc69c76c646fa6fe5d1', '127.0.0.1', 1503037900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033373630373b557365724e616d657c733a343a2253617261223b4c6173744e616d657c733a383a2257696c6c69616d73223b47656e6465727c733a363a2246656d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b5573657249447c693a313b),
('b5f72c545a154fbfdb0b4efedb5ff83568a9dba6', '127.0.0.1', 1503038245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033373936343b557365724e616d657c733a343a2253617261223b4c6173744e616d657c733a383a2257696c6c69616d73223b47656e6465727c733a363a2246656d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('e628827a32f20aff3c512c1032aafb4d9dafccef', '127.0.0.1', 1503038610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033383333393b557365724e616d657c733a343a2253617261223b4c6173744e616d657c733a383a2257696c6c69616d73223b47656e6465727c733a363a2246656d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('ca9020871dd4f2266ae415a45ea29728ce3a6bb6', '127.0.0.1', 1503039147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033383832393b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b5573657249447c693a323b),
('ba75c714f2ee36d1e9015610421b91187273956d', '127.0.0.1', 1503039335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033393135303b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('2b35edb9dfee41c63051cd5dddd4ddb4ef570de4', '127.0.0.1', 1503039902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333033393637303b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('373870bd917a2dc07b247eb23ba2e0fc9cb0cd19', '127.0.0.1', 1503040360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034303335353b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('bf5fa2d2c56fba4bd2f89e86f0c656d2dedc8e0d', '127.0.0.1', 1503044743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034343431343b557365724e616d657c733a363a2253616d706c65223b4c6173744e616d657c733a343a2254657374223b47656e6465727c733a363a2246656d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b5573657249447c693a333b),
('4f860ebaa370ad6ef9615159ab9dd65807519632', '127.0.0.1', 1503044905, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034343734353b557365724e616d657c733a363a2253616d706c65223b4c6173744e616d657c733a343a2254657374223b47656e6465727c733a363a2246656d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('5d83166584cb51ed28505c3f0c3217820a341ac6', '127.0.0.1', 1503045856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034353536313b557365724e616d657c733a343a224a6f686e223b4c6173744e616d657c733a333a22446576223b47656e6465727c733a343a224d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b5573657249447c693a343b),
('bd1abebb194ff4aa5bca8f78e67f1e05052ffb31', '127.0.0.1', 1503046147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034353932303b557365724e616d657c733a343a224a6f686e223b4c6173744e616d657c733a333a22446576223b47656e6465727c733a343a224d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('376e87be8c8bfd2d3a3830916faa18d7e0868ab7', '127.0.0.1', 1503046583, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034363235343b557365724e616d657c733a333a2253616d223b4c6173744e616d657c733a333a224a6f65223b47656e6465727c733a343a224d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b5573657249447c693a353b),
('b4702f8f5741fabd00adb1c1ee94ed2942d2803b', '127.0.0.1', 1503046584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034363538343b557365724e616d657c733a333a2253616d223b4c6173744e616d657c733a333a224a6f65223b47656e6465727c733a343a224d616c65223b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b5573657249447c693a353b),
('603c95df743ac4aa8e9eae1b516bc167091674fd', '127.0.0.1', 1503046669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034363630323b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('82cc495b574e9d2d2ebb37b09377ade748fe10e7', '127.0.0.1', 1503047700, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034373636323b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b5573657249447c693a313b),
('67b095664a28c317a1ff5f3454712359e7afb4dd', '127.0.0.1', 1503048062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034373939323b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b),
('69f14b60aa2dceb03a4722b50cfbbd614707e562', '127.0.0.1', 1503048500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034383139323b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b5573657249447c693a313b),
('d777ac0f4c5a8d5fad2110cedee2562a7aaa11b4', '127.0.0.1', 1503048796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034383530303b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('8e38fad6fa4bc8d765918c73e9910bd0626c57e7', '127.0.0.1', 1503049073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034383830323b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a343a2253617261223b4c6173744e616d657c733a383a2257696c6c69616d73223b47656e6465727c733a363a2246656d616c65223b5573657249447c693a323b),
('7f7ed1dc07bf5a72ae55cf389516b82996de0558', '127.0.0.1', 1503049243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034393133373b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a343a2253617261223b4c6173744e616d657c733a383a2257696c6c69616d73223b47656e6465727c733a363a2246656d616c65223b),
('51eec1c0e9f3305e5d904f0602b13bc269556980', '127.0.0.1', 1503049693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034393638383b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a343a2253617261223b4c6173744e616d657c733a383a2257696c6c69616d73223b47656e6465727c733a363a2246656d616c65223b),
('1882d48022bd2b486a56c68bae230b2926f4b7f1', '127.0.0.1', 1503049993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333034393939333b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a343a2253617261223b4c6173744e616d657c733a383a2257696c6c69616d73223b47656e6465727c733a363a2246656d616c65223b),
('e69d7e78f85081fc2d1a179e54057475ca80fa5e', '127.0.0.1', 1503050832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035303534363b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b5573657249447c733a313a2231223b),
('2f9c1cd4c72f261f190104e508e94c6663008782', '127.0.0.1', 1503051182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035303838373b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b5573657249447c733a313a2231223b),
('bed72520438740094e89fb1a34409bc79c3cac7f', '127.0.0.1', 1503051404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035313230343b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b5573657249447c733a313a2231223b),
('e7de57482b79a3259b7b2722c1504b8ace6c51be', '127.0.0.1', 1503051625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035313530393b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b5573657249447c733a313a2231223b),
('ccebd14d0a32530c14fa1510a63c331207b80f8f', '127.0.0.1', 1503052136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035313939363b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('550d6d722e29c759e152b1427d4672f64e5b2fef', '127.0.0.1', 1503052518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035323336353b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('f639e9b2650af593bd8df11f6487e18c8c4b6c23', '127.0.0.1', 1503052805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035323637393b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('a2f17bf654ef0c56075beb7e892023325b6ee151', '127.0.0.1', 1503053107, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035333036353b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('1ef005b2000aed3c10d9162515094e2fa412b2ce', '127.0.0.1', 1503053562, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035333338303b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('fffc265550ffe8143ffabf1ba2770b6e288e42c8', '127.0.0.1', 1503054581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035343533393b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('d5780fc50aa13265f4fbda274afb7298d46c9339', '127.0.0.1', 1503055266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035353030373b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('2e0b6893aa0ec8167dffdbbaed1c8dd71a184362', '127.0.0.1', 1503056247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035363039343b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('e2be6a2eac6282132e77dcd302608ac000863a8c', '127.0.0.1', 1503056920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035363638323b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('251deff7f07c29f702ab529c91ca783b7ab39726', '127.0.0.1', 1503057218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035373034373b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('37979f38f588401934c83b18081bf247ac30d883', '127.0.0.1', 1503057692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035373433373b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('3b92a4f4f475a82f52bfbf8cc24f916977ced4cf', '127.0.0.1', 1503057819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035373831393b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('2b5d3703b93f408e4615a9d5e9e5f862c2aad7da', '127.0.0.1', 1503058561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035383333353b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('0a3d915c9af88edd9e2dee319e2a85c2ea7d6f93', '127.0.0.1', 1503058846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035383638343b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('c8e629a5c1b51696886f4733f48cd5bbbf4b5be9', '127.0.0.1', 1503059571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333035393536343b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b4572726f72737c613a313a7b693a303b733a35303a22556e61626c6520746f2075706c6f6164207175657374696f6e2e20506c656173652074727920616761696e206c617465722e223b7d5f5f63695f766172737c613a313a7b733a363a224572726f7273223b733a333a226e6577223b7d),
('b705fbe1f82028f7efd86ab65c51a9bbae2c972a', '127.0.0.1', 1503060358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333036303038343b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b),
('0d79b0055c48d5aea2ceff7ad1541c55bf6209df', '127.0.0.1', 1503060772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530333036303536363b456d706c6f79656549447c733a313a2234223b456d706c6f796565464e616d657c733a333a22646576223b456d706c6f7965654c4e616d657c733a343a2274657374223b456d706c6f796565526f6c657c733a353a2261646d696e223b557365724e616d657c733a373a22546861746f6e65223b4c6173744e616d657c733a353a22506978656c223b47656e6465727c733a343a224d616c65223b);

-- --------------------------------------------------------

--
-- Table structure for table `pitch_certile_scores`
--

CREATE TABLE IF NOT EXISTS `pitch_certile_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` varchar(8) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `score` varchar(8) NOT NULL,
  `certile` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pitch_certile_scores`
--

INSERT INTO `pitch_certile_scores` (`id`, `age`, `gender`, `score`, `certile`) VALUES
(1, '15-22', 'Female', '15-30', 50);

-- --------------------------------------------------------

--
-- Table structure for table `pitch_employees`
--

CREATE TABLE IF NOT EXISTS `pitch_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `avathar` varchar(100) DEFAULT NULL,
  `addeddate` datetime DEFAULT NULL,
  `role` varchar(5) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pitch_employees`
--

INSERT INTO `pitch_employees` (`id`, `firstname`, `lastname`, `username`, `passwd`, `avathar`, `addeddate`, `role`, `active`) VALUES
(3, 'aims', 'admin', 'aimadmin', '534bd18ed33f9386e42a3f33cad6dcc3', NULL, '2016-08-20 00:00:00', '', 1),
(4, 'dev', 'test', 'devtest', '90578217a199f05f32833d8ced80fb2e', 'NULL', '2016-08-20 00:00:00', 'admin', 1),
(5, 'test', 'dev', 'testdev', '90578217a199f05f32833d8ced80fb2e', 'NULL', '2016-08-20 00:00:00', 'staff', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pitch_questions`
--

CREATE TABLE IF NOT EXISTS `pitch_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questioncode` varchar(15) NOT NULL,
  `serial_number` varchar(15) NOT NULL,
  `questionname` varchar(100) DEFAULT NULL,
  `questiondesc` varchar(255) DEFAULT NULL,
  `questiontype` varchar(8) NOT NULL,
  `audiopath` varchar(255) NOT NULL,
  `audiofilename` varchar(100) NOT NULL,
  `answer` int(2) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `addeddate` datetime DEFAULT NULL,
  `includeinscoring` tinyint(1) DEFAULT '1',
  `show_or_hide` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `questioncode` (`questioncode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `pitch_questions`
--

INSERT INTO `pitch_questions` (`id`, `questioncode`, `serial_number`, `questionname`, `questiondesc`, `questiontype`, `audiopath`, `audiofilename`, `answer`, `active`, `addeddate`, `includeinscoring`, `show_or_hide`) VALUES
(1, 'Practice Item1', '', NULL, NULL, 'practice', 'uploads/20170812/20170812122644.mp3', '20170812122644.mp3', 2, 1, '2017-08-12 12:08:44', 1, 1),
(2, 'Practice Item2', '', NULL, NULL, 'practice', 'uploads/20170812/20170812122708.mp3', '20170812122708.mp3', 1, 1, '2017-08-12 12:08:08', 1, 1),
(3, 'Example 1', '', NULL, NULL, 'practice', 'uploads/20170812/20170812122730.mp3', '20170812122730.mp3', 2, 1, '2017-08-12 12:08:30', 1, 1),
(4, 'Example 2', '', NULL, NULL, 'practice', 'uploads/20170812/20170812122750.mp3', '20170812122750.mp3', 2, 1, '2017-08-12 12:08:50', 1, 1),
(5, 'Practice Item 1', '', NULL, NULL, 'practice', 'uploads/20170812/20170812122834.mp3', '20170812122834.mp3', 1, 1, '2017-08-12 12:08:34', 1, 1),
(6, 'Practice Item 2', '', NULL, NULL, 'practice', 'uploads/20170812/20170812122902.mp3', '20170812122902.mp3', 2, 1, '2017-08-12 12:08:02', 1, 1),
(7, 'Practice Item 3', '', NULL, NULL, 'practice', 'uploads/20170812/20170812122942.mp3', '20170812122942.mp3', 2, 1, '2017-08-12 12:08:42', 1, 1),
(8, 'Item Code 1', '2', NULL, NULL, 'test', 'uploads/20170812/20170812124738.wav', '20170812124738.wav', 1, 1, '2017-08-12 12:08:38', 1, 1),
(9, 'Item Code 2', '1', NULL, NULL, 'test', 'uploads/20170812/20170812124754.wav', '20170812124754.wav', 2, 1, '2017-08-12 12:08:54', 1, 1),
(10, 'Item Code 3', '2a', NULL, NULL, 'test', 'uploads/20170817/20170817083934.wav', '20170817083934.wav', 1, 1, '2017-08-17 08:08:34', 1, 1),
(11, 'Item Code 4', '3', NULL, NULL, 'test', 'uploads/20170818/20170818145409.wav', '20170818145409.wav', 2, 1, '2017-08-18 14:08:09', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pitch_questions_order`
--

CREATE TABLE IF NOT EXISTS `pitch_questions_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_order` varchar(8000) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pitch_questions_order`
--

INSERT INTO `pitch_questions_order` (`id`, `question_order`, `type`) VALUES
(1, 'a:1:{s:4:"test";a:4:{i:0;s:2:"10";i:1;s:1:"8";i:2;i:11;i:3;s:1:"9";}}', 'questions');

-- --------------------------------------------------------

--
-- Table structure for table `pitch_subscores`
--

CREATE TABLE IF NOT EXISTS `pitch_subscores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questions` varchar(7) NOT NULL,
  `score_range` varchar(15) NOT NULL,
  `subscore_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pitch_subscores`
--

INSERT INTO `pitch_subscores` (`id`, `questions`, `score_range`, `subscore_status`) VALUES
(1, '1-11', '6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pitch_users`
--

CREATE TABLE IF NOT EXISTS `pitch_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `age` varchar(6) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `filenumber` varchar(30) NOT NULL,
  `addeddate` datetime NOT NULL,
  `completeddate` datetime NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filenumber` (`filenumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pitch_users`
--

INSERT INTO `pitch_users` (`id`, `firstname`, `lastname`, `age`, `gender`, `filenumber`, `addeddate`, `completeddate`, `active`, `status`) VALUES
(1, 'Thatone', 'Pixel', '25', 'Male', '103B-D-2017-1', '2017-08-18 14:56:15', '2017-08-18 15:01:11', 1, 1),
(2, 'Sara', 'Williams', '24', 'Female', '103B-D-2017-2', '2017-08-18 03:33:36', '2017-08-18 03:40:13', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pitch_user_answers`
--

CREATE TABLE IF NOT EXISTS `pitch_user_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `optionid` int(11) NOT NULL,
  `addeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `questionid` (`questionid`),
  KEY `optionid` (`optionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `pitch_user_answers`
--

INSERT INTO `pitch_user_answers` (`id`, `userid`, `questionid`, `optionid`, `addeddate`) VALUES
(1, 1, 1, 2, '2017-08-18 14:59:08'),
(2, 1, 2, 1, '2017-08-18 14:59:19'),
(3, 1, 9, 2, '2017-08-18 15:00:39'),
(4, 1, 10, 1, '2017-08-18 15:00:49'),
(5, 1, 8, 1, '2017-08-18 15:00:59'),
(6, 1, 11, 2, '2017-08-18 15:01:10'),
(7, 2, 3, 1, '2017-08-18 03:36:17'),
(8, 2, 4, 2, '2017-08-18 03:36:47'),
(9, 2, 5, 2, '2017-08-18 03:37:18'),
(10, 2, 6, 1, '2017-08-18 03:37:30'),
(11, 2, 7, 2, '2017-08-18 03:37:50'),
(12, 2, 9, 2, '2017-08-18 03:39:13'),
(13, 2, 10, 1, '2017-08-18 03:39:37'),
(14, 2, 8, 1, '2017-08-18 03:39:48'),
(15, 2, 11, 1, '2017-08-18 03:40:12');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pitch_user_answers`
--
ALTER TABLE `pitch_user_answers`
  ADD CONSTRAINT `pitch_user_answers_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `pitch_users` (`id`),
  ADD CONSTRAINT `pitch_user_answers_ibfk_2` FOREIGN KEY (`questionid`) REFERENCES `pitch_questions` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
