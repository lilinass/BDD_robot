-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 05 déc. 2025 à 15:14
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
-- Base de données : `bddrobot`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE `action` (
  `id_action` int(11) NOT NULL,
  `id_robot` int(11) NOT NULL,
  `id_scenario` int(11) NOT NULL,
  `action` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `action_humain`
--

CREATE TABLE `action_humain` (
  `id_action_humain` int(11) NOT NULL,
  `id_humain` int(11) NOT NULL,
  `id_action` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `humain`
--

CREATE TABLE `humain` (
  `id_humain` int(11) NOT NULL,
  `nom_humain` varchar(50) NOT NULL,
  `vulnerabilite` enum('elevee','moyenne','faible','') NOT NULL,
  `localisation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `robot`
--

CREATE TABLE `robot` (
  `id_robot` int(11) NOT NULL,
  `nom_robot` varchar(50) NOT NULL,
  `modele` varchar(50) NOT NULL,
  `etat` enum('actif','hs','panne','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `scenario`
--

CREATE TABLE `scenario` (
  `id_scenario` int(11) NOT NULL,
  `description` text NOT NULL,
  `priorite_loi` enum('1','2','3','') NOT NULL,
  `zone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id_action`);

--
-- Index pour la table `action_humain`
--
ALTER TABLE `action_humain`
  ADD PRIMARY KEY (`id_action_humain`),
  ADD KEY `id_humain` (`id_humain`),
  ADD KEY `id_action` (`id_action`);

--
-- Index pour la table `humain`
--
ALTER TABLE `humain`
  ADD PRIMARY KEY (`id_humain`);

--
-- Index pour la table `robot`
--
ALTER TABLE `robot`
  ADD PRIMARY KEY (`id_robot`);

--
-- Index pour la table `scenario`
--
ALTER TABLE `scenario`
  ADD PRIMARY KEY (`id_scenario`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `id_action` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `action_humain`
--
ALTER TABLE `action_humain`
  MODIFY `id_action_humain` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `humain`
--
ALTER TABLE `humain`
  MODIFY `id_humain` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `robot`
--
ALTER TABLE `robot`
  MODIFY `id_robot` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `scenario`
--
ALTER TABLE `scenario`
  MODIFY `id_scenario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `action_humain`
--
ALTER TABLE `action_humain`
  ADD CONSTRAINT `id_action` FOREIGN KEY (`id_action`) REFERENCES `action` (`id_action`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_humain` FOREIGN KEY (`id_humain`) REFERENCES `humain` (`id_humain`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
