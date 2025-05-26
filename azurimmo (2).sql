-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 26 mai 2025 à 13:47
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
-- Base de données : `azurimmo`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartement`
--

CREATE TABLE `appartement` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `batiment_id` bigint(20) DEFAULT NULL,
  `nb_pieces_original` int(11) DEFAULT NULL,
  `archive` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `appartement`
--

INSERT INTO `appartement` (`id`, `description`, `numero`, `surface`, `batiment_id`, `nb_pieces_original`, `archive`) VALUES
(11, 'Studio Rose', 102, 25.5, 17, 2, b'1'),
(12, 'Duplex', 333, 80.5, 15, 7, b'1'),
(19, '1er etage', 1, 100.2, 27, 5, b'1'),
(20, '1', 1, 1, 17, 1, b'1'),
(21, '1er etage', 1, 20.5, 15, 3, b'0'),
(22, '1er etage', 2, 20.5, 15, 3, b'0'),
(23, '1er etage', 1, 120.56, 14, 7, b'1'),
(24, '2 etage', 3, 50, 15, 3, b'1');

-- --------------------------------------------------------

--
-- Structure de la table `batiment`
--

CREATE TABLE `batiment` (
  `id` bigint(20) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `archive` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `batiment`
--

INSERT INTO `batiment` (`id`, `adresse`, `ville`, `archive`) VALUES
(14, '1 rue du chateau de la Rose', 'Caen', b'0'),
(15, '16 rue André', 'Cheux', b'0'),
(17, '4 rue des lilas', 'Caen', b'1'),
(27, '59 rue de la fleur', 'Caen', b'1'),
(28, 'test', 'test', b'1');

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE `contrat` (
  `id` bigint(20) NOT NULL,
  `date_entree` date DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `montant_loyer` float DEFAULT NULL,
  `montant_charges` float DEFAULT NULL,
  `locataire` bigint(20) DEFAULT NULL,
  `appartement` bigint(20) DEFAULT NULL,
  `archive` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `date_entree`, `date_sortie`, `montant_loyer`, `montant_charges`, `locataire`, `appartement`, `archive`) VALUES
(16, '2005-01-01', '2010-02-15', 500, 50, 9, 11, b'1'),
(17, '2010-01-01', '2020-03-15', 700, 70, 8, 12, b'1'),
(18, '2005-03-29', '2007-03-29', 650, 70, 9, 11, b'1'),
(20, '2022-05-11', '2029-05-11', 456, 150, 8, 12, b'1'),
(21, '2007-05-03', '2007-05-03', 16, 96, 9, 19, b'1'),
(22, '2007-05-03', '2007-05-03', 5623, 52, 8, 19, b'1'),
(23, '2005-03-29', '2005-03-29', 620, 52, 10, 20, b'1'),
(24, '2005-03-29', '2006-03-29', 250, 50, 10, 21, b'0'),
(25, '2007-03-12', '2027-03-12', 250, 50, 12, 21, b'0'),
(26, '2022-12-20', '2026-12-20', 650, 25, 8, 22, b'0'),
(27, '2021-03-26', '2021-09-29', 150, 20, 8, 23, b'1'),
(28, '2005-03-29', '2005-03-29', 150, 150, 12, 21, b'1'),
(29, '1800-03-26', '1800-03-26', 150, 0, 12, 21, b'1');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `nom`) VALUES
(3, 'Fouchard '),
(4, 'Coquelin');

-- --------------------------------------------------------

--
-- Structure de la table `garant`
--

CREATE TABLE `garant` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `garant`
--

INSERT INTO `garant` (`id`, `nom`, `prenom`) VALUES
(1, 'Barras', 'Lavinia'),
(2, 'Sévigné', 'David');

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
(1, 'GrandFrais'),
(2, 'Lidl'),
(3, 'Brico Dépôt'),
(4, 'TQ Group'),
(7, 'PRO VOLETS'),
(8, 'PRO_ELEC'),
(9, NULL),
(10, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

CREATE TABLE `intervention` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `appartement_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `intervenant_id` bigint(20) DEFAULT NULL,
  `type_intervention_id` bigint(20) DEFAULT NULL,
  `archive` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `intervention`
--

INSERT INTO `intervention` (`id`, `description`, `appartement_id`, `date`, `intervenant_id`, `type_intervention_id`, `archive`) VALUES
(5, 'Réparation volet salon', 12, '2025-03-11', 7, 4, b'1'),
(6, 'Débouchage évier', 11, '2025-03-11', 4, 1, b'1'),
(11, 'Reparation d\'une prise electrique dans une salle de bain', 12, '2026-01-05', 8, 3, b'1'),
(12, 'test', 19, '2007-05-03', 7, 1, b'1'),
(13, 'l', 20, '2005-03-29', 8, 2, b'1'),
(14, 'Nouveau computer electrique', 21, '2025-05-13', 8, 2, b'0'),
(15, 'Pose du nouveau compteur', 22, '2025-05-14', 8, 2, b'0'),
(16, 'test suppression', 23, '2025-05-14', 7, 1, b'1'),
(17, 'test suppresin', 21, '2011-02-05', 7, 1, b'1');

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
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `archive` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `locataire`
--

