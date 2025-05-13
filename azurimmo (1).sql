-- phpMyAdmin SQL Dump
-- version 5.2.1deb1~bpo11+1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 13 mai 2025 à 06:54
-- Version du serveur : 10.5.28-MariaDB-0+deb11u1-log
-- Version de PHP : 8.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `azurimmo`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartement`
--

CREATE TABLE `appartement` (
  `id` bigint(20) NOT NULL,
  `nb_pieces_original` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `surface` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `batiment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `appartement`
--

INSERT INTO `appartement` (`id`, `nb_pieces_original`, `numero`, `surface`, `description`, `batiment_id`) VALUES
(1, 5, 508, 111.1, 'Apparetment du haut', 3),
(2, 8, 1236, 15.6, 'EN bas', 1),
(3, 9, 320004, 115, 'Porte rose', 1),
(4, 45, 456, 0, 'Fenetres blue', 1),
(5, 0, 10020, 5162.3, 'test avec id=0', NULL),
(6, 5, 165, 112, 'yui', 1),
(7, 3, 1, 35, '', 2),
(8, 12, 123, 165, 'Pas de boite au lettres', 5),
(9, 0, 10020, 5162.3, 'test avec id=0', NULL),
(10, 5, 905, 100.25, '', 3),
(11, 2, 1165, 30.56, '', 2),
(12, 5, 569, 69, '', 3),
(13, 6, 6985, 150, '', 5);

-- --------------------------------------------------------

--
-- Structure de la table `associe`
--

