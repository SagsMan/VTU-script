-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2024 at 09:05 AM
-- Server version: 10.6.19-MariaDB-cll-lve
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eduowrav_payboxed`
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

--
-- Dumping data for table `admin_role_tbl`
--

INSERT INTO `admin_role_tbl` (`id`, `role_name`, `role`, `welcome_show`) VALUES
(1, 'Super Admin', '1,2,3,4', 'Hello World'),
(2, 'Agent', '2,3', 'wdwadwdasd asd as d asdc'),
(3, 'User', '3', 'dqwdead eadf aefc a cf ad'),
(4, 'APIs User', '2,3,4', '');

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
(4, 'emmanueljunior433@gmail.com', 'Emmanuel Emejulu', '09039923365', 'emmanueljunior433@gmail.com', 'No 2 Ilechukwu Street, Inyaba Umudim', 'emejulucodes', 'emejulucodes', 'emejulucodes2', 'No 2 Ilechukwu Street, Inyaba Umudim', '../uploads/emejulucodes_proprietor_passport_1723707198.png', '../uploads/emejulucodes_proprietor_signature_1723707198.png', '../uploads/emejulucodes_nin_1723707198.png', '2024-08-23 09:12:53.744260', 3, '../uploads/CAC_Document_cac_doc_1724418773.pdf');

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

--
-- Dumping data for table `cash_out_tbl`
--

INSERT INTO `cash_out_tbl` (`id`, `amount`, `charges`, `account_number`, `account_name`, `bank_code`, `recipient_code`, `integration`, `transfer_id`, `email`, `request_id`, `reference`, `transfer_code`, `cash_date`, `request_date`, `status`, `super_admin`) VALUES
(84, 5000, 50, '0062343539', 'ABDULAZEEZ ADENIYI ABDULWAHEED', '044', 'RCP_evvz7j96psbx7gr', '496006', '23722806', 'azzeetech.it@gmail.com', '354364073407854393', 'ghug9xsxrm', 'TRF_3owgiu7sjdmnm9ws', '2022-01-27T13:09:44.000Z', '2022-01-27 13:09:47', 1, 1),
(85, 40000, 400, '0062343539', 'ABDULAZEEZ ADENIYI ABDULWAHEED', '044', 'RCP_evvz7j96psbx7gr', '496006', '23722806', 'azzeetech.it@gmail.com', '799331338960058675', '', '', '', '2022-01-27 13:11:49', 2, 1),
(86, 40000, 400, '0062343539', 'ABDULAZEEZ ADENIYI ABDULWAHEED', '044', 'RCP_evvz7j96psbx7gr', '496006', '23722806', 'azzeetech.it@gmail.com', '672358238511052515', '', '', '', '2022-01-27 13:14:30', 2, 1),
(87, 40000, 400, '0062343539', 'ABDULAZEEZ ADENIYI ABDULWAHEED', '044', 'RCP_evvz7j96psbx7gr', '496006', '23722806', 'azzeetech.it@gmail.com', '751075292675916776', '', '', NULL, '2022-01-27 13:17:59', 1, 1),
(88, 40000, 400, '0062343539', 'ABDULAZEEZ ADENIYI ABDULWAHEED', '044', 'RCP_evvz7j96psbx7gr', '496006', '23722806', 'azzeetech.it@gmail.com', '213511178450386118', '', '', '', '2022-01-27 13:45:27', 2, 1),
(89, 40000, 400, '0062343539', 'ABDULAZEEZ ADENIYI ABDULWAHEED', '044', 'RCP_evvz7j96psbx7gr', '496006', '23722806', 'azzeetech.it@gmail.com', '657899681932285337', '', '', '', '2022-01-27 13:47:08', 2, 1),
(90, 40000, 400, '0062343539', 'ABDULAZEEZ ADENIYI ABDULWAHEED', '044', 'RCP_evvz7j96psbx7gr', '496006', '23722806', 'azzeetech.it@gmail.com', '287202631489025357', '', '', '', '2022-01-27 13:48:08', 2, 1),
(91, 3000, 30, '0075353208', 'AHMED KABIRAT KEMI', '032', 'RCP_rex9o775pw7auwz', '496006', '24566571', 'johnibitoye@gmail.com', '949287316833361534', '', '', '', '2022-02-02 14:35:48', 2, 1),
(92, 3000, 30, '0075353208', 'AHMED KABIRAT KEMI', '032', 'RCP_rex9o775pw7auwz', '496006', '24566571', 'azzeetech.it@gmail.com', '665159784972839313', '', '', '', '2022-02-14 20:12:26', 2, 1),
(93, 3000, 30, '0075353208', 'AHMED KABIRAT KEMI', '032', 'RCP_rex9o775pw7auwz', '496006', '24566571', 'azzeetech.it@gmail.com', '208855158551237402', '', '', '', '2022-02-15 13:53:11', 2, 1),
(94, 3000, 30, '0075353208', 'AHMED KABIRAT KEMI', '032', 'RCP_rex9o775pw7auwz', '496006', '24566571', 'azzeetech.it@gmail.com', '927911201744401401', '', '', '', '2022-02-16 06:48:50', 2, 1),
(95, 3000, 30, '0075353208', 'AHMED KABIRAT KEMI', '032', 'RCP_rex9o775pw7auwz', '496006', '24566571', 'azzeetech.it@gmail.com', '830844545970162891', '', '', '', '2022-02-19 07:40:34', 2, 1),
(96, 3200, 32, '0075353208', 'AHMED KABIRAT KEMI', '032', 'RCP_rex9o775pw7auwz', '496006', '24566571', 'oyewalejohn@gmail.com', '595020498381495353', '', '', NULL, '2022-03-05 09:59:07', 0, 1),
(97, 3000, 30, '0034751694', 'ARIKEWUYOIMAM ADAM', '058', 'RCP_bfgrtvs62w35cwi', '496006', '27624372', 'oyewalejohn@gmail.com', '835626551507658765', '', '', NULL, '2022-03-22 09:02:09', 0, 1),
(98, 200, 2, '8527497868', 'MFY / Easy Access-Ade', '035', 'RCP_5ay63otu7wugg4h', '496006', '47543704', 'azzeetech.it@gmail.com', '154287118479839034', '', '', NULL, '2023-02-05 15:15:23', 0, 1),
(99, 500, 5, '1598779073', 'AHMAD ABDULLAHI AHMAD', '044', 'RCP_s09ih48thdihvwj', '1239512', '82257411', 'hassankamzahab@gmail.com', '568965009734855219', '', '', NULL, '2024-08-15 09:29:30', 0, 1);

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
(4, 'emmanueljunior433@gmail.com', 'emejulucodes', 'emejulucodes', 'private', 'emejulucodes', 'No 2 Ilechukwu Street, Inyaba Umudim', 'emma', 'No 2 Ilechukwu Street, Inyaba Umudim', '09039923365', 'emmanueljunior433@gmail.com', '../uploads/emejulucodes_proprietor_1_passport_1723707270.png', '../uploads/emejulucodes_proprietor_1_signature_1723707270.png', '987654323456', 'emejulucodes', 'No 2 Ilechukwu Street, Inyaba Umudim', '09039923365', 'emmanueljunior433@gmail.com', '../uploads/emejulucodes_proprietor_2_passport_1723707270.png', '../uploads/emejulucodes_proprietor_2_signature_1723707270.png', '34567890888', '2024-08-15 23:49:34.134138', 1, '../uploads/CAC_Document_cac_doc_1723780174.png');

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

--
-- Dumping data for table `discount_tbl`
--

INSERT INTO `discount_tbl` (`id`, `product_id`, `percentage_off`, `referal_share`, `agent`, `status`) VALUES
(2, 'airtel', 2, 0.5, 0, 1),
(3, 'mtn', 1.5, 0.5, 0, 1),
(4, 'glo', 2, 0.5, 0, 1),
(5, 'etisalat', 2, 0.5, 2, 1),
(6, 'dstv', 0.75, 0, 0, 1),
(7, 'airtel-data', 2, 0.5, 0, 1),
(8, 'mtn-data', 1.5, 0.5, 0, 1),
(9, 'glo-data', 2, 0.5, 0, 1),
(10, 'etisalat-data', 2, 0.5, 0, 1),
(11, 'gotv', 0.75, 0.5, 0, 1),
(12, 'startimes', 1.75, 0.5, 0, 1),
(13, 'ikeja-electric', 0.75, 0.5, 0, 1),
(14, 'eko-electric', 0.4, 0.5, 0, 1),
(15, 'waec', 65, 0.5, 0, 1),
(16, 'abuja-electric', 0.4, 0, 0, 1),
(17, 'kano-electric', 0.5, 0, 0, 1),
(18, 'portharcourt-electric', 0.1, 0, 0, 1),
(19, '?', 0, 0, 0, 1),
(20, 'smile', 2.5, 1, 0, 1),
(21, '?', 0, 0, 0, 1),
(22, 'jos-electric', 0.45, 0, 0, 1),
(23, 'smsclone', 1.5, 0.5, 0, 1),
(24, 'kaduna-electric', 0.75, 0, 0, 1),
(25, '9Mobile Airtime Pin', 2, 0.5, 0, 1),
(26, 'Third-Party Motor Insurance ? Universal Insurance', 400, 0, 0, 1),
(27, 'Smile Network Payment', 0.02, 0, 0, 1),
(28, 'ibadan-electric', 0.5, 0, 0, 1),
(29, 'cheap-data', 0, 1, 0, 1),
(31, 'result-pin-buy', 0, 1, 1, 1);

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
(1, 'website_url', 'https://linkify.com.ng/'),
(2, 'website_title', 'Linkify'),
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
(23, 'paystack_api', 'sk_test_b64a7bb2b34f6b2256f2a816aa6c598c2e5ec7f6'),
(24, 'reloaddly_api', 'eyJraWQiOiIwMDA1YzFmMC0xMjQ3LTRmNmUtYjU2ZC1jM2ZkZDVmMzhhOTIiLCJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMDM0NiIsImlzcyI6Imh0dHBzOi8vcmVsb2FkbHkuYXV0aDAuY29tLyIsImh0dHBzOi8vcmVsb2FkbHkuY29tL3NhbmRib3giOmZhbHNlLCJodHRwczovL3JlbG9hZGx5LmNvbS9wcmVwYWlkVXNlcklkIjoiMTAzNDYiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMiLCJhdWQiOiJodHRwczovL3RvcHVwcy1oczI1Ni5yZWxvYWRseS5jb20iLCJuYmYiOjE3MjE2NjQ0OTcsImF6cCI6IjEwMzQ2Iiwic2NvcGUiOiJzZW5kLXRvcHVwcyByZWFkLW9wZXJhdG9ycyByZWFkLXByb21vdGlvbnMgcmVhZC10b3B1cHMtaGlzdG9yeSByZWFkLXByZXBhaWQtYmFsYW5jZSByZWFkLXByZXBhaWQtY29tbWlzc2lvbnMiLCJleHAiOjE3MjY4NDg0OTcsImh0dHBzOi8vcmVsb2FkbHkuY29tL2p0aSI6IjFiNTAxNDIxLTRjZTYtNDFkZS05MjMyLTQ4NzIxOTQwMmM2NCIsImlhdCI6MTcyMTY2NDQ5NywianRpIjoiMTU5ZGRiZTYtNDNiMi00YThlLTliMDctYTI2Mzk0MjZmMTRlIn0.xW6U0wTIqgcRLLzacB3550PTSbeP30psmWBuNZ3F2Y0\n'),
(25, 'vtpass_username', 'softwareclone@gmail.com'),
(26, 'vtpass_password', 'PXE96KMR'),
(27, 'company_cac_price', '45000'),
(28, 'business_cac_price', '19000');

-- --------------------------------------------------------

--
-- Table structure for table `payment_discount_tbl`
--

CREATE TABLE `payment_discount_tbl` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `percentage` double NOT NULL,
  `refreal_share` int(1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_discount_tbl`
--

INSERT INTO `payment_discount_tbl` (`id`, `product_name`, `percentage`, `refreal_share`, `status`) VALUES
(1, 'mtn', 2, 0, 1),
(2, 'airtel', 0.001, 0, 1),
(3, 'glo', 0.002, 0, 1),
(4, 'etisalat', 0.002, 0, 1),
(5, 'dstv', 0.0005, 0, 1),
(6, 'gotv', 0.0005, 0, 1),
(7, 'startimes', 0.0005, 0, 1),
(8, 'abuja-electric', 0, 0, 1);

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
(171, '399985710713057000', 500, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-01-06 15:35:36'),
(172, '508326741244248359', 50, 'azzeetech.it@gmail.com', 1, 'success', 1, '2022-01-13 16:54:43'),
(173, '191108161818901343', 100, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-01-13 16:56:33'),
(174, '884096087214040894', 50, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-01-13 17:00:42'),
(175, '708797739786241051', 50, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-01-13 17:01:37'),
(176, '971220606278658530', 50, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-01-13 17:03:20'),
(177, '686574159893772792', 100, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-01-13 17:08:21'),
(178, '562319569244734703', 50, 'a.a.adeniyi1997@gmail.com', 0, 'pending', 1, '2022-01-15 17:14:08'),
(179, '340472585941951411', 50, 'a.a.adeniyi1997@gmail.com', 1, 'success', 1, '2022-01-15 22:54:05'),
(180, '144733751267844018', 150, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-01-19 13:28:44'),
(181, '202167623458472934', 500, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-01-19 13:30:11'),
(182, '460170333441890359', 1000, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-01-19 13:30:59'),
(183, '869603267646838652', 250, 'azzeetech.it@gmail.com', 1, 'success', 1, '2022-01-19 13:31:40'),
(184, '920278834893978125', 100, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2022-06-21 13:41:34'),
(185, '801435850584215191', 100, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2022-06-21 13:43:27'),
(186, '291858812597511601', 100, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2022-06-22 10:22:37'),
(187, '484816711399949829', 100, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2022-06-22 10:29:37'),
(188, '910544198969274352', 100, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2022-06-22 10:33:25'),
(189, '340557791599552236', 300, 'intellisensehq@gmail.com', 2, 'abandoned', 1, '2022-07-04 11:50:16'),
(190, '20220705130mytfu', 500, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-05 12:09:43'),
(191, '20220705190ztrac', 500, 'abdulkarimahmad303@gmail.com', 0, 'pending', 1, '2022-07-05 18:29:33'),
(192, '20220705200rnsbg', 1000, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-05 19:43:26'),
(193, '20220705220drvjc', 400, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-05 21:31:24'),
(194, '20220706010kmapq', 450, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 00:05:17'),
(195, '20220706010vhxhw', 450, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 00:16:35'),
(196, '20220706010fxuvh', 450, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 00:19:31'),
(197, '20220706020ulgdf', 450, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 01:22:07'),
(198, '20220706020shiwm', 450, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 01:23:20'),
(199, '20220706020qnmob', 450, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 01:24:04'),
(200, '20220706060cqwme', 459, 'intellisensehq@gmail.com', 2, 'abandoned', 1, '2022-07-06 05:20:12'),
(201, '20220706060tizqf', 450, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 05:54:04'),
(202, '20220706060tnirf', 450, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 05:54:36'),
(203, '20220706070dlxii', 200, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 06:03:47'),
(204, '20220706130ynwua', 50, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-06 12:44:40'),
(205, '20220706140magfn', 30, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 13:32:35'),
(206, '20220706140iakgh', 1000, 'saadnasir470@gmail.com', 0, 'pending', 1, '2022-07-06 13:59:28'),
(207, '20220706140oppdn', 200, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 13:59:34'),
(208, '20220706150xwjaq', 200, 'intellisensehq@gmail.com', 1, 'success', 1, '2022-07-06 14:08:30'),
(209, '20220706150ztqan', 100, 'intellisensehq@gmail.com', 1, 'success', 1, '2022-07-06 14:58:21'),
(210, '20220706160wlnbu', 300, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 15:20:40'),
(211, '20220706160hvknb', 300, 'intellisensehq@gmail.com', 1, 'success', 1, '2022-07-06 15:21:10'),
(212, '20220706160uhwaf', 500, 'princeishaq53@gmail.com', 0, 'pending', 1, '2022-07-06 15:43:08'),
(213, '20220706160uhnqv', 100, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 15:43:15'),
(214, '20220706180nqahe', 2000, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 17:56:47'),
(215, '20220706190lluyx', 2000, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 18:01:11'),
(216, '20220706190ootxw', 1000, 'intellisensehq@gmail.com', 0, 'pending', 1, '2022-07-06 18:03:16'),
(217, '20220706190xyfwa', 150, 'intellisensehq@gmail.com', 1, 'success', 1, '2022-07-06 18:20:52'),
(218, '20220706190quakg', 300, 'docty747@gmail.com', 0, 'pending', 1, '2022-07-06 18:58:48'),
(219, '20220707070fnpmg', 1000, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2022-07-07 06:19:03'),
(220, '20220707200wseoo', 1000, 'umarreal411@gmail.com', 0, 'pending', 1, '2022-07-07 19:14:34'),
(221, '20220707200xaxwh', 1000, 'umarreal411@gmail.com', 0, 'pending', 1, '2022-07-07 19:17:13'),
(222, '20220707200tjcwy', 1000, 'umarreal411@gmail.com', 0, 'pending', 1, '2022-07-07 19:21:39'),
(223, '20220707200mddrn', 1000, 'umarreal411@gmail.com', 1, 'success', 1, '2022-07-07 19:44:54'),
(224, '20220708090bsizz', 1000, 'Abdulhamidibrahim24@gmail.com', 0, 'pending', 1, '2022-07-08 08:32:56'),
(225, '20220710140ttbxz', 1000, 'bosunjj@gmail.com', 0, 'pending', 1, '2022-07-10 13:04:10'),
(226, '20220710150ezxyp', 50, 'ayshamuhammad5318@gmail.com', 0, 'pending', 1, '2022-07-10 14:18:48'),
(227, '20220710180knncr', 100, 'muhammadlawal6767@gmail.com', 0, 'pending', 1, '2022-07-10 17:23:47'),
(228, '20220710180xhmlq', 1000, 'muhammadlawal6767@gmail.com', 0, 'pending', 1, '2022-07-10 17:46:22'),
(229, '20220711120wdypk', 100, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-07-11 11:35:08'),
(230, '20220712190bxfrd', 500, 'alsadiqibrahim03@gmail.com', 0, 'pending', 1, '2022-07-12 18:13:36'),
(231, '20220715080mvhup', 1000, 'Abulazizahmad66@gmail.com', 0, 'pending', 1, '2022-07-15 07:24:27'),
(232, '20220715080walpb', 500, 'Abulazizahmad66@gmail.com', 0, 'pending', 1, '2022-07-15 07:32:51'),
(233, '20220716170elkow', 150, 'abdulganiyurabe73456@gmail.com', 0, 'pending', 1, '2022-07-16 16:44:18'),
(234, '20220717100gmkld', 500, 'alsadiqibrahim03@gmail.com', 0, 'pending', 1, '2022-07-17 09:59:37'),
(235, '20220717150feaxr', 200, 'muhammadibrahimmuhammed81@gmail.com', 0, 'pending', 1, '2022-07-17 14:32:51'),
(236, '20220717150wvecj', 1000, 'muhammadibrahimmuhammed81@gmail.com', 0, 'pending', 1, '2022-07-17 14:56:51'),
(237, '20220718160qdvgr', 1000, 'hamisusulaimanimam@gmail.com', 0, 'pending', 1, '2022-07-18 15:42:04'),
(238, '20220718160opqow', 200, 'hamisusulaimanimam@gmail.com', 0, 'pending', 1, '2022-07-18 15:43:05'),
(239, '20220719200upddk', 500, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-19 19:30:28'),
(240, '20220719200fbewh', 1000, 'hassanotu1986@gmail.com', 0, 'pending', 1, '2022-07-19 19:45:38'),
(241, '20220719200hswnz', 500, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-19 19:55:06'),
(242, '20220720150bczyp', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:12:27'),
(243, '20220720150dawgu', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:20:53'),
(244, '20220720150bxjwx', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:21:38'),
(245, '20220720150xpcyj', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:22:14'),
(246, '20220720150vrulj', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:23:56'),
(247, '20220720150ieuga', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:32:53'),
(248, '20220720150ixdtw', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:40:37'),
(249, '20220720150cmqup', 1, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:41:22'),
(250, '20220720150jwhzf', 1, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-07-20 14:48:08'),
(251, '20220720150ufjbu', 1, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-07-20 14:48:31'),
(252, '20220720150qnsek', 100, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-07-20 14:48:48'),
(253, '20220720150rnlzv', 1, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-07-20 14:50:55'),
(254, '20220720150ckszb', 1, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-07-20 14:54:28'),
(255, '20220720150lygma', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:54:37'),
(256, '20220720150lgvfh', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-20 14:55:19'),
(257, '20220721160cjmqs', 1000, 'hussainitayyib@gmail.com', 0, 'pending', 1, '2022-07-21 15:59:10'),
(258, '20220723100dqhhu', 5000, 'sanizakariumar@gmail.com', 1, 'success', 1, '2022-07-23 09:24:44'),
(259, '20220723160mdhxt', 100, 'sanizakariumar@gmail.com', 0, 'pending', 1, '2022-07-23 15:32:14'),
(260, '20220723230tttnt', 100, 'ahmadnurahussain13@gmail.com', 0, 'pending', 1, '2022-07-23 22:58:50'),
(261, '20220724000oydxh', 500, 'ahmadnurahussain13@gmail.com', 0, 'pending', 1, '2022-07-23 23:00:49'),
(262, '20220724080irobl', 500, 'shafiualiyu005@yahoo.com', 0, 'pending', 1, '2022-07-24 07:57:54'),
(263, '20220724090gfago', 100, 'sanizakariumar@gmail.com', 0, 'pending', 1, '2022-07-24 08:47:25'),
(264, '20220725010xqdlc', 1000, 'haliludada@yahoo.com', 0, 'pending', 1, '2022-07-25 00:11:37'),
(265, '20220725130glcjf', 300, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-25 12:38:21'),
(266, '20220725200jgtqn', 2500, 'umarreal411@gmail.com', 0, 'pending', 1, '2022-07-25 19:55:45'),
(267, '20220726210hlcko', 500, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-26 20:06:28'),
(268, '20220727180jhiet', 2000, 'sanizakariumar@gmail.com', 1, 'success', 1, '2022-07-27 17:33:19'),
(269, '20220729220hnkno', 2, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-07-29 21:28:02'),
(270, '20220730060hncdq', 100, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-30 05:27:15'),
(271, '20220730060udsws', 200, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-30 05:27:43'),
(272, '20220730060miiha', 500, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-30 05:29:28'),
(273, '20220730060oetux', 500, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-30 05:29:55'),
(274, '20220730060pkfho', 500, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-30 05:30:22'),
(275, '20220730060wchhd', 500, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-30 05:32:52'),
(276, '20220730060jsnxj', 500, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-07-30 05:36:45'),
(277, '20220730090bhinc', 500, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-07-30 08:27:23'),
(278, '20220804080fglsf', 100, 'azzeetech.it@gmail.com', 0, 'pending', 1, '2022-08-04 07:43:15'),
(279, '20220804110skwpt', 3000, 'sanizakariumar@gmail.com', 0, 'pending', 1, '2022-08-04 10:57:36'),
(280, '20220805200ohxka', 100, 'hamisusulaimanimam@gmail.com', 0, 'pending', 1, '2022-08-05 19:43:23'),
(281, '20220811190zdqfe', 200, 'mz1929@yahoo.com', 0, 'pending', 1, '2022-08-11 18:47:14'),
(282, '20220813100uqcto', 1000, 'hussainitayyib@gmail.com', 0, 'pending', 1, '2022-08-13 09:19:09'),
(283, '20220814190bahte', 1000, 'sanikaojeimran@gmai.com', 0, 'pending', 1, '2022-08-14 18:51:38'),
(284, '20220814190xrmtw', 1000, 'sanikaojeimran@gmai.com', 0, 'pending', 1, '2022-08-14 18:51:56'),
(285, '20220816030dxrdw', 200, 'alsadiqibrahim03@gmail.com', 0, 'pending', 1, '2022-08-16 02:14:11'),
(286, '20220816040mfasd', 1000, 'sanizakariumar@gmail.com', 1, 'success', 1, '2022-08-16 03:41:58'),
(287, '20220816180juhtb', 200, 'alsadiqibrahim03@gmail.com', 0, 'pending', 1, '2022-08-16 17:37:42'),
(288, '20220816180hcwoh', 200, 'alsadiqibrahim03@gmail.com', 0, 'pending', 1, '2022-08-16 17:39:26'),
(289, '20220816180ahjbd', 200, 'alsadiqibrahim03@gmail.com', 0, 'pending', 1, '2022-08-16 17:41:57'),
(290, '20220823080wgxfo', 700, 'sanizakariumar@gmail.com', 0, 'pending', 1, '2022-08-23 07:05:29'),
(291, '20220823080glaax', 800, 'sanizakariumar@gmail.com', 0, 'pending', 1, '2022-08-23 07:06:49'),
(292, '20220910130iidgu', 2000, 'jamilusha77@gmail.com', 0, 'pending', 1, '2022-09-10 12:44:21'),
(293, '20220910150wqzsk', 2000, 'jamilusha77@gmail.com', 0, 'pending', 1, '2022-09-10 14:15:04'),
(294, '20220910150rwkfr', 200, 'jamilusha77@gmail.com', 0, 'pending', 1, '2022-09-10 14:16:24'),
(295, '20220910150trsxr', 200, 'jamilusha77@gmail.com', 0, 'pending', 1, '2022-09-10 14:25:06'),
(296, '20220917110xcdpa', 200, 'princeishaq53@gmail.com', 0, 'pending', 1, '2022-09-17 10:40:21'),
(297, '20220917110dnnca', 200, 'princeishaq53@gmail.com', 0, 'pending', 1, '2022-09-17 10:57:09'),
(298, '20220918150sdlte', 200, 'princeishaq53@gmail.com', 1, 'success', 1, '2022-09-18 14:06:10'),
(299, '950452057686576586', 100, 'softwareclone@gmail.com', 0, 'pending', 1, '2022-11-12 02:41:51'),
(300, '428570233408889675', 100, 'softwareclone@gmail.com', 0, 'pending', 1, '2023-02-10 14:48:56'),
(301, '888606013545148781', 2500, 'ameeralhassan79@gmail.com', 0, 'pending', 1, '2023-02-16 19:26:23'),
(302, '618793032645446029', 2500, 'ameeralhassan79@gmail.com', 0, 'pending', 1, '2023-02-16 21:41:22'),
(303, '886602335964604740', 1000, 'ameeralhassan79@gmail.com', 0, 'pending', 1, '2023-02-18 05:26:34'),
(304, '454201290423861661', 2000, 'ameeralhassan79@gmail.com', 0, 'pending', 1, '2023-02-21 21:46:16'),
(305, '749165246329703926', 2000, 'ameeralhassan79@gmail.com', 0, 'pending', 1, '2023-02-21 21:47:25'),
(306, '439072092764940695', 1000, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-19 16:34:45'),
(307, '999580783863421685', 200, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-19 16:43:48'),
(308, '136823076186747246', 200, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-19 16:44:01'),
(309, '477578307661092261', 200, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-19 16:44:18'),
(310, '229571339119230829', 400, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-19 20:35:40'),
(311, '584006354630545873', 200, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-19 20:36:04'),
(312, '845607908650030046', 2000, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-20 06:44:53'),
(313, '338016527660750153', 500, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-20 21:13:30'),
(314, '233436799692407836', 500, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-22 13:25:33'),
(315, '381082001912573394', 3000, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-23 09:44:25'),
(316, '765749967772039335', 1000, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-27 19:53:13'),
(317, '781227309272025923', 5000, 'mubarakmusa029@gmail.com', 0, 'pending', 1, '2023-04-30 19:30:41'),
(318, '157262667954544064', 500, 'softwareclone@gmail.com', 0, 'pending', 1, '2023-08-21 15:46:30'),
(319, '458963958733978032', 500, 'softwareclone2024@gmail.com', 0, 'pending', 1, '2024-07-18 07:18:23'),
(320, '573464047289851700', 500, 'softwareclone2024@gmail.com', 0, 'pending', 1, '2024-07-18 07:18:43'),
(321, '861959517871063046', 200, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2024-07-20 11:11:41'),
(322, '411722046512763038', 500, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2024-07-20 11:11:55'),
(323, '654702620604399807', 500, 'hassankamzahab@gmail.com', 0, 'pending', 1, '2024-07-20 11:58:56'),
(324, '873162370194588312', 200, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2024-07-20 12:00:02'),
(325, '746899566460161051', 500, 'hassankamzahab@gmail.com', 1, 'success', 1, '2024-07-20 12:35:18'),
(326, '825398483471622979', 10000, 'hassankamzahab@gmail.com', 1, 'success', 1, '2024-07-20 12:47:45'),
(327, '492963116970374561', 5000, 'kamzahabsolutions@gmail.com', 1, 'success', 1, '2024-07-20 14:17:53'),
(328, '266011125859851707', 200, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2024-07-21 08:09:22'),
(329, '123662803181990158', 200, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2024-07-22 18:23:36'),
(330, '663268466267934113', 500, 'insaffanigltd@gmail.com', 1, 'success', 1, '2024-07-22 19:51:10'),
(331, '732091206957213123', 500, 'insaffanigltd@gmail.com', 0, 'pending', 1, '2024-07-22 19:54:40'),
(332, '722712183376111143', 5000, 'insaffanigltd@gmail.com', 0, 'pending', 1, '2024-07-22 20:44:08'),
(333, '365849369908134481', 100, 'raypeter053@gmail.com', 0, 'pending', 1, '2024-07-23 21:00:23'),
(334, '241349719259982102', 100, 'orkuma.mike70@gmail.com', 0, 'pending', 1, '2024-08-05 18:50:15'),
(335, '928854706794050383', 5000, 'hassankamzahab@gmail.com', 0, 'pending', 1, '2024-08-15 09:21:31'),
(336, '752678777758951303', 5000, 'mahmudmohad95@gmail.com', 0, 'pending', 1, '2024-08-15 17:20:12'),
(337, '794539202690614284', 1000, 'paulsonbosah@gmail.com', 0, 'pending', 1, '2024-09-10 14:29:07'),
(338, '831114169175212851', 1000, 'paulsonbosah@gmail.com', 0, 'pending', 1, '2024-09-10 14:30:21'),
(339, '950897721248057286', 1000, 'insaffanigltd@gmail.com', 0, 'pending', 1, '2024-09-10 22:55:59'),
(340, '728243886294616851', 2000, 'insaffanigltd@gmail.com', 0, 'pending', 1, '2024-09-27 11:46:21'),
(341, '862618130630239912', 2000, 'insaffanigltd@gmail.com', 0, 'pending', 1, '2024-09-27 14:54:05'),
(342, '241201337572517213', 500, 'ajuwonoluwa@gmail.com', 0, 'pending', 1, '2024-10-20 10:29:20'),
(343, '230988526257314928', 2000, 'insaffanigltd@gmail.com', 1, 'success', 1, '2024-10-31 21:35:32');

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

--
-- Dumping data for table `referal_earn_transaction_tbl`
--

INSERT INTO `referal_earn_transaction_tbl` (`id`, `buyer_email`, `referal_email`, `earn_amount`, `trans_id`, `date_trans`, `status`) VALUES
(1, 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 0, '787639765113019766', '2022-01-15 13:54:02', 1),
(2, 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 2, '819025561902550547', '2022-01-15 14:12:42', 1),
(3, 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 7, '771153898584975330', '2022-01-15 15:39:21', 1),
(4, 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 2, '280516893648582607', '2022-01-19 16:01:59', 1),
(5, 'adeniyi@taweer.com', 'azzeetech.it@gmail.com', 2, '151992348214341398', '2022-01-20 22:24:30', 1),
(6, 'adeniyi@taweer.com', 'azzeetech.it@gmail.com', 3, '500275891798900513', '2022-01-21 15:40:13', 1),
(7, 'adeniyi@taweer.com', 'azzeetech.it@gmail.com', 3, '184540787401054551', '2022-01-21 15:56:52', 1),
(8, 'adeniyi@taweer.com', 'azzeetech.it@gmail.com', 3, '537175469818389189', '2022-01-22 07:03:19', 1),
(9, 'sanilawanumar@gmail.com', 'intellisensehq@gmail.com', 3, '20220707120ccjjh', '2022-07-07 11:26:34', 1),
(10, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220710160gudoc', '2022-07-10 15:13:48', 1),
(11, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220710210ttesh', '2022-07-10 20:20:31', 1),
(12, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220711100loxlz', '2022-07-11 09:50:33', 1),
(13, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 1, '20220712220eqwvn', '2022-07-12 21:12:51', 1),
(14, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220714140jnhfn', '2022-07-14 13:50:41', 1),
(15, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220714180yqkoh', '2022-07-14 17:32:53', 1),
(16, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 3, '20220714210agndf', '2022-07-14 20:39:07', 1),
(17, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 3, '20220714210kgekt', '2022-07-14 20:49:39', 1),
(18, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 3, '20220714220bqbsv', '2022-07-14 21:04:19', 1),
(19, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 5, '20220714220bqvbn', '2022-07-14 21:12:07', 1),
(20, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 12, '20220715100ssxhr', '2022-07-15 09:15:15', 1),
(21, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 1, '20220715110ohifo', '2022-07-15 10:40:44', 1),
(22, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220715210syguu', '2022-07-15 20:39:28', 1),
(23, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220715210ndhce', '2022-07-15 20:41:43', 1),
(24, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220716120ocmub', '2022-07-16 11:43:17', 1),
(25, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 9, '20220716160naksh', '2022-07-16 15:47:14', 1),
(26, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 1, '20220716230cchtm', '2022-07-16 22:11:00', 1),
(27, 'alsadiqibrahim03@gmail.com', 'azzeetech.it@gmail.com', 1, '20220717120eoisv', '2022-07-17 11:33:26', 1),
(28, 'alsadiqibrahim03@gmail.com', 'azzeetech.it@gmail.com', 3, '20220717120qnbyv', '2022-07-17 11:35:34', 1),
(29, 'alsadiqibrahim03@gmail.com', 'azzeetech.it@gmail.com', 1, '20220717130ognhm', '2022-07-17 13:00:07', 1),
(30, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220718100wyiwf', '2022-07-18 09:35:15', 1),
(31, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 3, '20220718160sqvus', '2022-07-18 15:40:10', 1),
(32, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220718210rjyia', '2022-07-18 20:41:41', 1),
(33, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220719190dqcbx', '2022-07-19 18:45:48', 1),
(34, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 5, '20220719200lksvw', '2022-07-19 19:28:11', 1),
(35, 'sanilawanumar@gmail.com', 'intellisensehq@gmail.com', 3, '20220721180wrgsq', '2022-07-21 17:15:24', 1),
(36, 'alsadiqibrahim03@gmail.com', 'azzeetech.it@gmail.com', 5, '20220721220rsrwh', '2022-07-21 21:04:44', 1),
(37, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 5, '20220722120zckwf', '2022-07-22 11:39:06', 1),
(38, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 3, '20220722140hoyvr', '2022-07-22 13:21:38', 1),
(39, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 1, '20220722160myojo', '2022-07-22 15:27:52', 1),
(40, 'alsadiqibrahim03@gmail.com', 'azzeetech.it@gmail.com', 1, '20220722230bvsea', '2022-07-22 22:18:09', 1),
(41, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 1, '20220723080fjlcj', '2022-07-23 07:50:36', 1),
(42, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 5, '20220723090kdgrq', '2022-07-23 08:01:13', 1),
(43, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 1, '20220723120inmdy', '2022-07-23 11:47:20', 1),
(44, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 1, '20220723140ldfgq', '2022-07-23 13:35:10', 1),
(45, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 5, '20220723180zihrx', '2022-07-23 17:34:40', 1),
(46, 'alsadiqibrahim03@gmail.com', 'azzeetech.it@gmail.com', 2, '20220724120ffebm', '2022-07-24 11:04:46', 1),
(47, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220725120yvaqg', '2022-07-25 11:09:13', 1),
(48, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 3, '20220725120myrib', '2022-07-25 11:13:01', 1),
(49, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 5, '20220725120wizuq', '2022-07-25 11:25:33', 1),
(50, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 2, '20220725200zdgov', '2022-07-25 19:01:45', 1),
(51, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 3, '20220725210khfty', '2022-07-25 20:34:29', 1),
(52, 'haliludada@yahoo.com', 'muhammadraji@gmail.com', 2, '20220726010yhxtx', '2022-07-26 00:25:18', 1),
(53, 'muhammadraji@gmail.com', 'intellisensehq@gmail.com', 2, '20220726060guipc', '2022-07-26 05:13:43', 1),
(54, 'ahmadhy44@gmail.com', 'muhammadraji@gmail.com', 2, '20220726230skhti', '2022-07-26 22:06:00', 1),
(55, 'muhammadraji@gmail.com', 'intellisensehq@gmail.com', 1, '20220728010jtfkr', '2022-07-28 00:13:24', 1),
(56, 'haliludada@yahoo.com', 'muhammadraji@gmail.com', 1, '20220728030kquyx', '2022-07-28 02:08:29', 1),
(57, 'ahmadhy44@gmail.com', 'muhammadraji@gmail.com', 1, '20220728190xhtsw', '2022-07-28 18:28:00', 1),
(58, 'muhammadraji@gmail.com', 'intellisensehq@gmail.com', 1, '20220731160oitwc', '2022-07-31 15:49:47', 1),
(59, 'muhammadraji@gmail.com', 'intellisensehq@gmail.com', 1, '20220803190kqfwn', '2022-08-03 18:57:01', 1),
(60, 'haliludada@yahoo.com', 'muhammadraji@gmail.com', 1, '20220805040rceyv', '2022-08-05 03:21:15', 1),
(61, 'hamisusulaimanimam@gmail.com', 'azzeetech.it@gmail.com', 5, '20220806200qntjs', '2022-08-06 19:29:36', 1),
(62, 'sanilawanumar@gmail.com', 'intellisensehq@gmail.com', 8, '20220809210sgnvd', '2022-08-09 20:26:29', 1),
(63, 'sanilawanumar@gmail.com', 'intellisensehq@gmail.com', 1, '20220809210aikpc', '2022-08-09 20:29:36', 1),
(64, 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 5, '553262807886885527', '2022-11-23 21:25:47', 1),
(65, 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 3, '482407515940741136', '2022-11-23 21:27:06', 1),
(66, 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 5, '20221126200dswvl', '2022-11-26 19:09:47', 1),
(67, 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 5, '20221201000lqlcu', '2022-11-30 23:22:13', 1),
(68, 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 5, '20221201120wgghf', '2022-12-01 11:08:12', 1),
(69, 'hassankamzahab@gmail.com', 'mahmudmohad95@gmail.com', 1, '680949386468890195', '2024-07-22 20:55:49', 1);

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

--
-- Dumping data for table `referal_tbl`
--

INSERT INTO `referal_tbl` (`id`, `referal`, `referee`, `status`, `date_refer`) VALUES
(4, 'faea4e0421343dc375631b6de8ad6aaa', '1a657588263da042203624cdcea97b3b', 1, '2022-01-15 13:51:06'),
(5, 'faea4e0421343dc375631b6de8ad6aaa', '83984cea2833f99e8509c29b0446cb4d', 1, '2022-01-19 16:38:54'),
(6, '3374fd81f85d5c79f50ae38f614a9430', '548058393319939e34b985b0ac4c29e0', 1, '2022-07-07 11:22:19'),
(7, 'faea4e0421343dc375631b6de8ad6aaa', '6e6f44764ce859cbe3fae96243a5c6d8', 1, '2022-07-10 14:12:38'),
(8, 'faea4e0421343dc375631b6de8ad6aaa', '5478b7f39aebe7864da24d09ac6998e8', 1, '2022-07-10 15:00:59'),
(9, 'faea4e0421343dc375631b6de8ad6aaa', '46758f31dd91102b0c6a26d446416d2d', 1, '2022-07-11 10:52:28'),
(10, 'faea4e0421343dc375631b6de8ad6aaa', '72ea83a4c53d0978ac50b922bde60e63', 1, '2022-07-13 21:24:42'),
(11, '3374fd81f85d5c79f50ae38f614a9430', '1fed2b87b4f6a7c1b946c2162e383b9a', 1, '2022-07-24 13:07:20'),
(12, '1fed2b87b4f6a7c1b946c2162e383b9a', 'b1caa78555d875633d9a83bd810bdcab', 1, '2022-07-24 18:36:45'),
(13, '1fed2b87b4f6a7c1b946c2162e383b9a', '344b6f6ecdb911edb4f88c85f409a531', 1, '2022-07-25 00:07:26'),
(14, '1fed2b87b4f6a7c1b946c2162e383b9a', '8e087a2b20774cb9b56c797893f83f08', 1, '2022-08-10 09:09:16'),
(15, '9fbf36664b3c46ec5401ecfe0162eb7a', '2216df89fdf50edc767d653443284ad4', 1, '2022-09-19 14:44:26'),
(16, '93276d0b8aef98d7767be69e0820576a', '5bf3bf88675da002f3ad8e3cf23da04d', 1, '2024-07-20 11:57:53'),
(17, '5bf3bf88675da002f3ad8e3cf23da04d', '3dec19972b8391288bc2836d1b920191', 1, '2024-07-20 14:16:17');

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
(1, 'waec', 1570, 1750, 1, '2022-01-12 08:36:33'),
(2, 'neco', 705, 755, 1, '2022-01-12 08:36:33'),
(3, 'nabteb', 680, 770, 1, '2022-01-12 08:37:37'),
(4, 'nbais', 883, 975, 1, '2022-01-12 08:37:37');

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

--
-- Dumping data for table `save_pin_and_token_buy`
--

INSERT INTO `save_pin_and_token_buy` (`id`, `pin`, `serial_no`, `email`, `trans_id`, `status`, `date_buy`, `super_admin`) VALUES
(1, '274619254068', NULL, 'azzeetech.it@gmail.com', '572933866254035656', 1, '2022-01-18 15:38:59', 1),
(2, 'Token: 5601  8101  2074  4221  5749  ', NULL, 'azzeetech.it@gmail.com', '20220708200gqiob', 1, '2022-07-08 19:26:04', 1),
(3, 'Token: 1420  1020  8665  7075  2882  ', NULL, 'umarreal411@gmail.com', '20220709210bwrnp', 1, '2022-07-09 20:15:37', 1),
(4, 'Token: 5754  5968  3838  6691  7172  ', NULL, 'saadnasir470@gmail.com', '20220711220isqah', 1, '2022-07-11 21:23:12', 1),
(5, 'Token: 7043  7694  7790  6959  1461  ', NULL, 'azzeetech.it@gmail.com', '20220714010ewfyt', 1, '2022-07-14 00:30:30', 1),
(6, 'Token: 1123  9952  8378  9541  3196  ', NULL, 'saadnasir470@gmail.com', '20220719220atstj', 1, '2022-07-19 21:27:59', 1),
(7, 'Token: 6314  4020  5793  2966  4022  ', NULL, 'sanizakariumar@gmail.com', '20220723100qwhtm', 1, '2022-07-23 09:42:48', 1),
(8, 'Token: 1696  1397  6527  2795  3179  ', NULL, 'sanizakariumar@gmail.com', '20220807120iyasu', 1, '2022-08-07 11:05:04', 1),
(9, 'Token: 2643  5426  9832  1950  1398  ', NULL, 'azzeetech.it@gmail.com', '20220810190ywlgp', 1, '2022-08-10 18:41:02', 1),
(10, 'Token: 0159  6153  4950  7926  0019  ', NULL, 'azzeetech.it@gmail.com', '20220810230ajori', 1, '2022-08-10 22:10:22', 1),
(11, 'Token: 0066  4739  7248  8678  2553  ', NULL, 'azzeetech.it@gmail.com', '20220823230wbkwj', 1, '2022-08-23 22:53:12', 1),
(12, 'Token: 5164  7027  0404  2427  0586  ', NULL, 'azzeetech.it@gmail.com', '20220824090ferac', 1, '2022-08-24 08:17:14', 1),
(13, 'Token: 1628  5406  6221  9938  9126  ', NULL, 'azzeetech.it@gmail.com', '20220831080gkequ', 1, '2022-08-31 07:31:01', 1),
(14, 'Token: 5710  0432  1843  0198  7724  ', NULL, 'azzeetech.it@gmail.com', '20220901230nqwud', 1, '2022-09-01 22:40:33', 1);

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
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sme_data_tbl`
--

INSERT INTO `sme_data_tbl` (`id`, `plan_id`, `network_id`, `direct_price`, `our_price`, `data_bundle`, `data_duration`, `status`) VALUES
(1, 60, 4, 483, 500, '750.0 MB', '1 month', 0),
(2, 61, 4, 925, 950, '1.5 GB', '1 month', 0),
(3, 62, 4, 1110, 1150, '2.0 GB', '1 month', 0),
(4, 63, 4, 1390, 1430, '3.0 GB', '1 month', 0),
(5, 64, 2, 460, 490, '1.35 GB', '1 month', 0),
(6, 65, 2, 920, 950, '2.9 GB', '1 month', 0),
(7, 67, 2, 1840, 1870, '5.8 GB', '1 month', 0),
(8, 68, 2, 2300, 2330, '7.7 GB', '1 month', 0),
(9, 73, 3, 940, 970, '1.5 GB', '1 month', 0),
(10, 74, 3, 1128, 1160, '2.0 GB', '1 month', 0),
(11, 75, 3, 1410, 1440, '3.0 GB', '1 month', 0),
(12, 76, 3, 1880, 1910, '4.5 GB', '1 month', 0),
(13, 77, 3, 3760, 3790, '11.0 GB', '1 month', 0),
(14, 78, 3, 4700, 4730, '15.0 GB', '1 month', 0),
(15, 79, 4, 1850, 1880, '4.5 GB', '1 month', 0),
(16, 80, 4, 2313, 2350, '6.0 GB', '1 month', 0),
(17, 81, 4, 2895, 2930, '8.0 GB', '1 month', 0),
(18, 82, 4, 3860, 3900, '11.0 GB', '1 month', 0),
(19, 83, 4, 4825, 4850, '15.0 GB', '1 month', 0),
(20, 106, 1, 261, 265, '1.0 GB', '1 month', 0),
(21, 107, 1, 440, 470, '2.0 GB', '1 month', 0),
(22, 108, 1, 660, 700, '3.0 GB', '1 month', 0),
(23, 109, 1, 1100, 1130, '5.0 GB', '1 month', 0),
(24, 112, 2, 2760, 2800, '10.0 GB', '1 month', 0),
(25, 113, 2, 3680, 3710, '13.25 GB', '1 month', 0),
(26, 114, 2, 4600, 4630, '18.25 GB', '1 month', 0),
(27, 115, 2, 7360, 7390, '29.5 GB', '1 month', 0),
(28, 116, 2, 1380, 1410, '4.1 GB', '1 month', 0),
(29, 118, 1, 261, 270, '1.0 GB', '1 month', 0),
(30, 119, 1, 480, 510, '2.0 GB', '1 month', 0),
(31, 120, 1, 720, 750, '3.0 GB', '1 month', 0),
(32, 121, 1, 1200, 1230, '5.0 GB', '1 month', 0),
(33, 124, 6, 1510, 1540, '3.0 GB', '1 month', 0),
(34, 125, 2, 9200, 9230, '50.0 GB', '1 month', 0),
(35, 126, 6, 495, 520, '1.0 GB', '1 month', 0),
(36, 127, 6, 985, 1020, '1.5 GB', '1 month', 0),
(37, 128, 6, 1180, 1210, '2.0 GB', '1 month', 0),
(38, 129, 6, 1475, 1500, '3.0 GB', '1 month', 0),
(39, 130, 6, 1970, 2000, '5.0 GB', '1 month', 0),
(40, 131, 6, 2470, 2500, '6.5 GB', '1 month', 0),
(41, 132, 6, 2950, 2980, '8.0 GB', '1 month', 0),
(42, 133, 6, 3430, 3460, '10.0 GB', '1 month', 0),
(43, 134, 6, 4950, 4980, '15.0 GB', '1 month', 0),
(44, 135, 6, 5900, 5930, '20.0 GB', '1 month', 0),
(45, 136, 6, 7850, 7880, '30.0 GB', '1 month', 0),
(46, 137, 6, 9850, 9880, '40.0 GB', '1 month', 0),
(47, 138, 6, 19600, 19630, '90.0 GB', '1 month', 0),
(48, 139, 6, 33500, 33530, '160.0 GB', '1 month', 0),
(49, 140, 1, 120, 150, '500.0 MB', '1 month', 0),
(50, 142, 3, 9400, 9430, '40.0 GB', '1 month', 0),
(51, 143, 3, 14100, 14130, '75.0 GB', '1 month', 0),
(52, 144, 1, 2200, 2230, '10.0 GB', '1 month', 0),
(53, 145, 4, 9650, 9680, '40.0 GB', '1 month', 0),
(54, 146, 4, 14475, 14500, '75.0 GB', '1 month', 0),
(55, 147, 4, 19300, 19330, '110.0 GB', '1 month', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sme_data_type_tbl`
--

CREATE TABLE `sme_data_type_tbl` (
  `id` int(11) NOT NULL,
  `data_type` varchar(255) NOT NULL,
  `network_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sme_data_type_tbl`
--

INSERT INTO `sme_data_type_tbl` (`id`, `data_type`, `network_id`, `status`) VALUES
(1, 'GIFTING', 1, 1),
(2, 'SME', 1, 1);

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
(46, 'dashboard/resultchecker/neco', 'NECO Result Checker PIN', 22, 3, '', 1),
(47, 'dashboard/cheap-data', 'SME/Cheap Data', 18, 3, '', 1),
(48, 'dashboard/resultchecker/waec', 'WAEC Result Checker PIN', 22, 3, '', 1),
(49, 'dashboard/change-pass-pin', '', 0, 3, '', 1),
(50, 'dashboard/transfer-wallet-money', 'Transfer to other Wallet', 7, 3, '', 1),
(51, 'dashboard/resultchecker/nabteb', 'NABTEB Result Checker PIN', 22, 3, '', 1),
(52, 'dashboard/resultchecker/nbais', 'NBAIS Result Checker PIN', 22, 3, '', 1),
(54, 'dashboard/my-earn', 'My Earning', 7, 3, '', 1),
(55, 'dashboard/request-cashout', 'Cash-Out Now', 26, 3, '', 1),
(56, 'dashboard/my-cashout-history', 'Cash-Out History', 26, 3, '', 1),
(57, 'dashboard/my-pin-and-token-trans', 'My Pin And Token History', 23, 3, '', 1),
(58, 'dashboard/manage-discount', 'Manage Discount', 17, 1, '', 1),
(59, 'dashboard/manage-sme-data', 'Manage SME/Cheap Data', 17, 1, '', 1),
(60, '', 'DashBoard Notification', 28, 1, '', 1),
(61, '', 'Email Notification', 28, 1, '', 1),
(62, 'dashboard/manage-business-cac', 'Business CAC Requests', 15, 1, '.', 1),
(63, 'dashboard/cac-status', 'CAC status', 16, 3, '.', 1),
(64, 'dashboard/submit-cac-company', 'Company Registration', 16, 3, '.', 1),
(65, 'dashboard/submit-cac-business', 'Business Name Registration', 16, 3, '.', 1),
(66, 'dashboard/cac-settings', 'CAC Settings', 15, 1, '.', 1),
(67, 'dashboard/manage-company-cac', 'Company CAC Requests', 15, 1, '.', 1);

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
(4, 'azzeetech.it@gmail.com', '$2y$10$AfI3cnoizxxUMT1m61jhp.77Qut4qNnVkGE/EczWmpmZiHyt.up82', '$2y$10$akgLrWmq0MnqKGBCPdECrObedm5Pe6PUsl2Ki8nWJZk2onargpEFW', '2022-02-09 14:26:49', 1),
(5, 'azzeetech.it@gmail.com', '$2y$10$Em4d/e60K03YDzVA4c0/9eH.4kQ8QHu7R7F3O/jBBYc6S7lISQ.Pi', '$2y$10$3vG4BuAz9/YaNnU6PEmy.ueGKVtbXWJxRCqL77nZJPjxxDeDumbku', '2022-02-09 14:31:36', 1),
(6, 'azzeetech.it@gmail.com', '$2y$10$1Q1FuXJC1UlzGEFVD0GEu.bpHpaEs/2FCGF2uHJictKAUmzjwRu.W', '$2y$10$ubRw6t93Uzt8v6v8TazBteF6ESh0p4pY6NgP4Pv8D5y0X9yTESJv2', '2022-02-14 14:53:30', 1),
(7, 'azzeetech.it@gmail.com', '$2y$10$m5Fw1hELyeZahqHw9NQ6HuQhy11aZkPDJlyUXMI6uQwxT1OtPNhAy', '$2y$10$haYrw0XjLwH30H1hupK2CeeNcbknZe5jRS9BBu1r5GnGHumhBkKAq', '2022-02-16 23:04:40', 1),
(8, 'a.a.adeniyi1997@gmail.com', '$2y$10$r9chX0h1MwA3dKAmiMdjLej4fXSm1iohNztbYFdO4R1fJDq8hS7w.', '$2y$10$qbhkV4WpAFHjFb.eyWArKeIWhK7euB5LdPL95l/F0VUmbA8vWEaJ6', '2022-02-18 16:49:44', 1),
(9, 'azzeetech.it@gmail.com', '$2y$10$jz4zSZr8WnCCBj2U88uBz.HtcKUP0SKpyrF5sxdQTJ9gozt1TqDri', '$2y$10$Rk57vhjow5vnBc7.ExLujuCFeAocoTVBO5qZcRtmWWfxfzbQ7.1rG', '2022-02-18 17:36:05', 1),
(10, 'azzeetech.it@gmail.com', '$2y$10$DTR9thwu0VeHWAiT/07hN.bXC1cSHzpBl2CiVo6w5IrrCR.WcRLNO', '$2y$10$/wLNCZmiPERzgsdZOav5POHErE/koIdZbKkN09H1.nu6nbRaHtlQu', '2022-02-18 17:36:26', 1),
(11, 'azzeetech.it@gmail.com', '$2y$10$tDyofnraCm11J0LdffVpjuZkgvHOPOBLcfKlWIEtgLJ41jK3B43Qu', '$2y$10$p0WENVZ2RB47sFLFw5ra/.Y9Q42aBEZoMwGH6hJbgS2XXm9sGgT4G', '2022-02-18 17:38:05', 1),
(12, 'azzeetech.it@gmail.com', '$2y$10$OQK5zKJZKIHDtVAP1dW1y.gCJY5Yo2ZEUxsJkw1MsUaeU59Wi8nO2', '$2y$10$ENnvJPJpOoUKCsito4ezj.g3j7sZ3ZvJYMXVle17R0aNw3mkBTAAq', '2022-02-21 13:18:34', 1),
(13, 'azzeetech.it@gmail.com', '$2y$10$XP3JlcaERpbd40K69IzSx.orHMlPPH02ozxLOHY2dm4oXNVR3LSZO', '$2y$10$hJBylplFNs8TUxy06PBM2u7PPUadwQbWNeZCSO54W.TqvBjCqXbMu', '2022-02-26 00:27:34', 1),
(14, 'azzeetech.it@gmail.com', '$2y$10$930WToTcPW2ETSY8Fpb83uU7Ievk5M1IyZIAI.NOWh6KSIkD40.ZC', '$2y$10$/fMdqk/Dhk/8XFXnFIL26uSc8px7TPDDHqUYHLwpV1SvXg4KNxKVy', '2022-03-01 18:27:44', 1),
(15, 'azzeetech.it@gmail.com', '$2y$10$n9ScVm8iMHVLNQYMLeXNOOqKB4aAlxqRIpdD3rXboiRcG.sok7XsO', '$2y$10$Das6jHdpThdBXkXtD/S//eRcvmZXwhxzaoWJ28j3vl9IeXs2I0dBy', '2022-03-01 18:28:45', 1),
(16, 'azzeetech.it@gmail.com', '$2y$10$S7O0CYtLzXK8UtQJL53ztOfYyIwtPjg70X5uBHrlaRMlz/qYl1DQ2', '$2y$10$3MdrKhltH3DOHPh1r9sut.N6yxs.QHjr9/1XpQL.t4toDmHEI4jgG', '2022-03-01 18:31:53', 1),
(17, 'azzeetech.it@gmail.com', '$2y$10$sA4IjqHZzmEe/7l4eb1rIe/iFz2LF95WJElBaF6fYKpkbdWSU06HW', '$2y$10$QEGcvZHEuta.fQngAK3zcewHu.lgAHPRLT2uW7TEZFgmXFcejZGim', '2022-03-01 18:32:38', 1),
(18, 'azzeetech.it@gmail.com', '$2y$10$/X4fLKNriQy2TlgzOJgC.uinwbYC4mpELVlw/nAZAmOqycnTnuYYG', '$2y$10$MEjWjM8yfWo8Br5L403z5OmZHxBseNfaKYDCPwSjx83lWAInx7R3a', '2022-03-01 18:34:08', 1),
(19, 'azzeetech.it@gmail.com', '$2y$10$pCaA2efQb.LOMo5RB9fMiuZIZ27LOjMVDMfwYatkgXwMAnas2bMnS', '$2y$10$ZZqbmLLQm4WytA0qi/9bXue1em.XDEq7BNVaJaIgd0PkVnU6TvTG.', '2022-03-01 18:35:48', 1),
(20, 'azzeetech.it@gmail.com', '$2y$10$S.J3URdipOMnlexzSA.xTux4vqbU0T0YA0.Io1DnmRdUey.c2aXyq', '$2y$10$2E28Hyh4IgRk.SCDAG1R5uitHDI70o6ze3bcKd54Fa7fcpQDsIQeG', '2022-03-01 18:36:07', 1),
(21, 'azzeetech.it@gmail.com', '$2y$10$1aNbTwYuTc9NqH16e3KzTe4F9x/56Lu9cvlzk/lCCjnWLSlaVx2EC', '$2y$10$6ujfZcroMp.cBHmp8CWG1.w3deIkhbOnQSIBGZ8FgCxYKI8oQT8pG', '2022-03-01 18:37:02', 1),
(22, 'a.a.adeniyi1997@gmail.com', '$2y$10$XNIQPwjUGtmNgeJGN1sIGeSS3CVPTKvAuOJuS/4pq5LCRH17QiwNC', '$2y$10$OxzO5Tc86N9MpazEQaBhteExGOyKU0MEp.o3e6QwCpbhOIYuCAVS6', '2022-03-01 18:50:05', 1),
(23, 'azzeetech.it@gmail.com', '$2y$10$XxsS8t/P3cDQBxG6n1xLhO4cKhFsC4PxNa5F2e78BiddSexSr2ADa', '$2y$10$eikM6sVJyKPYrDGoAMFiRe5mGkS7EGRFc8dlP0gLgqD5db/ik7dqC', '2022-03-01 18:50:41', 1),
(24, 'a.a.adeniyi1997@gmail.com', '$2y$10$2zKFmd8UcJ85PFq1M/TOFuHJM2Sif0miv4fQZfySgMHbPH37rZ.Ym', '$2y$10$/iU85RdYJnHDl8oFMa2rTuLx0fnUJdhcmYDqhvaD9JnhxTRphNZ4i', '2022-03-01 18:51:39', 1),
(25, 'azzeetech.it@gmail.com', '$2y$10$5m2Jta5RAE7k0FS9j9v8ReRW3rFOfEOiYFzPTKY4vnvkoNdF9XyUq', '$2y$10$FVcFCMpaFX5SgjlEND2e5OkO/a5tp0fbl.hpoFGbuzvKSh9gUk3PC', '2022-03-01 18:53:01', 1),
(26, 'a.a.adeniyi1997@gmail.com', '$2y$10$E3ZdicvhVaKTnrNEhE7gEu7AsbUsPtVbJJILRlqgYWrHAi1KNJL8u', '$2y$10$fUq9s393QSAxmEvYvpx4B.sUfwMCe55.akrwuHWSi3t5GjGoH7JYu', '2022-03-01 19:03:21', 1),
(27, 'azzeetech.it@gmail.com', '$2y$10$3WnQb4jZrUAahkXxFxla8OR6cVeZpu5DdJZfp.xLwxFaDSIpszY5.', '$2y$10$35vd4owUtWkWRNCVVZoINOKD12FQ0vptHjR7j.bo8jjtY6l0mn.zW', '2022-03-01 19:03:57', 1),
(28, 'a.a.adeniyi1997@gmail.com', '$2y$10$c1emNey5GV8eEiCC8JrwzegwvoJppAmMXArS5Cv.7nK6HaXMBucdW', '$2y$10$TWgibQzDdv1PDwI0pmIZTOxPs8sg68SlzjnetLvwEiGK5W4hk/of2', '2022-03-01 19:04:33', 1),
(29, 'azzeetech.it@gmail.com', '$2y$10$7LFtT6TlSiv8qfI.cQ6HDu1860L1nrjYmpiTgVZxLg77WNcPKLgUS', '$2y$10$VtD5ta2R/wpKN15UmjQkaOXeMslPxN4rqiWJ4Lk6XzBqh12e1pM1C', '2022-03-01 19:05:04', 1),
(30, 'azzeetech.it@gmail.com', '$2y$10$EPxwRmeImO/1kvGhlI12mOien3LtJ8ikjYl16hL7vvlQFlPz7kywy', '$2y$10$TK.o9S34ggt1OL2MaUEhw.ErSIq9TxeTUEXohcA4bzX/3qpjpteW.', '2022-03-01 19:05:19', 1),
(31, 'azzeetech.it@gmail.com', '$2y$10$eAxjNdOiydpYa4XhklZhPuFJ.xzs0AOsWJn2lz3qX5EyCq99f9.yG', '$2y$10$KZJBu8E3dH5795HJ6/TE8OS64i32Urit3Wd1yOprHxjFBHcQF9XX2', '2022-03-01 20:02:54', 1),
(32, 'a.a.adeniyi1997@gmail.com', '$2y$10$nUCZ0AsJGZ.lz203htzKVeyELnJkTV5VnaPRqsGXLonuyc472v8pG', '$2y$10$Q1ciCdezJ8tHOv/wJhc8r.c.fBQ94AxjSn2Bbs/pFVLIJRcWIsWEm', '2022-03-01 20:10:50', 1),
(33, 'a.a.adeniyi1997@gmail.com', '$2y$10$/hMjP7grwEVvOn0E5.J0ZuPlcGcoMjCVG6kdYbj5iEEFlVCdYrRQO', '$2y$10$sKF/44jilcnwTXhYzuE66.Y5mL4ITDVp4BBdw/FAjqjg3pi9jZeNe', '2022-03-01 20:11:00', 1),
(34, 'azzeetech.it@gmail.com', '$2y$10$VoLj8VbFs0vLRrB4qyzzLO9eBhkrSQlhtG/1tVVwBzLnos6ZpHtNa', '$2y$10$1z34uJL88i.lXMT1OcmdeOjgKdATdAKCVMdRhZlkAcL2YiDysGt3i', '2022-03-01 20:11:10', 1),
(35, 'a.a.adeniyi1997@gmail.com', '$2y$10$EAIuNY8hLhCJiI/TFbyOJ.GTLecJYIm9KETv481WkSXsy6BD6zj2m', '$2y$10$/fBOr/iz8wHbFuz5tR4vmuRvvD9NAGanPOcvGFiHP5eLlPaPEjeiu', '2022-03-01 20:11:49', 1),
(36, 'azzeetech.it@gmail.com', '$2y$10$DWVG1tbpF6k/.vR0zxNiiubzD2MWfOTZw5nuE2yJZSttC6ZS.P/Iu', '$2y$10$AL22ubIJVCcAN8TuFjPD.uvtk9muOi/r9s7h/DlYSJ6VpiwEQ/aXe', '2022-03-01 20:13:11', 1),
(37, 'azzeetech.it@gmail.com', '$2y$10$EHDY9FC8e9Q12pJ3sm/.8.yQ/ZDi/a.d0Pq4EEyXbfbMzFGjbz5r6', '$2y$10$vA63fLZwIsWXoN7gHDIbru8fgRL.8aJ749go5aLZyO3Isd2SyAlGC', '2022-03-01 22:54:01', 1),
(38, 'a.a.adeniyi1997@gmail.com', '$2y$10$p07zZ.4KwPFWUxP.Co9hl.uCUt63VhMoHnnMg.vVYJgJuzD6R6lcy', '$2y$10$7MPnX8abwfTlH.zd.JyfcuSH94w3OMPZp5IXMLiefDacQXTHoPK3y', '2022-03-02 13:09:12', 1),
(39, 'a.a.adeniyi1997@gmail.com', '$2y$10$ruAMXUanoOohK7R8KiY5h.Gx8sk6VYAD2.R/poLj3LtM/8na.6m0G', '$2y$10$f0ZC1b673E77JhG3tasL7ewr61OsSvvyF4KUFxAyOsEjRQrRbheHi', '2022-03-02 16:38:44', 1),
(40, 'azzeetech.it@gmail.com', '$2y$10$Ljo9Svx31pMQ4n5.WNLCueM0lfey/o6.Mm73Lysn72WlMKuac7HVW', '$2y$10$o84vOkItEMCalKJYjLzxdu1xA85eOU/WnU4rd5Nvq.HxtExIpjDtO', '2022-03-03 22:52:32', 1),
(41, 'a.a.adeniyi1997@gmail.com', '$2y$10$VN4m52VcyLrmlYCocbg/U.tWoQM87m/2QYLeW.IUHqqrK//VOl99C', '$2y$10$6Id.iEnVO1b0fqwjskwSTeJqdmEHcgBctjQU6eovriaTIpoq7NJIK', '2022-03-11 12:47:38', 1),
(42, 'azzeetech.it@gmail.com', '$2y$10$3lsllIQgZ/DffgTFxvcC6O4zwZ5rI606dyW2J5R6Ff3HrRu./kkQK', '$2y$10$FHUR/EHcto/8rDx.3HnqMOZ/h.aHwh1NrzkXgTFWhKftljuiH4S/S', '2022-03-11 13:18:08', 1),
(43, 'azzeetech.it@gmail.com', '$2y$10$rFFNoxMv0exQOiMuQ3KzRerT78o.0nX8iY4eSGA298pw.J5UVj/la', '$2y$10$mSsDtwApEINAHYKAx0JwyeWKdHr4KB.wFxFjPQCCs.VnhWWQ5xxeS', '2022-03-12 22:05:52', 1),
(44, 'azzeetech.it@gmail.com', '$2y$10$UinR9ID6g07SPSqEHwjYu.ba7uIiuQnILEPPrMv5TLLfJEg9UXguW', '$2y$10$GwNgeoEY3NZxVObOVgkAzutrHEls1wI05xCOaGlgXtN5RWzWnURFi', '2022-03-19 17:04:10', 1),
(45, 'azzeetech.it@gmail.com', '$2y$10$P7aafNhAdu4gIHoXMTvEju.6ZWHDCFfQjNR8PmMMtXDSo.ZlDQXyC', '$2y$10$n2g8cBk/vbxjjer.20YsxObsGLie8q6Ve4rPswbZpVZmifWPR/uRq', '2022-03-22 18:28:14', 1),
(46, 'azzeetech.it@gmail.com', '$2y$10$DqEtx/MKeJ9B5dKN1fvx1enHf4Hr14tt4x9PvSAOJja5UHBODnzu2', '$2y$10$5oiiYB8ofgmim4aeP3wE3ulK0oFIXNhlfCk5U6JZ2dEH4Td3B6YBa', '2022-04-04 10:34:20', 1),
(47, 'oyewalejohn@gmail.com', '$2y$10$I4i6PGEZfN.o/uRoYqFv5.iZ1asH/U7VUI1DNbkWv35nq6n8l00Qi', '$2y$10$qTsed1bYOfJeCz4fPn8CduM/eVf4ZGKgSANdx4R5XKKIFd0m3flJK', '2022-04-04 10:35:00', 1),
(48, 'azzeetech.it@gmail.com', '$2y$10$0YpihYUQ387PyboAHq0onext0NconW4Oas6AXHWOEpq5z8sc3jMoO', '$2y$10$AK0zwjIFzS9aZe3.aO8wUuJnh9zMYTkWhP3aq/2CTeBOVbiNp79t2', '2022-04-04 10:40:50', 1),
(49, 'azzeetech.it@gmail.com', '$2y$10$g7zJZtA.a6Ch0ZIO2HY9iujNlK22LwZZwGaKlaWHhUIwatsHxPAK.', '$2y$10$uF5vSMOdOLCbjWbWyPTc3Oxq7buJvjyGS7iiXB1Cs74iPGufvESdC', '2022-04-04 10:41:31', 1),
(50, 'oyewalejohn@gmail.com', '$2y$10$fGAoHA6pWNyfR25lXSgtQOC.xASCNbIr76hsfvVa5VJI4tW.h5ifK', '$2y$10$.ZSiVY5PlGbAITVnVD.7ee7Qg4y5VXp//.wggHzlO9fgQ9FG/XwdK', '2022-04-04 10:41:42', 0),
(51, 'azzeetech.it@gmail.com', '$2y$10$nLD6zGUnt1BvOKABDRMB0uAyhgVZq/8HWwyT1hrFoGiDtnLgTX06S', '$2y$10$puZq2smBkKqMoYjlxxo9yeI2BCzFfjgu6MKTVBreTlVKaSgTt0/6C', '2022-05-14 22:06:04', 1),
(52, 'azzeetech.it@gmail.com', '$2y$10$KsTixD/dgTNi8yH/rPQueOOwdyAeIf.tf3yqL9AkkMNzHR7jOpwyK', '$2y$10$I2s4GBrFJyJGW.PMVUww/.55Gc/yp9PfRfoVUhml6zFDYyD3K2czm', '2022-08-03 21:19:50', 1),
(53, 'azzeetech.it@gmail.com', '$2y$10$ij5DhF9CjiahoaHDKvt9ZuQnLHCXoFs42rXqkYr4ilMIwwelkA1VO', '$2y$10$UC4D31AkHY6K.wAK8umPTOlKdCNW9Dlwg8QUn4iKhbbqfY9v17yZi', '2022-08-07 17:53:35', 1),
(54, 'azzeetech.it@gmail.com', '$2y$10$yDKnRsQz9Iufwbsiilhyf.mNcNWZID0eNRMO28eZ2yIqTC6NgwbPK', '$2y$10$QGPCZ8.Dwlep9s9b3SuTpuIKzQFD6rxZBqd39LihnfwZTslHhFEem', '2022-10-04 15:26:13', 1),
(55, 'azzeetech.it@gmail.com', '$2y$10$eYEf7FYUXlyHQtIcE8goneNFfOfece8RE7i1awbFpOt2fkQLxxI7S', '$2y$10$/T..XiuCjB9SRr/Ky5.qEu8KuQZ24oahOpyW7GawC2wsLpqocFMDa', '2023-03-04 13:36:53', 1),
(56, 'azzeetech.it@gmail.com', '$2y$10$zXtprcX35LsoVKhW5LHSJu5vHbSpPc2oBOfUej6DbcerLN5aGCSRa', '$2y$10$f3zqqRLJiOhJEuBfxUIZkOMvNnSN3/.89fTJ4FwzuwbHFWFN7NqNa', '2023-03-04 13:37:01', 1),
(57, 'azzeetech.it@gmail.com', '$2y$10$GGcTm5xPvGF01b8N49A2zunJi2GNhgH.S6xyxXfuduRaOEkEuGCti', '$2y$10$QiS77EmtOPgFkvfSgNO4qu9dB4R989MJfnTEO0uehwcrJAOciO.H2', '2023-03-04 13:38:55', 1),
(58, 'azzeetech.it@gmail.com', '$2y$10$dC2fnGA/8sL5KUIVgOLuuuBEuw3IB1aRVDp3PPukPjiUYdCU014eK', '$2y$10$b/BjLOck28zUq4Mr3IRSyezV8ZcLTLbnCxBeEqXUBAE5WwFfZ0SIa', '2023-03-04 13:44:08', 1),
(59, 'azzeetech.it@gmail.com', '$2y$10$7F5Gv3KOXKwYEKgYETQw2.eOEmGdt4DjUuyD.iWQjvK5oRB8P4y/K', '$2y$10$q0l3MAOVBnDjHu7kERh5nuorvQ0dj2LciI/KoY1dS01o2MqEs2nyy', '2023-03-04 13:54:42', 1),
(60, 'azzeetech.it@gmail.com', '$2y$10$BNyRsSmD1QRBXfNr5nIZSu15n.SYAhPhhFM8NbtnExbMC30XsurGq', '$2y$10$gDWj1R15KH.ijPbI1u5QEeqtuQ49M058KjXyx8Z73brLVXEJTtRYm', '2023-03-04 21:36:36', 1),
(61, 'azzeetech.it@gmail.com', '$2y$10$HfaRe/vSqJ8Z4XH9xbKDte/hWstQNjxU8SKvCr7WecpFCKn4YCMQe', '$2y$10$VZILFstuGMrBrH.rSfH0/Osu.XYexFKlBtB8uO0Zx4O9GojNLn9Fu', '2023-03-04 21:37:11', 1),
(62, 'azzeetech.it@gmail.com', '$2y$10$FgevinJJVgqbx/SkCHCCBOmPjjUtOHjtJmm8PwIzLEFhgNnh8rDsO', '$2y$10$89xraY00FW2uHcX9BD62telsICRcchH9QTDaRNat.tbRbTKxwBRyC', '2023-04-10 13:17:08', 1),
(63, 'azzeetech.it@gmail.com', '$2y$10$Uneh.f7C4ApZm8ZoGHid9ue075..FY.8LFAUYdMk1EWy25nQRLy3S', '$2y$10$95RzEx9odFCKu7dTMvaV/.1hxQTeXXxOz5b89SytcWXwSlPrDmunW', '2023-04-10 14:19:48', 1),
(64, 'azzeetech.it@gmail.com', '$2y$10$fCCwUTLdlIXE/aV/QowJiOsKjY1Ngs9.Zlv.uJAoE.P9mWn4coXai', '$2y$10$arXPRZwML0hHXyEROVvvNOiFMJSdd4cru6Nz1a5iTetiCVcZMyHA6', '2023-04-10 14:37:42', 1),
(65, 'azzeetech.it@gmail.com', '$2y$10$9m076VYc4Khg7UU6BVY45OBWlJ1eqGFN9BOl6zPf2YifMvbyJ6Dei', '$2y$10$9QAZToT3yCZG60N1wFvfOuTR5u2I10jQwORZcUTu/iK6oSiY/p3kq', '2023-04-10 16:31:18', 1),
(66, 'softwareclone@gmail.com', '$2y$10$lFB2./OQOtY6H9.6a4bAtugA5HZEzltZuJxEo8cSM0Vc0XjydMfyW', '$2y$10$OeBB3ibLUxd6LRxEypj34e/3c4RC5Y5HXDsM1MXNeKrcBCcXzDEAe', '2023-04-12 13:16:42', 1),
(67, 'azzeetech.it@gmail.com', '$2y$10$ceFAva4p8QHsYiN7o8/2AOjU7ipY6ogWQxbP/zTlUVOkhajtiRZkm', '$2y$10$YuD60IZune3PqQqAQwkEx.3o.wyo9jOP/.zhEzENyajZ35IthKxMu', '2023-04-13 14:31:13', 1),
(68, 'azzeetech.it@gmail.com', '$2y$10$SiNNapLznwTmGLg/xPN70ebhonetE7x8rydoQHkLLyvZWRweBqeIi', '$2y$10$1hz2IpAsRtfYu6xUubprgutbrIy9QiVAS1OfY4T3WjB5lzc8F8fM2', '2023-04-13 14:33:22', 1),
(69, 'softwareclone@gmail.com', '$2y$10$JCnsCC3uvnG76yPjqFFEk.OMxfH5Wre1V0dBrIqLjXyjTCeWFPfSW', '$2y$10$hnumzw6rovlWJzAtL9Msce1FYKUSMPOsPpBMUU2/VfmuJsHhq32Ba', '2023-04-13 15:11:42', 1),
(70, 'softwareclone@gmail.com', '$2y$10$0qZWUu/Z3qmphBjBgLoA0e3uykMrHgAyz60qPfWBnxf5ia5RMiuYi', '$2y$10$MjBvRu5x8tw02q/dTWPrMeFTZxSYIZNcutOp9O57ot5u7zUCJGtEu', '2023-04-13 18:22:34', 1),
(71, 'azzeetech.it@gmail.com', '$2y$10$MmA1TE7QxKiD6cvpYqBWqeYyjjOvVexKHJxWRJf5Du2dvowTXp4L.', '$2y$10$ZMBvl4BEmiCTLVznoF5uROFm3YzDL2V3d/Ciqi6X7C7d/EFycg.Se', '2023-04-14 19:32:25', 1),
(72, 'azzeetech.it@gmail.com', '$2y$10$eLrPHEKEH9.j6fLP83PJzOjewM9pzoY.I8ZDB30aB9QIOzmsUgPGm', '$2y$10$877RqCwCQfmd0Aag4d5p0.tY.X9xZkLNiB/xptF0wTkgNsxkMRm4C', '2023-04-21 23:41:39', 1),
(73, 'azzeetech.it@gmail.com', '$2y$10$oTJ7Mxm8Qu9lj50yruW.Qe7u3GSvogqePZTJz8TtZ4LamcJ8eHzva', '$2y$10$lw74yC/IpDrBUaLPmNSpbeNPk/ZzOg/tWNEy6cH/5vgC7A7Zfsd3e', '2023-05-03 12:22:45', 0),
(74, 'mubarakmusa029@gmail.com', '$2y$10$Coni7gw/wCEwzCNz5DduROOPB5IkOIuoORNqiWuxg7sUaBPc0kar.', '$2y$10$VkLpOVhuc5Cf.tYWfWmpjez5bDLmYFq/PmQI8z.YgWHuv/e.vH3Nm', '2023-05-19 17:33:44', 1),
(75, 'mubarakmusa029@gmail.com', '$2y$10$GEHqv.6STojDiAL9ZkMxtuprcEWySw2w/z1GZ8m4vyxGKnAHNflYa', '$2y$10$/e9GLruauy0l49tEjfmO5OO5RNbyJl0MBCI4/qUGwC5/T6xGV4fkS', '2023-05-19 17:43:31', 1),
(76, 'mubarakmusa029@gmail.com', '$2y$10$L6moyudDR0l1/.CsXvoRS.DJAk2awHka9ehjjTyCxmtics8yTADaK', '$2y$10$HLvpfWWpX/kMSnMzvZMf7.C0TBfQ3o/HE/lx/F8unmXOclQC8heL2', '2023-05-20 07:44:40', 1),
(77, 'softwareclone@gmail.com', '$2y$10$GODN74Dw0pcwwnxPvmv3meWbV9ZfUDkUQHA9uBSnp0vHO4lrpl9w2', '$2y$10$tKXjRZpV3wq2/wRFKnB7l.BAhOOYbbUf4b1ggRaxLoAlJmjumtkqK', '2023-05-20 08:22:09', 1),
(78, 'mubarakmusa029@gmail.com', '$2y$10$7FYlOZMucTXuaYJ5Mte5MeiTlvsWpI48s0aAT3v84mWiHS.sFH1F.', '$2y$10$Da1UmU5NgpnFhDqM8SFJh.znQgA32Vw2wlru2gliGWoZnlB6hB9/i', '2023-05-20 22:12:49', 1),
(79, 'ameeralhassan79@gmail.com', '$2y$10$VtLljE09PTn8FDNPyEypO.ABnqXplo1GYytt0Oe9ARZM4rBmK77Zi', '$2y$10$NUgLLviCe0m8l8AobWv/k.0BEd6ZQjOO6X2X794Eqlu7h62h6l2Aq', '2023-05-22 04:12:45', 1),
(80, 'ameeralhassan79@gmail.com', '$2y$10$Yl1f0cGPlDSop6nFaaHeZexfz0gmPu2pXqdjnjFZ8zzdGV3i153M.', '$2y$10$JrHIlin1dL5kTLPUKy.n2OiAe/h5m4861LEc8iYeb3yvE/52BvSLe', '2023-05-22 04:16:28', 0),
(81, 'kakyansoro87@gmail.com', '$2y$10$V9Ut84RhswBvs1u5MMeB3ebeINwcRF5QrxpJAk4ZVxQ7gLiC7iEBC', '$2y$10$0MxCnmLmBh8dWlRBHZd19.sNyM7mJS0i0QRIbCpYwbu.qvrfIbq2S', '2023-05-22 11:19:32', 0),
(82, 'mubarakmusa029@gmail.com', '$2y$10$YXdb93TnHLZKxciaePwni.aZYWciSSoyO/a76yVJAhRyPJ/mOPXE6', '$2y$10$uqfQfdK8cIgj1L3LDMhaUedTUcDWR87co4XW5UyDaaeAGj6L7AoSm', '2023-05-22 14:25:07', 1),
(83, 'mubarakmusa029@gmail.com', '$2y$10$pw0gIUqmeczeskzSwlzfXeb/Wc/oBHpFJjv4Tprg3RyKMTbRN3UTC', '$2y$10$o/8A4BMLlFA0GpJzPf9cm.1HP07.0qo3iaDofmT7w0klfpuECmCNq', '2023-05-23 10:43:50', 1),
(84, 'mubarakmusa029@gmail.com', '$2y$10$pnHxdkd64ZLhnjzH4olTK.iJ4SO2PlN3qQIR6fNfc22Bx3ga.65xG', '$2y$10$EE26P.gC8FjN/SwjN/MZ.uilHnS5e5Ieyv2XZmY5TDgCpBxeEmmpG', '2023-05-27 20:52:49', 1),
(85, 'mubarakmusa029@gmail.com', '$2y$10$GRyaaPubcIP1jmogtaJVyONl2ncspM2WAI6MR40DDgkker8D4baB6', '$2y$10$g8pp/AG7vWn39wAn5qDsKeUjtci96WmxIH9HNxD6S7ZoOaXyLy95e', '2023-05-30 20:30:01', 0),
(86, 'softwareclone@gmail.com', '$2y$10$cwMQYVdHWfoaLJTicflU.uaes5d4hglr./J4Q4hxaCH3KLOyaQkqa', '$2y$10$Dhb39X8RQ2CEjbx9nX6RqO8xK.F5JIcIT/qiNXrg889Ntba8aBCWS', '2023-08-15 20:50:12', 1),
(87, 'softwareclone@gmail.com', '$2y$10$0nvv5sYu5pW7YxEc8.p7UOQVtKmV3JPuFLS5MI/15P.XYsFWlNW22', '$2y$10$Ir..rbWRLfsntrUywT4e1u5MY15aMttwHYnCsS6fldpfPxoZnq1LS', '2023-09-19 11:05:34', 1),
(88, 'abbamooser@gmail.com', '$2y$10$XkUsHoFDCkARGB/TcIve3OeUhIl2ptkEuxhv8asKvWYq16rf8KbTK', '$2y$10$RWNqFnYZyNgXU/xb8nDqGeeV9/noXsoqa9Kah2ZNroO7EQB8Z45dS', '2023-09-19 17:21:53', 0),
(89, 'softwareclone@gmail.com', '$2y$10$oHWkecda0UbG4Vdav7tIieFGDi2uOFr872pL6mU6BBkKi7d.qWweq', '$2y$10$y9eWRhhAGXdoWnwxLWU71OEgK5tHgmt4iqoysR1WPGguwQvhbJNxe', '2023-09-20 13:27:36', 1),
(90, 'ahmadnurahussain13@gmail.com', '$2y$10$gkoizrHIr3VCUzHcdkGu..E0003jrcazn6og5ksIahNfABcrF8qPa', '$2y$10$BiU4A6fgkhkW6ZCj20KZPefepKjZyDM.1cklI0K8qERU6WXS.ZK2C', '2023-10-18 07:01:25', 0),
(91, 'softwareclone@gmail.com', '$2y$10$mxFbG3ngveyxaHGYeIlzNu0eFmTlO3Zr4V2h3pdDlcXvBKY.u.ru6', '$2y$10$6MwMdAdMWD51PtXDKKne.OTWZ0fo5JN57STDRwHENMff9//BQT.ce', '2023-11-09 07:54:41', 1),
(92, 'softwareclone2024@gmail.com', '$2y$10$JeNiE3x94LcTjm2h6OQKmuoErUgYtZuKlIJfIPho9CskU2IcJbfNG', '$2y$10$eMMVIaD5djDM.CiJ4qvDaeGIgY3nyqxGUy.wElM8lzvygGANiSOym', '2024-08-19 10:54:15', 0),
(93, 'mahmudmohad95@gmail.com', '$2y$10$ggUpY.bsjkxHBtT/3/YmO.pL20sOYSyWDU33vNwEcHO3hcftE.z2W', '$2y$10$bQd0RrT1pwIz1xnwi8zf8OBILGGMsnaaOriYcwMo14ZvDX8zOeW9S', '2024-08-19 12:55:24', 1),
(94, 'mahmudmohad95@gmail.com', '$2y$10$WN7ed5FPoaNYVvHVRWg3vOJXOulOQXci.UDHmqrvOKhSlvjQP1pqy', '$2y$10$RqEEG9nZbIT2yiVfKitPOuz8Lj3p3rVcbfagyTNpfyBbJxY61WqFu', '2024-08-19 12:57:11', 1),
(95, 'mahmudmohad95@gmail.com', '$2y$10$/rUEq1QMabKkeliu34lY5uGrYv2a211Nvjmwzt5CyL/Dq2Y/FwUCC', '$2y$10$WVmIT2ID1rJzJQQpCnMicuU09tlMUar2vEuOHfAyxa4f.otGGiIt.', '2024-08-19 15:01:28', 1),
(96, 'hassankamzahab@gmail.com', '$2y$10$KZrqaMf1ZzhG8KS1ODmMm.oN0brq4z6aHWdGMYVz8YtNzxB3gOrYS', '$2y$10$R2pOw84l7GqG0JoxOWjNa.DtLxsB5IDf964CD6DRMj4PJFYSRDK6i', '2024-08-19 15:14:15', 1),
(97, 'mahmudmohad95@gmail.com', '$2y$10$UG7F5nxUru7J3rnMbLUJW.T1oEhTLlHky8b5gye2pMUX56pPsh.8K', '$2y$10$NLP5P9Audpai7ieL6WTCMOQYiVBlMhjeCFsOSHwWMd8CELUe3IWrS', '2024-08-20 09:09:00', 1),
(98, 'mahmudmohad95@gmail.com', '$2y$10$qBpMtLHz5r4fFpniNaAqzuk0aeWfriyBnKQG3CHIJf0ThBE/OfWXW', '$2y$10$/IaFQvbSh/hAq6hpJO.M1elhmKWTkLaK/NNEORbW1HZxkkB.CBQ3O', '2024-08-21 18:24:55', 1),
(99, 'mahmudmohad95@gmail.com', '$2y$10$zhpah8fcXEawfJK2k8M9KuZ3ms.MtJOxAKD/bwnJIQA7QbnMdpwfu', '$2y$10$XRqE7njl5FzdRZCTpXKo6uJrN1IrGjk.vgsBFPIBGu.SZOKpSM6Ge', '2024-08-21 19:23:15', 1),
(100, 'mahmudmohad95@gmail.com', '$2y$10$9NpceywHq2dIy4pzgWPXxuysWe1uTOt9ChLHLmKbXOGWHW5BkNK1O', '$2y$10$T0h3JSlTbdjv3KpeTPJD9uAAwfhubguZzOH8g.BmY7R0DASnz/W1C', '2024-08-21 21:09:31', 1),
(101, 'insaffanigltd@gmail.com', '$2y$10$aTa6WuYK2EwmLaVaThTh7OqB7Y9q0nWEYAuYI2hJLZW36S.3PvVUu', '$2y$10$zSEK/99iM/h5Xn9Fwx7oMeEcvammxNyQD7qFgznWxX5dn2bvdVRim', '2024-08-21 21:43:18', 1),
(102, 'hassankamzahab@gmail.com', '$2y$10$Z/a/mH4dS7sJc93lOOV7X.CCJkSKQRNuZKByzS4PRR/qjv78Yvhgq', '$2y$10$LK1teowA9ysMJe4zOXpD4u/8.V9OBQ5LKZT2VZpDPNxHZm3yIBbdG', '2024-08-21 21:52:48', 1),
(103, 'mahmudmohad95@gmail.com', '$2y$10$RvTuabUHPdzcpmulYPTbKuysKpjejxyY4WJ1emivVHoHzXN8LyE0G', '$2y$10$J2hnIr.1QOwwI4C196.CTexaXTp9c.214P1pgZJ87oILVIY66gWKu', '2024-08-22 10:13:03', 1),
(104, 'mahmudmohad95@gmail.com', '$2y$10$bLmI6NbfggE1ziKtEkXi5.HkVH9G3lK3q3eznAKT8AtYIIincOE9O', '$2y$10$pzagE1QeWhlccLb3gElQ7uVZyQp6n7GGnhCy7OiTY2iuYjZm7Vhd6', '2024-08-22 10:17:00', 1),
(105, 'mahmudmohad95@gmail.com', '$2y$10$EeC8qlP0BziGZ1b6ANbwIuuR6cgPFP2/jT.vmf.5npI7IvCYC4gIq', '$2y$10$hG3tJhRbfZHFXqUCEPNKx.leJj0PjPxa7EU2mksR9kQJ4GQrZl/86', '2024-08-22 22:02:58', 1),
(106, 'mahmudmohad95@gmail.com', '$2y$10$UOj5pM3JMlwanJEFBSza.uZJqD.qX5cR/QgX55y/MVuO6j2KHAiq.', '$2y$10$ehgp34rcx7yGgAqYgENCTO8NiQ6Qnf3C7M0GDPBh97QEXbEdZjyYu', '2024-08-23 12:09:12', 1),
(107, 'insaffanigltd@gmail.com', '$2y$10$CeHlCXm0Vqt1XieF0UkMv.m1jej5BXkErnu5dQ1m0QtRtPKCLmu/G', '$2y$10$nLvZiWI7IeC8k8FzZQwX8uuPiyX02D83Tinl/eUA66rluNk5X9LeG', '2024-08-26 20:22:03', 1),
(108, 'hassankamzahab@gmail.com', '$2y$10$4QnpRH7iLCLTgIFi/PrTCu9.GUwQ0E4scql26txfKdNwK0gjDN9Ti', '$2y$10$4uzCW3mvv8SsdIDhILl.pOdoVQhFmFFIZhxBCooOPe.IZN4l0iagS', '2024-08-26 20:23:36', 1),
(109, 'orkuma.mike70@gmail.com', '$2y$10$UU8xCr7Bt6EXaZ4y5ZazsuZvAFbXN3zFj03kEaq/lai1I0Kv82QSm', '$2y$10$isZ4xMqlun329TQeZXXmuO3jjP7j2kpYa7JlX2zpPR/X0SPQYzN4i', '2024-09-04 19:39:39', 0),
(110, 'mahmudmohad95@gmail.com', '$2y$10$U7Gp2B3f3zPLEhKwAKkpuebxfZWnSINgkcWtmUwDWvxC1eokcCPJe', '$2y$10$ehk2xTNnGJXeAkdkMc0shOyFY6cg9oYs3hbbOhMGILhLf/U13zacy', '2024-09-07 10:22:42', 1),
(111, 'emmanueljunior433@gmail.com', '$2y$10$kWAHX3Bst5wBFc5rH8AvvuwQ11MUYeEO3mwGRTzL/FEgxLzxLD756', '$2y$10$RVboTT/R7DcgqRWYZgaUV.77RxUOQK.cV3tmazzsQI5VhNnqqYk2m', '2024-09-11 17:26:14', 1),
(112, 'mahmudmohad95@gmail.com', '$2y$10$LoMThppRPEmWNdMHP9gC3eSUEG0HCkGWK671Sav29yYw7lq5aNAEe', '$2y$10$DeJX6EltAIK4f/UrlEnuUuNiDCZgN3XAN5uGq5ixuhVNmuc8JCd6O', '2024-09-11 18:09:21', 1),
(113, 'mahmudmohad95@gmail.com', '$2y$10$KV5baWHFexR2GadKXB0Mne2BY0i2WEKDeCQ7w9v7.E.o.GMp7uBvi', '$2y$10$Uv3YH9I1wb2t3aDQy0cj/uezeC26zVXIfI8SW8XLfZbwylOA1XWDm', '2024-09-11 18:10:36', 1),
(114, 'emmanueljunior433@gmail.com', '$2y$10$q67083qMWYFL.O9sAKw3sOGMfOw4voNMhhzLXV5JsW7Jwpr5itCee', '$2y$10$Ujg3rd1Vlm1wsZVcauV1g.m3mnOPv3S9lIak9ewJsCdIYtcWjJqXG', '2024-09-12 08:27:26', 1),
(115, 'emmanueljunior433@gmail.com', '$2y$10$BmYh0gZlVuZFpo7p3EK.iu93Et2uA3MgXkRlsUvIy1B1V9fMwi0rO', '$2y$10$11tk3EvpKkgERTTj8bK5/OndBg0NBgkD6YvCOOwGkeM5T5Cmth9.i', '2024-09-12 08:32:32', 1),
(116, 'emmanueljunior433@gmail.com', '$2y$10$XY9dDFFN3qa6sPSPAOxU4efHlO.PsAeXoxFphySBVS.Gcg6LSspWO', '$2y$10$Ze3DBgpg1gqPzddxo1DxYuiZg4vU.eaDhFUosXaaH.3JwP38JqFD.', '2024-09-12 08:36:19', 1),
(117, 'mahmudmohad95@gmail.com', '$2y$10$amrLj8rt4WDHbMrNPf3POu1WD6IGhntXiVBvKPURz9fk2AzlxdEXa', '$2y$10$9xHDzn9t2Z7JxgbSeys7VObL0Fc/fPuaueJ7yoGOMVBRscvv31mUO', '2024-09-12 09:42:08', 1),
(118, 'emmanueljunior433@gmail.com', '$2y$10$Hh69y7IkqMWfA4JRLJZCAuuH4tNQwy64BkTb7LAx4VJLLmsLSDtqu', '$2y$10$j.TVrd.bf5XmiQKUNf8Ab.LkBkq0JduYTbtVDZcxxwqkBXAN1B/hW', '2024-09-13 00:02:16', 1),
(119, 'emmanueljunior433@gmail.com', '$2y$10$qLAbrK3Y3MHEOLx8m6CJkubye1zs2LUChczZFcbtN3HESVLLCdf.y', '$2y$10$a2KbEYAtl8uPrz/jrQCbYegOykBVufmELZYws.RqHGFTJB2IYw6Na', '2024-09-13 04:32:57', 1),
(120, 'emmanueljunior433@gmail.com', '$2y$10$Ao7sEIiMNMNDK/q6/kgOP.ifzmct88QuiSirBBZuF6SfXDxlQ7OZS', '$2y$10$uPsbOYNKAkC3gn1xfqm7cena.k/.YxWxbDOxb8CHoEWZYHSgirQlu', '2024-09-13 04:37:24', 1),
(121, 'mahmudmohad95@gmail.com', '$2y$10$YqJ6d1cswj6s8E8d5K66m.X0Q0zPwLdh4jPfktJ7qs.sGLktMtJ0W', '$2y$10$o9oZvAGVWVAUopD8Cqqc8uTetlJUZFHTQscUWs6pzYwJ2oBqk5DyO', '2024-09-13 06:07:54', 1),
(122, 'emmanueljunior433@gmail.com', '$2y$10$XNta1644DmD9rs7IfCZkgOmF3Acd013GNwonJwkSIZ352LPBL8vHG', '$2y$10$0FQR1KeAGML8pIkBo3QMuO/KRosQTVjCA/4jatRvrsVVvgDPaZqNS', '2024-09-13 15:14:12', 1),
(123, 'mahmudmohad95@gmail.com', '$2y$10$DFPgzOmPJMQQAryvcu1l7.ACdV66STl6ukbP/bndVyMOBzVwyd1Y.', '$2y$10$hOVydVmub.SwdYiAaWnwOORaiYbyWXjLhfUnlD1vtGJCQuQ23jw/y', '2024-09-14 09:40:30', 1),
(124, 'mahmudmohad95@gmail.com', '$2y$10$bj74Qf/R4PXhyqsvDNq.Zuo8773iZKUwDuG0Cq.aubDp57AmCaCIK', '$2y$10$uBeNBSOgCFOsVWNgtNav6.Lr1jb3DGohM4R1.U0gFah4P3q4QXE42', '2024-09-14 12:52:43', 1),
(125, 'emmanueljunior433@gmail.com', '$2y$10$nYDA8bL7SsJhJd7LXjPYLeb4i0/G/4cR/HUgNHh5IGi9qp2U8J2Yy', '$2y$10$slt.1cS71S/ZJxkypYeJvuR0WG.x4gUU9j0/1L3NcP.gJ1kwFAKLK', '2024-09-15 14:00:29', 1),
(126, 'emmanueljunior433@gmail.com', '$2y$10$O10W1WCHvocqb6Awb4EVdOPZPvwCJ9tIZP/fcqAafzXQ5A.xqEgom', '$2y$10$Jc4IHLM5D.YmBGS01dyQx.wp6NjobEOzLo2og/BNxPxlFQgmTMJ7m', '2024-09-30 18:40:38', 0),
(127, 'mahmudmohad95@gmail.com', '$2y$10$8L1Lik92REI9a.q2I/59POvUwcjYZkKWARyeFer5Ew1baM64ZtMWe', '$2y$10$afso/Aaf/1rk1NZcJ1GHiuRI7A7F6dJKCTKr3P3qSZMOyx4.26Hze', '2024-10-04 20:00:16', 1),
(128, 'insaffanigltd@gmail.com', '$2y$10$gMJ5iZhF8OBSSAFTnmXW2uCMzzZZ0Kp9Msc.0U9rGmzMvV883Rdfi', '$2y$10$3UOfdHt.Wjyi0tqwCHJvauC5CqUoaLzdhQyL57ULGfvgDHfvHCTgi', '2024-10-04 20:04:06', 1),
(129, 'insaffanigltd@gmail.com', '$2y$10$LiqoJmtZj0XLNHDjPFo.UuK5MiRMzplzRSt9ecnv99/iXh3Ka0DfG', '$2y$10$Qxl33MONzPyrQ.xg./ZNFe85BY/jQ1M9wCwZcB1j54BweD3CHs9OO', '2024-10-09 10:26:10', 1),
(130, 'hassankamzahab@gmail.com', '$2y$10$d2DyMbMCvjsj1HyYf6b0IuBeIFwfaQod/iwCxFWqEJ.BPM.s/T81u', '$2y$10$YEv6/xum/uJstpxs.X4g5uCOQ2Q6WakhfCYF39aA/S4o4K8CgfpsS', '2024-10-09 10:26:22', 1),
(131, 'hassankamzahab@gmail.com', '$2y$10$a6uMzCZSNjwxfjsLz1mWq.PEpDcPICJI1FZc4kt1AcB9IpXmMNxje', '$2y$10$PXLlQQnzUdGQEJ7u/OPgM.z53SlBGwmep65ApY3AqWCmtowXNQa1m', '2024-10-09 10:26:31', 1),
(132, 'insaffanigltd@gmail.com', '$2y$10$OPx.FD.aW54BNgKuHW/8V.RJhx/GdXfPVFBCXsjyh8uBwfzE.WKTa', '$2y$10$B5bGg3pBK1aVm/5kFInjie/ynYHTf4KDzQJKYXP4UAaxwNtCPiJkW', '2024-10-09 10:26:38', 1),
(133, 'paulsonbosah@gmail.com', '$2y$10$IxvRsABAa/CRN5p/XjHgaOut1UymQZzoHjGmydCFR0mTryc3zoaEq', '$2y$10$zJw2XVWl1.o7HbblyV/T0ezcYHaqFbFCtn8y4KDgV5/q22MFcJ03a', '2024-10-10 16:56:46', 0),
(134, 'insaffanigltd@gmail.com', '$2y$10$HgLs2cuwZk5a1XYAQaOUc.xsOS.zQxkePkNdDBEgtUU7zBKNnXVtG', '$2y$10$Kd4hruVkBCYtFQdU.CoSM.zT/ypMpZcFEVK8fEXUfXBUyxEwi6eti', '2024-10-10 23:53:29', 1),
(135, 'hassanabdullahiahmad7@gmail.com', '$2y$10$hWqbRojOzL/AdbbkN0XU4eaQSYe8G.JQLaCoGtRd1PsHyUYt57zJq', '$2y$10$PBAqEZfti7./R/DEZZ4KrOjx7B2VbLhlPaYD2pLbl9dsglf4TUp2y', '2024-10-12 13:16:33', 0),
(136, 'akinbolawa90@gmail.com', '$2y$10$zSjafbHopkXtrXpmTuqRluKxwhUcJze9JYC46odTA0Wee.451nH.W', '$2y$10$UeKlf6KLuolxo9099R5.P.AVvCIOtlgwaDFGPzb.JVTYWuYfUxTgi', '2024-10-16 08:05:14', 1),
(137, 'mahmudmohad95@gmail.com', '$2y$10$CguMtT0wfnKC92Tdh.Y0vOPgrRodlaoSiVkdGs4T2SroGcNeyCnye', '$2y$10$H.gutFHLsC.IFz0rm5lnduTgOBJK1LWitxBZ68wn18MLPeS7EYVAS', '2024-10-16 08:06:00', 1),
(138, 'mahmudmohad95@gmail.com', '$2y$10$Ft.hWoW8DR.X1gjB3e1WDuTpPu8QiHl22H0BLlR5NHCSs86.52GA.', '$2y$10$h1nAakIY9Uu9MbN8ikXYn.LuFk40J5Slm2bdoHLLyaUDpyoi1IxMy', '2024-10-16 21:27:24', 1),
(139, 'mahmudmohad95@gmail.com', '$2y$10$QME1fBdTX58.Ruf77J9Wj.7ec13.tNcyCJY.j1LpCxmBxtaxcC4KC', '$2y$10$Un9ED1sep.w/bxtCmF2A5OOodUyE2BwLGk3LQrzPjgD.OPSHpbfwi', '2024-10-16 23:40:01', 1),
(140, 'insaffanigltd@gmail.com', '$2y$10$IjbOC0oIItmxkZ6zFE1UDOb/DIyfuvYYC/LQaDQHwYmLbUt4O2Uh.', '$2y$10$0kHrwHIa7ietsg4Ve.ELsOe9cfwrEFOWOEr3hcGxe0QktrzbIf6n6', '2024-10-17 00:00:23', 1),
(141, 'insaffanigltd@gmail.com', '$2y$10$TEjvk1E0G4aT3jD3GnI.P.h6CY4/sMAxzOxqz.Vuqs.MVz2MoxheK', '$2y$10$yX2sOndrdVuxTVmiIWuIneD1qysNudDmJ5pNbiVNxJlc5PUicW77q', '2024-10-17 07:07:17', 1),
(142, 'mahmudmohad95@gmail.com', '$2y$10$ttg5yydRKig9JmrEGqeTm.tKgDrgffU0DAYAgpK4Z6Hf0oFZPb5HW', '$2y$10$iQMESQ2vgTIwGL7ZVoyxf.0r551p3dsjtvWaaw4GapLUe/aA0XVvm', '2024-10-17 12:22:18', 1),
(143, 'INSAFFANIGLTD@GMAIL.COM', '$2y$10$.DSP9yBeyKGf0R/AtmPyMuwN/FmE.c8IPIM1oQJFwKnK0E7CPlWJq', '$2y$10$B3U8cbI1LJ6IIehgMK36qOkiqnkgkaYSLH2m9l4nyXTO6/WZU74y6', '2024-10-17 12:26:37', 1),
(144, 'INSAFFANIGLTD@GMAIL.COM', '$2y$10$iju8aH13KSsnyOYjJlPLjOM9dfSCrj5jmHxBMvx7HmZRZMfj/qW0q', '$2y$10$0KTDe64VAz6zdIzAYsGAruAptfK3CniXjToNkw.7uxlb2VKN0skmm', '2024-10-17 15:11:12', 1),
(145, 'INSAFFANIGLTD@GMAIL.COM', '$2y$10$NsYbnVecwQ7sPvEanbLhROazSbvq.h55rxEYjMf8vDAh7LEpLBxLC', '$2y$10$hvxKva8tbVDyRewcm4VSVuS4BkBG9eJ0PpN02DNDDqTh/iV.tv4kC', '2024-10-17 17:59:01', 1),
(146, 'insaffanigltd@gmail.com', '$2y$10$CJTw8sAnNO5BeII/zlOd0.iaQpvQ0kx836skAZmDC47OEqa58QGWm', '$2y$10$TF0jp4wE9Tjh1JYtmnY3X.l6tFVYepiik4FQVzIxBRBW9Xe6J3n.K', '2024-10-18 07:13:23', 1),
(147, 'insaffanigltd@gmail.com', '$2y$10$EF1XXtcq56DS6I3JP00jwe2cvlfLCqeHlt60eNTULPShZgLLcEcLW', '$2y$10$VCEgbUg5pp8v9KhLrNdwhe8k6y6lSOaVfRXFVBH7rSgSJMWgsjSNq', '2024-10-21 13:36:49', 1),
(148, 'INSAFFANIGLTD@GMAIL.COM', '$2y$10$7mwG5FlSbDPphO.4lpjO2e/xMjp7yoE/6PihKGdCUjEx3uKIzK8Xi', '$2y$10$OIs2JQKgx/X8xwIP7LbXn.CQ4sY3Y7Eo25RuxeazVyTGZWPzs39DS', '2024-10-21 17:02:42', 1),
(149, 'insaffanigltd@gmail.com', '$2y$10$/pcluWa.GKTzmX0LT/c2qOFGQs64xkRr1ZR9UOzi/b7ns7kf45OoS', '$2y$10$5.LUVi9W1P6RlO0cdsIRbeC.r604BAXCi9.e8fTAjCS9B2YZauPPe', '2024-10-22 23:18:29', 1),
(150, 'INSAFFANIGLTD@GMAIL.COM', '$2y$10$gO5tyasSzo79bIvpRUoJn.krPlgM0ko2tSQwiL7eVF3J8KwV73pfm', '$2y$10$Cn1sS7JHJRrMD.4hPVm.geaqBpm4dvzv8JT1cCPkUKyhUV.eLo1E2', '2024-10-23 12:25:10', 1),
(151, 'akinbolawa90@gmail.com', '$2y$10$fqkOQF7Y8FdTLy.GCo5r2ua0GxQfDBZUgmvWBXD/WbbxkLYONoSZO', '$2y$10$sr9IA9AYCDimU2hhKv711e6t/6ZCtj.JXm0vm5NLNF0Nz7HzF1NoO', '2024-10-23 19:25:55', 1),
(152, 'akinbolawa90@gmail.com', '$2y$10$syz.J5wz2lYoS5hrLfDZreFXSeoQegGP2BsxUm1xgUHS6gHRcLqhu', '$2y$10$eQNZuIUEa4ClFWSJA6TIjOiraHNztZTOz1HHG8P4nG3PTatPUkFOK', '2024-10-23 20:56:09', 1),
(153, 'mahmudmohad95@gmail.com', '$2y$10$tsnCVmlbxZ2ucn5QH4FnVeJ8Cp.dCSi3x3uWLGPmtAa6SctE09922', '$2y$10$FnWTU6v4o5fpCXBtBGQ88e/lZGkkwaGRY7eo58oY61P7PaYx6SEE.', '2024-10-23 21:01:57', 1),
(154, 'akinbolawa90@gmail.com', '$2y$10$K3eDpxueXIJUo1bywpg8lu0YVruvC7mMvbv2NOWi2clm3I5355yPK', '$2y$10$cXOVmobWDLg9yM.UwS2ie.paEygIrG3NZiSBmKMo7UpkrB5PUo4F6', '2024-10-23 21:35:52', 1),
(155, 'mahmudmohad95@gmail.com', '$2y$10$Ht4pKU63BHNoqJ8VMUvsruWpIvYww3U4pV2azzFtNLKkfnMw5qZMS', '$2y$10$uLjnZR.BefIedz7ygekCuOn5iUd/IMZVQj.soBIwTm3bV8Wamw8em', '2024-10-24 05:07:56', 1),
(156, 'insaffanigltd@gmail.com', '$2y$10$jbGtevlIEGBhaII/bFZ79O3LI3iQ4HYZxmhUVyIGpJRwbD8rbGWIi', '$2y$10$bDNaDvEGJSysdD8zmgcna.UWwQq1jaxTNPC0lK33LRgU5AbY.ROiq', '2024-10-24 09:49:07', 1),
(157, 'insaffanigltd@gmail.com', '$2y$10$aSXn5ngq96ohxfzxfC1aAe5y3UwnoxeC1WsEpv9yL5Ac6vFmGb1iC', '$2y$10$as/vl4vK5.6iY6d6FF84C.fljEwULtDnL2eDHHPhTwW0IXIpwwH1C', '2024-10-24 16:38:30', 1),
(158, 'akinbolawa90@gmail.com', '$2y$10$6DRa1xt71fWzWdz5ZrC5pOtm7T1Kg8S6Brz45Nj6Ey85suzO4ygz.', '$2y$10$OIwxoOX5sqzNaTxZKUfiY.nsxl5e8iwj0gWnMesCOAXQkAXJ8SJZu', '2024-10-24 19:10:47', 1),
(159, 'mahmudmohad95@gmail.com', '$2y$10$/K/b.6BjksYPMxKYI6TB8u9P1rCGGh2zyssYftvnFVoTjHI/oLMiO', '$2y$10$i9jx/yey/oC532BpbL3o.OjzBH8GY0A5m.sae91.RgktrvzpWRNPO', '2024-10-24 23:28:50', 1),
(160, 'INSAFFANIGLTD@GMAIL.COM', '$2y$10$2xXrxvARc1o3krPX.x8DvOouxv98KTCrfGo9zuJtORTp5GvVcdYcS', '$2y$10$J32yMRQ.YtSWI57oH9UFt.tN8B5LXWvnHMweyZosw4sJvnsVQihYi', '2024-10-25 15:02:28', 1),
(161, 'akinbolawa90@gmail.com', '$2y$10$wqZXIhi8IeBVKJRy1fX6le/CsK1bhUmivXEEsLZAQh0xVftYjh7Q6', '$2y$10$djnDZ7qyVqLHwrB4b4vo4u/wj4lOPKDzuOMEl58V6jTn41syFV022', '2024-10-25 22:21:39', 1),
(162, 'insaffanigltd@gmail.com', '$2y$10$TQ3JBAf6c6h/mRwsn74yDuYosdQJYiubP0VwK9wE2RLy9PSXEeEfG', '$2y$10$Az1Y8LXVrlu0fMxQIQmymetuVMN1eGQ0z6aolt74mVMkE3B4a0IQu', '2024-10-26 16:09:09', 1),
(163, 'akinbolawa90@gmail.com', '$2y$10$Qgbm5t26QmlL0seaWJnQ4e0B7GiOlmzfpFZXUeBClJUD0x/svf5vW', '$2y$10$9c7q5bhh/GDSVqrG5ox9C.269ddsOxENm1gWe5VrbkrTHsexfN2AS', '2024-10-26 22:08:01', 1),
(164, 'akinbolawa90@gmail.com', '$2y$10$IrBK87nodjDgEG8seWTQKeu7yunv6QyCRh5xxvITLk/n620W6kpW.', '$2y$10$Svb8f2Xk5od2eCF5cY.TlO.SBKUdP1zYY7zR4Yna/zmUwCU9BnHEW', '2024-10-26 23:30:20', 1),
(165, 'mahmudmohad95@gmail.com', '$2y$10$7DKugmGSoHnpKe7i.P1MwuwI5qaZaavxBjGCFZV7JHwmMXYv.hy9q', '$2y$10$d.wmg2dK3kKvmbd/NIabheP2XhacsJR88IPGdkyIZogfhSwc0BpqG', '2024-10-27 00:24:38', 1),
(166, 'insaffanigltd@gmail.com', '$2y$10$InDG7Qytr58qhx46GSdoGOG.MwKpsBqtybQkgkgl7W/LAbuEy9IQq', '$2y$10$P9XlTCCbZCMNlBKOH2QCP.IPgOVLY1m70CcrESPh1mzINU07aC.qO', '2024-10-27 15:48:31', 1),
(167, 'INSAFFANIGLTD@GMAIL.COM', '$2y$10$gq4HbvvbACaDlTsE6lNDZeLGh4xxR85HHfBLAnimYHaCD4r9VpYOW', '$2y$10$n6alchr14ClGa5Im6pugB.3ppcvVvOeRT6rCjHETe5ocmY.DaoXq6', '2024-10-27 15:50:15', 1),
(168, 'insaffanigltd@gmail.com', '$2y$10$InsNQ5jR1frt8EM2.XDHNOxk5CHZKUUPd4g2tGslzP0x9bEu6uRUW', '$2y$10$sj2kkn/TP9SYruPNYfUHteA20YXZfPlyUIzC7bh40MfG70KzR.Z4q', '2024-10-27 23:40:11', 1),
(169, 'mahmudmohad95@gmail.com', '$2y$10$rjHSooWWi9QS2Tr20i8kueAvrj240t4d1GVL9xSAEfq1abQAKTDfm', '$2y$10$tvEckAY3T1ofEpZAFSsZS.xzq9t/ygJc85Ttnv77f3bCz7DZNu4Oi', '2024-10-28 10:19:54', 1),
(170, 'insaffanigltd@gmail.com', '$2y$10$Q04p3Ui0UX9AZWqhy9bKgeJlcIAvtoS2IqEcjIA/LFMPygsSW9yv6', '$2y$10$TU.zs/WYpCkvoaQScCc/VuP3MJo2jxiR2ygOexLFNnxFwIGvcNzTm', '2024-10-28 17:40:34', 1),
(171, 'akinbolawa90@gmail.com', '$2y$10$dgmIMiZGjyRA8gFn4u0T8OzxCKT97rOtjJ.nWEHr7R6q3/lpkWCf6', '$2y$10$SKV8siUmhYWPFwjXk10PCO7y1t9pBuz59Rdo/QN8gi56iy8VitJnS', '2024-10-29 16:47:47', 1),
(172, 'mahmudmohad95@gmail.com', '$2y$10$fg.7ES2NDk4zf19vgM4yd.9YBAY.4Krfb2jbIfvnbfXEQGWCWdSNq', '$2y$10$q4ma3IGJZwxzWOO8Cx7vZOs2IY6YYRZoouSmgpiSlhfxMtmthoCX.', '2024-10-30 08:59:26', 1),
(173, 'akinbolawa90@gmail.com', '$2y$10$RXlRioOw7UWwCkUd7X.SG.fH87ys6SHBL8ol1zqKHTC4WWnj0smxG', '$2y$10$g19/76kAdxKbMp.1FCLZv.n37L0.uIlLWxDWv54MXEJtIB2Hfnqfq', '2024-10-30 12:33:34', 1),
(174, 'insaffanigltd@gmail.com', '$2y$10$bkpTd4SExVGKDUpvmXwZBOEWQv3WeeZ/gvvYzgLBbbHzD.3Sy53wG', '$2y$10$TCiyJMu/7RrkU8LK/Mvpj.8dewm56TRLgzsr/Bf7WcfjmVuPzM4Ru', '2024-10-30 17:41:00', 1),
(175, 'insaffanigltd@gmail.com', '$2y$10$cB9r/KJK6.9jCDpXMWs7i.MVVI/IxTiQMNQQ.upeGusHwWPqfezgW', '$2y$10$BP2/ryBh87WV6Kj7asetn.0jP3vYRcJ0P3GO8tzRsKYMXCajx2tP.', '2024-10-30 17:44:41', 1),
(176, 'insaffanigltd@gmail.com', '$2y$10$MHazsslkMByih7y/ERyWs.LJ526aagdkyvGsBwCJi8owN0XgfPmgi', '$2y$10$zK3O.NNQ3TbFfLTFGmLaQu9am7jiYzd2oxXyU/wLihbbx0msFwR1S', '2024-10-30 17:47:37', 1),
(177, 'insaffanigltd@gmail.com', '$2y$10$3hjpHQiAW6TdRst6YKRk2emVCdROxCS.dDPzkSFT1J7/I3hW1oVge', '$2y$10$uRbda5GfNXCkxNFZflEQf.m3CEpm98YBjzkds/3.h9cO3I8zZibMG', '2024-10-30 17:59:52', 1),
(178, 'insaffanigltd@gmail.com', '$2y$10$Skip9Mq1A.EDRV7vKQhWu./q1BgSaDgUcjg6onfVqBvm4CWybc3lq', '$2y$10$NN.i.NhZi3VSMEMb9IoNpuzO/QsB4tA/O/wdDEDhlRL0ZJ6dGtnSS', '2024-10-30 18:03:58', 1),
(179, 'insaffanigltd@gmail.com', '$2y$10$Z.cJhH/QN8kQVVlsIcKu1u4eu5CwV898Yejgk7fSERXaRN3GQ2yjm', '$2y$10$nUYOVOSpW95BD0BCIVcFn.g70k39Ugd/RF93uXKkDMqNpQRS9LukO', '2024-10-30 23:09:37', 1),
(180, 'insaffanigltd@gmail.com', '$2y$10$BO5PO3J1jRRrMF6E2Ffw3ucd3G5yTiubLPS8i6nSYfKNz0sTm3fd2', '$2y$10$v/G6XRv9EYAqYieligtEmu.lT81yfyI44GQUNH2XWdW4Ishgr7g0K', '2024-11-01 09:32:41', 1),
(181, 'akinbolawa90@gmail.com', '$2y$10$hqm1ClGLih6bv9ivOAib4eWAyNXmXPD9v0h1gz9GuQIt494N3klxq', '$2y$10$d385R9Agz6KsOiHLjNIsfOHXjI7teK6qg2yQ/6KD5EIlqflgrEN4W', '2024-11-01 13:21:00', 1),
(182, 'insaffanigltd@gmail.com', '$2y$10$AtXh5QCzT1drYf9kbc6Sx.TtPU1nWJQ6W./3jQ8BQDfmEaB6aHlc.', '$2y$10$EGhSTNZZXx76u7w13QwYA.AthdgAE/Nh1riqJCCGPgnayZD9YHzQe', '2024-11-01 16:40:21', 1),
(183, 'insaffanigltd@gmail.com', '$2y$10$clez67cnPZ0bTaG8C857uOq4Ahu6BYz80XkXn3/9RLT95J.bB9Iiu', '$2y$10$BNWXQroh12N0lxkuqgBmD.XLn4qTAKCBKFFb62CR9BktrsTb3Gmmq', '2024-11-01 20:33:30', 1),
(184, 'insaffanigltd@gmail.com', '$2y$10$NqHK.6SDROJPO7gu01Krg.KasF8P.WoU1JeOb52P2eXkYudzt1uxy', '$2y$10$mDVmLyQDs5MujhlYy6Eiq.W0ol5gZHCSrZvNUZh1pJTFdNVBwmXte', '2024-11-03 09:00:49', 1),
(185, 'insaffanigltd@gmail.com', '$2y$10$EbJX15VUDYu8oKGEYVk/2eJn7e8Yla1kqGhOJ1kEN1aCpDPraiYRe', '$2y$10$qcUx12GC3zv0qnWWA92HvOBNxnnTa5nOZ3plY9RV1v3M26Q145Xke', '2024-11-03 09:00:49', 1),
(186, 'insaffanigltd@gmail.com', '$2y$10$51YfelJuMg6vBlKQ/kV15O8wunyUEqZ3WIHWiBwKdPS2q6j4mcHm2', '$2y$10$3H62Cz7koa5f4F7Nhp/qeODf9FCgr7JQNQhrznpXNRxZPHdyOxgt6', '2024-11-03 09:01:13', 1),
(187, 'insaffanigltd@gmail.com', '$2y$10$J7ld6.bT7HnRGyC6qQHuKeOxJT0qbRrhv437I.vSSwbsFGwmvbj6S', '$2y$10$5YuLVo1yDOPEIU0SjM69CeK/9QcHgsh2jlFrYDbLAnU.1a9Fd1TtW', '2024-11-04 09:20:30', 1),
(188, 'insaffanigltd@gmail.com', '$2y$10$s0Ikywx4Mt2oBbjHvA295.SbNoaaesCPB.bDBKU.lZpSkHCxwnuny', '$2y$10$U3BkQbH/8OcKIrvxQFLymOHeBw8HLi3HwCSOjKDErgBSSsOnRTRM.', '2024-11-05 08:27:08', 1),
(189, 'insaffanigltd@gmail.com', '$2y$10$CwrqZpN3tsImo9O9Yera6OH0U4tzEsjrYnmYk./uOx67cUz5dR5iC', '$2y$10$YFUGK8.GKwpWh/rpch8TWuKVLkjiWUe.z4RCYhSz5EB7/n9Zvh8n.', '2024-11-06 10:27:37', 1),
(190, 'insaffanigltd@gmail.com', '$2y$10$AztG0DI2K7ShpmOzHJVBpOFcZwQnTr97PiK.LS22UGXH6.n2fPLNy', '$2y$10$602tSaEY03D9pamgjNLo0.qT1gFHzyV7jx9QzprjhsIHzXcTYwyZC', '2024-11-07 16:48:04', 1),
(191, 'insaffanigltd@gmail.com', '$2y$10$p8uj7lL4tq3.aGkkfYBPuuPy3cTABfJV6.fLEKn12rOSiU3a0iyHi', '$2y$10$cd2mxElnXiZZsIiS7KIvPOTJ54A1wowHZwjkHotfG7lC3gDlCOrtS', '2024-11-11 23:21:33', 1),
(192, 'insaffanigltd@gmail.com', '$2y$10$2bAZHPIxP1OsOzpVt4Oqkegxgh7RJR7f7C9MHFvUdy6IG3ptQQNpu', '$2y$10$xrD8qHEQfuIUbzyPtPqYq..xCQMNFEfBXoCpH7LAjUZAxg/5ajDAC', '2024-11-12 12:01:29', 1),
(193, 'insaffanigltd@gmail.com', '$2y$10$0.fJj0Zd8hpLSE3t9UqIY..2JWghn3DZt90px/PK9HOjSiqdw/Wka', '$2y$10$3pUoZgRQpzsY7j9P6w034eqYkDYw2XYcAsnfBBWmcaBf5C1fABHs2', '2024-11-13 11:19:46', 1),
(194, 'akinbolawa90@gmail.com', '$2y$10$ZuuFNkCcjwBCBZLbQwu2mulBr49yL1xH9QbDMdVkDTiqigE01aEbi', '$2y$10$IEvOZyAmmnZ.545JzgLMp.GbuKy0jx7RsNrI/vhQDmU3YloNfoIsq', '2024-11-13 12:42:51', 1),
(195, 'insaffanigltd@gmail.com', '$2y$10$zUIGd8gT5E4xcajaNrAigevIysKbqZ6RbHk9FySRsCXXV4uRfocPe', '$2y$10$oEZYSkk/L53gdDacOWcfRu963h4f58W6cJGNg43XfkrWwuv2zbT4W', '2024-11-14 11:48:17', 1),
(196, 'ajuwonoluwa@gmail.com', '$2y$10$OE1rMfbNFdNt5dV9EsSDj.Knbhj/HDq13p4AP8ScPjntnT6JTZmyW', '$2y$10$dZw7kiAvdYO0wei0wHpt1en/b7R2nCm45YDDcO22oiJ7bH9q/sFIq', '2024-11-15 03:33:03', 1),
(197, 'ajuwonoluwa@gmail.com', '$2y$10$VbuyIIHZ7fZ26CZJ5dHAPeUo7zgHTDjrCJh0kSHnE9aV//XkkQiAW', '$2y$10$V3eiSZbvrx9QG9EHUJRhP.mlOrWkLn9NuT5638aTAm3vgdxb6lwMq', '2024-11-19 11:27:25', 1),
(198, 'insaffanigltd@gmail.com', '$2y$10$sD2OjKIkGp9DWYiud11VUeaSp8Ao4/10q1Edl47Z16OipQzlRRtM2', '$2y$10$KYLUqXpGGki5pWbI8NBnJOm4kNUrBGyFP8.AbeadW/SK1mIqYoutq', '2024-11-19 13:18:56', 1),
(199, 'ajuwonoluwa@gmail.com', '$2y$10$t9ShN3uzycfP8Hi9/wy1UOK7D1I8sEvY.6XT6WBWFCFB5UIBwwPFW', '$2y$10$1T0r2zqYyVCJkTdg49A7IeX3vE7ymgpn3KDmYhbEHewkqeDb89lHS', '2024-11-24 14:13:47', 1),
(200, 'insaffanigltd@gmail.com', '$2y$10$..5SmFTj6jJcO/Wfc3zZFuyYmAjHBhs05zM.G2VRBnhnju7RpBW0W', '$2y$10$XpGZ0P1ChQhfcxJ3DHgtLeYbfRiynRnEf8wyCPMDom/ptgbyajzKi', '2024-11-26 12:00:31', 1),
(201, 'mahmudmohad95@gmail.com', '$2y$10$c0MJ50hHTlbICqtyY6V3dOL35hxIt7oSbmB7MIPITaOm1GvUIxVr2', '$2y$10$bqEMvnrS2McsrUyc64FvuuEa/5zWs4KbXBG5W0A1EicG2wYENkTDi', '2024-11-26 12:54:39', 0),
(202, 'ajuwonoluwa@gmail.com', '$2y$10$bKdZW14mRfHRLCWM53vMOeKxsPWfvm7W/bRZWdLISHs2GHuykHyvu', '$2y$10$DQzDwjj95TArdmJNaFst0ebeeAM8uTI7O3wKUDNOBduRB56YmI0O2', '2024-11-27 09:09:17', 0),
(203, 'insaffanigltd@gmail.com', '$2y$10$CbJ98ZLd/gPCIWpvyJFM2uaHoJzo9FEP6KWdHLDhpju8P0.ACjAZa', '$2y$10$dPgZh9HMtrqMFBQN5baTIuGEwZZs.Cuz4CXQfIDr9h/6yGVU9kelG', '2024-11-29 20:10:58', 1),
(204, 'hassankamzahab@gmail.com', '$2y$10$CdYxJW6KyHhBTxMsBK4xz.ttFfQfhCcwqqDDCAAuYXZKaS59ueJfG', '$2y$10$aiFl8CNYTOlRU3e8oJBXcOtFWSlpbdChAvqTvBM8m8wEUTwiaWBlW', '2024-11-30 22:56:38', 0),
(205, 'insaffanigltd@gmail.com', '$2y$10$wGCw9fNpi8QMJ3vezz/1l.IrVkuBC/H5bxpH.CyhTk/C/0CuInIji', '$2y$10$rM..6UMNmzIpGISZRIP1Wu35/.qTOqf.zvx1dmGOeCg1gdZMNjtEO', '2024-11-30 22:58:53', 1),
(206, 'insaffanigltd@gmail.com', '$2y$10$BVdVFJ4YNKqVO1L.u5Ck9e.ztHr8FJ5Cp4xpAs4STp0T3SY6DUEWu', '$2y$10$lZ5frHqAFDp35SZQC.ae5uIrtL7XsTuH8WkHjQSG7kVjWWIuOAjzO', '2024-12-02 16:58:54', 1),
(207, 'insaffanigltd@gmail.com', '$2y$10$r5/ckTcIGVF3jDgk0dapRu5AS7fDFliqPnBPhpUaViE6v8cA4tKOW', '$2y$10$cRWgYQln76v1O5/YW2cROelm01.2.GFYUzuxVNFbtYC0NfxGinus.', '2024-12-03 23:46:59', 1),
(208, 'insaffanigltd@gmail.com', '$2y$10$HZ7/P/oFDgvwR8OD55lP0eTr/CoCVGF3PHGQv0yXreg2SnSKK4ORC', '$2y$10$FG32CLzxgDdoMOCXz/QVB.nyuwYuMEPtjviI1NzTWE2bLx6O8/pVm', '2024-12-04 23:44:07', 1),
(209, 'insaffanigltd@gmail.com', '$2y$10$9Cfxe8S7.XjsrERL39X4XugOYTTcpnl20PqEG3qVbSJ6gBQqw7avK', '$2y$10$KxCYm2kNfuUmtI9Xe7TIsODL47SFsPlzYYsaRfBAQ/3PUNuLhEcyi', '2024-12-06 13:26:37', 1),
(210, 'insaffanigltd@gmail.com', '$2y$10$3s0jCnjI4cX/Q2XWUYN.Yu4XJOKFANnq2OQFFhVy5emiiMIca8Yz2', '$2y$10$JmzYc1xK.Prq4h.JKll9o.rMwFsPLWOBdB17WTOgF6/0Fvbov51D6', '2024-12-07 12:08:19', 1),
(211, 'insaffanigltd@gmail.com', '$2y$10$g3N3UQSqKOoC8csAi3v7BOvbA8jArTs3e8Pc3grRL5ILKeAIY7h7i', '$2y$10$tHjm.Kp/yBFUW3XYvtr7c.Bz/82UoVcXsBkBxK4OVy6VmrfresCIa', '2024-12-08 09:48:52', 1),
(212, 'insaffanigltd@gmail.com', '$2y$10$5EaCqaoM61dUjLtOYGYKuea2tSyZlbk7YinvUbiXUq4PbxlWSUwvq', '$2y$10$fjCfpEZGSWIiOhfSgBQY7.p42glhAot1bKeY5gxDVxoTyDUqcabBC', '2024-12-11 11:28:14', 1),
(213, 'softwareclone@gmail.com', '$2y$10$eZ6B15sjhTh4B3ExuJKtguIHKr8IAsVE3Rbder8Tcar2UXfRFqknu', '$2y$10$mKsH4UU1z3ILsfLJRRDsG.6hzcSj2N7dqBsU5oIObAnplMK8Lv5Sq', '2024-12-11 11:51:39', 0),
(214, 'insaffanigltd@gmail.com', '$2y$10$Sf3iPmoQkSAHT5zVK436rueCjeQGvrltytEk49EbXyL3oykD3aNOi', '$2y$10$sTCxfyAzeV8L/0WNdABv.umKFdFyKmYUiVnIQ3dU17MhEcRJa3dhC', '2024-12-13 17:25:32', 1),
(215, 'insaffanigltd@gmail.com', '$2y$10$EyYY6HEur2U/xiF4N3snq.HChc7Is9BIhMFl4vsHbZeC3PhjnsF5W', '$2y$10$4ekTz3Ub5VL0AnEvoUdTOek3V3B8jsGF/ypP20.siZBFDq4pAY3wy', '2024-12-14 13:35:22', 1),
(216, 'insaffanigltd@gmail.com', '$2y$10$mrm3mXZmZrYTpJ/IqJ3qauOI77.GfgdMHLmo2Tl75.u2bjXJVSX.e', '$2y$10$mlS1kzPqfBCNLFYGIXzZg.sSxTRAkX25M.aN6OKTa9F7Ude3yHSzG', '2024-12-15 12:06:56', 1),
(217, 'insaffanigltd@gmail.com', '$2y$10$f5RviTtknuMHVicBylMpZ.xHDMFcHeuR4Xtmnpna/lSbGrOGhfed6', '$2y$10$0./eRFildIGGGmqwRO4kQemT2/sx/FUz7aEoRkE1xiU8lEO6rIipC', '2024-12-16 23:25:13', 0),
(218, 'akinbolawa90@gmail.com', '$2y$10$iyKVoT1DJLwfmcw5AxuMhuKdiEoulWjwI8Hp4U10iDUbMqSDDa66m', '$2y$10$PFMQxv5iie3ANHbY98PL3OoQ6aJ91jQe7owr2Id4YMhZdoM.wEbjC', '2024-12-17 10:28:33', 1),
(219, 'akinbolawa90@gmail.com', '$2y$10$92zguHSrrxYBPxrek6mWh.SjxmXGIL2m3a64WNMcFcJbVs8CXwEQa', '$2y$10$V/EniMBNq7NSq14tGLkEIOcyrDp7NTQO2kIM5P6BJdYWxyi6Jbpc.', '2024-12-17 19:16:54', 0);

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
  `transaction_id` varchar(255) NOT NULL,
  `request_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `response_description` varchar(255) NOT NULL,
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
(356, '08062466112', 235, 235, 'azzeetech.it@gmail.com', '08148776644', '949313817887284211', '949313817887284211', 'MTN Cheap Data', 'success', 1, '2023-02-03 22:37:18', 1, NULL, 1),
(357, '09082026470', 980, 1000, 'azzeetech.it@gmail.com', '08148776644', '', '573747086391894035', 'ETISALAT', 'Insuficient Balance', 0, '2023-02-05 14:53:55', 1, NULL, 1),
(358, '09082026470', 490, 500, 'azzeetech.it@gmail.com', '08148776644', '522181465689629045', '522181465689629045', 'ETISALAT', 'Airtime Purchase initiated', 1, '2023-02-05 14:54:16', 1, NULL, 1),
(359, '08062466112', 49, 50, 'azzeetech.it@gmail.com', '08148776644', '779825308994325987', '779825308994325987', 'MTN', 'Airtime Purchase initiated', 1, '2023-02-05 15:01:05', 1, NULL, 1),
(360, '08062466112', 492, 500, 'azzeetech.it@gmail.com', '08148776644', '763197505984504908', '763197505984504908', 'MTN', 'Airtime Purchase initiated', 1, '2023-02-05 17:26:21', 1, NULL, 1),
(361, '08060989901', 49, 50, 'azzeetech.it@gmail.com', '08148776644', '', '474994102684604056', 'MTN', '', 0, '2023-02-09 10:39:14', 1, NULL, 1),
(362, '08060989901', 49, 50, 'azzeetech.it@gmail.com', '08148776644', '', '505575469151965551', 'MTN', '', 0, '2023-02-09 10:41:27', 1, NULL, 1),
(363, '08060989901', 49, 50, 'azzeetech.it@gmail.com', '08148776644', '', '148495897933257889', 'MTN', 'Insuficient Balance', 0, '2023-02-09 10:42:02', 1, NULL, 1),
(364, '08060989901', 49, 50, 'azzeetech.it@gmail.com', '08148776644', '', '406580868176937668', 'MTN', '', 0, '2023-02-09 10:42:55', 1, NULL, 1),
(365, '08062466112', 98, 100, 'azzeetech.it@gmail.com', '08148776644', '', '382647488248061159', 'mtn-data', 'LOW WALLET BALANCE', 2, '2023-02-09 10:43:46', 1, NULL, 1),
(366, '08062466112', 230, 230, 'azzeetech.it@gmail.com', '08148776644', '', '610495074488926088', 'MTN Cheap Data', '', 0, '2023-02-09 10:49:01', 1, NULL, 1),
(367, '08062466112', 115, 115, 'azzeetech.it@gmail.com', '08148776644', '153001415939764242', '153001415939764242', 'MTN Cheap Data', 'success', 1, '2023-02-09 10:50:10', 1, NULL, 1),
(368, '08062466112', 230, 230, 'azzeetech.it@gmail.com', '08148776644', '', '396055617560965892', 'MTN Cheap Data', '', 0, '2023-02-09 10:58:27', 1, NULL, 1),
(369, '08062466112', 230, 230, 'azzeetech.it@gmail.com', '08148776644', '', '403662437253843415', 'MTN Cheap Data', '', 0, '2023-02-09 10:59:54', 1, NULL, 1),
(370, '08062466112', 130, 130, 'azzeetech.it@gmail.com', '08148776644', '732627688242248570', '732627688242248570', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-02-09 11:11:05', 1, NULL, 1),
(371, '08060989901', 49, 50, 'azzeetech.it@gmail.com', '08148776644', '', '489905314162860156', 'mtn', '', 0, '2023-02-09 21:10:40', 1, NULL, 1),
(372, '08060989901', 49, 50, 'azzeetech.it@gmail.com', '08148776644', '', '167644572301653778', 'mtn', '', 0, '2023-02-09 21:12:56', 1, NULL, 1),
(373, '08060989901', 49, 50, 'azzeetech.it@gmail.com', '08148776644', '', '594888416789000003', 'mtn', '', 0, '2023-02-09 21:13:31', 1, NULL, 1),
(374, '08060989901', 49, 50, 'azzeetech.it@gmail.com', '08148776644', '', '868765211287398139', 'mtn', 'LOW WALLET BALANCE', 2, '2023-02-09 21:19:56', 1, NULL, 1),
(375, '08062466112', 98, 100, 'azzeetech.it@gmail.com', '08148776644', '', '945184818809070032', 'mtn-data', 'LOW WALLET BALANCE', 2, '2023-02-09 21:21:12', 1, NULL, 1),
(376, '08062466112', 230, 230, 'azzeetech.it@gmail.com', '08148776644', '190593026798276510', '190593026798276510', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-02-09 21:22:22', 1, NULL, 1),
(377, '08062466112', 140, 140, 'azzeetech.it@gmail.com', '08148776644', '705458761514650055', '705458761514650055', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-02-09 21:22:59', 1, NULL, 1),
(378, '08148776644', 2977, 3000, 'azzeetech.it@gmail.com', '08148776644', '', '542962498343378568', 'dstv', 'LOW WALLET BALANCE', 2, '2023-02-09 21:33:35', 0, NULL, 1),
(379, '08148776644', 3034, 3050, 'azzeetech.it@gmail.com', '08148776644', '', '746439471469682073', 'ibadan-electric', 'LOW WALLET BALANCE', 2, '2023-02-09 21:40:36', 0, NULL, 1),
(380, '08148776644', 2183, 2200, 'azzeetech.it@gmail.com', '08148776644', '', '749819915267662307', 'dstv', 'LOW WALLET BALANCE', 2, '2023-02-09 21:52:40', 0, NULL, 1),
(381, '08064431056', 440, 440, 'azzeetech.it@gmail.com', '08148776644', '', '188802239573037698', 'MTN Cheap Data', '', 0, '2023-02-11 10:03:03', 1, NULL, 1),
(382, '08062466112', 985, 1000, 'azzeetech.it@gmail.com', '08148776644', '', '580065546330393969', 'mtn', '', 0, '2023-02-12 09:25:40', 1, NULL, 1),
(383, '08062466112', 230, 230, 'azzeetech.it@gmail.com', '08148776644', '', '417413847553863481', 'MTN Cheap Data', '', 0, '2023-03-11 12:20:13', 1, NULL, 1),
(384, '08062466112', 230, 230, 'azzeetech.it@gmail.com', '08148776644', '420040440253792318', '420040440253792318', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-03-11 12:31:36', 1, NULL, 1),
(385, '08062466112', 230, 230, 'azzeetech.it@gmail.com', '08148776644', '701068143968255323', '701068143968255323', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-03-11 13:05:09', 1, NULL, 1),
(386, '08062466112', 230, 230, 'azzeetech.it@gmail.com', '08148776644', 'ID9326851747', '918659333389585150', 'MTN Cheap Data', 'Successful', 1, '2023-03-11 13:06:20', 1, NULL, 1),
(387, '08060989901', 98, 100, 'azzeetech.it@gmail.com', '08148776644', '', '794704532549865093', 'mtn', 'LOW WALLET BALANCE', 2, '2023-03-11 13:07:39', 1, NULL, 1),
(388, '08148776644', 1044, 1050, 'azzeetech.it@gmail.com', '08148776644', '', '550831231671004550', 'ibadan-electric', 'LOW WALLET BALANCE', 2, '2023-03-11 13:11:57', 0, NULL, 1),
(389, '08062466112', 440, 440, 'azzeetech.it@gmail.com', '08148776644', '', '427023420198956501', 'MTN Cheap Data', '', 0, '2023-03-11 14:28:24', 1, NULL, 1),
(390, '08062466112', 440, 440, 'azzeetech.it@gmail.com', '08148776644', '', '749914250707955074', 'MTN Cheap Data', '', 0, '2023-03-11 14:30:48', 1, NULL, 1),
(391, '08062466112', 230, 230, 'azzeetech.it@gmail.com', '08148776644', '', '571744742356084406', 'MTN Cheap Data', '', 0, '2023-03-11 15:32:00', 1, NULL, 1),
(392, '08160327173', 130, 130, 'softwareclone@gmail.com', '08160327173', '', '547819185814344242', 'MTN Cheap Data', '', 0, '2023-03-13 12:17:56', 1, NULL, 1),
(393, '08062466112', 150, 150, 'azzeetech.it@gmail.com', '08148776644', '396025130450044234', '396025130450044234', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-03-14 13:31:56', 1, NULL, 1),
(394, '08148776644', 7550, 755, 'azzeetech.it@gmail.com', '08148776644', '', '629425187957206467', 'neco', 'Insuficient Balance', 0, '2023-03-14 13:34:30', 0, NULL, 1),
(395, '08160327173', 250, 250, 'softwareclone@gmail.com', '08160327173', '2322396', '401772337433301660', 'MTN Cheap Data', '', 1, '2023-03-14 14:12:57', 1, NULL, 1),
(396, '08062466112', 470, 470, 'azzeetech.it@gmail.com', '08148776644', '388175041133002399', '388175041133002399', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-03-15 18:33:28', 1, NULL, 1),
(397, '08062466112', 250, 250, 'azzeetech.it@gmail.com', '08148776644', '2332959', '835919273571706450', 'MTN Cheap Data', '', 1, '2023-03-15 18:33:55', 1, NULL, 1),
(398, '08062466112', 470, 470, 'azzeetech.it@gmail.com', '08148776644', '328398164117422314', '328398164117422314', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-03-22 22:42:32', 1, NULL, 1),
(399, '08062466112', 250, 250, 'azzeetech.it@gmail.com', '08148776644', '896123605333802375', '896123605333802375', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-03-22 22:42:57', 1, NULL, 1),
(400, '08062466112', 470, 470, 'azzeetech.it@gmail.com', '08148776644', '169142546873961644', '169142546873961644', 'MTN Cheap Data', 'Transaction Failed', 2, '2023-03-23 22:04:37', 1, NULL, 1),
(401, '08160327173', 97, 100, 'mahmudmohad95@gmail.com', '08160327170', '', '994658778666002041', 'smile', 'Insuficient Balance', 0, '2024-07-20 11:29:37', 1, NULL, 1),
(402, '08034420770', 9880, 9880, 'hassankamzahab@gmail.com', '09168851564', '', '303996484654932937', 'Smile Cheap Data', 'Insuficient Balance', 0, '2024-07-20 12:01:06', 1, NULL, 1),
(403, '09168851564', 1750, 1750, 'hassankamzahab@gmail.com', '09168851564', '', '964509351743852720', 'waec', 'Insuficient Balance', 0, '2024-07-20 12:43:52', 0, NULL, 1),
(404, '08160327173', 48, 50, 'mahmudmohad95@gmail.com', '08160327170', '', '358824712327609275', 'smile', '', 0, '2024-07-21 08:11:59', 1, NULL, 1),
(405, '08160327173', 48, 50, 'mahmudmohad95@gmail.com', '08160327170', '', '655946178669301013', 'smile', '', 0, '2024-07-21 08:28:10', 1, NULL, 1),
(406, '08160327173', 2147483647, 2147483647, 'mahmudmohad95@gmail.com', '08160327170', '', '174448631451396931', 'mtn', 'Insuficient Balance', 0, '2024-07-22 17:20:38', 1, NULL, 1),
(407, '08160327173', 49, 50, 'mahmudmohad95@gmail.com', '08160327170', '', '568308965610626729', 'mtn', '', 0, '2024-07-22 17:21:21', 1, NULL, 1),
(408, '09038036844', 49, 50, 'mahmudmohad95@gmail.com', '08160327170', '', '995293606252778114', 'mtn', '', 0, '2024-07-22 17:28:20', 1, NULL, 1),
(409, '08160327173', 49, 50, 'mahmudmohad95@gmail.com', '08160327170', '', '470968614683051170', 'mtn', 'LOW WALLET BALANCE', 2, '2024-07-22 18:28:08', 1, NULL, 1),
(410, '08160327173', 49, 50, 'mahmudmohad95@gmail.com', '08160327170', '17216779894950204089883667', '751041955861419535', 'mtn', 'TRANSACTION SUCCESSFUL', 1, '2024-07-22 19:53:08', 1, NULL, 1),
(411, '09168851564', 197, 200, 'hassankamzahab@gmail.com', '09168851564', '', '146396529889340178', 'mtn', 'LOW WALLET BALANCE', 2, '2024-07-22 20:53:45', 1, NULL, 1),
(412, '09168851564', 98, 100, 'hassankamzahab@gmail.com', '09168851564', '17216817475700269892348839', '680949386468890195', 'mtn', 'TRANSACTION SUCCESSFUL', 1, '2024-07-22 20:55:46', 1, NULL, 1),
(413, '08160327173', 591, 600, 'mahmudmohad95@gmail.com', '08160327170', '', '276681321997776968', 'mtn-data', '', 0, '2024-07-23 09:14:13', 1, NULL, 1),
(414, '08160327173', 250, 250, 'mahmudmohad95@gmail.com', '08160327170', '791703717996872832', '791703717996872832', 'MTN Cheap Data', 'Transaction Failed', 2, '2024-07-23 09:18:16', 1, NULL, 1),
(415, '08160327173', 394, 400, 'mahmudmohad95@gmail.com', '08160327170', '', '497789516771300740', 'mtn', 'LOW WALLET BALANCE', 2, '2024-07-23 21:04:02', 1, NULL, 1),
(416, '08160327173', 344, 350, 'mahmudmohad95@gmail.com', '08160327170', '17217686921619694865676114', '827317639576585131', 'mtn', 'TRANSACTION SUCCESSFUL', 1, '2024-07-23 21:04:51', 1, NULL, 1),
(417, '09168851564', 49, 50, 'hassankamzahab@gmail.com', '09168851564', '', '594299274505719038', 'mtn', 'LOW WALLET BALANCE', 2, '2024-07-25 19:14:15', 1, NULL, 1),
(418, '08160327173', 250, 250, 'mahmudmohad95@gmail.com', '08160327170', '488040793240265513', '488040793240265513', 'MTN Cheap Data', 'Transaction Failed', 2, '2024-07-27 19:28:36', 1, NULL, 1),
(419, '08160327173', 250, 250, 'mahmudmohad95@gmail.com', '08160327170', '6954879', '553419138753481390', 'MTN Cheap Data', '', 1, '2024-07-27 19:37:03', 1, NULL, 1),
(420, '08160327173', 150, 150, 'mahmudmohad95@gmail.com', '08160327170', '6955467', '618471562830262313', 'MTN Cheap Data', '', 1, '2024-07-27 20:11:10', 1, NULL, 1),
(421, '09039923365', 17000, 0, '09039923365', 'CAC Submission', '', 'cac_payment_1723603391', '1', '', 0, '2024-08-14 02:43:11', 0, NULL, 1),
(422, '09160755152', 9850, 10000, 'paulsonbosah@gmail.com', '09160755152', '', '427974505242479130', 'mtn', 'Insuficient Balance', 0, '2024-09-10 14:33:30', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trans_status_tbl`
--

CREATE TABLE `trans_status_tbl` (
  `id` int(11) NOT NULL,
  `respose` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_status_tbl`
--

INSERT INTO `trans_status_tbl` (`id`, `respose`, `status`) VALUES
(1, 'Successful', 1),
(2, 'Failed', 1);

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
(17, 'site-setting', 'Utiplus', 1, 1, 'ti-email', 1),
(18, '', 'Mobile Topup', 1, 3, 'ti-mobile', 1),
(19, '', 'Manage FAQ', 1, 1, '', 0),
(20, '', 'Pay TV Subscription', 1, 3, 'flaticon-381-news', 1),
(21, '', 'Pay Electricity Bill', 1, 3, 'ti-light-bulb', 1),
(22, '', 'Result Checker Pin', 1, 3, 'flaticon-381-notebook-2', 1),
(23, 'my-payment-history', 'Transactions', 1, 3, 'ti-bar-chart-alt', 1),
(24, 'dashboard/quick-pay-bill', 'Quick Payment', 0, 3, 'flaticon-381-price-tag', 1),
(25, '', 'Booking', 1, 3, 'flaticon-381-exit-1', 0),
(26, '', 'Cash-Out', 1, 3, 'ti-credit-card', 1),
(27, '', 'Developer API', 1, 3, 'flaticon-381-settings-4', 0),
(28, '', 'Send Notification', 1, 1, 'flaticon-381-settings-4', 1),
(29, 'dashboard/view-daily-trans', 'View Daily Trans.', 0, 1, 'flaticon-381-settings-4', 1);

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
  `phone` varchar(255) NOT NULL,
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
  `date_join` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`id`, `sname`, `oname`, `password`, `pin`, `email`, `phone`, `school`, `address`, `state`, `town`, `admin_role`, `super_admin`, `token`, `expired_token`, `referal_token`, `status`, `date_join`) VALUES
(58, 'Adeniyi', 'Abdulaziz', '$2y$10$q5DSnpfhThXKhd60422nz.pdjwiHaN5tKifURRbIIFi5IPaCaBlFK', '751f915c24612ce66dba400a86a0909b', 'azzeetech.it@gmail.com', '08148776644', '', '', '', '', '1,2,3,4', 1, '$2y$10$p9atQhwQ4T0HFifZt.kJ.eNcLtTn5Uonxhpf40/n.1efUdLNICFhu', 0, 'faea4e0421343dc375631b6de8ad6aaa', 0, '2022-01-09 17:05:56'),
(59, 'Adeniyi', 'Abdulaziz', '$2y$10$q5DSnpfhThXKhd60422nz.pdjwiHaN5tKifURRbIIFi5IPaCaBlFK', '751f915c24612ce66dba400a86a0909b', 'a.a.adeniyi1997@gmail.com', '08060989901', '', '', '', '', '3', 1, NULL, 0, '1a657588263da042203624cdcea97b3b', 0, '2022-01-10 11:31:42'),
(70, 'Oshundun', 'Chris K', '$2y$10$F3x6TA7uewoifyLEy5nuoemYLBeLN.qb7BWkSgXtjZ4Na1vFQ4yyq', '1b36ea1c9b7a1c3ad668b8bb5df7963f', 'chrisktivity@gmail.com', '09029096951', '', '', '', '', '3', 1, NULL, 0, '1f02f152f6a10e9e4c88dcf4b63782bf', 1, '2022-01-10 16:20:01'),
(77, 'syntaxbyte', 'Olamilekan', '$2y$10$Th02OhiCB6rNMZ4tC6fmcecSjWRGQ.En/zya5fzGrSWXNF7qmm4Je', 'a891af9b4934fe765b5778469d1f1f45', 'syntaxbytesolution@gmail.com', '08140236797', '', '', '', '', '3', 1, NULL, 0, '7b603565d099d9ce2f7ac54f2388e8ba', 0, '2022-01-10 17:17:44'),
(78, 'ABDULKARIM', 'KASIMU SALAUDEEN', '$2y$10$bfoHqn2dqtotB5vqMB.Dp.zevp0JnwXyeRXJcSPjN5toY.qgMOQbe', 'e6d678ce7fe7ca55d7ad8000074693ca', 'ak_salau4real@yahoo.com', '08131583488', '', '', '', '', '3', 1, NULL, 0, 'c8b0713896c3e83f2ebbe2c4d60a96e7', 0, '2022-01-10 17:19:08'),
(79, 'Oyewole', 'Abisola', '$2y$10$SvPUcEYe4JNBDHgZfsIVfOdvLxtlps5So1EGhJ.gMIeMgUf/6cNfK', '81dc9bdb52d04dc20036dbd8313ed055', 'oyewoleabisolar@gmail.com', '08087652277', '', '', '', '', '3', 1, NULL, 0, '09e75e77ad21808ae75dc437ca9da984', 1, '2022-01-10 17:36:03'),
(80, 'Adeleke', 'Adetunji', '$2y$10$1rJrhqfdE0ut5Oehv/0v7evQsc5MEYds4oDilY9XehxhOTbFjSwzi', 'bb03e43ffe34eeb242a2ee4a4f125e56', 'adelekeadetunji.a@gmail.com', '07069617944', '', '', '', '', '3', 1, NULL, 0, '0f6c3603cda60a25d24c128b0da06fd1', 1, '2022-01-10 17:39:52'),
(81, 'Ahmed', 'Kabirat', '$2y$10$UHUHVzQpToJ4R3l99yQLOOvwHdNXLnZVhOBaNg1vz5/pgJYWbp5hm', '2d95666e2649fcfc6e3af75e09f5adb9', 'akankeade.it@gmail.com', '08109201360', '', '', '', '', '3', 1, NULL, 0, '24cb5865a4798539053fcae1d5523731', 1, '2022-01-10 19:16:32'),
(82, 'Auwal', 'Musa', '$2y$10$c1aCu.aizGKPdG/oeCPjdOmjX5eUO2rjvfdQQUtddAZL3FdgETWbC', '81dc9bdb52d04dc20036dbd8313ed055', 'atechcomputersnng@gmail.com', '09159308099', '', '', '', '', '3', 1, NULL, 0, 'af4626b8d1ea3b6a97e35c6c5faaf89c', 1, '2022-01-10 21:53:13'),
(83, 'Oshundun', 'Alfred ', '$2y$10$SQ5bmD9AjeU7xnp8e8Oxj.E1IE3J1fX87z9LMIa3pioVPYfc/fHEi', 'b8b4b727d6f5d1b61fff7be687f7970f', 'fredosh2004@gmail.com', '08061904785', '', '', '', '', '3', 1, NULL, 0, 'b8a7ace17c1889cd1221f42fe4a32b4b', 1, '2022-01-10 22:14:57'),
(84, 'Adeola', 'Oluwaseun Daniel', '$2y$10$bu6Dk0JZ0UQD4qUYq49JU.MDuWziD7Sf6WTk4rPI.lVvNpho4Id4C', '367692068f069c135b7d5a3a59e470d3', 'adeolaoluwaseun24@gmail.com', '07060535853', '', '', '', '', '3', 1, NULL, 0, '51a3aab268c5dd41cd115ac95a06fbbc', 1, '2022-01-11 09:39:07'),
(85, 'Alonge ', 'Michael Onimisi ', '$2y$10$RPy5VdAuWwjxT3DSP7DZn.apLEAIZDfXfeALw4nwguirxN4qVs./S', '53f0d7c537d99b3824f0f99d62ea2428', 'kingalongemike24@gmail.com', '07067962426', '', '', '', '', '3', 1, NULL, 0, 'c5ef856ea1234d5db7d703e8497283c4', 1, '2022-01-12 09:46:42'),
(86, 'Banjo', 'Israel', '$2y$10$.2xXr01rxC0EZzvjXENTf.g/lNIhyCZY41ZrcdMfyju3AeHo90sqm', 'b8b4b727d6f5d1b61fff7be687f7970f', 'banjoisraeloluwasegun@gmail.com', '07013946125', '', '', '', '', '3', 1, NULL, 0, '0525aba97e3678c617772e45c5cc6af6', 1, '2022-01-12 13:41:38'),
(87, 'Ajayi', 'Oluwafemi', '$2y$10$pU/Q8E24jt/.InS.9B8rXurr3lZ50G.0sogGlbBZ.08DMpITYfalu', '4a3e00961a08879c34f91ca0070ea2f5', 'ajayitemitope1@outlook.com', '08039629269', '', '', '', '', '3', 1, NULL, 0, 'bb29a97aaf5ea5e9fa0860216c240306', 1, '2022-01-13 11:12:09'),
(88, 'Adeleke', '\'Debayo', '$2y$10$qZoPjM5BoCXe/m.SYSsJKOa1D6csSxaBPIiAzFknjsOSPvposXLqa', '0cf0613553f1dd3f98b4009b31c52618', 'thomasdebayo@gmail.com', '08160611808', '', '', '', '', '3', 1, NULL, 0, 'a2ae6dc4b6fe89d2283d0f12f8bd1701', 1, '2022-01-13 12:11:35'),
(89, 'Muhammad', 'Abdu', '$2y$10$usyr.yKmXHyYJgVbrwEOteI1MD4tSvg8MfeVTyOtgC.mRVvQS8rP.', '34609bdc08a07ace4e1526bbb1777673', 'ningikamil51@gmail.com', '07067777942', '', '', '', '', '3', 1, NULL, 0, '2069c600347f932d0f60fc26fb60df8e', 1, '2022-01-14 11:26:29'),
(90, 'utiplusgoogle', 'playstore', '$2y$10$NrxUcD3f/yFCq5xAjZhwE.IR/.eFLwY/TaJ/8/n8bQvVbzk75xNN.', '81dc9bdb52d04dc20036dbd8313ed055', 'googledemo@utiplus.com', '08140236797', '', '', '', '', '3', 1, NULL, 0, '9abad96974024380c7fa94e9800ac379', 0, '2022-01-17 08:38:15'),
(91, 'Oshundun', 'Oluwafunmilayo', '$2y$10$IId7LJBJgc6Pr00scx8touyWQ1sxW.hfhOUWcXAsrJQfisErmk8gO', 'f7cade80b7cc92b991cf4d2806d6bd78', 'funmilayofagbola@gmail.com', '08131813684', '', '', '', '', '3', 1, NULL, 0, '1d3ab640ea7706d836d3ab80dc4987bb', 1, '2022-01-17 13:09:37'),
(92, 'Oshundun', 'Taiwo', '$2y$10$VLBKvy152dg/gGQvpjV/a.JjIQDmvl9FN8dlhVJOqsmW7HcbeXKlm', '9701a1c165dd9420816bfec5edd6c2b1', 'oshunduntaiwo@gmail.com', '08138660522', '', '', '', '', '3', 1, NULL, 0, 'd2b8894d38359000fe9b6a9a4ca8c523', 1, '2022-01-18 15:40:40'),
(93, 'hwwsuwshuw', 'dwdxwqdxws', '$2y$10$ox6CsDo5w.MzO1p6hD2LLehnEedaA43ulc43ZlUoLUTnalOzbQlMq', '934b535800b1cba8f96a5d72f72f1611', 'adeniyi@taweer.com', '08148776641', '', '', '', '', '3', 1, NULL, 0, '83984cea2833f99e8509c29b0446cb4d', 1, '2022-01-19 16:38:54'),
(95, 'Muhammad', 'Mahmud', '$2y$10$H85Xk1zT4xACrxyOdfCj6.OV9//Ls3Hkq5oY0uwwa.i8uksmK2yt6', '17b3c7061788dbe82de5abe9f6fe22b3', 'intellisensehq@gmail.com', '09039564267', '', '', '', '', '2,3', 1, '$2y$10$xm0VeyQ5h0ILdhAHKTbAre/kJ/91jEiFl3KeAbvb5Ek/81dl2.Bmu', 0, '3374fd81f85d5c79f50ae38f614a9430', 1, '2022-07-04 11:47:07'),
(96, 'Karama', 'Ibrahim ', '$2y$10$TlP5UNeEGsJFuPyiN6xmRejb1myEzMr2vK56UARcRDtPhAJc5BtV2', '4a7d1ed414474e4033ac29ccb8653d9b', 'alhassann01@gmail.com', '08099039988', '', '', '', '', '3', 1, NULL, 0, '651b7a230e1040e9e9cad3c94afd3352', 1, '2022-07-04 15:29:38'),
(97, 'Sani', 'Abdulkarim', '$2y$10$N/v3MvPdnWd9xAIrHTVvYuXpqKIr7jwnuC5Oeku4zvm8zaCPlaEcq', 'c6bff625bdb0393992c9d4db0c6bbe45', 'abdulkarimahmad303@gmail.com', '09036146733', '', '', '', '', '3', 1, NULL, 0, '6d974d59b3620207db8d7e29f9558cb8', 1, '2022-07-05 18:22:45'),
(98, 'Balarabe', 'Idris Balarabe', '$2y$10$nPSW0dOVIPy5NbO4RYY6MOq3Gx.cYJsLNO9Kh/Zz21MZ4Tmm7xrdK', 'dc513ea4fbdaa7a14786ffdebc4ef64e', 'ibsumaila03@gmail.com', '07082699316', '', '', '', '', '3', 1, NULL, 0, 'b6499acf4677e011dbbbf2bbb75a5fec', 1, '2022-07-06 11:42:37'),
(99, 'muhammad', 'Abdulnasir', '$2y$10$tPRnqUZWWgfQAEhmWVvbCOwaFjHpO.34FeQrWasDmsJMuyglGTuxW', '4607e782c4d86fd5364d7e4508bb10d9', 'mz1929@yahoo.com', '08167881982', '', '', '', '', '3', 1, NULL, 0, '87cb1fe8ea7ba26c04e959f791c5852a', 1, '2022-07-06 12:39:20'),
(100, 'Abba', 'Saad Nasir', '$2y$10$n2XzvwVOWq8SI0yCe/esp.EETntQb1uq7M5BxZUgqquuHxRQ8oE.a', '113180fa10fcf7a118ecdbcd21c4cd24', 'saadnasir470@gmail.com', '08106100930', '', '', '', '', '3', 1, NULL, 0, '38888e18429ea04a02c5b30f7e55808f', 1, '2022-07-06 13:55:52'),
(101, 'Prince', 'ishaq', '$2y$10$kFTn/cAOwcs82onVbJPCR.NmEnCWa/Cwn73iqoDUDaJatXn0B75fW', '06bf16f1f0372a63d520eac6cf7c5af7', 'princeishaq53@gmail.com', '08108576215', '', '', '', '', '3', 1, NULL, 0, '9fbf36664b3c46ec5401ecfe0162eb7a', 1, '2022-07-06 15:33:27'),
(102, 'Docty', 'Tanimu', '$2y$10$INU/V3YGmo5gF/kB6JSfmOo6jkLN3uC9Gg.6guI6vuSAbl52lQUgW', '1074cf6dee6fd3a453ea3fa9d190a430', 'docty747@gmail.com', '07036161294', '', '', '', '', '3', 1, NULL, 0, 'c74067f405df94d756d726b6298a45e7', 1, '2022-07-06 16:50:15'),
(103, 'Muhsin', 'Sheshe', '$2y$10$epzlYiUdhAUtuPzuvUgI7.SeHZHzuXd0n5MX4MfCrb1MHIB9mEHEu', '81dc9bdb52d04dc20036dbd8313ed055', 'muhsinnasirsheshe@gmail.com', '08067449878', '', '', '', '', '3', 1, NULL, 0, '3d084b23013efe2f48e9e78d5fdf6608', 1, '2022-07-07 05:31:17'),
(104, 'Musa', 'Mubarak ishaq', '$2y$10$ZtzKK0QtA2irrb4cfOwnY.79tAqRyK45ccuvYZ1.gQ52Mst3II/YG', '8217bb4e7fa0541e0f5e04fea764ab91', 'mubarakmusa029@gmail.com', '08133224400', '', '', '', '', '3', 1, NULL, 0, '061e96594598ae5e657164841cd89388', 1, '2022-07-07 06:12:42'),
(105, 'Lawan', 'Sani', '$2y$10$pL5ldkMyUD7VBbrGKRecI.SfACquc8TZIdVvZNkw7HSq1ngfM27Xi', 'a9b4ec2eb4ab7b1b9c3392bb5388119d', 'sanilawanumar@gmail.com', '08137819843', '', '', '', '', '3', 1, NULL, 0, '548058393319939e34b985b0ac4c29e0', 1, '2022-07-07 11:22:19'),
(106, 'Shuaibu', 'Umar', '$2y$10$51q9eFnjSkGkj.TFO0/eduWpNeGVT5lXRBlOS.l2io0EYKvNnA1lq', 'dc513ea4fbdaa7a14786ffdebc4ef64e', 'umarreal411@gmail.com', '08101049704', '', '', '', '', '3', 1, NULL, 0, '2db05a05dddad1b60bd71bcd8b736851', 1, '2022-07-07 19:02:36'),
(107, 'Amore', 'Amigo', '$2y$10$G027DXug3cly5iSyfYbKJuNyCf92LRzzwOG4.v.s34XBvODI1qcxG', '659b7b42e9c002ce0075077cd55a1623', 'Abdulhamidibrahim24@gmail.com', '07066897656', '', '', '', '', '3', 1, NULL, 0, '781e5fb628dc50140fd4f17aabc4c1bf', 1, '2022-07-08 08:32:08'),
(108, 'Khalid', 'Khalid Ahmad', '$2y$10$fO9o7bub2MNNcZBAszWTxu0i1pWa1GVD8OzFmmFYfgn1MFBnOg9AK', '1d72310edc006dadf2190caad5802983', 'kakyansoro87@gmail.com', '08037753686', '', '', '', '', '3', 1, NULL, 0, 'ea8580b14b2ab607aca67ae21a60b8e2', 1, '2022-07-08 08:49:26'),
(109, 'Isyaku', 'Ahmed', '$2y$10$NCbk2bt73gBjKcoyvIqbfuS.V2yRz8gBG8SdDa4wUfny1g7MYWwG6', '46ce6c3c1e23ab2ed612a1a43ebb2929', 'kaidanaka@gmail.com', '07063102700', '', '', 'Kano', '', '3', 1, '$2y$10$afN2Kpit4TmqTI/FbSH7U.JYww7OFrqWUAtQSre4VvEJBM/HLJSVy', 1, '5c66aa442c1b4dfb01efb4da71366a38', 1, '2022-07-09 17:46:21'),
(110, 'Abimbola', 'Johnson', '$2y$10$6pbZVUOizasTm5f26P4ZT.9t.FaMxxo9LAMvMdSBghuseysGoBiSC', '9c415bdd4dd66723ef7b38853ef35ddb', 'bosunjj@gmail.com', '08130705749', '', '', 'Ogun', '', '3', 1, NULL, 0, 'd20780d8274bcd15ca132a272d0d001d', 1, '2022-07-10 13:00:22'),
(111, 'Muhammad', 'Aysha', '$2y$10$HAj8RgnVcijLtif3z/jDk.at6lZF6gTZyIz/52RdWJCek3zPuMMz2', 'a36e841c5230a79c2102036d2e259848', 'ayshamuhammad5318@gmail.com', '09163313546', '', '', 'Kano', '', '3', 1, NULL, 0, '6e6f44764ce859cbe3fae96243a5c6d8', 1, '2022-07-10 14:12:38'),
(112, 'Suleiman', 'Imam', '$2y$10$RyQ6gypc3XvX4h29MQK9HeOVAyxjZllsTOSbq5Vk98EDm2Q64L/q.', '9407c826d8e3c07ad37cb2d13d1cb641', 'hamisusulaimanimam2022+@gmail.com', '08030954622', '', '', 'Katsina', '', '3', 1, '$2y$10$eGuicxZiBm7IA/7TOYQO1eZTTbz12VZmRTovao2ur2LX5mGTK2jLi', 1, '5478b7f39aebe7864da24d09ac6998e8', 1, '2022-07-10 15:00:59'),
(113, 'Muhammad', 'Lawal', '$2y$10$NxBsI9EXLS2.fWg2gTgfxuKTJZU9M/SIvbbvtW/WDwRT58bb5xIpu', '8aa903e40952a84bd7177ad2daeb5962', 'muhammadlawal6767@gmail.com', '08067674307', '', '', 'Kano', '', '3', 1, NULL, 0, 'eaa7d2c990c3fdd70bc7797b64597183', 1, '2022-07-10 17:19:46'),
(114, 'Ibrahim', 'Abubakar', '$2y$10$vnBkRq/dSZV9QUu2UwOFFOJYiNIn9xK.R9xv45hrN9bPpRuoNIIeG', 'a2802cade04644083dcde1c8c483ed9a', 'alsadiqibrahim03@gmail.com', '08067226748', '', '', 'Kano', '', '3', 1, NULL, 0, '46758f31dd91102b0c6a26d446416d2d', 1, '2022-07-11 10:52:28'),
(115, 'Hussaini Maikarfe', 'Tayyib', '$2y$10$6WqaogyKUu5D0QCkJ89F7eWP2HbzANA1EsCYXymxzPOUn3YOBb5lu', 'd5c186983b52c4551ee00f72316c6eaa', 'hussainitayyib@gmail.com', '07036185263', '', '', 'Jigawa', '', '3', 1, '$2y$10$J.KVF/.qmanH9uq7EvvDj.MOq9lzxKu0cZC.d0yYTrTalaRb.ods.', 1, 'c6881ee635662b7b061ce869d1743e45', 1, '2022-07-11 17:37:29'),
(116, 'Umar', 'Abubakar Umar', '$2y$10$DnDERiD0WRsxeAEn0U/v2OmvZrEHXoyDVVPK30hfjTACpxqbY568C', 'eb76c035d5d0a2bd2a0d0834b93c9c26', 'abbaclass31@gmail.com', '08065933381', '', '', 'Kano', '', '3', 1, NULL, 0, '78ee3083e71ffc2afd8d253fc9dd8988', 1, '2022-07-11 18:12:19'),
(117, 'Muhammad', 'Salman usman', '$2y$10$JZmoZn0V6NCDnlmrD4KQyOcfl/rVr426ffzOKXapR9Zk6wVd7bZXG', 'cff02a74da64d145a4aed3a577a106ab', 'salmanusman089@gmail.com', '08039522223', '', '', 'Kano', '', '3', 1, NULL, 0, '8d775fba557ec7673b237bacd8ea9267', 1, '2022-07-11 20:35:57'),
(118, 'Ibrahim', 'Muhammad', '$2y$10$D5V4s48cr6TZsXG0heedAOFrLz4CLE99nKJQy0aWcILvKDmkO7mmi', '7b7a53e239400a13bd6be6c91c4f6c4e', 'muhammadiabubakar5@gmail.com', '08034128805', '', '', 'Kano', '', '3', 1, NULL, 0, 'b3405be49190b166aee5380e305e907c', 1, '2022-07-12 12:55:55'),
(119, 'Umar', 'Hussein Gwadabe', '$2y$10$KkOCxHohJnT./QnLnGr8ceUOd6yilZN.eJa/8avmcmA1zsBOjGdau', '17b3c7061788dbe82de5abe9f6fe22b3', 'husseinumar007@gmail.com', '08165837642', '', '', 'Kano', '', '3', 1, NULL, 0, '3bd7915cceef6dd65aa752389029954f', 1, '2022-07-12 13:45:56'),
(120, 'Jibril', 'Mustapha yusuf', '$2y$10$V.xiJDAw44KwdzSLPuwZ7uqxRmXzQoV4IM7wOcfwtmd/W5fa6jq2e', 'e82c4b19b8151ddc25d4d93baf7b908f', 'mustaphayusufjibril@gmail.com', '08142506318', '', '', 'Kano', '', '3', 1, NULL, 0, '72ea83a4c53d0978ac50b922bde60e63', 1, '2022-07-13 21:24:42'),
(121, 'Ahmad', 'Abubakar', '$2y$10$kknvmq7Jo0N1WF8.xd/gHebEfkbdzk4DU3vKSpMJBjIEvK4u7/J.i', 'c4c32f6c24ee9c91d8debbd72cce2a22', 'Abulazizahmad66@gmail.com', '08092828410', '', '', 'Kano', '', '3', 1, NULL, 0, '701b41bf09d35ad9fc35e214d78a01ae', 1, '2022-07-15 07:03:27'),
(122, 'Rabe', 'Abdulganiyyu', '$2y$10$X3MHaOfeUXKhGzrmXRGuA.ijLlV72MzxWiBbJoCLPOVzAt2PXfTy6', 'b59c67bf196a4758191e42f76670ceba', 'abdulganiyurabe73456@gmail.com', '08030746547', '', '', 'Katsina', '', '3', 1, NULL, 0, 'fe6bf5f8eb06a6fb729e27e2b95c0e36', 1, '2022-07-16 16:42:21'),
(123, 'Ibrahim', 'Muhammad', '$2y$10$bbFB3kjJ3hEs4n8pu8pa0eaOVtGoBOlZIjjLJIHCQrdLlQC/2wNaG', 'a16f3a5bda35f1de87328623f0a1711f', 'muhammadibrahimmuhammed81@gmail.com', '09063714123', '', '', 'Katsina', '', '3', 1, NULL, 0, '86d39aeac46fcb5d953bdb4f9d4ee640', 1, '2022-07-17 14:29:09'),
(124, 'Otu', 'Hassan Joseph', '$2y$10$a5aBaE9Cex0/isgIe3ZpauUFuipX2Ed.o8LKdtnL2Fc9UQbEFQoPi', '4135a6f12bd7b1007140f6c4deec37dc', 'hassanotu1986@gmail.com', '07031626680', '', '', 'Kogi', '', '3', 1, NULL, 0, 'd02a5b807b123c8f333c039378d9daf8', 1, '2022-07-19 19:37:24'),
(125, 'Rufa\'i', 'Abdulhamid Muhammad', '$2y$10$g9S7hpgWlZZM1fRL8/X8VepulVhnHDIZuHjsVySC0/sAWqclPhX7y', 'ebb71045453f38676c40deb9864f811d', 'abdulhamidrm@gmail.com', '07061542740', '', '', 'KANO state', '', '3', 1, NULL, 0, '70d8db3e0a4e51bdc3d252fa829cea1b', 1, '2022-07-21 14:21:00'),
(126, 'Zakari', 'Umar', '$2y$10$hv4abQYMUNm3Pua70/WC8upnhHssZBnrZNZ8COQcgLWjucZaleCOi', 'a82d922b133be19c1171534e6594f754', 'sanizakariumar1@gmail.com', '08033577571', '', '', 'Kano', '', '3', 1, '$2y$10$5M8gpm2kupKGTTqCLWA85uFAkU3exuGgeSys55Ivs9z0d0LMjykZa', 0, 'de02dba62dd25e2794b8072bf5df17d0', 1, '2022-07-22 09:36:27'),
(127, 'Nura', 'Ahmad Hussain', '$2y$10$frvm/M3Ddo19PK8/xW4Wye2h0h1KYe829yKBN4SzvSeh5pdkZgKq2', 'ea5a486c712a91e48443cd802642223d', 'ahmadnurahussain13@gmail.com', '08064354924', '', '', 'Kano', '', '3', 1, '$2y$10$Rn2VFSk/byIhwqJwmlmEQu7.PF8G4mqAOR4/p7jgIY4koMDDJ2.Me', 1, 'ad660b292064976fd41ec81879215b78', 1, '2022-07-23 22:47:05'),
(128, 'Aliyu', 'Shafiu', '$2y$10$0X6ONj0Z21//ZG.NlzDUC.sGLJN1Zvoq9Py9eivBjhigM39uhnKRy', 'a4380923dd651c195b1631af7c829187', 'shafiualiyu005@yahoo.com', '08169788219', '', '', 'Kano', '', '3', 1, NULL, 0, '2e6d5ccb87897894ed9428c52883c488', 1, '2022-07-24 07:54:47'),
(129, 'Usman', 'Muhammad Raji', '$2y$10$l1werz3PpWRTrnmncjrFfej5DNFOxLSJPiFmTxmc0W8d4yaGNEkEq', '967edfdcdfbcc3b2d253fac24326e5b5', 'muhammadraji@gmail.com', '09017663814', '', '', 'Kano', '', '3', 1, NULL, 0, '1fed2b87b4f6a7c1b946c2162e383b9a', 1, '2022-07-24 13:07:20'),
(130, 'Hassan', 'Ahmad', '$2y$10$NjyMEtWtphwxA7vLKyuB5.eK03FbqyRoy5habku.afQeLNuIETEzC', '3ce3bd7d63a2c9c81983cc8e9bd02ae5', 'ahmadhy44@gmail.com', '08184732357', '', '', 'Kano', '', '3', 1, NULL, 0, 'b1caa78555d875633d9a83bd810bdcab', 1, '2022-07-24 18:36:45'),
(131, 'Ahmad', 'Ibrahim', '$2y$10$VfCtUotNBPWvbpJSMuDP.Oec2RgOfLZY6JfhpLECoTmUIvMzG6hA.', '12e086066892a311b752673a28583d3f', 'haliludada@yahoo.com', '07082482382', '', '', 'Kano', '', '3', 1, NULL, 0, '344b6f6ecdb911edb4f88c85f409a531', 1, '2022-07-25 00:07:26'),
(132, 'Mahmud', 'Muhammad', '$2y$10$pu9MN0X.wHf/rCAGsKhVnuzkiX2lr/1ufDYGxoUO621YrHTaAT6Cm', '17b3c7061788dbe82de5abe9f6fe22b3', 'mahmudmuhammad.mm@gmail.com', '09039569161', '', '', 'Kano', '', '3', 1, NULL, 0, 'aefa492a4bef9c033319e200bedf3654', 1, '2022-08-09 16:52:31'),
(133, 'Usman', 'Musa Ahmad', '$2y$10$o8tx3rNQjz2pZgMEMPzmEeHgjAAsDyECFnSOebA2VHJ2R1.qFPpkq', '83715fd4755b33f9c3958e1a9ee221e1', 'abbamooser@gmail.com', '09075524595', '', '', 'Kano', '', '3', 1, '$2y$10$O0sYr2Oil8QZt9phb.GvXeOnaPp0vMQ7MpCqPzYG7Pn/3/5teGh.6', 1, '8e087a2b20774cb9b56c797893f83f08', 1, '2022-08-10 09:09:16'),
(134, 'Imran', 'Sani', '$2y$10$WmR9pW1EK93N0hP1QHVxjesdTdfWqlcmq.sTO/1Tuv5uxwwEPS4i6', '32e05616c8ed659463f9af00b142dd6f', 'sanikaojeimran@gmai.com', '08035014815', '', '', 'Kebbi', '', '3', 1, NULL, 0, '9fa6fe72aff7d82115eba359659bf5a7', 1, '2022-08-14 18:24:51'),
(135, 'Umar', 'Sabiu', '$2y$10$fIowIb3aTMfZqe0sVvp1E.98WuhUY7q0UR1MtoUKd8QrTjeiOqg3m', '2d95666e2649fcfc6e3af75e09f5adb9', 'sabiuumarmuhammad580@gmail.com', '08142790091', '', '', 'Kano', '', '3', 1, '$2y$10$p0wYaZHxqRVkpAqOgJteBuNeGF3iNksb69bzi1FuHZhTP6sLFEBue', 0, 'f18aee9b70109610a7be819a6162f96a', 1, '2022-08-30 21:59:13'),
(136, 'Shaaibu', 'Jamilu', '$2y$10$e/ERu1uHyCvUwTg468WADeMBLXkJm.iH.uUzS..bVYbesz3pqIMui', 'a9b7ba70783b617e9998dc4dd82eb3c5', 'jamilusha77@gmail.com', '08069443467', '', '', 'Kano', '', '3', 1, NULL, 0, '1bf5fde0d86b3c61c6857137b84390aa', 1, '2022-09-10 12:27:35'),
(137, 'Sule', 'Ahmadu', '$2y$10$Ue1Fiu66eywXbS60xjIGBe0o0II1AvAKGMFkhTEk5vu3tNlX.49VO', '594ca7adb3277c51a998252e2d4c906e', 'ahmadusulengelzarma@gmail.com', '08063218171', '', '', 'Yobe', '', '3', 1, NULL, 0, '4c8f33927219f957efde4109aad18360', 1, '2022-09-10 20:04:35'),
(138, 'Sazkid', 'Sagir', '$2y$10$HcmABR5rYqEzgg6fRwo47.VyEXceo7OtJsFHF32Yr1YAEt.phC8hO', '51be2fed6c55f5aa0c16ff14c140b187', 'sagiribrahim416@gmail.com', '08130151579', '', '', 'Kano', '', '3', 1, NULL, 0, '2216df89fdf50edc767d653443284ad4', 1, '2022-09-19 14:44:26'),
(139, 'Mahmud', 'Muhammad', '$2y$10$oQWqfLuvb1IIZCvsMdvJI.4agJW0EdeS9L0QMNOS.rAtd9I2Bo6he', '17b3c7061788dbe82de5abe9f6fe22b3', 'softwareclone@gmail.com', '08160327173', '', '', 'Kano', '', '1,2,3,4', 1, '$2y$10$JoSRDGQ34oTUzR0c1OF0LuyUGhTMg.sxIlupOXM/nkemHgbB//AIC', 0, '169c2aaa8851158979afd6af1589bea7', 1, '2022-11-12 02:31:53'),
(140, 'Aliyu', 'Shafiu', '$2y$10$8QO6e3Qbayna1gInNJD68.WHOvHzzzYogyX.vFVtEi5C66o/icSwi', '0829424ffa0d3a2547b6c9622c77de03', 'Shafiualiyualiyu005@gmail.com', '08169788219', '', '', 'Kano', '', '3', 1, NULL, 0, '2656671385c6661e6b022703d6e3e73f', 1, '2022-11-12 08:53:06'),
(141, 'Umar', 'Sabiu', '$2y$10$imLhkuaucbIdbd6smMGNxuvgcYhRmU9nKyM.qH0AlE2MKA6DWRilG', '2d95666e2649fcfc6e3af75e09f5adb9', 'ahmadyakubu014499@gmail.com', '08142790091', '', '', 'Kano', '', '3', 1, NULL, 0, '5bf62d61b9d919c96b6378b0b87f263e', 1, '2022-11-16 17:40:48'),
(142, 'Aliyu', 'Shafiu', '$2y$10$u/lzDDARSRqaO.U1RQsCD.pRZRF0OIRt4l15eBhBCBunKenI2ctYu', '0829424ffa0d3a2547b6c9622c77de03', 'Shafiualiyualiyu005@yahoo.com', '08169788219', '', '', 'Kano', '', '3', 1, NULL, 0, 'a07092ccf928c9febfe69c98278cccbb', 1, '2022-11-28 13:05:56'),
(143, 'Test', 'Test', '$2y$10$y7q7JxDQRR5mmDEIlx0z2OLkizX74fXnWcwTvkTHh..J4BU.Qzvbe', '81dc9bdb52d04dc20036dbd8313ed055', 'itineryconsults@gmail.com', '12365478901', '', '', 'Kano', '', '3', 1, '$2y$10$iT2Md2d1KX1NhMsUsWGQLuhUsJ8RZc5zx3uvdAK7o10FEZstVlAGi', 0, 'f1ae3dbeff662655cb854972ef2167e4', 1, '2022-12-20 07:01:56'),
(144, 'Olaoluwa', 'Emmanuel', '$2y$10$gD8RJjbohyVp2RwcDTfl5eYc8Ah4wv/9eRdV1xoRXVmRFxzkRTq6G', '81dc9bdb52d04dc20036dbd8313ed055', 'hurlleyz20@gmail.com', '08160140638', '', '', 'Lagos', '', '3', 1, NULL, 0, '13ed7747a0680ec8e72ba5e407d410a4', 1, '2022-12-22 11:38:49'),
(145, 'Maikarfe', 'Alhassan hussain', '$2y$10$DzULECQ3lDLyrFrQ4B0G8.e65Tt0F.3mA1pAq8okC9/Ds3EKgnZXy', 'e4002dc1e7deeaae4ed8e436ef1f3fbe', 'ameeralhassan79@gmail.com', '08106944557', '', '', 'Kano', '', '3', 1, '$2y$10$moOTRcRdvL2xlU3sMTKMWuuNd4FqAm7vrCajXjVXOVt2i5YZV5cli', 0, '55fbaed1361685f958c7f69df53fe491', 1, '2023-02-10 16:32:28'),
(146, 'Intellisense', 'Tech', '$2y$10$gKLNCxRq3Nl56XrJn/vhKet7kyQFP/Gi.EZQru8OWopPSNgkbdRrC', '17b3c7061788dbe82de5abe9f6fe22b3', 'intellisensesoft@gmail.com', '08168638045', '', '', 'Kano', '', '3', 1, NULL, 0, '5fa79a0fd292c47f7bd5e122df8d1c34', 1, '2023-02-23 19:54:55'),
(147, 'Halalboy', 'Usman', '$2y$10$xATsxo2Kl8BzudTRiTNw6uSXr3cumOcTDh.59LbV7JLPex3AE2PRa', '7b7a53e239400a13bd6be6c91c4f6c4e', 'usmanmurtalausman44@gmail.com', '08166739050', '', '', 'Kano', '', '3', 1, NULL, 0, '66b7fe8e842a777fc7c2539f9b1fb1f4', 1, '2023-05-08 17:35:19'),
(148, 'Gabbar', 'Inchofja', '$2y$10$.k0oNgj67mj8jV/WGDASgeN1SlERA/00uwpgCQ3lzbuVDAkF5mQey', '4b4edc2630fe75800ddc29a7b4070add', 'admin@gmail.com', '97542369844', '', '', 'India', '', '3', 1, NULL, 0, '75d23af433e0cea4c0e45a56dba18b30', 1, '2023-11-16 18:08:33'),
(149, 'Mahmud', 'Muhammad', '$2y$10$DuthzS0kRKrupDu1FpghaOJ8D3PpMel1jqIYtY3ZdP5CF4MSBd6ze', '17b3c7061788dbe82de5abe9f6fe22b3', 'softwareclone2024@gmail.com', '08160327173', '', '', 'Kano', '', '1,2,3,4', 1, NULL, 0, 'eae48d1639ab83247507e9f4b2b741b5', 1, '2024-07-18 07:09:02'),
(150, 'Mahmud', 'Muhammad', '$2y$10$gPsWGNHCAJG.HxVDtXhE7udxNHEv31SLuX9WtaMiz8PiRgJT53qKS', '17b3c7061788dbe82de5abe9f6fe22b3', 'mahmudmohad95@gmail.com', '08160327170', '', '', 'Kano', '', '1,2,3,4', 1, NULL, 0, '93276d0b8aef98d7767be69e0820576a', 1, '2024-07-20 11:06:05'),
(151, 'Ahmad', 'Ahmad', '$2y$10$t4uYLprBA9RugK21Sxs8CuZT3tUA4wKpmkpAregreauiqR/80Jiq.', '8cd7775f9129da8b5bf787a063d8426e', 'hassankamzahab@gmail.com', '09168851564', '', '', 'Kano', '', '3', 1, NULL, 0, '5bf3bf88675da002f3ad8e3cf23da04d', 1, '2024-07-20 11:57:53'),
(152, 'Nura', 'Ahmad', '$2y$10$JlkU/fJfRCy2MU4rBaXJPublnbLA9OWtEVR14SDxK9Xb2HvTEvBEa', '8cd7775f9129da8b5bf787a063d8426e', 'kamzahabsolutions@gmail.com', '08034420770', '', '', 'Kano', '', '3', 1, NULL, 0, '3dec19972b8391288bc2836d1b920191', 1, '2024-07-20 14:16:17'),
(153, 'Ahmad', 'Ahmad', '$2y$10$wCLBXWAh81d116EbBYV8hehEQzJWFPgArmm.mc/FX8mr3LeZdIinK', '8cd7775f9129da8b5bf787a063d8426e', 'insaffanigltd@gmail.com', '09168851564', '', '', 'Kano', '', '3', 1, NULL, 0, '053b8baa22d27e5b3f2f660522b2824a', 1, '2024-07-22 19:49:36'),
(154, 'Uzowihe', 'Peter', '$2y$10$aA9KRAIFgYnUQGv.wNN7lONVNL/0rJB1lPsUfieu4BETaRPdQoA.u', '6074c6aa3488f3c2dddff2a7ca821aab', 'raypeter053@gmail.com', '07018411414', '', '', 'Imo', '', '3', 1, NULL, 0, 'c05e0572e2d91730099015b11b565617', 1, '2024-07-23 20:59:02'),
(155, 'Joseph', 'Mike', '$2y$10$M6rlv3a/QyC1sUQjHWNNdOAVelkyFB5UNZHaRhMTP2/7wQQZ0D2kK', '4a8423d5e91fda00bb7e46540e2b0cf1', 'orkuma.mike70@gmail.com', '07030271476', '', '', 'Benue', '', '3', 1, NULL, 0, 'bc5f384c8f2e52611c4afc73595f3ca5', 1, '2024-08-05 11:36:19'),
(156, 'Ahmad', 'Musa', '$2y$10$L/MC2FzPMQAlRwtg1UpUV.cpG7H8cOb1Kf5ofIN520oj4hfWOPeaa', '17b3c7061788dbe82de5abe9f6fe22b3', 'helloworld@gmail.com', '08168630631', '', '', 'Kano', '', '3', 1, NULL, 0, 'd015d44f52731c8e88d8637e445e72de', 1, '2024-08-08 09:23:53'),
(157, 'emejulucodes', 'Emmanuel Emejulu', '$2y$10$GzUnoSwLHBb.IQApduKC6.j0oSZHi6q2lXuKJV2JHwpvoI/zn8Msu', 'abdbeb4d8dbe30df8430a8394b7218ef', 'emmanueljunior433@gmail.com', '09039923365', '', '', 'Anambra State', '', '1,2,3,4', 1, NULL, 0, 'edaddd116e02d98f0843b0c6060e031b', 1, '2024-08-12 11:08:16'),
(158, 'Muhammad', 'Mahmud', '$2y$10$EPa6j/qcQQ/WERkprzqLY.QJi3QRUC9x2rtdvwfS/DY8kaHYIGz2i', '17b3c7061788dbe82de5abe9f6fe22b3', 'codebest@gmail.com', '08160327173', '', '', 'Kano', '', '3', 1, NULL, 0, '706a1d455d2c84cc7aebebb53f48eef3', 1, '2024-08-13 08:48:48'),
(159, 'Ahmad', 'Musa', '$2y$10$a1h6HuXjTw0g8wXIg7vXSOdtLo2iBbfs/l4UEMDqRP.GYPTQa9J3.', '17b3c7061788dbe82de5abe9f6fe22b3', 'cac20@gmail.com', '08160327173', '', '', 'Kano', '', '3', 1, NULL, 0, 'f62b53419d0a4aefc606c52000a5d909', 1, '2024-08-14 05:10:17'),
(160, 'Ahmad', 'Isah', '$2y$10$54vtSQ.rNNX.T66XQf0db.hs8ElqAWhOVvBdxvcfsWEFQLcniIo.G', '17b3c7061788dbe82de5abe9f6fe22b3', 'intell@gmail.com', '08160327173', '', '', 'Kano', '', '3', 1, NULL, 0, 'ce69a6d2ff8ed3d749bd3e17b44bebe7', 1, '2024-08-15 08:47:51'),
(161, 'HASSAN ABDULLAHI', 'AHMAD', '$2y$10$DbiK8iw2BCI6mZF8CH9j2OFhQAgwc8VoJqZRqvI5JkNKRoiheCote', '56468d5607a5aaf1604ff5e15593b003', 'hassanabdullahiahmad7@gmail.com', '07013282806', '', '', 'Kano', '', '3', 1, NULL, 0, '821d2fcdc2b2c8caaadd8bcf998b38bb', 1, '2024-08-16 15:52:56'),
(162, 'bosah', 'chinedu', '$2y$10$Zm24yx6zl0pGFXkiibqEqOxCIa7E2aqUEoZAbWKim2BZ.DNxgaTy6', '81dc9bdb52d04dc20036dbd8313ed055', 'paulsonbosah@gmail.com', '09160755152', '', '', 'Anambra', '', '3', 1, NULL, 0, 'da8f0518c2c97dbd1ea565a069392578', 1, '2024-09-10 14:25:04'),
(163, 'Akinro', 'akinbolawa', '$2y$10$cUgXrHuTxtAqFVfSPlA/xuME6CQD5T57CeZp.771BW0PVAI7lsMqO', 'ef7be8c57773f2ab48d013434d3ad4f7', 'akinbolawa90@gmail.com', '08117602673', '', '', 'Ondo', '', '3', 1, NULL, 0, '197d6e81ff6e42204098ee3b29bf8a9d', 1, '2024-09-15 15:33:23'),
(164, 'luwa', 'iyanu', '$2y$10$16IZs7npw3wdRYtaDdlO9uyCAGePqvQpCFwuzsun4maSscRbJx3GK', '43cca4b3de2097b9558efefd0ecc3588', 'ajuwonoluwa@gmail.com', '08125847393', '', '', 'NIGERIA', '', '3', 1, NULL, 0, '5a6637821bc655213d0caa192a9b40ae', 1, '2024-10-15 11:35:47'),
(165, 'Usman', 'Musa', '$2y$10$7YmaN7jhBd0qeG9MPPYKhOOLlJrE5Nvu4nDx6jAJ45LOXyRXKiWlq', '8cd7775f9129da8b5bf787a063d8426e', 'tjkndl7@gmail.com', '09150386983', '', '', 'Kano', '', '3', 1, NULL, 0, '5b5191df903db0a6866ea88063404321', 1, '2024-10-20 05:42:30'),
(166, 'Muhammad', 'Mahmud', '$2y$10$bHLtCzR25SfAHnLmrpbvG./R6OWuTGuVK7.Lq0iKgvpk/cB/2OPNS', '17b3c7061788dbe82de5abe9f6fe22b3', 'eduos2024@gmail.com', '08160327173', '', '', 'Kano', '', '3', 1, NULL, 0, 'dcc54f5f89fa8e710949402e53194133', 1, '2024-11-16 16:26:59'),
(167, 'Adebayo', 'Olawole', '$2y$10$BzacRs0406k0JtRd8u1BSuwzMKJfGNbBgKfAMl0c2HoUutBgepuZi', '7a5200e5e9b3a893e1c2b0ccba7dd72f', 'xainzofficial@gmail.com', '09025858831', '', '', 'Kwara', '', '3', 1, NULL, 0, '356fdea4eac2f385be64212dc6b23993', 1, '2024-11-17 17:42:28'),
(168, 'Umar', 'Umar', '$2y$10$S5D/atsGLtbAB12xq51T7u9XwBzTvFpACat4fchmWikPa5tLcDYnW', '4a7d1ed414474e4033ac29ccb8653d9b', 'umarhintmedia@gmail.com', '08068950848', '', '', 'Niger', '', '3', 1, NULL, 0, '9390a4f3770adab59ba0227f87363b6f', 1, '2024-11-18 13:12:33');

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
(357, '574988659232081654', 'adeniyi@taweer.com', 150, 35803, 'Refund', '2022-01-22 06:46:08', 1, 1),
(358, '949335322844814064', 'adeniyi@taweer.com', 470, 35333, 'debit', '2022-01-22 06:49:59', 1, 0),
(359, '126849153577625224', 'adeniyi@taweer.com', 470, 34863, 'debit', '2022-01-22 06:51:20', 1, 0),
(360, '537175469818389189', 'adeniyi@taweer.com', 250, 34613, 'debit', '2022-01-22 07:03:16', 1, 1),
(361, '312292285656458484', 'azzeetech.it@gmail.com', 130, 1413, 'debit', '2022-01-22 12:20:33', 1, 1),
(362, '134059131687342357', 'azzeetech.it@gmail.com', 91105, 200000, 'Refund', '2022-01-22 12:36:17', 1, 1),
(363, '498497887663560581', 'azzeetech.it@gmail.com', 91105, 200000, 'Refund', '2022-01-22 12:37:08', 1, 1),
(364, '182171594206349637', 'azzeetech.it@gmail.com', 91105, 300000, 'Refund', '2022-01-22 12:38:38', 1, 1),
(365, '865661054989903083', 'azzeetech.it@gmail.com', 480, 299520, 'debit', '2022-01-22 12:49:10', 1, 1),
(366, '381541751699098399', 'azzeetech.it@gmail.com', 440, 299080, 'debit', '2022-01-22 12:53:15', 1, 1),
(367, '920278834893978125', 'mahmudmohad95@gmail.com', 100, 0, 'credit', '2022-06-21 13:41:34', 1, 0),
(368, '801435850584215191', 'mahmudmohad95@gmail.com', 100, 0, 'credit', '2022-06-21 13:43:27', 1, 0),
(369, '291858812597511601', 'mahmudmohad95@gmail.com', 100, 0, 'credit', '2022-06-22 10:22:37', 1, 0),
(370, '484816711399949829', 'mahmudmohad95@gmail.com', 100, 0, 'credit', '2022-06-22 10:29:37', 1, 0),
(371, '910544198969274352', 'mahmudmohad95@gmail.com', 100, 0, 'credit', '2022-06-22 10:33:25', 1, 0),
(372, '340557791599552236', 'intellisensehq@gmail.com', 300, 0, 'credit', '2022-07-04 11:50:16', 1, 0),
(373, '20220705130mytfu', 'intellisensehq@gmail.com', 500, 0, 'credit', '2022-07-05 12:09:43', 1, 0),
(374, '20220705190ztrac', 'abdulkarimahmad303@gmail.com', 500, 0, 'credit', '2022-07-05 18:29:33', 1, 0),
(375, '20220705200rnsbg', 'intellisensehq@gmail.com', 1000, 0, 'credit', '2022-07-05 19:43:26', 1, 0),
(376, '20220705220drvjc', 'intellisensehq@gmail.com', 400, 0, 'credit', '2022-07-05 21:31:24', 1, 0),
(377, '20220706010kmapq', 'intellisensehq@gmail.com', 450, 0, 'credit', '2022-07-06 00:05:17', 1, 0),
(378, '20220706010vhxhw', 'intellisensehq@gmail.com', 450, 0, 'credit', '2022-07-06 00:16:35', 1, 0),
(379, '20220706010fxuvh', 'intellisensehq@gmail.com', 450, 0, 'credit', '2022-07-06 00:19:31', 1, 0),
(380, '20220706020ulgdf', 'intellisensehq@gmail.com', 450, 0, 'credit', '2022-07-06 01:22:07', 1, 0),
(381, '20220706020shiwm', 'intellisensehq@gmail.com', 450, 0, 'credit', '2022-07-06 01:23:20', 1, 0),
(382, '20220706020qnmob', 'intellisensehq@gmail.com', 450, 0, 'credit', '2022-07-06 01:24:04', 1, 0),
(383, '20220706060cqwme', 'intellisensehq@gmail.com', 459, 0, 'credit', '2022-07-06 05:20:12', 1, 0),
(384, '20220706060tizqf', 'intellisensehq@gmail.com', 450, 0, 'credit', '2022-07-06 05:54:04', 1, 0),
(385, '20220706060tnirf', 'intellisensehq@gmail.com', 450, 0, 'credit', '2022-07-06 05:54:36', 1, 0),
(386, '20220706070dlxii', 'intellisensehq@gmail.com', 200, 0, 'credit', '2022-07-06 06:03:47', 1, 0),
(387, '20220706130ynwua', 'mz1929@yahoo.com', 50, 0, 'credit', '2022-07-06 12:44:40', 1, 0),
(388, '20220706140magfn', 'intellisensehq@gmail.com', 30, 0, 'credit', '2022-07-06 13:32:35', 1, 0),
(389, '20220706140iakgh', 'saadnasir470@gmail.com', 1000, 0, 'credit', '2022-07-06 13:59:28', 1, 0),
(390, '20220706140oppdn', 'intellisensehq@gmail.com', 200, 0, 'credit', '2022-07-06 13:59:34', 1, 0),
(391, '20220706150xwjaq', 'intellisensehq@gmail.com', 200, 200, 'credit', '2022-07-06 14:08:30', 1, 1),
(392, '20220706150aigyz', 'intellisensehq@gmail.com', 49, 151, 'debit', '2022-07-06 14:16:12', 1, 0),
(393, '20220706150jkdig', 'intellisensehq@gmail.com', 49, 102, 'debit', '2022-07-06 14:45:59', 1, 0),
(394, '20220706150zpqzq', 'intellisensehq@gmail.com', 24, 78, 'debit', '2022-07-06 14:49:09', 1, 0),
(395, '20220706150ztqan', 'intellisensehq@gmail.com', 100, 178, 'credit', '2022-07-06 14:58:21', 1, 1),
(396, '20220706160jqkle', 'intellisensehq@gmail.com', 115, 63, 'debit', '2022-07-06 15:03:23', 1, 1),
(397, '20220706160wlnbu', 'intellisensehq@gmail.com', 300, 63, 'credit', '2022-07-06 15:20:40', 1, 0),
(398, '20220706160hvknb', 'intellisensehq@gmail.com', 300, 363, 'credit', '2022-07-06 15:21:10', 1, 1),
(399, '20220706160lfglu', 'intellisensehq@gmail.com', 115, 248, 'transfered', '2022-07-06 15:27:31', 1, 1),
(400, '20220706160lfglu', 'saadnasir470@gmail.com', 115, 0, 'recieved', '2022-07-06 15:27:31', 1, 0),
(401, '20220706160lpdlp', 'intellisensehq@gmail.com', 50, 198, 'transfered', '2022-07-06 15:36:49', 1, 1),
(402, '20220706160lpdlp', 'princeishaq53@gmail.com', 50, 0, 'recieved', '2022-07-06 15:36:49', 1, 0),
(403, '20220706160uhwaf', 'princeishaq53@gmail.com', 500, 50, 'credit', '2022-07-06 15:43:08', 1, 0),
(404, '20220706160uhnqv', 'intellisensehq@gmail.com', 100, 198, 'credit', '2022-07-06 15:43:15', 1, 0),
(405, '20220706160sfdxz', 'intellisensehq@gmail.com', 115, 198, 'Refund', '2022-07-06 15:46:40', 1, 1),
(406, '20220706160eatab', 'intellisensehq@gmail.com', 125, 73, 'debit', '2022-07-06 15:51:12', 1, 1),
(407, '20220706170dauuc', 'intellisensehq@gmail.com', 68, 5, 'debit', '2022-07-06 16:18:46', 1, 0),
(408, '20220706180nqahe', 'intellisensehq@gmail.com', 2000, 5, 'credit', '2022-07-06 17:56:47', 1, 0),
(409, '20220706190lluyx', 'intellisensehq@gmail.com', 2000, 5, 'credit', '2022-07-06 18:01:11', 1, 0),
(410, '20220706190ootxw', 'intellisensehq@gmail.com', 1000, 5, 'credit', '2022-07-06 18:03:16', 1, 0),
(411, '20220706190xyfwa', 'intellisensehq@gmail.com', 150, 155, 'credit', '2022-07-06 18:20:52', 1, 1),
(412, '20220706190ccmhr', 'intellisensehq@gmail.com', 150, 5, 'transfered', '2022-07-06 18:29:14', 1, 1),
(413, '20220706190ccmhr', 'docty747@gmail.com', 150, 0, 'recieved', '2022-07-06 18:29:14', 1, 0),
(414, '20220706190owovr', 'docty747@gmail.com', 125, 25, 'debit', '2022-07-06 18:52:54', 1, 1),
(415, '20220706190quakg', 'docty747@gmail.com', 300, 25, 'credit', '2022-07-06 18:58:48', 1, 0),
(416, '20220707060qwjse', 'azzeetech.it@gmail.com', 125, 298955, 'transfered', '2022-07-07 05:38:32', 1, 1),
(417, '20220707060qwjse', 'muhsinnasirsheshe@gmail.com', 125, 0, 'recieved', '2022-07-07 05:38:32', 1, 0),
(418, '20220707070iawce', 'azzeetech.it@gmail.com', 115, 298840, 'transfered', '2022-07-07 06:15:56', 1, 1),
(419, '20220707070iawce', 'mubarakmusa029@gmail.com', 115, 0, 'recieved', '2022-07-07 06:15:56', 1, 1),
(420, '20220707070iawce', 'azzeetech.it@gmail.com', 115, 298725, 'transfered', '2022-07-07 06:16:32', 1, 1),
(421, '20220707070iawce', 'mubarakmusa029@gmail.com', 115, 115, 'recieved', '2022-07-07 06:16:32', 1, 0),
(422, '20220707070mdezh', 'mubarakmusa029@gmail.com', 230, 0, 'debit', '2022-07-07 06:17:52', 1, 1),
(423, '20220707070fnpmg', 'mubarakmusa029@gmail.com', 1000, 0, 'credit', '2022-07-07 06:19:03', 1, 0),
(424, '20220707070gufam', 'azzeetech.it@gmail.com', 5, 298720, 'transfered', '2022-07-07 06:23:21', 1, 1),
(425, '20220707070gufam', 'mubarakmusa029@gmail.com', 5, 0, 'recieved', '2022-07-07 06:23:21', 1, 0),
(426, '20220707070amymy', 'muhsinnasirsheshe@gmail.com', 98, 27, 'debit', '2022-07-07 06:52:43', 1, 0),
(427, '20220707120weryo', 'azzeetech.it@gmail.com', 500, 298220, 'transfered', '2022-07-07 11:25:23', 1, 1),
(428, '20220707120weryo', 'sanilawanumar@gmail.com', 500, 0, 'recieved', '2022-07-07 11:25:23', 1, 0),
(429, '20220707120ccjjh', 'sanilawanumar@gmail.com', 250, 250, 'debit', '2022-07-07 11:26:30', 1, 1),
(430, '20220707200wseoo', 'umarreal411@gmail.com', 1000, 0, 'credit', '2022-07-07 19:14:34', 1, 0),
(431, '20220707200xaxwh', 'umarreal411@gmail.com', 1000, 0, 'credit', '2022-07-07 19:17:13', 1, 0),
(432, '20220707200tjcwy', 'umarreal411@gmail.com', 1000, 0, 'credit', '2022-07-07 19:21:39', 1, 0),
(433, '20220707200dqbxg', 'azzeetech.it@gmail.com', 250, 297970, 'debit', '2022-07-07 19:24:07', 1, 1),
(434, '20220707200yfmlc', 'azzeetech.it@gmail.com', 1150, 296820, 'debit', '2022-07-07 19:35:47', 1, 1),
(435, '20220707200mddrn', 'umarreal411@gmail.com', 1000, 1000, 'credit', '2022-07-07 19:44:54', 1, 1),
(436, '20220707200ijdzf', 'umarreal411@gmail.com', 750, 250, 'debit', '2022-07-07 19:48:32', 1, 1),
(437, '20220708090bsizz', 'Abdulhamidibrahim24@gmail.com', 1000, 0, 'credit', '2022-07-08 08:32:56', 1, 0),
(438, '20220708090zlvyq', 'azzeetech.it@gmail.com', 125, 296695, 'transfered', '2022-07-08 08:39:50', 1, 1),
(439, '20220708090zlvyq', 'Abdulhamidibrahim24@gmail.com', 125, 0, 'recieved', '2022-07-08 08:39:50', 1, 0),
(440, '20220708090cedxs', 'Abdulhamidibrahim24@gmail.com', 115, 10, 'debit', '2022-07-08 08:44:09', 1, 1),
(441, '20220708200jwaqt', 'azzeetech.it@gmail.com', 49, 296646, 'debit', '2022-07-08 19:09:47', 1, 0),
(442, '20220708200kashw', 'azzeetech.it@gmail.com', 115, 296531, 'debit', '2022-07-08 19:10:53', 1, 1),
(443, '20220708200yenfi', 'azzeetech.it@gmail.com', 49, 296482, 'debit', '2022-07-08 19:16:46', 1, 1),
(444, '20220708200iiepo', 'azzeetech.it@gmail.com', 248, 296482, 'Refund', '2022-07-08 19:20:30', 1, 1),
(445, '20220708200xotgx', 'azzeetech.it@gmail.com', 298, 296482, 'Refund', '2022-07-08 19:24:10', 1, 1),
(446, '20220708200gqiob', 'azzeetech.it@gmail.com', 547, 295935, 'debit', '2022-07-08 19:25:57', 1, 1),
(447, '20220708200zcxcs', 'azzeetech.it@gmail.com', 115, 295820, 'debit', '2022-07-08 19:31:06', 1, 1),
(448, '20220709080etbjt', 'azzeetech.it@gmail.com', 1250, 294570, 'debit', '2022-07-09 07:57:28', 1, 1),
(449, '20220709100djafz', 'azzeetech.it@gmail.com', 49, 294521, 'debit', '2022-07-09 09:35:32', 1, 1),
(450, '20220709150pxrvw', 'azzeetech.it@gmail.com', 125, 294396, 'debit', '2022-07-09 14:41:26', 1, 1),
(451, '20220709170hagxf', 'azzeetech.it@gmail.com', 125, 294271, 'debit', '2022-07-09 16:36:12', 1, 1),
(452, '20220709190kntic', 'azzeetech.it@gmail.com', 2200, 292071, 'transfered', '2022-07-09 18:58:44', 1, 1),
(453, '20220709190kntic', 'kaidanaka@gmail.com', 2200, 0, 'recieved', '2022-07-09 18:58:44', 1, 0),
(454, '20220709200vwxxv', 'azzeetech.it@gmail.com', 147, 291924, 'debit', '2022-07-09 19:15:10', 1, 1),
(455, '20220709210xxaxd', 'azzeetech.it@gmail.com', 300, 291624, 'transfered', '2022-07-09 20:11:58', 1, 1),
(456, '20220709210xxaxd', 'umarreal411@gmail.com', 300, 250, 'recieved', '2022-07-09 20:11:58', 1, 0),
(457, '20220709210bwrnp', 'umarreal411@gmail.com', 547, 3, 'debit', '2022-07-09 20:15:30', 1, 1),
(458, '20220710060xijkf', 'azzeetech.it@gmail.com', 125, 291499, 'debit', '2022-07-10 05:37:14', 1, 1),
(459, '20220710120lsjmj', 'azzeetech.it@gmail.com', 125, 291374, 'debit', '2022-07-10 11:45:05', 1, 1),
(460, '20220710140ttbxz', 'bosunjj@gmail.com', 1000, 0, 'credit', '2022-07-10 13:04:10', 1, 0),
(461, '20220710150qfnsq', 'azzeetech.it@gmail.com', 115, 291259, 'debit', '2022-07-10 14:06:08', 1, 1),
(462, '20220710150iknvx', 'azzeetech.it@gmail.com', 5, 291254, 'transfered', '2022-07-10 14:16:57', 1, 1),
(463, '20220710150iknvx', 'ayshamuhammad5318@gmail.com', 5, 0, 'recieved', '2022-07-10 14:16:57', 1, 0),
(464, '20220710150ezxyp', 'ayshamuhammad5318@gmail.com', 50, 5, 'credit', '2022-07-10 14:18:48', 1, 0),
(465, '20220710160qjwxm', 'azzeetech.it@gmail.com', 1000, 290254, 'transfered', '2022-07-10 15:08:53', 1, 1),
(466, '20220710160qjwxm', 'hamisusulaimanimam2022@gmail.com', 1000, 0, 'recieved', '2022-07-10 15:08:53', 1, 0),
(467, '20220710160gudoc', 'hamisusulaimanimam2022@gmail.com', 115, 885, 'debit', '2022-07-10 15:13:47', 1, 1),
(468, '20220710180knncr', 'muhammadlawal6767@gmail.com', 100, 0, 'credit', '2022-07-10 17:23:47', 1, 0),
(469, '20220710180xupdo', 'azzeetech.it@gmail.com', 115, 290141, 'transfered', '2022-07-10 17:33:48', 1, 1),
(470, '20220710180xupdo', 'muhammadlawal6767@gmail.com', 115, 0, 'recieved', '2022-07-10 17:33:48', 1, 0),
(471, '20220710180bmnlq', 'muhammadlawal6767@gmail.com', 115, 0, 'debit', '2022-07-10 17:43:53', 1, 1),
(472, '20220710180xhmlq', 'muhammadlawal6767@gmail.com', 1000, 0, 'credit', '2022-07-10 17:46:22', 1, 0),
(473, '20220710210ttesh', 'hamisusulaimanimam2022@gmail.com', 352, 533, 'debit', '2022-07-10 20:20:28', 1, 1),
(474, '20220711070pjkxr', 'azzeetech.it@gmail.com', 115, 290028, 'debit', '2022-07-11 06:59:00', 1, 1),
(475, '20220711070brnvs', 'saadnasir470@gmail.com', 115, 0, 'debit', '2022-07-11 06:59:11', 1, 1),
(476, '20220711100shayu', 'azzeetech.it@gmail.com', 230, 289798, 'debit', '2022-07-11 09:18:13', 1, 1),
(477, '20220711100loxlz', 'hamisusulaimanimam2022@gmail.com', 125, 408, 'debit', '2022-07-11 09:50:30', 1, 1),
(478, '20220711110sgexz', 'azzeetech.it@gmail.com', 49, 289751, 'debit', '2022-07-11 10:04:15', 1, 1),
(479, '20220711110xyprv', 'kaidanaka@gmail.com', 2020, 180, 'cashOut', '2022-07-11 10:15:44', 1, 0),
(480, '20220711120cfxzt', 'azzeetech.it@gmail.com', 49, 289702, 'debit', '2022-07-11 11:05:28', 1, 1),
(481, '20220711120ezvxr', 'azzeetech.it@gmail.com', 115, 289587, 'debit', '2022-07-11 11:34:15', 1, 1),
(482, '20220711120wdypk', 'azzeetech.it@gmail.com', 100, 289587, 'credit', '2022-07-11 11:35:08', 1, 0),
(483, '20220711120oruxm', 'azzeetech.it@gmail.com', 49, 289538, 'debit', '2022-07-11 11:39:00', 1, 1),
(484, '20220711170lgwqj', 'azzeetech.it@gmail.com', 68, 289470, 'debit', '2022-07-11 16:21:05', 1, 1),
(485, '20220711200yqylf', 'azzeetech.it@gmail.com', 68, 289402, 'debit', '2022-07-11 19:16:39', 1, 1),
(486, '20220711200plfuw', 'azzeetech.it@gmail.com', 115, 289287, 'debit', '2022-07-11 19:46:54', 1, 1),
(487, '20220711210imrdx', 'azzeetech.it@gmail.com', 1000, 288287, 'transfered', '2022-07-11 20:47:48', 1, 1),
(488, '20220711210imrdx', 'salmanusman089@gmail.com', 1000, 0, 'recieved', '2022-07-11 20:47:48', 1, 0),
(489, '20220711210ijfyy', 'salmanusman089@gmail.com', 980, 20, 'debit', '2022-07-11 20:49:45', 1, 1),
(490, '20220711220ggpeb', 'azzeetech.it@gmail.com', 5000, 283287, 'transfered', '2022-07-11 21:03:15', 1, 1),
(491, '20220711220ggpeb', 'kakyansoro87@gmail.com', 5000, 0, 'recieved', '2022-07-11 21:03:15', 1, 0),
(492, '20220711220rtjum', 'azzeetech.it@gmail.com', 550, 282737, 'transfered', '2022-07-11 21:21:13', 1, 1),
(493, '20220711220rtjum', 'saadnasir470@gmail.com', 550, 0, 'recieved', '2022-07-11 21:21:13', 1, 0),
(494, '20220711220isqah', 'saadnasir470@gmail.com', 547, 3, 'debit', '2022-07-11 21:23:04', 1, 1),
(495, '20220711230jmugt', 'azzeetech.it@gmail.com', 200, 282537, 'transfered', '2022-07-11 22:11:08', 1, 1),
(496, '20220711230jmugt', 'princeishaq53@gmail.com', 200, 50, 'recieved', '2022-07-11 22:11:08', 1, 0),
(497, '20220711230vkwqr', 'princeishaq53@gmail.com', 230, 20, 'debit', '2022-07-11 22:20:06', 1, 1),
(498, '20220712060nybds', 'azzeetech.it@gmail.com', 115, 282422, 'debit', '2022-07-12 05:18:35', 1, 1),
(499, '20220712100vdfkf', 'azzeetech.it@gmail.com', 115, 282307, 'debit', '2022-07-12 09:55:55', 1, 1),
(500, '20220712120wgarr', 'azzeetech.it@gmail.com', 500, 281807, 'transfered', '2022-07-12 11:22:59', 1, 1),
(501, '20220712120wgarr', 'mz1929@yahoo.com', 500, 0, 'recieved', '2022-07-12 11:22:59', 1, 0),
(502, '20220712120agvyl', 'mz1929@yahoo.com', 230, 270, 'debit', '2022-07-12 11:29:47', 1, 1),
(503, '20220712120hpnts', 'azzeetech.it@gmail.com', 230, 281577, 'debit', '2022-07-12 11:32:31', 1, 1),
(504, '20220712160nuyrc', 'azzeetech.it@gmail.com', 115, 281462, 'transfered', '2022-07-12 15:59:20', 1, 1),
(505, '20220712160nuyrc', 'muhammadiabubakar5@gmail.com', 115, 0, 'recieved', '2022-07-12 15:59:20', 1, 0),
(506, '20220712190bxfrd', 'alsadiqibrahim03@gmail.com', 500, 0, 'credit', '2022-07-12 18:13:36', 1, 0),
(507, '20220712220eqwvn', 'hamisusulaimanimam@gmail.com', 49, 359, 'debit', '2022-07-12 21:12:49', 1, 1),
(508, '20220713060btdjz', 'azzeetech.it@gmail.com', 115, 281348, 'debit', '2022-07-13 05:27:44', 1, 1),
(509, '20220713100yhpjm', 'mz1929@yahoo.com', 250, 20, 'debit', '2022-07-13 09:28:54', 1, 1),
(510, '20220713110tpgsl', 'azzeetech.it@gmail.com', 59, 281289, 'debit', '2022-07-13 10:44:49', 1, 1),
(511, '20220713210mlapz', 'hamisusulaimanimam@gmail.com', 125, 359, 'Refund', '2022-07-13 20:26:38', 1, 1),
(512, '20220713210ewltl', 'hamisusulaimanimam@gmail.com', 125, 359, 'Refund', '2022-07-13 20:29:40', 1, 1),
(513, '20220713220wocxl', 'azzeetech.it@gmail.com', 115, 281174, 'debit', '2022-07-13 21:16:01', 1, 1),
(514, '20220714010ewfyt', 'azzeetech.it@gmail.com', 2039, 279135, 'debit', '2022-07-14 00:30:24', 1, 1),
(515, '20220714140jnhfn', 'hamisusulaimanimam@gmail.com', 125, 234, 'debit', '2022-07-14 13:50:37', 1, 1),
(516, '20220714150zaiwb', 'muhammadiabubakar5@gmail.com', 113, 2, 'debit', '2022-07-14 14:55:10', 1, 1),
(517, '20220714170zytxm', 'kakyansoro87@gmail.com', 196, 4804, 'debit', '2022-07-14 16:44:05', 1, 1),
(518, '20220714180kgxhc', 'azzeetech.it@gmail.com', 115, 279022, 'debit', '2022-07-14 17:05:24', 1, 1),
(519, '20220714180yqkoh', 'hamisusulaimanimam@gmail.com', 115, 119, 'debit', '2022-07-14 17:32:51', 1, 1),
(520, '20220714190xhatn', 'azzeetech.it@gmail.com', 2000, 277024, 'transfered', '2022-07-14 18:59:05', 1, 1),
(521, '20220714190xhatn', 'hamisusulaimanimam@gmail.com', 2000, 119, 'recieved', '2022-07-14 18:59:05', 1, 0),
(522, '20220714210agndf', 'hamisusulaimanimam@gmail.com', 230, 1889, 'debit', '2022-07-14 20:39:02', 1, 1),
(523, '20220714210kgekt', 'hamisusulaimanimam@gmail.com', 230, 1659, 'debit', '2022-07-14 20:49:37', 1, 1),
(524, '20220714210bjfwd', 'hamisusulaimanimam@gmail.com', 195, 1464, 'debit', '2022-07-14 21:00:16', 1, 0),
(525, '20220714220bqbsv', 'hamisusulaimanimam@gmail.com', 230, 1234, 'debit', '2022-07-14 21:04:18', 1, 1),
(526, '20220714220bqvbn', 'hamisusulaimanimam@gmail.com', 445, 789, 'debit', '2022-07-14 21:12:06', 1, 1),
(527, '20220715080mvhup', 'Abulazizahmad66@gmail.com', 1000, 0, 'credit', '2022-07-15 07:24:27', 1, 0),
(528, '20220715080walpb', 'Abulazizahmad66@gmail.com', 500, 0, 'credit', '2022-07-15 07:32:51', 1, 0),
(529, '20220715090igouq', 'azzeetech.it@gmail.com', 4000, 273038, 'transfered', '2022-07-15 08:53:31', 1, 1),
(530, '20220715090igouq', 'hamisusulaimanimam@gmail.com', 4000, 789, 'recieved', '2022-07-15 08:53:31', 1, 0),
(531, '20220715100ssxhr', 'hamisusulaimanimam@gmail.com', 1150, 3639, 'debit', '2022-07-15 09:15:13', 1, 1),
(532, '20220715110ohifo', 'hamisusulaimanimam@gmail.com', 98, 3541, 'debit', '2022-07-15 10:40:42', 1, 1),
(533, '20220715210syguu', 'hamisusulaimanimam@gmail.com', 115, 3426, 'debit', '2022-07-15 20:39:18', 1, 1),
(534, '20220715210ndhce', 'hamisusulaimanimam@gmail.com', 115, 3311, 'debit', '2022-07-15 20:40:30', 1, 1),
(535, '20220716120nunlr', 'azzeetech.it@gmail.com', 115, 272940, 'debit', '2022-07-16 11:26:13', 1, 1),
(536, '20220716120snfjo', 'azzeetech.it@gmail.com', 115, 272825, 'debit', '2022-07-16 11:27:50', 1, 1),
(537, '20220716120ocmub', 'hamisusulaimanimam@gmail.com', 115, 3196, 'debit', '2022-07-16 11:43:16', 1, 1),
(538, '20220716120xilay', 'hamisusulaimanimam@gmail.com', 196, 3000, 'debit', '2022-07-16 11:50:04', 1, 0),
(539, '20220716130vhmzs', 'hamisusulaimanimam@gmail.com', 196, 2804, 'debit', '2022-07-16 12:01:31', 1, 0),
(540, '20220716160imtnc', 'hamisusulaimanimam@gmail.com', 196, 2608, 'debit', '2022-07-16 15:43:12', 1, 0),
(541, '20220716160naksh', 'hamisusulaimanimam@gmail.com', 865, 1743, 'debit', '2022-07-16 15:47:12', 1, 1),
(542, '20220716170elkow', 'abdulganiyurabe73456@gmail.com', 150, 0, 'credit', '2022-07-16 16:44:18', 1, 0),
(543, '20220716180jwrfw', 'azzeetech.it@gmail.com', 230, 272606, 'debit', '2022-07-16 17:24:09', 1, 1),
(544, '20220716180tflmf', 'azzeetech.it@gmail.com', 115, 272491, 'debit', '2022-07-16 17:30:20', 1, 1),
(545, '20220716230cchtm', 'hamisusulaimanimam@gmail.com', 196, 1547, 'debit', '2022-07-16 22:10:58', 1, 1),
(546, '20220717100oouqj', 'azzeetech.it@gmail.com', 115, 272377, 'debit', '2022-07-17 09:53:54', 1, 1),
(547, '20220717100gmkld', 'alsadiqibrahim03@gmail.com', 500, 0, 'credit', '2022-07-17 09:59:37', 1, 0),
(548, '20220717110ponek', 'kakyansoro87@gmail.com', 750, 4054, 'debit', '2022-07-17 10:19:16', 1, 1),
(549, '20220717110ocodc', 'azzeetech.it@gmail.com', 385, 271992, 'transfered', '2022-07-17 10:24:08', 1, 1),
(550, '20220717110ocodc', 'alsadiqibrahim03@gmail.com', 385, 0, 'recieved', '2022-07-17 10:24:08', 1, 0),
(551, '20220717120eoisv', 'alsadiqibrahim03@gmail.com', 49, 336, 'debit', '2022-07-17 11:33:24', 1, 1),
(552, '20220717120qnbyv', 'alsadiqibrahim03@gmail.com', 250, 86, 'debit', '2022-07-17 11:35:29', 1, 1),
(553, '20220717130ognhm', 'alsadiqibrahim03@gmail.com', 49, 37, 'debit', '2022-07-17 13:00:05', 1, 1),
(554, '20220717150feaxr', 'muhammadibrahimmuhammed81@gmail.com', 200, 0, 'credit', '2022-07-17 14:32:51', 1, 0),
(555, '20220717150kshmw', 'azzeetech.it@gmail.com', 500, 271497, 'transfered', '2022-07-17 14:41:23', 1, 1),
(556, '20220717150kshmw', 'muhammadibrahimmuhammed81@gmail.com', 500, 0, 'recieved', '2022-07-17 14:41:23', 1, 0),
(557, '20220717150sddeu', 'muhammadibrahimmuhammed81@gmail.com', 115, 500, 'Refund', '2022-07-17 14:43:57', 1, 1),
(558, '20220717150shzdk', 'muhammadibrahimmuhammed81@gmail.com', 115, 385, 'debit', '2022-07-17 14:52:40', 1, 1),
(559, '20220717150wvecj', 'muhammadibrahimmuhammed81@gmail.com', 1000, 385, 'credit', '2022-07-17 14:56:51', 1, 0),
(560, '20220717180thvix', 'muhammadibrahimmuhammed81@gmail.com', 230, 155, 'debit', '2022-07-17 17:05:05', 1, 1),
(561, '20220717210rejoo', 'azzeetech.it@gmail.com', 115, 271382, 'debit', '2022-07-17 20:49:11', 1, 1),
(562, '20220717220lfawd', 'hamisusulaimanimam@gmail.com', 115, 1547, 'Refund', '2022-07-17 21:24:59', 1, 1),
(563, '20220717220anuoa', 'hamisusulaimanimam@gmail.com', 115, 1547, 'Refund', '2022-07-17 21:25:57', 1, 1),
(564, '20220717220oyhos', 'hamisusulaimanimam@gmail.com', 115, 1547, 'Refund', '2022-07-17 21:27:25', 1, 1),
(565, '20220717220tmsvt', 'hamisusulaimanimam@gmail.com', 115, 1547, 'Refund', '2022-07-17 21:29:25', 1, 1),
(566, '20220717220atanp', 'hamisusulaimanimam@gmail.com', 115, 1547, 'Refund', '2022-07-17 21:34:28', 1, 1),
(567, '20220717220spppz', 'hamisusulaimanimam@gmail.com', 500, 1547, 'Refund', '2022-07-17 21:35:40', 1, 1),
(568, '20220718100wyiwf', 'hamisusulaimanimam@gmail.com', 115, 1432, 'debit', '2022-07-18 09:35:13', 1, 1),
(569, '20220718160sqvus', 'hamisusulaimanimam@gmail.com', 230, 1202, 'debit', '2022-07-18 15:40:07', 1, 1),
(570, '20220718160qdvgr', 'hamisusulaimanimam@gmail.com', 1000, 1202, 'credit', '2022-07-18 15:42:04', 1, 0),
(571, '20220718160opqow', 'hamisusulaimanimam@gmail.com', 200, 1202, 'credit', '2022-07-18 15:43:05', 1, 0),
(572, '20220718200imqzp', 'azzeetech.it@gmail.com', 49, 271338, 'debit', '2022-07-18 19:17:32', 1, 1),
(573, '20220718210odjyi', 'hamisusulaimanimam@gmail.com', 445, 1202, 'Refund', '2022-07-18 20:26:52', 1, 1),
(574, '20220718210uthjh', 'hamisusulaimanimam@gmail.com', 445, 1202, 'Refund', '2022-07-18 20:27:53', 1, 1),
(575, '20220718210vckle', 'hamisusulaimanimam@gmail.com', 460, 1202, 'Refund', '2022-07-18 20:30:13', 1, 1),
(576, '20220718210hbkjn', 'hamisusulaimanimam@gmail.com', 445, 1202, 'Refund', '2022-07-18 20:35:11', 1, 1),
(577, '20220718210rjyia', 'hamisusulaimanimam@gmail.com', 125, 1077, 'debit', '2022-07-18 20:37:00', 1, 1),
(578, '20220718210bnnbo', 'hamisusulaimanimam@gmail.com', 445, 1077, 'Refund', '2022-07-18 20:46:10', 1, 1),
(579, '20220718210zcxxc', 'hamisusulaimanimam@gmail.com', 445, 1077, 'Refund', '2022-07-18 20:49:34', 1, 1),
(580, '20220718220qycib', 'hamisusulaimanimam@gmail.com', 445, 1077, 'Refund', '2022-07-18 21:22:53', 1, 1),
(581, '20220718220pjleo', 'hamisusulaimanimam@gmail.com', 490, 587, 'debit', '2022-07-18 21:32:11', 1, 0),
(582, '20220719080rwack', 'azzeetech.it@gmail.com', 115, 271225, 'debit', '2022-07-19 07:54:51', 1, 1),
(583, '20220719100epqpw', 'azzeetech.it@gmail.com', 49, 271176, 'debit', '2022-07-19 09:28:18', 1, 1),
(584, '20220719190dqcbx', 'hamisusulaimanimam@gmail.com', 125, 462, 'debit', '2022-07-19 18:45:43', 1, 1),
(585, '20220719200lksvw', 'hamisusulaimanimam@gmail.com', 445, 17, 'debit', '2022-07-19 19:28:10', 1, 1),
(586, '20220719200upddk', 'mz1929@yahoo.com', 500, 20, 'credit', '2022-07-19 19:30:28', 1, 0),
(587, '20220719200bqywz', 'muhammadibrahimmuhammed81@gmail.com', 125, 30, 'debit', '2022-07-19 19:43:13', 1, 1),
(588, '20220719200fbewh', 'hassanotu1986@gmail.com', 1000, 0, 'credit', '2022-07-19 19:45:38', 1, 0),
(589, '20220719200hswnz', 'mz1929@yahoo.com', 500, 20, 'credit', '2022-07-19 19:55:06', 1, 0),
(590, '20220719220ztlxq', 'azzeetech.it@gmail.com', 1050, 270133, 'transfered', '2022-07-19 21:26:28', 1, 1),
(591, '20220719220ztlxq', 'saadnasir470@gmail.com', 1050, 3, 'recieved', '2022-07-19 21:26:28', 1, 0),
(592, '20220719220atstj', 'saadnasir470@gmail.com', 1044, 9, 'debit', '2022-07-19 21:27:53', 1, 1),
(593, '20220720110cvvit', 'azzeetech.it@gmail.com', 115, 270018, 'debit', '2022-07-20 10:55:57', 1, 1),
(594, '20220720150bczyp', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-20 14:12:27', 1, 0),
(595, '20220720150dawgu', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-20 14:20:53', 1, 0),
(596, '20220720150bxjwx', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-20 14:21:38', 1, 0),
(597, '20220720150xpcyj', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-20 14:22:14', 1, 0),
(598, '20220720150vrulj', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-20 14:23:56', 1, 0),
(599, '20220720150ieuga', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-20 14:32:53', 1, 0),
(600, '20220720150ixdtw', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-20 14:40:37', 1, 0),
(601, '20220720150cmqup', 'mz1929@yahoo.com', 1, 20, 'credit', '2022-07-20 14:41:22', 1, 0),
(602, '20220720150jwhzf', 'azzeetech.it@gmail.com', 1, 270018, 'credit', '2022-07-20 14:48:08', 1, 0),
(603, '20220720150ufjbu', 'azzeetech.it@gmail.com', 1, 270018, 'credit', '2022-07-20 14:48:31', 1, 0),
(604, '20220720150qnsek', 'azzeetech.it@gmail.com', 100, 270018, 'credit', '2022-07-20 14:48:48', 1, 0),
(605, '20220720150rnlzv', 'azzeetech.it@gmail.com', 1, 270018, 'credit', '2022-07-20 14:50:55', 1, 0),
(606, '20220720150ckszb', 'azzeetech.it@gmail.com', 1, 270018, 'credit', '2022-07-20 14:54:28', 1, 0),
(607, '20220720150lygma', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-20 14:54:37', 1, 0),
(608, '20220720150lgvfh', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-20 14:55:19', 1, 0),
(609, '20220720160mrxmu', 'azzeetech.it@gmail.com', 300, 269718, 'transfered', '2022-07-20 15:01:22', 1, 1),
(610, '20220720160mrxmu', 'mz1929@yahoo.com', 300, 20, 'recieved', '2022-07-20 15:01:22', 1, 0),
(611, '20220720160uoour', 'mz1929@yahoo.com', 250, 70, 'debit', '2022-07-20 15:03:35', 1, 1),
(612, '20220720180eyvnx', 'kakyansoro87@gmail.com', 294, 3760, 'debit', '2022-07-20 17:18:22', 1, 1),
(613, '20220720180ksizs', 'kakyansoro87@gmail.com', 196, 3760, 'Refund', '2022-07-20 17:19:43', 1, 1),
(614, '20220720180dunxl', 'kakyansoro87@gmail.com', 196, 3760, 'Refund', '2022-07-20 17:22:25', 1, 1),
(615, '20220720190akymn', 'azzeetech.it@gmail.com', 115, 269603, 'debit', '2022-07-20 18:44:30', 1, 1),
(616, '20220720210ytlqc', 'azzeetech.it@gmail.com', 200, 269403, 'transfered', '2022-07-20 20:27:21', 1, 1),
(617, '20220720210ytlqc', 'mz1929@yahoo.com', 200, 70, 'recieved', '2022-07-20 20:27:21', 1, 0),
(618, '20220720210bcpma', 'mz1929@yahoo.com', 125, 145, 'debit', '2022-07-20 20:30:11', 1, 1),
(619, '20220721090ofzit', 'azzeetech.it@gmail.com', 115, 269288, 'debit', '2022-07-21 08:26:00', 1, 1),
(620, '20220721160ckhtz', 'azzeetech.it@gmail.com', 115, 269173, 'debit', '2022-07-21 15:50:23', 1, 1),
(621, '20220721160cjmqs', 'hussainitayyib@gmail.com', 1000, 0, 'credit', '2022-07-21 15:59:10', 1, 0),
(622, '20220721180wrgsq', 'sanilawanumar@gmail.com', 250, 0, 'debit', '2022-07-21 17:15:19', 1, 1),
(623, '20220721210fndkf', 'azzeetech.it@gmail.com', 1000, 268173, 'transfered', '2022-07-21 20:33:34', 1, 1),
(624, '20220721210fndkf', 'alsadiqibrahim03@gmail.com', 1000, 37, 'recieved', '2022-07-21 20:33:34', 1, 0),
(625, '20220721220rsrwh', 'alsadiqibrahim03@gmail.com', 500, 537, 'debit', '2022-07-21 21:04:34', 1, 1),
(626, '20220722100enlrv', 'azzeetech.it@gmail.com', 500, 267678, 'transfered', '2022-07-22 09:01:23', 1, 1),
(627, '20220722100enlrv', 'mz1929@yahoo.com', 500, 145, 'recieved', '2022-07-22 09:01:23', 1, 0),
(628, '20220722100qswde', 'mz1929@yahoo.com', 250, 395, 'debit', '2022-07-22 09:05:07', 1, 1),
(629, '20220722100lrxda', 'azzeetech.it@gmail.com', 50, 267628, 'transfered', '2022-07-22 09:39:51', 1, 1),
(630, '20220722100lrxda', 'sanizakariumar@gmail.com', 50, 0, 'recieved', '2022-07-22 09:39:51', 1, 0),
(631, '20220722100xhtec', 'sanizakariumar@gmail.com', 49, 1, 'debit', '2022-07-22 09:43:02', 1, 1),
(632, '20220722120mioxf', 'azzeetech.it@gmail.com', 1500, 266128, 'transfered', '2022-07-22 11:12:28', 1, 1),
(633, '20220722120mioxf', 'hamisusulaimanimam@gmail.com', 1500, 17, 'recieved', '2022-07-22 11:12:28', 1, 0),
(634, '20220722120zckwf', 'hamisusulaimanimam@gmail.com', 445, 1072, 'debit', '2022-07-22 11:38:55', 1, 1),
(635, '20220722130olamk', 'kakyansoro87@gmail.com', 196, 3564, 'debit', '2022-07-22 12:10:24', 1, 1),
(636, '20220722140hoyvr', 'hamisusulaimanimam@gmail.com', 230, 842, 'debit', '2022-07-22 13:21:37', 1, 1),
(637, '20220722160myojo', 'hamisusulaimanimam@gmail.com', 98, 744, 'debit', '2022-07-22 15:27:50', 1, 1),
(638, '20220722160tlzat', 'azzeetech.it@gmail.com', 115, 266137, 'Refund', '2022-07-22 15:39:41', 1, 1),
(639, '20220722160shprq', 'azzeetech.it@gmail.com', 115, 266137, 'Refund', '2022-07-22 15:54:19', 1, 1),
(640, '20220722160wjosn', 'azzeetech.it@gmail.com', 125, 266012, 'debit', '2022-07-22 15:55:51', 1, 1),
(641, '20220722230bvsea', 'alsadiqibrahim03@gmail.com', 49, 488, 'debit', '2022-07-22 22:18:07', 1, 1),
(642, '20220723080fjlcj', 'hamisusulaimanimam@gmail.com', 98, 646, 'debit', '2022-07-23 07:50:34', 1, 1),
(643, '20220723090kdgrq', 'hamisusulaimanimam@gmail.com', 445, 201, 'debit', '2022-07-23 08:01:02', 1, 1),
(644, '20220723100dqhhu', 'sanizakariumar@gmail.com', 5000, 5001, 'credit', '2022-07-23 09:24:44', 1, 1),
(645, '20220723100qwhtm', 'sanizakariumar@gmail.com', 1044, 3957, 'debit', '2022-07-23 09:42:42', 1, 1),
(646, '20220723120inmdy', 'hamisusulaimanimam@gmail.com', 98, 103, 'debit', '2022-07-23 11:47:18', 1, 1),
(647, '20220723140ldfgq', 'hamisusulaimanimam@gmail.com', 98, 5, 'debit', '2022-07-23 13:35:08', 1, 1),
(648, '20220723160mdhxt', 'sanizakariumar@gmail.com', 100, 3957, 'credit', '2022-07-23 15:32:14', 1, 0),
(649, '20220723180jhcks', 'azzeetech.it@gmail.com', 500, 265521, 'transfered', '2022-07-23 17:21:29', 1, 1),
(650, '20220723180jhcks', 'hamisusulaimanimam@gmail.com', 500, 5, 'recieved', '2022-07-23 17:21:29', 1, 0),
(651, '20220723180zihrx', 'hamisusulaimanimam@gmail.com', 460, 45, 'debit', '2022-07-23 17:34:38', 1, 1),
(652, '20220723230tttnt', 'ahmadnurahussain13@gmail.com', 100, 0, 'credit', '2022-07-23 22:58:50', 1, 0),
(653, '20220724000oydxh', 'ahmadnurahussain13@gmail.com', 500, 0, 'credit', '2022-07-23 23:00:49', 1, 0),
(654, '20220724050hlrep', 'alsadiqibrahim03@gmail.com', 250, 488, 'Refund', '2022-07-24 04:05:39', 1, 1),
(655, '20220724050zwewx', 'alsadiqibrahim03@gmail.com', 250, 488, 'Refund', '2022-07-24 04:07:14', 1, 1),
(656, '20220724050fbhpx', 'alsadiqibrahim03@gmail.com', 49, 488, 'Refund', '2022-07-24 04:09:15', 1, 1),
(657, '20220724060pippn', 'azzeetech.it@gmail.com', 115, 265526, 'Refund', '2022-07-24 05:10:20', 1, 1),
(658, '20220724060obzhs', 'azzeetech.it@gmail.com', 125, 265401, 'debit', '2022-07-24 05:12:32', 1, 1),
(659, '20220724080irobl', 'shafiualiyu005@yahoo.com', 500, 0, 'credit', '2022-07-24 07:57:54', 1, 0),
(660, '20220724080nqbzk', 'sanizakariumar@gmail.com', 197, 3760, 'debit', '2022-07-24 07:59:06', 1, 1),
(661, '20220724090oeutq', 'azzeetech.it@gmail.com', 125, 265401, 'Refund', '2022-07-24 08:10:52', 1, 1),
(662, '20220724090zratv', 'azzeetech.it@gmail.com', 295, 265401, 'Refund', '2022-07-24 08:14:24', 1, 1),
(663, '20220724090zratv', 'azzeetech.it@gmail.com', 295, 265106, 'Refund', '2022-07-24 08:16:42', 1, 1),
(664, '20220724090gfago', 'sanizakariumar@gmail.com', 100, 3760, 'credit', '2022-07-24 08:47:25', 1, 0),
(665, '20220724100xmycm', 'mz1929@yahoo.com', 125, 270, 'debit', '2022-07-24 09:57:04', 1, 1),
(666, '20220724110npstb', 'sanizakariumar@gmail.com', 250, 3510, 'debit', '2022-07-24 10:36:21', 1, 1),
(667, '20220724110akyjd', 'alsadiqibrahim03@gmail.com', 250, 488, 'Refund', '2022-07-24 10:59:53', 1, 1),
(668, '20220724120ffebm', 'alsadiqibrahim03@gmail.com', 394, 94, 'debit', '2022-07-24 11:04:44', 1, 1),
(669, '20220724150czshg', 'azzeetech.it@gmail.com', 125, 264983, 'debit', '2022-07-24 14:37:22', 1, 1),
(670, '20220724190lkpbv', 'sanizakariumar@gmail.com', 197, 3313, 'debit', '2022-07-24 18:59:11', 1, 1),
(671, '20220724200kyord', 'azzeetech.it@gmail.com', 1400, 263583, 'transfered', '2022-07-24 19:32:22', 1, 1),
(672, '20220724200kyord', 'hamisusulaimanimam@gmail.com', 1400, 45, 'recieved', '2022-07-24 19:32:22', 1, 0),
(673, '20220724210jnzdu', 'hamisusulaimanimam@gmail.com', 460, 1445, 'Refund', '2022-07-24 20:59:57', 1, 1),
(674, '20220725010xqdlc', 'haliludada@yahoo.com', 1000, 0, 'credit', '2022-07-25 00:11:37', 1, 0),
(675, '20220725090vvtmr', 'mz1929@yahoo.com', 250, 270, 'Refund', '2022-07-25 08:56:08', 1, 1),
(676, '20220725090ermav', 'mz1929@yahoo.com', 250, 270, 'Refund', '2022-07-25 08:57:35', 1, 1),
(677, '20220725090sgekc', 'mz1929@yahoo.com', 250, 270, 'Refund', '2022-07-25 08:59:51', 1, 1),
(678, '20220725100yjqfy', 'mz1929@yahoo.com', 250, 270, 'Refund', '2022-07-25 09:01:07', 1, 1),
(679, '20220725100hqjtj', 'mz1929@yahoo.com', 250, 270, 'Refund', '2022-07-25 09:07:21', 1, 1),
(680, '20220725100rtshq', 'mz1929@yahoo.com', 250, 270, 'Refund', '2022-07-25 09:08:55', 1, 1),
(681, '20220725100lxdnz', 'mz1929@yahoo.com', 250, 270, 'Refund', '2022-07-25 09:11:57', 1, 1),
(682, '20220725100iwqky', 'azzeetech.it@gmail.com', 125, 263583, 'Refund', '2022-07-25 09:14:24', 1, 1),
(683, '20220725100kuoms', 'azzeetech.it@gmail.com', 500, 263083, 'transfered', '2022-07-25 09:26:48', 1, 1),
(684, '20220725100kuoms', 'ahmadhy44@gmail.com', 500, 0, 'recieved', '2022-07-25 09:26:48', 1, 0),
(685, '20220725110enlhf', 'mz1929@yahoo.com', 250, 20, 'debit', '2022-07-25 10:07:27', 1, 1),
(686, '20220725120yvaqg', 'hamisusulaimanimam@gmail.com', 125, 1320, 'debit', '2022-07-25 11:09:05', 1, 1),
(687, '20220725120csctv', 'hamisusulaimanimam@gmail.com', 230, 1320, 'Refund', '2022-07-25 11:10:51', 1, 1),
(688, '20220725120xxxqw', 'hamisusulaimanimam@gmail.com', 230, 1320, 'Refund', '2022-07-25 11:12:14', 1, 1),
(689, '20220725120myrib', 'hamisusulaimanimam@gmail.com', 250, 1070, 'debit', '2022-07-25 11:12:57', 1, 1),
(690, '20220725120igkrd', 'hamisusulaimanimam@gmail.com', 460, 1070, 'Refund', '2022-07-25 11:16:57', 1, 1),
(691, '20220725120wizuq', 'hamisusulaimanimam@gmail.com', 500, 570, 'debit', '2022-07-25 11:25:27', 1, 1),
(692, '20220725130xylrh', 'sanizakariumar@gmail.com', 250, 3063, 'debit', '2022-07-25 12:18:29', 1, 1),
(693, '20220725130xnvpf', 'sanizakariumar@gmail.com', 197, 2866, 'debit', '2022-07-25 12:22:47', 1, 1),
(694, '20220725130glcjf', 'mz1929@yahoo.com', 300, 20, 'credit', '2022-07-25 12:38:21', 1, 0),
(695, '20220725140opdhc', 'sanizakariumar@gmail.com', 197, 2669, 'debit', '2022-07-25 13:08:01', 1, 1),
(696, '20220725200zdgov', 'hamisusulaimanimam@gmail.com', 294, 276, 'debit', '2022-07-25 19:01:43', 1, 1),
(697, '20220725200ciqje', 'azzeetech.it@gmail.com', 115, 262980, 'debit', '2022-07-25 19:42:18', 1, 1),
(698, '20220725200ohwmb', 'azzeetech.it@gmail.com', 500, 262480, 'transfered', '2022-07-25 19:46:35', 1, 1),
(699, '20220725200ohwmb', 'haliludada@yahoo.com', 500, 0, 'recieved', '2022-07-25 19:46:35', 1, 0),
(700, '20220725200ekhal', 'azzeetech.it@gmail.com', 500, 261980, 'transfered', '2022-07-25 19:49:16', 1, 1),
(701, '20220725200ekhal', 'muhammadraji@gmail.com', 500, 0, 'recieved', '2022-07-25 19:49:16', 1, 0),
(702, '20220725200jgtqn', 'umarreal411@gmail.com', 2500, 3, 'credit', '2022-07-25 19:55:45', 1, 0),
(703, '20220725210mkttj', 'azzeetech.it@gmail.com', 115, 261980, 'Refund', '2022-07-25 20:03:25', 1, 1),
(704, '20220725210tlefy', 'azzeetech.it@gmail.com', 196, 261784, 'debit', '2022-07-25 20:11:30', 1, 1),
(705, '20220725210jsthn', 'azzeetech.it@gmail.com', 2500, 259284, 'transfered', '2022-07-25 20:33:11', 1, 1),
(706, '20220725210jsthn', 'umarreal411@gmail.com', 2500, 3, 'recieved', '2022-07-25 20:33:11', 1, 0),
(707, '20220725210khfty', 'hamisusulaimanimam@gmail.com', 230, 46, 'debit', '2022-07-25 20:34:14', 1, 1),
(708, '20220725230smpmb', 'umarreal411@gmail.com', 2450, 53, 'debit', '2022-07-25 22:21:51', 1, 1),
(709, '20220726010yhxtx', 'haliludada@yahoo.com', 294, 206, 'debit', '2022-07-26 00:25:16', 1, 1),
(710, '20220726060guipc', 'muhammadraji@gmail.com', 294, 208, 'debit', '2022-07-26 05:13:41', 1, 1),
(711, '20220726070yzvqb', 'azzeetech.it@gmail.com', 115, 259172, 'debit', '2022-07-26 06:02:53', 1, 1),
(712, '20220726090ucrkp', 'azzeetech.it@gmail.com', 115, 259057, 'debit', '2022-07-26 08:56:00', 1, 1),
(713, '20220726110byjmq', 'sanizakariumar@gmail.com', 197, 2472, 'debit', '2022-07-26 10:47:17', 1, 1),
(714, '20220726140fegre', 'azzeetech.it@gmail.com', 197, 258860, 'debit', '2022-07-26 13:19:16', 1, 1),
(715, '20220726200zcrwl', 'azzeetech.it@gmail.com', 115, 258745, 'debit', '2022-07-26 19:27:31', 1, 1),
(716, '20220726210hlcko', 'mz1929@yahoo.com', 500, 20, 'credit', '2022-07-26 20:06:28', 1, 0),
(717, '20220726210hwblx', 'azzeetech.it@gmail.com', 500, 258245, 'transfered', '2022-07-26 20:16:46', 1, 1),
(718, '20220726210hwblx', 'mz1929@yahoo.com', 500, 20, 'recieved', '2022-07-26 20:16:46', 1, 0),
(719, '20220726210yszva', 'mz1929@yahoo.com', 250, 270, 'debit', '2022-07-26 20:23:24', 1, 1),
(720, '20220726210bpitm', 'azzeetech.it@gmail.com', 115, 258130, 'debit', '2022-07-26 20:39:58', 1, 1),
(721, '20220726230skhti', 'ahmadhy44@gmail.com', 392, 108, 'debit', '2022-07-26 22:05:59', 1, 1),
(722, '20220727070ogauw', 'sanizakariumar@gmail.com', 250, 2222, 'debit', '2022-07-27 06:56:54', 1, 1),
(723, '20220727090lbtyb', 'sanizakariumar@gmail.com', 250, 1972, 'debit', '2022-07-27 08:18:12', 1, 1),
(724, '20220727130rrvpz', 'sanizakariumar@gmail.com', 250, 1722, 'debit', '2022-07-27 12:55:26', 1, 1),
(725, '20220727160qpbmb', 'azzeetech.it@gmail.com', 115, 258130, 'Refund', '2022-07-27 15:05:12', 1, 1),
(726, '20220727160kdgah', 'azzeetech.it@gmail.com', 210, 257920, 'transfered', '2022-07-27 15:41:14', 1, 1),
(727, '20220727160kdgah', 'princeishaq53@gmail.com', 210, 20, 'recieved', '2022-07-27 15:41:14', 1, 0),
(728, '20220727160gonud', 'princeishaq53@gmail.com', 230, 0, 'debit', '2022-07-27 15:43:31', 1, 1),
(729, '20220727160uhsro', 'azzeetech.it@gmail.com', 115, 257805, 'debit', '2022-07-27 15:48:28', 1, 1),
(730, '20220727180vuirq', 'sanizakariumar@gmail.com', 197, 1722, 'Refund', '2022-07-27 17:03:38', 1, 1),
(731, '20220727180fovpv', 'sanizakariumar@gmail.com', 125, 1597, 'debit', '2022-07-27 17:25:13', 1, 1),
(732, '20220727180fljsa', 'sanizakariumar@gmail.com', 98, 1597, 'Refund', '2022-07-27 17:29:01', 1, 1),
(733, '20220727180sfpwi', 'sanizakariumar@gmail.com', 98, 1597, 'Refund', '2022-07-27 17:30:21', 1, 1),
(734, '20220727180ymkre', 'sanizakariumar@gmail.com', 98, 1597, 'Refund', '2022-07-27 17:32:15', 1, 1),
(735, '20220727180jhiet', 'sanizakariumar@gmail.com', 2000, 3597, 'credit', '2022-07-27 17:33:19', 1, 1),
(736, '20220727180pzlxj', 'sanizakariumar@gmail.com', 197, 3597, 'Refund', '2022-07-27 17:57:07', 1, 1),
(737, '20220728010jtfkr', 'muhammadraji@gmail.com', 196, 14, 'debit', '2022-07-28 00:13:21', 1, 1),
(738, '20220728030kquyx', 'haliludada@yahoo.com', 98, 108, 'debit', '2022-07-28 02:08:27', 1, 1),
(739, '20220728080sxmgq', 'mz1929@yahoo.com', 250, 20, 'debit', '2022-07-28 07:34:45', 1, 1),
(740, '20220728080ntnaw', 'kakyansoro87@gmail.com', 196, 3368, 'debit', '2022-07-28 07:45:01', 1, 1),
(741, '20220728080sdpkt', 'azzeetech.it@gmail.com', 115, 257690, 'debit', '2022-07-28 07:45:56', 1, 1),
(742, '20220728140oulsk', 'azzeetech.it@gmail.com', 125, 257565, 'debit', '2022-07-28 13:11:05', 1, 1),
(743, '20220728140ukzvw', 'azzeetech.it@gmail.com', 115, 257450, 'debit', '2022-07-28 13:28:11', 1, 1),
(744, '20220728140nzckl', 'sanizakariumar@gmail.com', 197, 3400, 'debit', '2022-07-28 13:31:15', 1, 1),
(745, '20220728150eehcx', 'sanizakariumar@gmail.com', 250, 3150, 'debit', '2022-07-28 14:25:14', 1, 1),
(746, '20220728160kipkm', 'azzeetech.it@gmail.com', 115, 257335, 'debit', '2022-07-28 15:53:52', 1, 1),
(747, '20220728160kjqhf', 'azzeetech.it@gmail.com', 98, 257237, 'debit', '2022-07-28 15:58:03', 1, 1),
(748, '20220728180tkprk', 'azzeetech.it@gmail.com', 230, 257007, 'debit', '2022-07-28 17:20:46', 1, 1),
(749, '20220728190xhtsw', 'ahmadhy44@gmail.com', 98, 10, 'debit', '2022-07-28 18:27:58', 1, 1),
(750, '20220728200dpowt', 'azzeetech.it@gmail.com', 2500, 254507, 'transfered', '2022-07-28 19:14:03', 1, 1),
(751, '20220728200dpowt', 'abdulkarimahmad303@gmail.com', 2500, 0, 'recieved', '2022-07-28 19:14:03', 1, 0),
(752, '20220728200pwouh', 'abdulkarimahmad303@gmail.com', 492, 2008, 'debit', '2022-07-28 19:53:50', 1, 1),
(753, '20220728200edjqe', 'abdulkarimahmad303@gmail.com', 492, 1516, 'debit', '2022-07-28 19:55:10', 1, 1),
(754, '20220728210hcupc', 'abdulkarimahmad303@gmail.com', 98, 1418, 'debit', '2022-07-28 20:39:17', 1, 1),
(755, '20220728210ppjqs', 'abdulkarimahmad303@gmail.com', 115, 1303, 'debit', '2022-07-28 20:59:11', 1, 1),
(756, '20220729060drqqj', 'azzeetech.it@gmail.com', 115, 254392, 'debit', '2022-07-29 05:05:40', 1, 1),
(757, '20220729120ztgyd', 'azzeetech.it@gmail.com', 125, 254267, 'debit', '2022-07-29 11:12:35', 1, 1),
(758, '20220729170qmcnu', 'sanizakariumar@gmail.com', 250, 2900, 'debit', '2022-07-29 16:31:47', 1, 1),
(759, '20220729210ebgtz', 'abdulkarimahmad303@gmail.com', 98, 1205, 'debit', '2022-07-29 20:57:41', 1, 1),
(760, '20220729220pezgi', 'azzeetech.it@gmail.com', 125, 254142, 'debit', '2022-07-29 21:19:53', 1, 1),
(761, '20220729220hnkno', 'azzeetech.it@gmail.com', 2, 254142, 'credit', '2022-07-29 21:28:02', 1, 0),
(762, '20220730060hncdq', 'mz1929@yahoo.com', 100, 20, 'credit', '2022-07-30 05:27:15', 1, 0),
(763, '20220730060udsws', 'mz1929@yahoo.com', 200, 20, 'credit', '2022-07-30 05:27:43', 1, 0),
(764, '20220730060miiha', 'mz1929@yahoo.com', 500, 20, 'credit', '2022-07-30 05:29:28', 1, 0),
(765, '20220730060oetux', 'mz1929@yahoo.com', 500, 20, 'credit', '2022-07-30 05:29:55', 1, 0),
(766, '20220730060pkfho', 'mz1929@yahoo.com', 500, 20, 'credit', '2022-07-30 05:30:22', 1, 0),
(767, '20220730060wchhd', 'mz1929@yahoo.com', 500, 20, 'credit', '2022-07-30 05:32:52', 1, 0),
(768, '20220730060jsnxj', 'mz1929@yahoo.com', 500, 20, 'credit', '2022-07-30 05:36:45', 1, 0),
(769, '20220730090bhinc', 'azzeetech.it@gmail.com', 500, 254142, 'credit', '2022-07-30 08:27:23', 1, 0),
(770, '20220730090ifymg', 'azzeetech.it@gmail.com', 500, 253642, 'transfered', '2022-07-30 08:29:08', 1, 1),
(771, '20220730090ifymg', 'mz1929@yahoo.com', 500, 20, 'recieved', '2022-07-30 08:29:08', 1, 0),
(772, '20220730090ijzlk', 'mz1929@yahoo.com', 250, 270, 'debit', '2022-07-30 08:48:48', 1, 1),
(773, '20220730110qohqd', 'azzeetech.it@gmail.com', 125, 253517, 'debit', '2022-07-30 10:09:04', 1, 1),
(774, '20220730130daaam', 'abdulkarimahmad303@gmail.com', 492, 713, 'debit', '2022-07-30 12:37:23', 1, 1),
(775, '20220730140dqldt', 'azzeetech.it@gmail.com', 115, 253402, 'debit', '2022-07-30 13:14:12', 1, 1),
(776, '20220730140rvnfp', 'azzeetech.it@gmail.com', 49, 253353, 'debit', '2022-07-30 13:16:26', 1, 1),
(777, '20220730200cgkyz', 'azzeetech.it@gmail.com', 125, 253228, 'debit', '2022-07-30 19:12:19', 1, 1),
(778, '20220731080mxcqa', 'sanizakariumar@gmail.com', 197, 2703, 'debit', '2022-07-31 07:24:51', 1, 1),
(779, '20220731100bomdf', 'mz1929@yahoo.com', 115, 155, 'debit', '2022-07-31 09:55:04', 1, 1),
(780, '20220731120pwnzs', 'azzeetech.it@gmail.com', 125, 253103, 'debit', '2022-07-31 11:33:47', 1, 1),
(781, '20220731140umwad', 'azzeetech.it@gmail.com', 200, 252903, 'transfered', '2022-07-31 13:53:59', 1, 1),
(782, '20220731140umwad', 'muhammadraji@gmail.com', 200, 16, 'recieved', '2022-07-31 13:53:59', 1, 0),
(783, '20220731150ghuoo', 'sanizakariumar@gmail.com', 250, 2453, 'debit', '2022-07-31 14:01:52', 1, 1),
(784, '20220731160oitwc', 'muhammadraji@gmail.com', 98, 118, 'debit', '2022-07-31 15:49:46', 1, 1),
(785, '20220731220gezwm', 'abdulkarimahmad303@gmail.com', 98, 615, 'debit', '2022-07-31 21:44:29', 1, 1),
(786, '20220801050ilude', 'kakyansoro87@gmail.com', 750, 3368, 'Refund', '2022-08-01 04:51:41', 1, 1),
(787, '20220801050fsfvm', 'kakyansoro87@gmail.com', 750, 3368, 'Refund', '2022-08-01 04:52:57', 1, 1),
(788, '20220801050iszeh', 'kakyansoro87@gmail.com', 196, 3172, 'debit', '2022-08-01 04:53:57', 1, 1),
(789, '20220801050fzpmm', 'kakyansoro87@gmail.com', 690, 3172, 'Refund', '2022-08-01 04:56:04', 1, 1),
(790, '20220801100bzmzd', 'azzeetech.it@gmail.com', 125, 252778, 'debit', '2022-08-01 10:00:15', 1, 1),
(791, '20220801110rfnyp', 'abdulkarimahmad303@gmail.com', 147, 468, 'debit', '2022-08-01 10:25:19', 1, 1),
(792, '20220801170cdimh', 'sanizakariumar@gmail.com', 250, 2203, 'debit', '2022-08-01 16:07:59', 1, 1),
(793, '20220801210yegcv', 'abdulkarimahmad303@gmail.com', 115, 353, 'debit', '2022-08-01 20:59:55', 1, 1),
(794, '20220801220wrtbz', 'abdulkarimahmad303@gmail.com', 49, 304, 'debit', '2022-08-01 21:01:32', 1, 1),
(795, '20220802000evifu', 'azzeetech.it@gmail.com', 125, 252653, 'debit', '2022-08-01 23:17:49', 1, 1),
(796, '20220802090vinhc', 'azzeetech.it@gmail.com', 250, 252403, 'debit', '2022-08-02 08:42:07', 1, 1),
(797, '20220802120wpbxs', 'abdulkarimahmad303@gmail.com', 98, 206, 'debit', '2022-08-02 11:23:47', 1, 1),
(798, '20220802190eosxs', 'kakyansoro87@gmail.com', 294, 3172, 'Refund', '2022-08-02 18:31:20', 1, 1),
(799, '20220802190aqxud', 'kakyansoro87@gmail.com', 690, 3172, 'Refund', '2022-08-02 18:33:59', 1, 1),
(800, '20220802190mkzza', 'kakyansoro87@gmail.com', 294, 3172, 'Refund', '2022-08-02 18:35:48', 1, 1),
(801, '20220802190lcrmw', 'kakyansoro87@gmail.com', 750, 3172, 'Refund', '2022-08-02 18:38:18', 1, 1),
(802, '20220802190wkczq', 'sanizakariumar@gmail.com', 500, 2203, 'Refund', '2022-08-02 18:43:50', 1, 1),
(803, '20220802190ygfkn', 'kakyansoro87@gmail.com', 690, 3172, 'Refund', '2022-08-02 18:56:33', 1, 1),
(804, '20220802210atzwl', 'sanizakariumar@gmail.com', 500, 1703, 'debit', '2022-08-02 20:37:57', 1, 1),
(805, '20220802230xeiia', 'abdulkarimahmad303@gmail.com', 98, 108, 'debit', '2022-08-02 22:56:42', 1, 1),
(806, '20220803070ohrul', 'azzeetech.it@gmail.com', 115, 252288, 'debit', '2022-08-03 06:49:25', 1, 1),
(807, '20220803090vxawb', 'kakyansoro87@gmail.com', 294, 3172, 'Refund', '2022-08-03 08:34:38', 1, 1),
(808, '20220803090ukudw', 'kakyansoro87@gmail.com', 750, 3172, 'Refund', '2022-08-03 08:37:06', 1, 1),
(809, '20220803150spphv', 'azzeetech.it@gmail.com', 125, 252163, 'debit', '2022-08-03 14:21:02', 1, 1),
(810, '20220803160cwapr', 'kakyansoro87@gmail.com', 750, 2422, 'debit', '2022-08-03 15:56:22', 1, 1),
(811, '20220803160paljh', 'kakyansoro87@gmail.com', 690, 2422, 'Refund', '2022-08-03 15:57:36', 1, 1),
(812, '20220803160bdxqn', 'kakyansoro87@gmail.com', 750, 2422, 'Refund', '2022-08-03 15:58:08', 1, 1),
(813, '20220803160tmtgd', 'kakyansoro87@gmail.com', 750, 2422, 'Refund', '2022-08-03 15:59:54', 1, 1),
(814, '20220803170gcxml', 'kakyansoro87@gmail.com', 750, 2422, 'Refund', '2022-08-03 16:02:02', 1, 1),
(815, '20220803190shxft', 'kakyansoro87@gmail.com', 750, 1672, 'debit', '2022-08-03 18:14:00', 1, 1),
(816, '20220803190ydqfu', 'sanizakariumar@gmail.com', 250, 1703, 'Refund', '2022-08-03 18:42:44', 1, 1),
(817, '20220803190zqxif', 'sanizakariumar@gmail.com', 250, 1703, 'Refund', '2022-08-03 18:46:00', 1, 1),
(818, '20220803190kydch', 'sanizakariumar@gmail.com', 250, 1703, 'Refund', '2022-08-03 18:48:40', 1, 1),
(819, '20220803190kqfwn', 'muhammadraji@gmail.com', 98, 20, 'debit', '2022-08-03 18:56:59', 1, 1),
(820, '20220803200urvqt', 'abdulkarimahmad303@gmail.com', 98, 10, 'debit', '2022-08-03 19:20:31', 1, 1),
(821, '20220803200vsqjh', 'azzeetech.it@gmail.com', 350, 251813, 'transfered', '2022-08-03 19:29:05', 1, 1),
(822, '20220803200vsqjh', 'abdulkarimahmad303@gmail.com', 350, 10, 'recieved', '2022-08-03 19:29:05', 1, 0),
(823, '20220803210aplqt', 'abdulkarimahmad303@gmail.com', 250, 110, 'debit', '2022-08-03 21:02:43', 1, 1),
(824, '20220803220hejxn', 'azzeetech.it@gmail.com', 125, 251688, 'debit', '2022-08-03 21:29:33', 1, 1),
(825, '20220803220ubzkh', 'abdulkarimahmad303@gmail.com', 98, 12, 'debit', '2022-08-03 21:33:48', 1, 1),
(826, '20220804030czdjn', 'sanizakariumar@gmail.com', 250, 1703, 'Refund', '2022-08-04 02:32:52', 1, 1),
(827, '20220804030pmasw', 'sanizakariumar@gmail.com', 125, 1703, 'Refund', '2022-08-04 02:35:46', 1, 1),
(828, '20220804040qnnmb', 'sanizakariumar@gmail.com', 125, 1703, 'Refund', '2022-08-04 03:00:33', 1, 1),
(829, '20220804060fqtiq', 'sanizakariumar@gmail.com', 250, 1703, 'Refund', '2022-08-04 05:42:46', 1, 1),
(830, '20220804080fglsf', 'azzeetech.it@gmail.com', 100, 251688, 'credit', '2022-08-04 07:43:15', 1, 0),
(831, '20220804100hoekw', 'sanizakariumar@gmail.com', 125, 1703, 'Refund', '2022-08-04 09:43:00', 1, 1),
(832, '20220804110tnzum', 'sanizakariumar@gmail.com', 250, 1453, 'debit', '2022-08-04 10:39:12', 1, 1),
(833, '20220804110sjoma', 'sanizakariumar@gmail.com', 250, 1203, 'debit', '2022-08-04 10:40:43', 1, 1),
(834, '20220804110skwpt', 'sanizakariumar@gmail.com', 3000, 1203, 'credit', '2022-08-04 10:57:36', 1, 0),
(835, '20220804110dpwbc', 'azzeetech.it@gmail.com', 125, 251563, 'debit', '2022-08-04 10:59:34', 1, 1),
(836, '20220804180drmdd', 'sanizakariumar@gmail.com', 250, 953, 'debit', '2022-08-04 17:03:04', 1, 1),
(837, '20220804180rkkms', 'sanizakariumar@gmail.com', 250, 703, 'debit', '2022-08-04 17:04:37', 1, 1),
(838, '20220804180hlpmb', 'sanizakariumar@gmail.com', 125, 578, 'debit', '2022-08-04 17:05:48', 1, 1),
(839, '20220804180mtfkn', 'azzeetech.it@gmail.com', 3500, 248063, 'transfered', '2022-08-04 17:15:08', 1, 1),
(840, '20220804180mtfkn', 'sanizakariumar@gmail.com', 3500, 578, 'recieved', '2022-08-04 17:15:08', 1, 0),
(841, '20220804200ncbty', 'azzeetech.it@gmail.com', 500, 247563, 'transfered', '2022-08-04 19:13:12', 1, 1),
(842, '20220804200ncbty', 'abdulkarimahmad303@gmail.com', 500, 12, 'recieved', '2022-08-04 19:13:12', 1, 0),
(843, '20220804210vfrqe', 'abdulkarimahmad303@gmail.com', 230, 282, 'debit', '2022-08-04 20:05:52', 1, 1),
(844, '20220804210yhrzz', 'sanizakariumar@gmail.com', 392, 4078, 'Refund', '2022-08-04 20:16:10', 1, 1);
INSERT INTO `wallet_history_tbl` (`id`, `trans_id`, `email`, `trans_amount`, `available_balance`, `wallet_status`, `trans_date`, `super_admin`, `status`) VALUES
(845, '20220804210tashc', 'azzeetech.it@gmail.com', 125, 247438, 'debit', '2022-08-04 20:56:37', 1, 1),
(846, '20220805040rceyv', 'haliludada@yahoo.com', 98, 10, 'debit', '2022-08-05 03:21:13', 1, 1),
(847, '20220805080zapua', 'azzeetech.it@gmail.com', 125, 247313, 'debit', '2022-08-05 07:11:22', 1, 1),
(848, '20220805090mjtmr', 'abdulkarimahmad303@gmail.com', 115, 282, 'Refund', '2022-08-05 08:53:31', 1, 1),
(849, '20220805090liizd', 'abdulkarimahmad303@gmail.com', 115, 282, 'Refund', '2022-08-05 08:58:12', 1, 1),
(850, '20220805100qciol', 'abdulkarimahmad303@gmail.com', 98, 184, 'debit', '2022-08-05 09:01:16', 1, 1),
(851, '20220805110vprvy', 'azzeetech.it@gmail.com', 125, 247188, 'debit', '2022-08-05 10:02:33', 1, 1),
(852, '20220805110axaqi', 'azzeetech.it@gmail.com', 125, 247063, 'debit', '2022-08-05 10:57:58', 1, 1),
(853, '20220805140yyyha', 'sanizakariumar@gmail.com', 250, 4078, 'Refund', '2022-08-05 13:02:10', 1, 1),
(854, '20220805150eabvr', 'sanizakariumar@gmail.com', 250, 4078, 'Refund', '2022-08-05 14:19:05', 1, 1),
(855, '20220805160pucda', 'azzeetech.it@gmail.com', 500, 246563, 'transfered', '2022-08-05 15:37:49', 1, 1),
(856, '20220805160pucda', 'abdulkarimahmad303@gmail.com', 500, 184, 'recieved', '2022-08-05 15:37:49', 1, 0),
(857, '20220805160mqgbt', 'abdulkarimahmad303@gmail.com', 250, 434, 'debit', '2022-08-05 15:40:08', 1, 1),
(858, '20220805180shpbx', 'sanizakariumar@gmail.com', 250, 3828, 'debit', '2022-08-05 17:56:57', 1, 1),
(859, '20220805200ohxka', 'hamisusulaimanimam@gmail.com', 100, 46, 'credit', '2022-08-05 19:43:23', 1, 0),
(860, '20220805220qbofh', 'azzeetech.it@gmail.com', 125, 246438, 'debit', '2022-08-05 21:47:58', 1, 1),
(861, '20220805220ouhab', 'abdulkarimahmad303@gmail.com', 78, 356, 'debit', '2022-08-05 21:55:48', 1, 1),
(862, '20220806080whddv', 'azzeetech.it@gmail.com', 125, 246313, 'debit', '2022-08-06 07:13:52', 1, 1),
(863, '20220806090jygmn', 'azzeetech.it@gmail.com', 250, 246063, 'debit', '2022-08-06 08:26:53', 1, 1),
(864, '20220806090hzeci', 'sanizakariumar@gmail.com', 392, 3436, 'debit', '2022-08-06 08:32:12', 1, 1),
(865, '20220806090wrkur', 'mz1929@yahoo.com', 125, 30, 'debit', '2022-08-06 08:35:55', 1, 1),
(866, '20220806150pnmlx', 'kakyansoro87@gmail.com', 196, 1476, 'debit', '2022-08-06 14:35:45', 1, 1),
(867, '20220806200hrcew', 'azzeetech.it@gmail.com', 500, 245563, 'transfered', '2022-08-06 19:22:00', 1, 1),
(868, '20220806200hrcew', 'hamisusulaimanimam@gmail.com', 500, 46, 'recieved', '2022-08-06 19:22:00', 1, 0),
(869, '20220806200lsvxu', 'hamisusulaimanimam@gmail.com', 460, 546, 'Refund', '2022-08-06 19:26:21', 1, 1),
(870, '20220806200qntjs', 'hamisusulaimanimam@gmail.com', 500, 46, 'debit', '2022-08-06 19:29:31', 1, 1),
(871, '20220806220kstxc', 'abdulkarimahmad303@gmail.com', 98, 258, 'debit', '2022-08-06 21:06:26', 1, 1),
(872, '20220807100mxswd', 'azzeetech.it@gmail.com', 125, 245443, 'debit', '2022-08-07 09:25:07', 1, 1),
(873, '20220807120iyasu', 'sanizakariumar@gmail.com', 1044, 2392, 'debit', '2022-08-07 11:04:57', 1, 1),
(874, '20220807120ohfez', 'sanizakariumar@gmail.com', 250, 2142, 'debit', '2022-08-07 11:07:29', 1, 1),
(875, '20220807130umahr', 'azzeetech.it@gmail.com', 125, 245318, 'debit', '2022-08-07 12:11:12', 1, 1),
(876, '20220807230typja', 'abdulkarimahmad303@gmail.com', 98, 160, 'debit', '2022-08-07 22:02:45', 1, 1),
(877, '20220808070euzay', 'azzeetech.it@gmail.com', 125, 245193, 'debit', '2022-08-08 06:38:20', 1, 1),
(878, '20220808070nlpco', 'azzeetech.it@gmail.com', 250, 245193, 'Refund', '2022-08-08 06:39:54', 1, 1),
(879, '20220808070swkxh', 'azzeetech.it@gmail.com', 250, 244943, 'debit', '2022-08-08 06:44:59', 1, 1),
(880, '20220808070ldaes', 'azzeetech.it@gmail.com', 250, 244693, 'debit', '2022-08-08 06:58:09', 1, 1),
(881, '20220808120elmgr', 'kakyansoro87@gmail.com', 197, 1279, 'debit', '2022-08-08 11:53:58', 1, 1),
(882, '20220808150tgkhm', 'kakyansoro87@gmail.com', 196, 1279, 'Refund', '2022-08-08 14:00:47', 1, 1),
(883, '20220808150iwfzr', 'kakyansoro87@gmail.com', 196, 1279, 'Refund', '2022-08-08 14:01:42', 1, 1),
(884, '20220808220ysghb', 'abdulkarimahmad303@gmail.com', 98, 160, 'Refund', '2022-08-08 21:14:43', 1, 1),
(885, '20220808220jtzxz', 'abdulkarimahmad303@gmail.com', 98, 160, 'Refund', '2022-08-08 21:17:57', 1, 1),
(886, '20220808220vmllr', 'abdulkarimahmad303@gmail.com', 98, 160, 'Refund', '2022-08-08 21:33:09', 1, 1),
(887, '20220808220nvcds', 'abdulkarimahmad303@gmail.com', 125, 35, 'debit', '2022-08-08 21:36:45', 1, 1),
(888, '20220808220hmwtl', 'azzeetech.it@gmail.com', 125, 244568, 'debit', '2022-08-08 21:44:11', 1, 1),
(889, '20220809080stgbx', 'azzeetech.it@gmail.com', 125, 244568, 'Refund', '2022-08-09 07:52:03', 1, 1),
(890, '20220809080uhhjf', 'azzeetech.it@gmail.com', 125, 244443, 'debit', '2022-08-09 07:58:29', 1, 1),
(891, '20220809130zfajw', 'sanizakariumar@gmail.com', 197, 2142, 'Refund', '2022-08-09 12:46:35', 1, 1),
(892, '20220809150jhcfe', 'sanizakariumar@gmail.com', 197, 2142, 'Refund', '2022-08-09 14:33:31', 1, 1),
(893, '20220809150sphzc', 'azzeetech.it@gmail.com', 125, 244318, 'debit', '2022-08-09 14:39:58', 1, 1),
(894, '20220809160isgkd', 'azzeetech.it@gmail.com', 250, 244318, 'Refund', '2022-08-09 15:23:00', 1, 1),
(895, '20220809160qhmjs', 'azzeetech.it@gmail.com', 250, 244318, 'Refund', '2022-08-09 15:27:53', 1, 1),
(896, '20220809160ngapw', 'azzeetech.it@gmail.com', 250, 244068, 'debit', '2022-08-09 15:29:39', 1, 1),
(897, '20220809160jfptl', 'sanizakariumar@gmail.com', 197, 1945, 'debit', '2022-08-09 15:51:29', 1, 1),
(898, '20220809170waewp', 'sanizakariumar@gmail.com', 197, 1748, 'debit', '2022-08-09 16:16:00', 1, 1),
(899, '20220809180rcwao', 'sanizakariumar@gmail.com', 197, 1748, 'Refund', '2022-08-09 17:07:55', 1, 1),
(900, '20220809200aeeqp', 'sanizakariumar@gmail.com', 250, 1498, 'debit', '2022-08-09 19:47:11', 1, 1),
(901, '20220809210yyrrn', 'sanizakariumar@gmail.com', 197, 1498, 'Refund', '2022-08-09 20:04:37', 1, 1),
(902, '20220809210xhxkt', 'intellisensehq@gmail.com', 1000, 179008, 'transfered', '2022-08-09 20:22:22', 1, 1),
(903, '20220809210xhxkt', 'sanilawanumar@gmail.com', 1000, 0, 'recieved', '2022-08-09 20:22:22', 1, 0),
(904, '20220809210sgnvd', 'sanilawanumar@gmail.com', 750, 250, 'debit', '2022-08-09 20:26:25', 1, 1),
(905, '20220809210aikpc', 'sanilawanumar@gmail.com', 68, 182, 'debit', '2022-08-09 20:29:34', 1, 1),
(906, '20220809230zfrxi', 'azzeetech.it@gmail.com', 125, 243943, 'debit', '2022-08-09 22:59:59', 1, 1),
(907, '20220810060ccblk', 'azzeetech.it@gmail.com', 3885, 240058, 'transfered', '2022-08-10 05:23:47', 1, 1),
(908, '20220810060ccblk', 'hamisusulaimanimam2022@gmail.com', 3885, 46, 'recieved', '2022-08-10 05:23:47', 1, 0),
(909, '20220810080dpswk', 'azzeetech.it@gmail.com', 197, 239861, 'debit', '2022-08-10 07:34:07', 1, 1),
(910, '20220810080igaod', 'azzeetech.it@gmail.com', 125, 239736, 'debit', '2022-08-10 07:55:01', 1, 1),
(911, '20220810080eavkh', 'hamisusulaimanimam2022@gmail.com', 230, 3701, 'debit', '2022-08-10 07:57:51', 1, 1),
(912, '20220810100hwcdc', 'azzeetech.it@gmail.com', 197, 239539, 'debit', '2022-08-10 09:10:17', 1, 1),
(913, '20220810100spexw', 'kakyansoro87@gmail.com', 196, 1279, 'Refund', '2022-08-10 09:18:00', 1, 1),
(914, '20220810110kfvaa', 'kakyansoro87@gmail.com', 196, 1279, 'Refund', '2022-08-10 10:09:40', 1, 1),
(915, '20220810110qgmin', 'kakyansoro87@gmail.com', 196, 1279, 'Refund', '2022-08-10 10:12:48', 1, 1),
(916, '20220810170xwpza', 'azzeetech.it@gmail.com', 125, 239414, 'debit', '2022-08-10 16:50:42', 1, 1),
(917, '20220810190gvfij', 'azzeetech.it@gmail.com', 125, 239289, 'debit', '2022-08-10 18:27:37', 1, 1),
(918, '20220810190ywlgp', 'azzeetech.it@gmail.com', 547, 238742, 'debit', '2022-08-10 18:40:55', 1, 1),
(919, '20220810200khaek', 'sanizakariumar@gmail.com', 646, 1498, 'Refund', '2022-08-10 19:03:02', 1, 1),
(920, '20220810220ieoyq', 'hamisusulaimanimam2022@gmail.com', 295, 3406, 'debit', '2022-08-10 21:16:44', 1, 1),
(921, '20220810220xfjbs', 'hamisusulaimanimam2022@gmail.com', 196, 3210, 'debit', '2022-08-10 21:18:55', 1, 1),
(922, '20220810220hdgsu', 'azzeetech.it@gmail.com', 547, 238742, 'Refund', '2022-08-10 21:54:49', 1, 1),
(923, '20220810230ajori', 'azzeetech.it@gmail.com', 547, 238195, 'debit', '2022-08-10 22:10:16', 1, 1),
(924, '20220811060qukwt', 'azzeetech.it@gmail.com', 125, 238070, 'debit', '2022-08-11 05:04:49', 1, 1),
(925, '20220811060iawch', 'sanizakariumar@gmail.com', 125, 1373, 'debit', '2022-08-11 05:56:46', 1, 1),
(926, '20220811090gebkl', 'hamisusulaimanimam2022@gmail.com', 115, 3095, 'debit', '2022-08-11 08:53:19', 1, 1),
(927, '20220811130repvr', 'azzeetech.it@gmail.com', 125, 237945, 'debit', '2022-08-11 12:48:43', 1, 1),
(928, '20220811170rpvfd', 'hamisusulaimanimam2022@gmail.com', 230, 2865, 'debit', '2022-08-11 16:28:58', 1, 1),
(929, '20220811190pdnbj', 'azzeetech.it@gmail.com', 125, 237820, 'debit', '2022-08-11 18:40:01', 1, 1),
(930, '20220811190zdqfe', 'mz1929@yahoo.com', 200, 30, 'credit', '2022-08-11 18:47:14', 1, 0),
(931, '20220812060qdqls', 'azzeetech.it@gmail.com', 125, 237695, 'debit', '2022-08-12 05:40:13', 1, 1),
(932, '20220812090rqftx', 'hamisusulaimanimam2022@gmail.com', 480, 2385, 'debit', '2022-08-12 08:18:46', 1, 1),
(933, '20220812090lgbkp', 'hamisusulaimanimam2022@gmail.com', 115, 2270, 'debit', '2022-08-12 08:45:08', 1, 1),
(934, '20220812100mxtwa', 'azzeetech.it@gmail.com', 59, 237636, 'debit', '2022-08-12 09:00:59', 1, 1),
(935, '20220812100qbksh', 'hamisusulaimanimam2022@gmail.com', 115, 2270, 'Refund', '2022-08-12 09:29:18', 1, 1),
(936, '20220812100aqgoj', 'hamisusulaimanimam2022@gmail.com', 125, 2270, 'Refund', '2022-08-12 09:30:33', 1, 1),
(937, '20220812100mjgzi', 'hamisusulaimanimam2022@gmail.com', 125, 2270, 'Refund', '2022-08-12 09:32:24', 1, 1),
(938, '20220812100tuubd', 'hamisusulaimanimam2022@gmail.com', 115, 2270, 'Refund', '2022-08-12 09:33:49', 1, 1),
(939, '20220812100gbcml', 'hamisusulaimanimam2022@gmail.com', 125, 2270, 'Refund', '2022-08-12 09:34:55', 1, 1),
(940, '20220812100uhmnw', 'hamisusulaimanimam2022@gmail.com', 98, 2270, 'Refund', '2022-08-12 09:36:30', 1, 1),
(941, '20220812100ucwtl', 'hamisusulaimanimam2022@gmail.com', 115, 2270, 'Refund', '2022-08-12 09:44:36', 1, 1),
(942, '20220812120wsrmx', 'azzeetech.it@gmail.com', 125, 237636, 'Refund', '2022-08-12 11:54:00', 1, 1),
(943, '20220812170whbur', 'hamisusulaimanimam2022@gmail.com', 480, 2270, 'Refund', '2022-08-12 16:33:28', 1, 1),
(944, '20220812170jbiwi', 'hamisusulaimanimam2022@gmail.com', 97, 2270, 'Refund', '2022-08-12 16:36:11', 1, 1),
(945, '20220812210ftvbz', 'hamisusulaimanimam2022@gmail.com', 98, 2270, 'Refund', '2022-08-12 20:20:18', 1, 1),
(946, '20220812230irirs', 'azzeetech.it@gmail.com', 125, 237511, 'debit', '2022-08-12 22:01:58', 1, 1),
(947, '20220813070xrlos', 'hamisusulaimanimam2022@gmail.com', 115, 2270, 'Refund', '2022-08-13 06:56:11', 1, 1),
(948, '20220813100uqcto', 'hussainitayyib@gmail.com', 1000, 0, 'credit', '2022-08-13 09:19:09', 1, 0),
(949, '20220813160lfutp', 'azzeetech.it@gmail.com', 125, 237511, 'Refund', '2022-08-13 15:18:38', 1, 1),
(950, '20220813160hwgns', 'azzeetech.it@gmail.com', 125, 237511, 'Refund', '2022-08-13 15:19:58', 1, 1),
(951, '20220813160xqgzc', 'azzeetech.it@gmail.com', 125, 237386, 'debit', '2022-08-13 15:39:48', 1, 1),
(952, '20220813170qfzsx', 'kakyansoro87@gmail.com', 750, 1279, 'Refund', '2022-08-13 16:38:32', 1, 1),
(953, '20220813170zxeib', 'kakyansoro87@gmail.com', 750, 1279, 'Refund', '2022-08-13 16:39:37', 1, 1),
(954, '20220813190xrwkd', 'hamisusulaimanimam2022@gmail.com', 115, 2155, 'debit', '2022-08-13 18:29:26', 1, 1),
(955, '20220813230npobf', 'azzeetech.it@gmail.com', 230, 237156, 'debit', '2022-08-13 22:59:33', 1, 1),
(956, '20220814070tnaxn', 'sanizakariumar@gmail.com', 250, 1123, 'debit', '2022-08-14 06:29:09', 1, 1),
(957, '20220814110iftze', 'azzeetech.it@gmail.com', 125, 237031, 'debit', '2022-08-14 10:35:31', 1, 1),
(958, '20220814120lsdub', 'hamisusulaimanimam2022@gmail.com', 195, 2155, 'Refund', '2022-08-14 11:08:59', 1, 1),
(959, '20220814120tynrq', 'hamisusulaimanimam2022@gmail.com', 195, 2155, 'Refund', '2022-08-14 11:16:27', 1, 1),
(960, '20220814180wfpet', 'hamisusulaimanimam2022@gmail.com', 115, 2155, 'Refund', '2022-08-14 17:35:12', 1, 1),
(961, '20220814180hsegb', 'hamisusulaimanimam2022@gmail.com', 125, 2030, 'debit', '2022-08-14 17:39:22', 1, 1),
(962, '20220814180elmmb', 'hamisusulaimanimam2022@gmail.com', 230, 2030, 'Refund', '2022-08-14 17:52:29', 1, 1),
(963, '20220814180pilpl', 'hamisusulaimanimam2022@gmail.com', 250, 1780, 'debit', '2022-08-14 17:53:30', 1, 1),
(964, '20220814190wtjch', 'azzeetech.it@gmail.com', 500, 236531, 'transfered', '2022-08-14 18:27:24', 1, 1),
(965, '20220814190wtjch', 'sanikaojeimran@gmai.com', 500, 0, 'recieved', '2022-08-14 18:27:24', 1, 0),
(966, '20220814190cxonw', 'sanikaojeimran@gmai.com', 500, 500, 'Refund', '2022-08-14 18:31:12', 1, 1),
(967, '20220814190ifclm', 'sanikaojeimran@gmai.com', 500, 500, 'Refund', '2022-08-14 18:49:14', 1, 1),
(968, '20220814190chqqw', 'sanikaojeimran@gmai.com', 250, 500, 'Refund', '2022-08-14 18:49:51', 1, 1),
(969, '20220814190bahte', 'sanikaojeimran@gmai.com', 1000, 500, 'credit', '2022-08-14 18:51:38', 1, 0),
(970, '20220814190xrmtw', 'sanikaojeimran@gmai.com', 1000, 500, 'credit', '2022-08-14 18:51:56', 1, 0),
(971, '20220814190iwhda', 'sanikaojeimran@gmai.com', 250, 500, 'Refund', '2022-08-14 18:53:26', 1, 1),
(972, '20220814190wruub', 'sanikaojeimran@gmai.com', 125, 500, 'Refund', '2022-08-14 18:54:22', 1, 1),
(973, '20220814190pzssz', 'sanikaojeimran@gmai.com', 115, 500, 'Refund', '2022-08-14 18:55:14', 1, 1),
(974, '20220814210tsijh', 'sanikaojeimran@gmai.com', 250, 500, 'Refund', '2022-08-14 20:45:28', 1, 1),
(975, '20220814210tasim', 'hamisusulaimanimam2022@gmail.com', 125, 1780, 'Refund', '2022-08-14 20:53:52', 1, 1),
(976, '20220814210uuete', 'hamisusulaimanimam2022@gmail.com', 115, 1665, 'debit', '2022-08-14 20:54:24', 1, 1),
(977, '20220815080pqita', 'azzeetech.it@gmail.com', 125, 236406, 'debit', '2022-08-15 07:23:05', 1, 1),
(978, '20220815100dtega', 'hamisusulaimanimam2022@gmail.com', 197, 1468, 'debit', '2022-08-15 09:41:20', 1, 1),
(979, '20220815160ukueb', 'hamisusulaimanimam2022@gmail.com', 197, 1271, 'debit', '2022-08-15 15:34:42', 1, 1),
(980, '20220815160mfhlc', 'hamisusulaimanimam2022@gmail.com', 230, 1041, 'debit', '2022-08-15 15:41:44', 1, 1),
(981, '20220815170lyyis', 'azzeetech.it@gmail.com', 98, 236308, 'debit', '2022-08-15 16:29:29', 1, 1),
(982, '20220815170zagyy', 'azzeetech.it@gmail.com', 98, 236210, 'debit', '2022-08-15 16:30:31', 1, 1),
(983, '20220815180zkgio', 'sanizakariumar@gmail.com', 750, 1123, 'Refund', '2022-08-15 17:02:25', 1, 1),
(984, '20220815180rriwg', 'sanizakariumar@gmail.com', 750, 1123, 'Refund', '2022-08-15 17:21:26', 1, 1),
(985, '20220815180bvlto', 'kakyansoro87@gmail.com', 196, 1083, 'debit', '2022-08-15 17:30:36', 1, 1),
(986, '20220815180larvk', 'kakyansoro87@gmail.com', 196, 887, 'debit', '2022-08-15 17:31:29', 1, 1),
(987, '20220815210nunmd', 'azzeetech.it@gmail.com', 125, 236085, 'debit', '2022-08-15 20:35:51', 1, 1),
(988, '20220815220zzsqx', 'azzeetech.it@gmail.com', 2675, 233410, 'transfered', '2022-08-15 21:05:04', 1, 1),
(989, '20220815220zzsqx', 'hamisusulaimanimam2022@gmail.com', 2675, 1041, 'recieved', '2022-08-15 21:05:04', 1, 0),
(990, '20220815220lgcan', 'azzeetech.it@gmail.com', 125, 233285, 'debit', '2022-08-15 21:17:17', 1, 1),
(991, '20220816030dxrdw', 'alsadiqibrahim03@gmail.com', 200, 94, 'credit', '2022-08-16 02:14:11', 1, 0),
(992, '20220816040sfkvn', 'sanizakariumar@gmail.com', 750, 373, 'debit', '2022-08-16 03:37:58', 1, 1),
(993, '20220816040mfasd', 'sanizakariumar@gmail.com', 1000, 1373, 'credit', '2022-08-16 03:41:58', 1, 1),
(994, '20220816040hdqya', 'sanizakariumar@gmail.com', 750, 623, 'debit', '2022-08-16 03:44:50', 1, 1),
(995, '20220816070xbqei', 'hamisusulaimanimam2022@gmail.com', 125, 3591, 'debit', '2022-08-16 06:50:59', 1, 1),
(996, '20220816100vonkf', 'azzeetech.it@gmail.com', 125, 233160, 'debit', '2022-08-16 09:33:51', 1, 1),
(997, '20220816180juhtb', 'alsadiqibrahim03@gmail.com', 200, 94, 'credit', '2022-08-16 17:37:42', 1, 0),
(998, '20220816180hcwoh', 'alsadiqibrahim03@gmail.com', 200, 94, 'credit', '2022-08-16 17:39:26', 1, 0),
(999, '20220816180ahjbd', 'alsadiqibrahim03@gmail.com', 200, 94, 'credit', '2022-08-16 17:41:57', 1, 0),
(1000, '20220816210zpofp', 'azzeetech.it@gmail.com', 49, 233160, 'Refund', '2022-08-16 20:26:13', 1, 1),
(1001, '20220816210tejdw', 'azzeetech.it@gmail.com', 125, 233035, 'debit', '2022-08-16 20:59:01', 1, 1),
(1002, '20220817110aoczn', 'sanizakariumar@gmail.com', 250, 373, 'debit', '2022-08-17 10:03:38', 1, 1),
(1003, '20220817110sevgf', 'sanizakariumar@gmail.com', 197, 373, 'Refund', '2022-08-17 10:23:30', 1, 1),
(1004, '20220817110tsajo', 'sanizakariumar@gmail.com', 98, 373, 'Refund', '2022-08-17 10:24:37', 1, 1),
(1005, '20220817110uxzyk', 'hamisusulaimanimam2022@gmail.com', 125, 3466, 'debit', '2022-08-17 10:30:43', 1, 1),
(1006, '20220817120bnjqz', 'azzeetech.it@gmail.com', 125, 232910, 'debit', '2022-08-17 11:25:43', 1, 1),
(1007, '20220817120trvpd', 'azzeetech.it@gmail.com', 125, 232785, 'debit', '2022-08-17 11:50:38', 1, 1),
(1008, '20220817160shgap', 'hamisusulaimanimam2022@gmail.com', 125, 3341, 'debit', '2022-08-17 15:18:16', 1, 1),
(1009, '20220817160gzxov', 'hamisusulaimanimam2022@gmail.com', 197, 3341, 'Refund', '2022-08-17 15:55:00', 1, 1),
(1010, '20220817160toknr', 'hamisusulaimanimam2022@gmail.com', 197, 3341, 'Refund', '2022-08-17 15:55:49', 1, 1),
(1011, '20220817210zlvxd', 'hamisusulaimanimam2022@gmail.com', 196, 3145, 'debit', '2022-08-17 20:05:06', 1, 1),
(1012, '20220817210duzxr', 'hamisusulaimanimam2022@gmail.com', 98, 3047, 'debit', '2022-08-17 20:07:04', 1, 0),
(1013, '20220817210xtpgk', 'hamisusulaimanimam2022@gmail.com', 98, 2949, 'debit', '2022-08-17 20:15:11', 1, 1),
(1014, '20220817220qplpa', 'hamisusulaimanimam2022@gmail.com', 98, 2851, 'debit', '2022-08-17 21:35:14', 1, 1),
(1015, '20220818060dhszo', 'azzeetech.it@gmail.com', 125, 232785, 'Refund', '2022-08-18 05:44:12', 1, 1),
(1016, '20220818110fghtd', 'azzeetech.it@gmail.com', 115, 232785, 'Refund', '2022-08-18 10:31:37', 1, 1),
(1017, '20220818110nijpe', 'azzeetech.it@gmail.com', 125, 232785, 'Refund', '2022-08-18 10:37:02', 1, 1),
(1018, '20220818140fssvm', 'hamisusulaimanimam2022@gmail.com', 115, 2851, 'Refund', '2022-08-18 13:42:30', 1, 1),
(1019, '20220818140mwpcy', 'hamisusulaimanimam2022@gmail.com', 125, 2851, 'Refund', '2022-08-18 13:43:02', 1, 1),
(1020, '20220818140pauea', 'hamisusulaimanimam2022@gmail.com', 125, 2726, 'debit', '2022-08-18 13:56:26', 1, 0),
(1021, '20220818150zcstb', 'hamisusulaimanimam2022@gmail.com', 125, 2601, 'debit', '2022-08-18 14:03:05', 1, 0),
(1022, '20220818150akeiz', 'hamisusulaimanimam2022@gmail.com', 98, 2503, 'debit', '2022-08-18 14:05:03', 1, 0),
(1023, '20220818200nlgzt', 'hamisusulaimanimam2022@gmail.com', 115, 2388, 'debit', '2022-08-18 19:47:49', 1, 1),
(1024, '20220818200tvzgf', 'hamisusulaimanimam2022@gmail.com', 115, 2273, 'debit', '2022-08-18 19:52:39', 1, 1),
(1025, '20220819090xcbxj', 'hamisusulaimanimam2022@gmail.com', 865, 2273, 'Refund', '2022-08-19 08:37:00', 1, 1),
(1026, '20220819090cvgzi', 'hamisusulaimanimam2022@gmail.com', 865, 2273, 'Refund', '2022-08-19 08:40:21', 1, 1),
(1027, '20220819090dyjaa', 'hamisusulaimanimam2022@gmail.com', 980, 1293, 'debit', '2022-08-19 08:43:21', 1, 0),
(1028, '20220819090koich', 'hamisusulaimanimam2022@gmail.com', 1232, 61, 'cashOut', '2022-08-19 08:56:36', 1, 0),
(1029, '20220819110sqblp', 'azzeetech.it@gmail.com', 2212, 230573, 'transfered', '2022-08-19 10:30:18', 1, 1),
(1030, '20220819110sqblp', 'hamisusulaimanimam2022@gmail.com', 2212, 61, 'recieved', '2022-08-19 10:30:18', 1, 0),
(1031, '20220819170mukfi', 'hamisusulaimanimam2022@gmail.com', 125, 2273, 'Refund', '2022-08-19 16:41:25', 1, 1),
(1032, '20220819170bkwtd', 'hamisusulaimanimam2022@gmail.com', 197, 2076, 'debit', '2022-08-19 16:42:08', 1, 0),
(1033, '20220819200vqbwz', 'hamisusulaimanimam2022@gmail.com', 98, 1978, 'debit', '2022-08-19 19:25:12', 1, 0),
(1034, '20220820170epqre', 'hamisusulaimanimam2022@gmail.com', 115, 1978, 'Refund', '2022-08-20 16:56:54', 1, 1),
(1035, '20220820170aaobr', 'hamisusulaimanimam2022@gmail.com', 125, 1978, 'Refund', '2022-08-20 16:57:59', 1, 1),
(1036, '20220821130uaiua', 'hamisusulaimanimam2022@gmail.com', 125, 1978, 'Refund', '2022-08-21 12:39:20', 1, 1),
(1037, '20220822070kwlca', 'kakyansoro87@gmail.com', 196, 691, 'debit', '2022-08-22 06:32:54', 1, 0),
(1038, '20220822070symcn', 'kakyansoro87@gmail.com', 500, 691, 'Refund', '2022-08-22 06:34:56', 1, 1),
(1039, '20220822070kqvlm', 'kakyansoro87@gmail.com', 196, 495, 'debit', '2022-08-22 06:36:28', 1, 0),
(1040, '20220822230lpbbj', 'hamisusulaimanimam2022@gmail.com', 115, 1978, 'Refund', '2022-08-22 22:31:21', 1, 1),
(1041, '20220823080wgxfo', 'sanizakariumar@gmail.com', 700, 373, 'credit', '2022-08-23 07:05:29', 1, 0),
(1042, '20220823080glaax', 'sanizakariumar@gmail.com', 800, 373, 'credit', '2022-08-23 07:06:49', 1, 0),
(1043, '20220823080olozq', 'sanizakariumar@gmail.com', 250, 373, 'Refund', '2022-08-23 07:10:36', 1, 1),
(1044, '20220823090phdsc', 'sanizakariumar@gmail.com', 250, 373, 'Refund', '2022-08-23 08:54:17', 1, 1),
(1045, '20220823110xbtcl', 'kakyansoro87@gmail.com', 250, 495, 'Refund', '2022-08-23 10:06:22', 1, 1),
(1046, '20220823140krvqe', 'sanizakariumar@gmail.com', 250, 373, 'Refund', '2022-08-23 13:27:03', 1, 1),
(1047, '20220823190abrjp', 'azzeetech.it@gmail.com', 125, 230573, 'Refund', '2022-08-23 18:00:39', 1, 1),
(1048, '20220823190ybbzw', 'azzeetech.it@gmail.com', 125, 230448, 'debit', '2022-08-23 18:03:48', 1, 1),
(1049, '20220823190ldkba', 'azzeetech.it@gmail.com', 500, 229948, 'transfered', '2022-08-23 18:06:36', 1, 1),
(1050, '20220823190ldkba', 'abdulkarimahmad303@gmail.com', 500, 35, 'recieved', '2022-08-23 18:06:36', 1, 0),
(1051, '20220823210ezprp', 'abdulkarimahmad303@gmail.com', 125, 410, 'debit', '2022-08-23 20:20:08', 1, 1),
(1052, '20220823210bphfh', 'abdulkarimahmad303@gmail.com', 115, 295, 'debit', '2022-08-23 20:22:26', 1, 1),
(1053, '20220823220ubuhx', 'azzeetech.it@gmail.com', 1500, 228448, 'transfered', '2022-08-23 21:39:05', 1, 1),
(1054, '20220823220ubuhx', 'kaidanaka@gmail.com', 1500, 133, 'recieved', '2022-08-23 21:39:05', 1, 0),
(1055, '20220823230upimr', 'kaidanaka@gmail.com', 1542, 1633, 'Refund', '2022-08-23 22:45:25', 1, 1),
(1056, '20220823230mgodh', 'kaidanaka@gmail.com', 1492, 1633, 'Refund', '2022-08-23 22:47:42', 1, 1),
(1057, '20220823230wbkwj', 'azzeetech.it@gmail.com', 1442, 227006, 'debit', '2022-08-23 22:53:04', 1, 1),
(1058, '20220824090jltnk', 'azzeetech.it@gmail.com', 7000, 220006, 'transfered', '2022-08-24 08:09:34', 1, 1),
(1059, '20220824090jltnk', 'kakyansoro87@gmail.com', 7000, 495, 'recieved', '2022-08-24 08:09:34', 1, 0),
(1060, '20220824090mcyba', 'azzeetech.it@gmail.com', 547, 220006, 'Refund', '2022-08-24 08:13:27', 1, 1),
(1061, '20220824090ferac', 'azzeetech.it@gmail.com', 547, 219459, 'debit', '2022-08-24 08:17:07', 1, 1),
(1062, '20220824090kglgf', 'kakyansoro87@gmail.com', 750, 6745, 'debit', '2022-08-24 08:26:59', 1, 1),
(1063, '20220824120jkynz', 'azzeetech.it@gmail.com', 125, 219334, 'debit', '2022-08-24 11:12:50', 1, 1),
(1064, '20220824120xkkix', 'abdulkarimahmad303@gmail.com', 250, 45, 'debit', '2022-08-24 11:13:15', 1, 1),
(1065, '20220825020kdxiz', 'azzeetech.it@gmail.com', 115, 219219, 'debit', '2022-08-25 01:14:18', 1, 1),
(1066, '20220826210uynhg', 'azzeetech.it@gmail.com', 125, 219094, 'debit', '2022-08-26 20:44:58', 1, 1),
(1067, '20220830230jvcvz', 'azzeetech.it@gmail.com', 5000, 214094, 'transfered', '2022-08-30 22:14:19', 1, 1),
(1068, '20220830230jvcvz', 'sabiuumarmuhammad580@gmail.com', 5000, 0, 'recieved', '2022-08-30 22:14:19', 1, 0),
(1069, '20220830230repkz', 'sabiuumarmuhammad580@gmail.com', 125, 5000, 'Refund', '2022-08-30 22:17:32', 1, 1),
(1070, '20220830230txxzm', 'sabiuumarmuhammad580@gmail.com', 230, 4770, 'debit', '2022-08-30 22:21:32', 1, 1),
(1071, '20220830230fbkki', 'sabiuumarmuhammad580@gmail.com', 49, 4721, 'debit', '2022-08-30 22:26:24', 1, 1),
(1072, '20220830230juetr', 'sabiuumarmuhammad580@gmail.com', 115, 4606, 'debit', '2022-08-30 22:34:57', 1, 1),
(1073, '20220831080gkequ', 'azzeetech.it@gmail.com', 547, 213547, 'debit', '2022-08-31 07:30:54', 1, 1),
(1074, '20220831090cjxvg', 'azzeetech.it@gmail.com', 125, 213547, 'Refund', '2022-08-31 08:59:58', 1, 1),
(1075, '20220831100klyih', 'azzeetech.it@gmail.com', 250, 213547, 'Refund', '2022-08-31 09:05:43', 1, 1),
(1076, '20220831100zzcqd', 'azzeetech.it@gmail.com', 230, 213317, 'debit', '2022-08-31 09:07:06', 1, 1),
(1077, '20220831110zgzrv', 'kakyansoro87@gmail.com', 196, 6549, 'debit', '2022-08-31 10:25:31', 1, 1),
(1078, '20220831110injph', 'kakyansoro87@gmail.com', 750, 5799, 'debit', '2022-08-31 10:30:46', 1, 1),
(1079, '20220831110jpgpy', 'sabiuumarmuhammad580@gmail.com', 98, 4508, 'debit', '2022-08-31 10:33:59', 1, 1),
(1080, '20220831190khqup', 'sabiuumarmuhammad580@gmail.com', 98, 4410, 'debit', '2022-08-31 18:25:33', 1, 1),
(1081, '20220831190enebw', 'sabiuumarmuhammad580@gmail.com', 98, 4312, 'debit', '2022-08-31 18:26:37', 1, 1),
(1082, '20220831200evyxn', 'sabiuumarmuhammad580@gmail.com', 197, 4115, 'debit', '2022-08-31 19:07:33', 1, 1),
(1083, '20220831200hqmpy', 'sabiuumarmuhammad580@gmail.com', 197, 3918, 'debit', '2022-08-31 19:22:37', 1, 1),
(1084, '20220831200cfuua', 'sabiuumarmuhammad580@gmail.com', 98, 3820, 'debit', '2022-08-31 19:23:47', 1, 1),
(1085, '20220831200tiiak', 'sabiuumarmuhammad580@gmail.com', 98, 3722, 'debit', '2022-08-31 19:36:38', 1, 1),
(1086, '20220831200bvfqa', 'sabiuumarmuhammad580@gmail.com', 98, 3624, 'debit', '2022-08-31 19:42:32', 1, 1),
(1087, '20220831210mebio', 'sabiuumarmuhammad580@gmail.com', 98, 3526, 'debit', '2022-08-31 20:04:42', 1, 1),
(1088, '20220831210rvkri', 'sabiuumarmuhammad580@gmail.com', 197, 3329, 'debit', '2022-08-31 20:09:27', 1, 1),
(1089, '20220831210vbxvi', 'sabiuumarmuhammad580@gmail.com', 985, 3329, 'Refund', '2022-08-31 20:15:43', 1, 1),
(1090, '20220831210aryhs', 'sabiuumarmuhammad580@gmail.com', 196, 3133, 'debit', '2022-08-31 20:17:24', 1, 1),
(1091, '20220831210xgrmo', 'sabiuumarmuhammad580@gmail.com', 197, 3133, 'Refund', '2022-08-31 20:26:35', 1, 1),
(1092, '20220831210dsnpm', 'sabiuumarmuhammad580@gmail.com', 197, 3133, 'Refund', '2022-08-31 20:29:24', 1, 1),
(1093, '20220831210viecd', 'sabiuumarmuhammad580@gmail.com', 197, 3133, 'Refund', '2022-08-31 20:34:08', 1, 1),
(1094, '20220831210olqje', 'sabiuumarmuhammad580@gmail.com', 985, 3133, 'Refund', '2022-08-31 20:35:25', 1, 1),
(1095, '20220831210voipm', 'sabiuumarmuhammad580@gmail.com', 985, 3133, 'Refund', '2022-08-31 20:50:09', 1, 1),
(1096, '20220831210xdsgt', 'azzeetech.it@gmail.com', 125, 213317, 'Refund', '2022-08-31 20:51:30', 1, 1),
(1097, '20220831210nkwyq', 'azzeetech.it@gmail.com', 230, 213087, 'debit', '2022-08-31 20:58:58', 1, 1),
(1098, '20220831220yifzp', 'sabiuumarmuhammad580@gmail.com', 197, 3133, 'Refund', '2022-08-31 21:05:54', 1, 1),
(1099, '20220831220awlaa', 'sabiuumarmuhammad580@gmail.com', 985, 3133, 'Refund', '2022-08-31 21:10:15', 1, 1),
(1100, '20220831220xiugg', 'sabiuumarmuhammad580@gmail.com', 985, 3133, 'Refund', '2022-08-31 21:40:22', 1, 1),
(1101, '20220831230ooetp', 'sabiuumarmuhammad580@gmail.com', 125, 3133, 'Refund', '2022-08-31 22:42:18', 1, 1),
(1102, '20220831230rmfls', 'sabiuumarmuhammad580@gmail.com', 98, 3035, 'debit', '2022-08-31 22:43:51', 1, 1),
(1103, '20220831230haasc', 'sabiuumarmuhammad580@gmail.com', 250, 3035, 'Refund', '2022-08-31 22:45:17', 1, 1),
(1104, '20220831230lkwac', 'sabiuumarmuhammad580@gmail.com', 985, 3035, 'Refund', '2022-08-31 22:46:32', 1, 1),
(1105, '20220831230jlmsj', 'sabiuumarmuhammad580@gmail.com', 125, 3035, 'Refund', '2022-08-31 22:57:37', 1, 1),
(1106, '20220901000tpkpg', 'sabiuumarmuhammad580@gmail.com', 985, 3035, 'Refund', '2022-08-31 23:06:26', 1, 1),
(1107, '20220901050cksfm', 'sabiuumarmuhammad580@gmail.com', 985, 2050, 'debit', '2022-09-01 04:42:20', 1, 1),
(1108, '20220901050ixtpe', 'sabiuumarmuhammad580@gmail.com', 125, 2050, 'Refund', '2022-09-01 04:43:55', 1, 1),
(1109, '20220901050kaekc', 'sabiuumarmuhammad580@gmail.com', 250, 2050, 'Refund', '2022-09-01 04:44:40', 1, 1),
(1110, '20220901090myzim', 'sabiuumarmuhammad580@gmail.com', 197, 1853, 'debit', '2022-09-01 08:01:16', 1, 1),
(1111, '20220901090qwira', 'sabiuumarmuhammad580@gmail.com', 98, 1755, 'debit', '2022-09-01 08:08:31', 1, 1),
(1112, '20220901110kvzyf', 'sabiuumarmuhammad580@gmail.com', 295, 1460, 'debit', '2022-09-01 10:23:13', 1, 1),
(1113, '20220901110ortcf', 'sabiuumarmuhammad580@gmail.com', 197, 1263, 'debit', '2022-09-01 10:24:33', 1, 1),
(1114, '20220901110bcrdt', 'sabiuumarmuhammad580@gmail.com', 196, 1067, 'debit', '2022-09-01 10:25:28', 1, 1),
(1115, '20220901130cwkkf', 'sabiuumarmuhammad580@gmail.com', 492, 575, 'debit', '2022-09-01 12:34:11', 1, 1),
(1116, '20220901140imfse', 'sabiuumarmuhammad580@gmail.com', 98, 575, 'Refund', '2022-09-01 13:45:21', 1, 1),
(1117, '20220901140kbpez', 'sabiuumarmuhammad580@gmail.com', 98, 575, 'Refund', '2022-09-01 13:46:45', 1, 1),
(1118, '20220901150eskhm', 'sabiuumarmuhammad580@gmail.com', 98, 575, 'Refund', '2022-09-01 14:14:29', 1, 1),
(1119, '20220901160ltksc', 'sabiuumarmuhammad580@gmail.com', 492, 575, 'Refund', '2022-09-01 15:29:51', 1, 1),
(1120, '20220901160hetkr', 'sabiuumarmuhammad580@gmail.com', 492, 575, 'Refund', '2022-09-01 15:35:18', 1, 1),
(1121, '20220901160eufxm', 'azzeetech.it@gmail.com', 125, 212962, 'debit', '2022-09-01 15:53:35', 1, 1),
(1122, '20220901160wbezh', 'sabiuumarmuhammad580@gmail.com', 492, 575, 'Refund', '2022-09-01 15:58:52', 1, 1),
(1123, '20220901170qgklx', 'sabiuumarmuhammad580@gmail.com', 196, 575, 'Refund', '2022-09-01 16:01:17', 1, 1),
(1124, '20220901170uaiwl', 'sabiuumarmuhammad580@gmail.com', 250, 325, 'debit', '2022-09-01 16:04:41', 1, 1),
(1125, '20220901170sxtnw', 'sabiuumarmuhammad580@gmail.com', 147, 325, 'Refund', '2022-09-01 16:05:57', 1, 1),
(1126, '20220901170upojy', 'sabiuumarmuhammad580@gmail.com', 147, 325, 'Refund', '2022-09-01 16:35:23', 1, 1),
(1127, '20220901170iyniu', 'sabiuumarmuhammad580@gmail.com', 147, 325, 'Refund', '2022-09-01 16:52:21', 1, 1),
(1128, '20220901190wkvdc', 'sabiuumarmuhammad580@gmail.com', 147, 325, 'Refund', '2022-09-01 18:08:08', 1, 1),
(1129, '20220901190blwxm', 'sabiuumarmuhammad580@gmail.com', 147, 325, 'Refund', '2022-09-01 18:18:53', 1, 1),
(1130, '20220901190iecpd', 'sabiuumarmuhammad580@gmail.com', 147, 178, 'debit', '2022-09-01 18:37:02', 1, 1),
(1131, '20220901200bxeid', 'sabiuumarmuhammad580@gmail.com', 98, 80, 'debit', '2022-09-01 19:38:59', 1, 1),
(1132, '20220901200rqlsq', 'azzeetech.it@gmail.com', 6000, 206962, 'transfered', '2022-09-01 19:49:10', 1, 1),
(1133, '20220901200rqlsq', 'sabiuumarmuhammad580@gmail.com', 6000, 80, 'recieved', '2022-09-01 19:49:10', 1, 0),
(1134, '20220901200nigrf', 'sabiuumarmuhammad580@gmail.com', 196, 5884, 'debit', '2022-09-01 19:53:07', 1, 1),
(1135, '20220901210jjnuu', 'sabiuumarmuhammad580@gmail.com', 500, 5884, 'Refund', '2022-09-01 20:30:02', 1, 1),
(1136, '20220901210vzitq', 'sabiuumarmuhammad580@gmail.com', 500, 5884, 'Refund', '2022-09-01 20:31:30', 1, 1),
(1137, '20220901210thdyj', 'sabiuumarmuhammad580@gmail.com', 500, 5884, 'Refund', '2022-09-01 20:39:00', 1, 1),
(1138, '20220901210hlojd', 'azzeetech.it@gmail.com', 125, 206962, 'Refund', '2022-09-01 20:45:29', 1, 1),
(1139, '20220901210gnwcw', 'azzeetech.it@gmail.com', 115, 206847, 'debit', '2022-09-01 20:47:03', 1, 1),
(1140, '20220901220rcrsv', 'sabiuumarmuhammad580@gmail.com', 125, 5759, 'debit', '2022-09-01 21:58:43', 1, 1),
(1141, '20220901230eiysq', 'sabiuumarmuhammad580@gmail.com', 98, 5661, 'debit', '2022-09-01 22:11:24', 1, 1),
(1142, '20220901230nqwud', 'azzeetech.it@gmail.com', 2039, 204808, 'debit', '2022-09-01 22:40:25', 1, 1),
(1143, '20220902110rxnrd', 'sabiuumarmuhammad580@gmail.com', 250, 5411, 'debit', '2022-09-02 10:23:00', 1, 1),
(1144, '20220902140ivcxq', 'sabiuumarmuhammad580@gmail.com', 230, 5181, 'debit', '2022-09-02 13:19:46', 1, 0),
(1145, '20220902170eibim', 'sabiuumarmuhammad580@gmail.com', 115, 5066, 'debit', '2022-09-02 16:45:13', 1, 1),
(1146, '20220902180icmix', 'sabiuumarmuhammad580@gmail.com', 294, 4772, 'debit', '2022-09-02 17:02:57', 1, 1),
(1147, '20220902180fnxcv', 'sabiuumarmuhammad580@gmail.com', 1200, 3572, 'debit', '2022-09-02 17:06:11', 1, 1),
(1148, '20220902180pkzib', 'sabiuumarmuhammad580@gmail.com', 1175, 2397, 'debit', '2022-09-02 17:33:24', 1, 0),
(1149, '20220902190mdfwj', 'sabiuumarmuhammad580@gmail.com', 196, 2201, 'debit', '2022-09-02 18:28:01', 1, 1),
(1150, '20220902200cdrsc', 'sabiuumarmuhammad580@gmail.com', 1175, 2201, 'Refund', '2022-09-02 19:53:53', 1, 1),
(1151, '20220902220ooijq', 'sabiuumarmuhammad580@gmail.com', 97, 2201, 'Refund', '2022-09-02 21:49:37', 1, 1),
(1152, '20220902230jjnlx', 'sabiuumarmuhammad580@gmail.com', 97, 2201, 'Refund', '2022-09-02 22:21:39', 1, 1),
(1153, '20220902230lenaw', 'sabiuumarmuhammad580@gmail.com', 97, 2201, 'Refund', '2022-09-02 22:33:20', 1, 1),
(1154, '20220903000pcyem', 'sabiuumarmuhammad580@gmail.com', 97, 2201, 'Refund', '2022-09-02 23:13:13', 1, 1),
(1155, '20220903000udqpa', 'sabiuumarmuhammad580@gmail.com', 97, 2201, 'Refund', '2022-09-02 23:17:28', 1, 1),
(1156, '20220903000illmj', 'sabiuumarmuhammad580@gmail.com', 97, 2201, 'Refund', '2022-09-02 23:53:51', 1, 1),
(1157, '20220903070jymgm', 'sabiuumarmuhammad580@gmail.com', 97, 697, 'Refund', '2022-09-03 06:51:17', 1, 1),
(1158, '20220903080zpnue', 'sabiuumarmuhammad580@gmail.com', 97, 697, 'Refund', '2022-09-03 07:31:00', 1, 1),
(1159, '20220903090dzubf', 'sabiuumarmuhammad580@gmail.com', 97, 697, 'Refund', '2022-09-03 08:03:53', 1, 1),
(1160, '20220903170qcebc', 'sabiuumarmuhammad580@gmail.com', 97, 697, 'Refund', '2022-09-03 16:37:46', 1, 1),
(1161, '20220904190nrusv', 'sabiuumarmuhammad580@gmail.com', 250, 697, 'Refund', '2022-09-04 18:21:12', 1, 1),
(1162, '20220904200clgrr', 'sabiuumarmuhammad580@gmail.com', 98, 697, 'Refund', '2022-09-04 19:19:28', 1, 1),
(1163, '20220904200iedre', 'sabiuumarmuhammad580@gmail.com', 250, 697, 'Refund', '2022-09-04 19:50:48', 1, 1),
(1164, '20220904210medlv', 'sabiuumarmuhammad580@gmail.com', 250, 697, 'Refund', '2022-09-04 20:06:31', 1, 1),
(1165, '20220904210tdmvq', 'sabiuumarmuhammad580@gmail.com', 97, 697, 'Refund', '2022-09-04 20:08:50', 1, 1),
(1166, '20220904210uzuci', 'azzeetech.it@gmail.com', 2397, 202411, 'transfered', '2022-09-04 20:15:07', 1, 1),
(1167, '20220904210uzuci', 'sabiuumarmuhammad580@gmail.com', 2397, 697, 'recieved', '2022-09-04 20:15:07', 1, 0),
(1168, '20220904210viztr', 'sabiuumarmuhammad580@gmail.com', 250, 2844, 'debit', '2022-09-04 20:41:10', 1, 1),
(1169, '20220904210tawla', 'sabiuumarmuhammad580@gmail.com', 250, 2594, 'debit', '2022-09-04 20:54:48', 1, 1),
(1170, '20220904220omkpj', 'sabiuumarmuhammad580@gmail.com', 250, 2344, 'debit', '2022-09-04 21:10:45', 1, 1),
(1171, '20220905110jqgdv', 'sabiuumarmuhammad580@gmail.com', 196, 2344, 'Refund', '2022-09-05 10:28:31', 1, 1),
(1172, '20220905130kncru', 'sabiuumarmuhammad580@gmail.com', 689, 2344, 'Refund', '2022-09-05 12:28:21', 1, 1),
(1173, '20220905160umgeb', 'sabiuumarmuhammad580@gmail.com', 98, 2246, 'debit', '2022-09-05 15:58:07', 1, 1),
(1174, '20220905180ikgan', 'sabiuumarmuhammad580@gmail.com', 98, 2148, 'debit', '2022-09-05 17:45:02', 1, 1),
(1175, '20220905180hpwlf', 'sabiuumarmuhammad580@gmail.com', 197, 1951, 'debit', '2022-09-05 17:46:01', 1, 1),
(1176, '20220905190zjvgt', 'sabiuumarmuhammad580@gmail.com', 196, 1755, 'debit', '2022-09-05 18:00:16', 1, 1),
(1177, '20220905190sjyum', 'sabiuumarmuhammad580@gmail.com', 98, 1657, 'debit', '2022-09-05 18:01:15', 1, 1),
(1178, '20220905190kwira', 'sabiuumarmuhammad580@gmail.com', 196, 1461, 'debit', '2022-09-05 18:02:00', 1, 1),
(1179, '20220905190snblu', 'sabiuumarmuhammad580@gmail.com', 98, 1363, 'debit', '2022-09-05 18:05:45', 1, 1),
(1180, '20220905190ktylr', 'sabiuumarmuhammad580@gmail.com', 197, 1166, 'debit', '2022-09-05 18:08:22', 1, 1),
(1181, '20220905190xarrq', 'sabiuumarmuhammad580@gmail.com', 98, 1068, 'debit', '2022-09-05 18:17:13', 1, 1),
(1182, '20220905210apchs', 'sabiuumarmuhammad580@gmail.com', 98, 970, 'debit', '2022-09-05 20:38:43', 1, 1),
(1183, '20220906100hxbym', 'sabiuumarmuhammad580@gmail.com', 250, 720, 'debit', '2022-09-06 09:00:25', 1, 1),
(1184, '20220906100nzwfv', 'sabiuumarmuhammad580@gmail.com', 250, 470, 'debit', '2022-09-06 09:20:35', 1, 1),
(1185, '20220906100sycww', 'sabiuumarmuhammad580@gmail.com', 250, 220, 'debit', '2022-09-06 09:22:14', 1, 1),
(1186, '20220906180gnqll', 'sabiuumarmuhammad580@gmail.com', 125, 95, 'debit', '2022-09-06 17:22:02', 1, 1),
(1187, '20220906210uumft', 'azzeetech.it@gmail.com', 2000, 200411, 'transfered', '2022-09-06 20:12:46', 1, 1),
(1188, '20220906210uumft', 'sabiuumarmuhammad580@gmail.com', 2000, 95, 'recieved', '2022-09-06 20:12:46', 1, 0),
(1189, '20220906210mvday', 'azzeetech.it@gmail.com', 125, 200286, 'debit', '2022-09-06 20:13:43', 1, 1),
(1190, '20220906220wjdjs', 'sabiuumarmuhammad580@gmail.com', 98, 1997, 'debit', '2022-09-06 21:02:37', 1, 1),
(1191, '20220906220yxafm', 'sabiuumarmuhammad580@gmail.com', 98, 1899, 'debit', '2022-09-06 21:32:06', 1, 1),
(1192, '20220907090pqaxv', 'kakyansoro87@gmail.com', 750, 5049, 'debit', '2022-09-07 08:37:05', 1, 1),
(1193, '20220907090lqdex', 'kakyansoro87@gmail.com', 196, 4853, 'debit', '2022-09-07 08:38:00', 1, 1),
(1194, '20220907090xylxa', 'kakyansoro87@gmail.com', 196, 4657, 'debit', '2022-09-07 08:38:47', 1, 1),
(1195, '20220907120legdh', 'sabiuumarmuhammad580@gmail.com', 250, 1649, 'debit', '2022-09-07 11:22:49', 1, 1),
(1196, '20220907120houru', 'sabiuumarmuhammad580@gmail.com', 250, 1399, 'debit', '2022-09-07 11:28:25', 1, 1),
(1197, '20220907120wgabb', 'sabiuumarmuhammad580@gmail.com', 492, 1399, 'Refund', '2022-09-07 11:39:37', 1, 1),
(1198, '20220907120auhoe', 'sabiuumarmuhammad580@gmail.com', 492, 1399, 'Refund', '2022-09-07 11:40:43', 1, 1),
(1199, '20220907130pitkw', 'sabiuumarmuhammad580@gmail.com', 98, 1301, 'debit', '2022-09-07 12:13:32', 1, 1),
(1200, '20220907140pbyla', 'sabiuumarmuhammad580@gmail.com', 196, 1301, 'Refund', '2022-09-07 13:18:59', 1, 1),
(1201, '20220907170ogbuf', 'sabiuumarmuhammad580@gmail.com', 98, 1203, 'debit', '2022-09-07 16:09:12', 1, 1),
(1202, '20220907190epfkb', 'sabiuumarmuhammad580@gmail.com', 98, 1105, 'debit', '2022-09-07 18:06:31', 1, 1),
(1203, '20220907190ixdvt', 'sabiuumarmuhammad580@gmail.com', 492, 1105, 'Refund', '2022-09-07 18:41:10', 1, 1),
(1204, '20220907190ulnkd', 'sabiuumarmuhammad580@gmail.com', 492, 1105, 'Refund', '2022-09-07 18:41:37', 1, 1),
(1205, '20220907200hupre', 'sabiuumarmuhammad580@gmail.com', 490, 1105, 'Refund', '2022-09-07 19:30:29', 1, 1),
(1206, '20220907200kvdih', 'sabiuumarmuhammad580@gmail.com', 490, 1105, 'Refund', '2022-09-07 19:30:56', 1, 1),
(1207, '20220907210aorah', 'sabiuumarmuhammad580@gmail.com', 197, 908, 'debit', '2022-09-07 20:13:13', 1, 1),
(1208, '20220907210rvbub', 'sabiuumarmuhammad580@gmail.com', 500, 908, 'Refund', '2022-09-07 20:33:09', 1, 1),
(1209, '20220907210prlsq', 'sabiuumarmuhammad580@gmail.com', 500, 908, 'Refund', '2022-09-07 20:35:09', 1, 1),
(1210, '20220907210jinuo', 'sabiuumarmuhammad580@gmail.com', 500, 908, 'Refund', '2022-09-07 20:50:17', 1, 1),
(1211, '20220907220gqmjx', 'sabiuumarmuhammad580@gmail.com', 250, 908, 'Refund', '2022-09-07 21:06:02', 1, 1),
(1212, '20220907220stshb', 'sabiuumarmuhammad580@gmail.com', 500, 908, 'Refund', '2022-09-07 21:19:38', 1, 1),
(1213, '20220907220eppnk', 'sabiuumarmuhammad580@gmail.com', 500, 908, 'Refund', '2022-09-07 21:42:33', 1, 1),
(1214, '20220907220eyrux', 'sabiuumarmuhammad580@gmail.com', 500, 908, 'Refund', '2022-09-07 21:43:38', 1, 1),
(1215, '20220907220wvkkc', 'sabiuumarmuhammad580@gmail.com', 98, 810, 'debit', '2022-09-07 21:48:16', 1, 1),
(1216, '20220907220qbqwe', 'sabiuumarmuhammad580@gmail.com', 500, 810, 'Refund', '2022-09-07 21:49:45', 1, 1),
(1217, '20220907230pcdql', 'sabiuumarmuhammad580@gmail.com', 500, 810, 'Refund', '2022-09-07 22:18:28', 1, 1),
(1218, '20220908000pjafy', 'sabiuumarmuhammad580@gmail.com', 500, 310, 'debit', '2022-09-07 23:17:39', 1, 1),
(1219, '20220908000qcgih', 'sabiuumarmuhammad580@gmail.com', 250, 310, 'Refund', '2022-09-07 23:23:22', 1, 1),
(1220, '20220908000jfaex', 'sabiuumarmuhammad580@gmail.com', 250, 310, 'Refund', '2022-09-07 23:25:48', 1, 1),
(1221, '20220908000pjtrl', 'sabiuumarmuhammad580@gmail.com', 250, 60, 'debit', '2022-09-07 23:28:06', 1, 1),
(1222, '20220910130ghmeh', 'azzeetech.it@gmail.com', 1000, 199286, 'transfered', '2022-09-10 12:40:16', 1, 1),
(1223, '20220910130ghmeh', 'jamilusha77@gmail.com', 1000, 0, 'recieved', '2022-09-10 12:40:16', 1, 0),
(1224, '20220910130vfokt', 'jamilusha77@gmail.com', 750, 250, 'debit', '2022-09-10 12:42:37', 1, 1),
(1225, '20220910130iidgu', 'jamilusha77@gmail.com', 2000, 250, 'credit', '2022-09-10 12:44:21', 1, 0),
(1226, '20220910140jpbue', 'jamilusha77@gmail.com', 125, 125, 'debit', '2022-09-10 13:02:12', 1, 1),
(1227, '20220910150wqzsk', 'jamilusha77@gmail.com', 2000, 125, 'credit', '2022-09-10 14:15:04', 1, 0),
(1228, '20220910150rwkfr', 'jamilusha77@gmail.com', 200, 125, 'credit', '2022-09-10 14:16:24', 1, 0),
(1229, '20220910150trsxr', 'jamilusha77@gmail.com', 200, 125, 'credit', '2022-09-10 14:25:06', 1, 0),
(1230, '20220910180wghly', 'kakyansoro87@gmail.com', 196, 4461, 'debit', '2022-09-10 17:25:07', 1, 1),
(1231, '20220910200gguxs', 'azzeetech.it@gmail.com', 98, 199188, 'debit', '2022-09-10 19:54:22', 1, 1),
(1232, '20220910210fgyaj', 'azzeetech.it@gmail.com', 300, 198888, 'transfered', '2022-09-10 20:09:37', 1, 1),
(1233, '20220910210fgyaj', 'ahmadusulengelzarma@gmail.com', 300, 0, 'recieved', '2022-09-10 20:09:37', 1, 0),
(1234, '20220910210ujhke', 'ahmadusulengelzarma@gmail.com', 250, 50, 'debit', '2022-09-10 20:11:50', 1, 1),
(1235, '20220910210cswyx', 'ahmadusulengelzarma@gmail.com', 49, 1, 'debit', '2022-09-10 20:12:42', 1, 1),
(1236, '20220910210ppyqp', 'azzeetech.it@gmail.com', 250, 198638, 'debit', '2022-09-10 20:22:39', 1, 1),
(1237, '20220911130reemq', 'azzeetech.it@gmail.com', 197, 198441, 'debit', '2022-09-11 12:15:21', 1, 1),
(1238, '20220911130kvuzy', 'azzeetech.it@gmail.com', 98, 198441, 'Refund', '2022-09-11 12:19:12', 1, 1),
(1239, '20220911130oaraj', 'azzeetech.it@gmail.com', 125, 198316, 'debit', '2022-09-11 12:42:25', 1, 1),
(1240, '20220913220wgidx', 'azzeetech.it@gmail.com', 68, 198248, 'debit', '2022-09-13 21:57:51', 1, 1),
(1241, '20220915120osgir', 'kakyansoro87@gmail.com', 196, 4461, 'Refund', '2022-09-15 11:30:48', 1, 1),
(1242, '20220915120rovxt', 'kakyansoro87@gmail.com', 196, 4461, 'Refund', '2022-09-15 11:31:30', 1, 1),
(1243, '20220917110xcdpa', 'princeishaq53@gmail.com', 200, 0, 'credit', '2022-09-17 10:40:21', 1, 0),
(1244, '20220917110dnnca', 'princeishaq53@gmail.com', 200, 0, 'credit', '2022-09-17 10:57:09', 1, 0),
(1245, '20220917120wjlsz', 'azzeetech.it@gmail.com', 200, 198048, 'transfered', '2022-09-17 11:28:47', 1, 1),
(1246, '20220917120wjlsz', 'princeishaq53@gmail.com', 200, 0, 'recieved', '2022-09-17 11:28:47', 1, 0),
(1247, '20220917120hgjfm', 'princeishaq53@gmail.com', 125, 75, 'debit', '2022-09-17 11:31:19', 1, 1),
(1248, '20220917190tgvse', 'azzeetech.it@gmail.com', 250, 197798, 'debit', '2022-09-17 18:38:33', 1, 1),
(1249, '20220918150sdlte', 'princeishaq53@gmail.com', 200, 275, 'credit', '2022-09-18 14:06:10', 1, 1),
(1250, '20220918150wamml', 'princeishaq53@gmail.com', 125, 275, 'Refund', '2022-09-18 14:35:16', 1, 1),
(1251, '20220918150fxdqm', 'princeishaq53@gmail.com', 125, 150, 'debit', '2022-09-18 14:41:35', 1, 1),
(1252, '20220919130cjibp', 'kakyansoro87@gmail.com', 196, 4461, 'Refund', '2022-09-19 12:50:14', 1, 1),
(1253, '20220920070xakan', 'azzeetech.it@gmail.com', 125, 197673, 'debit', '2022-09-20 06:53:10', 1, 1),
(1254, '20220922100ofjvr', 'azzeetech.it@gmail.com', 2000, 195673, 'transfered', '2022-09-22 09:53:38', 1, 1),
(1255, '20220922100ofjvr', 'sabiuumarmuhammad580@gmail.com', 2000, 60, 'recieved', '2022-09-22 09:53:38', 1, 0),
(1256, '20220922220vxsug', 'sabiuumarmuhammad580@gmail.com', 250, 2060, 'Refund', '2022-09-22 21:10:00', 1, 1),
(1257, '20220922220zsbtw', 'sabiuumarmuhammad580@gmail.com', 250, 2060, 'Refund', '2022-09-22 21:11:04', 1, 1),
(1258, '20220922220odghc', 'sabiuumarmuhammad580@gmail.com', 295, 2060, 'Refund', '2022-09-22 21:14:16', 1, 1),
(1259, '20220922220qydta', 'sabiuumarmuhammad580@gmail.com', 295, 2060, 'Refund', '2022-09-22 21:19:47', 1, 1),
(1260, '20220922220wmzic', 'sabiuumarmuhammad580@gmail.com', 295, 2060, 'Refund', '2022-09-22 21:31:49', 1, 1),
(1261, '20220922230cbuia', 'sabiuumarmuhammad580@gmail.com', 295, 2060, 'Refund', '2022-09-22 22:08:26', 1, 1),
(1262, '20220922230zjogq', 'sabiuumarmuhammad580@gmail.com', 295, 2060, 'Refund', '2022-09-22 22:17:12', 1, 1),
(1263, '20220923110tfslq', 'azzeetech.it@gmail.com', 125, 195548, 'debit', '2022-09-23 10:29:47', 1, 1),
(1264, '20220923140pnvls', 'azzeetech.it@gmail.com', 500, 195048, 'debit', '2022-09-23 13:51:46', 1, 1),
(1265, '20220923150myftx', 'sabiuumarmuhammad580@gmail.com', 98, 2060, 'Refund', '2022-09-23 14:29:34', 1, 1),
(1266, '20220923190eighw', 'azzeetech.it@gmail.com', 125, 194923, 'debit', '2022-09-23 18:08:21', 1, 1),
(1267, '20220923220dprad', 'sabiuumarmuhammad580@gmail.com', 98, 2060, 'Refund', '2022-09-23 21:02:13', 1, 1),
(1268, '20220923220xhhqx', 'sabiuumarmuhammad580@gmail.com', 1200, 860, 'debit', '2022-09-23 21:57:57', 1, 1),
(1269, '20220923230lyeoy', 'sabiuumarmuhammad580@gmail.com', 250, 860, 'Refund', '2022-09-23 22:00:56', 1, 1),
(1270, '20220924000dczxj', 'sabiuumarmuhammad580@gmail.com', 250, 860, 'Refund', '2022-09-23 23:05:00', 1, 1),
(1271, '20220924000elmpn', 'sabiuumarmuhammad580@gmail.com', 230, 860, 'Refund', '2022-09-23 23:05:46', 1, 1),
(1272, '20220924050ukcqw', 'sabiuumarmuhammad580@gmail.com', 250, 860, 'Refund', '2022-09-24 04:55:53', 1, 1),
(1273, '20220924050szosu', 'sabiuumarmuhammad580@gmail.com', 230, 860, 'Refund', '2022-09-24 04:56:31', 1, 1),
(1274, '20220924140whint', 'sabiuumarmuhammad580@gmail.com', 125, 735, 'debit', '2022-09-24 13:03:57', 1, 1),
(1275, '20220924140nqkxx', 'sabiuumarmuhammad580@gmail.com', 250, 485, 'debit', '2022-09-24 13:09:39', 1, 1),
(1276, '20220924170xlujr', 'sabiuumarmuhammad580@gmail.com', 250, 235, 'debit', '2022-09-24 16:04:41', 1, 1),
(1277, '20220924180qozof', 'azzeetech.it@gmail.com', 400, 194523, 'transfered', '2022-09-24 17:09:10', 1, 1),
(1278, '20220924180qozof', 'sabiuumarmuhammad580@gmail.com', 400, 235, 'recieved', '2022-09-24 17:09:10', 1, 0),
(1279, '20220924200bxlgq', 'sabiuumarmuhammad580@gmail.com', 230, 405, 'debit', '2022-09-24 19:30:25', 1, 1),
(1280, '20220925130cyffo', 'sabiuumarmuhammad580@gmail.com', 230, 175, 'debit', '2022-09-25 12:30:35', 1, 1),
(1281, '20220925140darkz', 'azzeetech.it@gmail.com', 125, 194398, 'debit', '2022-09-25 13:55:18', 1, 1),
(1282, '20220925190bhggi', 'princeishaq53@gmail.com', 125, 150, 'Refund', '2022-09-25 18:12:33', 1, 1),
(1283, '20220925190uhnrc', 'princeishaq53@gmail.com', 125, 150, 'Refund', '2022-09-25 18:14:13', 1, 1),
(1284, '20220925190fubzn', 'princeishaq53@gmail.com', 125, 150, 'Refund', '2022-09-25 18:29:32', 1, 1),
(1285, '20220925190jzrgb', 'princeishaq53@gmail.com', 125, 150, 'Refund', '2022-09-25 18:32:58', 1, 1),
(1286, '20220925190utltj', 'princeishaq53@gmail.com', 125, 150, 'Refund', '2022-09-25 18:52:37', 1, 1),
(1287, '20220925190hldek', 'princeishaq53@gmail.com', 125, 25, 'debit', '2022-09-25 18:59:14', 1, 0),
(1288, '20220925220vydmc', 'sabiuumarmuhammad580@gmail.com', 125, 175, 'Refund', '2022-09-25 21:24:12', 1, 1),
(1289, '20220926080vfasf', 'sabiuumarmuhammad580@gmail.com', 125, 175, 'Refund', '2022-09-26 07:18:54', 1, 1),
(1290, '20220926110hbuwz', 'sabiuumarmuhammad580@gmail.com', 125, 175, 'Refund', '2022-09-26 10:16:56', 1, 1),
(1291, '950452057686576586', 'softwareclone@gmail.com', 100, 500000, 'credit', '2022-11-12 02:41:51', 1, 0),
(1292, '178172223145794937', 'azzeetech.it@gmail.com', 500, 193898, 'debit', '2022-11-14 14:44:58', 1, 0),
(1293, '845137298709692807', 'azzeetech.it@gmail.com', 500, 193398, 'debit', '2022-11-16 16:05:27', 1, 0),
(1294, '478026404377775507', 'azzeetech.it@gmail.com', 98, 193300, 'debit', '2022-11-16 16:11:59', 1, 0),
(1295, '832221567339053941', 'azzeetech.it@gmail.com', 98, 193202, 'debit', '2022-11-16 16:16:46', 1, 0),
(1296, '962776445809953028', 'azzeetech.it@gmail.com', 98, 193104, 'debit', '2022-11-16 16:17:51', 1, 0),
(1297, '522332704827570508', 'azzeetech.it@gmail.com', 197, 192907, 'debit', '2022-11-16 16:20:24', 1, 0),
(1298, '781191022259587656', 'azzeetech.it@gmail.com', 197, 192710, 'debit', '2022-11-16 16:24:07', 1, 0),
(1299, '509820369625819285', 'softwareclone@gmail.com', 125, 499875, 'debit', '2022-11-18 18:48:24', 1, 0),
(1300, '348810249132137563', 'ahmadyakubu014499@gmail.com', 500, 4500, 'debit', '2022-11-18 21:06:34', 1, 1),
(1301, '639602855229851389', 'ahmadyakubu014499@gmail.com', 690, 3810, 'debit', '2022-11-18 21:29:25', 1, 1),
(1302, '641357642682458709', 'softwareclone@gmail.com', 125, 499750, 'debit', '2022-11-19 06:50:46', 1, 1),
(1303, '578135649587702530', 'ahmadyakubu014499@gmail.com', 250, 3560, 'debit', '2022-11-19 19:39:31', 1, 1),
(1304, '292320401325011508', 'ahmadyakubu014499@gmail.com', 250, 3310, 'debit', '2022-11-19 19:41:55', 1, 1),
(1305, '994944201932178324', 'ahmadyakubu014499@gmail.com', 250, 3060, 'debit', '2022-11-20 17:03:35', 1, 1),
(1306, '166627512733685518', 'ahmadyakubu014499@gmail.com', 500, 2560, 'debit', '2022-11-20 17:46:56', 1, 1),
(1307, '329944443327432660', 'ahmadyakubu014499@gmail.com', 250, 2310, 'debit', '2022-11-20 17:51:11', 1, 1),
(1308, '463213427861368053', 'ahmadyakubu014499@gmail.com', 250, 2060, 'debit', '2022-11-20 20:38:41', 1, 1),
(1309, '616936956231105540', 'ahmadyakubu014499@gmail.com', 196, 1864, 'debit', '2022-11-21 17:42:05', 1, 0),
(1310, '134576772269154726', 'ahmadyakubu014499@gmail.com', 250, 1614, 'debit', '2022-11-21 20:23:36', 1, 1),
(1311, '843936233368107154', 'ahmadyakubu014499@gmail.com', 250, 1364, 'debit', '2022-11-21 21:31:43', 1, 1),
(1312, '645078753225379844', 'ahmadyakubu014499@gmail.com', 230, 1134, 'debit', '2022-11-22 09:59:59', 1, 1),
(1313, '504625200990496730', 'ahmadyakubu014499@gmail.com', 250, 884, 'debit', '2022-11-22 10:22:20', 1, 1);
INSERT INTO `wallet_history_tbl` (`id`, `trans_id`, `email`, `trans_amount`, `available_balance`, `wallet_status`, `trans_date`, `super_admin`, `status`) VALUES
(1314, '472689682947022230', 'ahmadyakubu014499@gmail.com', 250, 634, 'debit', '2022-11-22 11:50:56', 1, 1),
(1315, '324461823120004016', 'ahmadyakubu014499@gmail.com', 250, 384, 'debit', '2022-11-23 10:09:16', 1, 0),
(1316, '882165263211144301', 'ahmadyakubu014499@gmail.com', 250, 134, 'debit', '2022-11-23 10:12:53', 1, 0),
(1317, '193269252522041419', 'softwareclone@gmail.com', 49, 499701, 'debit', '2022-11-23 13:59:47', 1, 1),
(1318, '768918970787470700', 'softwareclone@gmail.com', 9200, 490501, 'transfered', '2022-11-23 14:02:29', 1, 1),
(1319, '768918970787470700', 'ahmadyakubu014499@gmail.com', 9200, 134, 'recieved', '2022-11-23 14:02:29', 1, 1),
(1320, '768918970787470700', 'softwareclone@gmail.com', 9200, 481301, 'transfered', '2022-11-23 14:02:30', 1, 1),
(1321, '768918970787470700', 'ahmadyakubu014499@gmail.com', 9200, 9334, 'recieved', '2022-11-23 14:02:30', 1, 0),
(1322, '577217348732606481', 'softwareclone@gmail.com', 125, 481176, 'debit', '2022-11-23 14:49:28', 1, 1),
(1323, '189343712158189739', 'softwareclone@gmail.com', 125, 481051, 'debit', '2022-11-23 14:51:43', 1, 1),
(1324, '869299188504839165', 'softwareclone@gmail.com', 49, 481002, 'debit', '2022-11-23 14:56:58', 1, 1),
(1325, '825047731269315539', 'ahmadyakubu014499@gmail.com', 250, 18284, 'debit', '2022-11-23 15:29:49', 1, 1),
(1326, '859211050455993499', 'ahmadyakubu014499@gmail.com', 250, 18034, 'debit', '2022-11-23 15:34:00', 1, 1),
(1327, '775932954694903451', 'ahmadyakubu014499@gmail.com', 250, 17784, 'debit', '2022-11-23 16:18:38', 1, 1),
(1328, '649052279864633129', 'ahmadyakubu014499@gmail.com', 250, 17534, 'debit', '2022-11-23 21:24:16', 1, 1),
(1329, '553262807886885527', 'a.a.adeniyi1997@gmail.com', 500, 4500, 'debit', '2022-11-23 21:25:40', 1, 1),
(1330, '482407515940741136', 'a.a.adeniyi1997@gmail.com', 250, 4250, 'debit', '2022-11-23 21:27:00', 1, 1),
(1331, '20221123220nubrh', 'softwareclone@gmail.com', 125, 480877, 'debit', '2022-11-23 21:51:39', 1, 1),
(1332, '20221123230ncbpw', 'ahmadyakubu014499@gmail.com', 250, 17534, 'Refund', '2022-11-23 22:12:14', 1, 1),
(1333, '20221124110snzrt', 'ahmadyakubu014499@gmail.com', 250, 8517, 'debit', '2022-11-24 10:27:52', 1, 1),
(1334, '20221124200abnfp', 'ahmadyakubu014499@gmail.com', 250, 8267, 'debit', '2022-11-24 19:10:25', 1, 1),
(1335, '20221124220dkgwq', 'ahmadyakubu014499@gmail.com', 250, 8017, 'debit', '2022-11-24 21:16:58', 1, 1),
(1336, '20221124230fnbwn', 'ahmadyakubu014499@gmail.com', 250, 7767, 'debit', '2022-11-24 22:32:59', 1, 1),
(1337, '20221125110pxbnj', 'ahmadyakubu014499@gmail.com', 250, 7517, 'debit', '2022-11-25 10:19:48', 1, 1),
(1338, '20221125110ccwbr', 'softwareclone@gmail.com', 500, 480377, 'debit', '2022-11-25 11:00:06', 1, 1),
(1339, '20221125120kskln', 'softwareclone@gmail.com', 500, 479877, 'debit', '2022-11-25 11:03:17', 1, 1),
(1340, '20221125200cdywc', 'ahmadyakubu014499@gmail.com', 250, 7267, 'debit', '2022-11-25 19:19:18', 1, 1),
(1341, '20221125200shcor', 'ahmadyakubu014499@gmail.com', 250, 7017, 'debit', '2022-11-25 19:48:41', 1, 1),
(1342, '20221125200numqn', 'ahmadyakubu014499@gmail.com', 98, 6919, 'debit', '2022-11-25 19:50:57', 1, 1),
(1343, '20221125200lsase', 'ahmadyakubu014499@gmail.com', 98, 6821, 'debit', '2022-11-25 19:59:16', 1, 1),
(1344, '20221125210bcphg', 'ahmadyakubu014499@gmail.com', 985, 5836, 'debit', '2022-11-25 20:48:57', 1, 1),
(1345, '20221125210poahk', 'ahmadyakubu014499@gmail.com', 250, 5586, 'debit', '2022-11-25 20:57:13', 1, 1),
(1346, '20221125220wlhdh', 'ahmadyakubu014499@gmail.com', 250, 5336, 'debit', '2022-11-25 21:32:14', 1, 1),
(1347, '20221126130mizlf', 'ahmadyakubu014499@gmail.com', 98, 5238, 'debit', '2022-11-26 12:50:07', 1, 1),
(1348, '20221126160kigcu', 'softwareclone@gmail.com', 98, 479779, 'debit', '2022-11-26 15:29:10', 1, 1),
(1349, '20221126160vkglb', 'ahmadyakubu014499@gmail.com', 196, 5042, 'debit', '2022-11-26 15:31:28', 1, 1),
(1350, '20221126180labfn', 'ahmadyakubu014499@gmail.com', 196, 4846, 'debit', '2022-11-26 17:40:41', 1, 1),
(1351, '20221126190fhtet', 'ahmadyakubu014499@gmail.com', 294, 4552, 'debit', '2022-11-26 18:21:28', 1, 1),
(1352, '20221126200dswvl', 'a.a.adeniyi1997@gmail.com', 500, 3750, 'debit', '2022-11-26 19:09:09', 1, 1),
(1353, '20221126210eyhcx', 'ahmadyakubu014499@gmail.com', 250, 4302, 'debit', '2022-11-26 20:33:57', 1, 1),
(1354, '20221126210cpcki', 'ahmadyakubu014499@gmail.com', 250, 4052, 'debit', '2022-11-26 20:35:30', 1, 1),
(1355, '20221126220zyoko', 'ahmadyakubu014499@gmail.com', 250, 4052, 'Refund', '2022-11-26 21:06:26', 1, 1),
(1356, '20221126220pxwzq', 'ahmadyakubu014499@gmail.com', 250, 4052, 'Refund', '2022-11-26 21:08:12', 1, 1),
(1357, '20221126220gqmaf', 'ahmadyakubu014499@gmail.com', 197, 3855, 'debit', '2022-11-26 21:47:08', 1, 1),
(1358, '20221126220iychf', 'ahmadyakubu014499@gmail.com', 98, 3757, 'debit', '2022-11-26 21:48:39', 1, 1),
(1359, '20221126230kqozg', 'ahmadyakubu014499@gmail.com', 98, 3659, 'debit', '2022-11-26 22:04:40', 1, 1),
(1360, '20221126230hmmdr', 'ahmadyakubu014499@gmail.com', 250, 3659, 'Refund', '2022-11-26 22:21:53', 1, 1),
(1361, '20221127080qjxcn', 'softwareclone@gmail.com', 98, 479681, 'debit', '2022-11-27 07:24:26', 1, 1),
(1362, '20221127080vcoqp', 'ahmadyakubu014499@gmail.com', 250, 3409, 'debit', '2022-11-27 07:56:01', 1, 1),
(1363, '20221127080rtutb', 'ahmadyakubu014499@gmail.com', 500, 3409, 'Refund', '2022-11-27 07:57:46', 1, 1),
(1364, '20221127110xibdi', 'ahmadyakubu014499@gmail.com', 500, 3409, 'Refund', '2022-11-27 10:36:12', 1, 1),
(1365, '20221127110lambw', 'ahmadyakubu014499@gmail.com', 500, 3409, 'Refund', '2022-11-27 10:38:25', 1, 1),
(1366, '20221127130uheku', 'ahmadyakubu014499@gmail.com', 250, 3159, 'debit', '2022-11-27 12:44:33', 1, 1),
(1367, '20221127130ykbdu', 'ahmadyakubu014499@gmail.com', 500, 3159, 'Refund', '2022-11-27 12:48:17', 1, 1),
(1368, '20221127130ostxb', 'ahmadyakubu014499@gmail.com', 500, 3159, 'Refund', '2022-11-27 12:49:14', 1, 1),
(1369, '20221127130fosmj', 'ahmadyakubu014499@gmail.com', 500, 3159, 'Refund', '2022-11-27 12:51:34', 1, 1),
(1370, '20221127130jadqu', 'ahmadyakubu014499@gmail.com', 500, 3159, 'Refund', '2022-11-27 12:55:49', 1, 1),
(1371, '20221127130qheht', 'ahmadyakubu014499@gmail.com', 295, 2864, 'debit', '2022-11-27 12:59:53', 1, 1),
(1372, '20221127140kiyhb', 'ahmadyakubu014499@gmail.com', 98, 2766, 'debit', '2022-11-27 13:04:56', 1, 1),
(1373, '20221127160eqywu', 'kakyansoro87@gmail.com', 196, 4265, 'debit', '2022-11-27 15:59:39', 1, 1),
(1374, '20221127170rajkg', 'kakyansoro87@gmail.com', 690, 4265, 'Refund', '2022-11-27 16:01:28', 1, 1),
(1375, '20221127170plcly', 'softwareclone@gmail.com', 2000, 477681, 'transfered', '2022-11-27 16:20:56', 1, 1),
(1376, '20221127170plcly', 'kakyansoro87@gmail.com', 2000, 4265, 'recieved', '2022-11-27 16:20:56', 1, 0),
(1377, '20221127170xuwnv', 'kakyansoro87@gmail.com', 750, 5515, 'debit', '2022-11-27 16:30:07', 1, 1),
(1378, '20221127180tyulu', 'ahmadyakubu014499@gmail.com', 250, 2516, 'debit', '2022-11-27 17:27:29', 1, 1),
(1379, '20221127190vbzjv', 'ahmadyakubu014499@gmail.com', 492, 2024, 'debit', '2022-11-27 18:06:31', 1, 1),
(1380, '20221127190ltxjj', 'ahmadyakubu014499@gmail.com', 98, 1926, 'debit', '2022-11-27 18:08:43', 1, 1),
(1381, '20221127190gogzj', 'ahmadyakubu014499@gmail.com', 98, 1828, 'debit', '2022-11-27 18:09:50', 1, 1),
(1382, '20221127190rxswm', 'ahmadyakubu014499@gmail.com', 250, 1578, 'debit', '2022-11-27 18:10:50', 1, 1),
(1383, '20221127190hnxfv', 'ahmadyakubu014499@gmail.com', 492, 1086, 'debit', '2022-11-27 18:20:56', 1, 1),
(1384, '20221127190cgesh', 'ahmadyakubu014499@gmail.com', 98, 988, 'debit', '2022-11-27 18:24:17', 1, 1),
(1385, '20221127200bawhv', 'ahmadyakubu014499@gmail.com', 98, 890, 'debit', '2022-11-27 19:07:36', 1, 1),
(1386, '20221127200frgnj', 'ahmadyakubu014499@gmail.com', 295, 595, 'debit', '2022-11-27 19:15:57', 1, 1),
(1387, '20221127200xjlje', 'ahmadyakubu014499@gmail.com', 98, 497, 'debit', '2022-11-27 19:34:37', 1, 1),
(1388, '20221127200bswbb', 'ahmadyakubu014499@gmail.com', 394, 103, 'debit', '2022-11-27 19:37:11', 1, 1),
(1389, '20221128110jkqbv', 'softwareclone@gmail.com', 12000, 465681, 'transfered', '2022-11-28 10:34:51', 1, 1),
(1390, '20221128110jkqbv', 'ahmadyakubu014499@gmail.com', 12000, 103, 'recieved', '2022-11-28 10:34:51', 1, 0),
(1391, '20221128120acbzz', 'ahmadyakubu014499@gmail.com', 197, 11906, 'debit', '2022-11-28 11:08:15', 1, 1),
(1392, '20221128130ukpmb', 'ahmadyakubu014499@gmail.com', 250, 11656, 'debit', '2022-11-28 12:18:12', 1, 1),
(1393, '20221128130wdria', 'ahmadyakubu014499@gmail.com', 250, 11406, 'debit', '2022-11-28 12:21:32', 1, 1),
(1394, '20221128130fmovk', 'ahmadyakubu014499@gmail.com', 197, 11209, 'debit', '2022-11-28 12:57:12', 1, 1),
(1395, '20221128140cvewz', 'ahmadyakubu014499@gmail.com', 295, 10914, 'debit', '2022-11-28 13:02:55', 1, 1),
(1396, '20221128140jhjhx', 'ahmadyakubu014499@gmail.com', 197, 10717, 'debit', '2022-11-28 13:05:37', 1, 1),
(1397, '20221128140cdrjy', 'ahmadyakubu014499@gmail.com', 125, 10592, 'debit', '2022-11-28 13:19:20', 1, 1),
(1398, '20221128160ybyii', 'ahmadyakubu014499@gmail.com', 295, 10297, 'debit', '2022-11-28 15:15:05', 1, 1),
(1399, '20221128160gjren', 'ahmadyakubu014499@gmail.com', 98, 10199, 'debit', '2022-11-28 15:16:36', 1, 1),
(1400, '20221128160bdwbd', 'ahmadyakubu014499@gmail.com', 197, 10002, 'debit', '2022-11-28 15:27:03', 1, 1),
(1401, '20221128170gulgb', 'ahmadyakubu014499@gmail.com', 197, 9805, 'debit', '2022-11-28 16:44:21', 1, 1),
(1402, '20221128180vaxze', 'ahmadyakubu014499@gmail.com', 230, 9575, 'debit', '2022-11-28 17:29:50', 1, 1),
(1403, '20221128180cyenv', 'ahmadyakubu014499@gmail.com', 98, 9477, 'debit', '2022-11-28 17:41:23', 1, 1),
(1404, '20221128190wulju', 'ahmadyakubu014499@gmail.com', 98, 9379, 'debit', '2022-11-28 18:02:17', 1, 1),
(1405, '20221128190okkzj', 'ahmadyakubu014499@gmail.com', 98, 9281, 'debit', '2022-11-28 18:11:06', 1, 1),
(1406, '20221128190vswig', 'ahmadyakubu014499@gmail.com', 230, 9051, 'debit', '2022-11-28 18:20:04', 1, 1),
(1407, '20221128190yptsg', 'ahmadyakubu014499@gmail.com', 197, 8854, 'debit', '2022-11-28 18:27:25', 1, 1),
(1408, '20221128190scdba', 'ahmadyakubu014499@gmail.com', 394, 8460, 'debit', '2022-11-28 18:48:18', 1, 1),
(1409, '20221128200hkaej', 'ahmadyakubu014499@gmail.com', 98, 8362, 'debit', '2022-11-28 19:00:36', 1, 1),
(1410, '20221128200alczo', 'ahmadyakubu014499@gmail.com', 197, 8165, 'debit', '2022-11-28 19:32:07', 1, 1),
(1411, '20221128200zzaup', 'ahmadyakubu014499@gmail.com', 250, 7915, 'debit', '2022-11-28 19:51:34', 1, 1),
(1412, '20221128220gscna', 'ahmadyakubu014499@gmail.com', 197, 7915, 'Refund', '2022-11-28 21:07:04', 1, 1),
(1413, '20221128220hyuzb', 'ahmadyakubu014499@gmail.com', 197, 7915, 'Refund', '2022-11-28 21:13:05', 1, 1),
(1414, '20221128220gfxuk', 'ahmadyakubu014499@gmail.com', 197, 7915, 'Refund', '2022-11-28 21:14:26', 1, 1),
(1415, '20221128220svwtn', 'ahmadyakubu014499@gmail.com', 250, 7915, 'Refund', '2022-11-28 21:16:08', 1, 1),
(1416, '20221128220rrccc', 'ahmadyakubu014499@gmail.com', 196, 7915, 'Refund', '2022-11-28 21:20:47', 1, 1),
(1417, '20221128220ibrbg', 'ahmadyakubu014499@gmail.com', 250, 7915, 'Refund', '2022-11-28 21:52:35', 1, 1),
(1418, '20221128230sjplr', 'ahmadyakubu014499@gmail.com', 250, 7915, 'Refund', '2022-11-28 22:06:24', 1, 1),
(1419, '20221128230iclfo', 'ahmadyakubu014499@gmail.com', 250, 7915, 'Refund', '2022-11-28 22:41:48', 1, 1),
(1420, '20221129000fvncn', 'ahmadyakubu014499@gmail.com', 250, 7915, 'Refund', '2022-11-28 23:01:28', 1, 1),
(1421, '20221129000chvab', 'ahmadyakubu014499@gmail.com', 250, 7915, 'Refund', '2022-11-28 23:40:58', 1, 1),
(1422, '20221129010gktop', 'ahmadyakubu014499@gmail.com', 250, 7915, 'Refund', '2022-11-29 00:39:14', 1, 1),
(1423, '20221129090rhrgv', 'ahmadyakubu014499@gmail.com', 250, 7665, 'debit', '2022-11-29 08:29:17', 1, 1),
(1424, '20221129090sjthr', 'ahmadyakubu014499@gmail.com', 250, 7415, 'debit', '2022-11-29 08:30:18', 1, 1),
(1425, '20221129130okody', 'azzeetech.it@gmail.com', 500, 192223, 'debit', '2022-11-29 12:45:59', 1, 1),
(1426, '20221129130oqfmd', 'softwareclone@gmail.com', 500, 465181, 'debit', '2022-11-29 12:46:54', 1, 1),
(1427, '20221129200nndif', 'kakyansoro87@gmail.com', 392, 5123, 'debit', '2022-11-29 19:47:13', 1, 1),
(1428, '20221129200cxifi', 'kakyansoro87@gmail.com', 197, 4926, 'debit', '2022-11-29 19:48:12', 1, 1),
(1429, '20221130100sgcql', 'ahmadyakubu014499@gmail.com', 250, 7165, 'debit', '2022-11-30 09:23:25', 1, 1),
(1430, '20221130150jbxie', 'ahmadyakubu014499@gmail.com', 250, 6915, 'debit', '2022-11-30 14:34:21', 1, 1),
(1431, '20221130190zfyun', 'ahmadyakubu014499@gmail.com', 250, 6665, 'debit', '2022-11-30 18:59:22', 1, 1),
(1432, '20221130200lueng', 'ahmadyakubu014499@gmail.com', 250, 6415, 'debit', '2022-11-30 19:21:43', 1, 1),
(1433, '20221201000nxqrp', 'ahmadyakubu014499@gmail.com', 250, 6165, 'debit', '2022-11-30 23:00:44', 1, 1),
(1434, '20221201000lqlcu', 'a.a.adeniyi1997@gmail.com', 500, 3250, 'debit', '2022-11-30 23:22:09', 1, 1),
(1435, '20221201090rlfvd', 'ahmadyakubu014499@gmail.com', 985, 6165, 'Refund', '2022-12-01 08:24:08', 1, 1),
(1436, '20221201090xkmwx', 'ahmadyakubu014499@gmail.com', 985, 6165, 'Refund', '2022-12-01 08:30:54', 1, 1),
(1437, '20221201090cqzhc', 'ahmadyakubu014499@gmail.com', 125, 6040, 'debit', '2022-12-01 08:41:04', 1, 1),
(1438, '20221201120wgghf', 'a.a.adeniyi1997@gmail.com', 460, 2790, 'debit', '2022-12-01 11:08:09', 1, 1),
(1439, '20221201150ontgq', 'ahmadyakubu014499@gmail.com', 250, 5790, 'debit', '2022-12-01 14:25:35', 1, 1),
(1440, '20221201160pomjj', 'ahmadyakubu014499@gmail.com', 125, 5665, 'debit', '2022-12-01 15:10:04', 1, 1),
(1441, '20221201220feyms', 'ahmadyakubu014499@gmail.com', 1182, 5665, 'Refund', '2022-12-01 21:18:11', 1, 1),
(1442, '20221201220beckt', 'ahmadyakubu014499@gmail.com', 250, 5415, 'debit', '2022-12-01 21:31:53', 1, 1),
(1443, '20221202090akaps', 'ahmadyakubu014499@gmail.com', 392, 5023, 'debit', '2022-12-02 08:23:33', 1, 1),
(1444, '20221203090lhblr', 'ahmadyakubu014499@gmail.com', 980, 5023, 'Refund', '2022-12-03 08:24:46', 1, 1),
(1445, '20221203100fvjjq', 'ahmadyakubu014499@gmail.com', 230, 4793, 'debit', '2022-12-03 09:57:13', 1, 1),
(1446, '20221203110bduxq', 'ahmadyakubu014499@gmail.com', 250, 4793, 'Refund', '2022-12-03 10:02:01', 1, 1),
(1447, '20221203200foght', 'ahmadyakubu014499@gmail.com', 250, 4543, 'debit', '2022-12-03 19:39:26', 1, 1),
(1448, '20221203210lszpu', 'ahmadyakubu014499@gmail.com', 980, 4543, 'Refund', '2022-12-03 20:43:50', 1, 1),
(1449, '20221203220hzypd', 'ahmadyakubu014499@gmail.com', 250, 4543, 'Refund', '2022-12-03 21:53:46', 1, 1),
(1450, '20221203230dclbw', 'ahmadyakubu014499@gmail.com', 250, 4543, 'Refund', '2022-12-03 22:03:05', 1, 1),
(1451, '20221203230vywei', 'ahmadyakubu014499@gmail.com', 250, 4543, 'Refund', '2022-12-03 22:14:19', 1, 1),
(1452, '20221204090ldqxr', 'ahmadyakubu014499@gmail.com', 250, 4293, 'debit', '2022-12-04 08:51:08', 1, 1),
(1453, '20221204100bekxi', 'ahmadyakubu014499@gmail.com', 250, 4293, 'Refund', '2022-12-04 09:25:00', 1, 1),
(1454, '20221204130ghsqg', 'softwareclone@gmail.com', 460, 464721, 'debit', '2022-12-04 12:06:55', 1, 1),
(1455, '20221204130ixesh', 'ahmadyakubu014499@gmail.com', 490, 4293, 'Refund', '2022-12-04 12:17:41', 1, 1),
(1456, '20221204130ujbel', 'ahmadyakubu014499@gmail.com', 250, 4293, 'Refund', '2022-12-04 12:41:43', 1, 1),
(1457, '20221204130weugz', 'ahmadyakubu014499@gmail.com', 230, 4293, 'Refund', '2022-12-04 12:54:56', 1, 1),
(1458, '20221204150bjawo', 'ahmadyakubu014499@gmail.com', 230, 4293, 'Refund', '2022-12-04 14:16:01', 1, 1),
(1459, '20221204160mtohc', 'ahmadyakubu014499@gmail.com', 230, 4293, 'Refund', '2022-12-04 15:20:30', 1, 1),
(1460, '20221204180xpeng', 'ahmadyakubu014499@gmail.com', 230, 4063, 'debit', '2022-12-04 17:54:21', 1, 1),
(1461, '20221204180pmicr', 'ahmadyakubu014499@gmail.com', 250, 4063, 'Refund', '2022-12-04 17:55:16', 1, 1),
(1462, '20221204180bqbml', 'ahmadyakubu014499@gmail.com', 230, 4063, 'Refund', '2022-12-04 17:56:04', 1, 1),
(1463, '20221204210yoqmk', 'ahmadyakubu014499@gmail.com', 492, 4063, 'Refund', '2022-12-04 20:25:24', 1, 1),
(1464, '20221204210gizaq', 'ahmadyakubu014499@gmail.com', 196, 3867, 'debit', '2022-12-04 20:30:28', 1, 1),
(1465, '20221204210tqguh', 'ahmadyakubu014499@gmail.com', 492, 3867, 'Refund', '2022-12-04 20:32:21', 1, 1),
(1466, '20221204210rumkb', 'ahmadyakubu014499@gmail.com', 250, 3617, 'debit', '2022-12-04 20:57:56', 1, 1),
(1467, '20221205000xctfx', 'ahmadyakubu014499@gmail.com', 98, 3617, 'Refund', '2022-12-04 23:12:38', 1, 1),
(1468, '20221205000ftsku', 'ahmadyakubu014499@gmail.com', 98, 3617, 'Refund', '2022-12-04 23:13:08', 1, 1),
(1469, '20221205010blmzf', 'ahmadyakubu014499@gmail.com', 98, 3617, 'Refund', '2022-12-05 00:03:45', 1, 1),
(1470, '20221205050ywibu', 'ahmadyakubu014499@gmail.com', 98, 3617, 'Refund', '2022-12-05 04:59:47', 1, 1),
(1471, '20221205080xsqbd', 'ahmadyakubu014499@gmail.com', 98, 3617, 'Refund', '2022-12-05 07:17:00', 1, 1),
(1472, '20221205230dnpje', 'softwareclone@gmail.com', 98, 464623, 'debit', '2022-12-05 22:05:12', 1, 1),
(1473, '20221205230pfagz', 'ahmadyakubu014499@gmail.com', 250, 3367, 'debit', '2022-12-05 22:43:25', 1, 0),
(1474, '20221206100ssukt', 'softwareclone@gmail.com', 197, 464426, 'debit', '2022-12-06 09:17:23', 1, 1),
(1475, '20221206110wagqn', 'ahmadyakubu014499@gmail.com', 250, 3117, 'debit', '2022-12-06 10:03:10', 1, 0),
(1476, '20221206110vkhde', 'ahmadyakubu014499@gmail.com', 250, 2867, 'debit', '2022-12-06 10:24:25', 1, 0),
(1477, '20221206130hsvhk', 'softwareclone@gmail.com', 125, 464301, 'debit', '2022-12-06 12:54:50', 1, 0),
(1478, '20221206130djcep', 'softwareclone@gmail.com', 125, 464176, 'debit', '2022-12-06 13:00:17', 1, 0),
(1479, '370643157729636376', 'ahmadyakubu014499@gmail.com', 196, 2671, 'debit', '2022-12-06 14:55:42', 1, 0),
(1480, '300476670887856962', 'ahmadyakubu014499@gmail.com', 196, 2475, 'debit', '2022-12-06 15:13:52', 1, 0),
(1481, '988198204835691825', 'ahmadyakubu014499@gmail.com', 196, 2279, 'debit', '2022-12-06 15:15:38', 1, 0),
(1482, '816587867451165043', 'ahmadyakubu014499@gmail.com', 250, 2029, 'debit', '2022-12-06 16:35:00', 1, 0),
(1483, '425456431176574131', 'softwareclone@gmail.com', 125, 464051, 'debit', '2022-12-06 19:41:14', 1, 0),
(1484, '112619932532004902', 'softwareclone@gmail.com', 98, 463953, 'debit', '2022-12-07 05:24:08', 1, 1),
(1485, '918443536774635970', 'softwareclone@gmail.com', 98, 463855, 'debit', '2022-12-07 14:26:37', 1, 1),
(1486, '512571754434878393', 'softwareclone@gmail.com', 98, 463757, 'debit', '2022-12-09 09:02:04', 1, 1),
(1487, '720151653952297483', 'kakyansoro87@gmail.com', 196, 4730, 'debit', '2022-12-11 09:07:27', 1, 1),
(1488, '987418507676420726', 'kakyansoro87@gmail.com', 750, 3980, 'debit', '2022-12-12 11:33:48', 1, 0),
(1489, '307466656556616439', 'softwareclone@gmail.com', 98, 463659, 'debit', '2022-12-12 18:01:37', 1, 1),
(1490, '472202393717058220', 'kakyansoro87@gmail.com', 750, 3230, 'debit', '2022-12-19 05:06:50', 1, 0),
(1491, '983844733669716356', 'kakyansoro87@gmail.com', 294, 2936, 'debit', '2022-12-19 05:08:12', 1, 0),
(1492, '194364083790577846', 'kakyansoro87@gmail.com', 197, 2739, 'debit', '2022-12-23 15:53:07', 1, 0),
(1493, '156602771705124469', 'ahmadyakubu014499@gmail.com', 250, 1779, 'debit', '2022-12-29 12:05:39', 1, 0),
(1494, '599932179222590028', 'ahmadyakubu014499@gmail.com', 197, 1582, 'debit', '2022-12-29 15:22:26', 1, 0),
(1495, '315482573237026414', 'kakyansoro87@gmail.com', 196, 2543, 'debit', '2023-01-01 17:47:42', 1, 0),
(1496, '606619923204539020', 'softwareclone@gmail.com', 49, 463610, 'debit', '2023-01-09 09:33:53', 1, 0),
(1497, '982058199802314127', 'softwareclone@gmail.com', 49, 463561, 'debit', '2023-01-09 09:34:44', 1, 0),
(1498, '326898225288629431', 'softwareclone@gmail.com', 49, 463512, 'debit', '2023-01-09 09:35:22', 1, 0),
(1499, '994194444671584773', 'softwareclone@gmail.com', 49, 463463, 'debit', '2023-01-09 13:36:58', 1, 0),
(1500, '113370729890898920', 'azzeetech.it@gmail.com', 500, 500, 'credited by Payboxed', '2023-02-07 21:27:53', 1, 1),
(1501, '192242502858900843', 'azzeetech.it@gmail.com', 487, 13, 'debit', '2023-02-07 21:29:08', 1, 0),
(1502, '209639705397663679', 'azzeetech.it@gmail.com', 3000, 3013, 'credited by Payboxed', '2023-02-09 22:53:08', 1, 1),
(1503, '404660176678703862', 'softwareclone@gmail.com', 100, 463563, 'credited by Payboxed', '2023-02-10 12:01:13', 1, 1),
(1504, '428570233408889675', 'softwareclone@gmail.com', 100, 463563, 'credit', '2023-02-10 14:48:56', 1, 0),
(1505, '869403516990797598', 'azzeetech.it@gmail.com', 492, 3013, 'Refund', '2023-02-10 21:04:31', 1, 1),
(1506, '888606013545148781', 'ameeralhassan79@gmail.com', 2500, 0, 'credit', '2023-02-16 19:26:23', 1, 0),
(1507, '618793032645446029', 'ameeralhassan79@gmail.com', 2500, 0, 'credit', '2023-02-16 21:41:22', 1, 0),
(1508, '886602335964604740', 'ameeralhassan79@gmail.com', 1000, 0, 'credit', '2023-02-18 05:26:34', 1, 0),
(1509, '454201290423861661', 'ameeralhassan79@gmail.com', 2000, 0, 'credit', '2023-02-21 21:46:16', 1, 0),
(1510, '749165246329703926', 'ameeralhassan79@gmail.com', 2000, 0, 'credit', '2023-02-21 21:47:25', 1, 0),
(1511, '221553388510790406', 'softwareclone@gmail.com', 125, 463438, 'debit', '2023-03-08 13:39:00', 1, 0),
(1512, '974650453869645106', 'azzeetech.it@gmail.com', 250, 2763, 'debit', '2023-03-11 12:11:41', 1, 0),
(1513, '935464941210532720', 'azzeetech.it@gmail.com', 500, 2263, 'debit', '2023-03-11 14:24:17', 1, 0),
(1514, '427023420198956501', 'azzeetech.it@gmail.com', 440, 1823, 'debit', '2023-03-11 14:28:24', 1, 0),
(1515, '749914250707955074', 'azzeetech.it@gmail.com', 440, 1383, 'debit', '2023-03-11 14:30:48', 1, 0),
(1516, '571744742356084406', 'azzeetech.it@gmail.com', 230, 1153, 'debit', '2023-03-11 15:32:00', 1, 0),
(1517, '547819185814344242', 'softwareclone@gmail.com', 130, 463308, 'debit', '2023-03-13 12:17:56', 1, 0),
(1518, '396025130450044234', 'azzeetech.it@gmail.com', 150, 1153, 'Refund', '2023-03-14 13:31:56', 1, 1),
(1519, '401772337433301660', 'softwareclone@gmail.com', 250, 463058, 'debit', '2023-03-14 14:12:57', 1, 1),
(1520, '388175041133002399', 'azzeetech.it@gmail.com', 470, 1153, 'Refund', '2023-03-15 18:33:28', 1, 1),
(1521, '835919273571706450', 'azzeetech.it@gmail.com', 250, 903, 'debit', '2023-03-15 18:33:55', 1, 1),
(1522, '328398164117422314', 'azzeetech.it@gmail.com', 470, 903, 'Refund', '2023-03-22 22:42:32', 1, 1),
(1523, '896123605333802375', 'azzeetech.it@gmail.com', 250, 903, 'Refund', '2023-03-22 22:42:57', 1, 1),
(1524, '169142546873961644', 'azzeetech.it@gmail.com', 470, 903, 'Refund', '2023-03-23 22:04:37', 1, 1),
(1525, '439072092764940695', 'mubarakmusa029@gmail.com', 1000, 5, 'credit', '2023-04-19 16:34:45', 1, 0),
(1526, '999580783863421685', 'mubarakmusa029@gmail.com', 200, 5, 'credit', '2023-04-19 16:43:48', 1, 0),
(1527, '136823076186747246', 'mubarakmusa029@gmail.com', 200, 5, 'credit', '2023-04-19 16:44:01', 1, 0),
(1528, '477578307661092261', 'mubarakmusa029@gmail.com', 200, 5, 'credit', '2023-04-19 16:44:18', 1, 0),
(1529, '229571339119230829', 'mubarakmusa029@gmail.com', 400, 5, 'credit', '2023-04-19 20:35:40', 1, 0),
(1530, '584006354630545873', 'mubarakmusa029@gmail.com', 200, 5, 'credit', '2023-04-19 20:36:04', 1, 0),
(1531, '845607908650030046', 'mubarakmusa029@gmail.com', 2000, 5, 'credit', '2023-04-20 06:44:53', 1, 0),
(1532, '338016527660750153', 'mubarakmusa029@gmail.com', 500, 5, 'credit', '2023-04-20 21:13:30', 1, 0),
(1533, '233436799692407836', 'mubarakmusa029@gmail.com', 500, 5, 'credit', '2023-04-22 13:25:33', 1, 0),
(1534, '381082001912573394', 'mubarakmusa029@gmail.com', 3000, 5, 'credit', '2023-04-23 09:44:25', 1, 0),
(1535, '765749967772039335', 'mubarakmusa029@gmail.com', 1000, 5, 'credit', '2023-04-27 19:53:13', 1, 0),
(1536, '781227309272025923', 'mubarakmusa029@gmail.com', 5000, 5, 'credit', '2023-04-30 19:30:41', 1, 0),
(1537, '157262667954544064', 'softwareclone@gmail.com', 500, 463058, 'credit', '2023-08-21 15:46:30', 1, 0),
(1538, '458963958733978032', 'softwareclone2024@gmail.com', 500, 0, 'credit', '2024-07-18 07:18:23', 1, 0),
(1539, '573464047289851700', 'softwareclone2024@gmail.com', 500, 0, 'credit', '2024-07-18 07:18:43', 1, 0),
(1540, '861959517871063046', 'mahmudmohad95@gmail.com', 200, 0, 'credit', '2024-07-20 11:11:41', 1, 0),
(1541, '861959517871063046', 'mahmudmohad95@gmail.com', 200, 0, 'credit', '2024-07-20 11:11:41', 1, 0),
(1543, '411722046512763038', 'mahmudmohad95@gmail.com', 500, 0, 'credit', '2024-07-20 11:11:55', 1, 0),
(1544, '411722046512763038', 'mahmudmohad95@gmail.com', 500, 0, 'credit', '2024-07-20 11:11:55', 1, 0),
(1545, '654702620604399807', 'hassankamzahab@gmail.com', 500, 0, 'credit', '2024-07-20 11:58:56', 1, 0),
(1546, '873162370194588312', 'mahmudmohad95@gmail.com', 200, 0, 'credit', '2024-07-20 12:00:02', 1, 0),
(1547, '873162370194588312', 'mahmudmohad95@gmail.com', 200, 0, 'credit', '2024-07-20 12:00:02', 1, 0),
(1548, '746899566460161051', 'hassankamzahab@gmail.com', 500, 500, 'credit', '2024-07-20 12:35:18', 1, 1),
(1549, '825398483471622979', 'hassankamzahab@gmail.com', 10000, 10500, 'credit', '2024-07-20 12:47:45', 1, 1),
(1550, '492963116970374561', 'kamzahabsolutions@gmail.com', 5000, 5000, 'credit', '2024-07-20 14:17:53', 1, 1),
(1551, '266011125859851707', 'mahmudmohad95@gmail.com', 200, 0, 'credit', '2024-07-21 08:09:22', 1, 0),
(1552, '266011125859851707', 'mahmudmohad95@gmail.com', 200, 0, 'credit', '2024-07-21 08:09:22', 1, 0),
(1553, '358824712327609275', 'mahmudmohad95@gmail.com', 48, 152, 'debit', '2024-07-21 08:11:59', 1, 0),
(1554, '358824712327609275', 'mahmudmohad95@gmail.com', 48, -48, 'debit', '2024-07-21 08:11:59', 1, 0),
(1555, '655946178669301013', 'mahmudmohad95@gmail.com', 48, 104, 'debit', '2024-07-21 08:28:10', 1, 0),
(1556, '655946178669301013', 'mahmudmohad95@gmail.com', 48, -96, 'debit', '2024-07-21 08:28:10', 1, 0),
(1557, '568308965610626729', 'mahmudmohad95@gmail.com', 49, 55, 'debit', '2024-07-22 17:21:21', 1, 0),
(1558, '568308965610626729', 'mahmudmohad95@gmail.com', 49, -145, 'debit', '2024-07-22 17:21:21', 1, 0),
(1559, '995293606252778114', 'mahmudmohad95@gmail.com', 49, 6, 'debit', '2024-07-22 17:28:20', 1, 0),
(1560, '995293606252778114', 'mahmudmohad95@gmail.com', 49, -194, 'debit', '2024-07-22 17:28:20', 1, 0),
(1561, '123662803181990158', 'mahmudmohad95@gmail.com', 200, 6, 'credit', '2024-07-22 18:23:36', 1, 0),
(1562, '123662803181990158', 'mahmudmohad95@gmail.com', 200, -194, 'credit', '2024-07-22 18:23:36', 1, 0),
(1563, '470968614683051170', 'mahmudmohad95@gmail.com', 49, 500, 'Refund', '2024-07-22 18:28:08', 1, 1),
(1564, '470968614683051170', 'mahmudmohad95@gmail.com', 49, -194, 'Refund', '2024-07-22 18:28:08', 1, 1),
(1565, '663268466267934113', 'insaffanigltd@gmail.com', 500, 500, 'credit', '2024-07-22 19:51:10', 1, 1),
(1566, '751041955861419535', 'mahmudmohad95@gmail.com', 49, 451, 'debit', '2024-07-22 19:53:08', 1, 1),
(1567, '751041955861419535', 'mahmudmohad95@gmail.com', 49, -243, 'debit', '2024-07-22 19:53:08', 1, 1),
(1569, '732091206957213123', 'insaffanigltd@gmail.com', 500, 0, 'credit', '2024-07-22 19:54:40', 1, 0),
(1570, '722712183376111143', 'insaffanigltd@gmail.com', 5000, 0, 'credit', '2024-07-22 20:44:08', 1, 0),
(1571, '146396529889340178', 'hassankamzahab@gmail.com', 197, 10500, 'Refund', '2024-07-22 20:53:45', 1, 1),
(1572, '680949386468890195', 'hassankamzahab@gmail.com', 98, 10402, 'debit', '2024-07-22 20:55:46', 1, 1),
(1573, '276681321997776968', 'mahmudmohad95@gmail.com', 591, 1409, 'debit', '2024-07-23 09:14:13', 1, 0),
(1574, '276681321997776968', 'mahmudmohad95@gmail.com', 591, -833, 'debit', '2024-07-23 09:14:13', 1, 0),
(1575, '791703717996872832', 'mahmudmohad95@gmail.com', 250, 1409, 'Refund', '2024-07-23 09:18:16', 1, 1),
(1576, '791703717996872832', 'mahmudmohad95@gmail.com', 250, -833, 'Refund', '2024-07-23 09:18:16', 1, 1),
(1577, '365849369908134481', 'raypeter053@gmail.com', 100, 0, 'credit', '2024-07-23 21:00:24', 1, 0),
(1578, '497789516771300740', 'mahmudmohad95@gmail.com', 394, 1409, 'Refund', '2024-07-23 21:04:02', 1, 1),
(1579, '497789516771300740', 'mahmudmohad95@gmail.com', 394, -833, 'Refund', '2024-07-23 21:04:02', 1, 1),
(1581, '827317639576585131', 'mahmudmohad95@gmail.com', 344, 1065, 'debit', '2024-07-23 21:04:51', 1, 1),
(1582, '827317639576585131', 'mahmudmohad95@gmail.com', 344, -1177, 'debit', '2024-07-23 21:04:51', 1, 1),
(1583, '594299274505719038', 'hassankamzahab@gmail.com', 49, 10402, 'Refund', '2024-07-25 19:14:15', 1, 1),
(1584, '945868144630304191', 'mahmudmohad95@gmail.com', 500, 565, 'transfered', '2024-07-27 19:20:05', 1, 1),
(1585, '945868144630304191', 'mahmudmohad95@gmail.com', 500, -1677, 'transfered', '2024-07-27 19:20:05', 1, 1),
(1587, '945868144630304191', 'insaffanigltd@gmail.com', 500, 0, 'recieved', '2024-07-27 19:20:05', 1, 0),
(1588, '874712730272077505', 'insaffanigltd@gmail.com', 500, 0, 'transfered', '2024-07-27 19:23:26', 1, 1),
(1589, '874712730272077505', 'hassankamzahab@gmail.com', 500, 10402, 'recieved', '2024-07-27 19:23:26', 1, 0),
(1590, '488040793240265513', 'mahmudmohad95@gmail.com', 250, 565, 'Refund', '2024-07-27 19:28:36', 1, 1),
(1591, '488040793240265513', 'mahmudmohad95@gmail.com', 250, -1677, 'Refund', '2024-07-27 19:28:36', 1, 1),
(1592, '553419138753481390', 'mahmudmohad95@gmail.com', 250, 315, 'debit', '2024-07-27 19:37:03', 1, 1),
(1593, '553419138753481390', 'mahmudmohad95@gmail.com', 250, -1927, 'debit', '2024-07-27 19:37:03', 1, 1),
(1594, '618471562830262313', 'mahmudmohad95@gmail.com', 150, 165, 'debit', '2024-07-27 20:11:10', 1, 1),
(1595, '618471562830262313', 'mahmudmohad95@gmail.com', 150, -2077, 'debit', '2024-07-27 20:11:10', 1, 1),
(1596, '241349719259982102', 'orkuma.mike70@gmail.com', 100, 0, 'credit', '2024-08-05 18:50:15', 1, 0),
(1597, 'cac_payment_1723602734', 'emmanueljunior433@gmail.com', 45000, 55000, 'debit', '2024-08-14 02:32:14', 1, 0),
(1598, 'cac_payment_1723603391', 'emmanueljunior433@gmail.com', 17000, 38000, 'debit', '2024-08-14 02:43:11', 1, 0),
(1599, 'cac_payment_1723647003', 'emmanueljunior433@gmail.com', 17000, 21000, 'debit', '2024-08-14 14:50:03', 1, 0),
(1600, 'cac_payment_1723647071', 'emmanueljunior433@gmail.com', 17000, 4000, 'debit', '2024-08-14 14:51:11', 1, 0),
(1601, 'cac_payment_1723701931', 'emmanueljunior433@gmail.com', 45000, 55000, 'debit', '2024-08-15 06:05:31', 1, 0),
(1602, 'cac_payment_1723706243', 'emmanueljunior433@gmail.com', 45000, 10000, 'debit', '2024-08-15 07:17:23', 1, 0),
(1603, 'cac_payment_1723706366', 'emmanueljunior433@gmail.com', 45000, 55000, 'debit', '2024-08-15 07:19:26', 1, 0),
(1604, 'cac_payment_1723706428', 'emmanueljunior433@gmail.com', 17000, 38000, 'debit', '2024-08-15 07:20:28', 1, 0),
(1605, 'cac_payment_1723706913', 'emmanueljunior433@gmail.com', 17000, 21000, 'debit', '2024-08-15 07:28:33', 1, 0),
(1606, 'cac_payment_1723707198', 'emmanueljunior433@gmail.com', 17000, 193000, 'debit', '2024-08-15 07:33:18', 1, 0),
(1607, 'cac_payment_1723707270', 'emmanueljunior433@gmail.com', 45000, 148000, 'debit', '2024-08-15 07:34:30', 1, 0),
(1608, '928854706794050383', 'hassankamzahab@gmail.com', 5000, 10902, 'credit', '2024-08-15 09:21:31', 1, 0),
(1609, '568965009734855219', 'hassankamzahab@gmail.com', 505, 10397, 'cashOut', '2024-08-15 09:29:30', 1, 1),
(1610, '752678777758951303', 'mahmudmohad95@gmail.com', 5000, 165, 'credit', '2024-08-15 17:20:12', 1, 0),
(1611, '752678777758951303', 'mahmudmohad95@gmail.com', 5000, -2077, 'credit', '2024-08-15 17:20:12', 1, 0),
(1612, '694767664137516331', 'hassanabdullahiahmad7@gmail.com', 5000, 5000, 'credited by Easy Finder', '2024-08-23 13:16:34', 1, 1),
(1613, '940115657284876382', 'mahmudmohad95@gmail.com', 200, 365, 'credited by Easy Finder', '2024-08-23 14:19:03', 1, 1),
(1614, '940115657284876382', 'mahmudmohad95@gmail.com', 200, -1877, 'credited by Easy Finder', '2024-08-23 14:19:03', 1, 1),
(1615, '810125975554369259', 'mahmudmohad95@gmail.com', 1000, 1365, 'credited by Easy Finder', '2024-08-30 14:48:16', 1, 1),
(1616, '810125975554369259', 'mahmudmohad95@gmail.com', 1000, -877, 'credited by Easy Finder', '2024-08-30 14:48:16', 1, 1),
(1617, '794539202690614284', 'paulsonbosah@gmail.com', 1000, 0, 'credit', '2024-09-10 14:29:07', 1, 0),
(1618, '831114169175212851', 'paulsonbosah@gmail.com', 1000, 0, 'credit', '2024-09-10 14:30:21', 1, 0),
(1619, '950897721248057286', 'insaffanigltd@gmail.com', 1000, 0, 'credit', '2024-09-10 22:55:59', 1, 0),
(1620, '728243886294616851', 'insaffanigltd@gmail.com', 2000, 0, 'credit', '2024-09-27 11:46:21', 1, 0),
(1621, '862618130630239912', 'insaffanigltd@gmail.com', 2000, 0, 'credit', '2024-09-27 14:54:05', 1, 0),
(1622, '241201337572517213', 'ajuwonoluwa@gmail.com', 500, 0, 'credit', '2024-10-20 10:29:20', 1, 0),
(1623, '230988526257314928', 'insaffanigltd@gmail.com', 2000, 2000, 'credit', '2024-10-31 21:35:32', 1, 1);

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
(2, '238873580333759870', 'a.a.adeniyi1997@gmail.com', 'azzeetech.it@gmail.com', 200, '2022-01-10 11:40:14', 0),
(3, '292954762321417713', 'azzeetech.it@gmail.com', 'a.a.adeniyi1997@gmail.com', 20, '2022-01-10 11:49:44', 0),
(4, '621227316927461677', 'azzeetech.it@gmail.com', 'azzeetech.it@gmail.com', 50, '2022-01-10 11:56:08', 0),
(5, '677555780883172282', 'azzeetech.it@gmail.com', 'a.a.adeniyi1997@gmail.com', 10, '2022-01-18 21:18:25', 0),
(6, '856483446951036997', 'azzeetech.it@gmail.com', 'a.a.adeniyi1997@gmail.com', 500, '2022-01-18 21:19:48', 0),
(7, '20220706160lfglu', 'intellisensehq@gmail.com', 'saadnasir470@gmail.com', 115, '2022-07-06 15:27:31', 0),
(8, '20220706160lpdlp', 'intellisensehq@gmail.com', 'princeishaq53@gmail.com', 50, '2022-07-06 15:36:49', 0),
(9, '20220706190ccmhr', 'intellisensehq@gmail.com', 'docty747@gmail.com', 150, '2022-07-06 18:29:14', 0),
(10, '20220707060qwjse', 'azzeetech.it@gmail.com', 'muhsinnasirsheshe@gmail.com', 125, '2022-07-07 05:38:32', 0),
(11, '20220707070iawce', 'azzeetech.it@gmail.com', 'mubarakmusa029@gmail.com', 115, '2022-07-07 06:15:56', 0),
(12, '20220707070iawce', 'azzeetech.it@gmail.com', 'mubarakmusa029@gmail.com', 115, '2022-07-07 06:16:32', 0),
(13, '20220707070gufam', 'azzeetech.it@gmail.com', 'mubarakmusa029@gmail.com', 5, '2022-07-07 06:23:21', 0),
(14, '20220707120weryo', 'azzeetech.it@gmail.com', 'sanilawanumar@gmail.com', 500, '2022-07-07 11:25:23', 0),
(15, '20220708090zlvyq', 'azzeetech.it@gmail.com', 'Abdulhamidibrahim24@gmail.com', 125, '2022-07-08 08:39:50', 0),
(16, '20220709190kntic', 'azzeetech.it@gmail.com', 'kaidanaka@gmail.com', 2200, '2022-07-09 18:58:44', 0),
(17, '20220709210xxaxd', 'azzeetech.it@gmail.com', 'umarreal411@gmail.com', 300, '2022-07-09 20:11:58', 0),
(18, '20220710150iknvx', 'azzeetech.it@gmail.com', 'ayshamuhammad5318@gmail.com', 5, '2022-07-10 14:16:57', 0),
(19, '20220710160qjwxm', 'azzeetech.it@gmail.com', 'hamisusulaimanimam@gmail.com', 1000, '2022-07-10 15:08:53', 0),
(20, '20220710180xupdo', 'azzeetech.it@gmail.com', 'muhammadlawal6767@gmail.com', 115, '2022-07-10 17:33:48', 0),
(21, '20220711210imrdx', 'azzeetech.it@gmail.com', 'salmanusman089@gmail.com', 1000, '2022-07-11 20:47:48', 0),
(22, '20220711220ggpeb', 'azzeetech.it@gmail.com', 'kakyansoro87@gmail.com', 5000, '2022-07-11 21:03:15', 0),
(23, '20220711220rtjum', 'azzeetech.it@gmail.com', 'saadnasir470@gmail.com', 550, '2022-07-11 21:21:13', 0),
(24, '20220711230jmugt', 'azzeetech.it@gmail.com', 'princeishaq53@gmail.com', 200, '2022-07-11 22:11:08', 0),
(25, '20220712120wgarr', 'azzeetech.it@gmail.com', 'mz1929@yahoo.com', 500, '2022-07-12 11:22:59', 0),
(26, '20220712160nuyrc', 'azzeetech.it@gmail.com', 'muhammadiabubakar5@gmail.com', 115, '2022-07-12 15:59:20', 0),
(27, '20220714190xhatn', 'azzeetech.it@gmail.com', 'hamisusulaimanimam@gmail.com', 2000, '2022-07-14 18:59:05', 0),
(28, '20220715090igouq', 'azzeetech.it@gmail.com', 'hamisusulaimanimam@gmail.com', 4000, '2022-07-15 08:53:31', 0),
(29, '20220717110ocodc', 'azzeetech.it@gmail.com', 'alsadiqibrahim03@gmail.com', 385, '2022-07-17 10:24:08', 0),
(30, '20220717150kshmw', 'azzeetech.it@gmail.com', 'muhammadibrahimmuhammed81@gmail.com', 500, '2022-07-17 14:41:23', 0),
(31, '20220719220ztlxq', 'azzeetech.it@gmail.com', 'saadnasir470@gmail.com', 1050, '2022-07-19 21:26:28', 0),
(32, '20220720160mrxmu', 'azzeetech.it@gmail.com', 'mz1929@yahoo.com', 300, '2022-07-20 15:01:22', 0),
(33, '20220720210ytlqc', 'azzeetech.it@gmail.com', 'mz1929@yahoo.com', 200, '2022-07-20 20:27:21', 0),
(34, '20220721210fndkf', 'azzeetech.it@gmail.com', 'alsadiqibrahim03@gmail.com', 1000, '2022-07-21 20:33:34', 0),
(35, '20220722100enlrv', 'azzeetech.it@gmail.com', 'mz1929@yahoo.com', 500, '2022-07-22 09:01:23', 0),
(36, '20220722100lrxda', 'azzeetech.it@gmail.com', 'sanizakariumar@gmail.com', 50, '2022-07-22 09:39:51', 0),
(37, '20220722120mioxf', 'azzeetech.it@gmail.com', 'hamisusulaimanimam@gmail.com', 1500, '2022-07-22 11:12:28', 0),
(38, '20220723180jhcks', 'azzeetech.it@gmail.com', 'hamisusulaimanimam@gmail.com', 500, '2022-07-23 17:21:29', 0),
(39, '20220724200kyord', 'azzeetech.it@gmail.com', 'hamisusulaimanimam@gmail.com', 1400, '2022-07-24 19:32:22', 0),
(40, '20220725100kuoms', 'azzeetech.it@gmail.com', 'ahmadhy44@gmail.com', 500, '2022-07-25 09:26:48', 0),
(41, '20220725200ohwmb', 'azzeetech.it@gmail.com', 'haliludada@yahoo.com', 500, '2022-07-25 19:46:35', 0),
(42, '20220725200ekhal', 'azzeetech.it@gmail.com', 'muhammadraji@gmail.com', 500, '2022-07-25 19:49:16', 0),
(43, '20220725210jsthn', 'azzeetech.it@gmail.com', 'umarreal411@gmail.com', 2500, '2022-07-25 20:33:11', 0),
(44, '20220726210hwblx', 'azzeetech.it@gmail.com', 'mz1929@yahoo.com', 500, '2022-07-26 20:16:46', 0),
(45, '20220727160kdgah', 'azzeetech.it@gmail.com', 'princeishaq53@gmail.com', 210, '2022-07-27 15:41:14', 0),
(46, '20220728200dpowt', 'azzeetech.it@gmail.com', 'abdulkarimahmad303@gmail.com', 2500, '2022-07-28 19:14:03', 0),
(47, '20220730090ifymg', 'azzeetech.it@gmail.com', 'mz1929@yahoo.com', 500, '2022-07-30 08:29:08', 0),
(48, '20220731140umwad', 'azzeetech.it@gmail.com', 'muhammadraji@gmail.com', 200, '2022-07-31 13:53:59', 0),
(49, '20220803200vsqjh', 'azzeetech.it@gmail.com', 'abdulkarimahmad303@gmail.com', 350, '2022-08-03 19:29:05', 0),
(50, '20220804180mtfkn', 'azzeetech.it@gmail.com', 'sanizakariumar@gmail.com', 3500, '2022-08-04 17:15:08', 0),
(51, '20220804200ncbty', 'azzeetech.it@gmail.com', 'abdulkarimahmad303@gmail.com', 500, '2022-08-04 19:13:12', 0),
(52, '20220805160pucda', 'azzeetech.it@gmail.com', 'abdulkarimahmad303@gmail.com', 500, '2022-08-05 15:37:49', 0),
(53, '20220806200hrcew', 'azzeetech.it@gmail.com', 'hamisusulaimanimam@gmail.com', 500, '2022-08-06 19:22:00', 0),
(54, '20220809210xhxkt', 'intellisensehq@gmail.com', 'sanilawanumar@gmail.com', 1000, '2022-08-09 20:22:22', 0),
(55, '20220810060ccblk', 'azzeetech.it@gmail.com', 'hamisusulaimanimam2022@gmail.com', 3885, '2022-08-10 05:23:47', 0),
(56, '20220814190wtjch', 'azzeetech.it@gmail.com', 'sanikaojeimran@gmai.com', 500, '2022-08-14 18:27:24', 0),
(57, '20220815220zzsqx', 'azzeetech.it@gmail.com', 'hamisusulaimanimam2022@gmail.com', 2675, '2022-08-15 21:05:04', 0),
(58, '20220819110sqblp', 'azzeetech.it@gmail.com', 'hamisusulaimanimam2022@gmail.com', 2212, '2022-08-19 10:30:18', 0),
(59, '20220823190ldkba', 'azzeetech.it@gmail.com', 'abdulkarimahmad303@gmail.com', 500, '2022-08-23 18:06:36', 0),
(60, '20220823220ubuhx', 'azzeetech.it@gmail.com', 'kaidanaka@gmail.com', 1500, '2022-08-23 21:39:05', 0),
(61, '20220824090jltnk', 'azzeetech.it@gmail.com', 'kakyansoro87@gmail.com', 7000, '2022-08-24 08:09:34', 0),
(62, '20220830230jvcvz', 'azzeetech.it@gmail.com', 'sabiuumarmuhammad580@gmail.com', 5000, '2022-08-30 22:14:19', 0),
(63, '20220901200rqlsq', 'azzeetech.it@gmail.com', 'sabiuumarmuhammad580@gmail.com', 6000, '2022-09-01 19:49:10', 0),
(64, '20220904210uzuci', 'azzeetech.it@gmail.com', 'sabiuumarmuhammad580@gmail.com', 2397, '2022-09-04 20:15:07', 0),
(65, '20220906210uumft', 'azzeetech.it@gmail.com', 'sabiuumarmuhammad580@gmail.com', 2000, '2022-09-06 20:12:46', 0),
(66, '20220910130ghmeh', 'azzeetech.it@gmail.com', 'jamilusha77@gmail.com', 1000, '2022-09-10 12:40:16', 0),
(67, '20220910210fgyaj', 'azzeetech.it@gmail.com', 'ahmadusulengelzarma@gmail.com', 300, '2022-09-10 20:09:37', 0),
(68, '20220917120wjlsz', 'azzeetech.it@gmail.com', 'princeishaq53@gmail.com', 200, '2022-09-17 11:28:47', 0),
(69, '20220922100ofjvr', 'azzeetech.it@gmail.com', 'sabiuumarmuhammad580@gmail.com', 2000, '2022-09-22 09:53:38', 0),
(70, '20220924180qozof', 'azzeetech.it@gmail.com', 'sabiuumarmuhammad580@gmail.com', 400, '2022-09-24 17:09:10', 0),
(71, '768918970787470700', 'softwareclone@gmail.com', 'ahmadyakubu014499@gmail.com', 9200, '2022-11-23 14:02:29', 0),
(72, '768918970787470700', 'softwareclone@gmail.com', 'ahmadyakubu014499@gmail.com', 9200, '2022-11-23 14:02:30', 0),
(73, '20221127170plcly', 'softwareclone@gmail.com', 'kakyansoro87@gmail.com', 2000, '2022-11-27 16:20:56', 0),
(74, '20221128110jkqbv', 'softwareclone@gmail.com', 'ahmadyakubu014499@gmail.com', 12000, '2022-11-28 10:34:51', 0),
(75, '945868144630304191', 'mahmudmohad95@gmail.com', 'insaffanigltd@gmail.com', 500, '2024-07-27 19:20:05', 0),
(76, '874712730272077505', 'insaffanigltd@gmail.com', 'hassankamzahab@gmail.com', 500, '2024-07-27 19:23:26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_tbl`
--

CREATE TABLE `wallet_tbl` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `balance` int(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `last_transanction` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_tbl`
--

INSERT INTO `wallet_tbl` (`id`, `user_id`, `balance`, `status`, `last_transanction`) VALUES
(10, 'azzeetech.it@gmail.com', 903, 1, '2022-01-09 17:05:56'),
(11, 'a.a.adeniyi1997@gmail.com', 0, 1, '2022-01-10 11:31:42'),
(22, 'chrisktivity@gmail.com', 0, 1, '2022-01-10 16:20:01'),
(29, 'syntaxbytesolution@gmail.com', 0, 1, '2022-01-10 17:17:44'),
(30, 'ak_salau4real@yahoo.com', 0, 1, '2022-01-10 17:19:08'),
(31, 'oyewoleabisolar@gmail.com', 0, 1, '2022-01-10 17:36:03'),
(32, 'adelekeadetunji.a@gmail.com', 0, 1, '2022-01-10 17:39:52'),
(33, 'akankeade.it@gmail.com', 2, 1, '2022-01-10 19:16:32'),
(34, 'atechcomputersnng@gmail.com', 3, 1, '2022-01-10 21:53:13'),
(35, 'fredosh2004@gmail.com', 3, 1, '2022-01-10 22:14:57'),
(36, 'adeolaoluwaseun24@gmail.com', 4, 1, '2022-01-11 09:39:07'),
(37, 'kingalongemike24@gmail.com', 0, 1, '2022-01-12 09:46:42'),
(38, 'banjoisraeloluwasegun@gmail.com', 7, 1, '2022-01-12 13:41:38'),
(39, 'ajayitemitope1@outlook.com', 3, 1, '2022-01-13 11:12:09'),
(40, 'thomasdebayo@gmail.com', 0, 1, '2022-01-13 12:11:35'),
(41, 'ningikamil51@gmail.com', 0, 1, '2022-01-14 11:26:29'),
(42, 'googledemo@utiplus.com', 0, 1, '2022-01-17 08:38:15'),
(43, 'funmilayofagbola@gmail.com', 2, 1, '2022-01-17 13:09:37'),
(44, 'oshunduntaiwo@gmail.com', 0, 1, '2022-01-18 15:40:40'),
(45, 'adeniyi@taweer.com', 0, 1, '2022-01-19 16:38:54'),
(46, 'mahmudmohad95@gmail.com', 1365, 1, '2022-06-21 12:52:41'),
(47, 'intellisensehq@gmail.com', 179017, 1, '2022-07-04 11:47:07'),
(48, 'alhassann01@gmail.com', 0, 1, '2022-07-04 15:29:38'),
(49, 'abdulkarimahmad303@gmail.com', 45, 1, '2022-07-05 18:22:45'),
(50, 'ibsumaila03@gmail.com', 0, 1, '2022-07-06 11:42:37'),
(51, 'mz1929@yahoo.com', 30, 1, '2022-07-06 12:39:20'),
(52, 'saadnasir470@gmail.com', 9, 1, '2022-07-06 13:55:52'),
(53, 'princeishaq53@gmail.com', 25, 1, '2022-07-06 15:33:27'),
(54, 'docty747@gmail.com', 25, 1, '2022-07-06 16:50:15'),
(55, 'muhsinnasirsheshe@gmail.com', 27, 1, '2022-07-07 05:31:17'),
(56, 'mubarakmusa029@gmail.com', 5, 1, '2022-07-07 06:12:42'),
(57, 'sanilawanumar@gmail.com', 182, 1, '2022-07-07 11:22:19'),
(58, 'umarreal411@gmail.com', 53, 1, '2022-07-07 19:02:36'),
(59, 'Abdulhamidibrahim24@gmail.com', 10, 1, '2022-07-08 08:32:08'),
(60, 'kakyansoro87@gmail.com', 2543, 1, '2022-07-08 08:49:26'),
(61, 'kaidanaka@gmail.com', 186, 1, '2022-07-09 17:46:21'),
(62, 'bosunjj@gmail.com', 0, 1, '2022-07-10 13:00:22'),
(63, 'ayshamuhammad5318@gmail.com', 5, 1, '2022-07-10 14:12:38'),
(64, 'hamisusulaimanimam2022@gmail.com', 1978, 1, '2022-07-10 15:00:59'),
(65, 'muhammadlawal6767@gmail.com', 0, 1, '2022-07-10 17:19:46'),
(66, 'alsadiqibrahim03@gmail.com', 94, 1, '2022-07-11 10:52:28'),
(67, 'hussainitayyib@gmail.com', 0, 1, '2022-07-11 17:37:29'),
(68, 'abbaclass31@gmail.com', 0, 1, '2022-07-11 18:12:19'),
(69, 'salmanusman089@gmail.com', 20, 1, '2022-07-11 20:35:57'),
(70, 'muhammadiabubakar5@gmail.com', 2, 1, '2022-07-12 12:55:55'),
(71, 'husseinumar007@gmail.com', 0, 1, '2022-07-12 13:45:56'),
(72, 'mustaphayusufjibril@gmail.com', 0, 1, '2022-07-13 21:24:42'),
(73, 'Abulazizahmad66@gmail.com', 0, 1, '2022-07-15 07:03:27'),
(74, 'abdulganiyurabe73456@gmail.com', 0, 1, '2022-07-16 16:42:21'),
(75, 'muhammadibrahimmuhammed81@gmail.com', 30, 1, '2022-07-17 14:29:09'),
(76, 'hassanotu1986@gmail.com', 0, 1, '2022-07-19 19:37:24'),
(77, 'abdulhamidrm@gmail.com', 0, 1, '2022-07-21 14:21:00'),
(78, 'sanizakariumar@gmail.com', 373, 1, '2022-07-22 09:36:27'),
(79, 'ahmadnurahussain13@gmail.com', 0, 1, '2022-07-23 22:47:05'),
(80, 'shafiualiyu005@yahoo.com', 0, 1, '2022-07-24 07:54:47'),
(81, 'muhammadraji@gmail.com', 21, 1, '2022-07-24 13:07:20'),
(82, 'ahmadhy44@gmail.com', 10, 1, '2022-07-24 18:36:45'),
(83, 'haliludada@yahoo.com', 10, 1, '2022-07-25 00:07:26'),
(84, 'mahmudmuhammad.mm@gmail.com', 0, 1, '2022-08-09 16:52:31'),
(85, 'abbamooser@gmail.com', 0, 1, '2022-08-10 09:09:16'),
(86, 'sanikaojeimran@gmai.com', 500, 1, '2022-08-14 18:24:51'),
(87, 'sabiuumarmuhammad580@gmail.com', 175, 1, '2022-08-30 21:59:13'),
(88, 'jamilusha77@gmail.com', 125, 1, '2022-09-10 12:27:35'),
(89, 'ahmadusulengelzarma@gmail.com', 1, 1, '2022-09-10 20:04:35'),
(90, 'sagiribrahim416@gmail.com', 0, 1, '2022-09-19 14:44:26'),
(91, 'softwareclone@gmail.com', 463058, 1, '2022-11-12 02:31:53'),
(92, 'Shafiualiyualiyu005@gmail.com', 0, 1, '2022-11-12 08:53:06'),
(93, 'ahmadyakubu014499@gmail.com', 1582, 1, '2022-11-16 17:40:48'),
(94, 'Shafiualiyualiyu005@yahoo.com', 0, 1, '2022-11-28 13:05:56'),
(95, 'itineryconsults@gmail.com', 0, 1, '2022-12-20 07:01:56'),
(96, 'hurlleyz20@gmail.com', 0, 1, '2022-12-22 11:38:49'),
(97, 'ameeralhassan79@gmail.com', 0, 1, '2023-02-10 16:32:28'),
(98, 'intellisensesoft@gmail.com', 0, 1, '2023-02-23 19:54:55'),
(99, 'usmanmurtalausman44@gmail.com', 0, 1, '2023-05-08 17:35:19'),
(100, 'admin@gmail.com', 0, 1, '2023-11-16 18:08:33'),
(101, 'softwareclone2024@gmail.com', 0, 1, '2024-07-18 07:09:02'),
(102, 'mahmudmohad95@gmail.com', -877, 1, '2024-07-20 11:06:05'),
(103, 'hassankamzahab@gmail.com', 10397, 1, '2024-07-20 11:57:53'),
(104, 'kamzahabsolutions@gmail.com', 5000, 1, '2024-07-20 14:16:17'),
(105, 'insaffanigltd@gmail.com', 2500, 1, '2024-07-22 19:49:36'),
(106, 'raypeter053@gmail.com', 0, 1, '2024-07-23 20:59:02'),
(107, 'orkuma.mike70@gmail.com', 0, 1, '2024-08-05 11:36:19'),
(108, 'helloworld@gmail.com', 0, 1, '2024-08-08 09:23:53'),
(109, 'emmanueljunior433@gmail.com', 148000, 1, '2024-08-12 11:08:16'),
(110, 'codebest@gmail.com', 0, 1, '2024-08-13 08:48:48'),
(111, 'cac20@gmail.com', 0, 1, '2024-08-14 05:10:17'),
(112, 'intell@gmail.com', 0, 1, '2024-08-15 08:47:51'),
(113, 'hassanabdullahiahmad7@gmail.com', 5000, 1, '2024-08-16 15:52:56'),
(114, 'paulsonbosah@gmail.com', 0, 1, '2024-09-10 14:25:04'),
(115, 'akinbolawa90@gmail.com', 0, 1, '2024-09-15 15:33:23'),
(116, 'ajuwonoluwa@gmail.com', 0, 1, '2024-10-15 11:35:47'),
(117, 'tjkndl7@gmail.com', 0, 1, '2024-10-20 05:42:30'),
(118, 'eduos2024@gmail.com', 0, 1, '2024-11-16 16:26:59'),
(119, 'xainzofficial@gmail.com', 0, 1, '2024-11-17 17:42:28'),
(120, 'umarhintmedia@gmail.com', 0, 1, '2024-11-18 13:12:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_role_tbl`
--
ALTER TABLE `admin_role_tbl`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cash_out_tbl`
--
ALTER TABLE `cash_out_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `cash_out_transfer_reciept`
--
ALTER TABLE `cash_out_transfer_reciept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_cac_registration_tbl`
--
ALTER TABLE `company_cac_registration_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discount_tbl`
--
ALTER TABLE `discount_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `edutech_settings`
--
ALTER TABLE `edutech_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `payment_discount_tbl`
--
ALTER TABLE `payment_discount_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_history_tbl`
--
ALTER TABLE `payment_history_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `referal_earn_transaction_tbl`
--
ALTER TABLE `referal_earn_transaction_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `referal_tbl`
--
ALTER TABLE `referal_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `result_checker_pin_sell_tbl`
--
ALTER TABLE `result_checker_pin_sell_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `save_pin_and_token_buy`
--
ALTER TABLE `save_pin_and_token_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sme_data_tbl`
--
ALTER TABLE `sme_data_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `sme_data_type_tbl`
--
ALTER TABLE `sme_data_type_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sme_network_tbl`
--
ALTER TABLE `sme_network_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sub_url_link_tbl`
--
ALTER TABLE `sub_url_link_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tbl_token_auth`
--
ALTER TABLE `tbl_token_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `transactions_tbl`
--
ALTER TABLE `transactions_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `trans_status_tbl`
--
ALTER TABLE `trans_status_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `url_link_tbl`
--
ALTER TABLE `url_link_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `wallet_history_tbl`
--
ALTER TABLE `wallet_history_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1624;

--
-- AUTO_INCREMENT for table `wallet_money_transfer_tbl`
--
ALTER TABLE `wallet_money_transfer_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `wallet_tbl`
--
ALTER TABLE `wallet_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
