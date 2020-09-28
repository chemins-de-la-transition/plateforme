-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Hôte : XXXXXXXXX
-- Généré le :  lun. 14 sep. 2020 à 15:48
-- Version du serveur :  5.6.48-log
-- Version de PHP :  7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `XXXXXXXXXX`
--

-- --------------------------------------------------------

--
-- Structure de la table `yeswiki_plateforme_triples`
--

CREATE TABLE `yeswiki_plateforme_triples` (
  `id` int(10) UNSIGNED NOT NULL,
  `resource` varchar(255) NOT NULL,
  `property` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `yeswiki_plateforme_triples`
--

INSERT INTO `yeswiki_plateforme_triples` (`id`, `resource`, `property`, `value`) VALUES
(1, 'ThisWikiGroup:admins', 'http://www.wikini.net/_vocabulary/acls', 'WikiAdmin'),
(2, 'TestDate', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(5, 'ListeType', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(8, 'YeswikidaY', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(12, 'CommentCaMarche', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(13, 'LaCarte', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(14, 'ListeTypeDeStructure', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(16, 'ListeDepartements', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(18, 'QuiSommesNous', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(19, 'ThisWikiGroup:editeurs', 'http://www.wikini.net/_vocabulary/acls', '@admins'),
(20, 'ThisWikiGroup:moderateurs', 'http://www.wikini.net/_vocabulary/acls', '@admins\r\n@editeurs'),
(21, 'AssembleeVirtuelle', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(24, 'AgricultureEtAlimentation', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(25, 'EnergiE', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(27, 'ArtisanatEtIndustrie', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(28, 'ModesDeVie', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(29, 'MobiliteS', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(30, 'HabitatEtBatiment', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(31, 'EngagementCitoyen', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(32, 'EducationFormation', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(33, 'DeveloppementTerritorial', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(34, 'GouvernanceEtModesDOrganisation', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(35, 'InformatiqueInternetWeb', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(36, 'SanteEtBienEtre', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(38, 'ListeTypeDAccueil', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(39, 'ListeTarif', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(40, 'ListeTypeDeLogement', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(41, 'ListeDureeDeSejour', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(49, 'Evenements', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(50, 'Aide_FAQ', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(54, 'ChartE', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(55, 'Contact', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(59, 'JusticE', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(60, 'SoiN', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(61, 'CultureSportDivertissement', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(62, 'TestDEvenement', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(64, 'MenuiserieArtisanatBois', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(65, 'RestaurationDeMeubles', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(66, 'TapisseriE', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(67, 'AccompagnementCreationDActivite', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(68, 'CuisineBioLocale', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(69, 'TransformationDeProduitsFrais', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(70, 'MaraichagE', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(71, 'BoulangerieModalitesDApprentissageALAnci', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(72, 'ContructionsDeTinyHouses', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(73, 'TesT', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(76, 'RegionOccitanie', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(77, 'RegionGrandEst', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(78, 'AdemE', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(79, 'AssembleeVirtuelle2', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(80, 'TerritoireEnCommun', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(81, 'CoopDesTerritoires', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(82, 'PetitsDebrouillardsGrandEst', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(83, 'BretagneTransition', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(84, 'CooperativeOasis', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(85, 'TransiscopE', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(86, 'LowTechLab', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(87, 'CeebioS', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(88, 'LesGrandsVoisins', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(89, 'LaCoopDesCommuns', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(92, 'LowtechLabFabLabRecyclerie', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(93, 'LowtechLabFabLabRecyclerie2', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(94, 'Test2', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(113, 'ListeTypeDePartenariat', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(114, 'MouvementPourLEconomieSolidaireOccitanie', 'http://outils-reseaux.org/_vocabulary/type', 'fiche_bazar'),
(115, 'Ecosystème', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(122, 'CommentCaMarche_Voyageur_Apprenant', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(123, 'CommentCaMarche_Contributeur', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(124, 'CommentCaMarche_Modérateur', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}'),
(125, 'ListeModeration', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(128, 'ListeOuiNon', 'http://outils-reseaux.org/_vocabulary/type', 'liste'),
(131, 'Partenaires', 'http://outils-reseaux.org/_vocabulary/metadata', '{\"theme\":\"margot\",\"style\":\"margot.css\",\"squelette\":\"1col.tpl.html\",\"bgimg\":\"\"}');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `yeswiki_plateforme_triples`
--
ALTER TABLE `yeswiki_plateforme_triples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resource` (`resource`(191)),
  ADD KEY `property` (`property`(191));

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `yeswiki_plateforme_triples`
--
ALTER TABLE `yeswiki_plateforme_triples`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
