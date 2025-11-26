-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 26 nov. 2025 à 04:08
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eslsca_cc`
--

-- --------------------------------------------------------

--
-- Structure de la table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `account_type` enum('checking','savings','investment') NOT NULL,
  `opened_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `accounts`
--

INSERT INTO `accounts` (`id`, `customer_id`, `account_type`, `opened_date`) VALUES
(200, 1, 'checking', '2018-01-10'),
(201, 1, 'savings', '2020-05-22'),
(203, 2, 'checking', '2019-03-14'),
(207, 3, 'checking', '2021-02-01'),
(209, 3, 'investment', '2021-04-11'),
(215, 4, 'savings', '2020-07-04'),
(218, 5, 'checking', '2022-01-19'),
(222, 6, 'checking', '2019-09-28'),
(224, 6, 'investment', '2020-10-15'),
(230, 7, 'savings', '2018-12-03'),
(233, 8, 'checking', '2022-06-10'),
(237, 9, 'checking', '2017-11-01'),
(240, 10, 'investment', '2023-02-15'),
(241, 11, 'checking', '2021-03-20'),
(242, 11, 'savings', '2021-03-21'),
(246, 12, 'checking', '2018-08-08'),
(250, 13, 'investment', '2020-10-30'),
(255, 14, 'checking', '2023-04-01'),
(260, 15, 'savings', '2019-05-10'),
(262, 16, 'checking', '2021-06-06'),
(270, 17, 'checking', '2022-08-14'),
(275, 18, 'investment', '2020-11-09'),
(280, 19, 'checking', '2019-01-21'),
(285, 20, 'savings', '2021-02-02'),
(286, 20, 'checking', '2021-02-10'),
(290, 7, 'investment', '2022-03-25'),
(291, 8, 'investment', '2021-12-12'),
(292, 12, 'savings', '2018-09-15'),
(293, 14, 'savings', '2023-04-02'),
(294, 15, 'investment', '2019-05-12');

-- --------------------------------------------------------

--
-- Structure de la table `advisors`
--

