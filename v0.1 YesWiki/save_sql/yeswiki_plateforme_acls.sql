-- SQL Dump
-- ArchiveAction Version
-- 
-- Generated on : 2021-09-23T17:32:09+02:00
-- PHP version : 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------


-- 
-- Structure of table : `yeswiki_plateforme_acls`
-- 

CREATE TABLE `yeswiki_plateforme_acls` (
  `page_tag` varchar(191) NOT NULL,
  `privilege` varchar(20) NOT NULL,
  `list` text NOT NULL,
  PRIMARY KEY (`page_tag`,`privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Data of table : `yeswiki_plateforme_acls`
-- 

INSERT INTO `yeswiki_plateforme_acls` (`page_tag`, `privilege`, `list`) VALUES
('AB', 'comment', '*'),
('AB', 'read', '%
@moderateurs'),
('AB', 'write', '%
@moderateurs'),
('AccompagnementCreationDActivite', 'comment', '@admins'),
('AccompagnementCreationDActivite', 'read', '*'),
('AccompagnementCreationDActivite', 'write', '*'),
('AccueiL', 'comment', ''),
('AccueiL', 'write', '@editeurs'),
('ActualiteLieuEvenementLieuDeMarie', 'comment', '*'),
('ActualiteLieuEvenementLieuDeMarie', 'read', '*'),
('ActualiteLieuEvenementLieuDeMarie', 'write', '%
@moderateurs'),
('ActualiteLieuTest', 'comment', ''),
('ActualiteLieuTest', 'read', '@Lieux'),
('ActualiteLieuTest', 'write', '@Lieux'),
('ActualiteLieuTest5656', 'comment', ''),
('ActualiteLieuTest5656', 'read', '@Lieux'),
('ActualiteLieuTest5656', 'write', '@Lieux'),
('ActualiteLieuTestst', 'comment', ''),
('ActualiteLieuTestst', 'read', '@Lieux'),
('ActualiteLieuTestst', 'write', '@Lieux'),
('ActualiteLieuTesy78678', 'comment', '@admins'),
('ActualiteLieuTesy78678', 'read', '*'),
('ActualiteLieuTesy78678', 'write', '*'),
('AdemE', 'comment', '@admins'),
('AdemE', 'read', '*'),
('AdemE', 'write', '*'),
('AgricultureEtAlimentation', 'comment', ''),
('AgricultureEtAlimentation', 'read', '*'),
('AgricultureEtAlimentation', 'write', '@moderateurs'),
('AgroforesteriE', 'comment', ''),
('AgroforesteriE', 'read', '*'),
('AgroforesteriE', 'write', '@moderateurs'),
('AidE', 'comment', ''),
('AidE', 'write', '@editeurs'),
('AideTypeDeVoyage', 'comment', '@admins'),
('AideTypeDeVoyage', 'read', '*'),
('AideTypeDeVoyage', 'write', '@editeurs'),
('Aide_DenominationRaisonSociale', 'comment', ''),
('Aide_DenominationRaisonSociale', 'write', '@editeurs'),
('Aide_FAQ', 'comment', ''),
('Aide_FAQ', 'write', '@editeurs'),
('Aide_OpenBadges', 'comment', '@admins'),
('Aide_OpenBadges', 'read', '*'),
('Aide_OpenBadges', 'write', '@editeurs'),
('Aide_ParcoursThematiques', 'comment', '@admins'),
('Aide_ParcoursThematiques', 'read', '*'),
('Aide_ParcoursThematiques', 'write', '@editeurs'),
('AilleurS', 'comment', '*'),
('AilleurS', 'read', '*'),
('AilleurS', 'write', '%
@moderateurs'),
('AjouterLieux', 'comment', ''),
('AjouterLieux', 'read', '@Lieux'),
('AjouterLieux', 'write', '@editeurs'),
('AjouterLieux_PasDAcces', 'comment', ''),
('AjouterLieux_PasDAcces', 'write', '@editeurs'),
('AjouterLieux_Reussite', 'comment', '@admins'),
('AjouterLieux_Reussite', 'read', '*'),
('AjouterLieux_Reussite', 'write', '@editeurs'),
('AjouterUneCompetence', 'comment', '@admins'),
('AjouterUneCompetence', 'read', '*'),
('AjouterUneCompetence', 'write', '@editeurs'),
('AjouterUneFiche_Contributeur', 'comment', '@admins'),
('AjouterUneFiche_Contributeur', 'read', '*'),
('AjouterUneFiche_Contributeur', 'write', '@editeurs'),
('AjouterUneFiche_Voyageur', 'comment', ''),
('AjouterUneFiche_Voyageur', 'write', '@editeurs'),
('AjouterUneThematique', 'comment', '@admins'),
('AjouterUneThematique', 'read', '@moderateurs'),
('AjouterUneThematique', 'write', '@admins'),
('Archive2020_ListeDesThematiques', 'comment', ''),
('Archive2020_ListeDesThematiques', 'read', '*'),
('Archive2020_ListeDesThematiques', 'write', '@editeurs'),
('ArtisanatEtIndustrie', 'comment', ''),
('ArtisanatEtIndustrie', 'read', '*'),
('ArtisanatEtIndustrie', 'write', '@moderateurs'),
('AssembleeVirtuelle', 'comment', '@admins'),
('AssembleeVirtuelle', 'read', '*'),
('AssembleeVirtuelle', 'write', '*'),
('AssembleeVirtuelle2', 'comment', '@admins'),
('AssembleeVirtuelle2', 'read', '*'),
('AssembleeVirtuelle2', 'write', '*'),
('ATraversChamps', 'comment', '*'),
('ATraversChamps', 'read', '*'),
('ATraversChamps', 'write', '%
@moderateurs'),
('AuPainLeve', 'comment', '*'),
('AuPainLeve', 'read', '*'),
('AuPainLeve', 'write', '%
@moderateurs'),
('AutreTest', 'comment', '@admins'),
('AutreTest', 'read', '*'),
('AutreTest', 'write', '*'),
('AzErty', 'comment', '@admins'),
('AzErty', 'read', '*'),
('AzErty', 'write', '*'),
('BazaR', 'comment', ''),
('BazaR', 'read', '@editeurs'),
('BazaR', 'write', '@admins'),
('BilA', 'comment', '*'),
('BilA', 'read', '*'),
('BilA', 'write', '%
@moderateurs'),
('Blog_saisir', 'comment', '@admins'),
('Blog_saisir', 'read', '*'),
('Blog_saisir', 'write', '@editeurs'),
('Blog_Temoignages', 'comment', '@admins'),
('Blog_Temoignages', 'read', '@editeurs'),
('Blog_Temoignages', 'write', '@editeurs'),
('Blog_WikiHow', 'comment', '@admins'),
('Blog_WikiHow', 'read', '@editeurs'),
('Blog_WikiHow', 'write', '@editeurs'),
('Bordanova3pA', 'comment', '*'),
('Bordanova3pA', 'read', '*'),
('Bordanova3pA', 'write', '%
@moderateurs'),
('BoulangerieModalitesDApprentissageALAnci', 'comment', '@admins'),
('BoulangerieModalitesDApprentissageALAnci', 'read', '*'),
('BoulangerieModalitesDApprentissageALAnci', 'write', '*'),
('BretagneTransition', 'comment', '@admins'),
('BretagneTransition', 'read', '*'),
('BretagneTransition', 'write', '*'),
('Carte_avec_Facettes', 'comment', '@admins'),
('Carte_avec_Facettes', 'read', '*'),
('Carte_avec_Facettes', 'write', '@editeurs'),
('CartoLieux', 'comment', ''),
('CartoLieux', 'write', '@editeurs'),
('CastainG', 'comment', '*'),
('CastainG', 'read', '*'),
('CastainG', 'write', '%
@moderateurs'),
('CeciEtCela', 'comment', '*'),
('CeciEtCela', 'read', '*'),
('CeciEtCela', 'write', '%
@moderateurs'),
('CeebioS', 'comment', '@admins'),
('CeebioS', 'read', '*'),
('CeebioS', 'write', '*'),
('ChartE', 'comment', ''),
('ChartE', 'write', '@editeurs'),
('Chemin_VeloBambou', 'comment', '@admins'),
('Chemin_VeloBambou', 'read', '@editeurs'),
('Chemin_VeloBambou', 'write', '@editeurs'),
('CommentCaM', 'comment', ''),
('CommentCaM', 'write', '@editeurs'),
('CommentCaMarche', 'comment', ''),
('CommentCaMarche', 'write', '@editeurs'),
('CommentCaMarche_Collectivite', 'comment', '@admins'),
('CommentCaMarche_Collectivite', 'read', '@editeurs'),
('CommentCaMarche_Collectivite', 'write', '@editeurs'),
('CommentCaMarche_Contributeur', 'comment', ''),
('CommentCaMarche_Contributeur', 'write', '@editeurs'),
('CommentCaMarche_Initiative_Accueillante', 'comment', '@admins'),
('CommentCaMarche_Initiative_Accueillante', 'read', '*'),
('CommentCaMarche_Initiative_Accueillante', 'write', '@editeurs'),
('CommentCaMarche_Voyageur', 'comment', ''),
('CommentCaMarche_Voyageur', 'write', '@editeurs'),
('ConnaissanceDesPlantesAromatiquesEtMedicin', 'comment', '@admins'),
('ConnaissanceDesPlantesAromatiquesEtMedicin', 'read', '*'),
('ConnaissanceDesPlantesAromatiquesEtMedicin', 'write', '*'),
('Contact', 'comment', ''),
('Contact', 'write', '@editeurs'),
('Contact_Email', 'comment', ''),
('Contact_Email', 'write', '@editeurs'),
('Contact_Email_Dev', 'comment', '@admins'),
('Contact_Email_Dev', 'read', '*'),
('Contact_Email_Dev', 'write', '@admins'),
('Contact_RGPD', 'comment', '@admins'),
('Contact_RGPD', 'read', '*'),
('Contact_RGPD', 'write', '@moderateurs'),
('Contact_technique', 'comment', '@admins'),
('Contact_technique', 'read', '*'),
('Contact_technique', 'write', '@admins'),
('ContructionsDeTinyHouses', 'comment', '@admins'),
('ContructionsDeTinyHouses', 'read', '*'),
('ContructionsDeTinyHouses', 'write', '*'),
('CoopDesTerritoires', 'comment', '@admins'),
('CoopDesTerritoires', 'read', '*'),
('CoopDesTerritoires', 'write', '*'),
('CooperativeOasis', 'comment', '@admins'),
('CooperativeOasis', 'read', '*'),
('CooperativeOasis', 'write', '*'),
('CoursUtilisationYesWiki', 'comment', ''),
('CoursUtilisationYesWiki', 'write', '@editeurs'),
('CuisineBioLocale', 'comment', '@admins'),
('CuisineBioLocale', 'read', '*'),
('CuisineBioLocale', 'write', '*'),
('CultureSportDivertissement', 'comment', ''),
('CultureSportDivertissement', 'read', '*'),
('CultureSportDivertissement', 'write', '@moderateurs'),
('DerniersChangementsRSS', 'comment', '@admins'),
('DerniersChangementsRSS', 'read', '*'),
('DerniersChangementsRSS', 'write', '@admins'),
('DeveloppementTerritorial', 'comment', ''),
('DeveloppementTerritorial', 'read', '*'),
('DeveloppementTerritorial', 'write', '@moderateurs'),
('EcosytemeCdlT', 'comment', '@admins'),
('EcosytemeCdlT', 'read', '*'),
('EcosytemeCdlT', 'write', '@editeurs'),
('EducationFormation', 'comment', ''),
('EducationFormation', 'read', '*'),
('EducationFormation', 'write', '@moderateurs'),
('EmmausLabartheSurLeze', 'comment', '*'),
('EmmausLabartheSurLeze', 'read', '*'),
('EmmausLabartheSurLeze', 'write', '%
@moderateurs'),
('EncoreNouveaucompte', 'comment', '*'),
('EncoreNouveaucompte', 'read', '%
@moderateurs'),
('EncoreNouveaucompte', 'write', '%
@moderateurs'),
('EnergiE', 'comment', ''),
('EnergiE', 'read', '*'),
('EnergiE', 'write', '@moderateurs'),
('EngagementCitoyen', 'comment', ''),
('EngagementCitoyen', 'read', '*'),
('EngagementCitoyen', 'write', '@moderateurs'),
('EnqueteLieuxItineraireBisMR', 'comment', '@admins'),
('EnqueteLieuxItineraireBisMR', 'read', '*'),
('EnqueteLieuxItineraireBisMR', 'write', '*'),
('EnqueteLieuxListefiche5bfLieuMR', 'comment', '*'),
('EnqueteLieuxListefiche5bfLieuMR', 'read', '*'),
('EnqueteLieuxListefiche5bfLieuMR', 'write', '%
@moderateurs'),
('Espace_Moderateurs', 'comment', '@admins'),
('Espace_Moderateurs', 'read', '@moderateurs'),
('Espace_Moderateurs', 'write', '@editeurs'),
('Espace_Moderateurs_Import', 'comment', '@admins'),
('Espace_Moderateurs_Import', 'read', '@moderateurs'),
('Espace_Moderateurs_Import', 'write', '@admins'),
('Espace_Moderateurs_Lieux_a_moderer_Carte', 'comment', '@admins'),
('Espace_Moderateurs_Lieux_a_moderer_Carte', 'read', '@moderateurs'),
('Espace_Moderateurs_Lieux_a_moderer_Carte', 'write', '@editeurs'),
('Espace_Moderateurs_Lieux_a_moderer_Liste', 'comment', '@admins'),
('Espace_Moderateurs_Lieux_a_moderer_Liste', 'read', '@moderateurs'),
('Espace_Moderateurs_Lieux_a_moderer_Liste', 'write', '@editeurs'),
('Evenements', 'comment', '@admins'),
('Evenements', 'read', '*'),
('Evenements', 'write', '@editeurs'),
('Evenements_Ajouter_Voyages_Apprenants', 'comment', '@admins'),
('Evenements_Ajouter_Voyages_Apprenants', 'read', '@moderateurs'),
('Evenements_Ajouter_Voyages_Apprenants', 'write', '@editeurs'),
('Evenements_Prochains_Voyages_Apprenants', 'comment', ''),
('Evenements_Prochains_Voyages_Apprenants', 'write', '@editeurs'),
('Evenements_Prochains_Voyages_Apprenants_Vue_Agenda', 'comment', ''),
('Evenements_Prochains_Voyages_Apprenants_Vue_Agenda', 'write', '@editeurs'),
('Evenements_SaisirAgenda', 'comment', '@admins'),
('Evenements_SaisirAgenda', 'read', '@Lieux'),
('Evenements_SaisirAgenda', 'write', '@editeurs'),
('Evenements_VueActivite', 'comment', '@admins'),
('Evenements_VueActivite', 'read', '*'),
('Evenements_VueActivite', 'write', '@editeurs'),
('Evenements_VueAgenda', 'comment', '@admins'),
('Evenements_VueAgenda', 'read', '*'),
('Evenements_VueAgenda', 'write', '@editeurs'),
('Evenements_VueCarte', 'comment', '@admins'),
('Evenements_VueCarte', 'read', '*'),
('Evenements_VueCarte', 'write', '@editeurs'),
('Exemples_de_Tags', 'comment', '@admins'),
('Exemples_de_Tags', 'read', '*'),
('Exemples_de_Tags', 'write', '@moderateurs'),
('Exemples_de_Tags_2', 'comment', '@admins'),
('Exemples_de_Tags_2', 'read', '*'),
('Exemples_de_Tags_2', 'write', '@moderateurs'),
('Exemples_de_Tags_3', 'comment', '@admins'),
('Exemples_de_Tags_3', 'read', '*'),
('Exemples_de_Tags_3', 'write', '@moderateurs'),
('FermeAttitude', 'comment', '*'),
('FermeAttitude', 'read', '*'),
('FermeAttitude', 'write', '%
@moderateurs'),
('FermementBon', 'comment', '*'),
('FermementBon', 'read', '*'),
('FermementBon', 'write', '%
@moderateurs'),
('FicheContributeurJeremyDufraisse', 'comment', '% @moderateurs'),
('FicheContributeurJeremyDufraisse', 'read', '%
@moderateurs'),
('FicheContributeurJeremyDufraisse', 'write', '%
@moderateurs'),
('FicheContributeurSebastienRosset', 'comment', '% @moderateurs'),
('FicheContributeurSebastienRosset', 'read', '%
@moderateurs'),
('FicheContributeurSebastienRosset', 'write', '%
@moderateurs'),
('FicheTest', 'comment', '*'),
('FicheTest', 'read', '*'),
('FicheTest', 'write', 'JeremyDufraisse'),
('FicheTest2', 'comment', '*'),
('FicheTest2', 'read', '*'),
('FicheTest2', 'write', 'JeremyDufraisse'),
('FontA', 'comment', '*'),
('FontA', 'read', '*'),
('FontA', 'write', '%
@moderateurs'),
('GererConfig', 'comment', '@admins'),
('GererConfig', 'read', '@admins'),
('GererConfig', 'write', '@admins'),
('GererDroits', 'comment', '@admins'),
('GererDroits', 'read', '@admins'),
('GererDroits', 'write', '@admins'),
('GererMisesAJour', 'comment', ''),
('GererMisesAJour', 'read', '@editeurs'),
('GererMisesAJour', 'write', '@admins'),
('GererMotsCles', 'comment', '@admins'),
('GererMotsCles', 'read', '@moderateurs'),
('GererMotsCles', 'write', '@admins'),
('GererSite', 'comment', ''),
('GererSite', 'read', '@editeurs'),
('GererSite', 'write', '@admins'),
('GererThemes', 'comment', ''),
('GererThemes', 'read', '@editeurs'),
('GererThemes', 'write', '@admins'),
('GererUtilisateurs', 'comment', ''),
('GererUtilisateurs', 'read', '@editeurs'),
('GererUtilisateurs', 'write', '@admins'),
('GouvernanceEtModesDOrganisation', 'comment', ''),
('GouvernanceEtModesDOrganisation', 'read', '*'),
('GouvernanceEtModesDOrganisation', 'write', '@moderateurs'),
('HabitatEtBatiment', 'comment', ''),
('HabitatEtBatiment', 'read', '*'),
('HabitatEtBatiment', 'write', '@moderateurs'),
('HugoBeharThinieres', 'comment', '@admins'),
('HugoBeharThinieres', 'read', '*'),
('HugoBeharThinieres', 'write', '*'),
('InformatiqueInternetWeb', 'comment', ''),
('InformatiqueInternetWeb', 'read', '*'),
('InformatiqueInternetWeb', 'write', '@moderateurs'),
('ItineraireBis', 'comment', '*'),
('ItineraireBis', 'read', '*'),
('ItineraireBis', 'write', '%
@moderateurs'),
('ItineraireBis2', 'comment', '*'),
('ItineraireBis2', 'read', '*'),
('ItineraireBis2', 'write', '%
@moderateurs'),
('JusticE', 'comment', ''),
('JusticE', 'read', '*'),
('JusticE', 'write', '@moderateurs'),
('KiloStoreKids', 'comment', '*'),
('KiloStoreKids', 'read', '*'),
('KiloStoreKids', 'write', '%
@moderateurs'),
('LaBoulangeDAngeline', 'comment', '*'),
('LaBoulangeDAngeline', 'read', '*'),
('LaBoulangeDAngeline', 'write', '%
@moderateurs'),
('LaBoulangerieDeMaurice', 'comment', '*'),
('LaBoulangerieDeMaurice', 'read', '*'),
('LaBoulangerieDeMaurice', 'write', '%
@moderateurs'),
('LaBrewlangerie', 'comment', '*'),
('LaBrewlangerie', 'read', '*'),
('LaBrewlangerie', 'write', '%
@moderateurs'),
('LaCarte', 'comment', ''),
('LaCarte', 'write', '@editeurs'),
('LaCarte_Compagnonnage', 'comment', '@admins'),
('LaCarte_Compagnonnage', 'read', '*'),
('LaCarte_Compagnonnage', 'write', '@editeurs'),
('LaCarte_Ecotourisme', 'comment', ''),
('LaCarte_Ecotourisme', 'write', '@editeurs'),
('LaCarte_RechercheAvancee', 'comment', '@admins'),
('LaCarte_RechercheAvancee', 'read', '*'),
('LaCarte_RechercheAvancee', 'write', '@editeurs'),
('LaCarte_VoyageApprenant', 'comment', '@admins'),
('LaCarte_VoyageApprenant', 'read', '*'),
('LaCarte_VoyageApprenant', 'write', '@editeurs'),
('LaCarte_Woofing', 'comment', '@admins'),
('LaCarte_Woofing', 'read', '*'),
('LaCarte_Woofing', 'write', '@editeurs'),
('LaChouetteCoop', 'comment', '*'),
('LaChouetteCoop', 'read', '*'),
('LaChouetteCoop', 'write', '%
@moderateurs'),
('LaCoopDesCommuns', 'comment', '@admins'),
('LaCoopDesCommuns', 'read', '*'),
('LaCoopDesCommuns', 'write', '*'),
('LaFermeDesViolettes', 'comment', '*'),
('LaFermeDesViolettes', 'read', '*'),
('LaFermeDesViolettes', 'write', '%
@moderateurs'),
('LaGlanerie', 'comment', '*'),
('LaGlanerie', 'read', '*'),
('LaGlanerie', 'write', '%
@moderateurs'),
('LaMaisonDuCairn', 'comment', '*'),
('LaMaisonDuCairn', 'read', '*'),
('LaMaisonDuCairn', 'write', '%
@moderateurs'),
('LaMijoteuse', 'comment', '*'),
('LaMijoteuse', 'read', '*'),
('LaMijoteuse', 'write', '%
@moderateurs'),
('LaPasserelleNegreneys', 'comment', '*'),
('LaPasserelleNegreneys', 'read', '*'),
('LaPasserelleNegreneys', 'write', '%
@moderateurs'),
('LaRebooterie', 'comment', '*'),
('LaRebooterie', 'read', '*'),
('LaRebooterie', 'write', '%
@moderateurs'),
('Le100EmeSinge', 'comment', '*'),
('Le100EmeSinge', 'read', '*'),
('Le100EmeSinge', 'write', '%
@moderateurs'),
('LeColibri', 'comment', '*'),
('LeColibri', 'read', '*'),
('LeColibri', 'write', '%
@moderateurs'),
('LePainDeLOustal', 'comment', '*'),
('LePainDeLOustal', 'read', '*'),
('LePainDeLOustal', 'write', '%
@moderateurs'),
('LePainPerdu', 'comment', '*'),
('LePainPerdu', 'read', '*'),
('LePainPerdu', 'write', '%
@moderateurs'),
('LePatapain', 'comment', '*'),
('LePatapain', 'read', '*'),
('LePatapain', 'write', '%
@moderateurs'),
('LesCyclesRe', 'comment', '*'),
('LesCyclesRe', 'read', '*'),
('LesCyclesRe', 'write', '%
@moderateurs'),
('LesDelicatessesDeLionelGanard', 'comment', '*'),
('LesDelicatessesDeLionelGanard', 'read', '*'),
('LesDelicatessesDeLionelGanard', 'write', '%
@moderateurs'),
('LesGrandsVoisins', 'comment', '@admins'),
('LesGrandsVoisins', 'read', '*'),
('LesGrandsVoisins', 'write', '*'),
('LesImaginationsFertiles', 'comment', '*'),
('LesImaginationsFertiles', 'read', '*'),
('LesImaginationsFertiles', 'write', '%
@moderateurs'),
('LeStudioFoulescreen', 'comment', '*'),
('LeStudioFoulescreen', 'read', '*'),
('LeStudioFoulescreen', 'write', '%
@moderateurs'),
('LesVelosDeNico', 'comment', '*'),
('LesVelosDeNico', 'read', '*'),
('LesVelosDeNico', 'write', '%
@moderateurs'),
('LieuDeMarie', 'comment', '*'),
('LieuDeMarie', 'read', '*'),
('LieuDeMarie', 'write', '%
@moderateurs'),
('LieudetesT', 'comment', '*'),
('LieudetesT', 'read', '*'),
('LieudetesT', 'write', '%
@moderateurs'),
('Lieux_Sondage', 'comment', '@admins'),
('Lieux_Sondage', 'read', '*'),
('Lieux_Sondage', 'write', '@editeurs'),
('LilegaL', 'comment', '*'),
('LilegaL', 'read', '*'),
('LilegaL', 'write', '%
@moderateurs'),
('ListeAccessibilite', 'comment', ''),
('ListeAccessibilite', 'write', '@editeurs'),
('ListeCategoriesDuBlog', 'comment', ''),
('ListeCategoriesDuBlog', 'write', '@editeurs'),
('ListeDepartements', 'comment', ''),
('ListeDepartements', 'write', '@editeurs'),
('ListeDureeDeSejour', 'comment', ''),
('ListeDureeDeSejour', 'write', '@editeurs'),
('ListeInformationsSurLesEvenements', 'comment', ''),
('ListeInformationsSurLesEvenements', 'read', '*'),
('ListeInformationsSurLesEvenements', 'write', '@editeurs'),
('ListeModeration', 'comment', ''),
('ListeModeration', 'write', '@editeurs'),
('ListeModerationContributeur', 'comment', ''),
('ListeModerationContributeur', 'write', '@editeurs'),
('ListeMois', 'comment', ''),
('ListeMois', 'write', '@editeurs'),
('ListeOuiNon', 'comment', ''),
('ListeOuiNon', 'write', '@editeurs'),
('ListeTarif', 'comment', ''),
('ListeTarif', 'write', '@editeurs'),
('ListeType', 'comment', ''),
('ListeType', 'write', '@editeurs'),
('ListeTypeDAccueil', 'comment', ''),
('ListeTypeDAccueil', 'write', '@editeurs'),
('ListeTypeDAttentes', 'comment', ''),
('ListeTypeDAttentes', 'write', '@editeurs'),
('ListeTypeDeContribution', 'comment', ''),
('ListeTypeDeContribution', 'write', '@editeurs'),
('ListeTypeDeLogement', 'comment', ''),
('ListeTypeDeLogement', 'write', '@editeurs'),
('ListeTypeDePartenariat', 'comment', ''),
('ListeTypeDePartenariat', 'write', '@editeurs'),
('ListeTypeDeStructure', 'comment', ''),
('ListeTypeDeStructure', 'write', '@editeurs'),
('ListeTypeDeVoyageurs', 'comment', ''),
('ListeTypeDeVoyageurs', 'write', '@editeurs'),
('LogDesActionsAdministratives20200805', 'comment', '@admins'),
('LogDesActionsAdministratives20200805', 'read', '*'),
('LogDesActionsAdministratives20200805', 'write', '*'),
('LogDesActionsAdministratives20200806', 'comment', '@admins'),
('LogDesActionsAdministratives20200806', 'read', '*'),
('LogDesActionsAdministratives20200806', 'write', '*'),
('LogDesActionsAdministratives20200811', 'comment', '@admins'),
('LogDesActionsAdministratives20200811', 'read', '*'),
('LogDesActionsAdministratives20200811', 'write', '*'),
('LogDesActionsAdministratives20200813', 'comment', '@admins'),
('LogDesActionsAdministratives20200813', 'read', '*'),
('LogDesActionsAdministratives20200813', 'write', '*'),
('LogDesActionsAdministratives20200814', 'comment', '@admins'),
('LogDesActionsAdministratives20200814', 'read', '*'),
('LogDesActionsAdministratives20200814', 'write', '*'),
('LogDesActionsAdministratives20200816', 'comment', '@admins'),
('LogDesActionsAdministratives20200816', 'read', '*'),
('LogDesActionsAdministratives20200816', 'write', '*'),
('LogDesActionsAdministratives20200818', 'comment', '@admins'),
('LogDesActionsAdministratives20200818', 'read', '*'),
('LogDesActionsAdministratives20200818', 'write', '*'),
('LogDesActionsAdministratives20200820', 'comment', '@admins'),
('LogDesActionsAdministratives20200820', 'read', '*'),
('LogDesActionsAdministratives20200820', 'write', '*'),
('LogDesActionsAdministratives20200901', 'comment', '@admins'),
('LogDesActionsAdministratives20200901', 'read', '*'),
('LogDesActionsAdministratives20200901', 'write', '*'),
('LogDesActionsAdministratives20200902', 'comment', '@admins'),
('LogDesActionsAdministratives20200902', 'read', '*'),
('LogDesActionsAdministratives20200902', 'write', '*'),
('LogDesActionsAdministratives20200904', 'comment', '@admins'),
('LogDesActionsAdministratives20200904', 'read', '*'),
('LogDesActionsAdministratives20200904', 'write', '*'),
('LogDesActionsAdministratives20200910', 'comment', '@admins'),
('LogDesActionsAdministratives20200910', 'read', '*'),
('LogDesActionsAdministratives20200910', 'write', '*'),
('LogDesActionsAdministratives20200911', 'comment', '@admins'),
('LogDesActionsAdministratives20200911', 'read', '*'),
('LogDesActionsAdministratives20200911', 'write', '*'),
('LogDesActionsAdministratives20200912', 'comment', '@admins'),
('LogDesActionsAdministratives20200912', 'read', '*'),
('LogDesActionsAdministratives20200912', 'write', '*'),
('LogDesActionsAdministratives20200914', 'comment', '@admins'),
('LogDesActionsAdministratives20200914', 'read', '*'),
('LogDesActionsAdministratives20200914', 'write', '*'),
('LogDesActionsAdministratives20200915', 'comment', '@admins'),
('LogDesActionsAdministratives20200915', 'read', '*'),
('LogDesActionsAdministratives20200915', 'write', '*'),
('LogDesActionsAdministratives20200916', 'comment', '@admins'),
('LogDesActionsAdministratives20200916', 'read', '*'),
('LogDesActionsAdministratives20200916', 'write', '*'),
('LogDesActionsAdministratives20200917', 'comment', '@admins'),
('LogDesActionsAdministratives20200917', 'read', '*'),
('LogDesActionsAdministratives20200917', 'write', '*'),
('LogDesActionsAdministratives20201005', 'comment', '@admins'),
('LogDesActionsAdministratives20201005', 'read', '*'),
('LogDesActionsAdministratives20201005', 'write', '*'),
('LogDesActionsAdministratives20201006', 'comment', '@admins'),
('LogDesActionsAdministratives20201006', 'read', '*'),
('LogDesActionsAdministratives20201006', 'write', '*'),
('LogDesActionsAdministratives20201007', 'comment', '@admins'),
('LogDesActionsAdministratives20201007', 'read', '*'),
('LogDesActionsAdministratives20201007', 'write', '*'),
('LogDesActionsAdministratives20201008', 'comment', '@admins'),
('LogDesActionsAdministratives20201008', 'read', '*'),
('LogDesActionsAdministratives20201008', 'write', '*'),
('LogDesActionsAdministratives20201011', 'comment', '@admins'),
('LogDesActionsAdministratives20201011', 'read', '*'),
('LogDesActionsAdministratives20201011', 'write', '*'),
('LogDesActionsAdministratives20201012', 'comment', '@admins'),
('LogDesActionsAdministratives20201012', 'read', '*'),
('LogDesActionsAdministratives20201012', 'write', '*'),
('LogDesActionsAdministratives20201013', 'comment', '@admins'),
('LogDesActionsAdministratives20201013', 'read', '*'),
('LogDesActionsAdministratives20201013', 'write', '*'),
('LogDesActionsAdministratives20201015', 'comment', '@admins'),
('LogDesActionsAdministratives20201015', 'read', '*'),
('LogDesActionsAdministratives20201015', 'write', '*'),
('LogDesActionsAdministratives20201021', 'comment', '@admins'),
('LogDesActionsAdministratives20201021', 'read', '*'),
('LogDesActionsAdministratives20201021', 'write', '*'),
('LogDesActionsAdministratives20201022', 'comment', '@admins'),
('LogDesActionsAdministratives20201022', 'read', '*'),
('LogDesActionsAdministratives20201022', 'write', '*'),
('LogDesActionsAdministratives20201023', 'comment', '@admins'),
('LogDesActionsAdministratives20201023', 'read', '*'),
('LogDesActionsAdministratives20201023', 'write', '*'),
('LogDesActionsAdministratives20201026', 'comment', '@admins'),
('LogDesActionsAdministratives20201026', 'read', '*'),
('LogDesActionsAdministratives20201026', 'write', '*'),
('LogDesActionsAdministratives20201027', 'comment', '@admins'),
('LogDesActionsAdministratives20201027', 'read', '*'),
('LogDesActionsAdministratives20201027', 'write', '*'),
('LogDesActionsAdministratives20201102', 'comment', '@admins'),
('LogDesActionsAdministratives20201102', 'read', '*'),
('LogDesActionsAdministratives20201102', 'write', '*'),
('LogDesActionsAdministratives20201103', 'comment', '@admins'),
('LogDesActionsAdministratives20201103', 'read', '*'),
('LogDesActionsAdministratives20201103', 'write', '*'),
('LogDesActionsAdministratives20201109', 'comment', '@admins'),
('LogDesActionsAdministratives20201109', 'read', '*'),
('LogDesActionsAdministratives20201109', 'write', '*'),
('LogDesActionsAdministratives20201112', 'comment', '@admins'),
('LogDesActionsAdministratives20201112', 'read', '*'),
('LogDesActionsAdministratives20201112', 'write', '*'),
('LogDesActionsAdministratives20201114', 'comment', '@admins'),
('LogDesActionsAdministratives20201114', 'read', '*'),
('LogDesActionsAdministratives20201114', 'write', '*'),
('LogDesActionsAdministratives20201115', 'comment', '@admins'),
('LogDesActionsAdministratives20201115', 'read', '*'),
('LogDesActionsAdministratives20201115', 'write', '*'),
('LookWiki', 'comment', ''),
('LookWiki', 'read', '@editeurs'),
('LookWiki', 'write', '@admins'),
('LowtecH', 'comment', '*'),
('LowtecH', 'read', '*'),
('LowtecH', 'write', '@moderateurs'),
('LowTechLab', 'comment', '@admins'),
('LowTechLab', 'read', '*'),
('LowTechLab', 'write', '*'),
('LUsinotopie', 'comment', '*'),
('LUsinotopie', 'read', '*'),
('LUsinotopie', 'write', '%
@moderateurs'),
('MaisonArnoult', 'comment', '*'),
('MaisonArnoult', 'read', '*'),
('MaisonArnoult', 'write', '%
@moderateurs'),
('MaisonBeauhaire', 'comment', '*'),
('MaisonBeauhaire', 'read', '*'),
('MaisonBeauhaire', 'write', '%
@moderateurs'),
('MaisonMauranesAuPecheMignonAu82', 'comment', '*'),
('MaisonMauranesAuPecheMignonAu82', 'read', '*'),
('MaisonMauranesAuPecheMignonAu82', 'write', '%
@moderateurs'),
('MaraichagE', 'comment', '@admins'),
('MaraichagE', 'read', '*'),
('MaraichagE', 'write', '*'),
('MarieDeMan', 'comment', '% @moderateurs'),
('MarieDeMan', 'read', '%
@moderateurs'),
('MarieDeMan', 'write', '%
@moderateurs'),
('MDeToulouse', 'comment', '% @moderateurs'),
('MDeToulouse', 'read', '%
@moderateurs'),
('MDeToulouse', 'write', '%
@moderateurs'),
('MentionsLegales', 'comment', '@admins'),
('MentionsLegales', 'read', '*'),
('MentionsLegales', 'write', '@admins'),
('MenuiserieArtisanatBois', 'comment', '@admins'),
('MenuiserieArtisanatBois', 'read', '*'),
('MenuiserieArtisanatBois', 'write', '*'),
('MesFiches', 'comment', '@admins'),
('MesFiches', 'read', '+'),
('MesFiches', 'write', '@editeurs'),
('MobiliteS', 'comment', ''),
('MobiliteS', 'read', '*'),
('MobiliteS', 'write', '@moderateurs'),
('ModesDeVie', 'comment', ''),
('ModesDeVie', 'read', '*'),
('ModesDeVie', 'write', '@moderateurs'),
('MotDePassePerdu', 'write', '@admins'),
('MouvementPourLEconomieSolidaireOccitanie', 'comment', '@admins'),
('MouvementPourLEconomieSolidaireOccitanie', 'read', '*'),
('MouvementPourLEconomieSolidaireOccitanie', 'write', '*'),
('NosServices', 'comment', '@admins'),
('NosServices', 'read', '*'),
('NosServices', 'write', '@editeurs'),
('NosServices_AccompagnemenT', 'comment', '@admins'),
('NosServices_AccompagnemenT', 'read', '*'),
('NosServices_AccompagnemenT', 'write', '@editeurs'),
('NosServices_NosFormations', 'comment', '@admins'),
('NosServices_NosFormations', 'read', '*'),
('NosServices_NosFormations', 'write', '@editeurs'),
('NosServices_OffresPro', 'comment', '@admins'),
('NosServices_OffresPro', 'read', '*'),
('NosServices_OffresPro', 'write', '@editeurs'),
('NosServices_VoyagesApprenants', 'comment', '@admins'),
('NosServices_VoyagesApprenants', 'read', '*'),
('NosServices_VoyagesApprenants', 'write', '@editeurs'),
('NouveauLieu', 'comment', '*'),
('NouveauLieu', 'read', '*'),
('NouveauLieu', 'write', '%
@moderateurs'),
('NouveauTestDroitsProprio135', 'comment', '*'),
('NouveauTestDroitsProprio135', 'read', '*'),
('NouveauTestDroitsProprio135', 'write', '%
@moderateurs'),
('OMazette', 'comment', '*'),
('OMazette', 'read', '*'),
('OMazette', 'write', '%
@moderateurs'),
('PageCSS', 'comment', '@admins'),
('PageCSS', 'read', '*'),
('PageCSS', 'write', '@admins'),
('PageFooter', 'comment', ''),
('PageFooter', 'write', '@editeurs'),
('PageHeader', 'comment', ''),
('PageHeader', 'write', '@editeurs'),
('PageLogin', 'comment', ''),
('PageLogin', 'write', '@editeurs'),
('PageMenu', 'comment', ''),
('PageMenu', 'write', '@editeurs'),
('PageMenuHaut', 'comment', ''),
('PageMenuHaut', 'write', '@editeurs'),
('PageMenuUser', 'comment', '@admins'),
('PageMenuUser', 'read', '*'),
('PageMenuUser', 'write', '@editeurs'),
('PageRapideHaut', 'comment', ''),
('PageRapideHaut', 'write', '@editeurs'),
('PageTitre', 'comment', ''),
('PageTitre', 'write', '@editeurs'),
('ParametresUtilisateur', 'write', '@admins'),
('ParcoursTest', 'comment', '*'),
('ParcoursTest', 'read', '*'),
('ParcoursTest', 'write', '@moderateurs'),
('ParcoursTestDeParcours', 'comment', '@admins'),
('ParcoursTestDeParcours', 'read', '*'),
('ParcoursTestDeParcours', 'write', '@moderateurs'),
('ParcoursTestDeParcours2', 'comment', '@admins'),
('ParcoursTestDeParcours2', 'read', '*'),
('ParcoursTestDeParcours2', 'write', '*'),
('PetitsDebrouillardsGrandEst', 'comment', '@admins'),
('PetitsDebrouillardsGrandEst', 'read', '*'),
('PetitsDebrouillardsGrandEst', 'write', '*'),
('QuiSommesNous', 'comment', ''),
('QuiSommesNous', 'write', '@editeurs'),
('RechercheTexte', 'comment', ''),
('RechercheTexte', 'write', '@editeurs'),
('RecobradA', 'comment', '*'),
('RecobradA', 'read', '*'),
('RecobradA', 'write', '%
@moderateurs'),
('RecycloBat', 'comment', '*'),
('RecycloBat', 'read', '*'),
('RecycloBat', 'write', '%
@moderateurs'),
('RegionGrandEst', 'comment', '@admins'),
('RegionGrandEst', 'read', '*'),
('RegionGrandEst', 'write', '*'),
('RegionOccitanie', 'comment', '@admins'),
('RegionOccitanie', 'read', '*'),
('RegionOccitanie', 'write', '*'),
('ReglesDeFormatage', 'comment', ''),
('ReglesDeFormatage', 'write', '@editeurs'),
('RestaurationDeMeubles', 'comment', '@admins'),
('RestaurationDeMeubles', 'read', '*'),
('RestaurationDeMeubles', 'write', '*'),
('RetesT', 'comment', '@admins'),
('RetesT', 'read', '*'),
('RetesT', 'write', '*'),
('RGPD', 'comment', ''),
('RGPD', 'write', '@editeurs'),
('SanteEtBienEtre', 'comment', ''),
('SanteEtBienEtre', 'read', '*'),
('SanteEtBienEtre', 'write', '@moderateurs'),
('SavoirCuisinerLesOeufs', 'comment', '@admins'),
('SavoirCuisinerLesOeufs', 'read', '*'),
('SavoirCuisinerLesOeufs', 'write', '*'),
('SoiN', 'comment', ''),
('SoiN', 'read', '*'),
('SoiN', 'write', '@moderateurs'),
('TableauDeBord', 'comment', ''),
('TableauDeBord', 'read', '@editeurs'),
('TableauDeBord', 'write', '@admins'),
('TableauDeBord_LookWiki', 'comment', ''),
('TableauDeBord_LookWiki', 'read', '@admins'),
('TableauDeBord_LookWiki', 'write', '@admins'),
('TableauDeBord_PagesOrphelines', 'comment', ''),
('TableauDeBord_PagesOrphelines', 'read', '@admins'),
('TableauDeBord_PagesOrphelines', 'write', '@admins'),
('TableauDeBord_PlanSite', 'comment', ''),
('TableauDeBord_PlanSite', 'read', '@admins'),
('TableauDeBord_PlanSite', 'write', '@admins'),
('TapisseriE', 'comment', '@admins'),
('TapisseriE', 'read', '*'),
('TapisseriE', 'write', '*'),
('TerA', 'comment', '*'),
('TerA', 'read', '*'),
('TerA', 'write', '%
@moderateurs'),
('TerritoireEnCommun', 'comment', '@admins'),
('TerritoireEnCommun', 'read', '*'),
('TerritoireEnCommun', 'write', '*'),
('TesT', 'comment', '*'),
('TesT', 'read', '*'),
('TesT', 'write', '%
@moderateurs'),
('Test13512A', 'comment', ''),
('Test13512A', 'read', '*'),
('Test13512A', 'write', '%
@moderateurs'),
('Test1351A', 'comment', '*'),
('Test1351A', 'read', '*'),
('Test1351A', 'write', '%
@moderateurs'),
('TesT2', 'comment', '@admins'),
('TesT2', 'read', '*'),
('TesT2', 'write', '*'),
('TesT3', 'comment', '*'),
('TesT3', 'read', '*'),
('TesT3', 'write', '%
@moderateurs'),
('TestBlog', 'comment', '*'),
('TestBlog', 'read', '*'),
('TestBlog', 'write', '%
@moderateurs'),
('TestDe56100', 'comment', '% @moderateurs'),
('TestDe56100', 'read', '%
@moderateurs'),
('TestDe56100', 'write', '%
@moderateurs'),
('TestDeLieu', 'comment', '*'),
('TestDeLieu', 'read', '*'),
('TestDeLieu', 'write', '%
@moderateurs'),
('TestDeLieuEncoreVide', 'comment', '*'),
('TestDeLieuEncoreVide', 'read', '*'),
('TestDeLieuEncoreVide', 'write', '%
@moderateurs'),
('TestDEvenement', 'comment', '*'),
('TestDEvenement', 'read', '@Lieux'),
('TestDEvenement', 'write', '@Lieux'),
('TestImportation1', 'comment', '*'),
('TestImportation1', 'read', '*'),
('TestImportation1', 'write', '%
@moderateurs'),
('TestImportation2', 'comment', '*'),
('TestImportation2', 'read', '*'),
('TestImportation2', 'write', '%
@moderateurs'),
('Test_Logo', 'comment', '@admins'),
('Test_Logo', 'read', '@editeurs'),
('Test_Logo', 'write', '@editeurs'),
('Thematiques_Exemple1', 'comment', '@admins'),
('Thematiques_Exemple1', 'read', '*'),
('Thematiques_Exemple1', 'write', '@editeurs'),
('Thematiques_Exemple2', 'comment', '@admins'),
('Thematiques_Exemple2', 'read', '*'),
('Thematiques_Exemple2', 'write', '@editeurs'),
('Thematiques_Formations', 'comment', '@admins'),
('Thematiques_Formations', 'read', '*'),
('Thematiques_Formations', 'write', '@editeurs'),
('Thematiques_LowTech', 'comment', '@admins'),
('Thematiques_LowTech', 'read', '@editeurs'),
('Thematiques_LowTech', 'write', '@editeurs'),
('ThemeExemple1', 'comment', '*'),
('ThemeExemple1', 'read', '*'),
('ThemeExemple1', 'write', '@moderateurs'),
('ThemeExemple2', 'comment', '*'),
('ThemeExemple2', 'read', '*'),
('ThemeExemple2', 'write', '@moderateurs'),
('ThomasGnagnagna', 'comment', '@admins'),
('ThomasGnagnagna', 'read', '*'),
('ThomasGnagnagna', 'write', '*'),
('TransformationDeProduitsFrais', 'comment', '@admins'),
('TransformationDeProduitsFrais', 'read', '*'),
('TransformationDeProduitsFrais', 'write', '*'),
('TransiscopE', 'comment', '@admins'),
('TransiscopE', 'read', '*'),
('TransiscopE', 'write', '*'),
('VoirFiches_Contributeurs_Annuaire', 'comment', '@admins'),
('VoirFiches_Contributeurs_Annuaire', 'read', '@moderateurs'),
('VoirFiches_Contributeurs_Annuaire', 'write', '@editeurs'),
('VoirFiches_Contributeurs_Carto', 'comment', '@admins'),
('VoirFiches_Contributeurs_Carto', 'read', '@moderateurs'),
('VoirFiches_Contributeurs_Carto', 'write', '@editeurs'),
('VoirFiches_Contributeurs_mineurs', 'comment', '@admins'),
('VoirFiches_Contributeurs_mineurs', 'read', '@moderateurs'),
('VoirFiches_Contributeurs_mineurs', 'write', '@editeurs'),
('VoirFiches_Contributeurs_Trombinoscope', 'comment', '@admins'),
('VoirFiches_Contributeurs_Trombinoscope', 'read', '@moderateurs'),
('VoirFiches_Contributeurs_Trombinoscope', 'write', '@editeurs'),
('VoirFiches_Voyageurs_Annuaire', 'comment', '@admins'),
('VoirFiches_Voyageurs_Annuaire', 'read', '@moderateurs'),
('VoirFiches_Voyageurs_Annuaire', 'write', '@editeurs'),
('VoirFiches_Voyageurs_Carto', 'comment', '@admins'),
('VoirFiches_Voyageurs_Carto', 'read', '@moderateurs'),
('VoirFiches_Voyageurs_Carto', 'write', '@editeurs'),
('VoirFiches_Voyageurs_Mineurs', 'comment', '@admins'),
('VoirFiches_Voyageurs_Mineurs', 'read', '@moderateurs'),
('VoirFiches_Voyageurs_Mineurs', 'write', '@editeurs'),
('VoirFiches_Voyageurs_Trombinoscope', 'comment', '@admins'),
('VoirFiches_Voyageurs_Trombinoscope', 'read', '@moderateurs'),
('VoirFiches_Voyageurs_Trombinoscope', 'write', '@editeurs'),
('VraC', 'comment', '*'),
('VraC', 'read', '*'),
('VraC', 'write', '%
@moderateurs'),
('WikiAdmin', 'comment', ''),
('WikiAdmin', 'read', '@editeurs'),
('WikiAdmin', 'write', '@admins'),
('YesWiki', 'comment', ''),
('YesWiki', 'write', '@editeurs'),
('ZeroWaste', 'comment', '@admins'),
('ZeroWaste', 'read', '*'),
('ZeroWaste', 'write', '*');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `yeswiki_plateforme_acls`
--
ALTER TABLE `yeswiki_plateforme_acls`
  ADD PRIMARY KEY (`page_tag`,`privilege`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
