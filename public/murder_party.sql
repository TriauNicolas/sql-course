-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mar. 28 oct. 2025 à 21:02
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
-- Base de données : `fuuf`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `person_type` enum('guest','employee') DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `activity` varchar(100) DEFAULT NULL,
  `activity_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `activity_log`
--

INSERT INTO `activity_log` (`id`, `person_type`, `person_id`, `activity`, `activity_time`) VALUES
(1, 'guest', 1, 'entered lobby', '2025-10-24 19:45:00'),
(2, 'guest', 1, 'entered restaurant', '2025-10-24 20:10:00'),
(3, 'guest', 1, 'returned to room 101', '2025-10-24 21:20:00'),
(4, 'guest', 2, 'entered restaurant', '2025-10-24 20:05:00'),
(5, 'guest', 2, 'argued with guest 4', '2025-10-24 20:30:00'),
(6, 'guest', 2, 'returned to room 201', '2025-10-24 21:00:00'),
(7, 'guest', 3, 'entered lobby', '2025-10-24 19:00:00'),
(8, 'guest', 3, 'ordered room service', '2025-10-24 20:30:00'),
(9, 'guest', 4, 'entered restaurant', '2025-10-24 20:00:00'),
(10, 'guest', 4, 'argued with guest 2', '2025-10-24 20:30:00'),
(11, 'guest', 4, 'left restaurant', '2025-10-24 20:45:00'),
(12, 'guest', 4, 'entered kitchen', '2025-10-24 21:00:00'),
(13, 'guest', 5, 'entered bar', '2025-10-24 20:10:00'),
(14, 'guest', 5, 'ordered drink', '2025-10-24 20:12:00'),
(15, 'guest', 5, 'returned to room 102', '2025-10-24 22:00:00'),
(16, 'guest', 6, 'entered lobby', '2025-10-24 19:50:00'),
(17, 'guest', 6, 'entered restaurant', '2025-10-24 20:15:00'),
(18, 'guest', 6, 'left restaurant', '2025-10-24 21:00:00'),
(19, 'guest', 7, 'entered restaurant', '2025-10-24 20:25:00'),
(20, 'guest', 8, 'entered lobby', '2025-10-24 19:55:00'),
(21, 'guest', 8, 'checked out', '2025-10-25 08:00:00'),
(22, 'employee', 4, 'left kitchen', '2025-10-24 21:00:00'),
(23, 'employee', 2, 'started patrol', '2025-10-24 20:00:00'),
(24, 'employee', 2, 'found body in kitchen', '2025-10-24 21:10:00'),
(25, 'employee', 6, 'served drinks at bar', '2025-10-24 20:00:00'),
(26, 'employee', 7, 'served dinner in restaurant', '2025-10-24 20:10:00');

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `shift` enum('morning','afternoon','night') DEFAULT NULL,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `position`, `shift`, `salary`) VALUES
(1, 'Rachel', 'Evans', 'receptionist', 'morning', 2200),
(2, 'Tom', 'Baker', 'security', 'night', 2600),
(3, 'Sophie', 'Martinez', 'housekeeping', 'afternoon', 1900),
(4, 'Mark', 'Hughes', 'chef', 'night', 3100),
(5, 'Laura', 'Foster', 'manager', 'morning', 4000),
(6, 'Kevin', 'Brown', 'bartender', 'night', 2100),
(7, 'Olivia', 'Green', 'waitress', 'afternoon', 1800),
(8, 'Peter', 'Dunn', 'technician', 'afternoon', 2500);

-- --------------------------------------------------------

--
-- Structure de la table `guests`
--

CREATE TABLE `guests` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` char(1) DEFAULT NULL CHECK (`gender` in ('M','F')),
  `age` tinyint(3) UNSIGNED DEFAULT NULL,
  `room_number` smallint(6) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `guests`
--

INSERT INTO `guests` (`id`, `first_name`, `last_name`, `gender`, `age`, `room_number`, `check_in`, `check_out`) VALUES
(1, 'Alice', 'Moore', 'F', 29, 101, '2025-10-21', '2025-10-25'),
(2, 'Benjamin', 'Stone', 'M', 35, 201, '2025-10-20', '2025-10-27'),
(3, 'Clara', 'Johnson', 'F', 42, 202, '2025-10-22', '2025-10-26'),
(4, 'David', 'Lee', 'M', 38, 301, '2025-10-24', '2025-10-28'),
(5, 'Emma', 'Turner', 'F', 25, 102, '2025-10-24', '2025-10-27'),
(6, 'Frank', 'Miller', 'M', 47, 203, '2025-10-23', '2025-10-28'),
(7, 'Grace', 'Hill', 'F', 31, 103, '2025-10-24', '2025-10-26'),
(8, 'Hannah', 'Clark', 'F', 27, 302, '2025-10-24', '2025-10-25'),
(9, 'Ian', 'Walker', 'M', 45, 303, '2025-10-20', '2025-10-26'),
(10, 'Julia', 'Adams', 'F', 36, 401, '2025-10-24', '2025-10-29');

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` smallint(6) DEFAULT NULL,
  `floor` tinyint(4) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `price_per_night` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `floor`, `type`, `price_per_night`) VALUES
(1, 101, 1, 'single', 80.00),
(2, 102, 1, 'double', 120.00),
(3, 103, 1, 'single', 75.00),
(4, 201, 2, 'suite', 300.00),
(5, 202, 2, 'double', 110.00),
(6, 203, 2, 'suite', 320.00),
(7, 301, 3, 'suite', 350.00),
(8, 302, 3, 'double', 130.00),
(9, 303, 3, 'single', 90.00),
(10, 401, 4, 'penthouse', 500.00);

-- --------------------------------------------------------

--
-- Structure de la table `suspicions`
--

CREATE TABLE `suspicions` (
  `id` int(11) NOT NULL,
  `suspect_type` enum('guest','employee') DEFAULT NULL,
  `suspect_id` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `level_of_suspicion` tinyint(4) DEFAULT NULL CHECK (`level_of_suspicion` between 0 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `suspicions`
--

INSERT INTO `suspicions` (`id`, `suspect_type`, `suspect_id`, `reason`, `level_of_suspicion`) VALUES
(1, 'guest', 2, 'argued with victim shortly before death', 4),
(2, 'guest', 4, 'was seen entering kitchen', 5),
(3, 'guest', 3, 'never left her room', 1),
(4, 'employee', 4, 'worked in kitchen that night', 3),
(5, 'employee', 2, 'found body', 2),
(6, 'guest', 6, 'was dining near the victim', 2),
(7, 'guest', 5, 'was drunk at bar', 1),
(8, 'employee', 6, 'served drinks late', 1);

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`id`, `guest_id`, `amount`, `payment_date`) VALUES
(1, 1, 240.00, '2025-10-24'),
(2, 2, 1200.00, '2025-10-24'),
(3, 3, 440.00, '2025-10-24'),
(4, 4, 1400.00, '2025-10-24'),
(5, 5, 360.00, '2025-10-24'),
(6, 6, 1280.00, '2025-10-24'),
(7, 7, 150.00, '2025-10-24'),
(8, 8, 390.00, '2025-10-24'),
(9, 9, 540.00, '2025-10-24'),
(10, 10, 2500.00, '2025-10-24');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Index pour la table `suspicions`
--
ALTER TABLE `suspicions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `suspicions`
--
ALTER TABLE `suspicions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
