-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2021 at 11:37 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gf_interview_task`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL,
  `charity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stage` text NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `charity_id`, `user_id`, `stage`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'Organisation Approval', '2021-05-01', '2021-05-18'),
(2, 4, 1, 'Organisation Approval', '2021-05-18', '2021-05-18'),
(3, 3, 3, 'Organisation Approval', '2021-05-18', '2021-05-18'),
(4, 5, 5, 'Organisational Approval', '2021-05-18', '2021-05-18'),
(5, 5, 5, 'Organisational Approval', '2021-05-18', '2021-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `charities`
--

CREATE TABLE `charities` (
  `charity_id` int(11) NOT NULL COMMENT 'The ID of the charity',
  `charity_name` varchar(255) NOT NULL COMMENT 'The name of the charity',
  `is_approved` tinyint(1) DEFAULT 0 COMMENT 'If the charity is approved for applications',
  `country_id` int(11) NOT NULL COMMENT 'The id of the country the charity is headquarted in'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `charities`
--

INSERT INTO `charities` (`charity_id`, `charity_name`, `is_approved`, `country_id`) VALUES
(3, 'My Giving Account', 0, 223),
(4, 'Oxford Kidney Unit Trust Fund', 0, 223),
(5, 'Human Values Foundation', 1, 221),
(6, 'Mudlarks Community Garden', 0, 150),
(7, 'Belfast Bible College', 0, 223),
(8, 'CILIP Career Development Group', 0, 223),
(9, 'The Inga Foundation', 0, 223),
(10, 'GMGA1', 0, 100),
(11, 'GMGA2', 0, 223),
(12, 'Amigos Worldwide', 0, 211),
(13, 'CAF charity account', 0, 223);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL COMMENT 'The ID of the country',
  `country_name` varchar(255) NOT NULL COMMENT 'The name of the country',
  `country_code` varchar(255) NOT NULL COMMENT 'The ISO code fo the charity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `country_code`) VALUES
(1, 'AFGHANISTAN', 'AFG'),
(2, 'ALBANIA', 'ALB'),
(3, 'ALGERIA', 'DZA'),
(4, 'AMERICAN SAMOA', 'ASM'),
(5, 'ANDORRA', 'AND'),
(6, 'ANGOLA', 'AGO'),
(7, 'ANGUILLA', 'AIA'),
(8, 'ANTARCTICA', 'ATA'),
(9, 'ANTIGUA AND BARBUDA', 'ATG'),
(10, 'ARGENTINA', 'ARG'),
(11, 'ARMENIA', 'ARM'),
(12, 'ARUBA', 'ABW'),
(13, 'AUSTRALIA', 'AUS'),
(14, 'AUSTRIA', 'AUT'),
(15, 'AZERBAIJAN', 'AZE'),
(16, 'BAHAMAS', 'BHS'),
(17, 'BAHRAIN', 'BHR'),
(18, 'BANGLADESH', 'BGD'),
(19, 'BARBADOS', 'BRB'),
(20, 'BELARUS', 'BLR'),
(21, 'BELGIUM', 'BEL'),
(22, 'BELIZE', 'BLZ'),
(23, 'BENIN', 'BEN'),
(24, 'BERMUDA', 'BMU'),
(25, 'BHUTAN', 'BTN'),
(26, 'BOLIVIA', 'BOL'),
(27, 'BOSNIA AND HERZEGOVINA', 'BIH'),
(28, 'BOTSWANA', 'BWA'),
(29, 'BOUVET ISLAND', 'BVT'),
(30, 'BRAZIL', 'BRA'),
(31, 'BRITISH INDIAN OCEAN TERRITORY', 'IOT'),
(32, 'BRUNEI DARUSSALAM', 'BRN'),
(33, 'BULGARIA', 'BGR'),
(34, 'BURKINA FASO', 'BFA'),
(35, 'BURUNDI', 'BDI'),
(36, 'CAMBODIA', 'KHM'),
(37, 'CAMEROON', 'CMR'),
(38, 'CANADA', 'CAN'),
(39, 'CAPE VERDE', 'CPV'),
(40, 'CAYMAN ISLANDS', 'CYM'),
(41, 'CENTRAL AFRICAN REPUBLIC', 'CAF'),
(42, 'CHAD', 'TCD'),
(43, 'CHILE', 'CHL'),
(44, 'CHINA', 'CHN'),
(45, 'CHRISTMAS ISLAND', 'CXR'),
(46, 'COCOS (KEELING) ISLANDS', 'CCK'),
(47, 'COLOMBIA', 'COL'),
(48, 'COMOROS', 'COM'),
(49, 'CONGO', 'COG'),
(50, 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'COD'),
(51, 'COOK ISLANDS', 'COK'),
(52, 'COSTA RICA', 'CRI'),
(53, 'COTE D\'IVOIRE', 'CIV'),
(54, 'CROATIA', 'HRV'),
(55, 'CUBA', 'CUB'),
(56, 'CYPRUS', 'CYP'),
(57, 'CZECH REPUBLIC', 'CZE'),
(58, 'DENMARK', 'DNK'),
(59, 'DJIBOUTI', 'DJI'),
(60, 'DOMINICA', 'DMA'),
(61, 'DOMINICAN REPUBLIC', 'DOM'),
(62, 'ECUADOR', 'ECU'),
(63, 'EGYPT', 'EGY'),
(64, 'EL SALVADOR', 'SLV'),
(65, 'EQUATORIAL GUINEA', 'GNQ'),
(66, 'ERITREA', 'ERI'),
(67, 'ESTONIA', 'EST'),
(68, 'ETHIOPIA', 'ETH'),
(69, 'FALKLAND ISLANDS (MALVINAS)', 'FLK'),
(70, 'FAROE ISLANDS', 'FRO'),
(71, 'FIJI', 'FJI'),
(72, 'FINLAND', 'FIN'),
(73, 'FRANCE', 'FRA'),
(74, 'FRENCH GUIANA', 'GUF'),
(75, 'FRENCH POLYNESIA', 'PYF'),
(76, 'FRENCH SOUTHERN TERRITORIES', 'ATF'),
(77, 'GABON', 'GAB'),
(78, 'GAMBIA', 'GMB'),
(79, 'GEORGIA', 'GEO'),
(80, 'GERMANY', 'DEU'),
(81, 'GHANA', 'GHA'),
(82, 'GIBRALTAR', 'GIB'),
(83, 'GREECE', 'GRC'),
(84, 'GREENLAND', 'GRL'),
(85, 'GRENADA', 'GRD'),
(86, 'GUADELOUPE', 'GLP'),
(87, 'GUAM', 'GUM'),
(88, 'GUATEMALA', 'GTM'),
(89, 'GUINEA', 'GIN'),
(90, 'GUINEA-BISSAU', 'GNB'),
(91, 'GUYANA', 'GUY'),
(92, 'HAITI', 'HTI'),
(93, 'HEARD ISLAND AND MCDONALD ISLANDS', 'HMD'),
(94, 'HOLY SEE (VATICAN CITY STATE)', 'VAT'),
(95, 'HONDURAS', 'HND'),
(96, 'HONG KONG', 'HKG'),
(97, 'HUNGARY', 'HUN'),
(98, 'ICELAND', 'ISL'),
(99, 'INDIA', 'IND'),
(100, 'INDONESIA', 'IDN'),
(101, 'IRAN, ISLAMIC REPUBLIC OF', 'IRN'),
(102, 'IRAQ', 'IRQ'),
(103, 'IRELAND', 'IRL'),
(104, 'ISRAEL', 'ISR'),
(105, 'ITALY', 'ITA'),
(106, 'JAMAICA', 'JAM'),
(107, 'JAPAN', 'JPN'),
(108, 'JORDAN', 'JOR'),
(109, 'KAZAKHSTAN', 'KAZ'),
(110, 'KENYA', 'KEN'),
(111, 'KIRIBATI', 'KIR'),
(112, 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'PRK'),
(113, 'KOREA, REPUBLIC OF', 'KOR'),
(114, 'KUWAIT', 'KWT'),
(115, 'KYRGYZSTAN', 'KGZ'),
(116, 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'LAO'),
(117, 'LATVIA', 'LVA'),
(118, 'LEBANON', 'LBN'),
(119, 'LESOTHO', 'LSO'),
(120, 'LIBERIA', 'LBR'),
(121, 'LIBYAN ARAB JAMAHIRIYA', 'LBY'),
(122, 'LIECHTENSTEIN', 'LIE'),
(123, 'LITHUANIA', 'LTU'),
(124, 'LUXEMBOURG', 'LUX'),
(125, 'MACAO', 'MAC'),
(126, 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'MKD'),
(127, 'MADAGASCAR', 'MDG'),
(128, 'MALAWI', 'MWI'),
(129, 'MALAYSIA', 'MYS'),
(130, 'MALDIVES', 'MDV'),
(131, 'MALI', 'MLI'),
(132, 'MALTA', 'MLT'),
(133, 'MARSHALL ISLANDS', 'MHL'),
(134, 'MARTINIQUE', 'MTQ'),
(135, 'MAURITANIA', 'MRT'),
(136, 'MAURITIUS', 'MUS'),
(137, 'MAYOTTE', 'MYT'),
(138, 'MEXICO', 'MEX'),
(139, 'MICRONESIA, FEDERATED STATES OF', 'FSM'),
(140, 'MOLDOVA, REPUBLIC OF', 'MDA'),
(141, 'MONACO', 'MCO'),
(142, 'MONGOLIA', 'MNG'),
(143, 'MONTSERRAT', 'MSR'),
(144, 'MOROCCO', 'MAR'),
(145, 'MOZAMBIQUE', 'MOZ'),
(146, 'MYANMAR', 'MMR'),
(147, 'NAMIBIA', 'NAM'),
(148, 'NAURU', 'NRU'),
(149, 'NEPAL', 'NPL'),
(150, 'NETHERLANDS', 'NLD'),
(151, 'NETHERLANDS ANTILLES', 'ANT'),
(152, 'NEW CALEDONIA', 'NCL'),
(153, 'NEW ZEALAND', 'NZL'),
(154, 'NICARAGUA', 'NIC'),
(155, 'NIGER', 'NER'),
(156, 'NIGERIA', 'NGA'),
(157, 'NIUE', 'NIU'),
(158, 'NORFOLK ISLAND', 'NFK'),
(159, 'NORTHERN MARIANA ISLANDS', 'MNP'),
(160, 'NORWAY', 'NOR'),
(161, 'OMAN', 'OMN'),
(162, 'PAKISTAN', 'PAK'),
(163, 'PALAU', 'PLW'),
(164, 'PANAMA', 'PAN'),
(165, 'PAPUA NEW GUINEA', 'PNG'),
(166, 'PARAGUAY', 'PRY'),
(167, 'PERU', 'PER'),
(168, 'PHILIPPINES', 'PHL'),
(169, 'PITCAIRN', 'PCN'),
(170, 'POLAND', 'POL'),
(171, 'PORTUGAL', 'PRT'),
(172, 'PUERTO RICO', 'PRI'),
(173, 'QATAR', 'QAT'),
(174, 'REUNION', 'REU'),
(175, 'ROMANIA', 'ROU'),
(176, 'RUSSIAN FEDERATION', 'RUS'),
(177, 'RWANDA', 'RWA'),
(178, 'SAINT HELENA', 'SHN'),
(179, 'SAINT KITTS AND NEVIS', 'KNA'),
(180, 'SAINT LUCIA', 'LCA'),
(181, 'SAINT PIERRE AND MIQUELON', 'SPM'),
(182, 'SAINT VINCENT AND THE GRENADINES', 'VCT'),
(183, 'SAMOA', 'WSM'),
(184, 'SAN MARINO', 'SMR'),
(185, 'SAO TOME AND PRINCIPE', 'STP'),
(186, 'SAUDI ARABIA', 'SAU'),
(187, 'SENEGAL', 'SEN'),
(188, 'SEYCHELLES', 'SYC'),
(189, 'SIERRA LEONE', 'SLE'),
(190, 'SINGAPORE', 'SGP'),
(191, 'SLOVAKIA', 'SVK'),
(192, 'SLOVENIA', 'SVN'),
(193, 'SOLOMON ISLANDS', 'SLB'),
(194, 'SOMALIA', 'SOM'),
(195, 'SOUTH AFRICA', 'ZAF'),
(196, 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'SGS'),
(197, 'SPAIN', 'ESP'),
(198, 'SRI LANKA', 'LKA'),
(199, 'SUDAN', 'SDN'),
(200, 'SURINAME', 'SUR'),
(201, 'SVALBARD AND JAN MAYEN', 'SJM'),
(202, 'SWAZILAND', 'SWZ'),
(203, 'SWEDEN', 'SWE'),
(204, 'SWITZERLAND', 'CHE'),
(205, 'SYRIAN ARAB REPUBLIC', 'SYR'),
(206, 'TAIWAN, PROVINCE OF CHINA', 'TWN'),
(207, 'TAJIKISTAN', 'TJK'),
(208, 'TANZANIA, UNITED REPUBLIC OF', 'TZA'),
(209, 'THAILAND', 'THA'),
(210, 'TIMOR-LESTE', 'TLS'),
(211, 'TOGO', 'TGO'),
(212, 'TOKELAU', 'TKL'),
(213, 'TONGA', 'TON'),
(214, 'TRINIDAD AND TOBAGO', 'TTO'),
(215, 'TUNISIA', 'TUN'),
(216, 'TURKEY', 'TUR'),
(217, 'TURKMENISTAN', 'TKM'),
(218, 'TURKS AND CAICOS ISLANDS', 'TCA'),
(219, 'TUVALU', 'TUV'),
(220, 'UGANDA', 'UGA'),
(221, 'UKRAINE', 'UKR'),
(222, 'UNITED ARAB EMIRATES', 'ARE'),
(223, 'UNITED KINGDOM', 'GBR'),
(224, 'UNITED STATES', 'USA'),
(225, 'URUGUAY', 'URY'),
(226, 'UZBEKISTAN', 'UZB'),
(227, 'VANUATU', 'VUT'),
(228, 'VENEZUELA', 'VEN'),
(229, 'VIET NAM', 'VNM'),
(230, 'VIRGIN ISLANDS, BRITISH', 'VGB'),
(231, 'VIRGIN ISLANDS, U.S.', 'VIR'),
(232, 'WALLIS AND FUTUNA', 'WLF'),
(233, 'WESTERN SAHARA', 'ESH'),
(234, 'YEMEN', 'YEM'),
(235, 'ZAMBIA', 'ZMB'),
(236, 'ZIMBABWE', 'ZWE'),
(237, 'JERSEY', 'JEY'),
(238, 'GUERNSEY', 'GGY'),
(239, 'UNKNOWN', 'UNK'),
(240, 'ISLE OF MAN', 'IMN');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `slug` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 'stick', 'stick', 'stick aint it?', 10, NULL, NULL),
(2, 'stick3', 'stick3', 'stick3', 12.99, '2021-05-18', '2021-05-18'),
(3, 'stick2', 'stick2', 'stick aint it?', 12.99, '2021-05-18', '2021-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`) VALUES
(1, 'Employee 1', 'employee1@givingforce.com'),
(2, 'Employee 2', 'employee2@givingforce.com'),
(3, 'Admin 1', 'admin1@givingforce.com'),
(4, 'Admin 2', 'admin2@givingforce.com'),
(5, 'Admin 3', 'admin3@givingforce.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL COMMENT 'The ID of the user role',
  `user_id` int(11) NOT NULL COMMENT 'The ID of the user the role belongs to',
  `role` enum('employee','admin','admin_applications','admin_reports') NOT NULL COMMENT 'The role the user has. Has an enum of values'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `user_id`, `role`) VALUES
(1, 1, 'employee'),
(2, 2, 'employee'),
(3, 3, 'admin'),
(4, 5, 'admin_applications'),
(5, 5, 'admin_reports'),
(6, 4, 'admin'),
(7, 3, 'admin'),
(8, 4, 'admin_applications');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_id`);

--
-- Indexes for table `charities`
--
ALTER TABLE `charities`
  ADD PRIMARY KEY (`charity_id`),
  ADD KEY `charitys_country` (`country_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `country_name_index` (`country_name`) USING BTREE COMMENT 'The country will be looked up regularly so best to have an index';

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_role_id`),
  ADD KEY `user_role_user` (`user_id`) USING BTREE COMMENT 'Foreign key between users and user roles';

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `charities`
--
ALTER TABLE `charities`
  MODIFY `charity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The ID of the charity', AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The ID of the country', AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The ID of the user role', AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `charities`
--
ALTER TABLE `charities`
  ADD CONSTRAINT `charitys_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