INSERT INTO `locataire` (`id`, `date_naissance`, `lieu_naissance`, `nom`, `prenom`, `telephone`, `email`, `archive`) VALUES
(8, '1993-12-30', 'Lomé', 'Martin', 'Patrick', '06.06.06.06.06', 'test@gmail.com', b'0'),
(9, '1982-05-30', 'Bayeux', 'Gady', 'Bénédicte', '06.06.06.06.06', 'test@gmail.com', b'0'),
(10, '2005-03-29', 'Mont-Saint-Aignan', 'Bargas', 'Anaelle', '06.06.06.06.06', 'test@gmail.com', b'0'),
(12, '2005-03-29', 'Mont-Saint-Aignan', 'Bargas', 'Maella', '06.06.06.06.06', 'anaelle.bargas@sts-sio-caen.info', b'0'),
(17, '1959-05-28', 'Dieppe', 'Bargas', 'Patrick', '02.02.02.02.02', 'p@gmail.com', b'0'),
(18, '2005-03-29', 'fzafz', 'rezrza', 'rzarz', '02.02.02.02.02', 'zafz@fzaf.zfaz', b'1'),
(19, '2005-03-26', 'csqcs', 'fzf', 'fqf', '02.02.02.02.02', 'csqcs@csq.co', b'1');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id` bigint(20) NOT NULL,
  `date_paiement` date DEFAULT NULL,
  `montant` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id`, `date_paiement`, `montant`) VALUES
(1, '2025-03-27', 9000),
(2, '2025-03-27', 1500);

-- --------------------------------------------------------

--
-- Structure de la table `toit`
--

CREATE TABLE `toit` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Plomberie Réparation'),
(2, 'Mise à niveau de l\'électricité'),
(3, 'Réparations électriques'),
(4, 'Réparation de Menuiseries');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `nom`, `password`, `prenom`) VALUES
(1, 'anaelle.bargas@sts-sio-caen.info', 'Bargas', 'ilovedev', 'Anaëlle'),
(2, 'maella.bargas@sts-sio-caen.info', 'Bargas', 'ilovemaella', 'Maella'),
(3, 'blabla.bargas@sts-sio-caen.info', NULL, NULL, NULL),
(4, 'test.bargas@sts-sio-caen.info', NULL, NULL, NULL),
(5, 'test2.bargas@sts-sio-caen.info', 'Bargas', NULL, 'test2'),
(6, 'test3.bargas@sts-sio-caen.info', 'Bargas', 'ilovedev', 'test3'),
(7, 'test4.bargas@sts-sio-caen.info', 'Bargas', '$2a$10$xWH2hl0lI50/RE59Lt8yZ.CwRietcql58qYlQ4nfMNa5XIPc1Oa.K', 'test4');

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
-- Index pour la table `batiment`
--
ALTER TABLE `batiment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfiu9667ouphp1yd3nouktd5wu` (`locataire`),
  ADD KEY `FKlmy1ec3kj5spbu6mcfuxlc762` (`appartement`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
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
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appartement`
--
ALTER TABLE `appartement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `batiment`
--
ALTER TABLE `batiment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `contrat`
--
ALTER TABLE `contrat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `garant`
--
ALTER TABLE `garant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `intervenant`
--
ALTER TABLE `intervenant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `intervention`
--
ALTER TABLE `intervention`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `locataire`
--
ALTER TABLE `locataire`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `toit`
--
ALTER TABLE `toit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_intervention`
--
ALTER TABLE `type_intervention`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD CONSTRAINT `FK5kn64l7l2m25kkryy4n50ikyb` FOREIGN KEY (`batiment_id`) REFERENCES `batiment` (`id`);

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `FKfiu9667ouphp1yd3nouktd5wu` FOREIGN KEY (`locataire`) REFERENCES `locataire` (`id`),
  ADD CONSTRAINT `FKlmy1ec3kj5spbu6mcfuxlc762` FOREIGN KEY (`appartement`) REFERENCES `appartement` (`id`);

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `FK1gq45xrtd7j688juiuto7vs3x` FOREIGN KEY (`intervenant_id`) REFERENCES `intervenant` (`id`),
  ADD CONSTRAINT `FKf6nntanyntpovh90a0u2hbj9v` FOREIGN KEY (`appartement_id`) REFERENCES `appartement` (`id`),
  ADD CONSTRAINT `FKg80odl92m1wv1d2hml6t82wo8` FOREIGN KEY (`type_intervention_id`) REFERENCES `type_intervention` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
