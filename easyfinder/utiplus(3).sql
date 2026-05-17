-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2023 at 09:33 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utiplus`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(97, 3000, 30, '0034751694', 'ARIKEWUYOIMAM ADAM', '058', 'RCP_bfgrtvs62w35cwi', '496006', '27624372', 'oyewalejohn@gmail.com', '835626551507658765', '', '', NULL, '2022-03-22 09:02:09', 0, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `edutech_settings`
--

INSERT INTO `edutech_settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'website_url', 'http://localhost/sanwo/'),
(2, 'website_title', 'UTIPLUS'),
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
(23, 'paystack_api', ''),
(24, 'reloaddly_api', 'eyJraWQiOiIwMDA1YzFmMC0xMjQ3LTRmNmUtYjU2ZC1jM2ZkZDVmMzhhOTIiLCJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMDM0NiIsImlzcyI6Imh0dHBzOi8vcmVsb2FkbHkuYXV0aDAuY29tLyIsImh0dHBzOi8vcmVsb2FkbHkuY29tL3NhbmRib3giOmZhbHNlLCJodHRwczovL3JlbG9hZGx5LmNvbS9wcmVwYWlkVXNlcklkIjoiMTAzNDYiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMiLCJhdWQiOiJodHRwczovL3RvcHVwcy1oczI1Ni5yZWxvYWRseS5jb20iLCJuYmYiOjE2NzQ3Mzk4MTksImF6cCI6IjEwMzQ2Iiwic2NvcGUiOiJzZW5kLXRvcHVwcyByZWFkLW9wZXJhdG9ycyByZWFkLXByb21vdGlvbnMgcmVhZC10b3B1cHMtaGlzdG9yeSByZWFkLXByZXBhaWQtYmFsYW5jZSByZWFkLXByZXBhaWQtY29tbWlzc2lvbnMiLCJleHAiOjE2Nzk5MjAyMTksImh0dHBzOi8vcmVsb2FkbHkuY29tL2p0aSI6IjU0NDM5MjllLTc0YmItNDU2Yy05ZGVjLTUwOWNlMzBhNmM1NyIsImlhdCI6MTY3NDczOTgxOSwianRpIjoiYTYxNWVkZWUtNDI0Mi00MDRkLTgxZjctYjEzYmUwNWJjMWE2In0.OYz85G9a8SmSilM41SppeO08EZbJXOzsRS_pMevKzwI'),
(25, 'vtpass_username', 'kwikhub247@gmail.com'),
(26, 'vtpass_password', '$800@VTPass247');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(184, '926437010340185765', 50, 'a.a.adeniyi1997@gmail.com', 0, 'pending', 1, '2022-01-30 19:14:25');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `referal_tbl`
--

INSERT INTO `referal_tbl` (`id`, `referal`, `referee`, `status`, `date_refer`) VALUES
(4, 'faea4e0421343dc375631b6de8ad6aaa', '1a657588263da042203624cdcea97b3b', 1, '2022-01-15 13:51:06'),
(5, 'faea4e0421343dc375631b6de8ad6aaa', '83984cea2833f99e8509c29b0446cb4d', 1, '2022-01-19 16:38:54');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `save_pin_and_token_buy`
--

