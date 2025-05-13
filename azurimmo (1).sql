-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 25 avr. 2025 à 08:40
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
  `nbre_pieces` int(11) DEFAULT NULL,
  `nb_pieces_original` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `appartement`
--

INSERT INTO `appartement` (`id`, `description`, `numero`, `surface`, `batiment_id`, `nbre_pieces`, `nb_pieces_original`) VALUES
(11, 'Studio', 102, 25.5, 14, 2, 5),
(12, 'Duplex', 333, 80.5, 15, 2, 7),
(16, 'Test', 33, 50, 14, 4, 6);

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
(1, '2025-01-01', 'Dupont', 'Jean-Phillipe'),
(2, '2015-03-05', 'De La Marre', 'Henri');

-- --------------------------------------------------------

--
-- Structure de la table `batiment`
--

CREATE TABLE `batiment` (
  `id` bigint(20) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `batiment`
--

INSERT INTO `batiment` (`id`, `adresse`, `ville`) VALUES
(14, '1 rue du château', 'Caen'),
(15, '16 rue André', 'Cheux'),
(17, '4 rue des lilas', 'Caen');

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
  `statut` varchar(255) DEFAULT NULL,
  `locataire_id` bigint(40) DEFAULT NULL,
  `appartement_id` bigint(20) DEFAULT NULL,
  `associe_id` bigint(20) DEFAULT NULL,
  `locataire` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `date_entree`, `date_sortie`, `montant_loyer`, `montant_charges`, `statut`, `locataire_id`, `appartement_id`, `associe_id`, `locataire`) VALUES
(16, '2005-01-01', '2010-02-15', 500, 50, 'Sorti', 9, 11, 2, 9),
(17, '2010-01-01', '2020-03-15', 700, 70, 'Sorti', 8, 11, 1, 8);

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
(4, 'TQ Group');

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

CREATE TABLE `intervention` (
  `id` bigint(20) NOT NULL,
  `date_intervention` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_intervention` varchar(255) DEFAULT NULL,
  `appartement_id` bigint(20) DEFAULT NULL,
  `entreprise_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `intervenant_id` bigint(20) DEFAULT NULL,
  `type_intervention_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `intervention`
--

INSERT INTO `intervention` (`id`, `date_intervention`, `description`, `type_intervention`, `appartement_id`, `entreprise_id`, `date`, `intervenant_id`, `type_intervention_id`) VALUES
(5, '2024-01-02', 'Réparation volet salon', 'Réparation', 12, 3, '2025-03-11', 1, 1),
(6, '2023-07-15', 'Débouchage évier', 'Dépannage', 11, 4, '2025-03-11', 2, 1),
(7, NULL, 'zergthyu', NULL, 11, NULL, '2003-05-01', 2, 1),
(8, NULL, 'Fuite du toit', NULL, 12, NULL, '2025-01-01', 2, 2),
(9, NULL, 'dez', NULL, 12, NULL, '2027-01-03', 2, 1);

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
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `locataire`
--

INSERT INTO `locataire` (`id`, `date_naissance`, `lieu_naissance`, `nom`, `prenom`, `telephone`, `email`) VALUES
(8, '1993-12-30', 'Lomé', 'Martin', 'Patrick', '06.06.06.06.06', 'test@gmail.com'),
(9, '1982-05-30', 'Bayeux', 'Gady', 'Bénédicte', '06.06.06.06.06', 'test@gmail.com'),
(10, '2005-03-29', 'Mont-Saint-Aignan', 'Bargas', 'Anaelle', '06.06.06.06.06', 'test@gmail.com'),
(11, '2005-03-29', 'Mont-Saint-Aignan', 'Bargas', 'Anaelle', '06.06.06.06.06', 'anaelle.bargas@sts-sio-caen.info'),
(12, '2005-03-29', 'Mont-Saint-Aignan', 'Bargas', 'MAella', '06.06.06.06.06', 'anaelle.bargas@sts-sio-caen.info');

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
(3, 'Réparations électriques');

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
-- Index pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1ahw6ibj07960n52ulfdoc96g` (`appartement_id`),
  ADD KEY `FKp7hols6tlsatgb3ve32kbn5sv` (`locataire_id`),
  ADD KEY `FKj40p46xa2cw18ynlgohbviwqd` (`associe_id`),
  ADD KEY `FKfiu9667ouphp1yd3nouktd5wu` (`locataire`);

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
  ADD KEY `FKnwedn20385e8gl68s5v9c93ta` (`entreprise_id`),
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `associe`
--
ALTER TABLE `associe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `batiment`
--
ALTER TABLE `batiment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `contrat`
--
ALTER TABLE `contrat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `intervention`
--
ALTER TABLE `intervention`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `locataire`
--
ALTER TABLE `locataire`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `FK1ahw6ibj07960n52ulfdoc96g` FOREIGN KEY (`appartement_id`) REFERENCES `appartement` (`id`),
  ADD CONSTRAINT `FKfiu9667ouphp1yd3nouktd5wu` FOREIGN KEY (`locataire`) REFERENCES `locataire` (`id`),
  ADD CONSTRAINT `FKj40p46xa2cw18ynlgohbviwqd` FOREIGN KEY (`associe_id`) REFERENCES `associe` (`id`),
  ADD CONSTRAINT `FKp7hols6tlsatgb3ve32kbn5sv` FOREIGN KEY (`locataire_id`) REFERENCES `locataire` (`id`);

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `FK1gq45xrtd7j688juiuto7vs3x` FOREIGN KEY (`intervenant_id`) REFERENCES `intervenant` (`id`),
  ADD CONSTRAINT `FKf6nntanyntpovh90a0u2hbj9v` FOREIGN KEY (`appartement_id`) REFERENCES `appartement` (`id`),
  ADD CONSTRAINT `FKg80odl92m1wv1d2hml6t82wo8` FOREIGN KEY (`type_intervention_id`) REFERENCES `type_intervention` (`id`),
  ADD CONSTRAINT `FKnwedn20385e8gl68s5v9c93ta` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
