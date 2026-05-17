-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 17, 2026 at 04:25 AM
-- Server version: 11.4.10-MariaDB-cll-lve-log
-- PHP Version: 8.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eduowrav_rahausub`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_tbl`
--

CREATE TABLE `admin_role_tbl` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `role` varchar(25) NOT NULL,
  `welcome_show` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_settings`
--

CREATE TABLE `api_settings` (
  `id` int(11) NOT NULL,
  `api_name` varchar(100) NOT NULL,
  `api_url` varchar(255) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `public` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_settings`
--

INSERT INTO `api_settings` (`id`, `api_name`, `api_url`, `api_key`, `secret`, `public`, `type`, `is_active`) VALUES
(1, 'Husmodata', 'https://www.husmodata.com/api/data/', '8c4fb67b7f381a076a215d8f85f8f94c0daf287a', '', '', '', 0),
(2, 'Datastation', 'https://datastation.com.ng/api/data/', '5755b8c0cfba04ce0a1a5aa7ec47a14f9a1940ad', '', '', '', 0),
(3, 'vtpass', 'https://vtpass.com', '2a0e90b55982cdaa605102f36b6de20e', 'SK_735d3d77e8b243ecc1c10e81a423f960f9f69f2fd81', 'PK_43005d5b9f8557afab0afce27f34b0810fabb126559', 'airtime', 0),
(4, 'Bardetech', 'https://bardetech.com/api/data/', '66f2e5c39ac8640f13cd888f161385b12f7e5e92', '', '', 'data', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bank_code_and_name`
--

CREATE TABLE `bank_code_and_name` (
  `id` int(11) NOT NULL,
  `bank_code` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_code_and_name`
--

INSERT INTO `bank_code_and_name` (`id`, `bank_code`, `bank_name`, `status`) VALUES
(1, '044', 'Access Bank ', 1),
(2, '014', 'Afribank ', 1),
(3, '023 ', 'Citibank ', 1),
(4, '063 ', 'Diamond Bank ', 1),
(5, '050 ', 'Ecobank ', 1),
(6, '040 ', 'Equitorial Trust Bank ', 1),
(7, '011 ', 'First Bank ', 1),
(8, '214 ', 'FCMB ', 1),
(9, '070 ', 'Fidelity Bank ', 1),
(10, '085 ', 'Finbank ', 1),
(11, '058 ', 'Guaranty Trust Bank ', 1),
(12, '069 ', 'Intercontinental Bank ', 1),
(13, '056 ', 'Oceanic Bank ', 1),
(14, '082 ', 'BankPhb ', 1),
(15, '076 ', 'Skye Bank ', 1),
(16, '084 ', 'SpringBank ', 1),
(17, '221 ', 'StanbicIBTC ', 1),
(18, '068 ', 'Standard Chartered Bank ', 1),
(19, '232 ', 'Sterling Bank ', 1),
(20, '033 ', 'United Bank for Africa ', 1),
(21, '032 ', 'Union Bank ', 1),
(22, '035 ', 'Wema bank ', 1),
(23, '057 ', 'Zenith Bank ', 1),
(24, '215 ', 'Unity bank ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cac_registration_tbl`
--

CREATE TABLE `cac_registration_tbl` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `proprietor_phone` varchar(20) NOT NULL,
  `proprietor_email` varchar(255) NOT NULL,
  `business_address` text NOT NULL,
  `nature_of_business` text NOT NULL,
  `proposed_name_1` varchar(255) NOT NULL,
  `proposed_name_2` varchar(255) DEFAULT NULL,
  `proprietor_address` text NOT NULL,
  `proprietor_passport` varchar(255) NOT NULL,
  `proprietor_signature` varchar(255) NOT NULL,
  `nin` varchar(255) NOT NULL,
  `date_submitted` datetime(6) DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `cac_doc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cac_registration_tbl`
--

INSERT INTO `cac_registration_tbl` (`id`, `email`, `sname`, `proprietor_phone`, `proprietor_email`, `business_address`, `nature_of_business`, `proposed_name_1`, `proposed_name_2`, `proprietor_address`, `proprietor_passport`, `proprietor_signature`, `nin`, `date_submitted`, `status`, `cac_doc`) VALUES
(1, 'abz@gmail.com', 'ABDULAZEEZ MUHAMMAD BELLO', '08108184500', 'abdulazeezbello5882@gmail.com', 'Kagarawal, Behind Kagarawal Primary School', 'turo pay', 'abz', 'abz2', 'abz', '../uploads/Abdulazeez_proprietor_passport_1776690701.jpg', '../uploads/Abdulazeez_proprietor_signature_1776690701.png', '../uploads/Abdulazeez_nin_1776690701.png', '2026-04-20 14:11:41.000000', 1, NULL),
(2, 'abz@gmail.com', 'Abz', '08108184500', 'Prep@gmail.com', 'Kagarawal', 'It', 'Abz1', 'Anz2', 'Prep kagarawal', '../uploads/passport_17767293732878.jpeg', '../uploads/signature_17767293738445.png', '../uploads/nin_17767293739776.jpeg', '2026-04-20 19:56:13.000000', 0, NULL),
(7, 'abz@gmail.com', 'Abdulazeez', '08108184500', 'Prep@gmail.comj', 'Kagarawal', 'It', 'Abzdevs1', 'Abzdevs2', 'Prep kagarawal', '../uploads/Abdulazeez_passport_1776774518.jpeg', '../uploads/Abdulazeez_signature_1776774518.png', '../uploads/Abdulazeez_nin_1776774518.jpeg', '2026-04-21 08:28:38.000000', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cash_out_tbl`
--

CREATE TABLE `cash_out_tbl` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `charges` int(11) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `bank_code` varchar(255) NOT NULL,
  `recipient_code` varchar(255) NOT NULL,
  `integration` varchar(255) NOT NULL,
  `transfer_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `request_id` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `transfer_code` varchar(255) NOT NULL,
  `cash_date` varchar(255) DEFAULT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0,
  `super_admin` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_out_transfer_reciept`
--

CREATE TABLE `cash_out_transfer_reciept` (
  `id` int(11) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `transfer_id` varchar(255) NOT NULL,
  `integration` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `recipient_code` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `bank_code` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_cac_registration_tbl`
--

CREATE TABLE `company_cac_registration_tbl` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `proposed_name_1` varchar(255) NOT NULL,
  `proposed_name_2` varchar(255) NOT NULL,
  `classification` enum('private','public','partnership','joint_venture','limited_liability') NOT NULL,
  `nature_of_company` text NOT NULL,
  `company_address` text NOT NULL,
  `proprietor_1_name` varchar(255) NOT NULL,
  `proprietor_1_address` text NOT NULL,
  `proprietor_1_phone` varchar(20) NOT NULL,
  `proprietor_1_email` varchar(255) NOT NULL,
  `proprietor_1_passport` varchar(255) NOT NULL,
  `proprietor_1_signature` varchar(255) NOT NULL,
  `proprietor_1_nin` varchar(255) NOT NULL,
  `proprietor_2_name` varchar(255) NOT NULL,
  `proprietor_2_address` text NOT NULL,
  `proprietor_2_phone` varchar(20) NOT NULL,
  `proprietor_2_email` varchar(255) NOT NULL,
  `proprietor_2_passport` varchar(255) NOT NULL,
  `proprietor_2_signature` varchar(255) NOT NULL,
  `proprietor_2_nin` varchar(255) NOT NULL,
  `date_submitted` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `cac_doc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `company_cac_registration_tbl`
--

INSERT INTO `company_cac_registration_tbl` (`id`, `email`, `proposed_name_1`, `proposed_name_2`, `classification`, `nature_of_company`, `company_address`, `proprietor_1_name`, `proprietor_1_address`, `proprietor_1_phone`, `proprietor_1_email`, `proprietor_1_passport`, `proprietor_1_signature`, `proprietor_1_nin`, `proprietor_2_name`, `proprietor_2_address`, `proprietor_2_phone`, `proprietor_2_email`, `proprietor_2_passport`, `proprietor_2_signature`, `proprietor_2_nin`, `date_submitted`, `status`, `cac_doc`) VALUES
(1, 'abz@gmail.com', 'Comp1', 'Comp2', '', 'Tech', 'Kagr', 'Prep1', 'Addren', '07019588264', 'abdulazeezbello5882@gmail.com', '../uploads/Abdulazeez_p1_passport_17768138413801.jpeg', '../uploads/Abdulazeez_p1_sign_17768138413292.png', '../uploads/Abdulazeez_p1_nin_17768138416629.jpeg', 'Prep 2', 'Kaaga', '08108184500', 'abdulazeezbello5882g@gmail.com', '../uploads/Abdulazeez_p2_passport_17768138416410.jpeg', '../uploads/Abdulazeez_p2_sign_17768138419383.png', '../uploads/Abdulazeez_p2_nin_17768138416465.jpeg', '2026-04-21 00:00:00.000000', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discount_tbl`
--

CREATE TABLE `discount_tbl` (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `percentage_off` float NOT NULL,
  `referal_share` float NOT NULL,
  `agent` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edutech_settings`
--

CREATE TABLE `edutech_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `edutech_settings`
--

INSERT INTO `edutech_settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'website_url', 'https://rahausub.com.ng/'),
(2, 'website_title', 'RahauSub'),
(3, 'site_color', 'green'),
(4, 'payment_charges', '100'),
(5, 'site_logo', 'logo.png'),
(6, 'site_logo_2', 'logo-white.png'),
(7, 'about_us', '<p><b>About Us<br></b></p><p><b>wdwqjdejqwdjqwdqwjdjjwqd<u>bdad a dadas </u><br></b><br></p>'),
(8, 'contact_us', 'edwe <br>'),
(9, 'dsms_install_instruction', 'dwkjadwa d qw eh'),
(10, 'dsms_feature_details', 'bdbwdc dguqhudqbe'),
(11, 'top_banner_text', 'We offer modern solutions for growing your '),
(12, 'bottom_banner_text', 'We are team of talented designers making websites with Bootstrap'),
(13, 'about_us_header', 'Expedita voluptas omnis cupiditate totam eveniet nobis sint iste. Dolores est repellat corrupti reprehenderit.'),
(14, 'why_people_choose_us_header', 'Why Peolple Choose and Rate Our Services Top-Most'),
(15, 'why_people_choose_us_tap_one', 'Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem.'),
(16, 'why_people_choose_us_tap_two', 'Laborum omnis voluptates voluptas qui sit aliquam blanditiis. Sapiente minima commodi dolorum non eveniet magni quaerat nemo et.'),
(17, 'why_people_choose_us_tap_three', 'Non quod totam minus repellendus autem sint velit. Rerum debitis facere soluta tenetur. Iure molestiae assumenda sunt qui inventore eligendi voluptates nisi at. Dolorem quo tempora. Quia et perferendis.'),
(18, 'ui_device_one', 'rgrgtvttg34 trt t35 t35tg5eg  35t35t4 '),
(19, 'ui_device_two', 'dasfae ertrw  t 4 t5y 5y 5 tyg35tg g grw t4 rg ert t3 '),
(20, 'ui_device_three', 'efdewfewfewfew f we fewf ewfew'),
(21, 'ui_device_four', 'dedfb  8yu uqef9qu e9fu e[w  ry8yfw8 epf 9uf9 ur 3r3 '),
(22, 'install_dsms_youtube', 'tgbNymZ7vqY'),
(23, 'paystack_api', 'sk_live_c2edfa45b86042c4d8ab8557c5b0381a646e8618'),
(24, 'reloaddly_api', '{\"access_token\":\"eyJraWQiOiIwMDA1YzFmMC0xMjQ3LTRmNmUtYjU2ZC1jM2ZkZDVmMzhhOTIiLCJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMDM0NiIsImlzcyI6Imh0dHBzOi8vcmVsb2FkbHkuYXV0aDAuY29tLyIsImh0dHBzOi8vcmVsb2FkbHkuY29tL3NhbmRib3giOmZhbHNlLCJodHRwczovL3JlbG9hZGx5LmNvbS9wcmVwYWlkVXNlcklkIjoiMTAzNDYiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMiLCJhdWQiOiJodHRwczovL3RvcHVwcy1oczI1Ni5yZWxvYWRseS5jb20iLCJuYmYiOjE3NzU5MDM5ODAsImF6cCI6IjEwMzQ2Iiwic2NvcGUiOiJzZW5kLXRvcHVwcyByZWFkLW9wZXJhdG9ycyByZWFkLXByb21vdGlvbnMgcmVhZC10b3B1cHMtaGlzdG9yeSByZWFkLXByZXBhaWQtYmFsYW5jZSByZWFkLXByZXBhaWQtY29tbWlzc2lvbnMiLCJleHAiOjE3ODEwODc5ODAsImh0dHBzOi8vcmVsb2FkbHkuY29tL2p0aSI6IjQ0ODM3NjQ3LThiOTMtNDRkNC1iMWVlLTY5ODkwYjJjNTU0NyIsImlhdCI6MTc3NTkwMzk4MCwianRpIjoiNDA4YjU0OGItM2VkNC00YjA4LThhOGItYjMzNzJjOTcyZjdkIn0.YeaptKf9K-BDGWKtQUXc3teOYnKTG1yzW1ITuS1FBfY\",\"scope\":\"send-topups read-operators read-promotions read-topups-history read-prepaid-balance read-prepaid-commissions\",\"expires_in\":5184000,\"token_type\":\"Bearer\",\"issued_at\":1778758722}'),
(25, 'vtpass_username', 'softwareclone@gmail.com'),
(26, 'vtpass_password', 'aa1234AA@@'),
(27, 'company_cac_price', '45000'),
(28, 'business_cac_price', '19000'),
(29, 'bvn_verification_price', '100'),
(30, 'nin_validation_price', '1000'),
(31, 'ipe_clearing_price', '700'),
(32, 'nin_name_modification_price', '7000'),
(33, 'nin_dob_modification_price', '25000'),
(34, 'DOJA_BASE_URL', 'https://api.dojah.io/api'),
(35, 'DOJA_API_KEY', 'prod_sk_71tlpoqHeBqXKvsytR8sWiXeB'),
(36, 'DOJA_APP_ID', '6751c42ad6958d1c55cc6341'),
(37, 'nin_search_basic_price', '130'),
(38, 'SEAMFIX_BASE_URL', 'https://api.verified.africa/sfx-verify/v3/id-service/'),
(39, 'SEAMFIX_API_KEY', '1iTsLPo6MrOfQdzc4ypd'),
(40, 'SEAMFIX_USER_ID', '1732454742344'),
(41, 'nin_search_regular_price', '170'),
(42, 'nin_search_improve_price', '200'),
(43, 'bvn_advance_verification_price', '150'),
(44, 'virtual_nin_search_price', '200'),
(45, 'nin_personalization_price', '300'),
(46, 'MONNIFY_BASE_URL', 'https://api.monnify.com'),
(47, 'MONNIFY_API_KEY', 'MK_PROD_3JMNVXHKW3'),
(48, 'MONNIFY_API_SECRET', '881J3RXH6Z6LDVJWG76P1YHW8VCECAE5'),
(49, 'MONNIFY_API_CONTRACT', '283194331365'),
(50, 'PREMIUM_NIN_SEARCH_PRICE', '350'),
(51, 'nin_search_premium_price', '350'),
(53, 'vtpass_link', 'https://vtpass.com/');

-- --------------------------------------------------------

--
-- Table structure for table `nin_details`
--

CREATE TABLE `nin_details` (
  `id` int(11) NOT NULL,
  `nin` varchar(30) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `middle_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `photo` longtext NOT NULL,
  `date_of_birth` varchar(100) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `employment_status` varchar(40) DEFAULT NULL,
  `marital_status` varchar(40) DEFAULT NULL,
  `tracking_id` varchar(100) DEFAULT NULL,
  `residence_adressline` varchar(255) DEFAULT NULL,
  `residence_lga` varchar(100) DEFAULT NULL,
  `residence_state` varchar(100) DEFAULT NULL,
  `qrcode` longtext DEFAULT NULL,
  `ts` varchar(100) DEFAULT NULL,
  `txid` varchar(100) DEFAULT NULL,
  `agent_id` varchar(100) DEFAULT NULL,
  `user_email` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nin_modification`
--

CREATE TABLE `nin_modification` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `nin` varchar(20) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` varchar(30) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `lga` varchar(200) NOT NULL,
  `address` varchar(255) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `document` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nin_personalizations`
--

CREATE TABLE `nin_personalizations` (
  `id` int(11) NOT NULL,
  `tracking_id` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `whatsapp_no` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(30) NOT NULL DEFAULT 'nin',
  `price` varchar(30) NOT NULL DEFAULT '0',
  `user_email` varchar(200) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nin_validation`
--

CREATE TABLE `nin_validation` (
  `id` int(11) NOT NULL,
  `nin` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `whatsapp_no` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(30) NOT NULL DEFAULT 'nin',
  `price` varchar(30) NOT NULL DEFAULT '0',
  `user_email` varchar(200) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `old_sme_data_tbl`
--

CREATE TABLE `old_sme_data_tbl` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `network_id` int(11) NOT NULL,
  `direct_price` int(11) NOT NULL,
  `our_price` int(11) NOT NULL,
  `data_bundle` varchar(255) NOT NULL,
  `data_duration` varchar(255) NOT NULL,
  `data_type_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `old_sme_data_tbl`
--

INSERT INTO `old_sme_data_tbl` (`id`, `plan_id`, `network_id`, `direct_price`, `our_price`, `data_bundle`, `data_duration`, `data_type_id`, `status`) VALUES
(1, 60, 4, 483, 500, '500', '2 days ', 4, 0),
(2, 61, 4, 925, 950, '1.5 GB', '1 month', 4, 0),
(3, 62, 4, 1110, 1150, '2.0 GB', '1 month', 4, 0),
(4, 63, 4, 1390, 1430, '3.0 GB', '1 month', 4, 0),
(5, 64, 2, 460, 490, '1.35 GB', '1 month', 1, 0),
(6, 65, 2, 920, 950, '2.9 GB', '1 month', 1, 0),
(7, 67, 2, 1840, 1870, '5.8 GB', '1 month', 1, 0),
(8, 68, 2, 2300, 2330, '7.7 GB', '1 month', 1, 0),
(9, 73, 3, 940, 970, '1.5 GB', '1 month', 5, 0),
(10, 74, 3, 1128, 1160, '2.0 GB', '1 month', 5, 0),
(11, 75, 3, 1410, 1440, '3.0 GB', '1 month', 5, 0),
(12, 76, 3, 1880, 1910, '4.5 GB', '1 month', 5, 0),
(13, 77, 3, 3760, 3790, '11.0 GB', '1 month', 5, 0),
(14, 78, 3, 4700, 4730, '15.0 GB', '1 month', 5, 0),
(15, 79, 4, 1850, 1880, '4.5 GB', '1 month', 4, 0),
(16, 80, 4, 2313, 2350, '6.0 GB', '1 month', 4, 0),
(17, 81, 4, 2895, 2930, '8.0 GB', '1 month', 4, 0),
(18, 82, 4, 3860, 3900, '11.0 GB', '1 month', 4, 0),
(19, 83, 4, 4825, 4850, '15.0 GB', '1 month', 4, 0),
(20, 106, 1, 261, 265, '1.0 GB', '1 month', 2, 0),
(21, 107, 1, 440, 470, '2.0 GB', '1 month', 2, 0),
(22, 108, 1, 660, 700, '3.0 GB', '1 month', 2, 0),
(23, 109, 1, 1100, 1130, '5.0 GB', '1 month', 2, 0),
(24, 112, 2, 2760, 2800, '10.0 GB', '1 month', 1, 0),
(25, 113, 2, 3680, 3710, '13.25 GB', '1 month', 1, 0),
(26, 114, 2, 4600, 4630, '18.25 GB', '1 month', 1, 0),
(27, 115, 2, 7360, 7390, '29.5 GB', '1 month', 1, 0),
(28, 116, 2, 1380, 1410, '4.1 GB', '1 month', 1, 0),
(29, 118, 1, 261, 270, '1.0 GB', '1 month', 2, 0),
(30, 119, 1, 480, 510, '2.0 GB', '1 month', 2, 0),
(31, 120, 1, 720, 750, '3.0 GB', '1 month', 2, 0),
(32, 121, 6, 1200, 1230, '5.0 GB', '1 month', 0, 0),
(33, 124, 1, 1510, 1540, '3.0 GB', '1 month', 3, 0),
(34, 125, 2, 9200, 9230, '50.0 GB', '1 month', 1, 0),
(35, 126, 6, 495, 520, '1.0 GB', '1 month', 0, 0),
(36, 127, 6, 985, 1020, '1.5 GB', '1 month', 0, 0),
(37, 128, 6, 1180, 1210, '2.0 GB', '1 month', 0, 0),
(38, 129, 6, 1475, 1500, '3.0 GB', '1 month', 0, 0),
(39, 130, 6, 1970, 2000, '5.0 GB', '1 month', 0, 0),
(40, 131, 6, 2470, 2500, '6.5 GB', '1 month', 0, 0),
(41, 132, 6, 2950, 2980, '8.0 GB', '1 month', 0, 0),
(42, 133, 6, 3430, 3460, '10.0 GB', '1 month', 0, 0),
(43, 134, 6, 4950, 4980, '15.0 GB', '1 month', 0, 0),
(44, 135, 6, 5900, 5930, '20.0 GB', '1 month', 0, 0),
(45, 136, 6, 7850, 7880, '30.0 GB', '1 month', 0, 0),
(46, 137, 6, 9850, 9880, '40.0 GB', '1 month', 0, 0),
(47, 138, 6, 19600, 19630, '90.0 GB', '1 month', 0, 0),
(48, 139, 6, 33500, 33530, '160.0 GB', '1 month', 0, 0),
(49, 140, 1, 120, 150, '500.0 MB', '1 month', 2, 0),
(50, 142, 3, 9400, 9430, '40.0 GB', '1 month', 5, 0),
(51, 143, 3, 14100, 14130, '75.0 GB', '1 month', 5, 0),
(52, 144, 1, 2200, 2230, '10.0 GB', '1 month', 2, 0),
(53, 145, 4, 9650, 9680, '40.0 GB', '1 month', 4, 0),
(54, 146, 4, 14475, 14500, '75.0 GB', '1 month', 4, 0),
(55, 147, 4, 19300, 19330, '110.0 GB', '1 month', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_discount_tbl`
--

CREATE TABLE `payment_discount_tbl` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `percentage` double NOT NULL,
  `refreal_share` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_history_tbl`
--

CREATE TABLE `payment_history_tbl` (
  `id` int(11) NOT NULL,
  `trans_id` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `reason` varchar(255) NOT NULL DEFAULT 'pending',
  `super_admin` int(11) NOT NULL DEFAULT 1,
  `date_paid` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_history_tbl`
--

INSERT INTO `payment_history_tbl` (`id`, `trans_id`, `amount`, `email`, `status`, `reason`, `super_admin`, `date_paid`) VALUES
(16, '646233029894179061', 200, 'softwareclone11@gmail.com', 0, 'pending', 1, '2025-08-13 09:55:47'),
(17, '516840868741454853', 70, 'softwareclone11@gmail.com', 0, 'pending', 1, '2025-08-13 10:00:22'),
(18, '477864879769362692', 100, 'softwareclone11@gmail.com', 1, 'success', 1, '2025-08-13 10:01:39'),
(19, '706186246414863867', 100, 'softwareclone11@gmail.com', 1, 'success', 1, '2025-08-13 10:50:58'),
(20, '112419276603479017', 500, 'oawel01@gmail.com', 1, 'success', 1, '2025-08-13 13:16:19'),
(21, '472807123113737047', 100, 'softwareclone11@gmail.com', 0, 'pending', 1, '2025-08-15 18:39:17'),
(22, '342332751802078223', 300, 'softwareclone11@gmail.com', 0, 'pending', 1, '2025-08-15 18:42:25'),
(23, '169951724393809488', 200, 'oawel01@gmail.com', 0, 'pending', 1, '2025-08-15 18:45:28'),
(24, '879749595599187030', 1000, 'Ajayiolaoluwa2014@gmail.com', 0, 'pending', 1, '2025-08-16 09:56:10'),
(25, '914694445893232084', 200, 'oawel01@gmail.com', 0, 'pending', 1, '2025-08-18 09:19:39'),
(26, '319474478817818813', 200, 'oawel01@gmail.com', 0, 'pending', 1, '2025-08-18 09:20:21'),
(27, '831301948334274223', 200, 'oawel01@gmail.com', 0, 'pending', 1, '2025-08-18 09:27:16'),
(28, '650883116712522716', 100, 'softwareclone11@gmail.com', 1, 'success', 1, '2025-08-18 09:37:14'),
(29, '331884087511304689', 100, 'oawel01@gmail.com', 1, 'success', 1, '2025-08-18 10:42:41'),
(30, '126887454731366702', 100, 'oawel01@gmail.com', 0, 'pending', 1, '2025-08-18 11:03:30'),
(31, '505529325243800923', 5000, 'softwareclone11@gmail.com', 0, 'pending', 1, '2025-08-23 10:22:12'),
(32, '239066329200844519', 500, 'oawel01@gmail.com', 1, 'success', 1, '2025-10-12 13:49:42'),
(33, '999421957644433946', 3000, 'rahmahhabib083@gmail.com', 0, 'pending', 1, '2025-10-13 16:16:09'),
(34, '450904650424987772', 3000, 'rahmahhabib083@gmail.com', 1, 'success', 1, '2025-10-13 16:20:03'),
(35, '995607074279598935', 600, 'oawel01@gmail.com', 1, 'success', 1, '2025-10-13 16:36:52'),
(36, '558803725202277051', 2000, 'oawel01@gmail.com', 0, 'pending', 1, '2025-10-30 15:12:21'),
(37, '332069203572055706', 1000, 'oawel01@gmail.com', 1, 'success', 1, '2025-10-30 15:17:41'),
(38, '778240781815880141', 1000, 'oawel01@gmail.com', 1, 'success', 1, '2025-10-31 15:24:29'),
(39, '419352484347983968', 1000, 'oawel01@gmail.com', 1, 'success', 1, '2025-11-04 06:31:05'),
(40, '719021397580474521', 2000, 'oawel01@gmail.com', 0, 'pending', 1, '2025-11-04 13:05:55'),
(41, '271167042235401186', 3000, 'oawel01@gmail.com', 0, 'pending', 1, '2025-11-04 13:23:00'),
(42, '223327787244906781', 3000, 'oawel01@gmail.com', 1, 'success', 1, '2025-11-04 13:25:47'),
(43, '119221876115656155', 200, 'annaleona00@gmail.com', 0, 'pending', 1, '2025-11-05 02:21:30'),
(44, '438742317253761528', 150, 'annaleona00@gmail.com', 1, 'success', 1, '2025-11-05 02:24:01'),
(45, '236967054519235265', 500, 'oawel01@gmail.com', 1, 'success', 1, '2025-11-05 12:21:02'),
(46, '115911723532714748', 2000, 'oawel01@icloud.com', 0, 'pending', 1, '2025-11-05 19:34:06'),
(47, '412648333329789894', 2000, 'oawel01@gmail.com', 0, 'pending', 1, '2025-11-05 20:58:35'),
(48, '941249469163911778', 2000, 'oawel01@gmail.com', 1, 'success', 1, '2025-11-08 13:56:17'),
(49, '271864962556462313', 1000, 'rahmahhabib083@gmail.com', 0, 'pending', 1, '2025-11-08 20:02:41'),
(50, '869113392741643280', 500, 'oawel01@icloud.com', 1, 'success', 1, '2025-11-16 10:20:03'),
(51, '143451568381901477', 3000, 'oawel01@gmail.com', 1, 'success', 1, '2025-11-28 12:21:37'),
(52, '573201300442882719', 500, 'balaabu033@gmail.com', 0, 'pending', 1, '2025-12-23 20:56:29'),
(53, '326819719318073379', 250, 'balaabu033@gmail.com', 1, 'success', 1, '2025-12-24 10:31:29'),
(54, '212306337276385608', 1000, 'abdulazeezbello5882@gmail.com', 0, 'pending', 1, '2025-12-26 22:27:58'),
(55, '660314331124649043', 100, 'abdulazeezbellomhd@gmail.commm', 0, 'pending', 1, '2026-03-26 13:57:34'),
(56, '906162354757777670', 200, 'abdulazeezbellomhd@gmail.commm', 0, 'pending', 1, '2026-03-26 13:57:52'),
(57, '329913939446975205', 100, 'abz@gmail.com', 0, 'pending', 1, '2026-03-31 16:21:51'),
(58, '669025469436620588', 1000, 'oawel01@gmail.com', 0, 'pending', 1, '2026-04-26 14:17:03'),
(59, '764337420345702829', 200, 'rolandgoodness707@gmail.com', 1, 'success', 1, '2026-05-15 03:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `plan` varchar(200) NOT NULL,
  `validity` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `api` int(11) NOT NULL DEFAULT 0,
  `reseller` int(11) NOT NULL DEFAULT 0,
  `topuser` int(11) NOT NULL DEFAULT 0,
  `plan_type_id` int(11) NOT NULL,
  `network_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan_id`, `api_id`, `plan`, `validity`, `price`, `api`, `reseller`, `topuser`, `plan_type_id`, `network_id`) VALUES
(1, 99, 2, 'MTN Corporate Data 500 MB', '30 DAYS', 500, 500, 500, 500, 2, '1'),
(2, 100, 1, 'MTN Corporate Data 1.0 GB', '30 DAYS', 275, 270, 270, 270, 2, '1'),
(7, 101, 1, 'MTN Corporate Data 2.0 GB', '30 DAYS', 550, 530, 530, 530, 2, '1'),
(8, 226, 1, 'MTN Corporate Data 3.0 GB', '30 DAYS', 825, 820, 820, 820, 2, '1'),
(9, 116, 1, 'MTN Corporate Data 5.0 GB', '30 DAYS', 1350, 1335, 1335, 1335, 2, '1'),
(11, 51, 1, 'MTN SME 1.0 GB', '30 DAYS', 275, 270, 270, 270, 1, '1'),
(12, 50, 1, 'MTN SME 2.0 GB', '30 DAYS', 550, 540, 540, 540, 1, '1'),
(15, 261, 1, 'GLO 1 GB', '30 DAYS', 280, 275, 275, 275, 3, '2'),
(16, 262, 1, 'GLO 2GB', '30 DAYS', 560, 555, 555, 555, 3, '2'),
(17, 263, 1, 'GLO 3GB', '30 DAYS', 840, 835, 835, 835, 3, '2'),
(18, 212, 1, 'Airtel 500 MB', '30 DAYS', 175, 175, 170, 170, 4, '4'),
(19, 213, 1, 'Airtel 1.0 GB', '30 DAYS', 290, 288, 288, 288, 4, '4'),
(20, 214, 1, 'Airtel 2.0 GB', '30 DAYS', 580, 576, 576, 576, 4, '4'),
(21, 215, 1, 'Airtel 5.0 GB', '30 DAYS', 1450, 1430, 1430, 1430, 4, '4'),
(22, 216, 1, 'Airtel 100 MB', '30 DAYS', 170, 140, 140, 140, 4, '4'),
(23, 217, 1, 'Airtel 300 MB', '30 DAYS', 169, 160, 160, 155, 4, '4'),
(25, 146, 1, 'MTN Corporate Data 10 GB', '30 DAYS', 2750, 2700, 2700, 2700, 2, '1'),
(26, 44, 1, 'MTN SME 5.0 GB', '30 DAYS', 1375, 1370, 1370, 1370, 1, '1'),
(27, 150, 1, 'MTN SME 10 GB', '30 DAYS', 2750, 2700, 2700, 2700, 1, '1'),
(30, 272, 1, '9mobile 1GB', '30 DAYS', 180, 185, 170, 170, 5, '3'),
(31, 274, 1, '9mobile 2.0  GB', '30 DAYS', 360, 345, 345, 345, 5, '3'),
(32, 278, 1, '9mobile 4GB', '30 DAYS', 720, 760, 760, 760, 5, '3'),
(33, 277, 1, '9mobile 3.0  GB', '30 DAYS', 540, 560, 560, 560, 5, '3'),
(35, 188, 1, '9mobile 15GB', '30 DAYS', 2800, 4200, 4300, 4250, 5, '3'),
(36, 279, 1, '9mobile  4.5  GB', '30 DAYS', 855, 850, 850, 850, 5, '3'),
(37, 275, 1, '9mobile  500MB ', '30 DAYS', 110, 105, 110, 110, 5, '3'),
(43, 258, 1, 'GLO 500 MB', '30 DAYS', 180, 175, 175, 175, 3, '2'),
(44, 264, 1, 'GLO 5 GB', '30 DAYS', 1400, 1395, 1395, 1395, 3, '2'),
(45, 2147483647, 1, 'GLO 10.0 GB', '30 DAYS', 2800, 2790, 2790, 2790, 3, '2'),
(47, 394, 1, '500MB SME ', '30Days', 500, 490, 495, 495, 1, '1'),
(48, 230, 1, 'MTN  SME 3GB', '30 DAYS', 825, 820, 815, 815, 1, '1'),
(49, 231, 1, 'Airtel 10GB', '30 DAYS', 2900, 2880, 2880, 2880, 4, '4'),
(50, 232, 1, 'Airtel 15GB', '30 DAYS', 4575, 4570, 4570, 4570, 4, '4'),
(51, 233, 1, 'Airtel  20GB', '30 DAYS', 6100, 6000, 6000, 6000, 4, '4'),
(52, 273, 1, '9MOBILE 1.5GB', '30 DAYS', 285, 275, 275, 275, 5, '3'),
(53, 276, 1, '9MOBILE 2.5GB', '30 DAYS', 475, 470, 470, 470, 5, '3'),
(54, 319, 1, 'AIRTEL AWOOF 1GB', '30 DAYS', 250, 240, 240, 240, 4, '4'),
(55, 315, 1, 'AIRTEL AWOOF 3GB', '30 DAYS', 700, 680, 680, 680, 4, '4'),
(56, 313, 1, 'AIRTEL AWOOF 100MB', '1 DAY', 90, 85, 85, 85, 4, '4'),
(57, 314, 1, 'AIRTEL AWOOF 300MB', '2 DAY', 150, 145, 145, 145, 4, '4'),
(58, 316, 1, 'AIRTEL AWOOF 4GB', '30 DAY', 1100, 1090, 1090, 1090, 4, '4'),
(59, 317, 1, 'AIRTEL AWOOF 10GB', '30 DAY', 2200, 2150, 2150, 2150, 4, '4'),
(60, 318, 1, 'AIRTEL AWOOF 15GB', '30 DAY', 3300, 3200, 3200, 3200, 4, '4'),
(61, 320, 1, 'AIRTEL AWOOF 2GB', '2 DAY', 450, 430, 430, 430, 4, '4'),
(62, 321, 1, 'GLO AWOOF 1GB', '1 DAY', 220, 216, 216, 216, 3, '2'),
(63, 322, 1, 'GLO AWOOF 2GB', '1 DAY', 350, 340, 340, 340, 3, '2'),
(64, 323, 1, 'GLO AWOOF 3.5GB', '2 DAY', 580, 560, 560, 560, 3, '2'),
(65, 324, 1, 'GLO AWOOF 15GB', '7 DAY', 2100, 2090, 2090, 2090, 3, '2'),
(72, 271, 1, 'SME 2 (500 MB)', '30 DAYS', 145, 143, 143, 143, 11, '1'),
(73, 270, 1, 'SME 2 (10 GB)', '30 DAYS', 2650, 2648, 2648, 2648, 11, '1'),
(74, 269, 1, 'SME 2 (5 GB)', '30 DAYS', 1300, 1297, 1297, 1297, 11, '1'),
(75, 268, 1, 'SME 2 (3GB)', '30 DAYS', 805, 803, 803, 803, 11, '1'),
(76, 267, 1, 'SME 2 (2GB)', '30 DAYS', 535, 533, 533, 533, 11, '1'),
(77, 266, 1, 'SME 2 (1GB)', '30 DAYS', 265, 263, 263, 263, 11, '1'),
(78, 310, 1, 'MTN AWOOF 1GB', '1 DAY', 240, 237, 237, 237, 7, '1'),
(80, 311, 1, 'MTN AWOOF 3.5GB', '2 DAY', 710, 700, 700, 700, 7, '1'),
(81, 312, 1, 'MTN AWOOF 15GB', '7 DAY', 2200, 2180, 2180, 2180, 7, '1'),
(82, 304, 1, 'DATA SHARE(500 MB)', '30 DAYS', 128, 127, 127, 127, 9, '1'),
(83, 305, 1, 'DATA SHARE(1GB)', '30 DAYS', 248, 246, 246, 246, 9, '1'),
(84, 308, 1, 'DATA SHARE(3GB)', '30 DAYS', 750, 748, 748, 748, 9, '1'),
(85, 307, 1, 'DATA SHARE(2GB)', '30 DAYS', 496, 494, 494, 494, 9, '1'),
(86, 309, 1, 'DATA SHARE(5GB)', '30 DAYS', 1240, 1235, 1235, 1235, 9, '1'),
(87, 362, 2, 'MTN Corporate Data 500 MB', '1 DAYS', 500, 500, 500, 500, 2, '1'),
(88, 415, 2, 'MTN Corporate Data 1.0 GB', '7 DAYS', 800, 800, 800, 800, 2, '1'),
(89, 328, 2, 'MTN Corporate Data 2.0 GB', '2 DAYS', 800, 800, 800, 800, 2, '1'),
(90, 349, 2, 'MTN Corporate Data 3.5 GB', '30 DAYS', 2500, 2500, 2500, 2500, 2, '1'),
(91, 371, 2, 'MTN Corporate Data 5.0 GB', '30 DAYS', 3500, 3500, 3500, 3500, 2, '1'),
(92, 340, 2, 'MTN SME 1.0 GB', '7 DAYS', 785, 785, 785, 785, 1, '1'),
(93, 335, 2, 'MTN SME 2.0 GB', '30 DAYS', 1500, 1500, 1500, 1500, 1, '1'),
(94, 194, 2, 'GLO 1 GB', '30 DAYS', 500, 500, 500, 500, 3, '2'),
(95, 195, 2, 'GLO 2GB', '30 DAYS', 900, 900, 900, 900, 3, '2'),
(96, 196, 2, 'GLO 3GB', '30 DAYS', 1300, 1300, 1300, 1300, 3, '2'),
(97, 375, 2, 'Airtel 500 MB', '30 DAYS', 600, 600, 600, 600, 4, '4'),
(98, 428, 2, 'Airtel 1.0 GB', '7 DAYS', 900, 900, 900, 900, 4, '4'),
(99, 376, 2, 'Airtel 2.0 GB', '30 DAYS', 1600, 1600, 1600, 1600, 4, '4'),
(100, 147, 2, 'Airtel 5.0 GB', '30 DAYS', 1390, 1385, 1385, 185, 4, '4'),
(101, 216, 2, 'Airtel 100 MB', '30 DAYS', 170, 140, 140, 140, 4, '4'),
(102, 217, 2, 'Airtel 300 MB', '30 DAYS', 169, 160, 160, 155, 4, '4'),
(103, 346, 2, 'MTN Corporate Data 10 GB', '30 DAYS', 4500, 4500, 4500, 4500, 2, '1'),
(104, 372, 2, 'MTN SME 5.0 GB', '30 DAYS', 3120, 3120, 3120, 3120, 1, '1'),
(106, 272, 2, '9mobile 1GB', '30 DAYS', 180, 185, 170, 170, 5, '3'),
(107, 274, 2, '9mobile 2.0  GB', '30 DAYS', 360, 345, 345, 345, 5, '3'),
(108, 278, 2, '9mobile 4GB', '30 DAYS', 720, 760, 760, 760, 5, '3'),
(109, 277, 2, '9mobile 3.0  GB', '30 DAYS', 540, 560, 560, 560, 5, '3'),
(110, 188, 2, '9mobile 15GB', '30 DAYS', 2800, 4200, 4300, 4250, 5, '3'),
(111, 279, 2, '9mobile  4.5  GB', '30 DAYS', 855, 850, 850, 850, 5, '3'),
(112, 275, 2, '9mobile  500MB ', '30 DAYS', 110, 105, 110, 110, 5, '3'),
(113, 203, 2, 'GLO 500 MB', '14 DAYS', 250, 250, 250, 250, 3, '2'),
(114, 197, 2, 'GLO 5 GB', '30 DAYS', 2200, 2200, 2200, 2200, 3, '2'),
(115, 200, 2, 'GLO 10.0 GB', '30 DAYS', 4300, 4300, 4300, 4300, 3, '2'),
(116, 350, 2, '500MB SME ', '7Days', 500, 490, 490, 490, 1, '1'),
(117, 336, 2, 'MTN  SME 3GB', '30 DAYS', 2000, 2000, 2000, 2000, 1, '1'),
(118, 148, 2, 'Airtel 10GB', '30 DAYS', 2780, 2750, 2750, 2750, 4, '4'),
(119, 226, 2, 'Airtel 15GB', '30 DAYS', 4170, 4150, 4150, 4160, 4, '4'),
(120, 227, 2, 'Airtel  20GB', '30 DAYS', 5560, 5545, 5550, 5545, 4, '4'),
(121, 273, 2, '9MOBILE 1.5GB', '30 DAYS', 285, 275, 275, 275, 5, '3'),
(122, 276, 2, '9MOBILE 2.5GB', '30 DAYS', 475, 470, 470, 470, 5, '3'),
(123, 283, 2, 'AIRTEL  GIFTING  1GB', '7 DAYS', 260, 255, 255, 255, 4, '4'),
(124, 315, 2, 'AIRTEL AWOOF 3GB', '30 DAYS', 800, 780, 780, 780, 4, '4'),
(125, 313, 2, 'AIRTEL AWOOF 100MB', '1 DAY', 90, 85, 85, 85, 4, '4'),
(126, 314, 2, 'AIRTEL AWOOF 300MB', '2 DAY', 150, 145, 145, 145, 4, '4'),
(127, 316, 2, 'AIRTEL AWOOF 4GB', '30 DAY', 1100, 1090, 1090, 1090, 4, '4'),
(128, 317, 2, 'AIRTEL AWOOF 10GB', '30 DAY', 2200, 2150, 2150, 2150, 4, '4'),
(129, 318, 2, 'AIRTEL AWOOF 15GB', '30 DAY', 3300, 3200, 3200, 3200, 4, '4'),
(130, 285, 2, 'AIRTEL  GIFTING 2GB', '14 DAYS', 530, 525, 525, 525, 4, '4'),
(135, 416, 2, '500 MB     SME 2', '5 DAYS', 500, 500, 500, 500, 11, '1'),
(137, 366, 2, '(5 GB)  SME  2', '30 DAYS', 2900, 2900, 2900, 2900, 11, '1'),
(138, 310, 2, '(3GB) SME  2', '30 DAYS', 816, 1700, 1700, 1700, 11, '1'),
(139, 403, 2, '(2GB) SME  2', '30 DAYS', 1150, 1150, 1150, 1150, 11, '1'),
(140, 417, 2, '(1GB) SME 2', '30 DAYS', 650, 650, 650, 650, 11, '1'),
(141, 310, 2, 'MTN AWOOF 1GB', '1 DAY', 240, 237, 237, 237, 7, '1'),
(142, 311, 2, 'MTN AWOOF 3.5GB', '2 DAY', 710, 700, 700, 700, 7, '1'),
(143, 312, 2, 'MTN AWOOF 15GB', '7 DAY', 2200, 2180, 2180, 2180, 7, '1'),
(144, 304, 2, 'DATA SHARE(500 MB)', '30 DAYS', 128, 127, 127, 127, 9, '1'),
(145, 305, 2, 'DATA SHARE(1GB)', '30 DAYS', 248, 246, 246, 246, 9, '1'),
(146, 308, 2, 'DATA SHARE(3GB)', '30 DAYS', 750, 748, 748, 748, 9, '1'),
(147, 307, 2, 'DATA SHARE(2GB)', '30 DAYS', 496, 494, 494, 494, 9, '1'),
(148, 309, 2, 'DATA SHARE(5GB)', '30 DAYS', 1240, 1235, 1235, 1235, 9, '1'),
(149, 7, 4, 'MTN SME 1GB', '7 Days', 430, 410, 415, 420, 1, '1'),
(150, 44, 4, 'MTN SME 1.5GB', '7 Days', 720, 980, 700, 710, 1, '1'),
(151, 212, 4, 'MTN SME 500MB', '7 Days', 270, 320, 260, 265, 1, '1'),
(152, 213, 4, 'MTN SME 10GB', '30 Days', 2700, 4450, 2500, 2600, 1, '1'),
(153, 512, 4, 'MTN SME 3.5GB', '30 Days', 1200, 2450, 1100, 1150, 1, '1'),
(154, 513, 4, 'MTN SME 7GB', '30 Days', 2000, 3430, 1900, 1950, 1, '1'),
(155, 515, 4, 'MTN SME 20GB', '7 Days', 2900, 4900, 2700, 2800, 1, '1'),
(156, 521, 4, 'MTN SME 3GB', '30 Days', 900, 1450, 850, 870, 1, '1'),
(157, 522, 4, 'MTN SME 5GB', '30 Days', 1350, 2000, 1250, 1300, 1, '1'),
(158, 524, 4, 'MTN SME 2GB', '30 Days', 600, 870, 560, 580, 1, '1'),
(159, 542, 4, 'MTN SME 1.2GB', '30 Days (Social)', 320, 445, 300, 310, 1, '1'),
(160, 543, 4, 'MTN SME 501MB', '7 Days (Social)', 130, 200, 120, 125, 1, '1'),
(161, 555, 4, 'MTN SME 1.1GB', '7 Days', 560, 784, 530, 545, 1, '1'),
(162, 558, 4, 'MTN SME 1GB', '30 Days', 360, 510, 340, 350, 1, '1'),
(163, 568, 4, 'MTN SME 1GB', '1 Day', 210, 270, 200, 205, 1, '1'),
(164, 571, 4, 'MTN SME 2.5GB', '1 Day', 460, 600, 440, 450, 1, '1'),
(165, 8, 4, 'MTN SME 2.1GB', '30 Days', 900, 1470, 850, 870, 1, '1'),
(166, 11, 4, 'MTN SME 6GB', '7 Days', 1400, 2450, 1300, 1350, 1, '1'),
(167, 282, 4, 'MTN SME2 3GB', '30 Days', 900, 1450, 850, 870, 11, '1'),
(168, 283, 4, 'MTN SME2 5GB', '30 Days', 1350, 2000, 1250, 1300, 11, '1'),
(169, 284, 4, 'MTN SME2 10GB', '30 Days', 2700, 4450, 2500, 2600, 11, '1'),
(170, 523, 4, 'MTN SME2 2GB', '30 Days', 600, 870, 560, 580, 11, '1'),
(171, 525, 4, 'MTN SME2 1GB', '7 Days', 330, 410, 310, 320, 11, '1'),
(172, 545, 4, 'MTN SME2 1.2GB', '30 Days (Social)', 320, 445, 300, 310, 11, '1'),
(173, 547, 4, 'MTN SME2 501MB', '7 Days (Social)', 130, 200, 120, 125, 11, '1'),
(174, 551, 4, 'MTN SME2 11GB', '7 Days', 2200, 3450, 2100, 2150, 11, '1'),
(175, 556, 4, 'MTN SME2 500MB', '7 Days', 270, 320, 260, 265, 11, '1'),
(176, 559, 4, 'MTN SME2 1GB', '30 Days', 360, 510, 340, 350, 11, '1'),
(177, 569, 4, 'MTN SME2 1GB', '1 Day', 210, 270, 200, 205, 11, '1'),
(178, 572, 4, 'MTN SME2 2.5GB', '1 Day', 460, 600, 440, 450, 11, '1'),
(179, 235, 4, 'MTN CG 1GB', '30 Days', 220, 287, 200, 210, 2, '1'),
(180, 237, 4, 'MTN CG 2GB', '30 Days', 440, 574, 410, 425, 2, '1'),
(181, 239, 4, 'MTN CG 3GB', '30 Days', 680, 851, 640, 660, 2, '1'),
(182, 240, 4, 'MTN CG 5GB', '30 Days', 1100, 1435, 1000, 1050, 2, '1'),
(183, 241, 4, 'MTN CG 10GB', '30 Days', 2200, 2870, 2000, 2100, 2, '1'),
(184, 242, 4, 'MTN CG 15GB', '30 Days', 3200, 3975, 3000, 3100, 2, '1'),
(185, 243, 4, 'MTN CG 20GB', '30 Days', 4400, 5740, 4200, 4300, 2, '1'),
(186, 244, 4, 'MTN CG 40GB', '30 Days', 8500, 10600, 8000, 8250, 2, '1'),
(187, 246, 4, 'MTN CG 500MB', '30 Days', 100, 150, 90, 95, 2, '1'),
(188, 274, 4, 'MTN CG 250MB', '30 Days', 70, 100, 65, 68, 2, '1'),
(189, 275, 4, 'MTN CG 150MB', '30 Days', 55, 75, 50, 52, 2, '1'),
(190, 285, 4, 'MTN CG 50MB', '30 Days', 30, 40, 28, 29, 2, '1'),
(191, 332, 4, 'MTN Awoof 1.1GB', '1 Day', 380, 490, 350, 360, 7, '1'),
(192, 333, 4, 'MTN Awoof 3.2GB', '2 Days', 760, 980, 720, 740, 7, '1'),
(193, 334, 4, 'MTN Awoof 11GB', '7 Days', 2700, 3430, 2500, 2600, 7, '1'),
(194, 470, 4, 'MTN Awoof 1.5GB', '2 Days', 460, 588, 430, 445, 7, '1'),
(195, 471, 4, 'MTN Awoof 6GB', '7 Days', 1800, 2450, 1700, 1750, 7, '1'),
(196, 472, 4, 'MTN Awoof 15GB', '30 Days', 4200, 5500, 4000, 4100, 7, '1'),
(197, 548, 4, 'MTN Awoof 1.2GB', '30 Days (Social)', 340, 445, 320, 330, 7, '1'),
(198, 549, 4, 'MTN Awoof 501MB', '7 Days (Social)', 150, 200, 140, 145, 7, '1'),
(199, 256, 4, 'GLO CG 200MB', '14 Days', 70, 90, 65, 68, 3, '2'),
(200, 257, 4, 'GLO CG 500MB', '30 Days', 170, 210, 160, 165, 3, '2'),
(201, 259, 4, 'GLO CG 2GB', '30 Days', 680, 820, 640, 660, 3, '2'),
(202, 260, 4, 'GLO CG 3GB', '30 Days', 1000, 1230, 950, 975, 3, '2'),
(203, 261, 4, 'GLO CG 5GB', '30 Days', 1700, 2050, 1600, 1650, 3, '2'),
(204, 262, 4, 'GLO CG 10GB', '30 Days', 3400, 4100, 3200, 3300, 3, '2'),
(205, 328, 4, 'GLO CG 1GB', '30 Days', 350, 410, 330, 340, 3, '2'),
(206, 560, 4, 'GLO CG 1GB', '7 Days', 290, 350, 270, 280, 3, '2'),
(207, 561, 4, 'GLO CG 3GB', '7 Days', 870, 1050, 830, 850, 3, '2'),
(208, 562, 4, 'GLO CG 5GB', '7 Days', 1450, 1750, 1380, 1410, 3, '2'),
(209, 467, 4, 'GLO Awoof 2.5GB', '2 Days', 380, 500, 360, 370, 3, '2'),
(210, 469, 4, 'GLO Awoof 1.5GB', '1 Day', 220, 300, 200, 210, 3, '2'),
(211, 484, 4, 'GLO Awoof 10GB', '7 Days', 1600, 2000, 1500, 1550, 3, '2'),
(212, 485, 4, 'GLO Awoof 750MB', '1 Day', 150, 200, 140, 145, 3, '2'),
(213, 248, 4, 'Airtel CG 500MB', '7 Days', 420, 490, 400, 410, 4, '4'),
(214, 249, 4, 'Airtel CG 1GB', '7 Days', 700, 785, 660, 680, 4, '4'),
(215, 250, 4, 'Airtel CG 2GB', '30 Days', 1100, 1470, 1050, 1075, 4, '4'),
(216, 251, 4, 'Airtel CG 6GB', '7 Days', 2000, 2450, 1900, 1950, 4, '4'),
(217, 253, 4, 'Airtel CG 100MB', '1 Day', 80, 100, 75, 78, 4, '4'),
(218, 254, 4, 'Airtel CG 300MB', '2 Days', 240, 300, 220, 230, 4, '4'),
(219, 255, 4, 'Airtel CG 10GB', '30 Days', 3200, 3940, 3000, 3100, 4, '4'),
(220, 516, 4, 'Airtel CG 8GB', '30 Days', 2400, 2940, 2200, 2300, 4, '4'),
(221, 455, 4, 'Airtel SME 2GB', '2 Days', 420, 550, 400, 410, 4, '4'),
(222, 456, 4, 'Airtel SME 300MB', '2 Days', 95, 120, 88, 92, 4, '4'),
(223, 457, 4, 'Airtel SME 150MB', '1 Day', 45, 60, 42, 44, 4, '4'),
(224, 458, 4, 'Airtel SME 7GB', '7 Days', 1600, 2050, 1500, 1550, 4, '4'),
(225, 518, 4, 'Airtel SME 13GB', '30 Days', 3900, 4900, 3700, 3800, 4, '4'),
(226, 528, 4, 'Airtel SME 1.5GB', '7 Days (Social)', 400, 520, 380, 390, 4, '4'),
(227, 531, 4, 'Airtel SME 1.5GB', '2 Days', 330, 420, 310, 320, 4, '4'),
(228, 533, 4, 'Airtel SME 4GB', '2 Days', 620, 780, 590, 605, 4, '4'),
(229, 534, 4, 'Airtel SME 5GB', '2 Days', 820, 1040, 790, 805, 4, '4'),
(230, 537, 4, 'Airtel SME 100GB', '30 Days', 15500, 19600, 15000, 15250, 4, '4'),
(231, 539, 4, 'Airtel SME 60GB', '30 Days', 11500, 14700, 11000, 11250, 4, '4'),
(232, 540, 4, 'Airtel SME 35GB', '30 Days', 7800, 9800, 7500, 7650, 4, '4'),
(233, 552, 4, 'Airtel SME 600MB', '2 Days', 170, 220, 160, 165, 4, '4'),
(234, 553, 4, 'Airtel SME 600MB', '2 Days', 170, 220, 160, 165, 4, '4'),
(235, 450, 4, 'Airtel Awoof 10GB', '30 Days', 2400, 3050, 2300, 2350, 4, '4'),
(236, 454, 4, 'Airtel Awoof 2GB', '2 Days', 420, 550, 400, 410, 4, '4'),
(237, 459, 4, 'Airtel Awoof 150MB', '1 Day', 45, 60, 42, 44, 4, '4'),
(238, 460, 4, 'Airtel Awoof 300MB', '2 Days', 95, 120, 88, 92, 4, '4'),
(239, 465, 4, 'Airtel Awoof 7GB', '7 Days', 1600, 2050, 1500, 1550, 4, '4'),
(240, 517, 4, 'Airtel Awoof 13GB', '30 Days', 3900, 4900, 3700, 3800, 4, '4'),
(241, 529, 4, 'Airtel Awoof 1.5GB', '7 Days (Social)', 400, 520, 380, 390, 4, '4'),
(242, 530, 4, 'Airtel Awoof 1.5GB', '2 Days', 330, 420, 310, 320, 4, '4'),
(243, 532, 4, 'Airtel Awoof 4GB', '2 Days', 620, 780, 590, 605, 4, '4'),
(244, 535, 4, 'Airtel Awoof 5GB', '2 Days', 820, 1040, 790, 805, 4, '4'),
(245, 536, 4, 'Airtel Awoof 100GB', '30 Days', 15500, 19600, 15000, 15250, 4, '4'),
(246, 538, 4, 'Airtel Awoof 60GB', '30 Days', 11500, 14700, 11000, 11250, 4, '4'),
(247, 541, 4, 'Airtel Awoof 35GB', '30 Days', 7800, 9800, 7500, 7650, 4, '4'),
(248, 263, 4, '9mobile CG 25MB', '30 Days', 15, 20, 13, 14, 5, '3'),
(249, 293, 4, '9mobile CG 100MB', '30 Days', 40, 50, 38, 39, 5, '3'),
(250, 294, 4, '9mobile CG 300MB', '30 Days', 80, 100, 75, 78, 5, '3'),
(251, 265, 4, '9mobile CG 1GB', '30 Days', 200, 250, 190, 195, 5, '3'),
(252, 266, 4, '9mobile CG 1.5GB', '30 Days', 300, 375, 280, 290, 5, '3'),
(253, 267, 4, '9mobile CG 2GB', '30 Days', 400, 500, 380, 390, 5, '3'),
(254, 268, 4, '9mobile CG 3GB', '30 Days', 600, 750, 570, 585, 5, '3'),
(255, 296, 4, '9mobile CG 4GB', '30 Days', 800, 1000, 760, 780, 5, '3'),
(256, 271, 4, '9mobile CG 4.5GB', '30 Days', 900, 1125, 850, 875, 5, '3'),
(257, 270, 4, '9mobile CG 5GB', '30 Days', 1000, 1250, 950, 975, 5, '3'),
(258, 273, 4, '9mobile CG 500MB', '30 Days', 100, 130, 95, 98, 5, '3'),
(259, 272, 4, '9mobile CG 11GB', '30 Days', 2200, 2750, 2100, 2150, 5, '3'),
(260, 295, 4, '9mobile CG 15GB', '30 Days', 3000, 3750, 2800, 2900, 5, '3');

-- --------------------------------------------------------

--
-- Table structure for table `plan_types`
--

CREATE TABLE `plan_types` (
  `id` int(11) NOT NULL,
  `data_type` varchar(255) NOT NULL,
  `network_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plan_types`
--

INSERT INTO `plan_types` (`id`, `data_type`, `network_id`, `title`, `status`) VALUES
(1, 'mtnsme', 1, 'MTN SME', 1),
(2, 'mtncg', 1, 'MTN CORPORATE GIFTING', 1),
(3, 'glo', 2, 'GLO CG', 1),
(4, 'airtel', 4, 'AIRTEL CG', 1),
(5, 'etisalat', 3, '9MOBILE CG', 1),
(7, 'mtnawoof', 1, 'MTN AWOOF', 1),
(9, 'mtnshare', 1, 'DATA SHARE', 1),
(10, 'mtncoupons', 1, 'DATA COUPONS', 1),
(11, 'mtnsme2', 1, 'MTN SME 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `referal_earn_transaction_tbl`
--

CREATE TABLE `referal_earn_transaction_tbl` (
  `id` int(11) NOT NULL,
  `buyer_email` varchar(255) NOT NULL,
  `referal_email` varchar(255) NOT NULL,
  `earn_amount` int(11) NOT NULL,
  `trans_id` varchar(255) NOT NULL,
  `date_trans` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referal_tbl`
--

CREATE TABLE `referal_tbl` (
  `id` int(11) NOT NULL,
  `referal` varchar(255) NOT NULL,
  `referee` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `date_refer` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_checker_pin_sell_tbl`
--

CREATE TABLE `result_checker_pin_sell_tbl` (
  `id` int(11) NOT NULL,
  `exam_type` varchar(255) NOT NULL,
  `direct_price` int(11) NOT NULL,
  `our_price` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `date_add` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result_checker_pin_sell_tbl`
--

INSERT INTO `result_checker_pin_sell_tbl` (`id`, `exam_type`, `direct_price`, `our_price`, `status`, `date_add`) VALUES
(1, 'waec', 3900, 3950, 1, '2026-04-01 08:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `save_pin_and_token_buy`
--

CREATE TABLE `save_pin_and_token_buy` (
  `id` int(11) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `trans_id` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `date_buy` timestamp NOT NULL DEFAULT current_timestamp(),
  `super_admin` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sme_data_tbl`
--

CREATE TABLE `sme_data_tbl` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `network_id` int(11) NOT NULL,
  `direct_price` int(11) NOT NULL,
  `our_price` int(11) NOT NULL,
  `data_bundle` varchar(255) NOT NULL,
  `data_duration` varchar(255) NOT NULL,
  `data_type_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sme_data_tbl`
--

INSERT INTO `sme_data_tbl` (`id`, `plan_id`, `network_id`, `direct_price`, `our_price`, `data_bundle`, `data_duration`, `data_type_id`, `status`) VALUES
(1, 7, 1, 410, 430, '1 GB', '7 Days', 1, 1),
(2, 44, 1, 980, 720, '1.5 GB', '7 Days', 1, 1),
(3, 212, 1, 320, 270, '500 MB', '7 Days', 1, 1),
(4, 213, 1, 4450, 2700, '10 GB', '30 Days', 1, 1),
(5, 512, 1, 2450, 1200, '3.5 GB', '30 Days', 1, 1),
(6, 513, 1, 3430, 2000, '7 GB', '30 Days', 1, 1),
(7, 515, 1, 4900, 2900, '20 GB', '7 Days', 1, 1),
(8, 521, 1, 1450, 900, '3 GB', '30 Days', 1, 1),
(9, 522, 1, 2000, 1350, '5 GB', '30 Days', 1, 1),
(10, 524, 1, 870, 600, '2 GB', '30 Days', 1, 1),
(11, 542, 1, 445, 320, '1.2 GB', '30 Days', 1, 1),
(12, 543, 1, 200, 130, '501 MB', '7 Days', 1, 1),
(13, 555, 1, 784, 560, '1.1 GB', '7 Days', 1, 1),
(14, 558, 1, 510, 360, '1 GB', '30 Days', 1, 1),
(15, 568, 1, 270, 210, '1 GB', '1 Day', 1, 1),
(16, 571, 1, 600, 460, '2.5 GB', '1 Day', 1, 1),
(17, 8, 1, 1470, 900, '2.1 GB', '30 Days', 1, 1),
(18, 11, 1, 2450, 1400, '6 GB', '7 Days', 1, 1),
(19, 282, 1, 1450, 900, '3 GB', '30 Days', 11, 1),
(20, 283, 1, 2000, 1350, '5 GB', '30 Days', 11, 1),
(21, 284, 1, 4450, 2700, '10 GB', '30 Days', 11, 1),
(22, 523, 1, 870, 600, '2 GB', '30 Days', 11, 1),
(23, 525, 1, 410, 330, '1 GB', '7 Days', 11, 1),
(24, 545, 1, 445, 320, '1.2 GB', '30 Days', 11, 1),
(25, 547, 1, 200, 130, '501 MB', '7 Days', 11, 1),
(26, 551, 1, 3450, 2200, '11 GB', '7 Days', 11, 1),
(27, 556, 1, 320, 270, '500 MB', '7 Days', 11, 1),
(28, 559, 1, 510, 360, '1 GB', '30 Days', 11, 1),
(29, 569, 1, 270, 210, '1 GB', '1 Day', 11, 1),
(30, 572, 1, 600, 460, '2.5 GB', '1 Day', 11, 1),
(31, 235, 1, 287, 220, '1 GB', '30 Days', 2, 1),
(32, 237, 1, 574, 440, '2 GB', '30 Days', 2, 1),
(33, 239, 1, 851, 680, '3 GB', '30 Days', 2, 1),
(34, 240, 1, 1435, 1100, '5 GB', '30 Days', 2, 1),
(35, 241, 1, 2870, 2200, '10 GB', '30 Days', 2, 1),
(36, 242, 1, 3975, 3200, '15 GB', '30 Days', 2, 1),
(37, 243, 1, 5740, 4400, '20 GB', '30 Days', 2, 1),
(38, 244, 1, 10600, 8500, '40 GB', '30 Days', 2, 1),
(39, 246, 1, 150, 100, '500 MB', '30 Days', 2, 1),
(40, 274, 1, 100, 70, '250 MB', '30 Days', 2, 1),
(41, 275, 1, 75, 55, '150 MB', '30 Days', 2, 1),
(42, 285, 1, 40, 30, '50 MB', '30 Days', 2, 1),
(43, 332, 1, 490, 380, '1.1 GB', '1 Day', 7, 1),
(44, 333, 1, 980, 760, '3.2 GB', '2 Days', 7, 1),
(45, 334, 1, 3430, 2700, '11 GB', '7 Days', 7, 1),
(46, 470, 1, 588, 460, '1.5 GB', '2 Days', 7, 1),
(47, 471, 1, 2450, 1800, '6 GB', '7 Days', 7, 1),
(48, 472, 1, 5500, 4200, '15 GB', '30 Days', 7, 1),
(49, 548, 1, 445, 340, '1.2 GB', '30 Days', 7, 1),
(50, 549, 1, 200, 150, '501 MB', '7 Days', 7, 1),
(51, 256, 2, 90, 70, '200 MB', '14 Days', 3, 1),
(52, 257, 2, 210, 170, '500 MB', '30 Days', 3, 1),
(53, 259, 2, 820, 680, '2 GB', '30 Days', 3, 1),
(54, 260, 2, 1230, 1000, '3 GB', '30 Days', 3, 1),
(55, 261, 2, 2050, 1700, '5 GB', '30 Days', 3, 1),
(56, 262, 2, 4100, 3400, '10 GB', '30 Days', 3, 1),
(57, 328, 2, 410, 350, '1 GB', '30 Days', 3, 1),
(58, 560, 2, 350, 290, '1 GB', '7 Days', 3, 1),
(59, 561, 2, 1050, 870, '3 GB', '7 Days', 3, 1),
(60, 562, 2, 1750, 1450, '5 GB', '7 Days', 3, 1),
(61, 467, 2, 500, 380, '2.5 GB', '2 Days', 3, 1),
(62, 469, 2, 300, 220, '1.5 GB', '1 Day', 3, 1),
(63, 484, 2, 2000, 1600, '10 GB', '7 Days', 3, 1),
(64, 485, 2, 200, 150, '750 MB', '1 Day', 3, 1),
(65, 248, 4, 490, 420, '500 MB', '7 Days', 4, 1),
(66, 249, 4, 785, 700, '1 GB', '7 Days', 4, 1),
(67, 250, 4, 1470, 1100, '2 GB', '30 Days', 4, 1),
(68, 251, 4, 2450, 2000, '6 GB', '7 Days', 4, 1),
(69, 253, 4, 100, 80, '100 MB', '1 Day', 4, 1),
(70, 254, 4, 300, 240, '300 MB', '2 Days', 4, 1),
(71, 255, 4, 3940, 3200, '10 GB', '30 Days', 4, 1),
(72, 516, 4, 2940, 2400, '8 GB', '30 Days', 4, 1),
(73, 455, 4, 550, 420, '2 GB', '2 Days', 4, 1),
(74, 456, 4, 120, 95, '300 MB', '2 Days', 4, 1),
(75, 457, 4, 60, 45, '150 MB', '1 Day', 4, 1),
(76, 458, 4, 2050, 1600, '7 GB', '7 Days', 4, 1),
(77, 518, 4, 4900, 3900, '13 GB', '30 Days', 4, 1),
(78, 528, 4, 520, 400, '1.5 GB', '7 Days', 4, 1),
(79, 531, 4, 420, 330, '1.5 GB', '2 Days', 4, 1),
(80, 533, 4, 780, 620, '4 GB', '2 Days', 4, 1),
(81, 534, 4, 1040, 820, '5 GB', '2 Days', 4, 1),
(82, 537, 4, 19600, 15500, '100 GB', '30 Days', 4, 1),
(83, 539, 4, 14700, 11500, '60 GB', '30 Days', 4, 1),
(84, 540, 4, 9800, 7800, '35 GB', '30 Days', 4, 1),
(85, 552, 4, 220, 170, '600 MB', '2 Days', 4, 1),
(86, 553, 4, 220, 170, '600 MB', '2 Days', 4, 1),
(87, 450, 4, 3050, 2400, '10 GB', '30 Days', 4, 1),
(88, 454, 4, 550, 420, '2 GB', '2 Days', 4, 1),
(89, 459, 4, 60, 45, '150 MB', '1 Day', 4, 1),
(90, 460, 4, 120, 95, '300 MB', '2 Days', 4, 1),
(91, 465, 4, 2050, 1600, '7 GB', '7 Days', 4, 1),
(92, 517, 4, 4900, 3900, '13 GB', '30 Days', 4, 1),
(93, 529, 4, 520, 400, '1.5 GB', '7 Days', 4, 1),
(94, 530, 4, 420, 330, '1.5 GB', '2 Days', 4, 1),
(95, 532, 4, 780, 620, '4 GB', '2 Days', 4, 1),
(96, 535, 4, 1040, 820, '5 GB', '2 Days', 4, 1),
(97, 536, 4, 19600, 15500, '100 GB', '30 Days', 4, 1),
(98, 538, 4, 14700, 11500, '60 GB', '30 Days', 4, 1),
(99, 541, 4, 9800, 7800, '35 GB', '30 Days', 4, 1),
(100, 263, 3, 20, 15, '25 MB', '30 Days', 5, 1),
(101, 293, 3, 50, 40, '100 MB', '30 Days', 5, 1),
(102, 294, 3, 100, 80, '300 MB', '30 Days', 5, 1),
(103, 265, 3, 250, 200, '1 GB', '30 Days', 5, 1),
(104, 266, 3, 375, 300, '1.5 GB', '30 Days', 5, 1),
(105, 267, 3, 500, 400, '2 GB', '30 Days', 5, 1),
(106, 268, 3, 750, 600, '3 GB', '30 Days', 5, 1),
(107, 296, 3, 1000, 800, '4 GB', '30 Days', 5, 1),
(108, 271, 3, 1125, 900, '4.5 GB', '30 Days', 5, 1),
(109, 270, 3, 1250, 1000, '5 GB', '30 Days', 5, 1),
(110, 273, 3, 130, 100, '500 MB', '30 Days', 5, 1),
(111, 272, 3, 2750, 2200, '11 GB', '30 Days', 5, 1),
(112, 295, 3, 3750, 3000, '15 GB', '30 Days', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sme_data_type_tbl`
--

CREATE TABLE `sme_data_type_tbl` (
  `id` int(11) NOT NULL,
  `data_type` varchar(255) NOT NULL,
  `network_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sme_data_type_tbl`
--

INSERT INTO `sme_data_type_tbl` (`id`, `data_type`, `network_id`, `title`, `status`) VALUES
(1, 'glo', 2, 'GLO', 1),
(2, 'mtnsme', 1, 'MTN SME', 1),
(3, 'mtncg', 1, 'MTN CORPORATE', 1),
(4, 'airtel', 4, 'AIRTEL', 1),
(5, 'etisalat', 3, '9MOBILE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sme_network_tbl`
--

CREATE TABLE `sme_network_tbl` (
  `id` int(11) NOT NULL,
  `network_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sme_network_tbl`
--

INSERT INTO `sme_network_tbl` (`id`, `network_name`, `status`) VALUES
(1, 'MTN', 1),
(2, 'GLO', 1),
(3, '9MOBILE', 1),
(4, 'AIRTEL', 1),
(6, 'SMILE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_url_link_tbl`
--

CREATE TABLE `sub_url_link_tbl` (
  `id` int(11) NOT NULL,
  `sub_link` varchar(255) NOT NULL,
  `sub_link_name` varchar(255) NOT NULL,
  `url_id` int(11) NOT NULL,
  `sub_url_role` int(11) NOT NULL,
  `sub_link_icon` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_url_link_tbl`
--

INSERT INTO `sub_url_link_tbl` (`id`, `sub_link`, `sub_link_name`, `url_id`, `sub_url_role`, `sub_link_icon`, `status`) VALUES
(2, 'add-sub-url', 'Add Sub-Url', 1, 1, '', 1),
(4, 'manage-url', 'Manage Url', 1, 1, 'dfsfds', 1),
(6, 'dashboard/wallet-transaction', 'Wallet Transaction', 7, 3, 'erwdwefwe', 1),
(8, 'dashboard/add-client', 'Airtime Transaction', 12, 1, '.', 1),
(9, 'dashboard/manage-client', 'Payment History', 12, 1, '.', 1),
(15, 'dashboard/manage-user', 'Manage Users', 14, 1, '.', 1),
(16, 'dashboard/add-user', 'Add User', 14, 1, '.', 0),
(25, 'dashboard/view-payment-summary', '', 0, 3, '', 1),
(26, 'dashboard/payment-verify', '', 0, 3, '', 1),
(27, 'dashboard/change-password', '', 0, 3, '', 1),
(28, 'dashboard/topup', 'Airtime VTU', 18, 3, '', 1),
(29, 'dashboard/data-topup', 'Data Bundle', 18, 3, '', 1),
(30, 'dashboard/add-faq', 'Add FAQ', 19, 1, '', 1),
(31, 'dashboard/manage-faq', 'Manage FAQ', 19, 1, '', 1),
(32, 'dashboard/credit-wallet', 'Fund Wallet', 7, 3, '', 1),
(33, 'dashboard/subscription/dstv', 'DSTV Subscription', 20, 3, '', 1),
(34, 'dashboard/subscription/gotv', 'Gotv Subscription', 20, 3, '', 1),
(35, 'dashboard/subscription/startimes', 'Startimes Subscription', 20, 3, '', 1),
(36, 'dashboard/subscription/showmax', 'ShowMax Subscription', 20, 3, '', 1),
(37, 'dashboard/electricity/ikeja-electric', 'Ikeja Electric Payment', 21, 3, '', 1),
(38, 'dashboard/electricity/eko-electric', 'Eko Electric Payment', 21, 3, '', 1),
(39, 'dashboard/electricity/kano-electric', 'KEDCO - Kano Electric', 21, 3, '', 1),
(40, 'dashboard/electricity/abuja-electric', 'Abuja Electricity Distribution Company- AEDC', 21, 3, '', 1),
(41, 'dashboard/electricity/portharcourt-electric', 'PHED - Port Harcourt Electric', 21, 3, '', 1),
(42, 'dashboard/electricity/jos-electric', 'Jos Electric - JED', 21, 3, '', 1),
(43, 'dashboard/electricity/kaduna-electric', 'Kaduna Electric - KAEDCO', 21, 3, '', 1),
(44, 'dashboard/electricity/ibadan-electric', 'IBEDC - Ibadan Electricity Distribution ', 21, 3, '', 1),
(45, 'dashboard/my-trans-history', 'Transaction History', 23, 3, '', 1),
(46, 'dashboard/exam-pin?exam_type=waec', 'WAEC Result Checker PIN', 22, 3, '', 1),
(47, 'dashboard/cheap-data', 'SME Data', 18, 3, '', 1),
(48, 'dashboard/exam-pin?exam_type=waec-registration', 'WAEC Registration PIN', 22, 3, '', 1),
(49, 'dashboard/change-pass-pin', '', 0, 3, '', 1),
(50, 'dashboard/transfer-wallet-money', 'Transfer to other Wallet', 7, 3, '', 1),
(51, 'dashboard/exam-pin?exam_type=jamb', 'JAMB', 22, 3, '', 1),
(54, 'dashboard/my-earn', 'My Earning', 7, 3, '', 1),
(55, 'dashboard/request-cashout', 'Cash-Out Now', 26, 3, '', 1),
(56, 'dashboard/my-cashout-history', 'Cash-Out History', 26, 3, '', 1),
(57, 'dashboard/my-pin-and-token-trans', 'My Pin And Token History', 23, 3, '', 1),
(58, 'dashboard/manage-discount', 'Manage Discount', 17, 1, '', 1),
(59, 'dashboard/manage-sme-data', 'Manage SME Data', 17, 1, '', 1),
(60, '', 'DashBoard Notification', 28, 1, '', 1),
(61, '', 'Email Notification', 28, 1, '', 1),
(62, 'dashboard/manage-business-cac', 'Business CAC Requests', 15, 1, '.', 1),
(63, 'dashboard/cac-status', 'CAC status', 16, 3, '.', 1),
(64, 'dashboard/submit-cac-company', 'Company Registration', 16, 3, '.', 1),
(65, 'dashboard/submit-cac-business', 'Business Name Registration', 16, 3, '.', 1),
(66, 'dashboard/cac-settings', 'CAC Settings', 15, 1, '.', 1),
(67, 'dashboard/manage-company-cac', 'Company CAC Requests', 15, 1, '.', 1),
(69, 'dashboard/manage-verification', 'Verifications', 31, 1, '', 1),
(70, 'dashboard/verification-settings', 'Verification Settings', 31, 1, '', 1),
(71, 'dashboard/manage-nin-validation', 'NIN Validation Request', 31, 1, '', 1),
(72, 'dashboard/manage-nin-modification', 'NIN Modification Request', 31, 1, '', 1),
(73, 'dashboard/manage-plan', 'Manage Data Plan', 17, 1, '', 1),
(74, 'dashboard/add-plan', 'Add Plan', 0, 3, '', 1),
(75, 'dashboard/manage-plan-type', 'Manage Data Plan Type', 17, 1, '', 1),
(76, 'dashboard/add-plan-type', 'Add Plan Type', 0, 3, '', 1),
(77, 'dashboard/manage-nin-personalization', 'NIN Personalization Request', 31, 1, '', 1),
(78, 'dashboard/transfer-money', 'Transfer Money', 7, 3, 'erwdwefwe', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_token_auth`
--

CREATE TABLE `tbl_token_auth` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `selector_hash` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `is_expired` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_token_auth`
--

INSERT INTO `tbl_token_auth` (`id`, `email`, `password_hash`, `selector_hash`, `expiry_date`, `is_expired`) VALUES
(1222, 'omamode.joseph@gmail.com', '$2y$10$jMgX3yQbay1Oh5iMTmYAkeB.1fPQ.Fyn1X2ruxJSJGPpblnjxZQsS', '$2y$10$IAJuJxv06hdZ6OqEsu0xeueoBKxhN.0RiFBbAqnOpLc9LAcmA3WxS', '2025-09-12 10:33:49', 1),
(1223, 'omamode.joseph@gmail.com', '$2y$10$7piPkSwfbfQ.BkoDLu67suKEAofiFBzzHJM5LHKg//yzaIl8JZnkK', '$2y$10$N0sDOQu9cVIcvVg8osWOK.LZWLCabfKQHoC.y05N5a.FOpENfr856', '2025-09-12 10:37:44', 0),
(1224, 'softwareclone11@gmail.com', '$2y$10$0vx80MmAnEvJjXoJTQ.9Qu9IUfrJV/U3F4gT7Paf47Uefm3Drv27W', '$2y$10$hF05RtsNPUs2r1Gq6jTLT.YbIC3VGt0p33/qiB5SPAzt.Eh6rYkCS', '2025-09-12 11:48:40', 1),
(1225, 'oawel01@gmail.com', '$2y$12$2ucjA6J16.412lIXy3nHjuJFUcleEyFtnIVPKqWPOaVXJwfLXY3FC', '$2y$12$XUBnb1/z.0J0pOYP3JGo6eG7RfAF5mCd0d0rhDRHBsy0yTWm3IKAG', '2025-09-12 16:32:20', 1),
(1226, 'softwareclone11@gmail.com', '$2y$12$M.2M6T47PENEEeece37jqe//aQYw5wHopJlhQf78if3aQ6t8t50hO', '$2y$12$wqAKhs5eNruxsz/39tU9/uNmmnZsMzhC8Tk0Rc50KCQ7KjMSPdjYO', '2025-09-12 23:26:29', 1),
(1227, 'softwareclone11@gmail.com', '$2y$12$DoaQljuc8FYZXQNnoNx2L.deMlxViePX01MTt3xnbG2Dty1vMbwd.', '$2y$12$Vz/9gcCuo0AIddZSoFvKuuXtMP1GzrhBNv9SoSdHl8z6W9crNsPrK', '2025-09-13 12:28:15', 1),
(1228, 'softwareclone11@gmail.com', '$2y$12$fiMVOFVEJphrHF07jP3VquPQkBv/56vQ5H63V6b5FWX0MFcPZCbLi', '$2y$12$CHWmz.5P.2oJiTrDEAYrE.8JtpBc66Icz1XJVbQ87VaQXZyqcGyRe', '2025-09-13 15:53:05', 1),
(1229, 'softwareclone11@gmail.com', '$2y$12$h0XciysFXc8W1t2fSrzZKOS/SccjCX1hljz9wGQ7J5cjn.ktqnxZG', '$2y$12$E1abH0wSqj4AfVYo20siVukdwMDNdR2hAkbNkOOkJR8QFkGI11I9K', '2025-09-13 20:21:12', 1),
(1230, 'softwareclone11@gmail.com', '$2y$12$GBHu9f27oBhQwdGBpMlgc.bE2EvSrsW/PlQLdrWpxeUYKTcX0/0x.', '$2y$12$LFeeRvW1m8jDF7mAfzT77O0F6n1PSkUk4nJ.ItsWEkTUtQbS0yE.G', '2025-09-14 06:53:26', 1),
(1231, 'softwareclone100@gmail.com', '$2y$12$Eq9ETTctM7w9jcFDT3URzel715KzEFA8lA2JLMZYg29oCd9BHPGJm', '$2y$12$04h1tqtaYXZVh5U2VTy.MuYUjLx4A.UH3Fr9QY1QqqCrbV1fo7awK', '2025-09-14 12:18:48', 1),
(1232, 'softwareclone11@gmail.com', '$2y$12$V74CVinI1sKlGbY43ioVsezNO7TdhDJwoS0tj9F1W90TwSsvGrZdu', '$2y$12$aCxbQS3BkMBaqrasmX.3UuA.UcTFtUY.fs9kqLEf28CwaBteXA.c6', '2025-09-14 12:19:14', 1),
(1233, 'softwareclone100@gmail.com', '$2y$12$5TMFE2zpGspElgnPgskrA.9hIi9qPwsjxt1f8lJ5f2gwI/NgvoOJe', '$2y$12$xONfCtoRxLrkKbH6wPzxmObunNy7uGCtuLWpDFUohj/uTwYDpGVwq', '2025-09-14 13:56:04', 1),
(1234, 'softwareclone11@gmail.com', '$2y$12$n/Ow47bWhfVfHmGKZn3.yulheLRA6mIJq3hm8bSQAHEo03WwABTIm', '$2y$12$Mg.JMN1bGBSj3j/q/RGSouPAMunY3N7fv4JwqHBMRRlFcNheOp8Dm', '2025-09-14 14:43:08', 1),
(1235, 'softwareclone11@gmail.com', '$2y$12$8FrfarK49nrTfYKV53Ogyetg26VMJaM4rqTTo30WIHRorzAY9sHUy', '$2y$12$jghSmsHYQiEJNA1E6.LDZuF8fmKJJj5VEENx81B0.oPo7A9a6zYxm', '2025-09-14 18:19:53', 1),
(1236, 'softwareclone11@gmail.com', '$2y$12$uBmbypYSDwTRni4RxR2d3.6er4sE6QBMYtudzelq2TYmzdn2LDNBO', '$2y$12$rfXky7ybdVA0IWM85p19HOE7NVCROTjgxsnXmYCsedUTjSvqds1RO', '2025-09-14 19:33:48', 1),
(1237, 'oawel01@gmail.com', '$2y$12$QzA1IG/jX9IPvFXRFC.chuion6D9kFNQsVo9H1tFjoj2znjawSxSC', '$2y$12$PNvn1D/ZXuVaXy5NB/Q79ecioB9bKEjoH7SIGfV0.BipAXrf8HOR6', '2025-09-14 19:48:14', 1),
(1238, 'oawel01@gmail.com', '$2y$12$FwaS.0csQroiklypoGWQ3OQ.QTls8AQ4vVOuimORt0UZk6PkbQc/W', '$2y$12$yaihDa8NeahiaDa.phaHgumJ.i4uUYBDyTV5CrZ/V8KsupZUMNv86', '2025-09-14 19:59:15', 1),
(1239, 'Ajayiolaoluwa2014@gmail.com', '$2y$12$OtG4c649bKDfYbeSGXQkQ.w4gDZb9sAonmIBwCfO5Co9qNU5KlK5W', '$2y$12$agS2Ijo8qa6x0La/FDrjxOw.X1AQUVn/.VYXKsGIw70dAVc9ESCA2', '2025-09-15 10:53:23', 1),
(1240, 'softwareclone100@gmail.com', '$2y$12$FgV5UNQJwEmPjgDAUndRLO.hx/V9zdfj./IDxb16m4VEe.r08PDGK', '$2y$12$ghIiXwAgpUOqG/JkDDx9pOG9wLO8zyKusXdx7o4FdrafYVQFfSb7e', '2025-09-15 11:35:54', 1),
(1241, 'Ajayiolaoluwa2014@gmail.com', '$2y$12$2X61Fm.Rn02k3ZZM8z11mueqswEtm6eAqlDXqiqwBEdKxxXSpaDsm', '$2y$12$smUhD8C2WEv7hN4RbMokVeOjOIVq2gLCuLEU41whye8xCtKyzaU7m', '2025-09-15 11:58:28', 1),
(1242, 'softwareclone100@gmail.com', '$2y$12$LfCIQF4Tt4QuqBNQ1WMawu3vLYMnWCdRFuMvFSVHOj3dEG/S95b5e', '$2y$12$U/BezPDUbi3wsnwPOgM0jek6Hz3/oJ6N.s2xP9voSAW5BRVQsoOLK', '2025-09-15 12:23:22', 1),
(1243, 'softwareclone100@gmail.com', '$2y$12$sMNA/o4by354mvSRt2ZRDel0XH04PdW7/Svjamm3zpVQhElcOezXO', '$2y$12$6v6v6qDwbWsmQ5pXraKPk..pjJBpbxin7FX5VsiYANvLU/dY3ewbu', '2025-09-15 12:57:27', 1),
(1244, 'Ajayiolaoluwa2014@gmail.com', '$2y$12$X0aK3JH3xhy4RVA8rYhFkOTIY/W5XYhD/5yMudDXXk5ZI7/o6BO.G', '$2y$12$sKMAyqoZgk1gGJOm0Afo5.canWSnu9O4WqGer2pyrzeWnaHbtqU5y', '2025-09-15 12:59:53', 1),
(1245, 'softwareclone11@gmail.com', '$2y$12$8.80u5SqxGj2bs.xj0DGvuUpcR3SiVY3Dfu1XbYAfLOyhJWTAolli', '$2y$12$W3ez19X/etkNMqoCsC6JXO.ca.4wbc/Be.BGuZn5risynr5R/6ymu', '2025-09-15 15:31:35', 1),
(1246, 'softwareclone100@gmail.com', '$2y$12$7kVHAlJyOthI1P90RgHdTeqhOXo93SL7k8Cd13MGwiShv7h1iHWL6', '$2y$12$74lHAE6oskgh5ihOyDUyUe0h.AeNloXVf80.2rhwhGNTVJjmPBDNm', '2025-09-15 19:18:33', 1),
(1247, 'softwareclone100@gmail.com', '$2y$12$nwNMxuNAZ8BIKY5PL.QGse9wb6MVcErnJfqWu8PIqptLUWUGK9ijO', '$2y$12$LuM2EbsjYRoStBm2Jfjkbu6Aw0ifWZK08CfRB4So6O8DpRvznsbw6', '2025-09-15 19:28:28', 1),
(1248, 'softwareclone11@gmail.com', '$2y$12$75L22c5FIF09KFaQ0AD02ul190OAxb.E7c56ESmFDLkodOMoIgnhS', '$2y$12$vkgf40sJUZUMbOORJgj.jeagHiWrtg/Y6S4m78jH4S2RPYKJTJ1My', '2025-09-16 00:48:26', 1),
(1249, 'softwareclone11@gmail.com', '$2y$12$n0r0fTp/jO2fEE3XuUwmSecckw2o2JvnzITkwmsdjdZIgo2e6zj0y', '$2y$12$tv1wgiOeT3SrGH4hqkI.be.4rBcjxY2VFsuWMYglzCKRQCjZ/k6Si', '2025-09-16 09:10:11', 1),
(1250, 'softwareclone11@gmail.com', '$2y$12$l2euBpQdAZpjlvngIraDyOAQbjQQ8IVr26zvOaMBbvYXSL9IZ68Ti', '$2y$12$bmGjTHRZ/Ndk/IfsKAbVduZk02SG/kWoCjzVoBLWMctdhMWgPV4jO', '2025-09-16 21:20:30', 1),
(1251, 'oawel01@gmail.com', '$2y$12$CJxIJpjAIwbtvRNA9Jky4eQ6yUldkUU0w03H7OtCC5oTh6rBH2DJ.', '$2y$12$Fqo5Q.lYbsFNNsDrvTkahOp3xrXnRSgj.uCEvDbrE8mMNfuOSAt2m', '2025-09-17 09:15:52', 1),
(1252, 'oawel01@gmail.com', '$2y$12$8l0BHpGKlpfjvPPhDIGQiuutWMSpM9AJsx4ikRdyprqSz30bkQIW.', '$2y$12$Wkh3uPdIISACoK4CPWI1Z.jZt66WDzEJ/vIRxZvvvfHW1Xi8DE2sa', '2025-09-17 10:26:58', 1),
(1253, 'oawel01@gmail.com', '$2y$12$uqypgWnSMRkVnPaFK39Qnu87jv2Jp4nVeh2tLSOUELZmoPcf/ec8e', '$2y$12$5wUxKayKVHINQfMCp5qf4OfYHAHAx/tj8Apf3MRDpI4oZWcTK1kUC', '2025-09-17 10:30:00', 1),
(1254, 'oawel01@gmail.com', '$2y$12$CSGnfXhiSy3KK3v93Eoa/eOpQ4.mCwsjMEDeaDSsJiNUoBb7tAQOu', '$2y$12$T2nm0.U0/PdTSIORsW.z4OqCXZvn3pWdLfQPl7GdfyCLzTkm5IZAa', '2025-09-17 10:31:38', 1),
(1255, 'softwareclone11@gmail.com', '$2y$12$pesq4f2Mczy1FES1Tsi0FOUk7mePBz/tCKkS9vc6ovZWVHSuOpt6m', '$2y$12$TN/x2RD84jMoDfREJSj96uOMj5VbBrOrtr0jhRwR7CIERDyQZwJjW', '2025-09-17 10:36:29', 1),
(1256, 'oawel01@gmail.com', '$2y$12$/cynxE9ph/rOrzLndt6zvu3bHPOg93jkTX1OdtqYC6Gp5vEmFZ68i', '$2y$12$Ztpu9Q3u3x3DMtcVBlyB2e0YEmII5iV4ioZfmTmSoU8oXUZwfpf9.', '2025-09-17 11:42:02', 1),
(1257, 'oawel01@gmail.com', '$2y$12$Ae/u6I66ocp7IWnygoKade7W2SA4vz8XcSgz3Sxg490GqPwmvzvkW', '$2y$12$m5Ski3WD6bwXtC4jlGmOi.6NTN3G2hcJGuNPPTkT8ilIhWPvy09A.', '2025-09-17 12:00:06', 1),
(1258, 'oawel01@gmail.com', '$2y$12$HlMpNyRLUS5QCp2c5cHwnOUZ0KDzV0Cu3Kve0oGAeV0AtULYfa7WO', '$2y$12$MbqpFEtOjcR6pLYlo9nGUOEXBklVP/8n1dhKq8V21DvAdMPJ6XxbC', '2025-09-22 10:21:21', 1),
(1259, 'softwareclone11@gmail.com', '$2y$12$Wf6fQDEufyR0X6vS1zkOm..b1HEd16r.YmOMagOjVqf7w1Mg9jGNy', '$2y$12$7lEo136AkCGOxvTqXCqSHO98y098VXFVYxPfJ9FLSjuKPkcnIJ/xS', '2025-09-22 11:21:01', 1),
(1260, 'softwareclone100@gmail.com', '$2y$12$COEW9uFufvwkDEPdSHvvhe.i8HOJ7oa0..AjJJftPMoIHnkz1vsd6', '$2y$12$76cgJ4c2mkPJQMFSZbD6t.AlrmRe7JB02.bFha.9RkipCDXB3BZk6', '2025-09-24 18:48:40', 1),
(1261, 'softwareclone11@gmail.com', '$2y$12$LiAft5NX4lI4No/5vxEr.udIWycDwr7aEc95qFATzPSb756gER6q.', '$2y$12$HoY5U5l5zj6L1WdiAz9EE.74N3Ky8bl3C0VqCVxiNiA6fDVTz9H0a', '2025-09-28 13:42:59', 1),
(1262, 'softwareclone11@gmail.com', '$2y$12$zXmJP57iFMfJEPL1817DVOLjZrmxHsDkS7J2yGapGMfmOJA7Ae/vu', '$2y$12$zV2zo9Oq74mXXT0mg78G7ey8iyg.L7A2aa2irkjmNU3IGRLNpSFK6', '2025-09-28 13:50:37', 1),
(1263, 'softwareclone11@gmail.com', '$2y$12$ZsFdRwJWp5LmqJsMqKn6bOkmhuWLq73ZC5c5xqNbgYfaLkWdR3nom', '$2y$12$9Dli6p8VuyCSGP.fDwWimeEdtoqOOSmbss5jrxFDkI2zdRfLyLfHC', '2025-09-28 14:01:38', 1),
(1264, 'softwareclone11@gmail.com', '$2y$12$N.TRPN13ZD8LAt1FBdm7b.hkBO/mmOsWAFm.4hxEDoQqIC35dS70C', '$2y$12$dS2r1db.RHG001kmHWpMC.PclyrrT8ONf2FzIGwCds/tnjBSgHhNa', '2025-09-28 16:22:09', 1),
(1265, 'softwareclone11@gmail.com', '$2y$12$2o8YBn9E1bi/mIHh5dYdHOmwsbUUMsqiPe8Y35c.h2kXhlV8vPWJi', '$2y$12$iIiFaO64wxbejAPoOMvEI.rvnv5KHmsP8Gx9GF.PURyiCwZ7TIoVy', '2025-11-02 05:58:42', 1),
(1266, 'softwareclone100@gmail.com', '$2y$12$COx7yjtX1qaHs1.2bCENOO8mx88l4tgfbox91eAhYFVbc1ekaMh7K', '$2y$12$bhvd5F6lV58/NA6buxHLt.5LXpFnAL0Atmjep4pmtKMC54q4ZXOQa', '2025-11-02 06:59:55', 1),
(1267, 'softwareclone100@gmail.com', '$2y$12$3KnN2yUDQS5wfPei5sTadOtT42Ecbt17v/hahu57LTWjQQ.f6E2gS', '$2y$12$21rJhaChZ5caoFoMFYzsHOHFv0MUTUdBuLrdEP06foeBQngnN4qem', '2025-11-03 09:49:53', 1),
(1268, 'oawel01@gmail.com', '$2y$12$R4WX/1Zq3retfU565QR9Auvu/lMiJL/wREM9QiHnGFCHJbHqSJjBe', '$2y$12$FdoW9h1rG1yXRf0/Lye.s.1dj.wjYyXRqaaxFKbxIsxSvVHR4CTke', '2025-11-10 11:17:47', 1),
(1269, 'oawel01@gmail.com', '$2y$12$F/7ZBnyWZaxWpOBaV1Jdm.QotPJ7mYPzx1zHw6E9SiacTRKwRyn3u', '$2y$12$8OSQ2fOpqH8Tvwmknaf.keT36lEAV1t8HtV9YhGKDKEmImOwLMsWS', '2025-11-11 14:49:20', 1),
(1270, 'oawel01@gmail.com', '$2y$12$VX8l07YZqG/9PkVgGje6XuQAAzRHxxkZkqgVL0PF/iXK7euLqT9x6', '$2y$12$O24PRqDSAetq/6m6iuVSY.Yi69C7OrwriH5b.BW5jN9BzQ3rAmypi', '2025-11-11 17:28:00', 1),
(1271, 'oawel01@gmail.com', '$2y$12$dMoKG/mjugKPLCCs96Tqguff27rVm8RY8gYhVDXyOoRpm/5LjcBvq', '$2y$12$0bpaQWBzARSkbtesWKlhZ.HEV1UkSNxSjkYSTwYdgOZfH6GtyprlO', '2025-11-12 12:53:26', 1),
(1272, 'rahmahhabib083@gmail.com', '$2y$12$4EjDYg0JCCqdSZ2tJ.L8M.52Cd90O/O56ymktAWwVxDpjHqdQH5hu', '$2y$12$aB24Dfnyt5cSY3ipIOnVNO3f4/PE7NRQQiXvd2gdkMkydEjzV44V.', '2025-11-13 09:40:54', 1),
(1273, 'softwareclone11@gmail.com', '$2y$12$y6uw6ViOMrjvzgzgZwkmd.LqTQFbedTvthYDZ6kT60Ws119fSGae2', '$2y$12$ehDhdBytNQD8sqb8Z5vixeV6n.nHL/XEB6NXKI61NTgqCESPN48Li', '2025-11-17 16:25:43', 1),
(1274, 'softwareclone11@gmail.com', '$2y$12$kTLK5hyGB6L9S8yk9Eacl.9iTfNVcRr.TI3sIGEdiXu4BfrXr1vA2', '$2y$12$Ucz9xOkQ1yBWYXnkAw29tus3NW6DY9RKfmk0pcdIwrDYKyw0OjohS', '2025-11-17 16:27:42', 1),
(1275, 'softwareclone11@gmail.com', '$2y$12$JNqyjnM141k3/y5q09Nc6.NFQdOyUgHmhpCwT4T.6DHYu4jd9xEcO', '$2y$12$PnLVImJX6XPXtPZHVM4/yuRF1YtOilRZbXwEEsifND2WR/zvz5Noa', '2025-11-19 09:47:56', 1),
(1276, 'musasaidu090@gmail.com', '$2y$12$/qfozxUNgszM0Yx.kbkiNuJGGeeX5fGXf0G2.7NC/IT/6tVrzmVSm', '$2y$12$OyXQavdW5KrCnkJOg7RB.emSB80fdkbz7wXdWk15XgdDiOXzzx82C', '2025-11-19 13:10:21', 1),
(1277, 'softwareclone11@gmail.com', '$2y$12$cow2ChKPawoK.pd8Xh98TOwXjH7wRSAmmQoENEPdY6jbYNhXV5KFS', '$2y$12$2zDNUF702p8kJNV4HMrDfOzjl21MmICBI/xWgWFxKVbCmlZKYfADO', '2025-11-21 08:33:40', 1),
(1278, 'softwareclone100@gmail.com', '$2y$12$Tg2ii1qkZU3fl9NPK3WB6OpNPy2r0UD08IXZHEKlyzge3NHWQPW5S', '$2y$12$pTda51DE3kz53vs/E0iWhe2apRFpPARXNnT.hM5YyhkwyvcBvXpMG', '2025-11-21 08:40:57', 1),
(1279, 'oawel01@gmail.com', '$2y$12$0VPgbrqYEcenFG.WhrBrmeQRYG7gcHcWTOYD36db36GVAfbxnwPXG', '$2y$12$oIj7yQhEZq7r0K.EWQN73urnOtWyNSAka19tlZL1xo/L/Y4vKA7FS', '2025-11-21 10:32:04', 1),
(1280, 'softwareclone100@gmail.com', '$2y$12$ZTO8pkrlcQS0lWhHOsmqou86RF3JWNrq./T.zRlH2AgLKVrnltFly', '$2y$12$Sll2cDW5yNiaRFuxv5bMluSrzvt/3nsIMnnpC5BWMJDOtmqWTQXIm', '2025-11-21 15:42:55', 1),
(1281, 'Ajayiolaoluwa2014@gmail.com', '$2y$12$cdPiWLXw6Ns/NpS3AYbqLOCJTSAA6DgKxaVqGD8WaMaiCZips1l.K', '$2y$12$vQyzcbWycZ0H4394MGIO2.qv6KJRubVj4bcZY2dRCNnsVLXaW08QC', '2025-11-21 17:00:52', 0),
(1282, 'rahmahhabib083@gmail.com', '$2y$12$R2TiRdic6G8M4Ef7lK2PQOr7oWDAHKC1MwWegO3vCWtMFvvfnAVbO', '$2y$12$/RYtaj7OboLT16Vh3xAcYOx/xt52G6zz4Usq/BVk5AqiZKGLicnJu', '2025-11-26 12:06:10', 1),
(1283, 'oawel01@gmail.com', '$2y$12$J93lkr/ejJ83q3Tis6q64urLRJIVq5bEustk/R6U0aSUX2hgtvLpi', '$2y$12$BA7Ch16h6IAVjWoY40Wpm.u9mahjm12G02SLRSAdTWt9EG/Bwaxla', '2025-11-29 16:14:44', 1),
(1284, 'rahautextiles@gmail.com', '$2y$12$k.14ETvNOVE1x8AOhTP0i.1nXvMJRShQZnc.rX6/Vi8YbgbNe23R2', '$2y$12$hIC3U9iCx6g4DHbjFj4AD.98j6a4JeNAok40fRtGB3bd6.CGHWC4G', '2025-11-29 16:15:00', 1),
(1285, 'oawel01@gmail.com', '$2y$12$MpBEU4wraQOdtgv/vFj3qeW.zm.CsUmMotuY9SotDUpZa/wK5kmNy', '$2y$12$SZ8sZbdeIjNaG4ivBjIyresl1nerYtadkuQBZyXPQgaV2OhGnGJyS', '2025-11-29 16:15:51', 1),
(1286, 'softwareclone11@gmail.com', '$2y$12$9RbXd3By0uQtK9VJwK/e..zwGLYxpKccaJhBdl4ScZtZpDXRW13r6', '$2y$12$3BBes9EyuUABzaw6VNgthOksXko/QvXOuNWHUWk0zkTwpieuk2s4m', '2025-12-04 06:11:19', 1),
(1287, 'oawel01@gmail.com', '$2y$12$uys.1hJxttr677FdGpWYGOHLFbq/gFwVgTi4MQo/I592x5x/b7KLC', '$2y$12$OaiKWNZbsQtPepfSiaKADekY7owrNPBpJ5USmzVPZiQeW1R0eCtnW', '2025-12-04 14:23:55', 1),
(1288, 'annaleona00@gmail.com', '$2y$12$V.eNSHiT1QGS4pS2XiEAG.DGp.ahKNEnnQVncYGKx6FLiQ8p4QXbq', '$2y$12$tlr.eZxBZkGUxgGUSXsDmeQXpPTnESlKJRsXzAPx3n1uT9zgdUr1i', '2025-12-05 03:21:50', 1),
(1289, 'annaleona00@gmail.com', '$2y$12$wBTGZwZnlEiJ/eDJOQ8Bv.w2eQjITF4Y7w7ZR9IGJ6MCQpJUQ0oK2', '$2y$12$We.cMmn4kD2KUa4fENi.qOkcwjRQ0LNM9piLwJ6/RJ9NtQTGz4y4q', '2025-12-05 03:26:49', 1),
(1290, 'jonnywood158@gmail.com', '$2y$12$2QuO16hHYcYkX.ZyZuxIiuk30RruAzlOXhzTAB/qtH0t0ZP0BwzlS', '$2y$12$qYcQ/73lPo3yBIeDCd7KSuwpfxB0PuyaXDXhbSI64oHRYup6MV1yq', '2025-12-05 03:28:19', 1),
(1291, 'jonnywood158@gmail.com', '$2y$12$2BHfV1/AHnEkrgJg55/B/etMvGO3wHhyX3T2RAqGtkZOOZEMKKeRS', '$2y$12$VZgrXFpKBSjnH3VL0K1Obu67lCoKgzbuqgA/6xSyxYZI3nt59I4Pq', '2025-12-05 03:28:32', 1),
(1292, 'annaleona00@gmail.com', '$2y$12$go.i82AAgvw2f9ccfC4MkeKJfPZ45llnftVlI1R5mR.ISvPLfC5qS', '$2y$12$VR5L7I6b5aYHRGZYPn9dpu1SY6cqYB76/h4jpiHKFxq/gYdwXbo1m', '2025-12-05 03:30:08', 1),
(1293, 'annaleona00@gmail.com', '$2y$12$a8SWKK8M8MTv2KXTF.fFlet5bWD4UazuwoL11THm46m.omFEBamnW', '$2y$12$wsnsXPQdok516KUG97lBMuMWtiHhNlODxxmOJRmj/40Yf/NYs2vDq', '2025-12-05 03:30:08', 1),
(1294, 'annaleona00@gmail.com', '$2y$12$CqrXMRioDXj6iZTfw1Z3rOYNW5w3pEyUAV2L.rcfhaEYeUryDzs.e', '$2y$12$.Sw1rhXiuefr54C6VCro4unYai/akedF0YJ3Mfpark4ZySu4BTxM.', '2025-12-05 03:31:29', 1),
(1295, 'jonnywood158@gmail.com', '$2y$12$2phmOwwbJrP1nPdVaPQ1ruV/rakjfljA2Lbxju.STS1mRvpPrjjcS', '$2y$12$dhpuyNLfV.SSS62RCxYEGOiubT07FUp4DJQmw/o/eQpMpyu7ClwDO', '2025-12-05 03:33:01', 1),
(1296, 'jonnywood158@gmail.com', '$2y$12$cMku4NDpLcQAWzvLjuHGxerFuX1JpocD94T0P0Z2AyTjKX.Rn7KlS', '$2y$12$k5nO6xYI.pbtiAxJOLFmX.npDibw5cFBU/IQw7M1h./O8qc.Y.dSq', '2025-12-05 03:33:02', 0),
(1297, 'annaleona00@gmail.com', '$2y$12$pwtbjEAj1VvMmtWqEB8ohOL2W6ny9jg.DATW8hjoPl5IKqPzcZFia', '$2y$12$mljAGFwotbxkQLppWHhLHeLTsLrA/JNkl5vGlyah6nrzUUk9zxTdq', '2025-12-05 03:36:55', 0),
(1298, 'oawel01@gmail.com', '$2y$12$AN0smd2KhOHDTOr5lpn5tedFAQAQXysOoKPRhYLS4FuY4EuHos.E2', '$2y$12$Lwut4aQp.FunWrUYJ0nfJuQeFB0mAtHNgFB6O80QgvZ3R.GeXkkEi', '2025-12-05 13:19:13', 1),
(1299, 'oawel01@gmail.com', '$2y$12$ed2/8gYbimevN3Z2gkFH4uOLToR1kudZwanACkDq.p89Vm7RcQcEK', '$2y$12$vT7ypfSFieula4bpWGYKDeua3eCCyiF8HzyxgqVOgRLi1cydEVTJS', '2025-12-05 21:57:31', 1),
(1300, 'rahautextiles@gmail.com', '$2y$12$azQTSjaYDR1tyKjieisGcuhiI0xV2Z09R457pZdib2yHcIQdVTsPa', '$2y$12$uJNxdt3aeK7NPkiBgFX7zuftGXWDywhr2vZu9Kedo7Dtcky5KumoW', '2025-12-06 19:36:58', 0),
(1301, 'oawel01@gmail.com', '$2y$12$Ek.rVXI8ZAY85LmvxQdq9u7D.HuT3V2FiqqIar5JwjCKhRMNkNWsy', '$2y$12$m1CpD4E8kscDtKSSQht94.zjXhcZQRYEpwi6HLdPNGJNlpxQKDWTO', '2025-12-07 13:49:49', 1),
(1302, 'oawel01@gmail.com', '$2y$12$50NodbNzqye48kb172ki6e7JYByZbbB0ISsFRNS26NzMv6CVgGhhG', '$2y$12$AvhW//TBCWC.Q3MkcrZDjOKI4FY7Cn1m55kYFv9NMhtm7cg7muAZu', '2025-12-07 23:39:33', 1),
(1303, 'softwareclone8@gmail.com', '$2y$12$Z/Hk9175YSRqLSKTVW6QnuKGiZ9Av0vTV0xZddSj06LA3YaL72QnC', '$2y$12$7DAaekF5wGH2P11Vq/EWlOkf.nSL.DGIqYatgtr4nC6gYas53d8IC', '2025-12-08 14:50:35', 1),
(1304, 'oawel01@gmail.com', '$2y$12$hCnEMHluGcIWcvW/.j9Pc.Y5v1USzUeJHB.1PVWiLmH2JM69PVUWC', '$2y$12$mI3sEfsnWWzcZ5.v1u3hKeavJy6oX6SrzhKe2zepXXqQLdfkSIFQq', '2025-12-08 16:52:48', 1),
(1305, 'oawel01@gmail.com', '$2y$12$lw1Deja8amLIevpPAohxcOBZqFjDgPbKzf3hlNxrRS7Xs5HRNykBG', '$2y$12$oA8O.Vj1qtsijs1HrdwYcOaZ8ReQ5GOJ2bdbqSn1g9ojNPR847Y0u', '2025-12-08 19:38:19', 1),
(1306, 'rahmahhabib083@gmail.com', '$2y$12$k.5gprsm9Q3.02OAFWKNhewU5hZYmr2RVZj0E5us58torCHRuTLXO', '$2y$12$Gpx8HkrVnnQQAiMeRsYTJ.sDZuTIl2RVA5D8Qx1t6kz6EAIXa1JNq', '2025-12-08 21:02:17', 0),
(1307, 'oawel01@gmail.com', '$2y$12$PQAwTdG6CVnZ7vztVG.m0uGuVEUF3iEp.roLhP1we6rO5gT5ZUOje', '$2y$12$SmyNhIJA49shaGlBTB8E0e/iLwwDgT9OSAUFV9UrJqJK4yivGWpUW', '2025-12-09 11:26:06', 1),
(1308, 'oawel01@icloud.com', '$2y$12$PpdNBxGzH72mhgRk3LHkPuaN3s3aqCY/vCuuw0TUQ6tz5P4dtBAIu', '$2y$12$re8u7BX.zTER2pS5UqUTE.YFF3PvXGpnuw/0RgAuElBajlylMl3b6', '2025-12-16 10:42:23', 1),
(1309, 'softwareclone100@gmail.com', '$2y$12$AEWCRlM5ph./N2uSHyxgweQuebRuERdh3grNpuz96P/a3pJbfduuq', '$2y$12$CIE9UcCOO5I20YoUmTBPGubPMOvZdWEVJqk83AUKpbmLwEwyISlki', '2025-12-16 11:04:40', 1),
(1310, 'oawel01@gmail.com', '$2y$12$Akm9LAqUJUDNRG1t4etVu.kY3cBYg4MsuY3VqtvIykgvWyq/F9JlO', '$2y$12$ppkl0o/j2ziKqeZevIaC6.P4MiVzcDoNOdZyrIqbiqwQku/l4e69K', '2025-12-16 17:36:03', 1),
(1311, 'prosperjasper002@gmail.com', '$2y$12$Itt15yKlBpfrPLIrRszXY.1nPMipth7fQQ6JbVDtqR.o3ahi3/Qo6', '$2y$12$DzBqaR.l8R0k/QlNhmjJR..rQwpaZzOReFdpPD0r4oYJwjq8jQZHy', '2025-12-17 07:42:16', 1),
(1312, 'prosperjasper002@gmail.com', '$2y$12$6m9gCs/hCS0j/rUlY32kBuKBMDsV8LYNH0FvxHvq2jcF5RpiGX4aa', '$2y$12$re6nOnw9Gpcl5J6.gU4Ktew5OhrtJICK6lgF4d7iwOhr978IZ8eTe', '2025-12-17 10:50:55', 1),
(1313, 'prosperjasper002@gmail.com', '$2y$12$eo8AGBdTeTV7d52fy8nuouhBKxdbVeBaNJSjfb1ckGlB0dfxdl2IC', '$2y$12$d8hAGunFZLOOb6DW9cyixOLcp.4XylWIz.s4UknrrFeRF8gQjSg.K', '2025-12-17 17:37:56', 1),
(1314, 'prosperjasper002@gmail.com', '$2y$12$aw4T12hk4Koxs.R.ohFX6uEycvgl9c.VNgvVn8Qu7ynwQ.m.qUVKe', '$2y$12$PvQi7pMI8dKBEpAl1JLwEuTI2uXNfGxZPg9NDK.i4S0B6J6w87b.m', '2025-12-19 09:03:03', 1),
(1315, 'prosperjasper002@gmail.com', '$2y$12$Y/LjKNTLvH0nuIJn56l4RO76LWzXxR6ivZobhl91HlQYmTjz3QoGa', '$2y$12$0ZPKOcYmZnCy4wjXDbThje.j1lREWvHzOb77WOaQt/wUA3MKuKrwu', '2025-12-19 14:40:38', 1),
(1316, 'prosperjasper002@gmail.com', '$2y$12$v4IYNXQYZfMeYpyh7W80ke1gRB6HlIAEJCuzjw0K0QEHNZBL8YPbG', '$2y$12$enr9O3ITnKA6SKsvWDgXV.fgWb2KrB9ZRnam6e6jcIcuwtG6IWD5K', '2025-12-19 15:50:59', 1),
(1317, 'prosperjasper002@gmail.com', '$2y$12$4Q.u2.37.BMsMFJz5Fth.eNJqI55la8Q4exbBzld7Y8Dav2Egg1H.', '$2y$12$uPwRdmgIlwfppejUrYxLkeCIZMYO.wOhOt/SvFKIAbnEME49eRv/y', '2025-12-20 08:06:33', 1),
(1318, 'prosperjasper002@gmail.com', '$2y$12$9J4RDiDh06EM//D49I6gXOORkXblKxeYteBQSq0X4IN5SsqS7VP1K', '$2y$12$ggCnC/dVH3DxCtH33UL89.WTopsaNx8nmLayhvfoPdMFngbrNLQUG', '2025-12-20 17:15:16', 1),
(1319, 'prosperjasper002@gmail.com', '$2y$12$acXTW6kZs8IrTfiQof1JUuaz4fZ90pmIAWowoKfUJBa5iVlbhTSSC', '$2y$12$/oTPuENHLWT7x.Pe5ag9WeG3rtXj0jOkmjSf4TZEmxHDb5PyMlTLy', '2025-12-22 14:39:46', 1),
(1320, 'prosperjasper002@gmail.com', '$2y$12$sfn66LjmTdyvxM9zBmZ1Fec.AAZD2.AJxtZ6PgMILSyDDf.kzg1t.', '$2y$12$rhHdnOUneFr3V4ZCclk8z.tg98l5.ePoISFIMUukmw3BtzrKXREY.', '2025-12-23 19:55:44', 1),
(1321, 'prosperjasper002@gmail.com', '$2y$12$9xWyvuv6osiA7NXR89KCGOU3eQNnOe5nAaZijuCoepLSHjyeLyb/u', '$2y$12$EkgRcgt3Osxal7d6c0OAP.53/DlyxLUkV8PRuWLyiJqx2J4EE4o8C', '2025-12-24 11:54:34', 1),
(1322, 'prosperjasper002@gmail.com', '$2y$12$NFybCdAdwbmm9WqCUyeum.KYqQ95WeTwuExsBK7XP5r5GT49BZasi', '$2y$12$wYelWDh8mT8ERevu9eecS.aTVEqMaZe2rmofcC2GF4B5roZX9sPy2', '2025-12-24 22:20:18', 1),
(1323, 'prosperjasper002@gmail.com', '$2y$12$sousZpsD9hiFXTziRdUn6.6oBqdW6i0HKcZhftTI0BXrtVOHMdeR2', '$2y$12$1E3NPfqB0ae4x45jIpVoP.CgIF7zOkUoMnFLW9jJ6cWlCaEg8fmli', '2025-12-26 02:52:27', 1),
(1324, 'prosperjasper002@gmail.com', '$2y$12$5ca7RMA9bONqfpHWvdfOd.hYB5KvbrOJzx47n1nsjSkai9hrJB2Ey', '$2y$12$TblBdV0G30bltSqDUk3RFOPVPm9jTm6Hma6.sMIPXdVAnH6bNwSrC', '2025-12-28 12:48:20', 1),
(1325, 'oawel01@icloud.com', '$2y$12$vKKwjzbBJaQhgJp9o5awsuLp7gWtajik9WsWHaRMDiN5XXjWD5.ZK', '$2y$12$InPCIwUrWT4JfXNsnFC7/ud.PORnRpP5qgHIDXoagkRyJPJj2HUxq', '2025-12-28 14:47:58', 0),
(1326, 'oawel01@gmail.com', '$2y$12$i/uFh.Ryae8MWaaV.nmYP.hawSkGbH13Od.YfEI8oZAAmica.YnFy', '$2y$12$QU/BRM6tK23fm/cH42mu7uXtKY2uhqkzt4CFT8pSJTUexicxY/k0K', '2025-12-28 18:10:38', 1),
(1327, 'musasaidu090@gmail.com', '$2y$12$B7PuGI6NaAAFY77hKp1VjuG0kEJfuzD9w1fx/qiPqwEe29YLQQcDC', '$2y$12$CO3IBo7qCmMeQ0CP6yLsl.oca.SndrvFZhGRrQYTEqdi34bJF9Gx6', '2025-12-29 16:11:51', 0),
(1328, 'prosperjasper002@gmail.com', '$2y$12$gTrUlHAKe59aoU1lG/ukFuCcEA8L.EuNPvHrU/psUZP5d6o8rBrEi', '$2y$12$1M1t5ooOgDZxkJmlCSCe9.SZTJpooG3PnnvaMOtMcdGfskO1fsElu', '2026-01-05 21:07:04', 1),
(1329, 'oawel01@gmail.com', '$2y$12$XKGVdpNr62p/rNVZtn.YZuYE0Oqc2S4ZO9f0AtUZk54zaZlunZBze', '$2y$12$mLzrdM002X9qsCXXesiYuOvus95Kr/eRdjmCB2V7yG/DXXaKu28z6', '2026-01-06 08:41:18', 1),
(1330, 'prosperjasper002@gmail.com', '$2y$12$RpzoKEtRFgNZzKqTu4HJfuSwg27FskAkCqCrS.1FG9b5w1/oIVbUu', '$2y$12$Br9XYgbS2hxZjTCZdGvF5elMbccuX/EYk6ocqp9tjGLNOU.yk.FVm', '2026-01-09 09:28:25', 1),
(1331, 'prosperjasper002@gmail.com', '$2y$12$/lSqfJWoaw/QAQKrBEYxMORoU6SMYecddhrNVgArviMThC6NOr6ma', '$2y$12$vJNW8xMF31o65n2qRy20weSro4x0ZtPUPZTb3ePZ3Ku9WqYJR6E1u', '2026-01-11 08:06:11', 1),
(1332, 'prosperjasper002@gmail.com', '$2y$12$euXI7RPOP7aQl3AC/X9mvuFTMuKi.4SY0sDb/I2uTDEBDhSFQ56SW', '$2y$12$sJZxjw/IJ3rPjjmcezBhde2iem1dh4R.tVQVsH1.cbcN5f7H6FXfO', '2026-01-17 11:11:23', 1),
(1333, 'softwareclone8@gmail.com', '$2y$12$Jx6hwUsn4apGdLmkiJutyOWleqRxw6y441d4cxPlTJpnjXXLstmOa', '$2y$12$fs49RG/mjwonL2kdRepHHuuda6igAUBgemIzemGDWmqcNvG4Su97G', '2026-01-17 15:02:10', 1),
(1334, 'softwareclone8@gmail.com', '$2y$12$n7n38uW1qlWM.LWXTbqSA./oclzKxtoh5fB5THsFEcLK.WX4R4tzK', '$2y$12$W5CnZxcWnceWG2oMeTwU.uU5q5TRBEQxOlVaL04jNccqPLw2YS7zG', '2026-01-19 11:05:46', 1),
(1335, 'softwareclone11@gmail.com', '$2y$12$0Ty4IwgBFQ5v/K48zBgfvOKbeEUCo45tHBS2ywMQuh5zzFiAOF2Ca', '$2y$12$6dLNyJqqizghjtUPDKteiOB/BJmdT8vwC5nHoQUUyvG7Mw3396YsG', '2026-01-19 11:08:34', 1),
(1336, 'softwareclone11@gmail.com', '$2y$12$iZaB4f0wC.J8bBrSjkzU7.HqfrRjXYPeT69JLz1HX0KbqBh7kOGRu', '$2y$12$n9Kb/u4mY7ktsG1LB8d2yOjUjv.ZlTUbRvVzPHOGMc370.IRDOzVS', '2026-01-19 11:11:11', 1),
(1337, 'softwareclone100@gmail.com', '$2y$12$cCMeDAaroGxLN.pWCz56duk.vsSuU9UgZH9hIODlriWeZb6tVO/u.', '$2y$12$pZicy9E.O8PGFKCZfyd2lexa2LIwPp4VNstZpuVRMPQM6Apr6OTNK', '2026-01-19 15:43:43', 1),
(1338, 'prosperjasper002@gmail.com', '$2y$12$Q8Dwx/ihtnSR25lU6TFWOu3/chjKM2npHgs4FCM0XEW1Vr7zCEU4C', '$2y$12$xibxwtcnddadWE7ltqBl5uoZS565Jt8ZxbZJoIc495vkTpLHpYr0W', '2026-01-21 00:13:17', 1),
(1339, 'softwareclone100@gmail.com', '$2y$12$3ejxqw68SwFd3t2ryKgcHe2tLmiBzKzYsqbFSoyqVhVYdrFuRAP/m', '$2y$12$QnIaruNGENwx0vRqqtx2COc8aIjGKpL3836Qg.lJxPfLg0GY4yDKO', '2026-01-22 09:32:52', 1),
(1340, 'balaabu033@gmail.com', '$2y$12$UEcHURc8Et6v/yKvIMFXoeJSjserrm5II/RCDelvti2suJyXlkVUG', '$2y$12$PDPRAENBVsmyQCTmvLt7iut6hUe4u1xHkhzlXX1eDYAGVZPM39Oga', '2026-01-22 21:57:47', 1),
(1341, 'balaabu033@gmail.com', '$2y$12$8QCRadAa07y2FCwVUD5qieot3awkPm5qQ4OlPAlM9RVvgpEXTDEY.', '$2y$12$rFiEMe0Q9o.GByAzHjY8POcxc/aiNKJegVCmwfVQVDkkJfq8wiwHm', '2026-01-23 11:30:38', 1),
(1342, 'rolandgoodness707@gmail.com', '$2y$12$4TXztOeEps9MzD.GVGtzv.bJdYutYJzqae6a8fSuSuWJORa8AF4ly', '$2y$12$ymCK5nmY5L9MZ6nq2hC78uWlTa1rJMR5E6QktdrIb2O0y8U6X.IaK', '2026-01-23 11:53:35', 1),
(1343, 'softwareclone11@gmail.com', '$2y$12$fI.BUmLXQ1wukZR2uN4ZOeD7FzlK9aj2RS34gH/FWwPWtUNgRbBY.', '$2y$12$sxNeC9lnOeFgaMB8R.fWIewCjstD14LErpDOjh5SkKaFY7BkAABu2', '2026-01-23 17:09:51', 1),
(1344, 'softwareclone100@gmail.com', '$2y$12$btTojBMQ9EQiBhVq.GhiOuiOdd4dRSfx8q.Nkyfka6ZxRm4G.LTWO', '$2y$12$I.QicE4MBrRUmzqqN09u2eFcznrO7Myv5VE8xQXVeVxsGzGeXQ.0K', '2026-01-23 17:10:31', 1),
(1345, 'softwareclone100@gmail.com', '$2y$12$gzjaLhQ9gIHqAeHme0GcL.tke1XFAVhBiiKeVGeAL3U6cTjOIqymy', '$2y$12$OIl6ehprb3bClWuZUioVS.zzMJ3Db25MV6uenkfuNeAvAbRYBFhIy', '2026-01-23 17:47:26', 1),
(1346, 'softwareclone100@gmail.com', '$2y$12$XELLuI.wIEDciDoBri4eoudAW0y7F4V4/P6mJeoE.DZeV/txVo5NW', '$2y$12$JH0oeDz7ahej/V8kKYaUi.XVUSAw4IZ6caJghkEq7P5X2eI.E9omS', '2026-01-24 13:20:57', 1),
(1347, 'softwareclone100@gmail.com', '$2y$12$D3MKCcOGruXiY5k3GSEdbObKmTsqSkAHY2N3WJteMZ5/emR/m5CJ2', '$2y$12$LydehDyZV0nTZZJvoPmYtuK0M/vuXlxXGjAaPL4DJmbfQSpfvGFci', '2026-01-25 23:23:11', 1),
(1348, 'abdulazeezbello5882@gmail.com', '$2y$12$glz8zN9jWxsBQr7y/GIQquOQQoqKbBYMy7ptoExoEwmO.8WhrF0Bu', '$2y$12$UgSflNfYdBJmonQT48DS1elgSAcrwv.nXNHQEJBCRKfuEgJ/UGB/m', '2026-01-26 15:23:25', 1),
(1349, 'abdulazeezbello5882@gmail.com', '$2y$12$WfKDDZDX2AtwmZcXICeUpOVpGbsLOOO4ag0tILWf5AdeMeBR6yeUa', '$2y$12$O0HNor.FZfY4kczIEz4Nq.MdhjiiQZGLPDQY3vm9xIhtQv5HGglAC', '2026-01-28 10:39:56', 1),
(1350, 'prosperjasper002@gmail.com', '$2y$12$k.GAfTzHhEV2GKW6ez3VyOw1UaM4RcfVblzPVq.7M/D7cEbrf2QxG', '$2y$12$K5Ge6c9poE3Za.1pxAKm1.l5eYgfsLCpuPkMP4Fw7ciWZg2WzI2fK', '2026-01-29 17:12:01', 0),
(1351, 'abdulazeezbello5882@gmail.com', '$2y$12$/q5JsWbLSPSUDYzOBd8KYu7o1RElD8gzQ.1TXJlzDi3DyhkbMbr1S', '$2y$12$z2VaD/et.WZqZ6cHP1j8rebRSF3xsiEpM2jpBO/KBZiViG.73Nqsi', '2026-02-02 23:42:09', 0),
(1352, 'softwareclone100@gmail.com', '$2y$12$kAVXReX4Wx9KJv.lXZWFk.sHUr6ibq6t5gk3APtEoTvjWzVdQaZVe', '$2y$12$IPn5vxRp876AeRVmuVZwIeFZFNe4Nd5R3d72rJ803vTjTFlLpnmmO', '2026-04-25 20:51:22', 1),
(1353, 'abdulazeezbello5882@gmail.comm', '$2y$12$vq6AGv9X.QH//SmmeQtk.eCiPzsaPIaDj1HUU4VUWJ8KWFz6sSvt6', '$2y$12$M/4lQwCrY/Gb56CmIrFbxu7cMvzrCtBmyfNZLZV/zuS08QHfbJnE2', '2026-04-27 03:06:16', 0),
(1354, 'abz@gmail.com', '$2y$12$sqdiNtxZ2uF8G89uZVeYiOInEy9T1P56Ajct5Yz.LBeo0xMdlSVdm', '$2y$12$FqA.hp6HiQEuGP6AZVz50.vCqR/dJsm.CVSfISzJy/869D4BHZIwC', '2026-04-30 17:21:27', 1),
(1355, 'abz@gmail.com', '$2y$12$r57PTBcEYnbGUb/UBgX7teaCpMX5j0qCH0pEbogQQ.HOF6r3mvXH.', '$2y$12$H92s.3xKZIbt.gQ8GfPnFupktw9BoT1LOQS9OdqOD8wcYlvR3fdT.', '2026-05-01 07:32:14', 1),
(1356, 'oawel01@gmail.com', '$2y$12$X2GBZNncoXYZCfPJmcGC9eb8ns3GZj9FNL0G413xyeMxtmKYa0JQ.', '$2y$12$xuT93Gh5rht2i/1KH4I36OnO8lXMR5TCCC6rDZmEyQ/LXvMvMf0Si', '2026-05-07 15:14:02', 0),
(1357, 'abz@gmail.com', '$2y$12$S9FyrUkguV08mbR1hOWG/eYuzJuy.uxRVtZCP3gb0u48nVYIIK8t2', '$2y$12$u3YR2yu.pUI40661FmCRJ.3q1s3x8slGSNDCuAANtg0SgDpLjGl3G', '2026-05-11 11:06:52', 1),
(1358, 'softwareclone11@gmail.com', '$2y$12$sG6fB9FpDarp3ScCdoksz.RXxwfEhh7tA6.mU2tY7wmIgrEKARW5y', '$2y$12$F05BWjxwTwtYS8AHus5rwub3dwXRcwfRddpjSTAyS.6sI1gyBuKmS', '2026-05-13 14:23:22', 1),
(1359, 'abz@gmail.com', '$2y$12$JrjvK7HcReKDArCjxKjeKOsbuaV.9suh6N/lFNNBFw1S.JrV/EXKK', '$2y$12$sVbOGPuXUrHkJSVe8nQDIuReXSlysEVHiXeAHqQgB56hhj1RI.T.q', '2026-05-16 13:36:26', 1),
(1360, 'abz@gmail.com', '$2y$12$7kRSQiyW6pFKCJ8EfIk2iuGT5IEix81HyGjpDaM8g5eXzGhDNJrRa', '$2y$12$xvFNh.HmhvHEnb6.SyTWC.A4B1ubAIyd3B.zFewWciiXB26U3PzaC', '2026-05-16 13:38:24', 1),
(1361, 'softwareclone11@gmail.com', '$2y$12$xnEI7Sxdgv51g2Xa89HGGOV9UTC55E7vO9CBiLtT7OEB8yr/bePTq', '$2y$12$2eMiONEKpdVZKq3uJmeJDu/fYWwC4WLwznuiKKcab9th0hBdpYMpC', '2026-05-18 17:56:25', 1),
(1362, 'abz@gmail.com', '$2y$12$abWXqESIEna57BDjO4sFPO4PBcimIlHZKNSXH58eCgUqeM2Qocqu2', '$2y$12$p9AlWz7vTcTNcksZ3EXOBu5A6wIlTsSygO0slryDKuDFFl.sw8ZwG', '2026-05-20 14:05:14', 1),
(1363, 'abz@gmail.com', '$2y$12$/vzsVIuJQDlOpnqmPZK9fujOg.2/cU6HYUDWRhO7c8KQ9th.8D0X2', '$2y$12$3MR6gIr/byITVUC8lKtl/eHJDi6UxxdliisAfeO83cP7jU.9tmjxS', '2026-05-22 00:20:41', 1),
(1364, 'abz@gmail.com', '$2y$12$xWTDIM2i86MSFCisvZT.O.A7djBRolmEIEMf2wGOigu0m7NMHTMU6', '$2y$12$YOeo8x0PN3L0Xfn7ffO6nO5dm535Gm7FOq.nzE5KR6IZXRlj5iMDi', '2026-05-23 23:44:28', 0),
(1365, 'softwareclone100@gmail.com', '$2y$12$H0HhRpS3GlcEQ7zvB1Ba5eQykkutylQV19pMH9E/3GW/yv.oXVRq.', '$2y$12$XtQ87VH2v3Ph7TFPSShW4uS8.aU0hoJK3925mQyPhhCFZ0o9wEj4e', '2026-05-26 10:20:54', 1),
(1366, 'balaabu033@gmail.com', '$2y$12$7QEP4qfHAygxQp1drXaO9emYikB6B65qK2N7.I4E4gMC/14.wVtCS', '$2y$12$jmctsA9JSic4WrwKmF6hzeWpCWAE4y/6HdOB3yIrGyHkweVHNcWU.', '2026-05-29 15:04:44', 1),
(1367, 'balaabu033@gmail.com', '$2y$12$TRfT6P.MzPep3FV/Wd5an.Zq7HV30GKyMJ9IPObMmQTyQkLU69vOO', '$2y$12$dfBVFUbpPM8iXg5RwsuQbuvjDx53bnlj192Qq8nZw4F5vSb7Howgq', '2026-05-29 15:07:30', 1),
(1368, 'balaabu033@gmail.com', '$2y$12$PcC01yZz/E5YjPTkjTLkJOGJnixXgbzgjcy.azowJPUxBGCLX9HK2', '$2y$12$5lHy/72BA.ufm7JUKykniee3bes/UmeZsiUaI2Dv/Ty9pEq13SBGy', '2026-05-29 15:34:38', 0),
(1369, 'softwareclone11@gmail.com', '$2y$12$.e9QapF5KtL48L1bL5MfrOxGgTivgOFSS9OGeDqqMln/8WVVvh.IG', '$2y$12$/XQXnzJ37ovfmXP5hMt5KeZ.FQT.nukeJppP9uCLTjdOhkFo3Va42', '2026-06-08 11:50:10', 0),
(1370, 'softwareclone100@gmail.com', '$2y$12$ST83/k8K3XCI/w1KXwCQVOIMOQr.JDrNog7oqiG5V2fF/YUAHPMYa', '$2y$12$Jjd/ksRhUtAjClyZn8p9ZOU9xslOlXgHNwE3j5SGg7K9ZW5EMqPp6', '2026-06-08 11:50:27', 1),
(1371, 'softwareclone100@gmail.com', '$2y$12$O0Lcq0vEzLDXMJ8c5kZmYuOtXebZePpm0miqzrH6JRhO6Gy0TrkiK', '$2y$12$Apb3AEjnCDHTaIujqS/v4.Ig0oZ5fQXnOwT9NaMrrD9CdADw/fICy', '2026-06-08 11:50:56', 1),
(1372, 'softwareclone100@gmail.com', '$2y$12$qPYnKgZWQaqSdn7SCSoQJOFqX/wXN.hQ0randKjvtFRtSPJw8wmqS', '$2y$12$yRmJQcSU./sYDcYvM9SxTOgivnHI/0gzy0rCeF.MpFUqBg4Fwx9Sm', '2026-06-10 09:43:02', 1),
(1373, 'softwareclone100@gmail.com', '$2y$12$pk6Se48oMQO/IoFTacXz8..tSPNRaE5YubrvRy.y/DurGcz3Rlinu', '$2y$12$NZ8WdZIZD3rAV3RCfFsgTOu1Iier4PZ0zZP/4cTngQHeqdam7O2R.', '2026-06-12 06:19:13', 1),
(1374, 'softwareclone100@gmail.com', '$2y$12$tcA66YCx/vCPMkfTpqCpr.QA568bNBmkWOtPyN/hwqc4XiNLI/Z..', '$2y$12$0JqHaQ8rQ8XgFvI.qhkY8.ebmdL2IDG/vVERs8C2G7J109zrt0lqm', '2026-06-12 10:35:06', 1),
(1375, 'softwareclone100@gmail.com', '$2y$12$1tWH0gdAVxPXBH0WPENcZOKAkoEHeh2Et84KQuVrkavFkwYoip466', '$2y$12$7fkC0keH2ASovzO7F0rWcOlfhseug/WzV5ieCeuJhWb9phFRng8sa', '2026-06-13 04:34:05', 1),
(1376, 'softwareclone100@gmail.com', '$2y$12$7mP7Dy0ZPF9O83SEj0wqcezGdbdMeJV2/vw.5TlOmXVGpcqLqMejC', '$2y$12$7eQM5mmFGDJJFCdPqnY8SuOy0mS0WbRkKcOfC.QsLgQYhZyI7file', '2026-06-13 07:55:04', 1),
(1377, 'softwareclone130@gmail.com', '$2y$12$Te2c7qotcx9eXK3wMX1LF.miWfqKNFaFv/Vl5gyb.2Q64AyfFYTFq', '$2y$12$zQ7Pr4zlWep743oRQJQKM.T7k6mfcu0FKke5QSJR9yjDSsfxrZ5Fy', '2026-06-13 08:57:00', 1),
(1378, 'softwareclone100@gmail.com', '$2y$12$c2Gm8h1oHsCpSJT7S7SvcOO6wpt.J9kmzEi5G6MeHhqqOFQ9RD6yW', '$2y$12$BQSPX3P6rjpaKclOx505dOEr9ZYZziZZLo/3CBc/SJbsM7gRcQFqC', '2026-06-13 12:00:48', 1),
(1379, 'softwareclone100@gmail.com', '$2y$12$pPfhnG6x7FjajnQXE8G.OOVXQ8X5kC9H2wfK1aDtzRl9eT0h8fsqW', '$2y$12$bPEb6QJw3XLRA5kzDmY0h.rslCsHmLMKkU5a8jt147wWAx41t2rH.', '2026-06-13 12:30:19', 1),
(1380, 'softwareclone130@gmail.com', '$2y$12$87AWBBUFN93dznZUsChIOenAG4YDbRDSGXinc62Ke/f5wnk0kISwe', '$2y$12$TbOJiIG0TLuQz9pFLbWnBuEdXAudW0BAJ71HlOHFilcWQe7p3GW6y', '2026-06-13 13:09:39', 1),
(1381, 'softwareclone100@gmail.com', '$2y$12$X7GtXiaiL3QIMTc1Jr51SOha3KEWcrkH7XZhMPKjPdtqdxzWnEmFe', '$2y$12$xB0n42QH8J74knCznnLfsONDwVwXdElKBYpx0YXdT01cnBcHiBGPy', '2026-06-13 13:20:04', 1),
(1382, 'softwareclone100@gmail.com', '$2y$12$5WhgYE8GqR9Ptp577AMi..pjABUI4WmXZ2zC0/MBYNGrTyuMsiXpC', '$2y$12$hghmOILFeLw/NWh02/sp2uoontsQgq8feC7q9wc2T1TfgZXl8i4nq', '2026-06-13 14:14:54', 1),
(1383, 'softwareclone100@gmail.com', '$2y$12$OWs5/FjsEhocYbNRjn7ezOJ.OJdHOS0de5JyueXe9o8yrzK6Y0e7K', '$2y$12$Qflo08iIIsU7DXOEVqU9kOsUtTiiFo1kENwGAt9hij4mzL4HYq4I2', '2026-06-13 17:11:20', 1),
(1384, 'softwareclone130@gmail.com', '$2y$12$KYMpUJ7eqkfFVis3ZfxyL.Xhd52FXwaunYqkvSojv4bcMl6jZ7GkK', '$2y$12$EId8jkbUz/aft5NWr6f88OF9KMFSTX0JY6aQv0d1JedzhIZf8PQqW', '2026-06-13 17:11:43', 0),
(1385, 'softwareclone100@gmail.com', '$2y$12$m4WfXxWs5DZfMz9IaUCtNuzaLfCxnS8uItDRp20MbUDrlK1C4KNry', '$2y$12$m389C8J.VBZ.nM8G.Xr.3ONefdnD71vMBBTPX94h6yP7tdVJiQt0W', '2026-06-13 21:22:23', 1),
(1386, 'softwareclone100@gmail.com', '$2y$12$Kgh7zLd4BNqo2QvQ12IjEu6v2P0IuFCe6X4Gpj/UT0zu3IxK/GL8e', '$2y$12$UkxdZQd/t8411dmyWAJNeetjTh3dsdaBjbX7q7FTDWuBQVfrbgvCa', '2026-06-13 22:09:48', 1),
(1387, 'softwareclone100@gmail.com', '$2y$12$u087oSwCYDuKsB2gqp.j3ea7SyakOHm7eptqfruItV8Ians/RnIGq', '$2y$12$zFikwAsThVyk9TWP98t76ewUmsQoOG9yj5uOKPfbqwIkMs1iItFj2', '2026-06-13 22:22:16', 1),
(1388, 'rolandgoodness707@gmail.com', '$2y$12$8HWlMzJ8LGeWlVunUvoKSeZMHr4JYfeaRl4pO.XFzRIiqz19q51Ci', '$2y$12$2q4PdF.rPFpUSAmNGjlTdO2soZwYS/bmCHK9C7P0YirqtwIZmB3pS', '2026-06-14 04:30:56', 1),
(1389, 'rolandgoodness707@gmail.com', '$2y$12$rK.YL0Rz7XLgkbV9H6MU2Oph1B83by0Q48enQNfcLN2mIfYTxHEC.', '$2y$12$lxhck0syrX80zQL6ckxCm.awluDh.XdGBJ.PNKYpwmcLf3w/5rQ8e', '2026-06-14 04:40:21', 0),
(1390, 'softwareclone100@gmail.com', '$2y$12$pwgYNTSX.vk9I/tP8S2speKQngzEc6NHv702ynVkuGFInTl0mpQXa', '$2y$12$MQgHVHmP.kbFquhGEAkKeOG78f2JQOjBHsuo2a.XWjwnWLjh6ONLq', '2026-06-14 08:59:22', 1),
(1391, 'softwareclone100@gmail.com', '$2y$12$HUn9Qhf613om/402tDZyW.D6Zwf88VESt69ECDGkbAkIbCB8EEWqC', '$2y$12$LB865DyvZ80vFXwxziOgC.XqC9GucQALe9XZYbifDlDAV40h75H.K', '2026-06-14 09:07:11', 1),
(1392, 'softwareclone100@gmail.com', '$2y$12$HpRRynY1FM6AaMze/q0glODmSFHyQK7kT5Uj97i3on7kNR.A7uu/G', '$2y$12$0d8lPkwIeRuIhkSMwJj95O6EDWxQSfX2q2DxqJtDMpbbe3E.nzdt.', '2026-06-14 09:36:24', 1),
(1393, 'softwareclone100@gmail.com', '$2y$12$GNDJf6gGoTGKm.cW1Xwuz.hH25xEyd6Lsif43zuTw6NollFTN1kga', '$2y$12$YsZeCOelcK1yEB6zVnQW7Onya1MH3eRPKMl3q.isEkgAlci6DbG0u', '2026-06-16 07:44:54', 1),
(1394, 'softwareclone100@gmail.com', '$2y$12$DQcJeMb67UuqH58ghUXcP.AlCM3.5/Hkf4h18FbeO7eeUlni8e1wm', '$2y$12$KD/HyMTO59fO7Qde/ANxAe8OrCHPPa8GKnW0Uvg6GOgfTBUSscJcO', '2026-06-16 07:48:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions_tbl`
--

CREATE TABLE `transactions_tbl` (
  `id` int(11) NOT NULL,
  `unique_element` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `real_amount` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `request_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `response_description` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_bill` int(11) NOT NULL DEFAULT 0,
  `our_commission` int(11) DEFAULT NULL,
  `super_admin` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions_tbl`
--

INSERT INTO `transactions_tbl` (`id`, `unique_element`, `amount`, `real_amount`, `email`, `phone`, `transaction_id`, `request_id`, `product_name`, `response_description`, `status`, `transaction_date`, `is_bill`, `our_commission`, `super_admin`) VALUES
(85, '08160327173', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '748554179596321665', 'MTN', NULL, 0, '2025-08-13 10:08:37', 1, NULL, 1),
(86, '08011111111', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '798796083620717245', 'MTN DATA', NULL, 0, '2025-08-13 10:54:18', 1, NULL, 1),
(87, '08160327173', 265, 265, 'softwareclone11@gmail.com', '08160327173', '', '984721746732930602', 'MTN Cheap Data', 'Insuficient Balance', 0, '2025-08-13 10:55:44', 1, NULL, 1),
(88, '08160327173', 265, 265, 'softwareclone11@gmail.com', '08160327173', '173677372899237952', '173677372899237952', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-14 05:28:05', 1, NULL, 1),
(89, '08160327173', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '358523453846480766', 'MTN', NULL, 0, '2025-08-14 05:32:38', 1, NULL, 1),
(90, '08160327173', 265, 265, 'softwareclone11@gmail.com', '08160327173', '291665576472413209', '291665576472413209', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-14 08:15:14', 1, NULL, 1),
(91, '08160327173', 265, 265, 'softwareclone11@gmail.com', '08160327173', '139761921489037847', '139761921489037847', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-14 08:33:08', 1, NULL, 1),
(92, '08160327173', 50, 50, 'softwareclone11@gmail.com', '08160327173', NULL, '637496243949724105', 'MTN', NULL, 0, '2025-08-14 11:29:37', 1, NULL, 1),
(93, '08160327173', 50, 50, 'softwareclone11@gmail.com', '08160327173', NULL, '877489194912485448', 'MTN', NULL, 0, '2025-08-14 11:30:23', 1, NULL, 1),
(94, '08160327173', 265, 265, 'softwareclone11@gmail.com', '08160327173', '537412626544289470', '537412626544289470', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-14 11:32:51', 1, NULL, 1),
(95, '08160327173', 265, 265, 'softwareclone11@gmail.com', '08160327173', '205997251181302213', '205997251181302213', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-14 11:37:29', 1, NULL, 1),
(96, '08011111111', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '919306547986414937', 'MTN DATA', NULL, 0, '2025-08-14 11:39:51', 1, NULL, 1),
(97, '08160327173', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '533930489529164501', 'MTN', NULL, 0, '2025-08-14 11:56:43', 1, NULL, 1),
(98, '08160327173', 50, 50, 'softwareclone11@gmail.com', '08160327173', NULL, '298495253149787051', 'mtn', NULL, 0, '2025-08-14 12:02:11', 1, NULL, 1),
(99, '08160327173', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '529727162601123295', 'mtn', NULL, 0, '2025-08-14 12:16:36', 1, NULL, 1),
(100, '08011111111', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '551740445471326221', 'MTN DATA', NULL, 0, '2025-08-14 12:19:42', 1, NULL, 1),
(101, '08160327173', 100, 100, 'softwareclone100@gmail.com', '08160327173', NULL, '361648741992976947', 'MTN', NULL, 0, '2025-08-14 12:25:22', 1, NULL, 1),
(102, '08011111111', 100, 100, 'softwareclone100@gmail.com', '08160327173', NULL, '182525768811886778', 'MTN DATA', NULL, 0, '2025-08-14 12:25:57', 1, NULL, 1),
(103, '08160327173', 265, 265, 'softwareclone100@gmail.com', '08160327173', '555220696932620688', '555220696932620688', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-14 12:31:34', 1, NULL, 1),
(104, '08160327173', 265, 265, 'softwareclone11@gmail.com', '08160327173', '570522979207565509', '570522979207565509', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-14 14:53:40', 1, NULL, 1),
(105, '08160327173', 265, 265, 'softwareclone11@gmail.com', '08160327173', '795958417315987367', '795958417315987367', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-14 17:07:50', 1, NULL, 1),
(106, '08160327173', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '765053257921532078', 'MTN DATA', NULL, 0, '2025-08-14 19:22:36', 1, NULL, 1),
(107, '08160248935', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '841700985629023130', 'MTN DATA', NULL, 0, '2025-08-14 19:23:47', 1, NULL, 1),
(108, '08160327173', 50, 50, 'softwareclone11@gmail.com', '08160327173', NULL, '923753271527468041', 'MTN', NULL, 0, '2025-08-15 05:54:05', 1, NULL, 1),
(109, '08160327173', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '621585577141597437', 'MTN', NULL, 0, '2025-08-15 12:44:08', 1, NULL, 1),
(110, '08160327173', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '319057012991372953', 'MTN DATA', NULL, 0, '2025-08-15 12:44:54', 1, NULL, 1),
(111, '08160327173', 265, 265, 'softwareclone11@gmail.com', '08160327173', '635500062726088227', '635500062726088227', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-15 12:46:03', 1, NULL, 1),
(112, '09060943924', 100, 100, 'softwareclone11@gmail.com', '08160327173', '203587483994392942', '203587483994392942', 'MTN', 'Transaction Failed', 2, '2025-08-15 17:20:50', 1, NULL, 1),
(113, '09060943924', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '622663274157926579', 'MTN DATA', NULL, 0, '2025-08-15 17:21:40', 1, NULL, 1),
(114, '09060943924', 60, 60, 'softwareclone11@gmail.com', '08160327173', NULL, '823935816769292858', 'MTN', NULL, 0, '2025-08-15 17:22:34', 1, NULL, 1),
(115, '08160327173', 50, 50, 'softwareclone11@gmail.com', '08160327173', '899499818205003362', '899499818205003362', 'MTN', 'Transaction Failed', 2, '2025-08-15 18:34:40', 1, NULL, 1),
(116, '08160327173', 100, 100, 'softwareclone11@gmail.com', '08160327173', '169097535847405517', '169097535847405517', 'MTN DATA', 'Transaction Failed', 2, '2025-08-15 18:35:49', 1, NULL, 1),
(117, '09048991296', 950, 950, 'oawel01@gmail.com', '09048991296', '', '138895370457624328', 'Airtel Cheap Data', 'Insuficient Balance', 0, '2025-08-15 18:49:33', 1, NULL, 1),
(118, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', '429359497466627039', '429359497466627039', 'AIRTEL', 'Transaction Failed', 2, '2025-08-15 18:51:33', 1, NULL, 1),
(119, '09048991296', 500, 500, 'oawel01@gmail.com', '09048991296', '688341428324099288', '688341428324099288', 'Airtel Cheap Data', 'Transaction Failed', 2, '2025-08-15 19:01:08', 1, NULL, 1),
(120, '07043217934', 265, 265, 'oawel01@gmail.com', '09048991296', '734830746441055314', '734830746441055314', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-15 19:11:05', 1, NULL, 1),
(121, '07043217934', 100, 100, 'softwareclone11@gmail.com', '08160327173', '266538688153179594', '266538688153179594', 'MTN DATA', 'Transaction Failed', 2, '2025-08-15 19:17:41', 1, NULL, 1),
(122, '08160140638', 150, 150, 'Ajayiolaoluwa2014@gmail.com', '08160140638', '', '605102283364744958', 'MTN Cheap Data', 'Insuficient Balance', 0, '2025-08-16 07:14:56', 1, NULL, 1),
(123, '09060943924', 265, 265, 'softwareclone100@gmail.com', '08160327173', '876903557162115425', '876903557162115425', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-08-16 18:32:35', 1, NULL, 1),
(124, '08160327173', 50, 50, 'softwareclone11@gmail.com', '08160327173', '17554183762968821640309257', '574142722230970362', 'MTN', 'Successful', 1, '2025-08-17 08:12:55', 1, NULL, 1),
(125, '08011111111', 100, 100, 'softwareclone11@gmail.com', '08160327173', '17554184420640530413785869', '776450545343708115', 'MTN DATA', 'Failed', 1, '2025-08-17 08:14:01', 1, NULL, 1),
(126, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', '17554530518115964722455312', '120330731841086221', 'AIRTEL', 'Successful', 1, '2025-08-17 17:50:51', 1, NULL, 1),
(127, '09048991296', 27250, 27250, 'oawel01@gmail.com', '09048991296', '', '372282864159258995', 'WAEC-REGISTRATION', 'Insuficient Balance', 0, '2025-08-17 17:57:25', 0, NULL, 1),
(128, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', NULL, '228703693961302966', 'AIRTEL', NULL, 0, '2025-08-18 10:45:56', 1, NULL, 1),
(129, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', NULL, '249861342172668599', 'AIRTEL', NULL, 0, '2025-08-18 10:56:56', 1, NULL, 1),
(130, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', NULL, '690019532474487090', 'AIRTEL', NULL, 0, '2025-08-18 10:59:07', 1, NULL, 1),
(131, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', NULL, '328028679410738130', 'AIRTEL', NULL, 0, '2025-08-18 11:01:01', 1, NULL, 1),
(132, '08011111111', 200, 200, 'oawel01@gmail.com', '09048991296', '', '283822288161088540', 'AIRTEL DATA', 'Insuficient Balance', 0, '2025-08-18 11:02:25', 1, NULL, 1),
(133, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', NULL, '291772618937922365', 'AIRTEL', NULL, 0, '2025-08-23 09:22:45', 1, NULL, 1),
(134, '08138294202', 100, 100, 'softwareclone11@gmail.com', '08160327173', NULL, '331920404698434987', 'MTN', NULL, 0, '2025-10-03 05:02:00', 1, NULL, 1),
(135, '09048991296', 500, 500, 'oawel01@gmail.com', '09048991296', '857525440181225532', '857525440181225532', 'Airtel Cheap Data', 'Transaction Failed', 2, '2025-10-12 13:51:41', 1, NULL, 1),
(136, '09135749511', 265, 265, 'oawel01@gmail.com', '09048991296', '618042837299749801', '618042837299749801', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-12 13:53:16', 1, NULL, 1),
(137, '09034684986', 265, 265, 'oawel01@gmail.com', '09048991296', '983840464961089919', '983840464961089919', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-12 15:50:14', 1, NULL, 1),
(138, '09135749511', 265, 265, 'oawel01@gmail.com', '09048991296', '256648297351489866', '256648297351489866', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-12 15:51:29', 1, NULL, 1),
(139, '09135749511', 470, 470, 'oawel01@gmail.com', '09048991296', '693815002995624054', '693815002995624054', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-12 16:28:49', 1, NULL, 1),
(140, '09048991296', 400, 400, 'oawel01@gmail.com', '09048991296', '17603564586209336013987644', '117996433886389076', 'AIRTEL', 'Successful', 1, '2025-10-13 11:54:17', 1, NULL, 1),
(141, '08011111111', 1000, 1000, 'rahmahhabib083@gmail.com', '07043217934', '17603730317178110872571560', '227319444658843767', 'MTN DATA', 'Failed', 1, '2025-10-13 16:30:31', 1, NULL, 1),
(142, '09135749511', 265, 265, 'oawel01@gmail.com', '09048991296', '807533468812155549', '807533468812155549', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-13 16:38:18', 1, NULL, 1),
(143, '09135749511', 700, 700, 'oawel01@gmail.com', '09048991296', '525804458982040246', '525804458982040246', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-13 16:40:19', 1, NULL, 1),
(144, '09135749511', 150, 150, 'oawel01@gmail.com', '09048991296', '909966224197595516', '909966224197595516', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-13 16:41:10', 1, NULL, 1),
(145, '08011111111', 200, 200, 'oawel01@gmail.com', '09048991296', '17603737268680385369107018', '291869319614698245', 'MTN DATA', 'Failed', 1, '2025-10-13 16:42:06', 1, NULL, 1),
(146, '09135749511', 700, 700, 'oawel01@gmail.com', '09048991296', '', '309936363521559981', 'MTN Cheap Data', 'Insuficient Balance', 0, '2025-10-13 16:42:53', 1, NULL, 1),
(147, '09135749511', 500, 500, 'oawel01@gmail.com', '09048991296', '17604309491170436259775308', '606097191295242754', 'MTN', 'Successful', 1, '2025-10-14 08:35:48', 1, NULL, 1),
(148, '07043217934', 1000, 1000, 'rahmahhabib083@gmail.com', '07043217934', '17604313409975436717118406', '903693127792690741', 'MTN', 'Successful', 1, '2025-10-14 08:42:20', 1, NULL, 1),
(149, '08011111111', 1000, 1000, 'rahmahhabib083@gmail.com', '07043217934', '17606392261515695484200332', '813737950387148509', 'MTN DATA', 'Failed', 1, '2025-10-16 18:27:05', 1, NULL, 1),
(150, '07043217934', 1000, 1000, 'rahmahhabib083@gmail.com', '07043217934', '', '250270723267495901', 'MTN', 'Insuficient Balance', 0, '2025-10-16 18:29:35', 1, NULL, 1),
(151, '08160327173', 300, 300, 'softwareclone100@gmail.com', '08160327173', '17611442610182539621236628', '129020709331337753', 'MTN', 'Successful', 1, '2025-10-22 14:44:20', 1, NULL, 1),
(152, '08160140638', 700, 700, 'Ajayiolaoluwa2014@gmail.com', '08160140638', '', '320991434481773169', 'MTN Cheap Data', 'Insuficient Balance', 0, '2025-10-22 16:02:18', 1, NULL, 1),
(153, '08011111111', 350, 350, 'softwareclone100@gmail.com', '08160327173', '17611573620800665825722248', '974345137317440157', 'AIRTEL DATA', 'Failed', 1, '2025-10-22 18:22:41', 1, NULL, 1),
(154, '08011111111', 600, 600, 'softwareclone100@gmail.com', '08160327173', '17611596003206973483907275', '752330752633626655', 'MTN DATA', 'Failed', 1, '2025-10-22 18:59:59', 1, NULL, 1),
(155, '07076773032', 500, 500, 'softwareclone100@gmail.com', '08160327173', '', '335014037950166530', 'MTN', 'Insuficient Balance', 0, '2025-10-22 19:00:36', 1, NULL, 1),
(156, '07076773032', 500, 500, 'softwareclone100@gmail.com', '08160327173', '17611597931345174174537722', '952927019665763747', 'MTN', 'Successful', 1, '2025-10-22 19:03:12', 1, NULL, 1),
(157, '09122090530', 400, 400, 'softwareclone100@gmail.com', '08160327173', '17614290475945922153614882', '898658319812824437', 'AIRTEL', 'Successful', 1, '2025-10-25 21:50:46', 1, NULL, 1),
(158, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', '', '590514138611777417', 'AIRTEL', 'Insuficient Balance', 0, '2025-10-30 15:17:02', 1, NULL, 1),
(159, '09135749511', 470, 470, 'oawel01@gmail.com', '09048991296', '611053559959069527', '611053559959069527', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-30 15:37:46', 1, NULL, 1),
(160, '09135749511', 150, 150, 'oawel01@gmail.com', '09048991296', '952931168954905983', '952931168954905983', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-30 15:38:51', 1, NULL, 1),
(161, '08011111111', 750, 750, 'oawel01@gmail.com', '09048991296', '17618388023013709240501913', '527961893749480835', 'MTN DATA', 'Failed', 1, '2025-10-30 15:40:01', 1, NULL, 1),
(162, '09048991296', 200, 200, 'oawel01@gmail.com', '09048991296', '17618421754096394846906918', '436383889592910829', 'AIRTEL', 'Successful', 1, '2025-10-30 16:36:14', 1, NULL, 1),
(163, '09135749511', 265, 265, 'oawel01@gmail.com', '09048991296', '157446844333374462', '157446844333374462', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-10-31 15:27:33', 1, NULL, 1),
(164, '08011111111', 750, 750, 'oawel01@gmail.com', '09048991296', '17619245230039549212912079', '970648568920557610', 'MTN DATA', 'Failed', 1, '2025-10-31 15:28:42', 1, NULL, 1),
(165, '07067752068', 265, 265, 'softwareclone11@gmail.com', '08160327173', '', '158639555595781455', 'MTN Cheap Data', 'Insuficient Balance', 0, '2025-11-04 05:14:32', 1, NULL, 1),
(166, '08011111111', 100, 100, 'softwareclone11@gmail.com', '08160327173', '17622339679500590129944740', '413611064431155345', 'MTN DATA', 'Failed', 1, '2025-11-04 05:26:07', 1, NULL, 1),
(167, '07067752068', 100, 100, 'softwareclone11@gmail.com', '08160327173', '17622364542841832546411838', '349222378114823985', 'MTN DATA', 'Successful', 1, '2025-11-04 06:07:33', 1, NULL, 1),
(168, '09135749511', 750, 750, 'oawel01@gmail.com', '09048991296', '809091335375984051', '809091335375984051', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-11-04 06:32:47', 1, NULL, 1),
(169, '09135749511', 750, 750, 'oawel01@gmail.com', '09048991296', '17622380184328210765451657', '747497466438605715', 'MTN DATA', 'Successful', 1, '2025-11-04 06:33:37', 1, NULL, 1),
(170, '09048991296', 3900, 3900, 'oawel01@gmail.com', '09048991296', '', '361632550543469256', 'WAEC', 'Insuficient Balance', 0, '2025-11-04 12:07:18', 0, NULL, 1),
(171, '09135749511', 470, 470, 'oawel01@gmail.com', '09048991296', '912167704572514152', '912167704572514152', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-11-04 13:32:14', 1, NULL, 1),
(172, '09135749511', 1500, 1500, 'oawel01@gmail.com', '09048991296', '17622633485263824390530482', '804622041631502420', 'MTN DATA', 'Successful', 1, '2025-11-04 13:35:47', 1, NULL, 1),
(173, '09035741544', 5000, 5000, 'annaleona00@gmail.com', '09035741544', '', '522026961957750500', 'MTN', 'Insuficient Balance', 0, '2025-11-05 02:20:30', 1, NULL, 1),
(174, '09035741544', 84, 84, 'jonnywood158@gmail.com', '09035741540', '17623101101999228509541745', '289022701205661851', 'MTN', 'Successful', 1, '2025-11-05 02:35:09', 1, NULL, 1),
(175, '09035741544', 85, 85, 'jonnywood158@gmail.com', '09035741540', '', '536583485819886385', 'MTN', 'Insuficient Balance', 0, '2025-11-05 02:35:09', 1, NULL, 1),
(176, '09035741544', 59, 59, 'jonnywood158@gmail.com', '09035741540', '', '954527215972113288', 'MTN', 'Insuficient Balance', 0, '2025-11-05 02:36:13', 1, NULL, 1),
(177, '09035741544', 5000, 5000, 'annaleona00@gmail.com', '09035741544', '', '929490483870711054', 'MTN', 'Insuficient Balance', 0, '2025-11-05 02:37:41', 1, NULL, 1),
(178, '09035741544', 62, 62, 'annaleona00@gmail.com', '09035741544', '17623103449821526494751432', '690367727720020962', 'MTN', 'Successful', 1, '2025-11-05 02:39:04', 1, NULL, 1),
(179, '09135749511', 2230, 2230, 'oawel01@gmail.com', '09048991296', '', '118245878448297819', 'MTN Cheap Data', 'Insuficient Balance', 0, '2025-11-05 12:20:36', 1, NULL, 1),
(180, '09135749511', 2230, 2230, 'oawel01@gmail.com', '09048991296', '722042075991769498', '722042075991769498', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-11-05 12:22:48', 1, NULL, 1),
(181, '09135749511', 1500, 1500, 'oawel01@gmail.com', '09048991296', '17623454517066140927270359', '808143906640519219', 'MTN DATA', 'Successful', 1, '2025-11-05 12:24:11', 1, NULL, 1),
(182, '09135749511', 1000, 1000, 'oawel01@gmail.com', '09048991296', '17623692087023690319906174', '625031125425882607', 'MTN', 'Successful', 1, '2025-11-05 19:00:05', 1, NULL, 1),
(183, '09135749511', 100, 100, 'oawel01@gmail.com', '09048991296', '17626103805832892003735269', '951811378388044691', 'MTN DATA', 'Successful', 1, '2025-11-08 13:59:39', 1, NULL, 1),
(184, '09135749511', 265, 265, 'oawel01@gmail.com', '09048991296', '339959924480101232', '339959924480101232', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-11-08 14:00:45', 1, NULL, 1),
(185, '09135749511', 150, 150, 'oawel01@gmail.com', '09048991296', '853192403226466462', '853192403226466462', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-11-08 14:02:41', 1, NULL, 1),
(186, '09135749511', 100, 100, 'oawel01@gmail.com', '09048991296', '17626170986683502707437545', '579565847170487904', 'MTN DATA', 'Successful', 1, '2025-11-08 15:51:38', 1, NULL, 1),
(187, '09135749511', 1800, 1800, 'oawel01@gmail.com', '09048991296', '17626840644972745567499029', '946934045296411555', 'MTN DATA', 'Successful', 1, '2025-11-09 10:27:43', 1, NULL, 1),
(188, '09135749511', 265, 265, 'oawel01@icloud.com', '09048991296', '196656436411469835', '196656436411469835', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-11-16 10:23:30', 1, NULL, 1),
(189, '09048991296', 500, 500, 'oawel01@icloud.com', '09048991296', '435855630414034271', '435855630414034271', 'Airtel Cheap Data', 'Transaction Failed', 2, '2025-11-16 10:42:42', 1, NULL, 1),
(190, '09048991296', 500, 500, 'oawel01@icloud.com', '09048991296', '476126972623737606', '476126972623737606', 'Airtel Cheap Data', 'Transaction Failed', 2, '2025-11-16 10:44:29', 1, NULL, 1),
(191, '09048991296', 500, 500, 'oawel01@icloud.com', '09048991296', '532585222616545037', '532585222616545037', 'Airtel Cheap Data', 'Transaction Failed', 2, '2025-11-16 10:45:42', 1, NULL, 1),
(192, '09135749511', 500, 500, 'oawel01@icloud.com', '09048991296', '17633109013947845043592017', '499005126524652065', 'MTN', 'Successful', 1, '2025-11-16 16:35:00', 1, NULL, 1),
(193, '09037303701', 1000, 1000, 'prosperjasper002@gmail.com', '08088888888', '', '532452336957634618', 'MTN', 'Insuficient Balance', 0, '2025-11-17 05:08:07', 1, NULL, 1),
(194, '08088888888', 3900, 3900, 'prosperjasper002@gmail.com', '08088888888', '', '521471581511721661', 'WAEC', 'Insuficient Balance', 0, '2025-11-17 05:08:51', 0, NULL, 1),
(195, '08088888888', -90338, -90338, 'prosperjasper002@gmail.com', '08088888888', NULL, '844417702414806374', 'WAEC', NULL, 0, '2025-11-17 05:11:31', 0, NULL, 1),
(196, '09037303701', 100, 100, 'prosperjasper002@gmail.com', '08088888888', '17633563527621361596846374', '587283515967660759', 'MTN', 'Successful', 1, '2025-11-17 05:12:32', 1, NULL, 1),
(197, '09037303701', 1000, 1000, 'prosperjasper002@gmail.com', '08088888888', '17633563957425629241239709', '147786635985623879', 'MTN', 'Successful', 1, '2025-11-17 05:13:15', 1, NULL, 1),
(198, '09037303701', 5000, 5000, 'prosperjasper002@gmail.com', '08088888888', NULL, '351227998602930123', 'MTN', NULL, 0, '2025-11-17 05:14:01', 1, NULL, 1),
(199, '09037303701', 1000, 1000, 'prosperjasper002@gmail.com', '08088888888', NULL, '852241595761891931', 'MTN', NULL, 0, '2025-11-17 05:14:39', 1, NULL, 1),
(200, '09037303701', 500, 500, 'prosperjasper002@gmail.com', '08088888888', '17633565064129403272104777', '472637671874403536', 'MTN', 'Successful', 1, '2025-11-17 05:15:05', 1, NULL, 1),
(201, '09037303701', 499, 499, 'prosperjasper002@gmail.com', '08088888888', NULL, '260452139305207352', 'MTN', NULL, 0, '2025-11-17 05:15:45', 1, NULL, 1),
(202, '09037303701', 400, 400, 'prosperjasper002@gmail.com', '08088888888', NULL, '464704146457269440', 'MTN', NULL, 0, '2025-11-17 05:17:35', 1, NULL, 1),
(203, '09037303701', 1000, 1000, 'prosperjasper002@gmail.com', '08088888888', NULL, '826580141291873917', 'MTN', NULL, 0, '2025-11-17 05:24:47', 1, NULL, 1),
(204, '09037303701', 100, 100, 'prosperjasper002@gmail.com', '08088888888', '17633617637374578038363831', '988130978189944048', 'MTN', 'Successful', 1, '2025-11-17 06:42:43', 1, NULL, 1),
(205, '09037303701', 500, 500, 'prosperjasper002@gmail.com', '08088888888', NULL, '560209904376937527', 'MTN', NULL, 0, '2025-11-17 06:43:13', 1, NULL, 1),
(206, '09037303701', 500, 500, 'prosperjasper002@gmail.com', '08088888888', NULL, '745689955819236970', 'MTN', NULL, 0, '2025-11-17 09:51:48', 1, NULL, 1),
(207, '09037303701', 1000, 1000, 'prosperjasper002@gmail.com', '08088888888', NULL, '688943549856865155', 'MTN', NULL, 0, '2025-11-17 16:38:33', 1, NULL, 1),
(208, '09037303701', 100, 100, 'prosperjasper002@gmail.com', '08088888888', NULL, '311435132600643954', 'MTN', NULL, 0, '2025-11-19 08:03:27', 1, NULL, 1),
(209, '09037303701', 100, 100, 'prosperjasper002@gmail.com', '08088888888', NULL, '488455179266458055', 'MTN', NULL, 0, '2025-11-19 13:41:10', 1, NULL, 1),
(210, '09037303701', 100, 100, 'prosperjasper002@gmail.com', '08088888888', NULL, '204572738609781587', 'MTN', NULL, 0, '2025-11-19 14:51:40', 1, NULL, 1),
(211, '09037308555', 100, 100, 'prosperjasper002@gmail.com', '08088888888', NULL, '250110851429559317', 'MTN', NULL, 0, '2025-11-20 07:07:12', 1, NULL, 1),
(212, '09037303701', 100, 100, 'prosperjasper002@gmail.com', '08088888888', NULL, '389002504862667568', 'MTN', NULL, 0, '2025-11-20 16:16:04', 1, NULL, 1),
(213, '09037303701', 200, 200, 'prosperjasper002@gmail.com', '08088888888', NULL, '591224136764129244', 'MTN', NULL, 0, '2025-11-22 13:40:14', 1, NULL, 1),
(214, '09037303701', 100, 100, 'prosperjasper002@gmail.com', '08088888888', NULL, '533646054333231193', 'MTN', NULL, 0, '2025-11-23 18:56:08', 1, NULL, 1),
(215, '09037303701', 200, 200, 'prosperjasper002@gmail.com', '08088888888', NULL, '892916354796601466', 'MTN', NULL, 0, '2025-11-24 10:55:14', 1, NULL, 1),
(216, '09037303701', 100, 100, 'prosperjasper002@gmail.com', '08088888888', NULL, '126882450679340030', 'MTN', NULL, 0, '2025-11-24 21:20:46', 1, NULL, 1),
(217, '09037303701', 500, 500, 'prosperjasper002@gmail.com', '08088888888', NULL, '838409497331696074', 'MTN', NULL, 0, '2025-11-26 01:52:54', 1, NULL, 1),
(218, '09037303701', 2000, 2000, 'prosperjasper002@gmail.com', '08088888888', NULL, '600633673941217414', 'MTN', NULL, 0, '2025-11-28 11:49:16', 1, NULL, 1),
(219, '07065622606', 2230, 2230, 'oawel01@gmail.com', '09048991296', '', '584223865464662856', 'MTN Cheap Data', 'Insuficient Balance', 0, '2025-11-28 12:19:39', 1, NULL, 1),
(220, '07065622606', 2230, 2230, 'oawel01@gmail.com', '09048991296', '734590117973251711', '734590117973251711', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-11-28 12:23:59', 1, NULL, 1),
(221, '09048991296', 2000, 2000, 'oawel01@gmail.com', '09048991296', NULL, '196150205690752065', 'AIRTEL', NULL, 0, '2025-11-28 17:11:21', 1, NULL, 1),
(222, '09048991296', 1000, 1000, 'oawel01@gmail.com', '09048991296', NULL, '926897979469141089', 'AIRTEL', NULL, 0, '2025-11-28 17:13:00', 1, NULL, 1),
(223, '09037303701', 500, 500, 'prosperjasper002@gmail.com', '08088888888', NULL, '544486687369924796', 'MTN', NULL, 0, '2025-12-06 20:07:43', 1, NULL, 1),
(224, '09037303701', 500, 500, 'prosperjasper002@gmail.com', '08088888888', NULL, '930068417868991494', 'MTN', NULL, 0, '2025-12-10 08:29:24', 1, NULL, 1),
(225, '09037303701', 500, 500, 'prosperjasper002@gmail.com', '08088888888', NULL, '376887037441606638', 'MTN', NULL, 0, '2025-12-12 07:07:41', 1, NULL, 1),
(226, '09037303701', 1000, 1000, 'prosperjasper002@gmail.com', '08088888888', NULL, '684221648120738538', 'MTN', NULL, 0, '2025-12-18 10:11:50', 1, NULL, 1),
(227, '09037303701', 100, 100, 'prosperjasper002@gmail.com', '08088888888', NULL, '174671426807940190', 'MTN', NULL, 0, '2025-12-21 23:13:51', 1, NULL, 1),
(228, '08036936925', 100, 100, 'balaabu033@gmail.com', '08036936936', '', '200686404567723981', 'MTN DATA', 'Insufficient Balance', 0, '2025-12-23 20:56:11', 1, NULL, 1),
(229, '07071574520', 5000, 5000, 'balaabu033@gmail.com', '08036936936', '', '479236359276067408', 'MTN', 'Insuficient Balance', 0, '2025-12-23 20:58:52', 1, NULL, 1),
(230, '07071574520', 51, 51, 'balaabu033@gmail.com', '08036936936', '17665731647519331424519811', '713171184544828299', 'MTN', 'Successful', 1, '2025-12-24 10:46:04', 1, NULL, 1),
(231, '07071574520', 51, 51, 'balaabu033@gmail.com', '08036936936', '17665732234688152350690885', '905783139708786875', 'MTN', 'Successful', 1, '2025-12-24 10:47:02', 1, NULL, 1),
(232, '09160536714', 51, 51, 'balaabu033@gmail.com', '08036936936', '17665742283095388931568528', '714341867143824935', 'MTN', 'Successful', 1, '2025-12-24 11:03:47', 1, NULL, 1),
(233, '09160536714', 50, 50, 'balaabu033@gmail.com', '08036936936', '17665748955264680637450732', '115612243781893932', 'MTN', 'Successful', 1, '2025-12-24 11:14:54', 1, NULL, 1),
(234, '07067752068', 265, 265, 'softwareclone11@gmail.com', '08160327173', '338439601340593017', '338439601340593017', 'MTN Cheap Data', 'Transaction Failed', 2, '2025-12-24 16:11:32', 1, NULL, 1),
(235, '07067752068', 100, 100, 'softwareclone11@gmail.com', '08160327173', '17665929476872410957890993', '995115183222517398', 'MTN DATA', 'Successful', 1, '2025-12-24 16:15:47', 1, NULL, 1),
(236, '09037303701', 130, 130, 'prosperjasper002@gmail.com', '08088888888', NULL, '895285687134855223', 'MTN', NULL, 0, '2025-12-30 16:12:40', 1, NULL, 1),
(237, '07067752068', 100, 100, 'softwareclone11@gmail.com', '08160327173', '', '138514951731473396', 'MTN DATA', 'Transaction failed at provider', 2, '2026-01-04 14:27:40', 1, NULL, 1),
(238, '08108184500', 400, 400, 'abdulazeezbello5882@gmail.comm', '081081845000', '', '404668431114440925', 'MTN', 'Insuficient Balance', 0, '2026-03-28 02:08:19', 1, NULL, 1),
(239, '08108184500', 50, 49, 'abz@gmail.com', '08108184500', '8143226', '17749803888429', 'MTN', '{\"id\":8143226,\"airtime_type\":\"VTU\",\"ident\":\"2026033119062916936367642a36bc800-bb1c-4625-8c90-55966cde9589\",\"network\":1,\"paid_amount\":\"49.0\",\"mobile_number\":\"08108184500\",\"amount\":\"50\",\"plan_amount\":\"50\",\"plan_network\":\"MTN\",\"balance_before\":\"2429.91\",\"bal', 1, '2026-03-31 18:06:35', 1, 0, 1),
(240, '08108184500', 50, 49, 'abz@gmail.com', '08108184500', '8143243', '17749806012877', 'MTN', '{\"id\":8143243,\"airtime_type\":\"VTU\",\"ident\":\"20260331191001179451861888f9188d5a-a1ae-46b5-b498-4e903853002a\",\"network\":1,\"paid_amount\":\"49.0\",\"mobile_number\":\"08108184500\",\"amount\":\"50\",\"plan_amount\":\"50\",\"plan_network\":\"MTN\",\"balance_before\":\"2380.91\",\"ba', 1, '2026-03-31 18:10:07', 1, 0, 1),
(241, '07019588264', 50, 49, 'abz@gmail.com', '07019588264', '8143263', '17749808322628', 'AIRTEL Airtime', '{\"id\":8143263,\"airtime_type\":\"VTU\",\"ident\":\"20260331191352385573187508b9f121e-33b0-47cc-b08e-fc73747e2527\",\"network\":4,\"paid_amount\":\"49.0\",\"mobile_number\":\"07019588264\",\"amount\":\"50\",\"plan_amount\":\"50\",\"plan_network\":\"AIRTEL\",\"balance_before\":\"2331.91\",\"', 1, '2026-03-31 18:14:00', 1, 0, 1),
(242, '08108184500', 55, 54, 'abz@gmail.com', '08108184500', '8143527', '17749839299525', 'MTN', '{\"id\":8143527,\"airtime_type\":\"VTU\",\"ident\":\"20260331200529247754651622087a5ec5-95f9-440d-98c4-3c80cd86652d\",\"network\":1,\"paid_amount\":\"53.9\",\"mobile_number\":\"08108184500\",\"amount\":\"55\",\"plan_amount\":\"55\",\"plan_network\":\"MTN\",\"balance_before\":\"2282.91\",\"ba', 1, '2026-03-31 19:05:35', 1, 0, 1),
(243, '08108184500', 50, 49, 'abz@gmail.com', '08108184500', '8143534', '17749840208324', 'MTN Airtime', '{\"id\":8143534,\"airtime_type\":\"VTU\",\"ident\":\"202603312007013221515814147c5d18f6-8dfd-41ba-96c0-f08d02a2fd38\",\"network\":1,\"paid_amount\":\"49.0\",\"mobile_number\":\"08108184500\",\"amount\":\"50\",\"plan_amount\":\"50\",\"plan_network\":\"MTN\",\"balance_before\":\"2229.0099999', 1, '2026-03-31 19:07:06', 1, 0, 1),
(244, '07019588264', 50, 49, 'abz@gmail.com', '07019588264', '8144224', '17749961801751', 'AIRTEL Airtime', '{\"id\":8144224,\"airtime_type\":\"VTU\",\"ident\":\"2026033123294028397126199066e62fa6-a7f7-4cd4-9a1a-c17b34897f12\",\"network\":4,\"paid_amount\":\"49.0\",\"mobile_number\":\"07019588264\",\"amount\":\"50\",\"plan_amount\":\"50\",\"plan_network\":\"AIRTEL\",\"balance_before\":\"2180.0099', 1, '2026-03-31 22:29:47', 1, 0, 1),
(245, '08108184500', 50, 50, 'abz@gmail.com', '08108184500', '17750325721138356195212951', 'airtime_69ccd8fb782fa', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08108184500\",\"unit_price\":\"50\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":1.5,\"total_amount\":48.5,\"discount\":null,\"', 1, '2026-04-01 08:36:13', 1, 0, 1),
(246, '07019588264', 100, 100, 'abz@gmail.com', '07019588264', '', 'airtime_69d27644eb7c6', 'AIRTEL Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-05 14:48:37', 1, 0, 1),
(247, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '', 'airtime_69d2abb7c560b', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-05 18:36:40', 1, 0, 1),
(248, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '', 'airtime_69d2abc371041', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-05 18:36:52', 1, 0, 1),
(249, '08033067987', 100, 100, 'oawel01@gmail.com', '08033067987', '', 'airtime_69d36e25c22ef', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-06 08:26:14', 1, 0, 1),
(250, '08033067987', 100, 100, 'oawel01@gmail.com', '08033067987', '', 'airtime_69d36e35ebb6b', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-06 08:26:30', 1, 0, 1),
(251, '08160327173', 100, 100, 'abz@gmail.com', '08160327173', '', 'airtime_69d41c831f8ec', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-06 20:50:12', 1, 0, 1),
(252, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', '', '368476948689595186', 'AIRTEL DATA', 'Transaction failed at provider', 2, '2026-04-07 14:19:20', 1, NULL, 1),
(253, '08108184500', 50, 50, 'abz@gmail.com', '08108184500', '', 'airtime_69dfb7546e136', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-15 16:05:41', 1, 0, 1),
(254, '07019588264', 50, 50, 'abz@gmail.com', '07019588264', '', 'DATA_1776340342_9834', 'Data Purchase', '{\"code\":\"011\",\"response_description\":\"INVALID ARGUMENTS\",\"content\":{\"errors\":[\"phone is empty\"]}}', 0, '2026-04-16 11:52:23', 1, 0, 1),
(255, '07019588264', 50, 50, 'abz@gmail.com', '07019588264', '', 'DATA_1776340462_7340', 'Data Purchase', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-16 11:54:23', 1, 0, 1),
(256, '09099565665', 50, 50, 'abz@gmail.com', '09099565665', '', 'airtime_69e0d30ed16e6', 'ETISALAT Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-16 12:16:15', 1, 0, 1),
(257, '09099464645', 50, 50, 'abz@gmail.com', '09099464645', '', 'airtime_69e0d48d1bfde', 'ETISALAT Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-16 12:22:37', 1, 0, 1),
(258, '08108184500', 50, 50, 'abz@gmail.com', '08108184500', '', 'airtime_69e101a65b4db', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-16 15:35:03', 1, 0, 1),
(259, '08108184500', 275, 275, 'abz@gmail.com', '08108184500', '', 'plan_69e10e3a8662c', 'MTN SME 1.0 GB', '{\"error\":[\"SME Data not available on this network currently\"]}', 0, '2026-04-16 16:28:42', 1, 0, 1),
(260, '07019588264', 290, 290, 'abz@gmail.com', '07019588264', '', 'plan_69e10e7626a29', 'Airtel 1.0 GB', '{\"error\":[\"CORPORATE Gifting Data not available on this network currently\"]}', 0, '2026-04-16 16:29:42', 1, 0, 1),
(261, '08108184500', 275, 275, 'abz@gmail.com', '08108184500', '', 'plan_69e10f46b5401', 'MTN SME 1.0 GB', '{\"error\":[\"SME Data not available on this network currently\"]}', 0, '2026-04-16 16:33:10', 1, 0, 1),
(262, '08108184500', 128, 128, 'abz@gmail.com', '08108184500', 'txn_69e1126e3668d', 'plan_69e1126e366af', 'DATA SHARE(500 MB)', '{\"plan\":[\"Invalid pk \\\"304\\\" - object does not exist.\"]}', 0, '2026-04-16 16:46:38', 1, 0, 1),
(263, '08108184500', 240, 240, 'abz@gmail.com', '08108184500', '86711960', 'plan_69e112a233a29', 'MTN AWOOF 1GB', '{\"id\":86711960,\"network\":1,\"ident\":\"DATA9051219b8-6\",\"balance_before\":\"1608.0\",\"balance_after\":\"1125.0\",\"mobile_number\":\"08108184500\",\"plan\":310,\"Status\":\"successful\",\"plan_network\":\"MTN\",\"plan_name\":\"1.0GB\",\"plan_amount\":\"483.0\",\"create_date\":\"2026-04-16', 1, '2026-04-16 16:47:30', 1, 0, 1),
(264, '08108180466', 50, 50, 'abz@gmail.com', '08108180466', '', 'airtime_69e14d41b47e1', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-16 20:57:38', 1, 0, 1),
(265, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '', 'airtime_69e3de6aa74be', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-18 19:41:31', 1, 0, 1),
(266, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '', 'airtime_69e6bd4e061eb', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-20 23:57:02', 1, 0, 1),
(267, '08108184580', 100, 100, 'abz@gmail.com', '08108184580', '', 'airtime_69e769f9125e5', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-21 12:13:45', 1, 0, 1),
(268, '08111111111', 500, 500, 'abz@gmail.com', '08111111111', '', 'airtime_69e7c19a7f3f0', 'GLO Airtime', '{\"code\":\"028\",\"response_description\":\"PRODUCT IS NOT WHITELISTED ON YOUR ACCOUNT\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-21 18:27:39', 1, 0, 1),
(269, '08111111111', 500, 500, 'abz@gmail.com', '08111111111', '17767962326639489545861470', 'airtime_69e7c247dda98', 'GLO Airtime', '{\"code\":\"016\",\"content\":{\"transactions\":{\"status\":\"failed\",\"product_name\":\"GLO Airtime VTU\",\"unique_element\":\"08111111111\",\"unit_price\":\"500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":15,\"total_amount\":485,\"discount\":null,\"type', 0, '2026-04-21 18:30:49', 1, 0, 1),
(270, '08011111111', 500, 500, 'abz@gmail.com', '08011111111', '17767964709331167905890531', 'airtime_69e7c3362fcdd', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08011111111\",\"unit_price\":\"500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":17.5,\"total_amount\":482.5,\"discount\":nul', 1, '2026-04-21 18:34:42', 1, 0, 1),
(271, '08011111111', 5000, 5000, 'abz@gmail.com', '08011111111', '17767965378570449377177258', 'airtime_69e7c37923e14', 'AIRTEL Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Airtel Airtime VTU\",\"unique_element\":\"08011111111\",\"unit_price\":\"5000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":150,\"total_amount\":4850,\"discount\":n', 1, '2026-04-21 18:35:49', 1, 0, 1),
(272, '08011111111', 100, 100, 'abz@gmail.com', '08011111111', '17767965753640263774528414', 'airtime_69e7c39e9cee3', 'GLO Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"GLO Airtime VTU\",\"unique_element\":\"08011111111\",\"unit_price\":\"100\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,\"typ', 1, '2026-04-21 18:36:26', 1, 0, 1),
(273, '08011111111', 100, 100, 'abz@gmail.com', '08011111111', '17767966118245423339737309', 'airtime_69e7c3c30d166', 'ETISALAT Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"9mobile Airtime VTU\",\"unique_element\":\"08011111111\",\"unit_price\":\"100\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,', 1, '2026-04-21 18:37:03', 1, 0, 1),
(274, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '17767966542529184860255126', 'DATA_1776796653_3703', 'MTN Data', '{\"code\":\"016\",\"content\":{\"transactions\":{\"status\":\"failed\",\"product_name\":\"MTN Data\",\"unique_element\":\"08108184500\",\"unit_price\":\"100.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":4,\"total_amount\":96,\"discount\":null,\"type\":\"Dat', 0, '2026-04-21 18:37:50', 1, 0, 1),
(275, '08011111111', 100, 100, 'abz@gmail.com', '08011111111', '17767967348405420814371881', 'DATA_1776796734_1979', 'MTN Data', '{\"code\":\"016\",\"content\":{\"transactions\":{\"status\":\"failed\",\"product_name\":\"MTN Data\",\"unique_element\":\"08108184500\",\"unit_price\":\"100.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":4,\"total_amount\":96,\"discount\":null,\"type\":\"Dat', 0, '2026-04-21 18:39:11', 1, 0, 1),
(276, '08011111111', 100, 100, 'abz@gmail.com', '08011111111', '17767968604535571312616930', 'DATA_1776796859_3149', 'MTN Data', '{\"code\":\"016\",\"content\":{\"transactions\":{\"status\":\"failed\",\"product_name\":\"MTN Data\",\"unique_element\":\"08108184500\",\"unit_price\":\"100.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":4,\"total_amount\":96,\"discount\":null,\"type\":\"Dat', 0, '2026-04-21 18:41:16', 1, 0, 1),
(277, '08011111111', 100, 100, 'abz@gmail.com', '08011111111', '17767968883893174729900745', 'DATA_1776796887_2699', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08011111111\",\"unit_price\":\"100.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":4,\"total_amount\":96,\"discount\":null,\"type\":\"', 1, '2026-04-21 18:41:39', 1, 0, 1),
(278, '08011111111', 50, 50, 'abz@gmail.com', '08011111111', '17767969380041658463756533', 'DATA_1776796937_9767', 'Airtel Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Airtel Data\",\"unique_element\":\"08011111111\",\"unit_price\":\"50.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":1.5,\"total_amount\":48.5,\"discount\":null,\"t', 1, '2026-04-21 18:42:29', 1, 0, 1),
(279, '08011111111', 50, 50, 'abz@gmail.com', '08011111111', '17767970324092497538610360', 'DATA_1776797031_8198', 'GLO Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"GLO Data\",\"unique_element\":\"08011111111\",\"unit_price\":\"50.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":2,\"total_amount\":48,\"discount\":null,\"type\":\"D', 1, '2026-04-21 18:44:06', 1, 0, 1),
(280, '08011111111', 150, 150, 'abz@gmail.com', '08011111111', '', 'DATA_1776797090_4990', 'Data Purchase', '{\"code\":\"010\",\"response_description\":\"VARIATION CODE DOES NOT EXIST FOR SELECTED PRODUCT\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-21 18:44:50', 1, 0, 1),
(281, '08011111111', 100, 100, 'abz@gmail.com', '08011111111', '17767971120198593471511572', 'DATA_1776797111_4796', '9mobile Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"9mobile Data\",\"unique_element\":\"08011111111\",\"unit_price\":\"100.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,\"typ', 1, '2026-04-21 18:45:25', 1, 0, 1),
(282, '1212121212', 1850, 1850, 'abz@gmail.com', '1212121212', '17767977413913295672424894', 'TV_1776797740_2908', 'DSTV Subscription', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"DSTV Subscription\",\"unique_element\":\"1212121212\",\"unit_price\":\"1850.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":27.75,\"total_amount\":1822.25,\"disco', 1, '2026-04-21 18:55:53', 1, 0, 1),
(283, '1212121212', 410, 410, 'abz@gmail.com', '1212121212', '17767977966510164560705150', 'TV_1776797795_4422', 'Gotv Payment', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Gotv Payment\",\"unique_element\":\"1212121212\",\"unit_price\":\"410.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":6.1499999999999995,\"total_amount\":403.85,', 1, '2026-04-21 18:56:48', 1, 0, 1),
(284, '1212121212', 900, 900, 'abz@gmail.com', '1212121212', '17767978436633353405486902', 'TV_1776797842_9183', 'Startimes Subscription', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Startimes Subscription\",\"unique_element\":\"1212121212\",\"unit_price\":\"900.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":22.5,\"total_amount\":877.5,\"disc', 1, '2026-04-21 18:57:35', 1, 0, 1),
(285, '1111111111111', 1000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776798157_3731', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"KEDCO - Kano Electric\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":10,\"total_amount\":990,\"discount', 1, '2026-04-21 19:02:58', 1, NULL, 1),
(286, '1111111111111', 1000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776798283_8111', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Abuja Electricity Distribution Company- AEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":15,\"tota', 1, '2026-04-21 19:05:03', 1, NULL, 1),
(287, '1010101010101', 1000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776798623_8511', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"KEDCO - Kano Electric\",\"unique_element\":\"1010101010101\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":10,\"total_amount\":990,\"discount', 1, '2026-04-21 19:10:41', 1, NULL, 1),
(288, '1010101010101', 1000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776798864_6244', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Jos Electric - JED\",\"unique_element\":\"1010101010101\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":12,\"total_amount\":988,\"discount\":n', 1, '2026-04-21 19:14:47', 1, NULL, 1),
(289, '1010101010101', 1000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776799073_2702', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Abuja Electricity Distribution Company- AEDC\",\"unique_element\":\"1010101010101\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":15,\"tota', 1, '2026-04-21 19:18:09', 1, NULL, 1),
(290, '1111111111111', 1000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776799144_5950', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Eko Electric Payment - EKEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":8,\"total_amount\":992,\"di', 1, '2026-04-21 19:19:20', 1, NULL, 1),
(291, '1010101010101', 1000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776799210_4359', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Eko Electric Payment - EKEDC\",\"unique_element\":\"1010101010101\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":8,\"total_amount\":992,\"di', 1, '2026-04-21 19:20:27', 1, NULL, 1),
(292, '1111111111111', 1000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776799334_8946', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"PHED - Port Harcourt Electric\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":20,\"total_amount\":980,\"', 1, '2026-04-21 19:22:31', 1, NULL, 1),
(293, '1010101010101', 1000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776799470_5955', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"PHED - Port Harcourt Electric\",\"unique_element\":\"1010101010101\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":20,\"total_amount\":980,\"', 1, '2026-04-21 19:24:51', 1, NULL, 1),
(294, '1111111111111', 10000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776799553_4834', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"IBEDC - Ibadan Electricity Distribution Company\",\"unique_element\":\"1111111111111\",\"unit_price\":\"10000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":60,\"', 1, '2026-04-21 19:26:16', 1, NULL, 1),
(295, '1010101010101', 50000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776809837_6389', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"IBEDC - Ibadan Electricity Distribution Company\",\"unique_element\":\"1010101010101\",\"unit_price\":\"50000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":300,', 1, '2026-04-21 22:17:31', 1, NULL, 1),
(296, '1111111111111', 5000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776810142_6417', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Kaduna Electric - KAEDCO\",\"unique_element\":\"1111111111111\",\"unit_price\":\"5000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":50,\"total_amount\":4950,\"disc', 1, '2026-04-21 22:22:37', 1, NULL, 1),
(297, '1010101010101', 5000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776810239_6417', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Kaduna Electric - KAEDCO\",\"unique_element\":\"1010101010101\",\"unit_price\":\"5000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":50,\"total_amount\":4950,\"disc', 1, '2026-04-21 22:24:15', 1, NULL, 1),
(298, '1111111111111', 3000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776810305_3280', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Enugu Electric - EEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"3000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":60,\"total_amount\":2940,\"discoun', 1, '2026-04-21 22:25:20', 1, NULL, 1),
(299, '1010101010101', 20000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776810370_4687', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Enugu Electric - EEDC\",\"unique_element\":\"1010101010101\",\"unit_price\":\"20000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":400,\"total_amount\":19600,\"disc', 1, '2026-04-21 22:26:24', 1, NULL, 1),
(300, '1111111111111', 2000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776810433_8257', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Benin Electricity - BEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"2000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":\"1.00\",\"total_amount\":2099,\"', 1, '2026-04-21 22:27:31', 1, NULL, 1);
INSERT INTO `transactions_tbl` (`id`, `unique_element`, `amount`, `real_amount`, `email`, `phone`, `transaction_id`, `request_id`, `product_name`, `response_description`, `status`, `transaction_date`, `is_bill`, `our_commission`, `super_admin`) VALUES
(301, '1010101010101', 2000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776810484_7727', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Benin Electricity - BEDC\",\"unique_element\":\"1010101010101\",\"unit_price\":\"2000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":\"1.00\",\"total_amount\":2099,\"', 1, '2026-04-21 22:28:18', 1, NULL, 1),
(302, '1111111111111', 2000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776810552_1286', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Aba Electric Payment - ABEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"2000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":20,\"total_amount\":2080,\"', 1, '2026-04-21 22:29:25', 1, NULL, 1),
(303, '1010101010101', 2000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776810604_7163', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Aba Electric Payment - ABEDC\",\"unique_element\":\"1010101010101\",\"unit_price\":\"2000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":20,\"total_amount\":2080,\"', 1, '2026-04-21 22:30:22', 1, NULL, 1),
(304, '1212121212', 1700, 1700, 'abz@gmail.com', '1212121212', '17768126136436520483624245', 'TV_1776812612_5932', 'Startimes Subscription', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Startimes Subscription\",\"unique_element\":\"1212121212\",\"unit_price\":\"1700.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":42.5,\"total_amount\":1657.5,\"di', 1, '2026-04-21 23:03:46', 1, 0, 1),
(305, '1010101010101', 1000, 0, 'abz@gmail.com', '1010101010101', '', 'ELEC_1776872156_4977', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Jos Electric - JED\",\"unique_element\":\"1010101010101\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":12,\"total_amount\":988,\"discount\":n', 1, '2026-04-22 15:36:17', 1, NULL, 1),
(306, '1111111111111', 1500, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776872299_1723', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"KEDCO - Kano Electric\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":15,\"total_amount\":1485,\"discoun', 1, '2026-04-22 15:38:48', 1, NULL, 1),
(307, '1111111111111', 1500, 0, 'abz@gmail.com', '1111111111111', 'Token : 26362054405982757802', 'ELEC_1776872510_9494', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Ikeja Electric Payment - IKEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":22.5,\"total_amount\":1477.5,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1500\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768725111043197856530260\",\"commission_details\":{\"amount\":22.5,\"rate\":\"1.50\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776872510_9494\",\"amount\":1500,\"transaction_date\":\"2026-04-22T15:41:51.000000Z\",\"purchased_code\":\"Token : 26362054405982757802\",\"customerName\":\"N\\/A\",\"customerAddress\":\"N\\/A\",\"meterNumber\":\"N\\/A\",\"token\":\"Token : 26362054405982757802\",\"tokenAmount\":1860.47,\"exchangeReference\":\"40532461\",\"resetToken\":\"N\\/A\",\"configureToken\":\"N\\/A\",\"units\":\"79.9 kWh\",\"f', 1, '2026-04-22 15:42:08', 1, NULL, 1),
(308, '1111111111111', 1500, 0, 'abz@gmail.com', '1111111111111', 'Token : 26362054405982757802', 'ELEC_1776873201_2208', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Ikeja Electric Payment - IKEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":22.5,\"total_amount\":1477.5,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1500\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768732025177344525659986\",\"commission_details\":{\"amount\":22.5,\"rate\":\"1.50\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776873201_2208\",\"amount\":1500,\"transaction_date\":\"2026-04-22T15:53:22.000000Z\",\"purchased_code\":\"Token : 26362054405982757802\",\"customerName\":\"N\\/A\",\"customerAddress\":\"N\\/A\",\"meterNumber\":\"N\\/A\",\"token\":\"Token : 26362054405982757802\",\"tokenAmount\":1860.47,\"exchangeReference\":\"40532461\",\"resetToken\":\"N\\/A\",\"configureToken\":\"N\\/A\",\"units\":\"79.9 kWh\",\"fixChargeAmount\":0,\"tariff\":\"R2 SINGLE PHASE RESIDENTIAL\",\"taxAmount\":0,\"debtAmount\":0,\"kct1\":\"N\\/A\",\"kct2\":\"N\\/A\",\"penalty\":0,\"costOfUnit\":0,\"announcement\":\"N\\/A\",\"meterCost\":0,\"currentCharge\":0,\"lossOfRevenue\":0,\"tariffBaseRate\":0,\"installationFee\":0,\"reconnectionFee\":0,\"meterServiceCharge\":0,\"administrativeCharge\":0}', 1, '2026-04-22 15:53:38', 1, NULL, 1),
(309, '08011111111', 1500, 1500, 'abz@gmail.com', '08011111111', '', 'DATA_1776875045_6611', 'Data Purchase', '{\"code\":\"010\",\"response_description\":\"VARIATION CODE DOES NOT EXIST FOR SELECTED PRODUCT\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-22 16:24:05', 1, 0, 1),
(310, '08011111111', 1500, 1500, 'abz@gmail.com', '08011111111', '', 'DATA_1776875051_8525', 'Data Purchase', '{\"code\":\"010\",\"response_description\":\"VARIATION CODE DOES NOT EXIST FOR SELECTED PRODUCT\",\"content\":{\"errors\":\"\"}}', 0, '2026-04-22 16:24:12', 1, 0, 1),
(311, '08011111111', 100, 100, 'abz@gmail.com', '08011111111', '17768750854175901321592999', 'DATA_1776875084_1551', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08011111111\",\"unit_price\":\"100.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":4,\"total_amount\":96,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768750854175901321592999\",\"commission_details\":{\"amount\":4,\"rate\":\"4.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1776875084_1551\",\"amount\":100,\"transaction_date\":\"2026-04-22T16:24:45.000000Z\",\"purchased_code\":\"\"}', 1, '2026-04-22 16:24:59', 1, 0, 1),
(312, '08011111111', 1000, 1000, 'abz@gmail.com', '08011111111', '17768751651787590184809380', 'DATA_1776875164_3279', 'GLO Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"GLO Data\",\"unique_element\":\"08011111111\",\"unit_price\":\"1000.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":40,\"total_amount\":960,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1000.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768751651787590184809380\",\"commission_details\":{\"amount\":40,\"rate\":\"4.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1776875164_3279\",\"amount\":1000,\"transaction_date\":\"2026-04-22T16:26:05.000000Z\",\"purchased_code\":\"\"}', 1, '2026-04-22 16:26:19', 1, 0, 1),
(313, '1111111111111', 1500, 0, 'abz@gmail.com', '1111111111111', 'N/A', 'ELEC_1776875469_9088', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"KEDCO - Kano Electric\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":15,\"total_amount\":1485,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1500\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768754706200565437134977\",\"commission_details\":{\"amount\":15,\"rate\":\"1.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776875469_9088\",\"amount\":1500,\"transaction_date\":\"2026-04-22T16:31:10.000000Z\",\"purchased_code\":\"\",\"CustomerName\":null,\"CustomerAddress\":null,\"DebtTax\":null,\"DebtAmount\":null,\"DebtValue\":null,\"DebtRem\":null,\"FixedTax\":null,\"FixedAmount\":null,\"FixedValue\":null,\"Amount\":1500,\"Tax\":null,\"Units\":null,\"Token\":null,\"Tariff\":null,\"Description\":null,\"Receipt\":null}', 1, '2026-04-22 16:31:30', 1, NULL, 1),
(314, '1111111111111', 1500, 0, 'abz@gmail.com', '1111111111111', 'N/A', 'ELEC_1776875566_3110', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Ikeja Electric Payment - IKEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":22.5,\"total_amount\":1477.5,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1500\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768755669835734011865922\",\"commission_details\":{\"amount\":22.5,\"rate\":\"1.50\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776875566_3110\",\"amount\":1500,\"transaction_date\":\"2026-04-22T16:32:46.000000Z\",\"purchased_code\":\"Token : 26362054405982757802\",\"customerName\":\"N\\/A\",\"customerAddress\":\"N\\/A\",\"meterNumber\":\"N\\/A\",\"token\":\"Token : 26362054405982757802\",\"tokenAmount\":1860.47,\"exchangeReference\":\"40532461\",\"resetToken\":\"N\\/A\",\"configureToken\":\"N\\/A\",\"units\":\"79.9 kWh\",\"fixChargeAmount\":0,\"tariff\":\"R2 SINGLE PHASE RESIDENTIAL\",\"taxAmount\":0,\"debtAmount\":0,\"kct1\":\"N\\/A\",\"kct2\":\"N\\/A\",\"penalty\":0,\"costOfUnit\":0,\"announcement\":\"N\\/A\",\"meterCost\":0,\"currentCharge\":0,\"lossOfRevenue\":0,\"tariffBaseRate\":0,\"installationFee\":0,\"reconnectionFee\":0,\"meterServiceCharge\":0,\"administrativeCharge\":0}', 1, '2026-04-22 16:33:03', 1, NULL, 1),
(315, '1111111111111', 1500, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776875627_1405', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Ikeja Electric Payment - IKEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":22.5,\"total_amount\":1477.5,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1500\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768756277991899380560556\",\"commission_details\":{\"amount\":22.5,\"rate\":\"1.50\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776875627_1405\",\"amount\":1500,\"transaction_date\":\"2026-04-22T16:33:47.000000Z\",\"purchased_code\":\"Token : 26362054405982757802\",\"customerName\":\"N\\/A\",\"customerAddress\":\"N\\/A\",\"meterNumber\":\"N\\/A\",\"token\":\"Token : 26362054405982757802\",\"tokenAmount\":1860.47,\"exchangeReference\":\"40532461\",\"resetToken\":\"N\\/A\",\"configureToken\":\"N\\/A\",\"units\":\"79.9 kWh\",\"fixChargeAmount\":0,\"tariff\":\"R2 SINGLE PHASE RESIDENTIAL\",\"taxAmount\":0,\"debtAmount\":0,\"kct1\":\"N\\/A\",\"kct2\":\"N\\/A\",\"penalty\":0,\"costOfUnit\":0,\"announcement\":\"N\\/A\",\"meterCost\":0,\"currentCharge\":0,\"lossOfRevenue\":0,\"tariffBaseRate\":0,\"installationFee\":0,\"reconnectionFee\":0,\"meterServiceCharge\":0,\"administrativeCharge\":0}', 1, '2026-04-22 16:34:03', 1, NULL, 1),
(316, '1111111111111', 5000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776875719_2133', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Abuja Electricity Distribution Company- AEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"5000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":75,\"total_amount\":4925,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"5000\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768757205149134734835977\",\"commission_details\":{\"amount\":75,\"rate\":\"1.50\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776875719_2133\",\"amount\":5000,\"transaction_date\":\"2026-04-22T16:35:20.000000Z\",\"purchased_code\":\"Token : token: 47133458396693522090\",\"MeterNumber\":\"45066715124\",\"Token\":\"token: 47133458396693522090\",\"ReceiptNumber\":null,\"PurchasedUnits\":\"13.3\",\"DebtDescription\":null,\"DebtAmount\":null,\"RefundUnits\":null,\"ServiceChargeVatExcl\":null,\"Name\":\"ALPHACELL TECHNO-LTD\",\"Address\":\"ALPHACELL TECHNO-LTD - 0\",\"Reference\":\"47133458396693522090\",\"Vat\":null,\"ResponseTime\":null,\"TariffRate\":null,\"FreeUnits\":null,\"MeterCategory\":\"kWh\",\"UtilityAmountVatExcl\":null}', 1, '2026-04-22 16:35:38', 1, NULL, 1),
(317, '08011111111', 1000, 1000, 'abz@gmail.com', '08011111111', '17768762007332589014385802', 'DATA_1776876198_8871', '9mobile Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"9mobile Data\",\"unique_element\":\"08011111111\",\"unit_price\":\"1000.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":30,\"total_amount\":970,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1000.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768762007332589014385802\",\"commission_details\":{\"amount\":30,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1776876198_8871\",\"amount\":1000,\"transaction_date\":\"2026-04-22T16:43:20.000000Z\",\"purchased_code\":\"\"}', 1, '2026-04-22 16:43:34', 1, 0, 1),
(318, '1111111111111', 1500, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776876253_4560', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Ikeja Electric Payment - IKEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":22.5,\"total_amount\":1477.5,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1500\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768762541199645472865907\",\"commission_details\":{\"amount\":22.5,\"rate\":\"1.50\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776876253_4560\",\"amount\":1500,\"transaction_date\":\"2026-04-22T16:44:14.000000Z\",\"purchased_code\":\"Token : 26362054405982757802\",\"customerName\":\"N\\/A\",\"customerAddress\":\"N\\/A\",\"meterNumber\":\"N\\/A\",\"token\":\"Token : 26362054405982757802\",\"tokenAmount\":1860.47,\"exchangeReference\":\"40532461\",\"resetToken\":\"N\\/A\",\"configureToken\":\"N\\/A\",\"units\":\"79.9 kWh\",\"fixChargeAmount\":0,\"tariff\":\"R2 SINGLE PHASE RESIDENTIAL\",\"taxAmount\":0,\"debtAmount\":0,\"kct1\":\"N\\/A\",\"kct2\":\"N\\/A\",\"penalty\":0,\"costOfUnit\":0,\"announcement\":\"N\\/A\",\"meterCost\":0,\"currentCharge\":0,\"lossOfRevenue\":0,\"tariffBaseRate\":0,\"installationFee\":0,\"reconnectionFee\":0,\"meterServiceCharge\":0,\"administrativeCharge\":0}', 1, '2026-04-22 16:44:30', 1, NULL, 1),
(319, '1111111111111', 1000, 0, 'abz@gmail.com', '1111111111111', '', 'ELEC_1776876650_5705', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"KEDCO - Kano Electric\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":10,\"total_amount\":990,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1000\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768766512991460994449142\",\"commission_details\":{\"amount\":10,\"rate\":\"1.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776876650_5705\",\"amount\":1000,\"transaction_date\":\"2026-04-22T16:50:51.000000Z\",\"purchased_code\":\"\",\"CustomerName\":null,\"CustomerAddress\":null,\"DebtTax\":null,\"DebtAmount\":null,\"DebtValue\":null,\"DebtRem\":null,\"FixedTax\":null,\"FixedAmount\":null,\"FixedValue\":null,\"Amount\":1000,\"Tax\":null,\"Units\":null,\"Token\":null,\"Tariff\":null,\"Description\":null,\"Receipt\":null}', 1, '2026-04-22 16:51:09', 1, NULL, 1),
(320, '1111111111111', 1000, 0, 'abz@gmail.com', '1111111111111', '26362054405982757802', 'ELEC_1776876776_4959', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Ikeja Electric Payment - IKEDC\",\"unique_element\":\"1111111111111\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":15,\"total_amount\":985,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1000\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17768767767102721996504776\",\"commission_details\":{\"amount\":15,\"rate\":\"1.50\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776876776_4959\",\"amount\":1000,\"transaction_date\":\"2026-04-22T16:52:56.000000Z\",\"purchased_code\":\"Token : 26362054405982757802\",\"customerName\":\"N\\/A\",\"customerAddress\":\"N\\/A\",\"meterNumber\":\"N\\/A\",\"token\":\"Token : 26362054405982757802\",\"tokenAmount\":1860.47,\"exchangeReference\":\"40532461\",\"resetToken\":\"N\\/A\",\"configureToken\":\"N\\/A\",\"units\":\"79.9 kWh\",\"fixChargeAmount\":0,\"tariff\":\"R2 SINGLE PHASE RESIDENTIAL\",\"taxAmount\":0,\"debtAmount\":0,\"kct1\":\"N\\/A\",\"kct2\":\"N\\/A\",\"penalty\":0,\"costOfUnit\":0,\"announcement\":\"N\\/A\",\"meterCost\":0,\"currentCharge\":0,\"lossOfRevenue\":0,\"tariffBaseRate\":0,\"installationFee\":0,\"reconnectionFee\":0,\"meterServiceCharge\":0,\"administrativeCharge\":0}', 1, '2026-04-22 16:53:12', 1, NULL, 1),
(321, '07019588264', 50, 50, 'abz@gmail.com', '07019588264', '17769357419426229691455845', 'DATA_1776935741_2124', 'Airtel Data', '{\"code\":\"016\",\"content\":{\"transactions\":{\"status\":\"failed\",\"product_name\":\"Airtel Data\",\"unique_element\":\"07019588264\",\"unit_price\":\"50.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":1.5,\"total_amount\":48.5,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09048991296\",\"name\":null,\"convinience_fee\":0,\"amount\":\"50.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17769357419426229691455845\",\"commission_details\":{\"amount\":1.5,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION FAILED\",\"requestId\":\"DATA_1776935741_2124\",\"amount\":50,\"transaction_date\":\"2026-04-23T09:15:41.000000Z\",\"purchased_code\":\"\"}', 0, '2026-04-23 09:16:02', 1, 0, 1),
(322, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '', 'airtime_69ea0ccbb8613', 'MTN Airtime', '\"Invalid Credentials.\"', 0, '2026-04-23 12:13:00', 1, 0, 1),
(323, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '', 'airtime_69ea0d75655cb', 'MTN Airtime', '{\"code\":\"027\",\"content\":{\"errors\":\"IP NOT WHITELISTED, CONTACT SUPPORT\"}}', 0, '2026-04-23 12:15:50', 1, 0, 1),
(324, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '', 'airtime_69ea0d8bd9062', 'MTN Airtime', '{\"code\":\"027\",\"content\":{\"errors\":\"IP NOT WHITELISTED, CONTACT SUPPORT\"}}', 0, '2026-04-23 12:16:12', 1, 0, 1),
(325, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '', 'airtime_69ea0e90129e4', 'MTN Airtime', '{\"code\":\"027\",\"content\":{\"errors\":\"IP NOT WHITELISTED, CONTACT SUPPORT\"}}', 0, '2026-04-23 12:20:32', 1, 0, 1),
(326, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '', 'airtime_69ea12cc07c00', 'MTN Airtime', '{\"code\":\"027\",\"content\":{\"errors\":\"IP NOT WHITELISTED, CONTACT SUPPORT\"}}', 0, '2026-04-23 12:38:36', 1, 0, 1),
(327, '08108184500', 100, 100, 'abz@gmail.com', '08108184500', '17769485513882342453553187', 'airtime_69ea1546ad785', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08108184500\",\"unit_price\":\"100\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17769485513882342453553187\",\"commission_details\":{\"amount\":3,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69ea1546ad785\",\"amount\":\"100.00\",\"transaction_date\":\"2026-04-23T12:49:11.000000Z\"}', 1, '2026-04-23 12:49:13', 1, 0, 1),
(328, '08160327173', 500, 500, 'softwareclone130@gmail.com', '08160327173', '17769502179760209076962770', 'airtime_69ea1bc94849f', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08160327173\",\"unit_price\":\"500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":15,\"total_amount\":485,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"500\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17769502179760209076962770\",\"commission_details\":{\"amount\":15,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69ea1bc94849f\",\"amount\":\"500.00\",\"transaction_date\":\"2026-04-23T13:16:57.000000Z\"}', 1, '2026-04-23 13:16:59', 1, 0, 1),
(329, '08160327173', 900, 900, 'softwareclone130@gmail.com', '08160327173', '17769503641823515894984877', 'DATA_1776950363_1952', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08160327173\",\"unit_price\":\"900.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":27,\"total_amount\":873,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"900.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17769503641823515894984877\",\"commission_details\":{\"amount\":27,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1776950363_1952\",\"amount\":\"900.00\",\"transaction_date\":\"2026-04-23T13:19:24.000000Z\"}', 1, '2026-04-23 13:19:25', 1, 0, 1),
(330, '08160327173', 100, 100, 'softwareclone130@gmail.com', '08160327173', '17769505989233231346896972', 'airtime_69ea1d4641b9f', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08160327173\",\"unit_price\":\"100\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17769505989233231346896972\",\"commission_details\":{\"amount\":3,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69ea1d4641b9f\",\"amount\":\"100.00\",\"transaction_date\":\"2026-04-23T13:23:18.000000Z\"}', 1, '2026-04-23 13:23:20', 1, 0, 1),
(331, '09048991296', 50, 50, 'oawel01@gmail.com', '09048991296', '17769678090067969061313429', 'airtime_69ea60803787c', 'AIRTEL Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Airtel Airtime VTU\",\"unique_element\":\"09048991296\",\"unit_price\":\"50\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":1.7000000000000002,\"total_amount\":48.3,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"50\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17769678090067969061313429\",\"commission_details\":{\"amount\":1.7000000000000002,\"rate\":\"3.40\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69ea60803787c\",\"amount\":\"50.00\",\"transaction_date\":\"2026-04-23T18:10:08.000000Z\"}', 1, '2026-04-23 18:10:11', 1, 0, 1),
(332, '09135749511', 275, 275, 'oawel01@gmail.com', '09135749511', 'txn_69ea61c3b71cf', 'plan_69ea61c3b71f2', 'MTN SME 1.0 GB', '{\"error\":[\"SME Data not available on this network currently\"]}', 0, '2026-04-23 18:15:31', 1, 0, 1),
(333, '09135749511', 100, 100, 'oawel01@gmail.com', '09135749511', '17769681802987767590818893', 'DATA_1776968179_7363', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"09135749511\",\"unit_price\":\"100.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17769681802987767590818893\",\"commission_details\":{\"amount\":3,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1776968179_7363\",\"amount\":\"100.00\",\"transaction_date\":\"2026-04-23T18:16:20.000000Z\"}', 1, '2026-04-23 18:16:22', 1, 0, 1),
(334, '09048991296', 290, 290, 'oawel01@gmail.com', '09048991296', 'txn_69ea625e3ce12', 'plan_69ea625e3ce2c', 'Airtel 1.0 GB', '{\"error\":[\"CORPORATE Gifting Data not available on this network currently\"]}', 0, '2026-04-23 18:18:06', 1, 0, 1),
(335, '09048991296', 100, 100, 'oawel01@gmail.com', '09048991296', '17769683417527260281727187', 'DATA_1776968341_4188', 'Airtel Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Airtel Data\",\"unique_element\":\"09048991296\",\"unit_price\":\"100.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3.4000000000000004,\"total_amount\":96.6,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17769683417527260281727187\",\"commission_details\":{\"amount\":3.4000000000000004,\"rate\":\"3.40\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1776968341_4188\",\"amount\":\"100.00\",\"transaction_date\":\"2026-04-23T18:19:01.000000Z\"}', 1, '2026-04-23 18:19:03', 1, 0, 1),
(336, '45142863880', 1000, 0, 'oawel01@gmail.com', '45142863880', '51236162181253952143', 'ELEC_1776968951_7402', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"KEDCO - Kano Electric\",\"unique_element\":\"45142863880\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":10,\"total_amount\":990,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":\"0.00\",\"amount\":\"1000\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17769689525621679934714499\",\"commission_details\":{\"amount\":10,\"rate\":\"1.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1776968951_7402\",\"amount\":\"1000.00\",\"transaction_date\":\"2026-04-23T18:29:12.000000Z\",\"purchased_code\":\"Token : 5123-6162-1812-5395-2143\",\"customerName\":\"NURA JIBRIL\",\"customerAddress\":\"NO. 64 UNGUWAR GEZA QUARTERS KANO\",\"meterNumber\":\"45142863880\",\"token\":\"5123-6162-1812-5395-2143\",\"exchangeReference\":\"20260423182934959827\",\"units\":\"14.25\",\"tariff\":\"\",\"taxAmount\":0,\"vat\":0,\"debtAmount\":0,\"KCT1\":\"\",\"KCT2\":\"\",\"announcement\":\"\",\"paymentUsedFor\":\"\",\"energyPaymentBreakdown\":{\"amountPaid\":\"1000.00\",\"vat\":0,\"tokenValue\":null,\"debtBefore\":0,\"debtAmountPaid\":0,\"debtRemaining\":0,\"refundAmount\":0},\"Token\":\"5123-6162-1812-5395-2143\",\"PurchasedUnits\":14.25}', 1, '2026-04-23 18:29:17', 1, NULL, 1),
(337, '09015929122', 500, 500, 'Nazeerelias05@gmail.com', '09015929122', '17770234071233133978487596', 'airtime_69eb39ae74ab0', 'AIRTEL Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Airtel Airtime VTU\",\"unique_element\":\"09015929122\",\"unit_price\":\"500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":17,\"total_amount\":483,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"500\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17770234071233133978487596\",\"commission_details\":{\"amount\":17,\"rate\":\"3.40\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69eb39ae74ab0\",\"amount\":\"500.00\",\"transaction_date\":\"2026-04-24T09:36:47.000000Z\"}', 1, '2026-04-24 09:36:49', 1, 0, 1),
(338, '08160327173', 1800, 1800, 'softwareclone130@gmail.com', '08160327173', '17770446501316984279657251', 'DATA_1777044649_5044', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08160327173\",\"unit_price\":\"1800.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":54,\"total_amount\":1746,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1800.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17770446501316984279657251\",\"commission_details\":{\"amount\":54,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1777044649_5044\",\"amount\":\"1800.00\",\"transaction_date\":\"2026-04-24T15:30:50.000000Z\"}', 1, '2026-04-24 15:30:51', 1, 0, 1),
(339, '08160327173', 200, 200, 'softwareclone130@gmail.com', '08160327173', '17770447225443790809483440', 'airtime_69eb8cf1dab20', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08160327173\",\"unit_price\":\"200\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":6,\"total_amount\":194,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"200\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17770447225443790809483440\",\"commission_details\":{\"amount\":6,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69eb8cf1dab20\",\"amount\":\"200.00\",\"transaction_date\":\"2026-04-24T15:32:02.000000Z\"}', 1, '2026-04-24 15:32:03', 1, 0, 1),
(340, '08033067987', 100, 100, 'oawel01@gmail.com', '08033067987', '17770468424288461173362020', 'airtime_69eb9539b7bf3', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08033067987\",\"unit_price\":\"100\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17770468424288461173362020\",\"commission_details\":{\"amount\":3,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69eb9539b7bf3\",\"amount\":\"100.00\",\"transaction_date\":\"2026-04-24T16:07:22.000000Z\"}', 1, '2026-04-24 16:07:23', 1, 0, 1),
(341, '08033067987', 200, 200, 'oawel01@gmail.com', '08033067987', '17770469183320717530217303', 'DATA_1777046917_5166', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08033067987\",\"unit_price\":\"200.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":6,\"total_amount\":194,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"200.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17770469183320717530217303\",\"commission_details\":{\"amount\":6,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1777046917_5166\",\"amount\":\"200.00\",\"transaction_date\":\"2026-04-24T16:08:38.000000Z\"}', 1, '2026-04-24 16:08:39', 1, 0, 1),
(342, '09039378453', 200, 200, 'softwareclone130@gmail.com', '09039378453', '17771446972169770105625678', 'airtime_69ed137886e2d', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"09039378453\",\"unit_price\":\"200\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":6,\"total_amount\":194,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"200\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17771446972169770105625678\",\"commission_details\":{\"amount\":6,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69ed137886e2d\",\"amount\":\"200.00\",\"transaction_date\":\"2026-04-25T19:18:17.000000Z\"}', 1, '2026-04-25 19:18:18', 1, 0, 1),
(343, '08160327173', 700, 700, 'softwareclone130@gmail.com', '08160327173', '17771447475321558199826012', 'airtime_69ed13aad2727', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08160327173\",\"unit_price\":\"700\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":21,\"total_amount\":679,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"700\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17771447475321558199826012\",\"commission_details\":{\"amount\":21,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69ed13aad2727\",\"amount\":\"700.00\",\"transaction_date\":\"2026-04-25T19:19:07.000000Z\"}', 1, '2026-04-25 19:19:08', 1, 0, 1),
(344, '08153005331', 100, 100, 'softwareclone130@gmail.com', '08153005331', '17771847180707736475563552', 'airtime_69edafcd56002', 'GLO Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"GLO Airtime VTU\",\"unique_element\":\"08153005331\",\"unit_price\":\"100\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":4,\"total_amount\":96,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17771847180707736475563552\",\"commission_details\":{\"amount\":4,\"rate\":\"4.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69edafcd56002\",\"amount\":\"100.00\",\"transaction_date\":\"2026-04-26T06:25:18.000000Z\"}', 1, '2026-04-26 06:25:18', 1, 0, 1),
(345, '08160327173', 100, 100, 'softwareclone130@gmail.com', '08160327173', '17771954965568190999285241', 'airtime_69edd9e7db6d8', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08160327173\",\"unit_price\":\"100\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17771954965568190999285241\",\"commission_details\":{\"amount\":3,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69edd9e7db6d8\",\"amount\":\"100.00\",\"transaction_date\":\"2026-04-26T09:24:56.000000Z\"}', 1, '2026-04-26 09:24:57', 1, 0, 1),
(346, '08160327173', 500, 500, 'softwareclone130@gmail.com', '08160327173', 'txn_69eddf5571664', 'plan_69eddf5571682', 'MTN Corporate Data 500 MB', '{\"error\":[\"CORPORATE Gifting Data not available on this network currently\"]}', 0, '2026-04-26 09:48:05', 1, 0, 1),
(347, '08160327173', 500, 500, 'softwareclone130@gmail.com', '08160327173', 'txn_69eddfa6ef3cd', 'plan_69eddfa6ef3e6', 'MTN Corporate Data 500 MB', '{\"error\":[\"CORPORATE Gifting Data not available on this network currently\"]}', 0, '2026-04-26 09:49:26', 1, 0, 1),
(348, '08160327173', 500, 500, 'softwareclone130@gmail.com', '08160327173', 'txn_69ede213098d6', 'plan_69ede21309900', 'MTN Corporate Data 500 MB', '{\"plan\":[\"Invalid pk \\\"99\\\" - object does not exist.\"]}', 0, '2026-04-26 09:59:47', 1, 0, 1),
(349, '08160327173', 500, 500, 'softwareclone130@gmail.com', '08160327173', 'txn_69ede2a2eba34', 'plan_69ede2a2eba50', 'MTN Corporate Data 500 MB', '{\"plan\":[\"Invalid pk \\\"99\\\" - object does not exist.\"]}', 0, '2026-04-26 10:02:10', 1, 0, 1),
(350, '08160327173', 650, 650, 'softwareclone130@gmail.com', '08160327173', '85081888', 'plan_69ee09aa531a1', '(1GB) SME 2', '{\"id\":85081888,\"ident\":\"DataSHAre236215723-51ce\",\"plan_type\":\"SME2\",\"duration\":\"30 days\",\"customer_ref\":\"\",\"network\":1,\"balance_before\":\"4131.01\",\"balance_after\":\"3521.01\",\"mobile_number\":\"08160327173\",\"plan\":417,\"Status\":\"successful\",\"api_response\":\"Y\'ello! You have gifted 1GB to 2348160327173. Share link https:\\/\\/mtnapp.page.link\\/myMTNNGApp with 2348160327173 to download the new MyMTN app for exciting offers.\",\"plan_network\":\"MTN\",\"plan_name\":\"1.0GB\",\"plan_amount\":\"610.0\",\"create_date\":\"2026-04-26T13:48:42.306329\",\"Ported_number\":true}', 1, '2026-04-26 12:48:42', 1, 0, 1),
(351, '08160327173', 500, 500, 'softwareclone130@gmail.com', '08160327173', '85083397', 'plan_69ee22bca2a38', 'MTN Corporate Data 500 MB', '{\"id\":85083397,\"ident\":\"DataSHAre5a0843945-5ac5\",\"plan_type\":\"GIFTING\",\"duration\":\"1 days\",\"customer_ref\":\"Data107bce4fba-f75\",\"network\":1,\"balance_before\":\"3521.01\",\"balance_after\":\"3031.01\",\"mobile_number\":\"08160327173\",\"plan\":362,\"Status\":\"successful\",\"api_response\":\"You have successfully gifted 500MB Weekly Plan to 2348160327173.\",\"plan_network\":\"MTN\",\"plan_name\":\"500.0MB\",\"plan_amount\":\"490.0\",\"create_date\":\"2026-04-26T15:35:40.626514\",\"Ported_number\":true}', 1, '2026-04-26 14:35:40', 1, 0, 1),
(352, '08160327173', 100, 100, 'softwareclone130@gmail.com', '08160327173', '17772173297981122006558850', 'airtime_69ee2f312a2c3', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08160327173\",\"unit_price\":\"100\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17772173297981122006558850\",\"commission_details\":{\"amount\":3,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69ee2f312a2c3\",\"amount\":\"100.00\",\"transaction_date\":\"2026-04-26T15:28:49.000000Z\"}', 1, '2026-04-26 15:28:50', 1, 0, 1),
(353, '08160327173', 150, 150, 'softwareclone130@gmail.com', '08160327173', '17772173683136895604977860', 'airtime_69ee2f57ac31c', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08160327173\",\"unit_price\":\"150\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":4.5,\"total_amount\":145.5,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"150\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17772173683136895604977860\",\"commission_details\":{\"amount\":4.5,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69ee2f57ac31c\",\"amount\":\"150.00\",\"transaction_date\":\"2026-04-26T15:29:28.000000Z\"}', 1, '2026-04-26 15:29:29', 1, 0, 1),
(354, '09135749511', 1000, 1000, 'oawel01@gmail.com', '09048991296', '', '749784239832701286', 'MTN DATA', 'Transaction failed at provider', 2, '2026-04-26 18:14:14', 1, NULL, 1),
(355, '08033067987', 1150, 1150, 'oawel01@gmail.com', '08033067987', '85089097', 'plan_69ee625edad60', '(2GB) SME  2', '{\"id\":85089097,\"ident\":\"DataSHAre101f0c61ca-c01e\",\"plan_type\":\"SME2\",\"duration\":\"30days\",\"customer_ref\":\"\",\"network\":1,\"balance_before\":\"3031.01\",\"balance_after\":\"1911.0100000000002\",\"mobile_number\":\"08033067987\",\"plan\":403,\"Status\":\"successful\",\"api_response\":\"Y\'ello! You have gifted 2GB to 2348033067987. Share link https:\\/\\/mtnapp.page.link\\/myMTNNGApp with 2348033067987 to download the new MyMTN app for exciting offers.\",\"plan_network\":\"MTN\",\"plan_name\":\"2.0GB\",\"plan_amount\":\"1120.0\",\"create_date\":\"2026-04-26T20:07:10.863664\",\"Ported_number\":true}', 1, '2026-04-26 19:07:10', 1, 0, 1),
(356, '08029662167', 50, 50, 'oawel01@gmail.com', '08029662167', '17772305353808405736558127', 'DATA_1777230534_7270', 'Airtel Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"Airtel Data\",\"unique_element\":\"08029662167\",\"unit_price\":\"50.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":1.7000000000000002,\"total_amount\":48.3,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"50.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17772305353808405736558127\",\"commission_details\":{\"amount\":1.7000000000000002,\"rate\":\"3.40\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1777230534_7270\",\"amount\":\"50.00\",\"transaction_date\":\"2026-04-26T19:08:55.000000Z\"}', 1, '2026-04-26 19:08:57', 1, 0, 1),
(357, '08160327173', 1800, 1800, 'softwareclone130@gmail.com', '08160327173', '17772748714069816990350658', 'DATA_1777274870_6303', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08160327173\",\"unit_price\":\"1800.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":54,\"total_amount\":1746,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1800.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17772748714069816990350658\",\"commission_details\":{\"amount\":54,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1777274870_6303\",\"amount\":\"1800.00\",\"transaction_date\":\"2026-04-27T07:27:51.000000Z\"}', 1, '2026-04-27 07:27:52', 1, 0, 1),
(358, '08160327173', 200, 200, 'softwareclone130@gmail.com', '08160327173', '17772749228076242758740183', 'airtime_69ef102a30021', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08160327173\",\"unit_price\":\"200\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":6,\"total_amount\":194,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"200\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17772749228076242758740183\",\"commission_details\":{\"amount\":6,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69ef102a30021\",\"amount\":\"200.00\",\"transaction_date\":\"2026-04-27T07:28:42.000000Z\"}', 1, '2026-04-27 07:28:43', 1, 0, 1),
(359, '08033067987', 750, 750, 'oawel01@gmail.com', '08033067987', '17773663207623906112805509', 'DATA_1777366320_4217', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08033067987\",\"unit_price\":\"750.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":22.5,\"total_amount\":727.5,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"750.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17773663207623906112805509\",\"commission_details\":{\"amount\":22.5,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1777366320_4217\",\"amount\":\"750.00\",\"transaction_date\":\"2026-04-28T08:52:00.000000Z\"}', 1, '2026-04-28 08:52:02', 1, 0, 1);
INSERT INTO `transactions_tbl` (`id`, `unique_element`, `amount`, `real_amount`, `email`, `phone`, `transaction_id`, `request_id`, `product_name`, `response_description`, `status`, `transaction_date`, `is_bill`, `our_commission`, `super_admin`) VALUES
(360, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '17775734691094384079671469', 'airtime_69f39e5c62301', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08033930360\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":30,\"total_amount\":970,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1000\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17775734691094384079671469\",\"commission_details\":{\"amount\":30,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69f39e5c62301\",\"amount\":\"1000.00\",\"transaction_date\":\"2026-04-30T18:24:29.000000Z\"}', 1, '2026-04-30 18:24:30', 1, 0, 1),
(361, '08033067987', 600, 600, 'oawel01@gmail.com', '08033067987', '17776199252924578895265278', 'DATA_1777619924_8327', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08033067987\",\"unit_price\":\"600.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":18,\"total_amount\":582,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"600.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17776199252924578895265278\",\"commission_details\":{\"amount\":18,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1777619924_8327\",\"amount\":\"600.00\",\"transaction_date\":\"2026-05-01T07:18:45.000000Z\"}', 1, '2026-05-01 07:18:46', 1, 0, 1),
(362, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f7a1a461f06', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 19:27:33', 1, 0, 1),
(363, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f7a1af9d2bf', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 19:27:44', 1, 0, 1),
(364, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f7a1c4ddf18', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 19:28:05', 1, 0, 1),
(365, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f7a24909d3b', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 19:30:17', 1, 0, 1),
(366, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f7a6fa06de3', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 19:50:18', 1, 0, 1),
(367, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f7a70a53ec7', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 19:50:35', 1, 0, 1),
(368, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f7a75084cb8', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 19:51:45', 1, 0, 1),
(369, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f7a790ce479', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 19:52:49', 1, 0, 1),
(370, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'DATA_1777839856_9298', 'Data Purchase', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 20:24:17', 1, 0, 1),
(371, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'DATA_1777839873_3186', 'Data Purchase', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 20:24:34', 1, 0, 1),
(372, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f7b12c51a4e', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-03 20:33:49', 1, 0, 1),
(373, '08033930360', 1000, 1000, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f907cf937b8', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-04 20:55:44', 1, 0, 1),
(374, '08033930360', 100, 100, 'intellisensehq@gmail.com', '08033930360', '17779284936216985232473165', 'airtime_69f9092cd7c64', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08033930360\",\"unit_price\":\"100\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":3,\"total_amount\":97,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"100\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17779284936216985232473165\",\"commission_details\":{\"amount\":3,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69f9092cd7c64\",\"amount\":\"100.00\",\"transaction_date\":\"2026-05-04T21:01:33.000000Z\"}', 1, '2026-05-04 21:01:34', 1, 0, 1),
(375, '08033930360', 900, 900, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f92e5c9f99d', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-04 23:40:13', 1, 0, 1),
(376, '08033930360', 500, 500, 'intellisensehq@gmail.com', '08033930360', '17779380377574272620631934', 'airtime_69f92e751eb0e', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08033930360\",\"unit_price\":\"500\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":15,\"total_amount\":485,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"500\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17779380377574272620631934\",\"commission_details\":{\"amount\":15,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69f92e751eb0e\",\"amount\":\"500.00\",\"transaction_date\":\"2026-05-04T23:40:37.000000Z\"}', 1, '2026-05-04 23:40:41', 1, 0, 1),
(377, '08033930360', 200, 200, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f92e9b79001', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-04 23:41:16', 1, 0, 1),
(378, '08033930360', 100, 100, 'intellisensehq@gmail.com', '08033930360', '', 'airtime_69f92eb6cec13', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-04 23:41:43', 1, 0, 1),
(379, '08033067987', 600, 600, 'oawel01@gmail.com', '08033067987', '17779702774145762090611467', 'DATA_1777970276_5433', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08033067987\",\"unit_price\":\"600.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":18,\"total_amount\":582,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"600.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17779702774145762090611467\",\"commission_details\":{\"amount\":18,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1777970276_5433\",\"amount\":\"600.00\",\"transaction_date\":\"2026-05-05T08:37:57.000000Z\"}', 1, '2026-05-05 08:37:58', 1, 0, 1),
(380, '08033930360', 400, 400, 'intellisensehq@gmail.com', '08033930360', '17780741064928468112410362', 'airtime_69fb41f9941f6', 'MTN Airtime', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Airtime VTU\",\"unique_element\":\"08033930360\",\"unit_price\":\"400\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":12,\"total_amount\":388,\"discount\":null,\"type\":\"Airtime Recharge\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"400\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17780741064928468112410362\",\"commission_details\":{\"amount\":12,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"airtime_69fb41f9941f6\",\"amount\":\"400.00\",\"transaction_date\":\"2026-05-06T13:28:26.000000Z\"}', 1, '2026-05-06 13:28:27', 1, 0, 1),
(381, '04176042796', 1000, 0, 'softwareclone130@gmail.com', '04176042796', '71418199091229158262', 'ELEC_1778231202_6790', 'Electricity', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"KEDCO - Kano Electric\",\"unique_element\":\"04176042796\",\"unit_price\":\"1000\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":10,\"total_amount\":990,\"discount\":null,\"type\":\"Electricity Bill\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":\"0.00\",\"amount\":\"1000\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17782312042102132220361208\",\"commission_details\":{\"amount\":10,\"rate\":\"1.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"ELEC_1778231202_6790\",\"amount\":\"1000.00\",\"transaction_date\":\"2026-05-08T09:06:43.000000Z\",\"purchased_code\":\"Token : 7141-8199-0912-2915-8262\",\"customerName\":\"Idris Ahmed\",\"customerAddress\":\"A 29 DANLADI NASIDI QTRS DANLADI NASIDI QTRS KUMBOTSO\",\"meterNumber\":\"04176042796\",\"token\":\"7141-8199-0912-2915-8262\",\"exchangeReference\":\"20260508090637554923\",\"units\":\"4.5\",\"tariff\":\"\",\"taxAmount\":0,\"vat\":0,\"debtAmount\":0,\"KCT1\":\"2548  359 2 33 05 7 042  8621\",\"KCT2\":\"3123  921 4 07 44 3 583  1379\",\"announcement\":\"\",\"paymentUsedFor\":\"\",\"energyPaymentBreakdown\":{\"amountPaid\":\"1000.00\",\"vat\":0,\"tokenValue\":null,\"debtBefore\":0,\"debtAmountPaid\":0,\"debtRemaining\":0,\"refundAmount\":0},\"Token\":\"7141-8199-0912-2915-8262\",\"PurchasedUnits\":4.5}', 1, '2026-05-08 09:06:50', 1, NULL, 1),
(382, '08160327173', 1000, 1000, 'softwareclone130@gmail.com', '08160327173', '17782815790847536489758868', 'DATA_1778281578_9555', 'MTN Data', '{\"code\":\"000\",\"content\":{\"transactions\":{\"status\":\"delivered\",\"product_name\":\"MTN Data\",\"unique_element\":\"08160327173\",\"unit_price\":\"1000.00\",\"quantity\":1,\"service_verification\":null,\"channel\":\"api\",\"commission\":30,\"total_amount\":970,\"discount\":null,\"type\":\"Data Services\",\"email\":\"oawel01@gmail.com\",\"phone\":\"09135749511\",\"name\":null,\"convinience_fee\":0,\"amount\":\"1000.00\",\"platform\":\"api\",\"method\":\"api\",\"transactionId\":\"17782815790847536489758868\",\"commission_details\":{\"amount\":30,\"rate\":\"3.00\",\"rate_type\":\"percent\",\"computation_type\":\"default\"}}},\"response_description\":\"TRANSACTION SUCCESSFUL\",\"requestId\":\"DATA_1778281578_9555\",\"amount\":\"1000.00\",\"transaction_date\":\"2026-05-08T23:06:19.000000Z\"}', 1, '2026-05-08 23:06:20', 1, 0, 1),
(383, '08160327173', 1000, 1000, 'softwareclone130@gmail.com', '08160327173', '', 'DATA_1778333073_1566', 'Data Purchase', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-09 13:24:34', 1, 0, 1),
(384, '08160327173', 1000, 1000, 'softwareclone130@gmail.com', '08160327173', '', 'DATA_1778333088_8311', 'Data Purchase', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-09 13:24:48', 1, 0, 1),
(385, '08160327173', 800, 800, 'softwareclone130@gmail.com', '08160327173', '', 'airtime_69ff35bfc44b8', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-09 13:25:20', 1, 0, 1),
(386, '08160327173', 700, 700, 'softwareclone130@gmail.com', '08160327173', '', 'airtime_69ff35cfb786c', 'MTN Airtime', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-09 13:25:36', 1, 0, 1),
(387, '08160327173', 816, 816, 'softwareclone130@gmail.com', '08160327173', '85344210', 'plan_69ff36530cc3e', '(3GB) SME  2', '{\"id\":85344210,\"ident\":\"DataSHAre3a0522f90-bc9e\",\"plan_type\":\"SME2\",\"duration\":\"30 days\",\"customer_ref\":\"\",\"network\":1,\"balance_before\":\"1911.0100000000002\",\"balance_after\":\"231.01000000000022\",\"mobile_number\":\"08160327173\",\"plan\":310,\"Status\":\"successful\",\"api_response\":\"Y\'ello! You have gifted 3GB to 2348160327173. Share link https:\\/\\/mtnapp.page.link\\/myMTNNGApp with 2348160327173 to download the new MyMTN app for exciting offers.\",\"plan_network\":\"MTN\",\"plan_name\":\"3.0GB\",\"plan_amount\":\"1680.0\",\"create_date\":\"2026-05-09T14:27:47.019647\",\"Ported_number\":true}', 1, '2026-05-09 13:27:47', 1, 0, 1),
(388, '08160327173', 1000, 1000, 'softwareclone130@gmail.com', '08160327173', '', 'DATA_1778649375_6538', 'Data Purchase', '{\"code\":\"018\",\"response_description\":\"LOW WALLET BALANCE\",\"content\":{\"errors\":\"\"}}', 0, '2026-05-13 05:16:16', 1, 0, 1),
(389, '08160327173', 816, 816, 'softwareclone130@gmail.com', '08160327173', 'txn_6a04094f1e134', 'plan_6a04094f1e14d', '(3GB) SME  2', '{\"error\":[\"You can\'t purchase this plan due to insufficient balance\"]}', 0, '2026-05-13 05:17:03', 1, 0, 1),
(390, '08160327173', 805, 805, 'softwareclone130@gmail.com', '08160327173', '87010811', 'plan_6a040ad29ad02', 'SME 2 (3GB)', '{\"id\":87010811,\"network\":1,\"ident\":\"DATA102df0346c-\",\"balance_before\":\"2145.0\",\"balance_after\":\"895.0\",\"mobile_number\":\"08160327173\",\"plan\":268,\"Status\":\"successful\",\"plan_network\":\"MTN\",\"plan_name\":\"3.0GB\",\"plan_amount\":\"1250.0\",\"create_date\":\"2026-05-13T06:23:30.592870\",\"Ported_number\":true,\"api_response\":\"Y\'ello! You have gifted 3GB to 2348160327173. Share link https:\\/\\/mtnapp.page.link\\/myMTNNGApp with 2348160327173 to download the new MyMTN app for exciting offers.\"}', 1, '2026-05-13 05:23:30', 1, 0, 1),
(391, '08160327173', 270, 270, 'softwareclone130@gmail.com', '08160327173', 'txn_6a0580007f451', 'plan_6a0580007f46c', 'MTN SME 500MB', '{\"detail\":\"Invalid token.\"}', 0, '2026-05-14 07:55:44', 1, 0, 1),
(392, '08160327173', 270, 270, 'softwareclone130@gmail.com', '08160327173', 'txn_6a05800af34c1', 'plan_6a05800af34cd', 'MTN SME 500MB', '{\"detail\":\"Invalid token.\"}', 0, '2026-05-14 07:55:54', 1, 0, 1),
(393, '07075157228', 51, 51, 'rolandgoodness707@gmail.com', '09160536714', NULL, '573953795827642837', 'MTN', NULL, 0, '2026-05-15 03:42:54', 1, NULL, 1),
(394, '07073365295', 51, 51, 'rolandgoodness707@gmail.com', '09160536714', NULL, '269746048185541069', 'MTN', NULL, 0, '2026-05-15 03:42:54', 1, NULL, 1),
(395, '07073365295', 98, 98, 'rolandgoodness707@gmail.com', '09160536714', NULL, '910207483538529131', 'MTN', NULL, 0, '2026-05-15 03:45:58', 1, NULL, 1),
(396, '07075157228', 97, 97, 'rolandgoodness707@gmail.com', '09160536714', '', '424723395696747632', 'MTN', 'Insuficient Balance', 0, '2026-05-15 03:45:58', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trans_status_tbl`
--

CREATE TABLE `trans_status_tbl` (
  `id` int(11) NOT NULL,
  `respose` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `url_link_tbl`
--

CREATE TABLE `url_link_tbl` (
  `id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `link_name` varchar(255) NOT NULL,
  `has_sub` int(11) NOT NULL,
  `url_role` int(11) NOT NULL,
  `link_icon` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `url_link_tbl`
--

INSERT INTO `url_link_tbl` (`id`, `link`, `link_name`, `has_sub`, `url_role`, `link_icon`, `status`) VALUES
(1, '', 'Manage Url Link', 1, 1, 'ti-email', 0),
(2, 'our-products', 'Help Centre', 0, 3, 'ti-email', 0),
(7, '', 'My Wallet', 1, 3, 'ti-wallet', 1),
(12, '', 'My Report', 1, 1, 'ti-email', 0),
(14, '.', 'Manage Users', 1, 1, 'ti-email', 1),
(15, 'cac-registrations', 'CAC Registrations', 1, 1, 'ti-bag', 1),
(16, 'cac-registration', 'CAC Registration', 1, 3, 'ti-bag', 1),
(17, 'site-setting', 'Linkify', 1, 1, 'ti-email', 1),
(18, 'mobile-topup', 'Buy Data', 1, 3, 'ti-mobile', 1),
(19, '', 'Manage FAQ', 1, 1, '', 0),
(20, '', 'Pay TV Subscription', 1, 3, 'flaticon-381-news', 1),
(21, '', 'Pay Electricity Bill', 1, 3, 'ti-light-bulb', 1),
(22, '', 'Exam PINS', 1, 3, 'flaticon-381-notebook-2', 1),
(23, 'my-payment-history', 'Transactions', 1, 3, 'ti-bar-chart-alt', 1),
(24, 'quick-pay-bill', 'Quick Payment', 0, 3, 'flaticon-381-price-tag', 1),
(25, '', 'Booking', 1, 3, 'flaticon-381-exit-1', 0),
(26, '', 'Cash-Out', 1, 3, 'ti-credit-card', 1),
(27, '', 'Developer API', 1, 3, 'flaticon-381-settings-4', 0),
(28, '', 'Send Notification', 1, 1, 'flaticon-381-settings-4', 1),
(29, 'view-daily-trans', 'View Daily Trans.', 0, 1, 'flaticon-381-settings-4', 1),
(30, 'verifications', 'Verification', 0, 3, 'ti-shield', 1),
(31, 'manage-verifications', 'Manage Verification', 1, 1, 'ti-shield', 1),
(32, 'bulk-sms', 'Bulk SMS', 0, 3, 'ti-wallet', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `id` int(11) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `oname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `means_of_id` int(11) DEFAULT NULL,
  `means_of_id_type` varchar(20) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `acc_no` varchar(100) NOT NULL,
  `acc_name` varchar(100) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `acc_no2` varchar(100) NOT NULL,
  `acc_name2` varchar(100) NOT NULL,
  `bank_name2` varchar(100) NOT NULL,
  `school` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `admin_role` varchar(11) NOT NULL DEFAULT '3',
  `super_admin` int(11) NOT NULL DEFAULT 1,
  `token` varchar(255) DEFAULT NULL,
  `expired_token` int(11) NOT NULL,
  `referal_token` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `date_join` timestamp NOT NULL DEFAULT current_timestamp(),
  `monnify_account_details` text NOT NULL,
  `bvn` varchar(30) DEFAULT NULL,
  `nin` varchar(30) DEFAULT NULL,
  `finger` varchar(100) NOT NULL DEFAULT 'false',
  `reset_token` varchar(200) NOT NULL,
  `reset_expiry` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`id`, `sname`, `oname`, `password`, `pin`, `email`, `means_of_id`, `means_of_id_type`, `phone`, `acc_no`, `acc_name`, `bank_name`, `acc_no2`, `acc_name2`, `bank_name2`, `school`, `address`, `state`, `town`, `admin_role`, `super_admin`, `token`, `expired_token`, `referal_token`, `status`, `date_join`, `monnify_account_details`, `bvn`, `nin`, `finger`, `reset_token`, `reset_expiry`) VALUES
(436, 'Joseph', 'Omamode', '$2y$10$giq1cj8s0wBSDrDWUnx1LO5FB0GeHrzU8QC6VEHY0u7Bi1h1M39sa', '3b9be7e15b46c42911f39a4a9e861022', 'omamode.joseph@gmail.com', NULL, NULL, '09060943924', '', '', '', '', '', '', '', '', 'Delta', '', '3', 1, '$2y$12$cFNZkuJAtILd2TqfOMUO/OC66qw9G90m8ctrSLMvSOK08Ql2TtZb2', 0, 'd24a8d1a5ea3cc78df46cf12644b7923', 1, '2025-08-12 02:36:37', '', NULL, NULL, 'false', '', ''),
(437, 'Muhammad', 'Mahmud', '$2y$10$yraNGGRJF5K.JM09maGOlOclTnsbQS2B331M5Y6AE8IrECRQsbAB6', '17b3c7061788dbe82de5abe9f6fe22b3', 'softwareclone11@gmail.com', NULL, NULL, '08160327173', '6629401726', 'Rahausub-Muh(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$kKy0bme3raTU0z1p19sIA.lYhVL.bJ6SzZbFEAxJTfzP2GpCcPpPe', 0, 'ebd4e1b82248de7645e5d78ab8aa14e5', 1, '2025-08-13 09:53:22', '', NULL, NULL, 'false', '', ''),
(438, 'Rahama', 'Habib shehu', '$2y$10$2c5F2FGaXj.IfRv4m2oJ9u9EzrhGlpCM3bV9OzvHriXECSDQPmnRO', '65d2ea03425887a717c435081cfc5dbb', 'oawel01@gmail.com', NULL, NULL, '09048991296', '6647907221', 'Rahausub-Rah(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$yD./oxf8yD6MwCzenr1kIei5JVekSeyHvr37zn0wwasj1KW9fy1fy', 0, '30ea84190fd0b1c60f7db59594ec2956', 1, '2025-08-13 13:16:01', '', NULL, NULL, 'false', '', ''),
(439, 'Mahmud', 'Muhammad', '$2y$12$N7KJVHGVUjXwuTrghMRpBOLxF/W/eZeCO/ZfhUuVC8CsuWKFueXm6', '17b3c7061788dbe82de5abe9f6fe22b3', 'softwareclone100@gmail.com', NULL, NULL, '08160327173', '6683940358', 'Rahausub-Mah(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '1,2,3', 1, NULL, 0, 'e616a466e3267cb7996eebbc1f56ce30', 1, '2025-08-14 12:22:50', '', NULL, NULL, 'false', '', ''),
(440, 'Ajayi', 'Olaoluwa', '$2y$12$dII1O.T9MBHuCObccMNgk.kInsdkPIIA3JEhi/gbKLzX.4j/Pfi56', '45226bae7da31547fbdca1c62d24a8dd', 'Ajayiolaoluwa2014@gmail.com', NULL, NULL, '08160140638', '6637618878', 'Rahausub-Aja(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Lagos, Nigeria.', '', '3', 1, '$2y$12$z.c5q9Xj9TmVAjJz1yd/ie0Q4D.41NCTgu8jnA5.tlIrOm4NTPtQG', 0, 'd6ee1c48c23b36b8fc728c8292f1ca1f', 1, '2025-08-16 07:09:45', '', NULL, NULL, '1', '', ''),
(441, 'Engr', 'Lee', '$2y$12$ewYmvT.f.78T/YUBgk2JeeqV0lmrp639G9r5.MbECg72Eas8CAQyu', 'dc513ea4fbdaa7a14786ffdebc4ef64e', 'engrleeceo@gmail.com', NULL, NULL, '07085373232', '', '', '', '', '', '', '', '', 'Oyo', '', '3', 1, NULL, 0, '6ea197063ebd554ae19bc13d8c1ec9df', 1, '2025-09-04 13:02:49', '', NULL, NULL, 'false', '', ''),
(442, 'ahmad', 'ahmad', '$2y$12$jo7UqJjGynRTCFMdzZIXBOSbwZTlQKAvUHschHUTHcCMHR7YaweVa', '17b3c7061788dbe82de5abe9f6fe22b3', 'softwareclone8@gmail.com', NULL, NULL, '08160327173', '', '', '', '', '', '', '', '', 'kano', '', '3', 1, NULL, 0, 'f4cebc67c9076c275c8e98bdec76ff08', 1, '2025-10-13 11:26:13', '', NULL, NULL, 'false', '', ''),
(443, 'Sabo', 'Auwal', '$2y$12$i2t2wmADc0m6ySndIQenGuzbVZ.yAd9NKKS7WpBv0Pi8dicPvo4Hy', '65d2ea03425887a717c435081cfc5dbb', 'rahautextiles@gmail.com', NULL, NULL, '09048991296', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, NULL, 0, '591082a3d8c84cf19043e55b450a2622', 1, '2025-10-13 11:52:51', '', NULL, NULL, 'false', '', ''),
(444, 'Habib', 'Rahama', '$2y$12$D9RvFZtCtPjFfttvcKjJOegm3EKG6HxkktjXkZRA.06DU5YvQfw3C', 'd93591bdf7860e1e4ee2fca799911215', 'rahmahhabib083@gmail.com', NULL, NULL, '07043217934', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, NULL, 0, 'c4709679df5ed1c11a129bcc4bd77dcd', 1, '2025-10-13 16:11:03', '', NULL, NULL, 'false', '', ''),
(445, 'Musa', 'Autag', '$2y$12$Vlkpi.C1Y68ca4ODDZEhROYmNf6FVCIGeGgyhuIBOKmUPCuaQZDHu', '81dc9bdb52d04dc20036dbd8313ed055', 'musasaidu090@gmail.com', NULL, NULL, '07068422095', '', '', '', '', '', '', '', '', 'Borno', '', '3', 1, NULL, 0, 'c4152728b7753a0e0986d80e9d92ad34', 1, '2025-10-20 11:38:29', '', NULL, NULL, 'false', '', ''),
(446, 'Joseph', 'Omamode', '$2y$12$z1eYJ2oYHj7gKMO1M1ptu.vWtIPg6Jf15E5TNj7aBd1GXXaVwPS0G', '3b9be7e15b46c42911f39a4a9e861022', 'josephisomamode@gmail.com', NULL, NULL, '08121193434', '', '', '', '', '', '', '', '', 'Delta', '', '3', 1, NULL, 0, 'd4927e4a9a46265fe98b840a6a44928e', 1, '2025-11-04 19:36:57', '', NULL, NULL, 'false', '', ''),
(447, 'Mustapha', 'Yusuf', '$2y$12$D9AXVQcWESn9ZF9jUwGSgehNRCGpZ7t3LiwNioksXi6ubGLWE8as2', '934b535800b1cba8f96a5d72f72f1611', 'annaleona00@gmail.com', NULL, NULL, '09035741544', '', '', '', '', '', '', '', '', 'Lagos', '', '3', 1, NULL, 0, '151d2ecb5b869b9f6a6b7fb4f0a8ed7e', 1, '2025-11-05 02:19:17', '', NULL, NULL, 'false', '', ''),
(448, 'Zahradden', 'Dahiru', '$2y$12$CiXcrK.Xpx.LyJOgAVrFxuJmFpdkEkylC60FwyvrYhC2kXbFB/rIG', '934b535800b1cba8f96a5d72f72f1611', 'jonnywood158@gmail.com', NULL, NULL, '09035741540', '', '', '', '', '', '', '', '', 'Lagos', '', '3', 1, NULL, 0, '9216113ea3c77fdfc7b2a0ddd4ea661b', 1, '2025-11-05 02:26:15', '', NULL, NULL, 'false', '', ''),
(449, 'Sabo', 'Auwal', '$2y$12$Xf2TRiaXgJy8wXcweU7/qepN.zRI4AP06inmlr14FUlnsbhJTkmtu', '65d2ea03425887a717c435081cfc5dbb', 'oawel01@icloud.com', NULL, NULL, '09048991296', '', '', '', '', '', '', '', '', 'Kano', '', '1,2,3', 1, NULL, 0, 'd24d409abe17ffb73655e230575b1480', 1, '2025-11-05 19:32:59', '', NULL, NULL, 'false', '', ''),
(450, 'Umar', 'Abubakar', '$2y$12$8oeEhB/vGGybmEh5usXmBuV26PbH1r4fhi98YdFQNKrcSo7sNRJIi', 'c5b2cebf15b205503560c4e8e6d1ea78', 'abubakarumarsumaila24@gmail.com', NULL, NULL, '09133238329', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, NULL, 0, 'e09985dd9c76f24883a62d13583889ae', 1, '2025-11-06 19:06:00', '', NULL, NULL, 'false', '', ''),
(451, 'Yalow111', 'Yakuba', '$2y$12$QLtYf/sXiTnn6HeqLAAAr.XFvYMrcSy6sZWNQZ4ldF5jUKj846nf6', '17b3c7061788dbe82de5abe9f6fe22b3', 'yahayayakubakatsina@gmail.com', NULL, NULL, '09112485792', '', '', '', '', '', '', '', '', 'Katsina', '', '3', 1, NULL, 0, '9122f827638f00eef789dde7a6fa4134', 1, '2025-11-08 20:56:24', '', NULL, NULL, 'false', '', ''),
(452, 'Abdulwadud', 'Baba isah', '$2y$12$YdAJdnmmrp4iTePrci54uuw5FbXKv22tPrYs0upYc95kRGONThkqW', '95f2b84de5660ddf45c8a34933a2e66f', 'babaisahabdulwadud@gmail.com', NULL, NULL, '09047159732', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, NULL, 0, '2e380670727131bab485739e8ce0147f', 1, '2025-11-09 14:08:11', '', NULL, NULL, 'false', '', ''),
(453, 'Muhammad  Bello', 'Hauwa', '$2y$12$6hiM9qGRs9zWpqhEGMm/ae1j.2WcHcDgWZkfBbSkZTPsRLe0.DIgu', '1e48c4420b7073bc11916c6c1de226bb', 'jiddahbello12@gmail.com', NULL, NULL, '08147120008', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, NULL, 0, '982ee60aca647f6b279af83568a07208', 1, '2025-11-10 05:52:28', '', NULL, NULL, 'false', '', ''),
(454, 'Abubakar A', 'Aminu', '$2y$12$XvlldskCpvxn4HAt6gdYr.1DYqq272Pqslzg9a4VSmqXXUpVvBNba', 'a32d7eeaae19821fd9ce317f3ce952a7', 'abubakaraishaq503@gmail.com', NULL, NULL, '08022382321', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, NULL, 0, 'dd9dd9f3c602e591bf46b92a9db54a85', 1, '2025-11-10 11:19:04', '', NULL, NULL, 'false', '', ''),
(455, 'Fnfnfnf', 'Hdhd dndnn', '$2y$12$XqyFabTV5Kwgr.Unj6pUjO511iG05T/4nXku7R438Gm6p5wBuScGi', '81dc9bdb52d04dc20036dbd8313ed055', 'prosperjasper002@gmail.com', NULL, NULL, '08088888888', '', '', '', '', '', '', '', '', 'Edo', '', '3', 1, NULL, 0, '11411ce0d53e738bb449335c81415df7', 1, '2025-11-17 05:07:22', '', NULL, NULL, 'false', '', ''),
(456, 'Bitrus', 'Kyenji', '$2y$12$onCImAFz3SrwqvIOckgtdueJ0Zvcu/CqXuJA.r5rFtn.TNWHSpUgy', '20b5e1cf8694af7a3c1ba4a87f073021', 'sekyenretbi@gmail.com', NULL, NULL, '08056979855', '', '', '', '', '', '', '', '', 'Plateau', '', '3', 1, NULL, 0, '39b9669d3309bfba0289743bfe086771', 1, '2025-12-19 01:38:59', '', NULL, NULL, 'false', '', ''),
(457, 'Pellar02', 'Gambari Abdurrasheed', '$2y$12$tOqkEfUg5eIT3am3G/GEUuf08zV.zfItSebjcg..w67jZSNylGXry', '934b535800b1cba8f96a5d72f72f1611', 'balaabu033@gmail.com', NULL, NULL, '08036936936', '6623800870', 'Rahausub-Pel(Paymentpoint)', 'Palmpay', '', '', '', '', '', '08032323232', '', '3', 1, NULL, 0, '4bf92230bd3e131a0431bce650e89447', 1, '2025-12-23 20:53:30', '', NULL, NULL, 'false', '', ''),
(458, 'Balance03', 'Gambari Abdurrasheed', '$2y$12$akZc6HAjqydrmtZcYYisAuy2A48DfSpoiZMHSHRjV3rVjOM8kBeaO', '934b535800b1cba8f96a5d72f72f1611', 'rolandgoodness707@gmail.com', NULL, NULL, '09160536714', '', '', '', '', '', '', '', '', 'BAUCHI', '', '3', 1, NULL, 0, 'f11b46ecac54380ab032a6a92939fe28', 1, '2025-12-24 10:36:58', '', NULL, NULL, 'false', '', ''),
(459, 'Mide', 'Alu', '$2y$12$U.YqiDYE6F/1LYZ7X0U7u.GisnO/IFuOLziYaEM.OXwqW6o.J86C6', '934b535800b1cba8f96a5d72f72f1611', 'hindatup@gmail.com', NULL, NULL, '09037201417', '', '', '', '', '', '', '', '', 'KATSINA', '', '3', 1, NULL, 0, 'b30f204e0f0c5ae312776749a7559b4d', 1, '2025-12-24 11:03:02', '', NULL, NULL, 'false', '', ''),
(483, 'Abdulazeez', 'ABZ', '$2y$12$aFTHz9LjkD6sNkgFHvahheS2V8CSe8UY3VOAjLc8t3bt7l4Uhhkaa', '81dc9bdb52d04dc20036dbd8313ed055', 'abdulazeezbellomhd@gmail.com', NULL, NULL, '08108184500', '6610111711', 'Rahausub-Abd(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Gombe', '', '3', 1, '$2y$12$4DJcITJeUkhOckO9DKTK/O4xY6a3esN3Ylm9R5l4yM.NmUz1C4APa', 0, NULL, 1, '2026-03-30 10:41:04', '', NULL, NULL, '1', '0ec099780ad01ac359cd4bdfe33b9835', '2026-04-22 18:01:40'),
(484, 'abdul', 'abz', '$2y$12$bSbCWilmQx7rYNh97U6/kOsMncI5gT1Sy9El/5wraDZf3ci9YRZu.', '81dc9bdb52d04dc20036dbd8313ed055', 'abdul@gmail.com', NULL, NULL, '07019588264', '6687856381', 'Rahausub-abd(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'gombe', '', '3', 1, NULL, 0, 'ec74f28cfdaa7fd2845848b99a900a3e', 1, '2026-03-31 19:34:50', '', NULL, NULL, 'false', '', ''),
(485, 'Mahmud', 'Muhammad', '$2y$12$1pD7MmxQ7zOIkQRSIHuZ0OuPvqNEsi2IE6vMUY9qWcTZBTIepi3SW', '17b3c7061788dbe82de5abe9f6fe22b3', 'mahmudmuhammad.mm@gmail.com', NULL, NULL, '08160327171', '6625395537', 'Rahausub-Mah(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$1zQaE.4DyrwKW6f2Vx/l4e/AGqmybHhfhTNIRMnNARsMgrrCAVyzi', 0, NULL, 1, '2026-04-01 06:12:31', '', NULL, NULL, 'false', '', ''),
(486, 'Ahmad', 'Ahmad', '$2y$12$qY9DJ.T/WVnCJp9is.Zz0.o8eb/zk2kkle/mCqvy.N6v4YRVVV/m2', '8cd7775f9129da8b5bf787a063d8426e', 'ahmadabdallah430@gmail.com', NULL, NULL, '09168851564', '6641019732', 'Rahausub-Ahm(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$jsw79Ym6EbRaNnFAXGMB4ucSs0PmugP/UJchW4.qmYvKmkI/.HJKq', 0, NULL, 1, '2026-04-06 06:28:13', '', NULL, NULL, '1', '', ''),
(487, 'Yusuf', 'Suleiman', '$2y$12$ZxQWT6mN1I2xp1MOI1Nk/.ZTeiXDN5m1GI3H7FGw/kz0/zrtUfIki', '71887f62f073a78511cbac56f8cab53f', 'yushas80@gmail.com', NULL, NULL, '09167959871', '6648874435', 'Rahausub-Yus(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$/5BjQfHrzbd61pyaLUXjtePmCH6WpfEWH.MgOSb8Uu1ogY/ubMAlK', 0, NULL, 1, '2026-04-06 06:30:49', '', NULL, NULL, 'false', '', ''),
(488, 'Moses', 'yunana', '$2y$12$3F/s4CyuneF2gFsj3Cv.hOwnbbbZhDrB0vNK3nALsk7INosSdDDsS', '008bd5ad93b754d500338c253d9c1770', 'mymshelia51@gmail.com', NULL, NULL, '08147924029', '6658978497', 'Rahausub-Mos(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$MMVAy9HFIKhStnlQgX7ox.2NyN6t2YlOkzfB8CshgEzDUx6NkZE2W', 0, NULL, 1, '2026-04-07 12:13:11', '', NULL, NULL, 'false', '', ''),
(489, 'Jehu', '', '$2y$12$hmwCUGr8N87rvUIs.ger4eEBZ.VrELJlC0n4tocBgRzT14dUfA75O', NULL, 'Jehusunday82@gmail.com', NULL, NULL, '09114149986', '', '', '', '', '', '', '', '', 'Akwa Ibom', '', '3', 1, NULL, 0, NULL, 1, '2026-04-14 23:22:48', '', NULL, NULL, 'false', '', ''),
(490, 'Jehu', 'Sunday', '$2y$12$s5pzv.SvnGLqhtaRNS.QKOFd1skvZVvXhdtf53ovP2aTa2Zg/sVN6', NULL, 'Allwildallwild@gmail.com', NULL, NULL, '09020696474', '', '', '', '', '', '', '', '', 'Akwa Ibom', '', '3', 1, NULL, 0, NULL, 1, '2026-04-14 23:25:31', '', NULL, NULL, 'false', '', ''),
(491, 'Abz', 'new', '$2y$12$BT08UX2yGUygWiG7upvN..6VqORpk7iEsAFrQ1LQQ6VwfPOU5YH72', '81dc9bdb52d04dc20036dbd8313ed055', 'abz@gmail.com', NULL, NULL, '08108184506', '6610111711', 'Rahausub-Abd(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Gombe', '', '3', 1, '$2y$12$hE9CU.hEnoFlZfhbhQurDuOAZK/vyghPYGIVg8PuUL8elkPgdW.Ae', 0, NULL, 1, '2026-04-22 22:27:30', '', NULL, NULL, '1', '', ''),
(492, 'Mahmud', 'Muhammad', '$2y$12$s/KDh1nkjdjYHF6g3781weD.Y.UMXT9FUlfiJjJSW22m4yaM.4dhm', '17b3c7061788dbe82de5abe9f6fe22b3', 'softwareclone130@gmail.com', NULL, NULL, '08160327170', '6680144460', 'Rahausub-Mah(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$p2A6DDjmNzgK0MyXisqvxuAcRTGPLX7y2jR8eILMVIpw9UG515kiK', 0, NULL, 1, '2026-04-22 23:21:42', '', NULL, NULL, '1', '', ''),
(493, 'Haruna', '', '$2y$12$TAxDkZBPr87D8qHJJeHfiOJ1/eFjZRk/GiihL3K7H6FlLiDxJLYmG', '3792bfd72c8a9071ac790a4b3b60d15a', 'harunamati2@gmail.com', NULL, NULL, '08021444470', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$JR/lWL3ck5RvxzFf/xis/OLdiInLKj3U7uKbNrdiajvgtGYf1V3Ja', 0, NULL, 1, '2026-04-23 06:52:52', '', NULL, NULL, '1', '', ''),
(494, 'Usman', 'Yusuf', '$2y$12$wS5i54Igxepa0h2ywnzfwunYZkwjZxj2pV1tmXOaw5ySoVhBkVFVW', NULL, 'Hotoro dan marke', NULL, NULL, '08033930360', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, NULL, 0, NULL, 1, '2026-04-23 14:33:19', '', NULL, NULL, 'false', '', ''),
(495, 'Muhammad', 'nazir', '$2y$12$DVwzz.I3xPaR4QlCZyFtn.SNpiZ6yIESFLElsY6PxuWs1R1ymkAmq', 'c5b2cebf15b205503560c4e8e6d1ea78', 'Nazeerelias05@gmail.com', NULL, NULL, '08067841493', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$PZAeDR1e08TCkT0w7nYgAuM9ZRXgo3bn7jnXkwAOXTDZXgp1otuPi', 0, NULL, 1, '2026-04-23 16:30:12', '', NULL, NULL, 'false', '', ''),
(496, 'Usman', 'Murtala', '$2y$12$8PlSxR6r5UKmaUXUmwWglOz2g/6JESN0S.mstnmT11W02mMUB.zva', '7b7a53e239400a13bd6be6c91c4f6c4e', 'usmanmurtalausman44@gmail.com', NULL, NULL, '08066739050', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$8ux9fUlM6teV1WjrQ2xotuJnVqdt6OyXGUzmCIYU4TTjMV209kRky', 0, NULL, 1, '2026-04-23 16:33:50', '', NULL, NULL, 'false', '', ''),
(497, 'Yakubu', 'Shafiu', '$2y$12$ETiZhM/mkRUJlruhV60mve4bOZijLh3Eeyz2bfS0fqGq3AwgHtHOO', '0b6ace9e8971cf36f1782aa982a708db', 'yakubushafiu07@gmail.com', NULL, NULL, '08139738018', '6675218086', 'Rahausub-Yak(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$9YkY0WCfE29Ah3HqW.d4QePFIQ5QYxu053w4nCN5eBjzUxD07y1ge', 0, NULL, 1, '2026-04-24 06:18:34', '', NULL, NULL, 'false', '', ''),
(498, 'Ibrahim', 'Muhammad', '$2y$12$U2zgYJe2gCEjGiUsQzk9i.wkUf7YG05oqQKnGqgDeyGtsXsAjZ/Ie', 'c4c455df3c54f292ae22f6791fd2553e', 'ibrahimmuhd6010@gmail.com', NULL, NULL, '08060102229', '6688044430', 'Rahausub-Ibr(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$Ubwoj1RD3.fz3Qnct6jBCOQl9sJ9gunhmIDYmPMKJamzH2up/lWaG', 0, NULL, 1, '2026-04-24 08:50:41', '', NULL, NULL, 'false', '', ''),
(499, 'Abubakar', 'Aminu', '$2y$12$CKIwKGG.yzgQJNcJ/xFCxuZ2G/g8MMAJZbK960jr6sv4KAoaSUeJK', '96055f5b06bf9381ac43879351642cf5', 'alhaji_00@hotmail.com', NULL, NULL, '08035502007', '', '', '', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$TV8P5uguc2YCPPfrkvq6nu.OIZHPEbN8n4DNbpE1PbF6vo5XTVFC.', 0, NULL, 1, '2026-04-24 10:42:57', '', NULL, NULL, 'false', '', ''),
(500, 'Mahmud', '', '$2y$12$Mct/up2Oi3nGDEnLhivz6Oh/nyQ6P9JhrY9RE1KDvJvvzCNF9FwDu', '7f16109f1619fd7a733daf5a84c708c1', 'Mahmudmansurgaladanchi@gmail.com', NULL, NULL, '09039708822', '6690052136', 'Rahausub-Mah(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$hN7fW9qBKyf5SVi1JW5OvOwCixB5h.WL897DZMK6T7vkmTiPGFPuu', 0, NULL, 1, '2026-04-25 10:17:32', '', NULL, NULL, 'false', '', ''),
(501, 'vmrihp', '', '$2y$12$4pl4pIYrRvxcekFGr2orvuWB/PHd0sgbmuCiAuV05qGuCxmJKNVNG', NULL, 'crawlerrobo@gmail.com', NULL, NULL, '96537', '', '', '', '', '', '', '', '', 'Katsina', '', '3', 1, NULL, 0, NULL, 1, '2026-04-25 11:47:20', '', NULL, NULL, 'false', '', ''),
(502, 'Yusuf', 'shuaibu', '$2y$12$U0mEj5nyETKoQmfg4u3kFO9TXvtaldLySXrgNy3AQ4nE3tHox3/L2', 'c2ba1bc54b239208cb37b901c0d3b363', 'elyusifscomultimate@gmail.com', NULL, NULL, '09032320328', '6647751966', 'Rahausub-Yus(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$JWWI5ofBCUJDM/j1pGVYV.x4ycJrOrLjQr8Y8IIa2DT6DDTdYofWm', 0, NULL, 1, '2026-04-27 18:00:29', '', NULL, NULL, 'false', '', ''),
(503, 'Buyer02', 'Abass luke', '$2y$12$LAImqi/07vwzdT2RfwJ1Zezjw5ywewb3ye5A6UA/yMmhnHyMpnwJG', '934b535800b1cba8f96a5d72f72f1611', 'nura001y@gmail.com', NULL, NULL, '08036925814', '6672320568', 'Rahausub-Buy(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Lagos', '', '3', 1, NULL, 0, '6e9f8815ff7b0bcf1d1e0d5fd4c90c72', 1, '2026-04-29 14:19:25', '', NULL, NULL, 'false', '', ''),
(504, 'Usman', 'Yusuf', '$2y$12$G.a7l.pJ2pRwBfpYkWxU0uGGziatKWg.RGJrWD6S8naiQt/mO2u8m', '17b3c7061788dbe82de5abe9f6fe22b3', 'intellisensehq@gmail.com', NULL, NULL, '08168630631', '6644029684', 'Rahausub-Usm(Paymentpoint)', 'Palmpay', '', '', '', '', '', 'Kano', '', '3', 1, '$2y$12$8vQftnWGvIYDUVTAaVZabOLiAKDgeMLs511bLKTEbLKrRw/9hTbVO', 0, NULL, 1, '2026-04-30 18:17:47', '', NULL, NULL, '1', '', ''),
(505, 'sttecu', 'asdasd', '$2y$12$wTmmKJ.Uz9TexjvfUwLcmep0Hy6xa630W/XVz4/2n/UtkK3yMYTZe', 'c6bff625bdb0393992c9d4db0c6bbe45', 'sprinces407@gmail.com', NULL, NULL, '03335353333', '', '', '', '', '', '', '', '', 'Jawa Barat', '', '3', 1, NULL, 0, '6c8e2f87a4e5415c2cb7b0492905795f', 1, '2026-05-16 17:13:10', '', NULL, NULL, 'false', '', ''),
(506, 'Kingsley', 'Amoke', '$2y$12$AKK6Thkda3VMqaK3hyZRjuDUyBy.NuHki9/36K77ZbfMsF9DhvpfK', NULL, 'bravotecharena@gmail.com', NULL, NULL, '08105311007', '', '', '', '', '', '', '', '', 'Abia', '', '3', 1, '$2y$12$6AyZLkyiC6JqFt9VSjwyheq5yX1Kn1tbeEb2jBXMu2pb6HptU3GsK', 0, NULL, 1, '2026-05-17 08:09:15', '', NULL, NULL, 'false', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('success','failed') NOT NULL DEFAULT 'success',
  `search_query` varchar(150) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `date_of_birth` varchar(100) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `photo` longtext NOT NULL,
  `owner_email` varchar(200) DEFAULT NULL,
  `enrollment_bank` varchar(100) DEFAULT NULL,
  `enrollment_branch` varchar(100) DEFAULT NULL,
  `registration_date` varchar(100) DEFAULT NULL,
  `residential_address` varchar(255) DEFAULT NULL,
  `nin` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_history_tbl`
--

CREATE TABLE `wallet_history_tbl` (
  `id` int(11) NOT NULL,
  `trans_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `trans_amount` int(11) NOT NULL,
  `available_balance` int(11) NOT NULL,
  `wallet_status` varchar(255) NOT NULL,
  `trans_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `super_admin` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_history_tbl`
--

INSERT INTO `wallet_history_tbl` (`id`, `trans_id`, `email`, `trans_amount`, `available_balance`, `wallet_status`, `trans_date`, `super_admin`, `status`) VALUES
(109, '646233029894179061', 'softwareclone11@gmail.com', 200, 0, 'credit', '2025-08-13 09:55:47', 1, 0),
(110, '516840868741454853', 'softwareclone11@gmail.com', 70, 0, 'credit', '2025-08-13 10:00:22', 1, 0),
(111, '477864879769362692', 'softwareclone11@gmail.com', 100, 100, 'credit', '2025-08-13 10:01:39', 1, 1),
(112, '748554179596321665', 'softwareclone11@gmail.com', 100, 0, 'debit', '2025-08-13 10:08:37', 1, 0),
(113, '706186246414863867', 'softwareclone11@gmail.com', 100, 100, 'credit', '2025-08-13 10:50:58', 1, 1),
(114, '798796083620717245', 'softwareclone11@gmail.com', 100, 0, 'debit', '2025-08-13 10:54:18', 1, 0),
(115, '112419276603479017', 'oawel01@gmail.com', 500, 500, 'credit', '2025-08-13 13:16:19', 1, 1),
(116, '173677372899237952', 'softwareclone11@gmail.com', 265, 500, 'Refund', '2025-08-14 05:28:05', 1, 1),
(117, '358523453846480766', 'softwareclone11@gmail.com', 100, 400, 'debit', '2025-08-14 05:32:38', 1, 0),
(118, '291665576472413209', 'softwareclone11@gmail.com', 265, 400, 'Refund', '2025-08-14 08:15:14', 1, 1),
(119, '139761921489037847', 'softwareclone11@gmail.com', 265, 400, 'Refund', '2025-08-14 08:33:08', 1, 1),
(120, '637496243949724105', 'softwareclone11@gmail.com', 50, 350, 'debit', '2025-08-14 11:29:37', 1, 0),
(121, '877489194912485448', 'softwareclone11@gmail.com', 50, 300, 'debit', '2025-08-14 11:30:23', 1, 0),
(122, '537412626544289470', 'softwareclone11@gmail.com', 265, 300, 'Refund', '2025-08-14 11:32:51', 1, 1),
(123, '205997251181302213', 'softwareclone11@gmail.com', 265, 300, 'Refund', '2025-08-14 11:37:29', 1, 1),
(124, '919306547986414937', 'softwareclone11@gmail.com', 100, 200, 'debit', '2025-08-14 11:39:51', 1, 0),
(125, '533930489529164501', 'softwareclone11@gmail.com', 100, 100, 'debit', '2025-08-14 11:56:43', 1, 0),
(126, '298495253149787051', 'softwareclone11@gmail.com', 50, 50, 'debit', '2025-08-14 12:02:11', 1, 0),
(127, '529727162601123295', 'softwareclone11@gmail.com', 100, 900, 'debit', '2025-08-14 12:16:36', 1, 0),
(128, '551740445471326221', 'softwareclone11@gmail.com', 100, 800, 'debit', '2025-08-14 12:19:42', 1, 0),
(129, '361648741992976947', 'softwareclone100@gmail.com', 100, 900, 'debit', '2025-08-14 12:25:22', 1, 0),
(130, '182525768811886778', 'softwareclone100@gmail.com', 100, 800, 'debit', '2025-08-14 12:25:57', 1, 0),
(131, '555220696932620688', 'softwareclone100@gmail.com', 265, 800, 'Refund', '2025-08-14 12:31:34', 1, 1),
(132, '570522979207565509', 'softwareclone11@gmail.com', 265, 800, 'Refund', '2025-08-14 14:53:40', 1, 1),
(133, '795958417315987367', 'softwareclone11@gmail.com', 265, 800, 'Refund', '2025-08-14 17:07:50', 1, 1),
(134, '765053257921532078', 'softwareclone11@gmail.com', 100, 700, 'debit', '2025-08-14 19:22:36', 1, 0),
(135, '841700985629023130', 'softwareclone11@gmail.com', 100, 600, 'debit', '2025-08-14 19:23:47', 1, 0),
(136, '923753271527468041', 'softwareclone11@gmail.com', 50, 550, 'debit', '2025-08-15 05:54:05', 1, 0),
(137, '621585577141597437', 'softwareclone11@gmail.com', 100, 450, 'debit', '2025-08-15 12:44:08', 1, 0),
(138, '319057012991372953', 'softwareclone11@gmail.com', 100, 350, 'debit', '2025-08-15 12:44:54', 1, 0),
(139, '635500062726088227', 'softwareclone11@gmail.com', 265, 350, 'Refund', '2025-08-15 12:46:03', 1, 1),
(140, '203587483994392942', 'softwareclone11@gmail.com', 100, 350, 'Refund', '2025-08-15 17:20:50', 1, 1),
(141, '622663274157926579', 'softwareclone11@gmail.com', 100, 250, 'debit', '2025-08-15 17:21:40', 1, 0),
(142, '823935816769292858', 'softwareclone11@gmail.com', 60, 190, 'debit', '2025-08-15 17:22:34', 1, 0),
(143, '899499818205003362', 'softwareclone11@gmail.com', 50, 190, 'Refund', '2025-08-15 18:34:40', 1, 1),
(144, '169097535847405517', 'softwareclone11@gmail.com', 100, 190, 'Refund', '2025-08-15 18:35:49', 1, 1),
(145, '472807123113737047', 'softwareclone11@gmail.com', 100, 190, 'credit', '2025-08-15 18:39:17', 1, 0),
(146, '342332751802078223', 'softwareclone11@gmail.com', 300, 190, 'credit', '2025-08-15 18:42:25', 1, 0),
(147, '169951724393809488', 'oawel01@gmail.com', 200, 500, 'credit', '2025-08-15 18:45:28', 1, 0),
(148, '429359497466627039', 'oawel01@gmail.com', 100, 500, 'Refund', '2025-08-15 18:51:33', 1, 1),
(149, '688341428324099288', 'oawel01@gmail.com', 500, 500, 'Refund', '2025-08-15 19:01:08', 1, 1),
(150, '734830746441055314', 'oawel01@gmail.com', 265, 500, 'Refund', '2025-08-15 19:11:05', 1, 1),
(151, '266538688153179594', 'softwareclone11@gmail.com', 100, 190, 'Refund', '2025-08-15 19:17:41', 1, 1),
(152, '879749595599187030', 'Ajayiolaoluwa2014@gmail.com', 1000, 0, 'credit', '2025-08-16 09:56:10', 1, 0),
(153, '876903557162115425', 'softwareclone100@gmail.com', 265, 800, 'Refund', '2025-08-16 18:32:35', 1, 1),
(154, '574142722230970362', 'softwareclone11@gmail.com', 50, 140, 'debit', '2025-08-17 08:12:55', 1, 1),
(155, '776450545343708115', 'softwareclone11@gmail.com', 100, 40, 'debit', '2025-08-17 08:14:01', 1, 1),
(156, '120330731841086221', 'oawel01@gmail.com', 100, 400, 'debit', '2025-08-17 17:50:51', 1, 1),
(157, '914694445893232084', 'oawel01@gmail.com', 200, 400, 'credit', '2025-08-18 09:19:39', 1, 0),
(158, '319474478817818813', 'oawel01@gmail.com', 200, 400, 'credit', '2025-08-18 09:20:21', 1, 0),
(159, '831301948334274223', 'oawel01@gmail.com', 200, 400, 'credit', '2025-08-18 09:27:16', 1, 0),
(160, '650883116712522716', 'softwareclone11@gmail.com', 100, 140, 'credit', '2025-08-18 09:37:14', 1, 1),
(161, '331884087511304689', 'oawel01@gmail.com', 100, 500, 'credit', '2025-08-18 10:42:41', 1, 1),
(162, '228703693961302966', 'oawel01@gmail.com', 100, 400, 'debit', '2025-08-18 10:45:56', 1, 0),
(163, '249861342172668599', 'oawel01@gmail.com', 100, 300, 'debit', '2025-08-18 10:56:56', 1, 0),
(164, '690019532474487090', 'oawel01@gmail.com', 100, 200, 'debit', '2025-08-18 10:59:07', 1, 0),
(165, '328028679410738130', 'oawel01@gmail.com', 100, 100, 'debit', '2025-08-18 11:01:01', 1, 0),
(166, '126887454731366702', 'oawel01@gmail.com', 100, 100, 'credit', '2025-08-18 11:03:30', 1, 0),
(167, '291772618937922365', 'oawel01@gmail.com', 100, 0, 'debit', '2025-08-23 09:22:45', 1, 0),
(168, '505529325243800923', 'softwareclone11@gmail.com', 5000, 140, 'credit', '2025-08-23 10:22:12', 1, 0),
(169, '331920404698434987', 'softwareclone11@gmail.com', 100, 40, 'debit', '2025-10-03 05:02:00', 1, 0),
(170, '239066329200844519', 'oawel01@gmail.com', 500, 500, 'credit', '2025-10-12 13:49:42', 1, 1),
(171, '857525440181225532', 'oawel01@gmail.com', 500, 500, 'Refund', '2025-10-12 13:51:41', 1, 1),
(172, '618042837299749801', 'oawel01@gmail.com', 265, 500, 'Refund', '2025-10-12 13:53:16', 1, 1),
(173, '983840464961089919', 'oawel01@gmail.com', 265, 500, 'Refund', '2025-10-12 15:50:14', 1, 1),
(174, '256648297351489866', 'oawel01@gmail.com', 265, 500, 'Refund', '2025-10-12 15:51:29', 1, 1),
(175, '693815002995624054', 'oawel01@gmail.com', 470, 500, 'Refund', '2025-10-12 16:28:49', 1, 1),
(176, '117996433886389076', 'oawel01@gmail.com', 400, 100, 'debit', '2025-10-13 11:54:17', 1, 1),
(177, '999421957644433946', 'rahmahhabib083@gmail.com', 3000, 0, 'credit', '2025-10-13 16:16:09', 1, 0),
(178, '450904650424987772', 'rahmahhabib083@gmail.com', 3000, 3000, 'credit', '2025-10-13 16:20:03', 1, 1),
(179, '227319444658843767', 'rahmahhabib083@gmail.com', 1000, 2000, 'debit', '2025-10-13 16:30:31', 1, 1),
(180, '995607074279598935', 'oawel01@gmail.com', 600, 700, 'credit', '2025-10-13 16:36:52', 1, 1),
(181, '807533468812155549', 'oawel01@gmail.com', 265, 700, 'Refund', '2025-10-13 16:38:18', 1, 1),
(182, '525804458982040246', 'oawel01@gmail.com', 700, 700, 'Refund', '2025-10-13 16:40:19', 1, 1),
(183, '909966224197595516', 'oawel01@gmail.com', 150, 700, 'Refund', '2025-10-13 16:41:10', 1, 1),
(184, '291869319614698245', 'oawel01@gmail.com', 200, 500, 'debit', '2025-10-13 16:42:06', 1, 1),
(185, '606097191295242754', 'oawel01@gmail.com', 500, 0, 'debit', '2025-10-14 08:35:48', 1, 1),
(186, '903693127792690741', 'rahmahhabib083@gmail.com', 1000, 1000, 'debit', '2025-10-14 08:42:20', 1, 1),
(187, '813737950387148509', 'rahmahhabib083@gmail.com', 1000, 0, 'debit', '2025-10-16 18:27:05', 1, 1),
(188, '129020709331337753', 'softwareclone100@gmail.com', 300, 500, 'debit', '2025-10-22 14:44:20', 1, 1),
(189, '974345137317440157', 'softwareclone100@gmail.com', 350, 150, 'debit', '2025-10-22 18:22:41', 1, 1),
(190, '752330752633626655', 'softwareclone100@gmail.com', 600, 450, 'debit', '2025-10-22 18:59:59', 1, 1),
(191, '952927019665763747', 'softwareclone100@gmail.com', 500, 500, 'debit', '2025-10-22 19:03:12', 1, 1),
(192, '898658319812824437', 'softwareclone100@gmail.com', 400, 100, 'debit', '2025-10-25 21:50:46', 1, 1),
(193, '558803725202277051', 'oawel01@gmail.com', 2000, 0, 'credit', '2025-10-30 15:12:21', 1, 0),
(194, '332069203572055706', 'oawel01@gmail.com', 1000, 1000, 'credit', '2025-10-30 15:17:41', 1, 1),
(195, '611053559959069527', 'oawel01@gmail.com', 470, 1000, 'Refund', '2025-10-30 15:37:46', 1, 1),
(196, '952931168954905983', 'oawel01@gmail.com', 150, 1000, 'Refund', '2025-10-30 15:38:51', 1, 1),
(197, '527961893749480835', 'oawel01@gmail.com', 750, 250, 'debit', '2025-10-30 15:40:01', 1, 1),
(198, '436383889592910829', 'oawel01@gmail.com', 200, 50, 'debit', '2025-10-30 16:36:14', 1, 1),
(199, '778240781815880141', 'oawel01@gmail.com', 1000, 1050, 'credit', '2025-10-31 15:24:29', 1, 1),
(200, '157446844333374462', 'oawel01@gmail.com', 265, 1050, 'Refund', '2025-10-31 15:27:33', 1, 1),
(201, '970648568920557610', 'oawel01@gmail.com', 750, 300, 'debit', '2025-10-31 15:28:42', 1, 1),
(202, '413611064431155345', 'softwareclone11@gmail.com', 100, 440, 'debit', '2025-11-04 05:26:07', 1, 1),
(203, '349222378114823985', 'softwareclone11@gmail.com', 100, 340, 'debit', '2025-11-04 06:07:33', 1, 1),
(204, '419352484347983968', 'oawel01@gmail.com', 1000, 1300, 'credit', '2025-11-04 06:31:05', 1, 1),
(205, '809091335375984051', 'oawel01@gmail.com', 750, 1300, 'Refund', '2025-11-04 06:32:47', 1, 1),
(206, '747497466438605715', 'oawel01@gmail.com', 750, 550, 'debit', '2025-11-04 06:33:37', 1, 1),
(207, '719021397580474521', 'oawel01@gmail.com', 2000, 550, 'credit', '2025-11-04 13:05:55', 1, 0),
(208, '271167042235401186', 'oawel01@gmail.com', 3000, 550, 'credit', '2025-11-04 13:23:00', 1, 0),
(209, '223327787244906781', 'oawel01@gmail.com', 3000, 3550, 'credit', '2025-11-04 13:25:47', 1, 1),
(210, '912167704572514152', 'oawel01@gmail.com', 470, 3550, 'Refund', '2025-11-04 13:32:14', 1, 1),
(211, '804622041631502420', 'oawel01@gmail.com', 1500, 2050, 'debit', '2025-11-04 13:35:47', 1, 1),
(212, '119221876115656155', 'annaleona00@gmail.com', 200, 0, 'credit', '2025-11-05 02:21:30', 1, 0),
(213, '438742317253761528', 'annaleona00@gmail.com', 150, 150, 'credit', '2025-11-05 02:24:01', 1, 1),
(214, '598493295360362167', 'annaleona00@gmail.com', 144, 6, 'transfered', '2025-11-05 02:28:01', 1, 1),
(215, '598493295360362167', 'jonnywood158@gmail.com', 144, 0, 'recieved', '2025-11-05 02:28:01', 1, 0),
(216, '680371402312800673', 'jonnywood158@gmail.com', 144, 0, 'transfered', '2025-11-05 02:29:27', 1, 1),
(217, '680371402312800673', 'annaleona00@gmail.com', 144, 6, 'recieved', '2025-11-05 02:29:27', 1, 0),
(218, '254598416453894999', 'annaleona00@gmail.com', 100, 50, 'transfered', '2025-11-05 02:30:45', 1, 1),
(219, '254598416453894999', 'annaleona00@gmail.com', 100, 50, 'recieved', '2025-11-05 02:30:45', 1, 0),
(220, '497262991175446224', 'annaleona00@gmail.com', 145, 5, 'transfered', '2025-11-05 02:32:27', 1, 1),
(221, '497262991175446224', 'annaleona00@gmail.com', 145, 5, 'recieved', '2025-11-05 02:32:27', 1, 0),
(222, '206059229961555347', 'annaleona00@gmail.com', 144, 6, 'transfered', '2025-11-05 02:32:28', 1, 1),
(223, '206059229961555347', 'jonnywood158@gmail.com', 144, 0, 'recieved', '2025-11-05 02:32:28', 1, 0),
(224, '722600998544227397', 'jonnywood158@gmail.com', 144, 0, 'transfered', '2025-11-05 02:33:49', 1, 1),
(225, '722600998544227397', 'jonnywood158@gmail.com', 144, 0, 'recieved', '2025-11-05 02:33:49', 1, 0),
(226, '956401341733572185', 'jonnywood158@gmail.com', 143, 1, 'transfered', '2025-11-05 02:33:49', 1, 1),
(227, '956401341733572185', 'jonnywood158@gmail.com', 143, 1, 'recieved', '2025-11-05 02:33:49', 1, 0),
(228, '289022701205661851', 'jonnywood158@gmail.com', 84, 60, 'debit', '2025-11-05 02:35:09', 1, 1),
(229, '618040040122858673', 'jonnywood158@gmail.com', 58, 2, 'transfered', '2025-11-05 02:36:13', 1, 1),
(230, '618040040122858673', 'annaleona00@gmail.com', 58, 6, 'recieved', '2025-11-05 02:36:13', 1, 0),
(231, '690367727720020962', 'annaleona00@gmail.com', 62, 2, 'debit', '2025-11-05 02:39:04', 1, 1),
(232, '236967054519235265', 'oawel01@gmail.com', 500, 2550, 'credit', '2025-11-05 12:21:02', 1, 1),
(233, '722042075991769498', 'oawel01@gmail.com', 2230, 2550, 'Refund', '2025-11-05 12:22:48', 1, 1),
(234, '808143906640519219', 'oawel01@gmail.com', 1500, 1050, 'debit', '2025-11-05 12:24:11', 1, 1),
(235, '625031125425882607', 'oawel01@gmail.com', 1000, 50, 'debit', '2025-11-05 19:00:05', 1, 1),
(236, '115911723532714748', 'oawel01@icloud.com', 2000, 0, 'credit', '2025-11-05 19:34:06', 1, 0),
(237, '412648333329789894', 'oawel01@gmail.com', 2000, 50, 'credit', '2025-11-05 20:58:35', 1, 0),
(238, '941249469163911778', 'oawel01@gmail.com', 2000, 2050, 'credit', '2025-11-08 13:56:17', 1, 1),
(239, '951811378388044691', 'oawel01@gmail.com', 100, 1950, 'debit', '2025-11-08 13:59:39', 1, 1),
(240, '339959924480101232', 'oawel01@gmail.com', 265, 1950, 'Refund', '2025-11-08 14:00:45', 1, 1),
(241, '853192403226466462', 'oawel01@gmail.com', 150, 1950, 'Refund', '2025-11-08 14:02:41', 1, 1),
(242, '579565847170487904', 'oawel01@gmail.com', 100, 1850, 'debit', '2025-11-08 15:51:38', 1, 1),
(243, '271864962556462313', 'rahmahhabib083@gmail.com', 1000, 0, 'credit', '2025-11-08 20:02:41', 1, 0),
(244, '946934045296411555', 'oawel01@gmail.com', 1800, 50, 'debit', '2025-11-09 10:27:43', 1, 1),
(245, '869113392741643280', 'oawel01@icloud.com', 500, 500, 'credit', '2025-11-16 10:20:03', 1, 1),
(246, '196656436411469835', 'oawel01@icloud.com', 265, 500, 'Refund', '2025-11-16 10:23:30', 1, 1),
(247, '435855630414034271', 'oawel01@icloud.com', 500, 500, 'Refund', '2025-11-16 10:42:42', 1, 1),
(248, '476126972623737606', 'oawel01@icloud.com', 500, 500, 'Refund', '2025-11-16 10:44:29', 1, 1),
(249, '532585222616545037', 'oawel01@icloud.com', 500, 500, 'Refund', '2025-11-16 10:45:42', 1, 1),
(250, '499005126524652065', 'oawel01@icloud.com', 500, 0, 'debit', '2025-11-16 16:35:00', 1, 1),
(251, '844417702414806374', 'prosperjasper002@gmail.com', -90338, 90338, 'debit', '2025-11-17 05:11:31', 1, 0),
(252, '587283515967660759', 'prosperjasper002@gmail.com', 100, 90238, 'debit', '2025-11-17 05:12:32', 1, 1),
(253, '147786635985623879', 'prosperjasper002@gmail.com', 1000, 89238, 'debit', '2025-11-17 05:13:15', 1, 1),
(254, '351227998602930123', 'prosperjasper002@gmail.com', 5000, 84238, 'debit', '2025-11-17 05:14:01', 1, 0),
(255, '852241595761891931', 'prosperjasper002@gmail.com', 1000, 83238, 'debit', '2025-11-17 05:14:39', 1, 0),
(256, '472637671874403536', 'prosperjasper002@gmail.com', 500, 82738, 'debit', '2025-11-17 05:15:05', 1, 1),
(257, '260452139305207352', 'prosperjasper002@gmail.com', 499, 82239, 'debit', '2025-11-17 05:15:45', 1, 0),
(258, '464704146457269440', 'prosperjasper002@gmail.com', 400, 81839, 'debit', '2025-11-17 05:17:35', 1, 0),
(259, '826580141291873917', 'prosperjasper002@gmail.com', 1000, 80839, 'debit', '2025-11-17 05:24:47', 1, 0),
(260, '988130978189944048', 'prosperjasper002@gmail.com', 100, 80739, 'debit', '2025-11-17 06:42:43', 1, 1),
(261, '560209904376937527', 'prosperjasper002@gmail.com', 500, 80239, 'debit', '2025-11-17 06:43:13', 1, 0),
(262, '745689955819236970', 'prosperjasper002@gmail.com', 500, 79739, 'debit', '2025-11-17 09:51:48', 1, 0),
(263, '688943549856865155', 'prosperjasper002@gmail.com', 1000, 78739, 'debit', '2025-11-17 16:38:33', 1, 0),
(264, '311435132600643954', 'prosperjasper002@gmail.com', 100, 78639, 'debit', '2025-11-19 08:03:27', 1, 0),
(265, '488455179266458055', 'prosperjasper002@gmail.com', 100, 78539, 'debit', '2025-11-19 13:41:10', 1, 0),
(266, '204572738609781587', 'prosperjasper002@gmail.com', 100, 78439, 'debit', '2025-11-19 14:51:40', 1, 0),
(267, '250110851429559317', 'prosperjasper002@gmail.com', 100, 78339, 'debit', '2025-11-20 07:07:12', 1, 0),
(268, '389002504862667568', 'prosperjasper002@gmail.com', 100, 78239, 'debit', '2025-11-20 16:16:04', 1, 0),
(269, '591224136764129244', 'prosperjasper002@gmail.com', 200, 78039, 'debit', '2025-11-22 13:40:14', 1, 0),
(270, '533646054333231193', 'prosperjasper002@gmail.com', 100, 77939, 'debit', '2025-11-23 18:56:08', 1, 0),
(271, '892916354796601466', 'prosperjasper002@gmail.com', 200, 77739, 'debit', '2025-11-24 10:55:14', 1, 0),
(272, '126882450679340030', 'prosperjasper002@gmail.com', 100, 77639, 'debit', '2025-11-24 21:20:46', 1, 0),
(273, '838409497331696074', 'prosperjasper002@gmail.com', 500, 77139, 'debit', '2025-11-26 01:52:54', 1, 0),
(274, '600633673941217414', 'prosperjasper002@gmail.com', 2000, 75139, 'debit', '2025-11-28 11:49:16', 1, 0),
(275, '143451568381901477', 'oawel01@gmail.com', 3000, 3050, 'credit', '2025-11-28 12:21:37', 1, 1),
(276, '734590117973251711', 'oawel01@gmail.com', 2230, 3050, 'Refund', '2025-11-28 12:23:59', 1, 1),
(277, '196150205690752065', 'oawel01@gmail.com', 2000, 1050, 'debit', '2025-11-28 17:11:21', 1, 0),
(278, '926897979469141089', 'oawel01@gmail.com', 1000, 50, 'debit', '2025-11-28 17:13:00', 1, 0),
(279, '544486687369924796', 'prosperjasper002@gmail.com', 500, 74639, 'debit', '2025-12-06 20:07:43', 1, 0),
(280, '930068417868991494', 'prosperjasper002@gmail.com', 500, 74139, 'debit', '2025-12-10 08:29:24', 1, 0),
(281, '376887037441606638', 'prosperjasper002@gmail.com', 500, 73639, 'debit', '2025-12-12 07:07:41', 1, 0),
(282, '684221648120738538', 'prosperjasper002@gmail.com', 1000, 72639, 'debit', '2025-12-18 10:11:50', 1, 0),
(283, '174671426807940190', 'prosperjasper002@gmail.com', 100, 72539, 'debit', '2025-12-21 23:13:51', 1, 0),
(284, '573201300442882719', 'balaabu033@gmail.com', 500, 0, 'credit', '2025-12-23 20:56:29', 1, 0),
(285, '326819719318073379', 'balaabu033@gmail.com', 250, 250, 'credit', '2025-12-24 10:31:29', 1, 1),
(286, '701994239338170367', 'balaabu033@gmail.com', 100, 150, 'transfered', '2025-12-24 10:39:11', 1, 1),
(287, '701994239338170367', 'rolandgoodness707@gmail.com', 100, 0, 'recieved', '2025-12-24 10:39:11', 1, 0),
(288, '600378534688804477', 'balaabu033@gmail.com', 50, 100, 'transfered', '2025-12-24 10:39:11', 1, 1),
(289, '600378534688804477', 'rolandgoodness707@gmail.com', 50, 100, 'recieved', '2025-12-24 10:39:11', 1, 0),
(290, '876154761969170890', 'balaabu033@gmail.com', 99, 1, 'transfered', '2025-12-24 10:40:22', 1, 1),
(291, '876154761969170890', 'rolandgoodness707@gmail.com', 99, 150, 'recieved', '2025-12-24 10:40:22', 1, 0),
(292, '351465445190501995', 'balaabu033@gmail.com', 1, 0, 'transfered', '2025-12-24 10:41:50', 1, 1),
(293, '351465445190501995', 'rolandgoodness707@gmail.com', 1, 249, 'recieved', '2025-12-24 10:41:50', 1, 0),
(294, '720422351903817758', 'rolandgoodness707@gmail.com', 250, 0, 'transfered', '2025-12-24 10:42:35', 1, 1),
(295, '720422351903817758', 'balaabu033@gmail.com', 250, 0, 'recieved', '2025-12-24 10:42:35', 1, 0),
(296, '713171184544828299', 'balaabu033@gmail.com', 51, 199, 'debit', '2025-12-24 10:46:04', 1, 1),
(297, '856269389694066418', 'balaabu033@gmail.com', 1, 198, 'transfered', '2025-12-24 10:47:02', 1, 1),
(298, '856269389694066418', 'rolandgoodness707@gmail.com', 1, 0, 'recieved', '2025-12-24 10:47:02', 1, 0),
(299, '905783139708786875', 'balaabu033@gmail.com', 51, 147, 'debit', '2025-12-24 10:47:02', 1, 1),
(300, '406542409682026752', 'balaabu033@gmail.com', 140, 7, 'transfered', '2025-12-24 10:48:31', 1, 1),
(301, '406542409682026752', 'rolandgoodness707@gmail.com', 140, 1, 'recieved', '2025-12-24 10:48:31', 1, 0),
(302, '293325939207259815', 'balaabu033@gmail.com', 7, 0, 'transfered', '2025-12-24 10:50:27', 1, 1),
(303, '293325939207259815', 'rolandgoodness707@gmail.com', 7, 141, 'recieved', '2025-12-24 10:50:27', 1, 0),
(304, '871368566173353235', 'rolandgoodness707@gmail.com', 147, 1, 'transfered', '2025-12-24 10:51:20', 1, 1),
(305, '871368566173353235', 'balaabu033@gmail.com', 147, 0, 'recieved', '2025-12-24 10:51:20', 1, 0),
(306, '751529034550986092', 'balaabu033@gmail.com', 147, 0, 'transfered', '2025-12-24 10:54:48', 1, 1),
(307, '751529034550986092', 'rolandgoodness707@gmail.com', 147, 1, 'recieved', '2025-12-24 10:54:48', 1, 0),
(308, '736651005399973979', 'rolandgoodness707@gmail.com', 148, 0, 'transfered', '2025-12-24 10:56:08', 1, 1),
(309, '736651005399973979', 'rolandgoodness707@gmail.com', 148, 0, 'recieved', '2025-12-24 10:56:08', 1, 0),
(310, '669191812322403821', 'rolandgoodness707@gmail.com', 148, 0, 'transfered', '2025-12-24 10:57:48', 1, 1),
(311, '669191812322403821', 'rolandgoodness707@gmail.com', 148, 0, 'recieved', '2025-12-24 10:57:48', 1, 0),
(312, '367970819362286176', 'rolandgoodness707@gmail.com', 148, 0, 'transfered', '2025-12-24 10:59:37', 1, 1),
(313, '367970819362286176', 'rolandgoodness707@gmail.com', 148, 0, 'recieved', '2025-12-24 10:59:37', 1, 0),
(314, '473595772802487715', 'rolandgoodness707@gmail.com', 148, 0, 'transfered', '2025-12-24 11:01:26', 1, 1),
(315, '473595772802487715', 'balaabu033@gmail.com', 148, 0, 'recieved', '2025-12-24 11:01:26', 1, 0),
(316, '714341867143824935', 'balaabu033@gmail.com', 51, 97, 'debit', '2025-12-24 11:03:47', 1, 1),
(317, '341796223639867580', 'balaabu033@gmail.com', 97, 0, 'transfered', '2025-12-24 11:07:57', 1, 1),
(318, '341796223639867580', 'balaabu033@gmail.com', 97, 0, 'recieved', '2025-12-24 11:07:57', 1, 0),
(319, '479204291785510432', 'balaabu033@gmail.com', 96, 1, 'transfered', '2025-12-24 11:07:57', 1, 1),
(320, '479204291785510432', 'balaabu033@gmail.com', 96, 1, 'recieved', '2025-12-24 11:07:57', 1, 0),
(321, '648542116919512078', 'balaabu033@gmail.com', 97, 0, 'transfered', '2025-12-24 11:09:27', 1, 1),
(322, '648542116919512078', 'hindatup@gmail.com', 97, 0, 'recieved', '2025-12-24 11:09:27', 1, 0),
(323, '571575550760584697', 'hindatup@gmail.com', 97, 0, 'transfered', '2025-12-24 11:11:39', 1, 1),
(324, '571575550760584697', 'balaabu033@gmail.com', 97, 0, 'recieved', '2025-12-24 11:11:39', 1, 0),
(325, '417958216431374931', 'balaabu033@gmail.com', 96, 1, 'transfered', '2025-12-24 11:12:42', 1, 1),
(326, '417958216431374931', 'hindatup@gmail.com', 96, 0, 'recieved', '2025-12-24 11:12:42', 1, 0),
(327, '580092476898465738', 'hindatup@gmail.com', 96, 0, 'transfered', '2025-12-24 11:13:35', 1, 1),
(328, '580092476898465738', 'balaabu033@gmail.com', 96, 1, 'recieved', '2025-12-24 11:13:35', 1, 0),
(329, '115612243781893932', 'balaabu033@gmail.com', 50, 47, 'debit', '2025-12-24 11:14:54', 1, 1),
(330, '491550609133425092', 'balaabu033@gmail.com', 1, 46, 'transfered', '2025-12-24 11:16:35', 1, 1),
(331, '491550609133425092', 'hindatup@gmail.com', 1, 0, 'recieved', '2025-12-24 11:16:35', 1, 0),
(332, '575274265933549889', 'balaabu033@gmail.com', 1, 45, 'transfered', '2025-12-24 11:16:35', 1, 1),
(333, '575274265933549889', 'balaabu033@gmail.com', 1, 45, 'recieved', '2025-12-24 11:16:35', 1, 0),
(334, '338439601340593017', 'softwareclone11@gmail.com', 265, 340, 'Refund', '2025-12-24 16:11:32', 1, 1),
(335, '995115183222517398', 'softwareclone11@gmail.com', 100, 240, 'debit', '2025-12-24 16:15:47', 1, 1),
(336, '212306337276385608', 'abdulazeezbello5882@gmail.com', 1000, 0, 'credit', '2025-12-26 22:27:58', 1, 0),
(337, '895285687134855223', 'prosperjasper002@gmail.com', 130, 72409, 'debit', '2025-12-30 16:12:40', 1, 0),
(338, '138514951731473396', 'softwareclone11@gmail.com', 100, 140, 'debit', '2026-01-04 14:27:40', 1, 3),
(339, '660314331124649043', 'abdulazeezbellomhd@gmail.commm', 100, 0, 'credit', '2026-03-26 13:57:34', 1, 0),
(340, '906162354757777670', 'abdulazeezbellomhd@gmail.commm', 200, 0, 'credit', '2026-03-26 13:57:52', 1, 0),
(341, '329913939446975205', 'abz@gmail.com', 100, 110, 'credit', '2026-03-31 16:21:51', 1, 0),
(342, '368476948689595186', 'oawel01@gmail.com', 100, 50, 'debit', '2026-04-07 14:19:20', 1, 3),
(343, 'cac_payment_1776690701', 'abz@gmail.com', 19000, 31000, 'debit', '2026-04-20 13:11:41', 1, 0),
(344, '669025469436620588', 'oawel01@gmail.com', 1000, 590, 'credit', '2026-04-26 14:17:03', 1, 0),
(345, '749784239832701286', 'oawel01@gmail.com', 1000, 585, 'debit', '2026-04-26 18:14:14', 1, 3),
(346, '699269160163959188', 'balaabu033@gmail.com', 30, 16, 'transfered', '2026-04-29 14:06:00', 1, 1),
(347, '699269160163959188', 'balaabu033@gmail.com', 30, 16, 'recieved', '2026-04-29 14:06:00', 1, 0),
(348, '632877469810401433', 'balaabu033@gmail.com', 31, 15, 'transfered', '2026-04-29 14:09:24', 1, 1),
(349, '632877469810401433', 'balaabu033@gmail.com', 31, 15, 'recieved', '2026-04-29 14:09:24', 1, 0),
(350, '443169439403258745', 'balaabu033@gmail.com', 30, 16, 'transfered', '2026-04-29 14:09:24', 1, 1),
(351, '443169439403258745', 'balaabu033@gmail.com', 30, 16, 'recieved', '2026-04-29 14:09:24', 1, 0),
(352, '726558463731787342', 'balaabu033@gmail.com', 41, 5, 'transfered', '2026-04-29 14:22:30', 1, 1),
(353, '726558463731787342', 'nura001y@gmail.com', 41, 0, 'recieved', '2026-04-29 14:22:30', 1, 0),
(354, '395326895165512218', 'nura001y@gmail.com', 41, 0, 'transfered', '2026-04-29 14:24:01', 1, 1),
(355, '395326895165512218', 'balaabu033@gmail.com', 41, 5, 'recieved', '2026-04-29 14:24:01', 1, 0),
(356, '519765338512866074', 'balaabu033@gmail.com', 40, 6, 'transfered', '2026-04-29 14:25:51', 1, 1),
(357, '519765338512866074', 'balaabu033@gmail.com', 40, 6, 'recieved', '2026-04-29 14:25:51', 1, 0),
(358, '913859151326530805', 'balaabu033@gmail.com', 41, 5, 'transfered', '2026-04-29 14:25:52', 1, 1),
(359, '913859151326530805', 'nura001y@gmail.com', 41, 0, 'recieved', '2026-04-29 14:25:52', 1, 0),
(360, '909439999516144052', 'nura001y@gmail.com', 41, 0, 'transfered', '2026-04-29 14:27:42', 1, 1),
(361, '909439999516144052', 'balaabu033@gmail.com', 41, 5, 'recieved', '2026-04-29 14:27:42', 1, 0),
(362, '330752467753847500', 'balaabu033@gmail.com', 25, 21, 'transfered', '2026-04-29 14:29:21', 1, 1),
(363, '330752467753847500', 'nura001y@gmail.com', 25, 0, 'recieved', '2026-04-29 14:29:21', 1, 0),
(364, '631242709900962680', 'balaabu033@gmail.com', 2, 19, 'transfered', '2026-04-29 14:29:21', 1, 1),
(365, '631242709900962680', 'nura001y@gmail.com', 2, 25, 'recieved', '2026-04-29 14:29:21', 1, 0),
(366, '771840834467785886', 'balaabu033@gmail.com', 17, 2, 'transfered', '2026-04-29 14:31:17', 1, 1),
(367, '771840834467785886', 'nura001y@gmail.com', 17, 27, 'recieved', '2026-04-29 14:31:17', 1, 0),
(368, '576774015824223045', 'balaabu033@gmail.com', 2, 0, 'transfered', '2026-04-29 14:35:55', 1, 1),
(369, '576774015824223045', 'nura001y@gmail.com', 2, 44, 'recieved', '2026-04-29 14:35:55', 1, 0),
(370, '764337420345702829', 'rolandgoodness707@gmail.com', 200, 200, 'credit', '2026-05-15 03:34:02', 1, 1),
(371, '573953795827642837', 'rolandgoodness707@gmail.com', 51, 149, 'debit', '2026-05-15 03:42:54', 1, 0),
(372, '269746048185541069', 'rolandgoodness707@gmail.com', 51, 98, 'debit', '2026-05-15 03:42:54', 1, 0),
(373, '910207483538529131', 'rolandgoodness707@gmail.com', 98, 0, 'debit', '2026-05-15 03:45:58', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_money_transfer_tbl`
--

CREATE TABLE `wallet_money_transfer_tbl` (
  `id` int(11) NOT NULL,
  `trans_id` varchar(255) NOT NULL,
  `transferer_id` varchar(255) NOT NULL,
  `transferee_id` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `trans_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_money_transfer_tbl`
--

INSERT INTO `wallet_money_transfer_tbl` (`id`, `trans_id`, `transferer_id`, `transferee_id`, `amount`, `trans_date`, `status`) VALUES
(1, '598493295360362167', 'annaleona00@gmail.com', 'jonnywood158@gmail.com', 144, '2025-11-05 02:28:01', 0),
(2, '680371402312800673', 'jonnywood158@gmail.com', 'annaleona00@gmail.com', 144, '2025-11-05 02:29:27', 0),
(3, '254598416453894999', 'annaleona00@gmail.com', 'annaleona00@gmail.com', 100, '2025-11-05 02:30:45', 0),
(4, '497262991175446224', 'annaleona00@gmail.com', 'annaleona00@gmail.com', 145, '2025-11-05 02:32:27', 0),
(5, '206059229961555347', 'annaleona00@gmail.com', 'jonnywood158@gmail.com', 144, '2025-11-05 02:32:28', 0),
(6, '722600998544227397', 'jonnywood158@gmail.com', 'jonnywood158@gmail.com', 144, '2025-11-05 02:33:49', 0),
(7, '956401341733572185', 'jonnywood158@gmail.com', 'jonnywood158@gmail.com', 143, '2025-11-05 02:33:49', 0),
(8, '618040040122858673', 'jonnywood158@gmail.com', 'annaleona00@gmail.com', 58, '2025-11-05 02:36:13', 0),
(9, '701994239338170367', 'balaabu033@gmail.com', 'rolandgoodness707@gmail.com', 100, '2025-12-24 10:39:11', 0),
(10, '600378534688804477', 'balaabu033@gmail.com', 'rolandgoodness707@gmail.com', 50, '2025-12-24 10:39:11', 0),
(11, '876154761969170890', 'balaabu033@gmail.com', 'rolandgoodness707@gmail.com', 99, '2025-12-24 10:40:22', 0),
(12, '351465445190501995', 'balaabu033@gmail.com', 'rolandgoodness707@gmail.com', 1, '2025-12-24 10:41:50', 0),
(13, '720422351903817758', 'rolandgoodness707@gmail.com', 'balaabu033@gmail.com', 250, '2025-12-24 10:42:35', 0),
(14, '856269389694066418', 'balaabu033@gmail.com', 'rolandgoodness707@gmail.com', 1, '2025-12-24 10:47:02', 0),
(15, '406542409682026752', 'balaabu033@gmail.com', 'rolandgoodness707@gmail.com', 140, '2025-12-24 10:48:31', 0),
(16, '293325939207259815', 'balaabu033@gmail.com', 'rolandgoodness707@gmail.com', 7, '2025-12-24 10:50:27', 0),
(17, '871368566173353235', 'rolandgoodness707@gmail.com', 'balaabu033@gmail.com', 147, '2025-12-24 10:51:20', 0),
(18, '751529034550986092', 'balaabu033@gmail.com', 'rolandgoodness707@gmail.com', 147, '2025-12-24 10:54:48', 0),
(19, '736651005399973979', 'rolandgoodness707@gmail.com', 'rolandgoodness707@gmail.com', 148, '2025-12-24 10:56:08', 0),
(20, '669191812322403821', 'rolandgoodness707@gmail.com', 'rolandgoodness707@gmail.com', 148, '2025-12-24 10:57:48', 0),
(21, '367970819362286176', 'rolandgoodness707@gmail.com', 'rolandgoodness707@gmail.com', 148, '2025-12-24 10:59:37', 0),
(22, '473595772802487715', 'rolandgoodness707@gmail.com', 'balaabu033@gmail.com', 148, '2025-12-24 11:01:26', 0),
(23, '341796223639867580', 'balaabu033@gmail.com', 'balaabu033@gmail.com', 97, '2025-12-24 11:07:57', 0),
(24, '479204291785510432', 'balaabu033@gmail.com', 'balaabu033@gmail.com', 96, '2025-12-24 11:07:57', 0),
(25, '648542116919512078', 'balaabu033@gmail.com', 'hindatup@gmail.com', 97, '2025-12-24 11:09:27', 0),
(26, '571575550760584697', 'hindatup@gmail.com', 'balaabu033@gmail.com', 97, '2025-12-24 11:11:39', 0),
(27, '417958216431374931', 'balaabu033@gmail.com', 'hindatup@gmail.com', 96, '2025-12-24 11:12:42', 0),
(28, '580092476898465738', 'hindatup@gmail.com', 'balaabu033@gmail.com', 96, '2025-12-24 11:13:35', 0),
(29, '491550609133425092', 'balaabu033@gmail.com', 'hindatup@gmail.com', 1, '2025-12-24 11:16:35', 0),
(30, '575274265933549889', 'balaabu033@gmail.com', 'balaabu033@gmail.com', 1, '2025-12-24 11:16:35', 0),
(31, '699269160163959188', 'balaabu033@gmail.com', 'balaabu033@gmail.com', 30, '2026-04-29 14:06:00', 0),
(32, '632877469810401433', 'balaabu033@gmail.com', 'balaabu033@gmail.com', 31, '2026-04-29 14:09:24', 0),
(33, '443169439403258745', 'balaabu033@gmail.com', 'balaabu033@gmail.com', 30, '2026-04-29 14:09:24', 0),
(34, '726558463731787342', 'balaabu033@gmail.com', 'nura001y@gmail.com', 41, '2026-04-29 14:22:30', 0),
(35, '395326895165512218', 'nura001y@gmail.com', 'balaabu033@gmail.com', 41, '2026-04-29 14:24:01', 0),
(36, '519765338512866074', 'balaabu033@gmail.com', 'balaabu033@gmail.com', 40, '2026-04-29 14:25:51', 0),
(37, '913859151326530805', 'balaabu033@gmail.com', 'nura001y@gmail.com', 41, '2026-04-29 14:25:52', 0),
(38, '909439999516144052', 'nura001y@gmail.com', 'balaabu033@gmail.com', 41, '2026-04-29 14:27:42', 0),
(39, '330752467753847500', 'balaabu033@gmail.com', 'nura001y@gmail.com', 25, '2026-04-29 14:29:21', 0),
(40, '631242709900962680', 'balaabu033@gmail.com', 'nura001y@gmail.com', 2, '2026-04-29 14:29:21', 0),
(41, '771840834467785886', 'balaabu033@gmail.com', 'nura001y@gmail.com', 17, '2026-04-29 14:31:17', 0),
(42, '576774015824223045', 'balaabu033@gmail.com', 'nura001y@gmail.com', 2, '2026-04-29 14:35:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_tbl`
--

CREATE TABLE `wallet_tbl` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `balance` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `last_transanction` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_tbl`
--

INSERT INTO `wallet_tbl` (`id`, `user_id`, `balance`, `status`, `last_transanction`) VALUES
(2, '436', 0, 1, '2025-08-13 07:23:46'),
(3, 'softwareclone11@gmail.com', 240, 1, '2025-08-13 09:53:22'),
(4, 'oawel01@gmail.com', 228, 1, '2025-08-13 13:16:01'),
(5, 'softwareclone100@gmail.com', 100, 1, '2025-08-14 12:22:50'),
(6, 'Ajayiolaoluwa2014@gmail.com', 0, 1, '2025-08-16 07:09:45'),
(7, 'engrleeceo@gmail.com', 0, 1, '2025-09-04 13:02:49'),
(8, 'softwareclone8@gmail.com', 0, 1, '2025-10-13 11:26:13'),
(9, 'rahautextiles@gmail.com', 0, 1, '2025-10-13 11:52:51'),
(10, 'rahmahhabib083@gmail.com', 0, 1, '2025-10-13 16:11:03'),
(11, 'musasaidu090@gmail.com', 0, 1, '2025-10-20 11:38:29'),
(12, 'josephisomamode@gmail.com', 0, 1, '2025-11-04 19:36:57'),
(13, 'annaleona00@gmail.com', 2, 1, '2025-11-05 02:19:17'),
(14, 'jonnywood158@gmail.com', 2, 1, '2025-11-05 02:26:15'),
(15, 'oawel01@icloud.com', 0, 1, '2025-11-05 19:32:59'),
(16, 'abubakarumarsumaila24@gmail.com', 0, 1, '2025-11-06 19:06:00'),
(17, 'yahayayakubakatsina@gmail.com', 0, 1, '2025-11-08 20:56:24'),
(18, 'babaisahabdulwadud@gmail.com', 0, 1, '2025-11-09 14:08:11'),
(19, 'jiddahbello12@gmail.com', 0, 1, '2025-11-10 05:52:28'),
(20, 'abubakaraishaq503@gmail.com', 0, 1, '2025-11-10 11:19:04'),
(21, 'prosperjasper002@gmail.com', 72409, 1, '2025-11-17 05:07:22'),
(22, 'sekyenretbi@gmail.com', 0, 1, '2025-12-19 01:38:59'),
(23, 'balaabu033@gmail.com', 0, 1, '2025-12-23 20:53:30'),
(24, 'rolandgoodness707@gmail.com', 0, 1, '2025-12-24 10:36:58'),
(25, 'hindatup@gmail.com', 1, 1, '2025-12-24 11:03:02'),
(27, 'edfygh@jgjhfgj.dfdf', 0, 1, '2026-01-03 23:28:04'),
(30, 'abz@gmail.com', 2000, 1, '2026-03-30 10:41:20'),
(31, 'abdul@gmail.com', 0, 1, '2026-03-31 19:34:50'),
(32, 'mahmudmuhammad.mm@gmail.com', 0, 1, '2026-04-01 06:13:48'),
(33, 'ahmadabdallah430@gmail.com', 0, 1, '2026-04-06 06:28:40'),
(34, 'yushas80@gmail.com', 0, 1, '2026-04-06 06:31:14'),
(35, 'mymshelia51@gmail.com', 0, 1, '2026-04-07 12:13:46'),
(36, 'abdulazeezbellomhd@gmail.com', 0, 1, '2026-04-22 22:21:44'),
(38, 'harunamati2@gmail.com', 0, 1, '2026-04-23 06:55:48'),
(39, 'softwareclone130@gmail.com', 379, 1, '2025-08-14 12:22:50'),
(40, 'Nazeerelias05@gmail.com', 0, 1, '2026-04-23 16:30:41'),
(41, 'usmanmurtalausman44@gmail.com', 0, 1, '2026-04-23 16:34:11'),
(42, 'yakubushafiu07@gmail.com', 0, 1, '2026-04-24 06:18:56'),
(43, 'ibrahimmuhd6010@gmail.com', 0, 1, '2026-04-24 08:51:17'),
(44, 'alhaji_00@hotmail.com', 0, 1, '2026-04-24 10:45:20'),
(45, 'Mahmudmansurgaladanchi@gmail.com', 0, 1, '2026-04-25 10:18:07'),
(46, 'elyusifscomultimate@gmail.com', 0, 1, '2026-04-27 18:01:00'),
(47, 'nura001y@gmail.com', 46, 1, '2026-04-29 14:19:25'),
(48, 'intellisensehq@gmail.com', 985, 1, '2026-04-30 18:18:11'),
(49, 'sprinces407@gmail.com', 0, 1, '2026-05-16 17:13:10'),
(50, 'bravotecharena@gmail.com', 0, 1, '2026-05-17 08:10:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_role_tbl`
--
ALTER TABLE `admin_role_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_settings`
--
ALTER TABLE `api_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_code_and_name`
--
ALTER TABLE `bank_code_and_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cac_registration_tbl`
--
ALTER TABLE `cac_registration_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_out_tbl`
--
ALTER TABLE `cash_out_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_out_transfer_reciept`
--
ALTER TABLE `cash_out_transfer_reciept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_cac_registration_tbl`
--
ALTER TABLE `company_cac_registration_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_tbl`
--
ALTER TABLE `discount_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edutech_settings`
--
ALTER TABLE `edutech_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_details`
--
ALTER TABLE `nin_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_modification`
--
ALTER TABLE `nin_modification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_personalizations`
--
ALTER TABLE `nin_personalizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_validation`
--
ALTER TABLE `nin_validation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `old_sme_data_tbl`
--
ALTER TABLE `old_sme_data_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_discount_tbl`
--
ALTER TABLE `payment_discount_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_history_tbl`
--
ALTER TABLE `payment_history_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_types`
--
ALTER TABLE `plan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referal_earn_transaction_tbl`
--
ALTER TABLE `referal_earn_transaction_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referal_tbl`
--
ALTER TABLE `referal_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result_checker_pin_sell_tbl`
--
ALTER TABLE `result_checker_pin_sell_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `save_pin_and_token_buy`
--
ALTER TABLE `save_pin_and_token_buy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sme_data_tbl`
--
ALTER TABLE `sme_data_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sme_data_type_tbl`
--
ALTER TABLE `sme_data_type_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sme_network_tbl`
--
ALTER TABLE `sme_network_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_url_link_tbl`
--
ALTER TABLE `sub_url_link_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_token_auth`
--
ALTER TABLE `tbl_token_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions_tbl`
--
ALTER TABLE `transactions_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_status_tbl`
--
ALTER TABLE `trans_status_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `url_link_tbl`
--
ALTER TABLE `url_link_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_history_tbl`
--
ALTER TABLE `wallet_history_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_money_transfer_tbl`
--
ALTER TABLE `wallet_money_transfer_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_tbl`
--
ALTER TABLE `wallet_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_role_tbl`
--
ALTER TABLE `admin_role_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_settings`
--
ALTER TABLE `api_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_code_and_name`
--
ALTER TABLE `bank_code_and_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `cac_registration_tbl`
--
ALTER TABLE `cac_registration_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cash_out_tbl`
--
ALTER TABLE `cash_out_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_out_transfer_reciept`
--
ALTER TABLE `cash_out_transfer_reciept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_cac_registration_tbl`
--
ALTER TABLE `company_cac_registration_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount_tbl`
--
ALTER TABLE `discount_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edutech_settings`
--
ALTER TABLE `edutech_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `nin_details`
--
ALTER TABLE `nin_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nin_modification`
--
ALTER TABLE `nin_modification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nin_personalizations`
--
ALTER TABLE `nin_personalizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nin_validation`
--
ALTER TABLE `nin_validation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `old_sme_data_tbl`
--
ALTER TABLE `old_sme_data_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `payment_discount_tbl`
--
ALTER TABLE `payment_discount_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_history_tbl`
--
ALTER TABLE `payment_history_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `plan_types`
--
ALTER TABLE `plan_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `referal_earn_transaction_tbl`
--
ALTER TABLE `referal_earn_transaction_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referal_tbl`
--
ALTER TABLE `referal_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result_checker_pin_sell_tbl`
--
ALTER TABLE `result_checker_pin_sell_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `save_pin_and_token_buy`
--
ALTER TABLE `save_pin_and_token_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sme_data_tbl`
--
ALTER TABLE `sme_data_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `sme_data_type_tbl`
--
ALTER TABLE `sme_data_type_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sme_network_tbl`
--
ALTER TABLE `sme_network_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_url_link_tbl`
--
ALTER TABLE `sub_url_link_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `tbl_token_auth`
--
ALTER TABLE `tbl_token_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1395;

--
-- AUTO_INCREMENT for table `transactions_tbl`
--
ALTER TABLE `transactions_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `trans_status_tbl`
--
ALTER TABLE `trans_status_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `url_link_tbl`
--
ALTER TABLE `url_link_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=507;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_history_tbl`
--
ALTER TABLE `wallet_history_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=374;

--
-- AUTO_INCREMENT for table `wallet_money_transfer_tbl`
--
ALTER TABLE `wallet_money_transfer_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `wallet_tbl`
--
ALTER TABLE `wallet_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