INSERT INTO `save_pin_and_token_buy` (`id`, `pin`, `serial_no`, `email`, `trans_id`, `status`, `date_buy`, `super_admin`) VALUES
(1, '274619254068', NULL, 'azzeetech.it@gmail.com', '572933866254035656', 1, '2022-01-18 15:38:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sme_data_tbl`
--

CREATE TABLE `sme_data_tbl` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `network_id` int(11) NOT NULL,
  `direct_price` float NOT NULL,
  `our_price` int(11) NOT NULL,
  `data_bundle` varchar(255) NOT NULL,
  `data_duration` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sme_data_tbl`
--

INSERT INTO `sme_data_tbl` (`id`, `plan_id`, `network_id`, `direct_price`, `our_price`, `data_bundle`, `data_duration`, `status`) VALUES
(59, 0, 0, 0, 15, 'data_bundle', 'data_duration', 1),
(60, 45, 1, 107, 130, '500MB (CG) -  30days', '1 month', 1),
(61, 46, 1, 205, 230, '1GB (CG) - 30days', '1 month', 1),
(62, 47, 1, 410, 440, '2GB (CG) - 30days', '1 month', 1),
(63, 48, 1, 615, 640, '3GB (CG) - 30days', '1 month', 1),
(64, 49, 1, 1025, 1050, '5GB (CG) - 30days', '1 month', 1),
(65, 50, 1, 117, 140, '500MB (SME) - 30days', '1 month', 1),
(66, 51, 1, 232, 255, '1GB (SME) - 30days', '1 month', 1),
(67, 52, 1, 464, 485, '2GB (SME) - 30days', '1 month', 1),
(68, 53, 1, 696, 720, '3GB (SME) - 30days ', '1 month', 1),
(69, 54, 1, 1160, 1180, '5GB (SME) - 30days', '1 month', 1),
(70, 55, 1, 2400.75, 2425, '6GB (Direct) - 30days', '1 month', 1),
(71, 56, 1, 2880.9, 2905, '10GB (Direct) - 30days', '1 month', 1),
(72, 57, 1, 3361.05, 3385, '12GB (Direct) -  30days', '1 month', 1),
(73, 58, 1, 1440.45, 1465, '3GB (Direct) -  30days', '1 month', 1),
(74, 82, 1, 4801.5, 4825, '20GB (Direct) -  30days', '1 month', 1),
(75, 83, 1, 960.3, 925, '1.5GB (Direct) -  30days', '1 month', 1),
(76, 84, 1, 1152.36, 1175, '2GB (Direct) -  30days', '1 month', 1),
(77, 85, 1, 1920.6, 1945, '4.5GB (Direct) -  30days', '1 month', 1),
(78, 86, 1, 94, 97, '100MB (Direct) -  1day', '1day', 1),
(79, 88, 1, 2051, 2075, '10GB (CG) -  30days', '1 month', 1),
(80, 91, 1, 2321, 2345, '10GB (SME) -  30days', '1 month', 1),
(81, 95, 1, 9603, 9625, '40GB (Direct) -  30days', '1 month', 1),
(82, 103, 1, 14404.5, 14425, '75GB (Direct) -  30days', '1 month', 1),
(83, 59, 2, 420.75, 445, '1.35GB (Direct) -  14days', '14days', 1),
(84, 60, 2, 841.5, 865, '2.9GB (Direct) - 30days', '1 month', 1),
(85, 87, 2, 1262.25, 1285, '4.1GB (Direct) -  30days', '1 month', 1),
(86, 61, 2, 1683, 1705, '5.8GB (Direct) -  30days', '1 month', 1),
(87, 62, 2, 2103.75, 2125, '7.7GB (Direct) -  30days', '1 month', 1),
(88, 63, 2, 2524.5, 2545, '10GB (Direct) -  30days', '1 month', 1),
(89, 64, 2, 3366, 3390, '13.25GB (Direct) -  30days', '1 month', 1),
(90, 92, 2, 4207.5, 4230, '18.25GB (Direct) -  30days', '1 month', 1),
(91, 93, 2, 6732, 6755, '29.5GB (Direct) -  30days', '1 month', 1),
(92, 94, 2, 8415, 8440, '50GB (Direct) -  30days', '1 month', 1),
(93, 100, 2, 12622.5, 12645, '93GB (Direct) -  30days', '1 month', 1),
(94, 101, 2, 15147, 15170, '119GB (Direct) -  30days', '1 month', 1),
(95, 102, 2, 16830, 16850, '138GB (Direct) -  30days', '1 month', 1),
(96, 66, 3, 455.4, 480, '750MB (Direct) -  14days', '14days', 1),
(98, 68, 3, 1092.96, 1115, '2GB (Direct) -  30days', '1 month', 1),
(99, 69, 3, 1366.2, 1390, '3GB (Direct) -  30days', '1 month', 1),
(100, 70, 3, 1821.6, 1845, '4.5GB (Direct) -  30days', '1 month', 1),
(101, 71, 3, 2277, 2300, '6GB (Direct) -  30days', '1 month', 1),
(102, 72, 3, 2732.4, 2755, '10GB (Direct) -  30days', '1 month', 1),
(103, 73, 3, 3643.2, 3665, '11GB (Direct) -  30days', '1 month', 1),
(104, 74, 3, 4554, 4575, '20GB (Direct) -  30days', '1 month', 1),
(105, 96, 3, 9108, 9130, '40GB (Direct) -  30days', '1 month', 1),
(106, 97, 3, 13662, 13685, '75GB (Direct) -  30days', '1 month', 1),
(107, 75, 4, 415.8, 440, '500MB (Direct) -  30days', '1 month', 1),
(108, 76, 4, 831.6, 855, '1.5GB (Direct) -  30days', '1 month', 1),
(109, 77, 4, 997.92, 1020, '2GB (Direct) -  30days', '1 month', 1),
(110, 78, 4, 1247.4, 1270, '3GB (Direct) -  30days', '1 month', 1),
(111, 79, 4, 1663.2, 1685, '4.5GB (Direct) -  30days', '1 month', 1),
(112, 80, 4, 3326.4, 3350, '11GB (Direct) -  30days', '1 month', 1),
(113, 81, 4, 4158, 4180, '15GB (Direct) -  30days', '1 month', 1),
(114, 98, 4, 8316, 8340, '40GB (Direct) -  30days', '1 month', 1),
(115, 99, 4, 12474, 12495, '75GB (Direct) -  30days', '1 month', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sme_data_type_tbl`
--

CREATE TABLE `sme_data_type_tbl` (
  `id` int(11) NOT NULL,
  `data_type` varchar(255) NOT NULL,
  `network_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(29, 'dashboard/data-topup', 'Data Bundle', 18, 3, '', 0),
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
(61, '', 'Email Notification', 28, 1, '', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(59, 'azzeetech.it@gmail.com', '$2y$10$7F5Gv3KOXKwYEKgYETQw2.eOEmGdt4DjUuyD.iWQjvK5oRB8P4y/K', '$2y$10$q0l3MAOVBnDjHu7kERh5nuorvQ0dj2LciI/KoY1dS01o2MqEs2nyy', '2023-03-04 13:54:42', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trans_status_tbl`
--

CREATE TABLE `trans_status_tbl` (
  `id` int(11) NOT NULL,
  `respose` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `url_link_tbl`
--

INSERT INTO `url_link_tbl` (`id`, `link`, `link_name`, `has_sub`, `url_role`, `link_icon`, `status`) VALUES
(1, '', 'Manage Url Link', 1, 1, 'ti-email', 0),
(2, 'our-products', 'Help Centre', 0, 3, 'ti-email', 0),
(7, '', 'My Wallet', 1, 3, 'ti-wallet', 1),
(12, '', 'My Report', 1, 1, 'ti-email', 0),
(14, '.', 'Manage Users', 1, 1, 'ti-email', 1),
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
  `means_of_id` varchar(255) NOT NULL,
  `admin_role` varchar(11) NOT NULL DEFAULT '3',
  `super_admin` int(11) NOT NULL DEFAULT 1,
  `token` varchar(255) DEFAULT NULL,
  `expired_token` int(11) NOT NULL,
  `referal_token` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `date_join` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`id`, `sname`, `oname`, `password`, `pin`, `email`, `phone`, `school`, `address`, `state`, `town`, `means_of_id`, `admin_role`, `super_admin`, `token`, `expired_token`, `referal_token`, `status`, `date_join`) VALUES
(58, 'Adeniyi', 'Abdulaziz', '$2y$10$GUJnhrgflfqNRAO1UtXdl.wY8fb4I0ta4K//FG9cg0L/gL75TbTUi', '934b535800b1cba8f96a5d72f72f1611', 'azzeetech.it@gmail.com', '08148776644', 'wqswqswq', 'swwsxwsxw', 'Abia', 'ilorin', '000000', '1,2,3,4', 1, '$2y$10$RyeYkCqfJI.2ZRmU3iWHVus/qpbJbvrLJAHG5YKVfdqVuhqsIwcma', 0, 'faea4e0421343dc375631b6de8ad6aaa', 1, '2022-01-09 17:05:56');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wallet_tbl`
--

INSERT INTO `wallet_tbl` (`id`, `user_id`, `balance`, `status`, `last_transanction`) VALUES
(10, 'azzeetech.it@gmail.com', 915, 1, '2022-01-09 17:05:56'),
(11, 'a.a.adeniyi1997@gmail.com', 67, 1, '2022-01-10 11:31:42'),
(22, 'chrisktivity@gmail.com', 315, 1, '2022-01-10 16:20:01'),
(29, 'syntaxbytesolution@gmail.com', 1000, 1, '2022-01-10 17:17:44'),
(30, 'ak_salau4real@yahoo.com', 200, 1, '2022-01-10 17:19:08'),
(31, 'oyewoleabisolar@gmail.com', 150, 1, '2022-01-10 17:36:03'),
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
(43, 'funmilayofagbola@gmail.com', 200, 1, '2022-01-17 13:09:37'),
(44, 'oshunduntaiwo@gmail.com', 0, 1, '2022-01-18 15:40:40'),
(45, 'adeniyi@taweer.com', 10380, 1, '2022-01-19 16:38:54'),
(46, 'azzeetec@gmail.com', 0, 1, '2022-01-30 19:00:33'),
(47, 'johnibitoye@gmail.com', 3970, 1, '2022-02-02 14:31:27'),
(48, 'testme@gmail.com', 50, 1, '2022-02-20 17:26:53'),
(49, 'oyewalejohn@gmail.com', 3124, 1, '2022-03-05 09:33:54'),
(50, 'azzeetech.i2@gmail.com', 0, 1, '2023-02-02 12:43:57');

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
-- AUTO_INCREMENT for table `cash_out_tbl`
--
ALTER TABLE `cash_out_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `cash_out_transfer_reciept`
--
ALTER TABLE `cash_out_transfer_reciept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_tbl`
--
ALTER TABLE `discount_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `edutech_settings`
--
ALTER TABLE `edutech_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `payment_discount_tbl`
--
ALTER TABLE `payment_discount_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_history_tbl`
--
ALTER TABLE `payment_history_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `referal_earn_transaction_tbl`
--
ALTER TABLE `referal_earn_transaction_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `referal_tbl`
--
ALTER TABLE `referal_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `result_checker_pin_sell_tbl`
--
ALTER TABLE `result_checker_pin_sell_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `save_pin_and_token_buy`
--
ALTER TABLE `save_pin_and_token_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sme_data_tbl`
--
ALTER TABLE `sme_data_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tbl_token_auth`
--
ALTER TABLE `tbl_token_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `transactions_tbl`
--
ALTER TABLE `transactions_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `wallet_history_tbl`
--
ALTER TABLE `wallet_history_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=483;

--
-- AUTO_INCREMENT for table `wallet_money_transfer_tbl`
--
ALTER TABLE `wallet_money_transfer_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wallet_tbl`
--
ALTER TABLE `wallet_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