CREATE TABLE `advisors` (
  `id` int(11) NOT NULL,
  `advisor_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hiring_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `advisors`
--

INSERT INTO `advisors` (`id`, `advisor_name`, `email`, `phone`, `hiring_date`) VALUES
(10, 'Jean Lefevre', 'jean.lefevre@bank.com', '0511223344', '2016-02-01'),
(11, 'Mélanie Roche', 'melanie.roche@bank.com', '0522334455', '2018-06-15'),
(12, 'Antoine Girard', 'antoine.girard@bank.com', '0533445566', '2020-01-20'),
(13, 'Sarah Cohen', 'sarah.cohen@bank.com', '0544556677', '2017-09-09');

-- --------------------------------------------------------

--
-- Structure de la table `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `card_type` enum('visa','mastercard','debit','credit') NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cards`
--

INSERT INTO `cards` (`id`, `account_id`, `card_type`, `expiration_date`) VALUES
(501, 222, 'visa', '2026-01-01'),
(502, 230, 'mastercard', '2025-11-01'),
(503, 237, 'debit', '2027-03-01'),
(504, 215, 'visa', '2028-02-01'),
(505, 209, 'credit', '2026-04-01'),
(506, 233, 'visa', '2026-03-01'),
(507, 260, 'mastercard', '2025-12-01'),
(508, 286, 'debit', '2026-11-01'),
(509, 291, 'credit', '2027-06-01'),
(510, 240, 'visa', '2028-02-01'),
(511, 241, 'debit', '2026-03-01'),
(512, 294, 'credit', '2027-09-01'),
(513, 200, 'mastercard', '2026-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `card_payments`
--

CREATE TABLE `card_payments` (
  `id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `card_payments`
--

INSERT INTO `card_payments` (`id`, `card_id`, `merchant_id`, `payment_date`, `amount`) VALUES
(1001, 505, 31, '2024-01-18 10:10:00', 74.99),
(1002, 501, 33, '2024-02-22 08:30:00', 59.50),
(1003, 503, 44, '2024-03-03 17:40:00', 14.20),
(1004, 510, 39, '2024-01-15 15:10:00', 349.99),
(1005, 507, 41, '2024-03-18 09:45:00', 32.30),
(1006, 502, 31, '2024-02-10 19:15:00', 112.00),
(1007, 508, 36, '2024-02-05 08:30:00', 22.00),
(1008, 512, 43, '2024-05-01 11:20:00', 87.40),
(1009, 504, 35, '2024-04-12 17:50:00', 9.90),
(1010, 506, 38, '2024-05-15 15:25:00', 129.00),
(1011, 509, 31, '2024-04-20 10:10:00', 199.99),
(1012, 501, 42, '2024-06-01 06:15:00', 64.00),
(1013, 503, 32, '2024-03-28 13:33:00', 53.70),
(1014, 512, 44, '2024-07-10 16:10:00', 11.50),
(1015, 507, 41, '2024-06-15 14:10:00', 45.90),
(1016, 510, 32, '2024-06-22 10:50:00', 24.10),
(1017, 508, 31, '2024-08-02 13:12:00', 15.99),
(1018, 501, 41, '2024-09-06 06:25:00', 48.90),
(1019, 506, 33, '2024-01-09 16:40:00', 70.00),
(1020, 507, 35, '2024-02-18 19:20:00', 13.40),
(1021, 510, 37, '2024-02-24 10:55:00', 899.00),
(1022, 512, 36, '2024-03-05 12:10:00', 19.40),
(1023, 502, 45, '2024-04-01 06:30:00', 29.70),
(1024, 503, 38, '2024-03-14 09:45:00', 89.20),
(1025, 505, 31, '2024-05-10 12:35:00', 58.99),
(1026, 509, 33, '2024-04-27 17:00:00', 61.00),
(1027, 508, 35, '2024-06-11 07:25:00', 8.50),
(1028, 504, 41, '2024-03-17 12:40:00', 38.60),
(1029, 506, 43, '2024-07-03 16:50:00', 75.90),
(1030, 509, 45, '2024-08-09 09:48:00', 17.20),
(1031, 501, 37, '2024-06-01 07:15:00', 399.99),
(1032, 502, 44, '2024-09-14 18:12:00', 12.30),
(1033, 503, 31, '2024-08-18 14:40:00', 29.99),
(1034, 512, 32, '2024-09-20 12:22:00', 41.60),
(1035, 506, 42, '2024-04-01 05:55:00', 52.10),
(1036, 510, 45, '2024-05-02 17:44:00', 16.80),
(1037, 507, 38, '2024-09-22 16:05:00', 122.00),
(1038, 508, 43, '2024-09-15 18:33:00', 26.10),
(1039, 505, 32, '2024-09-03 13:20:00', 34.80),
(1040, 504, 33, '2024-08-25 09:19:00', 67.40);

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `phone`, `birthdate`, `created_at`) VALUES
(1, 'Alice', 'Martin', 'alice.martin@gmail.com', '0601020304', '1988-03-22', '2025-11-26 00:14:17'),
(2, 'Bob', 'Durand', 'bob.durand@gmail.com', '0605060708', '1975-07-11', '2025-11-26 00:14:17'),
(3, 'Claire', 'Petit', 'claire.petit@gmail.com', '0609080706', '1990-12-02', '2025-11-26 00:14:17'),
(4, 'David', 'Bernard', 'david.bernard@gmail.com', '0622334455', '1982-05-14', '2025-11-26 00:14:17'),
(5, 'Emma', 'Robert', 'emma.robert@gmail.com', '0644556677', '1995-09-19', '2025-11-26 00:14:17'),
(6, 'Florent', 'Gomez', 'florent.gomez@gmail.com', '0646891122', '1989-06-01', '2025-11-26 00:14:17'),
(7, 'Gina', 'Lopez', 'gina.lopez@gmail.com', '0612345678', '1991-01-15', '2025-11-26 00:14:17'),
(8, 'Hugo', 'Fabre', 'hugo.fabre@gmail.com', '0677889900', '1984-04-10', '2025-11-26 00:14:17'),
(9, 'Isabelle', 'Morel', 'isabelle.morel@gmail.com', '0666998855', '1979-02-18', '2025-11-26 00:14:17'),
(10, 'Julien', 'Masson', 'julien.masson@gmail.com', '0655443322', '1998-08-30', '2025-11-26 00:14:17'),
(11, 'Karim', 'Saidi', 'karim.saidi@gmail.com', '0600112233', '1985-11-21', '2025-11-26 00:14:17'),
(12, 'Laura', 'Giraud', 'laura.giraud@gmail.com', '0699887766', '1992-03-03', '2025-11-26 00:14:17'),
(13, 'Marc', 'Blanc', 'marc.blanc@gmail.com', '0602030405', '1980-10-01', '2025-11-26 00:14:17'),
(14, 'Nina', 'Leclerc', 'nina.leclerc@gmail.com', '0677001122', '1999-12-12', '2025-11-26 00:14:17'),
(15, 'Olivier', 'Dupuis', 'olivier.dupuis@gmail.com', '0633557799', '1987-05-25', '2025-11-26 00:14:17'),
(16, 'Pauline', 'Arnaud', 'pauline.arnaud@gmail.com', '0622003344', '1993-07-17', '2025-11-26 00:14:17'),
(17, 'Quentin', 'Besson', 'quentin.besson@gmail.com', '0644221133', '1978-03-09', '2025-11-26 00:14:17'),
(18, 'Rania', 'Meziane', 'rania.meziane@gmail.com', '0677665544', '1994-06-28', '2025-11-26 00:14:17'),
(19, 'Samir', 'Kader', 'samir.kader@gmail.com', '0611998877', '1986-01-04', '2025-11-26 00:14:17'),
(20, 'Tina', 'Perrin', 'tina.perrin@gmail.com', '0699001122', '1997-09-14', '2025-11-26 00:14:17');

