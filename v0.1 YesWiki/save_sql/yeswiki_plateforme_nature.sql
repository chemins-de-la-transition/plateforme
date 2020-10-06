
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
(1, 'Parcours - agenda', 'Liste des parcours à venir ou passés', 'Veuillez lire et valider la <a href=\"?ChartE\" class=\"label label-primary modalbox\">charte</a> avant de créer ou modifier une fiche.\r\nMerci aussi de lire et valider la politique de confidentialité avant de créer ou modifier une fiche.\r\n\r\n<a class=\"btn btn-lg btn-primary modalbox\" href=\"?RGPD\" style=\"margin-top:8px;margin-bottom:8px;\">En savoir plus sur l’utilisation des données personnelles...</a>', '', '', 1, 'titre***Parcours {{bf_nom}}***Titre Automatique*** *** *** *** *** *** *** ***\r\ntexte***bf_nom***Titre<br>***60***255*** *** ***text***1*** *** *** * *** * *** *** ***\r\ntextelong***bf_description***Description***80***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\ncheckboxfiche***10***Thématique*** *** *** ***bf_thematique*** ***0*** *** *** * *** * *** *** ***\r\ncheckboxfiche***5***Lieux concernés<br>*** *** *** ***bf_lieu_actu***tags***0*** *** *** * *** * *** *** ***\r\nlistedatedeb***bf_date_debut_evenement***Début du parcours<br>*** *** ***1*** *** ***1*** *** *** * *** * *** *** ***\r\nlistedatedeb***bf_date_fin_evenement***Fin du parcours<br>*** *** ***1*** *** ***1*** *** *** * *** * *** *** ***\r\ncheckbox***ListeInformationsSurLesEvenements***Informations*** *** *** ***bf_infos*** ***0*** *** *** * *** * *** *** ***\r\ntexte***bf_site_internet***Site Web***80***255*** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_contact***Personne à contacter*** *** *** *** ***text***1*** *** *** * *** * *** *** ***\r\nchamps_mail***bf_mail***Email*** *** *** ***form*** ***0*** ***\r\ntexte***bf_tel***Téléphone***15***15*** *** ***text***0*** ***ATTENTION : donnée publique*** * *** * *** *** ***\r\nimage***bf_image***Image (facultatif)***140***140***600***600***right***0*** ***\r\nfichier***fichier***Documents***20000000*** *** *** ***file***0*** *** *** *** *** *** ***\r\ncheckbox***ListeDepartements***Départements concernés<br>*** *** *** ***bf_departements***tags***0*** *** *** * *** * *** *** ***\r\ntags***bf_tags***Tags*** *** *** *** *** ***0*** ***\r\nlabelhtml***<h3>Il ne vous reste plus qu\'à valider ! </h3>*** *** *** *** *** *** *** *** ***\r\nacls*** ****@moderateurs*** ******* *** *** *** *** ***\r\n', 'fr-FR'),
(2, 'Actualité d\'un lieu', 'Une formulaire pour partager les évènements et actualités des lieux. \r\nUtilisation : {{bazar voirmenu=\"0\" vue=\"saisir\" id=\"2\"}} / {{calendrier id=\"2\" }} {{bazarliste id=\"2\" template=\"map.tpl.html\"}}', 'Veuillez lire et valider la <a href=\"?ChartE\" class=\"label label-primary modalbox\">charte</a> avant de créer ou modifier une actualité.\r\nMerci aussi de lire et valider la politique de confidentialité avant de créer ou modifier une fiche.\r\n\r\n<a class=\"btn btn-lg btn-primary modalbox\" href=\"?RGPD\" style=\"margin-top:8px;margin-bottom:8px;\">En savoir plus sur l’utilisation des données personnelles...</a>', '', '', 1, 'titre***Actualite lieu {{bf_nom}}***Titre Automatique*** *** *** *** *** *** *** ***\r\ntexte***bf_nom***Titre<br>***60***255*** *** ***text***1*** *** *** * *** * *** *** ***\r\ntextelong***bf_description***Description***80***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\ncheckboxfiche***10***Thématique*** *** *** ***bf_thematique*** ***0*** *** *** * *** * *** *** ***\r\ncheckboxfiche***5***Lieux concernés<br>*** *** *** ***bf_lieu_actu***tags***0*** ***Taper quelques lettres pour avoir la proposition d\'un lieu puis taper sur entrée*** * *** * *** *** ***\r\nlistedatedeb***bf_date_debut_evenement***Début de l\'évènement*** *** ***1*** *** ***1*** *** *** * *** * *** *** ***\r\nlistedatedeb***bf_date_fin_evenement***Fin de l\'évènement*** *** ***1*** *** ***1*** *** *** * *** * *** *** ***\r\ncheckbox***ListeInformationsSurLesEvenements***Informations*** *** *** ***bf_infos*** ***0*** *** *** * *** * *** *** ***\r\ntexte***bf_site_internet***Site Web***80***255*** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_contact***Personne à contacter*** *** *** *** ***text***1*** *** *** * *** * *** *** ***\r\nchamps_mail***bf_mail***Email*** *** *** ***form*** ***0*** ***\r\ntexte***bf_tel***Téléphone***15***15*** *** ***text***0*** ***ATTENTION : donnée publique*** * *** * *** *** ***\r\nimage***bf_image***Image (facultatif)***140***140***600***600***right***0*** ***\r\nfichier***fichier***Documents***20000000*** *** *** ***file***0*** *** *** *** *** *** ***\r\ntexte***bf_adresse***Adresse***50***50*** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_adresse1***Complément d\'adresse***50***50*** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_code_postal***Code postal***8***8*** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_ville***Ville***50***80*** *** ***text***0*** *** *** * *** * *** *** ***\r\ncarte_google***bf_latitude***bf_longitude*** *** *** *** *** *** *** ***\r\ntags***bf_tags***Tags*** *** *** *** *** ***0*** ***\r\nacls***@Lieux***@Lieux*** ******* *** *** *** *** ***\r\nlabelhtml***<h3>Il ne vous reste plus qu\'à valider ! </h3>*** *** *** *** *** *** *** *** ***\r\n', 'fr-FR'),
(3, 'Réserve', 'Formulaire vide en réserve pour garer l\'id #3', '', '', '', 1, 'texte***bf_titre***Titre***80***255*** *** ***text***1*** *** *** * *** * *** *** ***\r\n', 'fr-FR'),
(4, 'Réserve 2', 'Réserve de formulaire avec #4', '', '', '', 1, 'texte***bf_titre***Nom de la ressource***60***255*** *** ***text***1*** *** *** * *** * *** *** ***\r\n', 'fr-FR'),
(5, 'Lieux', 'Liste des lieux pouvant accueillir pour former des chemineuses et chemineurs autour d\'un sujet de l\'écologie, de la solidarité ou de toute thématique de la transition ou des alternatives écologiques ou solidaires.', 'La fiche sera relue et modérée avant d\'être affichée sur la carte.\r\nVeuillez lire et valider la <a href=\"?ChartE\" class=\"label label-primary modalbox\">charte</a> avant de créer ou modifier une fiche.\r\nMerci aussi de lire et valider la politique de confidentialité avant de créer ou modifier une fiche.\r\n\r\n<a class=\"btn btn-lg btn-primary modalbox\" href=\"?RGPD\" style=\"margin-top:8px;margin-bottom:8px;\">En savoir plus sur l’utilisation de mes données personnelles...</a>', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Organization, schema:Organization', 1, 'labelhtml***<ul class=\"nav nav-tabs\" role=\"tablist\"><li role=\"presentation\" class=\"active\"><a href=\"#menu1Presentation\" role=\"tab\" data-toggle=\"tab\">1. Présentation</a></li><li role=\"presentation\"><a href=\"#menu2Coordonnees\" role=\"tab\" data-toggle=\"tab\">2. Coordonnées</a></li><li role=\"presentation\"><a href=\"#menu3Localisation\" role=\"tab\" data-toggle=\"tab\" onclick=\"window.dispatchEvent(new Event(\'resize\'))\">3. Localisation</a></li><li role=\"presentation\"><a href=\"#menu4Hebergement\" role=\"tab\" data-toggle=\"tab\">4. Type d\'apprentissage-hébergement</a></li><li role=\"presentation\"><a href=\"#menu5Preferences\" role=\"tab\" data-toggle=\"tab\">5. Préférences</a></li></ul><div class=\"tab-content\"><!--indique qu\'il y aura 5 onglets-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div role=\"tabpanel\" class=\"tab-pane active\" id=\"menu1Presentation\"><br><br><!--ouvre le premier onglet-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Présentation</h2>*** *** *** *** *** *** *** *** ***\r\ntexte***bf_titre***Nom du lieu*** *** *** *** ***text***1*** *** *** * *** * *** ***name,schema:name***\r\nimage***bf_image***Logo***140***140***600***600***right***0*** ***\r\ncheckboxfiche***10***Parcours thématique*** *** *** *** *** ***1*** *** *** * *** * *** *** ***\r\ntextelong***bf_description_courte***Courte description du lieu***5***5*** *** ***texte***1*** *** *** *** *** *** ***\r\ntextelong***bf_formations_proposees***Formations proposées***5***5*** *** ***texte***0*** *** *** *** *** *** ***\r\ntags***bf_tags***Domaine  Branche  Autres thématiques*** *** *** *** *** ***0*** ***\r\ntexte***bf_nb_salaries***Effectif salarié*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_nb_benevoles***Effectif bénévole*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_nb_adherents***Nombre d\'adhérents*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_nb_beneficiaires***Nombre de bénéficiaires*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-right\" href=\"#menu2Coordonnees\" role=\"tab\" data-toggle=\"tab\">Onglet 2. Coordonnées<i class=\"glyphicon glyphicon-chevron-right\"></i></a><!--Affiche un bouton pour passer à l\'onglet 2-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 1 --> <div role=\"tabpanel\" class=\"tab-pane\" id=\"menu2Coordonnees\"><br><br><!-- ouvre l\'onglet 2-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Coordonnées</h2>*** *** *** *** *** *** *** *** ***\r\nlien_internet***bf_site_internet***Site Internet***40***255*** *** ***url***0*** *** *** * *** * *** ***url,schema:WebSite***\r\nlien_internet***text_facebook***Page Facebook***40***255*** *** ***url***0*** *** *** * *** * *** ***url,schema:url***\r\nlien_internet***text_presdecheznous***Fiche Près de chez nous***40***255*** *** ***url***0*** *** *** * *** * *** ***url,schema:url***\r\ntexte***bf_tel***Téléphone***10***20*** *** ***text***0*** *** ***% @moderateurs***% @moderateurs*** ***schema:telephone***\r\nchamps_mail***bf_mail***Email*** *** *** ***form*** ***1*** ***\r\ntexte***bf_contact_principal***Nom du contact principal*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***denomination_sociale***Dénomination sociale*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\nlabelhtml***Ressources pour vous aider : <a href=\"https://www.legalstart.fr/fiches-pratiques/raison-sociale/denomination-sociale/\" target=\"blank\">https://www.legalstart.fr/fiches-pratiques/raison-sociale/denomination-sociale/</a>*** *** *** *** *** *** *** *** ***\r\nliste***ListeTypeDeStructure***Type de structure*** *** *** *** *** ***0*** *** *** * *** * *** *** ***\r\nlabelhtml***<div id=\"ListeTypeDeStructure_Autre\" style=\"display:none;\">*** *** *** *** *** *** *** *** ***\r\ntexte***bf_autre_type_structure***Autre type de structure :*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\nlabelhtml***</div>*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-left\" href=\"#menu1Presentation\" role=\"tab\" data-toggle=\"tab\"> <i class=\"glyphicon glyphicon-chevron-left\"></i>Onglet 1. Présentation</a><a class=\"btn btn-lg btn-primary pull-right\" href=\"#menu3Localisation\" role=\"tab\" data-toggle=\"tab\" onclick=\"window.dispatchEvent(new Event(\'resize\'))\">Onglet 3. Localisation<i class=\"glyphicon glyphicon-chevron-right\"></i></a><!--Affiche un bouton pour revenir à l\'onglet 1 et un bouton pour passer à l\'onglet 3-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 2 --> <div role=\"tabpanel\" class=\"tab-pane\" id=\"menu3Localisation\"><br><br><!-- ouvre l\'onglet 3-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Localisation</h2>*** *** *** *** *** *** *** *** ***\r\ntexte***bf_adresse***Adresse***50***80*** *** ***text***1*** *** *** * *** * *** ***schema:streetAddress***\r\ntexte***bf_complement_adresse***Complément d\'adresse***50***80*** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_code_postal***Code postal***8***8*** *** ***text***0*** *** *** * *** * *** ***schema:postalCode***\r\ntexte***bf_ville***Ville***50***80*** *** ***text***1*** *** *** * *** * *** ***schema:addressLocality***\r\nliste***ListeDepartements***Département*** *** *** ***bf_department*** ***0*** *** *** * *** * *** *** ***\r\ncarte_google***bf_latitude***bf_longitude*** *** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-left\" href=\"#menu2Coordonnees\" role=\"tab\" data-toggle=\"tab\"> <i class=\"glyphicon glyphicon-chevron-left\"></i>Onglet 2. Coordonnées</a><a class=\"btn btn-lg btn-primary pull-right\" href=\"#menu4Hebergement\" role=\"tab\" data-toggle=\"tab\">Onglet 4. Accueil-hébergement<i class=\"glyphicon glyphicon-chevron-right\"></i></a><!--Affiche un bouton pour revenir à l\'onglet 2 et un bouton pour passer à l\'onglet 4-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 3 --> <div role=\"tabpanel\" class=\"tab-pane\" id=\"menu4Hebergement\"><br><br><!-- ouvre l\'onglet 4-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Type d\'apprentissage et hébergement</h2>*** *** *** *** *** *** *** *** ***\r\nlabelhtml***Nous vous proposons de compléter des informations sur le type d\'accueil que vous pouvez fournir. Une page d\'aide permet d\'avoir une <a href=\"?AideTypeDApprentissage\" target=\"blank\" class=\"modalbox\">description détaillée des différents types d\'apprentissages</a>*** *** *** *** *** *** *** *** ***\r\ncheckbox***ListeTypeDAccueil***Type d\'apprentissage*** *** *** ***type_accueil*** ***1*** *** *** * *** * *** *** ***\r\ncheckbox***ListeTypeDeLogement***Type de logement*** *** *** ***logement*** ***0*** *** *** * *** * *** *** ***\r\nlabelhtml***Nous vous proposons de choisir une ou plusieurs compétences présentes dans les activités du lieu. <br>S\'il en manque une&#44;  vous pouvez l\'ajouter avec le bouton suivant : <a href=\"?AjouterUneCompetence\" target=\"blank\" class=\"btn btn-primary\">Ajouter une nouvelle compétence</a><br>*** *** *** *** *** *** *** *** ***\r\ncheckboxfiche***8***Compétences*** *** *** *** *** ***1*** *** *** * *** * *** *** ***\r\ntextelong***bf_mises_en_garde***Mises en garde, contraintes particulières d\'accueil ?***255***5*** *** ***texte***0*** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-left\" href=\"#menu3Localisation\" role=\"tab\" data-toggle=\"tab\" onclick=\"window.dispatchEvent(new Event(\'resize\'))\"> <i class=\"glyphicon glyphicon-chevron-left\"></i>Onglet 3. Localisation</a><a class=\"btn btn-lg btn-primary pull-right\" href=\"#menu5Preferences\" role=\"tab\" data-toggle=\"tab\">Onglet 5. Préférences<i class=\"glyphicon glyphicon-chevron-right\"></i></a><!--Affiche un bouton pour revenir à l\'onglet 3 et un bouton pour passer à l\'onglet 5-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 4 --> <div role=\"tabpanel\" class=\"tab-pane\" id=\"menu5Preferences\"><br><br><!-- ouvre l\'onglet 5-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Préférences</h2>*** *** *** *** *** *** *** *** ***\r\ntexte***bf_suivi***Suivi par*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\nradio***ListeTypeDeVoyageurs***Qui aimeriez-vous accueillir ?*** *** *** ***bf_type_voyageurs*** ***0*** *** *** * *** * *** *** ***\r\nlabelhtml***Nous avons à cœur de préserver votre temps. Indiquez ci-dessous vos disponibilités pour être contacté (exemple : uniquement par e-mail en novembre&#44;  uniquement par téléphone entre 18h et 19h&#44;  etc...)*** ***Pour conserver l\'envie du lieu pour vous accueillir&#44;  nous avons recueilli ses disponibilités que nous vous invitons à respecter.*** *** *** *** *** *** ***\r\ntextelong***pref_contact***Préférences de contact*** ***3*** *** ***texte***0*** *** *** *** *** *** ***\r\nradio***ListeOuiNon***Les chemineurs et chemineuses peuvent-ils vous contacter directement ?*** *** *** ***bf_contact_direct_voyageurs*** ***1*** *** *** * *** * *** *** ***\r\nradio***ListeOuiNon***Les&nbsp; chemineurs et chemineuses  peuvent-ils venir de façon spontanée ?*** *** *** ***bf_venue_spontanee_voyageurs*** ***1*** *** *** * *** * *** *** ***\r\ncheckbox***ListeMois***Quelles sont les périodes propices à l\'accueil ?*** *** *** ***bf_periodes_propices*** ***1*** *** *** * *** * *** *** ***\r\nlabelhtml***<div id=\"checkboxListeTypeDAccueiltype_accueil_WoofingChantiers\" style=\"display:none;\">Dans le cas du wwoofing&#44;  exigeriez-vous un niveau minimum ?*** *** *** *** *** *** *** *** ***\r\nradio***ListeOuiNon***Niveau minimum requis de compétences pour du wwoofing :*** *** *** ***bf_niveau_mini_woofing_competences*** ***0*** *** *** * *** * *** *** ***\r\nradio***ListeOuiNon***Niveau minimum requis d\'expérience pour du wwoofing :*** *** *** ***bf_niveau_mini_woofing_experience*** ***0*** *** *** * *** * *** *** ***\r\nlabelhtml***</div>*** *** *** *** *** *** *** *** ***\r\nradio***ListeOuiNon***Souhaitez-vous que les Chemins de la Transition prennent en charge les réservations ?*** *** *** ***bf_gestion_reservations*** ***1*** *** *** * *** * *** *** ***\r\nradio***ListeOuiNon***Souhaitez-vous que les Chemins de la Transition prennent en charge l\'accueil sur votre lieu ?*** *** *** ***bf_gestion_accueil*** ***1*** *** *** * *** * *** *** ***\r\nliste***ListeOuiNon***Avez-vous des demandes particulières concernant l\'usage de vos données et de votre vie privée ?*** *** *** ***bf_vie_privee*** ***1*** *** *** * *** * *** *** ***\r\nlabelhtml***<div id=\"listeListeOuiNonbf_vie_privee_oui\" style=\"display:none;\">*** *** *** *** *** *** *** *** ***\r\ntexte***bf_details_donnes_personnelles***Quelles sont vos demandes concernant vos données personnelles ?*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\nlabelhtml***</div>*** *** *** *** *** *** *** *** ***\r\nliste***ListeOuiNon***Accepteriez-vous que votre lieu / projet soit annoté, évalué, commenté ?*** *** *** ***bf_acceptation_notes*** ***0*** *** *** * *** * *** *** ***\r\nlabelhtml***<div id=\"listeListeOuiNonbf_acceptation_notes_oui\" style=\"display:none;\">*** *** *** *** *** *** *** *** ***\r\ntexte***bf_details_notes***De quelles manières voudriez-vous que votre lieu / projet soit évalué ou commenté ?*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\nlabelhtml***</div>*** *** *** *** *** *** *** *** ***\r\nliste***ListeOuiNon***Accepteriez-vous que l’on voit combien de chemineuses et chemineurs ont visité votre lieu ? (fréquentation)*** *** *** ***bf_acceptation_frequentation*** ***0*** *** *** * *** * *** *** ***\r\nlabelhtml***<div style=\"font-weight: bold; font-size: large;\">Il ne vous reste plus qu\'à valider ! </div>*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-left\" href=\"#menu4Hebergement\" role=\"tab\" data-toggle=\"tab\"> <i class=\"glyphicon glyphicon-chevron-left\"></i>Onglet 4. Type d\'apprentissage-hébergement</a><!--Affiche un bouton pour revenir à l\'onglet 4-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 5 --> </div><!-- ferme l\'ensemble des onglets -><style>#formulaire .form-actions { display:none; }</style><!--Efface les boutons Valider/Annuler en bas de chaque onglet-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"moderation-a-afficher\" style=\"display:none;\">***<div class=\"moderation-a-afficher\" style=\"display:none;\">*** *** *** *** *** *** *** ***\r\ncheckbox***ListeModeration***Moderation*** *** ***a_moderer***bf_moderation*** ***0*** *** ***@moderateurs***@moderateurs*** *** ***\r\nlabelhtml***</div><div id=\"balise-de-test-moderation\" style=\"display:none;\"><a href=\"https://lescheminsdelatransition.org/plateforme/?Espace_Moderateurs\">Espace Modérateurscacher_si_pas_autorise</a></div><script>var list_elements = document.getElementsByClassName(\"moderation-a-afficher\") ; for (id_item in list_elements){ if (!(document.getElementById(\"balise-de-test-moderation\").hasChildNodes())) { list_elements[0].remove() ; }  else { list_elements[id_item].style =\"\" }}</script>***</div><div id=\"balise-de-test-moderation\" style=\"display:none;\"><a href=\"https://lescheminsdelatransition.org/plateforme/?Espace_Moderateurs\">Espace Modérateurscacher_si_pas_autorise</a></div><script>var list_elements = document.getElementsByClassName(\"moderation-a-afficher\") ; for (id_item in list_elements){ if (!(document.getElementById(\"balise-de-test-moderation\").hasChildNodes())) { list_elements[0].remove() ; }  else { list_elements[id_item].style =\"\" }}</script>*** *** *** *** *** *** *** ***\r\nacls*** ****% @moderateurs*** *** *** *** *** *** *** ***\r\n', 'fr-FR'),
(6, 'Thématiques', 'Liste des thématiques des lieux', '', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Group,schema:CategoryCode', 1, 'texte***bf_titre***Thématique*** *** *** *** ***text***1*** *** *** *** *** ***schema:CategoryCode:name***\r\ntextelong***bf_description***Exemple de description*** ***3*** *** ***wiki***0*** *** *** *** *** ***https://schema.org/description***\r\n', 'fr-FR'),
(7, 'Demande appropriation', '', 'Merci de lire et valider la politique de confidentialité avant de créer ou modifier une fiche.\r\n\r\n<a class=\"btn btn-lg btn-primary modalbox\" href=\"?RGPD\" style=\"margin-top:8px;margin-bottom:8px;\">En savoir plus sur l’utilisation de mes données personnelles...</a>\r\n', '', '', 1, 'titre***Demande {{bf_nom}}  - {{bf_prenom}}*** *** *** *** *** *** *** *** ***\r\ntexte***bf_nom***Nom*** *** *** *** ***text***1*** *** *** * *** * *** *** ***\r\ntexte***bf_prenom***Prénom*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\nchamps_mail***bf_mail***Email*** *** *** ***form*** ***1*** ***\r\nlistefiche***5***Fiche concernée*** *** *** *** *** ***1*** *** *** * *** * *** *** ***\r\ntextelong***bf_comment***Commentaires, raison de la demande<br>*** ***3*** *** ***wiki***0*** *** *** *** *** *** ***\r\n', 'fr-FR'),
(8, 'Compétences', '', '', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Group,schema:CategoryCode', 1, 'texte***bf_titre***Compétence*** *** *** *** ***text***1*** *** *** *** *** ***schema:CategoryCode:name*****\r\n', 'fr-FR'),
(9, 'Partenaire / Écosystème', '', '', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Organization, schema:Organization', 1, 'texte***bf_titre***Nom de l\'organisation<br>*** *** *** *** ***text***1*** *** *** *** *** ***name,schema:name***\r\nimage***bf_image***Logo***140***140***600***600***right***0*** ***\r\ntextelong***bf_description***Description***5***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\nlien_internet***bf_site_internet***Site Internet***40***255*** *** ***url***0*** *** *** *** *** ***url,schema:WebSite***\r\ncheckbox***ListeTypeDePartenariat***Type de partenariat<br>*** *** *** *** *** ***0*** *** *** *** *** *** ***\r\n', 'fr-FR'),
(10, 'Parcours thématiques', '', '', '[\r\n  \"https://www.w3.org/ns/activitystreams\",\r\n  { \"schema\": \"https://schema.org/\" }\r\n]', 'Group,schema:CategoryCode', 1, 'texte***bf_titre***Parcours thématique*** *** *** *** ***text***1*** *** *** *** *** ***schema:CategoryCode:name***\r\ntextelong***bf_description***Exemple de description*** ***3*** *** ***wiki***0*** *** *** *** *** ***https://schema.org/description***\r\n *** ***@admins***@admins***\r\n', 'fr-FR'),
(11, 'Contributeur', 'Formulaire pour recueillir les informations sur les contributrices et contributeurs', 'Merci de lire et valider la politique de confidentialité avant de créer ou modifier une fiche.\r\n\r\n<a class=\"btn btn-lg btn-primary modalbox\" href=\"?RGPD\" style=\"margin-top:8px;margin-bottom:8px;\">En savoir plus sur l’utilisation de mes données personnelles...</a>\r\n', '', '', 1, 'labelhtml***<ul class=\"nav nav-tabs\" role=\"tablist\"><li role=\"presentation\" class=\"active\"><a href=\"#menu1Contact\" role=\"tab\" data-toggle=\"tab\" onclick=\"window.dispatchEvent(new Event(\'resize\'))\">1. Informations de contact</a></li><li role=\"presentation\"><a href=\"#menu2Questionnaire\" role=\"tab\" data-toggle=\"tab\">2. Questionnaire</a></li></ul><div class=\"tab-content\"><!--indique qu\'il y aura 2 onglets-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div role=\"tabpanel\" class=\"tab-pane active\" id=\"menu1Contact\"><br><br><!--ouvre le premier onglet-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Contact</h2>*** *** *** *** *** *** *** *** ***\r\ntitre***Fiche contributeur {{bf_prenom}} {{bf_nom}}***Titre Automatique*** *** *** *** *** *** *** ***\r\ntexte***bf_prenom***Prénom*** *** *** *** ***text***1*** *** *** * *** * *** *** ***\r\ntexte***bf_nom***Nom*** *** *** *** ***text***1*** *** *** * *** * *** *** ***\r\nimage***bf_image***Portrait***210***140***300***200***right***0*** ***\r\nchamps_mail***bf_email***Email*** *** *** *** *** ***1*** ***\r\nchamps_mail***bf_gmail***Identifiant Gmail*** *** *** *** *** ***0*** ***\r\ntexte***bf_tel***Téléphone***15***15*** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_id_matrix***Identifiant matrix.org / Element*** *** *** *** ***text***1*** *** *** * *** * *** *** ***\r\ntexte***bf_id_github***Identifiant GitHub*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-right\" href=\"https://www.helloasso.com/associations/les-chemins-de-la-transition/adhesions/cotisations/\">Adhérer</a>*** *** *** *** *** *** *** *** ***\r\nlistedatedeb***bf_date_adhesion***Date d\'adhésion*** *** ***1*** *** ***0*** *** *** * *** * *** *** ***\r\nliste***ListeOuiNon***J\'accepte que mes informations soient diffusées au sein des Chemins de la Transition*** *** *** ***bf_partage_info*** ***1*** *** *** * *** * *** *** ***\r\ntexte***bf_adresse***Adresse***50*** *** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_complement_adresse***Adresse (complément)***50*** *** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_code_postal***Code postal***8***8*** *** ***text***0*** *** *** * *** * *** *** ***\r\ntexte***bf_ville***Ville***25*** *** *** ***text***0*** *** *** * *** * *** *** ***\r\ncarte_google***bf_latitude***bf_longitude*** *** *** *** *** *** *** ***\r\nlabelhtml***<p>Dans le champ suivant  indiquez pour chaque organisation :<br><ul><li>Le périmètre d\'intervention</li><li>Nombre de bénéficiaires : ........ dont ........ hommes et ........ femmes</li><li>Effectif salarié : ........ dont ........ hommes et ........ femmes</li><li>Effectif bénévole : ........ dont ........ hommes et ........ femmes</li></ul></p><br>*** *** *** *** *** *** *** *** ***\r\ntextelong***bf_organisations***Organisation(s) représentée(s)***60***5*** *** ***wiki***0*** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-right\" href=\"#menu2Questionnaire\" role=\"tab\" data-toggle=\"tab\">Onglet 2. Questionnaire<i class=\"glyphicon glyphicon-chevron-right\"></i></a><!--Affiche un bouton pour passer à l\'onglet 2-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 1 --> <div role=\"tabpanel\" class=\"tab-pane\" id=\"menu2Questionnaire\"><br><br><!-- ouvre l\'onglet 2-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<h2 class=\"text-center\">Questionnaire</h2>*** *** *** *** *** *** *** *** ***\r\ntextelong***bf_connaissance***Comment ai-je connu Les Chemins de la Transition ?*** ***5*** *** ***texte***0*** *** *** *** *** *** ***\r\ntextelong***bf_rejoindre***Pourquoi rejoindre les Chemins de la Transition ?*** ***5*** *** ***texte***0*** *** *** *** *** *** ***\r\ntextelong***bf_attentes***Quelles sont mes attentes, sur quels sujets ai-je envie de m\'impliquer ?*** ***5*** *** ***texte***0*** *** *** *** *** *** ***\r\ntextelong***bf_disponibilites***Quelles sont mes disponibilités ?*** ***5*** *** ***texte***0*** *** *** *** *** *** ***\r\ntextelong***bf_competences***Quelles sont mes compétences/Que puis-je apporter&nbsp;? (mini CV en 8 lignes max)*** ***8*** *** ***html***0*** *** *** *** *** *** ***\r\ntextelong***bf_autres_informations***Autres informations que je souhaite porter à la connaissance du collectif*** ***8*** *** ***texte***0*** *** *** *** *** *** ***\r\nlabelhtml*** *** *** *** *** *** *** *** *** ***\r\nlabelhtml***<a class=\"btn btn-lg btn-primary pull-left\" href=\"#menu1Contact\" role=\"tab\" data-toggle=\"tab\" onclick=\"window.dispatchEvent(new Event(\'resize\'))\"> <i class=\"glyphicon glyphicon-chevron-left\"></i>Onglet 1. Informations de contact</a><!--Affiche un bouton pour revenir à l\'onglet 1-->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<div class=\"clearfix\"></div></div><!-- ferme l\'onglet 2 --> </div><!-- ferme l\'ensemble des onglets -><style>#formulaire .form-actions { display:none; }</style><!--Efface les boutons Valider/Annuler en bas de chaque onglet-->*** *** *** *** *** *** *** *** ***\r\nacls***@moderateurs***@moderateurs***@moderateurs*** *** *** *** *** *** ***\r\n', 'fr-FR'),
(12, 'Enquête lieu', '', 'Merci de lire et valider la politique de confidentialité avant de créer ou modifier une fiche.\r\n\r\n<a class=\"btn btn-lg btn-primary modalbox\" href=\"?RGPD\" style=\"margin-top:8px;margin-bottom:8px;\">En savoir plus sur l’utilisation de mes données personnelles...</a>\r\n', '', '', 1, 'titre***Enquete_Lieux_{{listefiche5bf_lieu}}_{{bf_prenom}}_{{bf_nom}}***Titre*** *** *** *** *** *** *** ***\r\ntexte***bf_prenom***Prénom*** *** *** *** ***text***1*** *** *** * *** * *** *** ***\r\ntexte***bf_nom***Nom*** *** *** *** ***text***1*** *** *** * *** * *** *** ***\r\nlistefiche***5***Lieu*** *** *** ***bf_lieu*** ***1*** *** *** * *** * *** *** ***\r\ntextelong***bf_recommandations***Auriez-vous des acteurs / lieux à nous recommander ?***255***5*** *** ***texte***0*** *** *** *** *** *** ***\r\ncheckbox***ListeTypeDeContribution***Aimeriez-vous contribuer aux Chemins de la Transition ? en devenant...*** *** *** ***bf_contribution*** ***0*** *** *** * *** * *** *** ***\r\ncheckbox***ListeTypeDAttentes***Qu’attendez-vous des Chemins de la Transition ?*** *** *** ***bf_attentes_lieux*** ***0*** *** *** * *** * *** *** ***\r\nlabelhtml***<div id=\"checkboxListeTypeDAttentesbf_attentes_lieux_autre\" style=\"display:none;\">*** *** *** *** *** *** *** *** ***\r\ntexte***bf_autres_attentes***Autres attentes*** *** *** *** ***text***0*** *** *** * *** * *** *** ***\r\nlabelhtml***</div> <!-- fin de la condition -->*** *** *** *** *** *** *** *** ***\r\nlabelhtml***<span style=\"font-weight:600;color: var(--primary-color);font-size:1 em;\">En quoi pourrions-nous vous être utiles ? Qu\'attendez-vous d\'une telle plateforme ? Quels services en particulier ?</span>*** *** *** *** *** *** *** *** ***\r\ntextelong***bf_utlite***Vos attentes***255***5*** *** ***html***0*** *** *** *** *** *** ***\r\nlabelhtml***<span style=\"font-weight:600;color: var(--primary-color);font-size:1 em;\">Quelles plateformes utilisez-vous actuellement ?<br>Utilisez-vous d\'autres services de ce type ? Si oui  lesquels ?<br>Êtes-vous ou aimeriez-vous être référencés sur Transiscope  Près de chez nous ?</span>*** *** *** *** *** *** *** *** ***\r\ntextelong***bf_plateforme_actuelle***Votre usage***255***5*** *** ***html***0*** *** *** *** *** *** ***\r\nlabelhtml***<span style=\"font-weight:600;color: var(--primary-color);font-size:1 em;\">Quels seraient  selon vous  les leviers pour améliorer le dynamisme au niveau de votre territoire ?</span>*** *** *** *** *** *** *** *** ***\r\ntextelong***bf_rapport_au_territoire***Rapport au territoire***255***5*** *** ***html***0*** *** *** *** *** *** ***\r\ntextelong***bf_ameliorations***Quelles seraient les fonctionnalités que devrait proposer la plateforme&nbsp; ?*** *** *** *** ***html***0*** *** *** *** *** *** ***\r\n', 'fr-FR');
