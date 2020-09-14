-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Hôte : XXXXXXXXX
-- Généré le :  lun. 14 sep. 2020 à 16:42
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
-- Structure de la table `yeswiki_plateforme_nature`
--

CREATE TABLE `yeswiki_plateforme_nature` (
  `bn_id_nature` int(10) UNSIGNED NOT NULL,
  `bn_label_nature` varchar(255) DEFAULT NULL,
  `bn_description` text,
  `bn_condition` text,
  `bn_sem_context` text,
  `bn_sem_type` varchar(255) DEFAULT NULL,
  `bn_sem_use_template` tinyint(1) NOT NULL DEFAULT '1',
  `bn_template` text NOT NULL,
  `bn_ce_i18n` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `yeswiki_plateforme_nature`
--

INSERT INTO `yeswiki_plateforme_nature` (`bn_id_nature`, `bn_label_nature`, `bn_description`, `bn_condition`, `bn_sem_context`, `bn_sem_type`, `bn_sem_use_template`, `bn_template`, `bn_ce_i18n`) VALUES
(1, 'Annuaire', 'Un formulaire pour créer un annuaire. Pour permettre la saisie dans ce formulaire, placez ce code où vous le désirez {{bazar voirmenu=\"0\" vue=\"saisir\" id=\"1\"}} / pour rendre visible l\'annuaire et son contenu : {{bazarliste id=\"1\" template=\"trombinoscope.tpl.html\"}} là où vous le souhaitez. Vous pouvez afficher cette annuaire sous forme de liste de noms classés avec {{bazar id=\"1\" template=\"annuaire_alphabetique.tpl.html\"}}. S\'il y a une adresse dans le formulaire on peut afficher son contenu sous forme de carte avec {{bazarliste id=\"1\" template=\"map.tpl.html\"}}', '', '', '', 1, 'texte***bf_titre***Prénom et nom***60***255*** *** ***text***1*** *** *** *** *** *** ***\r\nimage***bf_image***Image de présentation (facultatif mais c\'est plus sympa)***140***140***600***600***right***0*** *** *** *** *** *** ***\r\ntexte***bf_fonction***Mon métier, ma fonction***60***255*** *** ***text***0*** *** *** *** *** *** ***\r\ntextelong***bf_projet***Mes projets***5***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\ntexte***bf_tel***Téléphone pro (ou perso)***10***20*** *** ***text***0*** *** *** *** *** *** ***\r\nchamps_mail***bf_mail***Email (n\'apparaitra pas sur le web)*** *** *** ***form*** ***1***1*** *** *** *** *** ***\r\ntexte***bf_structure***Nom de la structure***60***255*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_site_internet***Site Internet***40***255***http://*** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_adresse***Adresse***50***50*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_code_postal***Code postal***8***8*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_ville***Ville***50***80*** *** ***text***0*** *** *** *** *** *** ***\r\nlabelhtml***<span style=\"color:#cc3333;\">Il faut maintenant cliquer sur le bouton bleu pour placer votre point sur la carte </span><br>*** *** ***\r\ncarte_google***bf_latitude***bf_longitude*** *** ***\r\nlabelhtml***<h3>Il ne vous reste plus qu\'à valider ! </h3>*** *** ***\r\n', 'fr-FR'),
(2, 'Agenda', 'Une formulaire pour créer un agenda partagé. Pour permettre la saisie dans ce formulaire, placez ce code où vous le désirez {{bazar voirmenu=\"0\" vue=\"saisir\" id=\"2\"}} / pour rendre visible l\'agenda et son contenu : {{calendrier id=\"2\" }} là où vous le souhaitez. S\'il y a une adresse dans le formulaire on peut afficher son contenu sous forme de carte avec {{bazarliste id=\"2\" template=\"map.tpl.html\"}}', '', '', '', 1, 'texte***bf_titre***Nom de l\'événement***60***255*** *** ***text***1*** *** *** *** *** *** ***\r\ntextelong***bf_description***Description***40***10*** *** ***wiki***0*** *** *** *** *** *** ***\r\njour***bf_date_debut_evenement***Début de l\'événement*** *** ***1*** *** ***1*** *** *** *** *** *** ***\r\njour***bf_date_fin_evenement***Fin de l\'événement*** *** ***1*** *** ***1*** *** *** *** *** *** ***\r\ntexte***bf_horaire***Horaire***60***255*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_site_internet***Site Web***40***255***http://*** ***text***0*** *** *** *** *** *** ***\r\nimage***bf_image***Image (facultatif)***140***140***600***600***right***0*** ***\r\nfichier***fichier***Documents***20000000*** *** *** ***file***0*** *** *** *** *** *** ***\r\nlistefiche***5***Lieu associé*** *** *** *** *** ***0*** *** *** *** *** *** ***\r\ntexte***bf_adresse***Adresse***50***50*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_code_postal***Code postal***8***8*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_ville***Ville***50***80*** *** ***text***0*** *** *** *** *** *** ***\r\nlabelhtml***<span style=\"color:#cc3333;\">Il faut maintenant cliquer sur le bouton bleu pour placer votre point sur la carte </span><br>*** *** *** *** *** *** *** *** ***\r\ncarte_google***bf_latitude***bf_longitude*** *** *** *** *** *** *** ***\r\nlabelhtml***<h3>Il ne vous reste plus qu\'à valider ! </h3>*** *** *** *** *** *** *** *** ***\r\n', 'fr-FR'),
(3, 'Blog-actu', 'C\'est ici qu\'on dépose les articles qui apparaissent sur le blog. Pour permettre la saisie {{bazar voirmenu=\"0\" vue=\"saisir\" id=\"3\"}} / pour rendre visible : {{bazarliste id=\"3\" template=\"blog.tpl.html\"}} ', '', '', '', 1, 'image***bf_image***Image***400***300***1200***900***right***0*** *** *** *** *** *** ***\r\ntexte***bf_titre***Titre***80***255*** *** ***text***1*** *** *** *** *** *** ***\r\ntextelong***bf_chapeau***Résumé***40***3*** *** ***wiki***1*** *** *** *** *** *** ***\r\ntextelong***bf_description***Billet***40***9*** *** ***wiki***1*** *** *** *** *** *** ***\r\n', 'fr-FR'),
(4, 'Ressources', 'Un formulaire pour créer un espace ressources partagées. Pour permettre la saisie dans ce formulaire, placez ce code où vous le désirez {{bazar voirmenu=\"0\" vue=\"saisir\" id=\"4\"}} / pour rendre visible les ressources collectées : {{bazar id=\"4\" vue=\"recherche\" voirmenu=\"0\"}} là où vous le souhaitez. ', '', '', '', 1, 'texte***bf_titre***Nom de la ressource***60***255*** *** ***text***1*** *** *** *** *** *** ***\r\nlien_internet***bf_url***Site Web***40***255***http://*** ***text***0*** *** *** *** *** *** ***\r\ncheckbox***ListeType***Type de ressource*** *** *** *** *** ***1*** *** *** *** *** *** ***\r\ntextelong***bf_description***Description***5***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\ntexte***bf_auteur***Auteur***60***255*** *** ***text***0*** *** *** *** *** *** ***\r\nimage***bf_image***Image de présentation (facultatif)***140***140***600***600***right***0*** *** *** *** *** *** ***\r\nfichier***fichier***Documents***20000000*** *** *** ***file***0*** *** *** *** *** *** ***\r\nbookmarklet***veille_partag_e***cliquer-déposer ce lien dans votre barre des favoris pour y accéder facilement.*** ***\r\nlabelhtml***<h3>Il ne vous reste plus qu\'à valider ! </h3>*** *** ***\r\n', 'fr-FR'),
(5, 'Lieux', 'Liste des lieux pouvant accueillir pour former des voyageurs autour d\'un sujet de l\'écologie, de la solidarité ou de toute thématique de la transition ou des alternatives écologiques ou solidaires.', 'Veuillez lire et valider la <a href=\"?ChartE\" class=\"label label-primary modalbox\">charte</a> avant de créer ou modifier une fiche.', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Organization, schema:Organization', 1, 'labelhtml***<ul class=\"nav nav-tabs\" role=\"tablist\"><li role=\"presentation\" class=\"active\"><a href=\"#menu1Presentation\" role=\"tab\" data-toggle=\"tab\">1. Présentation</a></li><li role=\"presentation\"><a href=\"#menu2Coordonnees\" role=\"tab\" data-toggle=\"tab\">2. Coordonnées</a></li><li role=\"presentation\"><a href=\"#menu3Localisation\" role=\"tab\" data-toggle=\"tab\">3. Localisation</a></li><li role=\"presentation\"><a href=\"#menu4Hebergement\" role=\"tab\" data-toggle=\"tab\">4. Accueil-hébergement</a></li></ul><div class=\"tab-content\"><!--indique qu\'il y aura 4 onglets-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div role=\"tabpanel\" class=\"tab-pane active\" id=\"menu1Presentation\"><br><br><!--ouvre le premier onglet-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Présentation</h2>*** *** *** *** *** *** *** *** ***\r\ntexte***bf_titre***Nom du lieu*** *** *** *** ***text***1*** *** *** *** *** ***name,schema:name***\r\nimage***bf_image***Logo***140***140***600***600***right***0*** ***\r\ncheckboxfiche***10***Parcours thématique*** *** *** *** *** ***1*** *** *** *** *** *** ***\r\ntextelong***bf_description_courte***Courte description du lieu***5***5*** *** ***wiki***1*** *** *** *** *** *** ***\r\ntextelong***bf_formations_proposees***Formations proposées***5***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-right\" href=\"#menu2Coordonnees\" role=\"tab\" data-toggle=\"tab\">Onglet 2. Coordonnées<i class=\"glyphicon glyphicon-chevron-right\"></i></a><!--Affiche un bouton pour passer à l\'onglet 2-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 1 --> <div role=\"tabpanel\" class=\"tab-pane\" id=\"menu2Coordonnees\"><br><br><!-- ouvre l\'onglet 2-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Coordonnées</h2>*** *** *** *** *** *** *** *** ***\r\nlien_internet***bf_site_internet***Site Internet***40***255*** *** ***url***0*** *** *** *** *** ***url,schema:WebSite***\r\nlien_internet***text_facebook***Page Facebook***40***255*** *** ***url***0*** *** *** *** *** ***url,schema:url***\r\nlien_internet***text_presdecheznous***Fiche Près de chez nous***40***255*** *** ***url***0*** *** *** *** *** ***url,schema:url***\r\ntexte***bf_tel***Téléphone<br>***10***20*** *** ***text***0*** *** *** *** *** ***schema:telephone***\r\nchamps_mail***bf_mail***Email*** *** *** ***form*** ***1*** ***\r\ntexte***bf_contact_principal***Nom du contact principal*** *** *** *** ***text***0*** *** *** *** *** *** ***\r\nlabelhtml***Nous avons à cœur de préserver votre temps. Indiquez ci dessous vos disponibilités pour être contacté (exemple : uniquement par e-mail en novembre  uniquement par téléphone entre 18h et 19h  etc)*** ***Pour conserver l\'envie du lieu pour vous accueillir  nous avons recueilli ses disponibilités que nous vous invitons à respecter.*** *** *** *** *** *** ***\r\ntextelong***pref_contact***Préférences de contact<br>*** ***3*** *** ***wiki***0*** *** *** *** *** *** ***\r\ntexte***denomination_sociale***Dénomination sociale*** *** *** *** ***text***0*** *** *** *** *** *** ***\r\nlabelhtml***Ressources pour vous aider : <a href=\"https://www.legalstart.fr/fiches-pratiques/raison-sociale/denomination-sociale/\" target=\"blank\">https://www.legalstart.fr/fiches-pratiques/raison-sociale/denomination-sociale/</a>*** *** *** *** *** *** *** *** ***\r\nliste***ListeTypeDeStructure***Type de structure<br>*** *** *** *** *** ***0*** *** *** *** *** *** ***\r\nlabelhtml***<div id=\"ListeTypeDeStructure_Autre\" style=\"display:none;\">*** *** *** *** *** *** *** *** ***\r\ntexte***bf_autre_type_structure***Autre type de structure :<br>*** *** *** *** ***text***0*** *** *** *** *** *** ***\r\nlabelhtml***</div>*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-left\" href=\"#menu1Presentation\" role=\"tab\" data-toggle=\"tab\"> <i class=\"glyphicon glyphicon-chevron-left\"></i>Onglet 1. Présentation</a><a class=\"btn btn-lg btn-primary pull-right\" href=\"#menu3Localisation\" role=\"tab\" data-toggle=\"tab\">Onglet 3. Localisation<i class=\"glyphicon glyphicon-chevron-right\"></i></a><!--Affiche un bouton pour revenir à l\'onglet 1 et un bouton pour passer à l\'onglet 3-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 2 --> <div role=\"tabpanel\" class=\"tab-pane\" id=\"menu3Localisation\"><br><br><!-- ouvre l\'onglet 3-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Localisation</h2>*** *** *** *** *** *** *** *** ***\r\ntexte***bf_adresse***Adresse***50***80*** *** ***text***1*** *** *** *** *** ***schema:streetAddress***\r\ntexte***bf_complement_adresse***Complément d\'adresse***50***80*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_code_postal***Code postal***8***8*** *** ***text***0*** *** *** *** *** ***schema:postalCode***\r\ntexte***bf_ville***Ville***50***80*** *** ***text***1*** *** *** *** *** ***schema:addressLocality***\r\nliste***ListeDepartements***Département*** *** *** ***bf_department*** ***0*** *** *** *** *** *** ***\r\nlabelhtml***<span style=\"color:#cc3333;\">Il faut maintenant cliquer sur le bouton bleu pour placer votre point sur la carte </span><br>*** *** *** *** *** *** *** *** ***\r\ncarte_google***bf_latitude***bf_longitude*** *** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-left\" href=\"#menu2Coordonnees\" role=\"tab\" data-toggle=\"tab\"> <i class=\"glyphicon glyphicon-chevron-left\"></i>Onglet 2. Coordonnées</a><a class=\"btn btn-lg btn-primary pull-right\" href=\"#menu4Hebergement\" role=\"tab\" data-toggle=\"tab\">Onglet 4. Accueil-hébergement<i class=\"glyphicon glyphicon-chevron-right\"></i></a><!--Affiche un bouton pour revenir à l\'onglet 2 et un bouton pour passer à l\'onglet 4-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 3 --> <div role=\"tabpanel\" class=\"tab-pane\" id=\"menu4Hebergement\"><br><br><!-- ouvre l\'onglet 4-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Accueil et hébergement</h2>*** *** *** *** *** *** *** *** ***\r\nlabelhtml***Nous vous proposons de compléter des informations sur le type d\'accueil que vous pouvez fournir. Une page d\'aide permet d\'avoir une <a href=\"?AideTypeDApprentissage\" target=\"blank\">description détaillée des différents types de voyages</a>*** *** *** *** *** *** *** *** ***\r\ncheckbox***ListeTypeDAccueil***Type d\'apprentissage*** *** *** ***type_accueil*** ***1*** *** *** *** *** *** ***\r\ncheckbox***ListeTypeDeLogement***Type de logement*** *** *** ***logement*** ***0*** *** *** *** *** *** ***\r\nlabelhtml***Nous vous proposons de choisir une ou plusieurs compétences présentent dans les activités du lieu. <br>S\'il en manque une   vous pouvez l\'ajouter avec le bouton suivant : <a href=\"?AjouterUneCompetence\" target=\"blank\" class=\"btn btn-primary\">Ajouter une nouvelle compétence</a><br>*** *** *** *** *** *** *** *** ***\r\ncheckboxfiche***8***Compétences*** *** *** *** *** ***1*** *** *** *** *** *** ***\r\nlabelhtml***<div style=\"font-weight: bold; font-size: large;\">Il ne vous reste plus qu\'à valider ! </div>*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-left\" href=\"#menu3Localisation\" role=\"tab\" data-toggle=\"tab\"> <i class=\"glyphicon glyphicon-chevron-left\"></i>Onglet 3. Localisation</a><!--Affiche un bouton pour revenir à l\'onglet 3-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 4 --> </div><!-- ferme l\'ensemble des onglets -><style>#formulaire .form-actions { display:none; }</style><!--Efface les boutons Valider/Annuler en bas de chaque onglet-->*** *** *** *** *** *** *** *** ***\r\nacls*** ***@moderateurs*** *** *** *** *** *** *** ***\r\n', 'fr-FR'),
(6, 'Thématiques', 'Liste des thématiques des lieux', '', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Group,schema:CategoryCode', 1, 'texte***bf_titre***Thématique*** *** *** *** ***text***1*** *** *** *** *** ***schema:CategoryCode:name***\r\ntextelong***bf_description***Exemple de description*** ***3*** *** ***wiki***0*** *** *** *** *** ***https://schema.org/description***\r\n', 'fr-FR'),
(7, 'Demande appropriation', '', '', '', '', 1, 'titre***Demande {{bf_nom}}  - {{bf_prenom}}*** *** *** *** *** *** *** *** ***\r\ntexte***bf_nom***Nom*** *** *** *** ***text***1*** *** *** *** *** *** ***\r\ntexte***bf_prenom***Prénom*** *** *** *** ***text***0*** *** *** *** *** *** ***\r\nchamps_mail***bf_mail***Email*** *** *** ***form*** ***1*** ***\r\nlistefiche***5***Fiche concernée*** *** *** *** *** ***1*** *** *** *** *** *** ***\r\ntextelong***bf_comment***Commentaires, raison de la demande<br>*** ***3*** *** ***wiki***0*** *** *** *** *** *** ***\r\n', 'fr-FR'),
(8, 'Compétences', '', '', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Group,schema:CategoryCode', 1, 'texte***bf_titre***Compétence*** *** *** *** ***text***1*** *** *** *** *** ***schema:CategoryCode:name*****\r\n', 'fr-FR'),
(9, 'Partenaire / Écosystème', '', '', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Organization, schema:Organization', 1, 'texte***bf_titre***Nom de l\'organisation<br>*** *** *** *** ***text***1*** *** *** *** *** ***name,schema:name***\r\nimage***bf_image***Logo***140***140***600***600***right***0*** ***\r\ntextelong***bf_description***Description***5***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\nlien_internet***bf_site_internet***Site Internet***40***255*** *** ***url***0*** *** *** *** *** ***url,schema:WebSite***\r\ncheckbox***ListeTypeDePartenariat***Type de partenariat<br>*** *** *** *** *** ***0*** *** *** *** *** *** ***\r\n', 'fr-FR'),
(10, 'Parcours thématiques', '', '', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Group,schema:CategoryCode', 1, 'texte***bf_titre***Parcours thématique*** *** *** *** ***text***1*** *** *** *** *** ***schema:CategoryCode:name***\r\ntextelong***bf_description***Exemple de description*** ***3*** *** ***wiki***0*** *** *** *** *** ***https://schema.org/description***\r\n *** ***@admins***@admins***\r\n', 'fr-FR'),
(11, 'Contributeur', 'Formulaire pour recueillir les informations sur les contributeurs', '', '', '', 1, 'titre***Fiche contributeur {{bf_prenom}} {{bf_nom}}***Titre Automatique*** *** *** *** *** *** *** ***\r\ntexte***bf_prenom***Prénom*** *** *** *** ***text***1*** *** *** *** *** *** ***\r\ntexte***bf_nom***Nom*** *** *** *** ***text***1*** *** *** *** *** *** ***\r\nimage***bf_image***Portrait***210***140***300***200***right***0*** ***\r\nchamps_mail***bf_email***Email*** *** *** *** *** ***1*** ***\r\nchamps_mail***bf_gmail***Identifiant Gmail*** *** *** *** *** ***0*** ***\r\ntexte***bf_tel***Téléphone***15***15*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_id_matrix***Identifiant matrix.org / Element*** *** *** *** ***text***1*** *** *** *** *** *** ***\r\ntexte***bf_id_github***Identifiant GitHub*** *** *** *** ***text***0*** *** *** *** *** *** ***\r\njour***bf_date_adhesion***Date d\'adhésion<br>*** *** ***1*** *** ***0*** *** *** *** *** *** ***\r\nliste***ListeOuiNon***J\'accepte que mes informations soient diffusées au sein des Chemins de la Transition<br>*** *** *** ***bf_partage_info*** ***1*** *** *** *** *** *** ***\r\ntexte***bf_adresse***Adresse***50*** *** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_complement_adresse***Adresse (complément)***50*** *** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_code_postal***Code postal***8***8*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_ville***Ville***25*** *** *** ***text***0*** *** *** *** *** *** ***\r\nlabelhtml***<span style=\"color:#cc3333;\">Il faut maintenant cliquer sur le bouton bleu pour placer votre point sur la carte </span><br>*** *** *** *** *** *** *** *** ***\r\ncarte_google***bf_latitude***bf_longitude*** *** *** *** *** *** *** ***\r\nlabelhtml***<p>Dans le champ suivant  indiquez pour chaque organisation :<br><ul><li>Le périmètre d\'intrevention</li><li>Nombre de bénéficiaires : ........ dont ........ hommes et ........ femmes</li><li>Nombre de salariés: ........ dont ........ hommes et ........ femmes</li><li>Nombre de bénévoles: ........ dont ........ hommes et ........ femmes</li></ul></p><br>*** *** *** *** *** *** *** *** ***\r\ntextelong***bf_organisations***Organisation(s) représentée(s)***60***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\ntextelong***bf_connaissance***Comment ai-je connu Les Chemins de la Transition ?<br>*** ***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\ntextelong***bf_rejoindre***Pourquoi rejoindre Les Chemins de la Transition ?<br>*** ***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\ntextelong***bf_attentes***Quelles sont mes attentes, sur quels sujets ai-je envie de m\'impliquer ?<br>*** ***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\ntextelong***bf_disponibilites***Quelles sont mes disponibilités ?<br>*** ***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\ntextelong***bf_competences***Quelles sont mes compétences/Que puis-je apporter&nbsp;? (mini CV en 8 lignes max)<br>*** ***8*** *** ***wiki***0*** *** *** *** *** *** ***\r\ntextelong***bf_autres_informations***Autres informations que je souhaite porter à la connaissance du collectif*** ***8*** *** ***wiki***0*** *** *** *** *** *** ***\r\nacls***@moderateurs***@moderateurs***@moderateurs*** *** *** *** *** *** ***\r\n', 'fr-FR'),
(12, 'Test', '', '', '', '', 1, 'texte***bf_titre***Titre de la fiche*** *** *** *** ***text***1*** *** *** *** *** *** ***\r\ntexte***bf_adresse***Adresse***50***80*** *** ***text***1*** *** *** *** *** ***schema:streetAddress***\r\ntexte***bf_complement_adresse***Complément d\'adresse***50***80*** *** ***text***0*** *** *** *** *** *** ***\r\ntexte***bf_code_postal***Code postal***8***8*** *** ***text***0*** *** *** *** *** ***schema:postalCode***\r\ntexte***bf_ville***Ville***50***80*** *** ***text***1*** *** *** *** *** ***schema:addressLocality***\r\nliste***ListeDepartements***Département*** *** *** ***bf_department*** ***0*** *** *** *** *** *** ***\r\nlabelhtml***<span style=\"color:#cc3333;\">Il faut maintenant cliquer sur le bouton bleu pour placer votre point sur la carte </span><br>*** *** *** *** *** *** *** *** ***\r\ncarte_google***bf_latitude***bf_longitude*** *** *** *** *** *** *** ***\r\n', 'fr-FR');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `yeswiki_plateforme_nature`
--
ALTER TABLE `yeswiki_plateforme_nature`
  ADD PRIMARY KEY (`bn_id_nature`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `yeswiki_plateforme_nature`
--
ALTER TABLE `yeswiki_plateforme_nature`
  MODIFY `bn_id_nature` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