CREATE TABLE `associe` (
  `id` bigint(20) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `associe`
--

INSERT INTO `associe` (`id`, `date_naissance`, `nom`, `prenom`) VALUES
(1, '2025-01-01', 'Lama', 'Serge'),
(2, '2025-01-03', 'La Belle', 'Rose');

-- --------------------------------------------------------

--
-- Structure de la table `batiment`
--

CREATE TABLE `batiment` (
  `id` bigint(20) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `batiment`
--

INSERT INTO `batiment` (`id`, `adresse`, `ville`) VALUES
(1, '7 avenue de la maroquinerie', 'Saint Lo'),
(2, '86 ruelle March', 'Lorient'),
(3, '41 rue de la Chatelle', 'Paris'),
(5, '41 rue de la GARE', 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `bien`
--

CREATE TABLE `bien` (
  `idb` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `cp` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nbpersmax` int(11) DEFAULT NULL,
  `pieces` varchar(255) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `idp` int(11) DEFAULT NULL,
  `idt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE `contrat` (
  `id` bigint(20) NOT NULL,
  `date_entree` date DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `montant_charges` float DEFAULT NULL,
  `montant_loyer` float DEFAULT NULL,
  `associe_id` bigint(20) DEFAULT NULL,
  `appartement_id` bigint(20) DEFAULT NULL,
  `locataire` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `date_entree`, `date_sortie`, `montant_charges`, `montant_loyer`, `associe_id`, `appartement_id`, `locataire`) VALUES
(1, '2025-01-27', '2025-01-31', 750, 1520, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `garant`
--

CREATE TABLE `garant` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

CREATE TABLE `intervenant` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `intervenant`
--

INSERT INTO `intervenant` (`id`, `nom`) VALUES
(1, 'ElectricityAndCo'),
(2, 'PlomberieAndCO');

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

CREATE TABLE `intervention` (
  `id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `appartement_id` bigint(20) DEFAULT NULL,
  `intervenant_id` bigint(20) DEFAULT NULL,
  `type_intervention_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `intervention`
--

INSERT INTO `intervention` (`id`, `date`, `description`, `appartement_id`, `intervenant_id`, `type_intervention_id`) VALUES
(1, '2025-02-10', 'Mise au normes de l\'électricité', 1, 1, 1),
(2, '2025-02-09', 'Réparation de l\'évier bouché', 3, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `locataire`
--

CREATE TABLE `locataire` (
  `id` bigint(20) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `locataire`
--

INSERT INTO `locataire` (`id`, `date_naissance`, `lieu_naissance`, `nom`, `prenom`, `email`, `telephone`) VALUES
(1, '2025-01-01', 'Dieppe', 'Bargas', 'Anaëlle', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `louer`
--

CREATE TABLE `louer` (
  `id` int(11) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `nbnuitee` int(11) DEFAULT NULL,
  `nbpers` int(11) DEFAULT NULL,
  `idb` int(11) DEFAULT NULL,
  `idl` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id` bigint(20) NOT NULL,
  `date_paiement` date DEFAULT NULL,
  `montant` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

CREATE TABLE `proprietaire` (
  `id` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `cp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `toit`
--

CREATE TABLE `toit` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `toit`
--

INSERT INTO `toit` (`id`, `libelle`) VALUES
(1, NULL),
(2, 'testToit1');

-- --------------------------------------------------------

--
-- Structure de la table `type_intervention`
--

CREATE TABLE `type_intervention` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_intervention`
--

INSERT INTO `type_intervention` (`id`, `libelle`) VALUES
(1, 'Mise aux normes'),
(2, 'Réparation Plomberie');

-- --------------------------------------------------------

--
-- Structure de la table `type_propriete`
--

CREATE TABLE `type_propriete` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5kn64l7l2m25kkryy4n50ikyb` (`batiment_id`);

--
-- Index pour la table `associe`
--
ALTER TABLE `associe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `batiment`
--
ALTER TABLE `batiment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bien`
--
ALTER TABLE `bien`
  ADD PRIMARY KEY (`idb`),
  ADD KEY `FK5qkq08qhq8vscrmiij69vapfm` (`idp`),
  ADD KEY `FKmubhl83mtru3dokddc6ovot7d` (`idt`);

--
-- Index pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj40p46xa2cw18ynlgohbviwqd` (`associe_id`),
  ADD KEY `FK1ahw6ibj07960n52ulfdoc96g` (`appartement_id`),
  ADD KEY `FKfiu9667ouphp1yd3nouktd5wu` (`locataire`);

--
-- Index pour la table `garant`
--
ALTER TABLE `garant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `intervenant`
--
ALTER TABLE `intervenant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKf6nntanyntpovh90a0u2hbj9v` (`appartement_id`),
  ADD KEY `FK1gq45xrtd7j688juiuto7vs3x` (`intervenant_id`),
  ADD KEY `FKg80odl92m1wv1d2hml6t82wo8` (`type_intervention_id`);

--
-- Index pour la table `locataire`
--
ALTER TABLE `locataire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `louer`
--
ALTER TABLE `louer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlcyksggnth54sb7n5n9h9roav` (`idb`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `toit`
--
ALTER TABLE `toit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_intervention`
--
ALTER TABLE `type_intervention`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_propriete`
--
ALTER TABLE `type_propriete`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appartement`
--
ALTER TABLE `appartement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `associe`
--
ALTER TABLE `associe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `batiment`
--
ALTER TABLE `batiment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `bien`
--
ALTER TABLE `bien`
  MODIFY `idb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contrat`
--
ALTER TABLE `contrat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `garant`
--
ALTER TABLE `garant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `intervenant`
--
ALTER TABLE `intervenant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `intervention`
--
ALTER TABLE `intervention`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `locataire`
--
ALTER TABLE `locataire`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `louer`
--
ALTER TABLE `louer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `toit`
--
ALTER TABLE `toit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `type_intervention`
--
ALTER TABLE `type_intervention`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `type_propriete`
--
ALTER TABLE `type_propriete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD CONSTRAINT `FK5kn64l7l2m25kkryy4n50ikyb` FOREIGN KEY (`batiment_id`) REFERENCES `batiment` (`id`);

--
-- Contraintes pour la table `bien`
--
ALTER TABLE `bien`
  ADD CONSTRAINT `FK5qkq08qhq8vscrmiij69vapfm` FOREIGN KEY (`idp`) REFERENCES `proprietaire` (`id`),
  ADD CONSTRAINT `FKmubhl83mtru3dokddc6ovot7d` FOREIGN KEY (`idt`) REFERENCES `type_propriete` (`id`);

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `FK1ahw6ibj07960n52ulfdoc96g` FOREIGN KEY (`appartement_id`) REFERENCES `appartement` (`id`),
  ADD CONSTRAINT `FKfiu9667ouphp1yd3nouktd5wu` FOREIGN KEY (`locataire`) REFERENCES `locataire` (`id`),
  ADD CONSTRAINT `FKj40p46xa2cw18ynlgohbviwqd` FOREIGN KEY (`associe_id`) REFERENCES `associe` (`id`);

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `FK1gq45xrtd7j688juiuto7vs3x` FOREIGN KEY (`intervenant_id`) REFERENCES `intervenant` (`id`),
  ADD CONSTRAINT `FKf6nntanyntpovh90a0u2hbj9v` FOREIGN KEY (`appartement_id`) REFERENCES `appartement` (`id`),
  ADD CONSTRAINT `FKg80odl92m1wv1d2hml6t82wo8` FOREIGN KEY (`type_intervention_id`) REFERENCES `type_intervention` (`id`);

--
-- Contraintes pour la table `louer`
--
ALTER TABLE `louer`
  ADD CONSTRAINT `FKlcyksggnth54sb7n5n9h9roav` FOREIGN KEY (`idb`) REFERENCES `bien` (`idb`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