-- --------------------------------------------------------

--
-- Structure de la table `customer_advisor`
--

CREATE TABLE `customer_advisor` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `advisor_id` int(11) NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `customer_advisor`
--

INSERT INTO `customer_advisor` (`id`, `customer_id`, `advisor_id`, `start_date`) VALUES
(101, 1, 10, '2021-01-10'),
(102, 2, 11, '2020-03-12'),
(103, 3, 10, '2019-07-18'),
(104, 4, 12, '2022-09-05'),
(105, 5, 13, '2021-11-02'),
(106, 6, 11, '2022-01-22'),
(107, 7, 12, '2020-04-15'),
(108, 8, 13, '2019-12-19'),
(109, 9, 11, '2021-05-27'),
(110, 10, 10, '2023-02-10');

-- --------------------------------------------------------

--
-- Structure de la table `investments`
--

CREATE TABLE `investments` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `investment_type` enum('ETF','stock','bond') NOT NULL,
  `buy_price` decimal(12,2) NOT NULL,
  `quantity` decimal(12,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `investments`
--

INSERT INTO `investments` (`id`, `account_id`, `investment_type`, `buy_price`, `quantity`) VALUES
(1, 209, 'ETF', 210.50, 10.5000),
(2, 209, 'stock', 55.20, 30.0000),
(3, 224, 'bond', 1000.00, 5.0000),
(4, 224, 'ETF', 198.00, 15.2000),
(5, 240, 'stock', 72.30, 40.0000),
(6, 240, 'bond', 980.50, 3.0000),
(7, 250, 'ETF', 205.60, 11.0000),
(8, 250, 'stock', 65.00, 50.0000),
(9, 275, 'bond', 1020.00, 6.0000),
(10, 275, 'ETF', 199.90, 9.3000),
(11, 290, 'ETF', 180.00, 20.0000),
(12, 290, 'stock', 49.90, 60.0000),
(13, 291, 'bond', 1015.00, 4.0000),
(14, 291, 'ETF', 190.50, 12.0000),
(15, 294, 'ETF', 175.00, 18.0000),
(16, 294, 'stock', 52.10, 55.0000),
(17, 203, 'bond', 1005.00, 2.0000),
(18, 230, 'ETF', 199.00, 7.5000),
(19, 241, 'stock', 70.40, 25.0000),
(20, 292, 'bond', 995.00, 3.0000);

-- --------------------------------------------------------

--
-- Structure de la table `market_prices`
--

CREATE TABLE `market_prices` (
  `id` int(11) NOT NULL,
  `investment_type` enum('ETF','stock','bond') NOT NULL,
  `price_date` date NOT NULL,
  `market_price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `market_prices`
--

INSERT INTO `market_prices` (`id`, `investment_type`, `price_date`, `market_price`) VALUES
(1, 'ETF', '2024-01-01', 200.10),
(2, 'ETF', '2024-02-01', 205.00),
(3, 'ETF', '2024-03-01', 210.00),
(4, 'stock', '2024-01-01', 60.20),
(5, 'stock', '2024-03-01', 62.10),
(6, 'bond', '2024-01-01', 1005.00),
(7, 'bond', '2024-03-01', 1010.50);

-- --------------------------------------------------------

--
-- Structure de la table `merchants`
--

CREATE TABLE `merchants` (
  `id` int(11) NOT NULL,
  `merchant_name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `merchants`
--

INSERT INTO `merchants` (`id`, `merchant_name`, `category`) VALUES
(31, 'Amazon', 'Online Retail'),
(32, 'Carrefour', 'Groceries'),
(33, 'TotalEnergies', 'Fuel'),
(34, 'Zara', 'Clothing'),
(35, 'McDonalds', 'Fast Food'),
(36, 'Uber', 'Transport'),
(37, 'Apple Store', 'Electronics'),
(38, 'Decathlon', 'Sports'),
(39, 'Fnac', 'Electronics'),
(40, 'H&M', 'Clothing'),
(41, 'Leclerc', 'Groceries'),
(42, 'SNCF', 'Transport'),
(43, 'Sephora', 'Cosmetics'),
(44, 'Burger King', 'Fast Food'),
(45, 'Lidl', 'Groceries');

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transaction_type` enum('credit','debit') NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`id`, `account_id`, `amount`, `transaction_date`, `transaction_type`, `description`) VALUES
(2001, 200, 1200.00, '2024-01-04 23:00:00', 'credit', 'Salary'),
(2002, 200, -55.20, '2024-01-05 23:00:00', 'debit', 'Groceries'),
(2003, 201, 300.00, '2024-02-09 23:00:00', 'credit', 'Transfer'),
(2004, 203, -80.00, '2024-02-29 23:00:00', 'debit', 'Fuel'),
(2005, 207, 1500.00, '2024-03-24 23:00:00', 'credit', 'Salary'),
(2006, 207, -45.90, '2024-03-25 23:00:00', 'debit', 'Restaurant'),
(2007, 209, -200.00, '2024-03-31 22:00:00', 'debit', 'Investment fees'),
(2008, 215, 700.00, '2024-04-13 22:00:00', 'credit', 'Bonus'),
(2009, 218, -34.10, '2024-04-30 22:00:00', 'debit', 'Carrefour'),
(2010, 222, -12.50, '2024-05-02 22:00:00', 'debit', 'Uber'),
(2011, 224, -99.99, '2024-05-19 22:00:00', 'debit', 'Apple Store'),
(2012, 230, 300.00, '2024-05-31 22:00:00', 'credit', 'Refund'),
(2013, 233, -60.50, '2024-06-02 22:00:00', 'debit', 'Leclerc'),
(2014, 237, 1800.00, '2024-06-14 22:00:00', 'credit', 'Salary'),
(2015, 240, -500.00, '2024-06-30 22:00:00', 'debit', 'Shares buy'),
(2016, 241, 1300.00, '2024-07-09 22:00:00', 'credit', 'Salary'),
(2017, 242, 200.00, '2024-07-29 22:00:00', 'credit', 'Interest'),
(2018, 246, -89.00, '2024-08-01 22:00:00', 'debit', 'Sports store'),
(2019, 250, -1000.00, '2024-08-04 22:00:00', 'debit', 'Bond purchase'),
(2020, 255, 900.00, '2024-08-11 22:00:00', 'credit', 'Salary'),
(2021, 260, 400.00, '2024-08-19 22:00:00', 'credit', 'Transfer'),
(2022, 262, -25.50, '2024-08-31 22:00:00', 'debit', 'McDonalds'),
(2023, 270, -65.00, '2024-09-02 22:00:00', 'debit', 'Fuel'),
(2024, 275, -500.00, '2024-09-07 22:00:00', 'debit', 'ETF buy'),
(2025, 280, 1500.00, '2024-09-10 22:00:00', 'credit', 'Salary'),
(2026, 285, 200.00, '2024-09-11 22:00:00', 'credit', 'Interest'),
(2027, 286, -22.90, '2024-09-13 22:00:00', 'debit', 'Burger King'),
(2028, 290, -1500.00, '2024-09-19 22:00:00', 'debit', 'Stock buy'),
(2029, 291, 800.00, '2024-09-24 22:00:00', 'credit', 'Transfer'),
(2030, 292, 90.00, '2024-09-26 22:00:00', 'credit', 'Interest'),
(2031, 293, -44.50, '2024-09-28 22:00:00', 'debit', 'H&M'),
(2032, 294, -450.00, '2024-09-30 22:00:00', 'debit', 'ETF buy'),
(2033, 222, 1200.00, '2024-10-04 22:00:00', 'credit', 'Salary'),
(2034, 233, -134.00, '2024-10-06 22:00:00', 'debit', 'Fnac'),
(2035, 215, -29.99, '2024-10-07 22:00:00', 'debit', 'Amazon'),
(2036, 240, 2000.00, '2024-10-09 22:00:00', 'credit', 'Bonus'),
(2037, 241, 900.00, '2024-10-13 22:00:00', 'credit', 'Transfer'),
(2038, 260, -75.00, '2024-10-19 22:00:00', 'debit', 'Restaurant'),
(2039, 286, -19.99, '2024-10-21 22:00:00', 'debit', 'Lidl'),
(2040, 275, -500.00, '2024-10-24 22:00:00', 'debit', 'Bond fees');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Index pour la table `advisors`
--
ALTER TABLE `advisors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Index pour la table `card_payments`
--
ALTER TABLE `card_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`),
  ADD KEY `merchant_id` (`merchant_id`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer_advisor`
--
ALTER TABLE `customer_advisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `advisor_id` (`advisor_id`);

--
-- Index pour la table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Index pour la table `market_prices`
--
ALTER TABLE `market_prices`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Contraintes pour la table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Contraintes pour la table `card_payments`
--
ALTER TABLE `card_payments`
  ADD CONSTRAINT `card_payments_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`),
  ADD CONSTRAINT `card_payments_ibfk_2` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`);

--
-- Contraintes pour la table `customer_advisor`
--
ALTER TABLE `customer_advisor`
  ADD CONSTRAINT `customer_advisor_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `customer_advisor_ibfk_2` FOREIGN KEY (`advisor_id`) REFERENCES `advisors` (`id`);

--
-- Contraintes pour la table `investments`
--
ALTER TABLE `investments`
  ADD CONSTRAINT `investments_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
