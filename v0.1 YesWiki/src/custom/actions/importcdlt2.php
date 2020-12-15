<?php

use YesWiki\Bazar\Service\FicheManager;

if (!defined("WIKINI_VERSION")) {
    die("acc&egrave;s direct interdit");
}
class geoCoder
{
    private $cache = [] ;
    private $address1 ;
    private $address2 ;
    private $postalCode ;
    private $town ; 
    private $addresses ;
    private $url ;
    private $lastCall ;
    private $FirstCall ;
    private $maxDurationSec ;
    
    public function __construct($address1 = '',$address2 = '',$postalCode = '',$town = '',$url = '', $maxDurationSec=3)
    {
        $this->updateParameters($address1,$address2,$postalCode,$town) ;
        if (empty($url)) {
            $this->url = $GLOBALS['wiki']->Href() ;
        } else {
            $this->url = $url ;
        }
        $this->lastCall = microtime(true) - 2 ;
        $this->FirstCall = $this->lastCall ;
        $this->maxDurationSec = $maxDurationSec ;
    }
    
    private function updateParameters($address1 = '',$address2 = '',$postalCode = '',$town = '')
    {
        $this->address1 = $address1 ;
        $this->address2 = $address2 ;
        $this->postalCode = $postalCode ;
        $this->town = $town ;
        $this->addresses = [
                $address1 . ' ' .$address2 . ' ' .$postalCode . ' ' .$town ,
                $address1 . ' '                  .$postalCode . ' ' .$town ,
                $address1 . ' '                  .$postalCode . ' ' .$town ,
                                $address2 . ' '  .$postalCode . ' ' .$town ,
                                                  $postalCode . ' ' .$town ,
                                                                     $town ,
                                                  $postalCode              ,
            ];
    }
    
    public function giveLocalization($address1 = '',$address2 = '',$postalCode = '',$town = '')
    {
        $this->updateParameters($address1,$address2,$postalCode,$town) ;
        $i = 0 ;
        $result = false ;
        while ($i < count($this->addresses) && !$result) {
            $result = $this->getLocalization($this->addresses[$i]) ;
            $i++ ;
        }       
        return ($result) ?? "|" ;
    }
    
    private function getLocalization($address)
    {
        $search = trim($address) ;
        if (isset($cache[$search])) {
            return $cache[$search] ;
        }
        if (!empty($this->maxDurationSec) && ((microtime(true)-$this->FirstCall) > ($this->maxDurationSec*1000))) {
            return false ;
        }
        
        $channel = curl_init('https://nominatim.openstreetmap.org/search?q=' . urlencode($search) .'&format=json');
        
        // définition des options
        // retour sous forme de châine sans affichage
        curl_setopt ($channel ,CURLOPT_RETURNTRANSFER, true) ;
        
        curl_setopt ($channel ,CURLOPT_REFERER,  $this->url) ;
        curl_setopt ($channel ,CURLOPT_AUTOREFERER, true) ;
        
        // exécution de la session
        // attend avant exécution de deux appels successifs
        $availableTime = 1000 - (microtime(true)- $this->lastCall) ;
        if ($availableTime>0) {
            usleep(round($availableTime)) ; // to respect https://operations.osmfoundation.org/policies/nominatim/ sleep 1 seconds
        }
        $this->lastCall = microtime(true) ;
        $returnResult = curl_exec($channel);

        // fermeture des ressources
        curl_close($channel);
        
        // conversion du json
        $data = json_decode($returnResult,true) ;
        $cache[$search] = (count($data) > 0) ? $data[0]["lon"]."|".$data[0]["lat"] : false ;
        return $cache[$search] ;
    }
}

$user = $this->GetUserName();
if (!($this->LoadUser($user))) {
    echo '<div class="alert alert-danger"><strong>'._t('CUSTOM_ACTION_IMPORTCDLT').' :</strong>&nbsp;'._t('CUSTOM_ACTION_IMPORTCDLT_ONLY_FOR_CONNECTED').'...</div>'."\n";
} else {
    
    $output = '';
    $id = $GLOBALS['wiki']->GetParameter('id',isset($_REQUEST['id']) ? $_REQUEST['id'] : '');
    if (empty($id)) {
        $id = isset($_REQUEST['id_typeannonce']) ? $_REQUEST['id_typeannonce'] : '';
    }
    //on transforme en entier, pour eviter des attaques
    $id = (int)preg_replace('/[^\d]+/', '', $id);

    $urlParams = BAZ_VARIABLE_VOIR.'='.BAZ_VOIR_IMPORTER;
    $output .= '<form method="post" action="'.$GLOBALS['wiki']->href('', $GLOBALS['wiki']->getPageTag(), $urlParams).'" '.
    'enctype="multipart/form-data" class="form-horizontal">'."\n";

    // le fichier cvs vient d'être téléchargé, on le traite
    if (isset($_POST['submit_file'])) {
        $row = 1;
        $val_formulaire = baz_valeurs_formulaire($id);

        // Recuperation champs de la fiche
        $tableau = $val_formulaire['template'];
        $alllists = array_change_key_case(baz_valeurs_liste(), CASE_LOWER);
        $nb = 0;
        $nom_champ = array();
        $type_champ = array();
        foreach ($tableau as $ligne) {
            if ($ligne[0] != 'labelhtml') {
                if ($ligne[0] == 'radio' || $ligne[0] == 'liste' || $ligne[0] == 'checkbox' || $ligne[0] == 'listefiche' || $ligne[0] == 'checkboxfiche') {
                    $nom_champ[] =
                    $ligne[0].$ligne[1].$ligne[6];
                    $type_champ[] =
                    $ligne[0];
                    $idliste_champ[$ligne[0].$ligne[1].$ligne[6]] =
                    $ligne[1];
                } elseif ($ligne[0] == 'carte_google') {
                    $nom_champ[] = $ligne[1];
                    $nom_champ[] = $ligne[2];
                    $type_champ[] = $ligne[0];
                    $type_champ[] = $ligne[0];
                    ++$nb;
                } elseif ($ligne[0] == 'utilisateur_wikini') {
                    $nom_champ[] = 'nomwiki';
                    $nom_champ[] = 'mot_de_passe_wikini';
                    $type_champ[] = $ligne[0];
                    $type_champ[] = $ligne[0];
                    ++$nb;
                } elseif ($ligne[0] == 'titre') {
                    $nom_champ[] = 'bf_titre';
                    $type_champ[] = $ligne[0];
                } elseif ($ligne[0] == 'inscriptionliste') {
                    $nom_champ[] = str_replace(array('@', '.'), array('',
                        '', ), $ligne[1]);
                    $type_champ[] = $ligne[0];
                } elseif ($ligne[0] == 'image' || $ligne[0] == 'fichier') {
                    $nom_champ[] = $ligne[0].$ligne[1];
                    $type_champ[] = $ligne[0];
                } else {
                    $nom_champ[] = $ligne[1];
                    $type_champ[] = $ligne[0];
                }
                ++$nb;
            }
        }

        if ((!empty($_FILES['fileimport'])) &&
            ($_FILES['fileimport']['error'] == 0)) {
            //Check if the file is csv
            $filename = basename($_FILES['fileimport']['name']);
            $ext = substr($filename, strrpos($filename, '.') + 1);
            if ($ext == 'csv') {
                $erreur = false;
                $outputright = '';
                $outputerror = '';
                if (($handle = fopen($_FILES['fileimport']['tmp_name'], 'r')) !== false) {
                    
    
                    $geoCoder = new geoCoder() ;
                    while (($data = fgetcsv($handle, 0, ',')) !== false) {
                        $valeur = array();
                        $geolocalisation = false;
                        $bf_latitude = false;
                        $bf_longitude = false;
                        $erreur = false;
                        $errormsg = array();
                        $num = count($data);
                        $dateincvs = false;
                        // la premiere ligne contient les titres des colonnes
                        if ($row == 1) {
                            // on teste s'il faut ignorer les 2 premieres colonnes
                            if ($data[0] == 'datetime_create' and $data[1] == 'datetime_latest') {
                                $startparsing = 2;
                                // on ajoute 2 champs vides pour les dates
                                array_unshift($nom_champ, 'datetime_create', 'datetime_latest');
                                array_unshift($type_champ, 'datetime_create', 'datetime_latest');
                            } else {
                                $startparsing = 0;
                            }
                        } elseif ($row > 1) {
                            for ($c = $startparsing; $c < $num; ++$c) {
                                if (isset($nom_champ[$c])) {
                                    $valeur[$nom_champ[$c]] = $data[$c];
                                    $valeur[$nom_champ[$c]] = str_replace(
                                        array(
                                            '&sbquo;', '&fnof;', '&bdquo;',
                                            '&hellip;', '&dagger;', '&Dagger;',
                                            '&circ;', '&permil;', '&Scaron;',
                                            '&lsaquo;', '&OElig;', '&lsquo;',
                                            '&rsquo;', '&ldquo;', '&rdquo;',
                                            '&bull;', '&ndash;', '&mdash;',
                                            '&tilde;', '&trade;', '&scaron;',
                                            '&rsaquo;', '&oelig;', '&Yuml;',
                                        ),
                                        array(chr(130), chr(131), chr(132),
                                            chr(133), chr(134), chr(135),
                                            chr(136),
                                            chr(137), chr(138), chr(139),
                                            chr(140), chr(145), chr(146),
                                            chr(147),
                                            chr(148), chr(149), chr(150),
                                            chr(151), chr(152), chr(153),
                                            chr(154),
                                            chr(155), chr(156), chr(159),
                                        ),
                                        $valeur[$nom_champ[$c]]
                                    );

                                    if ($nom_champ[$c] == 'bf_latitude') {
                                        $bf_latitude = $data[$c];
                                        $geolocalisation = true;
                                    }
                                    if ($nom_champ[$c] == 'bf_longitude') {
                                        $bf_longitude = $data[$c];
                                        $geolocalisation = true;
                                    }

                                    // recuperer les labels pour les listes et checkbox sinon, id ou index
                                    if (($type_champ[$c] == 'checkbox' ||
                                        $type_champ[$c] == 'liste'||
                                        $type_champ[$c] == 'radio') &&
                                        !empty($data[$c])) {
                                        if ($type_champ[$c] == 'liste' || $type_champ[$c] == 'radio') {
                                            $idval = array_search(
                                                $data[$c],
                                                $alllists[strtolower($idliste_champ[$nom_champ[$c]])]['label']
                                            );
                                            // le label n'est pas trouvé, vérifier si c'est un nombre ou une clé
                                            if ((! $idval) && (is_numeric($data[$c]) || 
                                                    array_key_exists($data[$c],
                                                    $alllists[strtolower($idliste_champ[$nom_champ[$c]])]['label']))) {
                                                $idval = $data[$c] ;
                                            }
                                        } elseif ($type_champ[$c] ==
                                            'checkbox') {
                                            $tab_chkb = extractComaFromStringThenExplode($data[$c]);
                                            $k = strtolower($idliste_champ[$nom_champ[$c]]);
                                            $refList = $alllists[$k]['label'];
                                            $tab_id = array();
                                            foreach ($tab_chkb as $value) {
                                                // dirty patch to permits "index" instead of "label"
                                                // https://framagit.org/Artefacts/ATable-guide-web/issues/30
                                                if (is_numeric($value)) {
                                                    $tab_id[] = $value ;
                                                } else {
                                                    $res = array_search($value, $refList);
                                                    // le label n'est pas trouvé, vérifier si c'est une clé et l'utiliser
                                                    if ($res === false && array_key_exists($value, $refList)) {
                                                        $res = $value;
                                                    }
                                                    $tab_id[] = $res ;
                                                }
                                            }
                                            $idval = implode(',', $tab_id);
                                        }
                                        $valeur[$nom_champ[$c]] = $idval;
                                    }

                                    // recuperer les id pour les listefiche et checkboxfiche plutot que leur bf_titre
                                    if (($type_champ[$c] == 'checkboxfiche' || $type_champ[$c] == 'listefiche') &&
                                        isset($data[$c]) && !empty($data[$c])) {
                                        $tab_chkb = extractComaFromStringThenExplode($data[$c]);
                                        $tab_id = array();
                                        $idfiche = str_replace($type_champ[$c], '', $nom_champ[$c]);
                                        if (!isset($allentries[$idfiche])) {
                                            $fa = $GLOBALS['wiki']->services->get(FicheManager::class)->search();
                                            $tabfa = array();
                                            foreach ($fa as $valfa) {
                                                $tabfa[$valfa['id_fiche']] = $valfa['bf_titre'];
                                            }
                                            $allentries[$id] = $tabfa;
                                        }
                                        foreach ($tab_chkb as $value) {
                                            $idval = array_search(
                                                $value,
                                                $allentries[$id]
                                            );
                                            if ($idval === false && array_key_exists(
                                                    $value,
                                                    $allentries[$id])) {
                                                $idval = $value;
                                            }
                                            $tab_id[] = $idval;
                                        }
                                        $idval = implode(',', $tab_id);
                                        $valeur[$nom_champ[$c]] = $idval;
                                    }

                                    // traitement des images (doivent être présentes dans le dossier files du wiki)
                                    if (($type_champ[$c]) == 'image' && isset($data[$c]) && !empty($data[$c])) {
                                        $imageorig = trim($valeur[$nom_champ[$c]]);
                                        $nomimage = renameUrlToSanitizedFilename($imageorig);
                                        // test si c'est url vers l'image
                                        $fileCopied = copyUrlToLocalFile($imageorig, BAZ_CHEMIN_UPLOAD.$nomimage);
                                        if ($fileCopied) {
                                            $valeur[$nom_champ[$c]] = $nomimage;
                                        } elseif (file_exists(BAZ_CHEMIN_UPLOAD.$imageorig)) {
                                            if (preg_match('/(gif|jpeg|png|jpg)$/i', $nomimage)) {
                                                //on enleve les accents sur les noms de fichiers, et les espaces
                                                $nomimage = preg_replace(
                                                    '/&([a-z])[a-z]+;/i',
                                                    '$1',
                                                    $imageorig
                                                );
                                                $nomimage = str_replace(' ', '_', $nomimage);
                                                $valeur[$nom_champ[$c]] = $nomimage;
                                                $chemin_destination = BAZ_CHEMIN_UPLOAD.$nomimage;

                                                //verification de la presence de ce fichier
                                                if (!file_exists($chemin_destination)) {
                                                    rename(
                                                        BAZ_CHEMIN_UPLOAD.
                                                        $imageorig,
                                                        $chemin_destination
                                                    );
                                                    chmod($chemin_destination, 0755);
                                                }
                                            } else {
                                                $errormsg[] = _t('BAZ_BAD_IMAGE_FILE_EXTENSION');
                                                $erreur = true;
                                            }
                                        } else {
                                            $errormsg[] =
                                            _t('BAZ_IMAGE_FILE_NOT_FOUND').
                                            ' : '.$imageorig;
                                            $erreur = true;
                                        }
                                    }

                                    // traitement des images (doivent être présentes dans le dossier files du wiki)
                                    if (($type_champ[$c]) == 'fichier' && isset($data[$c]) && !empty($data[$c])) {
                                        $fileUrl = trim($valeur[$nom_champ[$c]]);
                                        $file = renameUrlToSanitizedFilename($fileUrl);
                                        // test si c'est url vers l'image
                                        $fileCopied = copyUrlToLocalFile($fileUrl, BAZ_CHEMIN_UPLOAD.$file);
                                        if ($fileCopied) {
                                            $valeur[$nom_champ[$c]] = $file;
                                        } elseif (file_exists(BAZ_CHEMIN_UPLOAD.$fileUrl)) {
                                            $valeur[$nom_champ[$c]] = $file;
                                            $chemin_destination = BAZ_CHEMIN_UPLOAD.$file;
                                            //verification de la presence de ce fichier
                                            if (!file_exists($chemin_destination)) {
                                                rename(
                                                    BAZ_CHEMIN_UPLOAD.$fileUrl,
                                                    $chemin_destination
                                                );
                                                chmod($chemin_destination, 0755);
                                            }
                                        } else {
                                            $errormsg[] = _t('BAZ_FILE_NOT_FOUND').' : '.$fileUrl;
                                            $erreur = true;
                                        }
                                    }

                                    if ($geolocalisation) {
                                        if (empty($bf_latitude) || empty($bf_longitude)) {
                                            //calculer les coordonnées
                                            $address1 = ($valeur['bf_adresse']) ?? '';
                                            $address2 = ($valeur['bf_complement_adresse']) ?? '';
                                            $postalcode = ($valeur['bf_code_postal']) ?? '';
                                            $town = ($valeur['bf_ville']) ?? '';
                                            $valeur['carte_google'] = $geoCoder->giveLocalization($address1,$address2,$postalcode,$town) ;
                                        } else {
                                            $valeur['carte_google'] =
                                            $bf_latitude.'|'.$bf_longitude;
                                        }
                                    }
                                }
                            }
                            // test si $valeur contient au moins un titre
                            if (!empty($valeur['bf_titre'])) {
                                $valeur['id_fiche'] = genere_nom_wiki($valeur['bf_titre']);
                                $valeur['id_typeannonce'] = $id;
                                $valeur['date_creation_fiche'] = date('Y-m-d H:i:s', time());
                                $valeur['date_maj_fiche'] = date('Y-m-d H:i:s', time());
                                if ($GLOBALS['wiki']->UserIsAdmin()) {
                                    $valeur['statut_fiche'] = 1;
                                } else {
                                    $valeur['statut_fiche'] = $GLOBALS['wiki']->config['BAZ_ETAT_VALIDATION'];
                                }
                                $user = $GLOBALS['wiki']->GetUser();
                                if ($user) {
                                    $valeur['createur'] = $user['name'];
                                } else {
                                    $valeur['createur'] = _t('BAZ_ANONYME');
                                }
                                $valeur['date_debut_validite_fiche'] = date('Y-m-d', time());
                                $valeur['date_fin_validite_fiche'] = '0000-00-00';

                                if (count($errormsg) > 0) {
                                    $outputerror .=
                                    '<label>
                                            <input type="checkbox" disabled> '
                                    .$valeur['bf_titre'].

                                    '
                                            </label>
                                            <a class="btn-mini btn-xs btn btn-default" data-target="#collapse'
                                    .$valeur['id_fiche'].$row.'" data-toggle="collapse">'
                                    .'<i class="fa fa-eye-open icon-eye-open icon-white"></i> '
                                    ._t('BAZ_SEE_ENTRY').'</a>
                                <div class="panel panel-danger">
                                    <div id="collapse'.$valeur['id_fiche'].$row.'" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="alert alert-danger">'.
                                    implode('<br>', $errormsg).'</div>'.
                                    baz_voir_fiche(0, $valeur).'
                                    </div>
                                    </div>
                                </div>'."\n";
                                } else {
                                    $outputright .=
                                    '<label>
                                            <input type="checkbox" name="importfiche['.$valeur['id_fiche'].$row.']" value=\''
                                    .base64_encode(serialize($valeur)).
                                    '\'> '.$valeur['bf_titre'].
                                    '
                                            </label>
                                            <a class="btn-mini btn-xs btn btn-default" data-target="#collapse'.

                                    $valeur['id_fiche'].$row.
                                    '" data-toggle="collapse">'
                                    .
                                    '<i class="fa fa-eye-open icon-eye-open icon-white"></i> '
                                    ._t('BAZ_SEE_ENTRY').'</a>
                                    <div class="panel panel-default">
                                        <div id="collapse'.
                                    $valeur['id_fiche'].$row.'" class="panel-collapse collapse">
                                        <div class="panel-body">'.
                                    baz_voir_fiche(0, $valeur).'
                                        </div>
                                        </div>
                                    </div>'."\n";
                                }
                            }
                        }
                        ++$row;
                    }
                    fclose($handle);
                }

                $output .=

                '<div class="checkbox">
                            <label class="checkbox">
                                <input data-target="#accordion-import" type="checkbox" class="selectall"> '
                ._t('BAZ_SELECT_ALL').
                '
                            </label>
                        </div>
                        <div class="panel-group accordion-group no-dblclick" id="accordion-import">'."\n".
                $outputerror.$outputright."\n".
                '</div><!-- /#accordion-import -->'."\n".

                '<div class="checkbox">
                            <label class="checkbox">
                                <input data-target="#accordion-import" type="checkbox" class="selectall"> '
                ._t('BAZ_SELECT_ALL').'
                            </label>
                        </div>'."\n".

                '<input type="hidden" value="'.$id.
                '" name="id" />'."\n".
                '<button class="btn btn-primary" type="submit">'
                ._t('BAZ_IMPORT_SELECTION').'</button>'."\n";
            }
        }
    } elseif (isset($_POST['importfiche'])) {
        if (!isset($GLOBALS['importdone'])) {
            // Pour les traitements particulier lors de l import
            $GLOBALS['_BAZAR_']['provenance'] = 'import';
            $importList = '';
            $nb = 0;
            foreach ($_POST['importfiche'] as $fiche) {
                $fiche = unserialize(base64_decode($fiche));
                $fiche = array_map('strval', $fiche);

                $fiche['antispam'] = 1;
                $fiche = $GLOBALS['wiki']->services->get(FicheManager::class)->create($id, $fiche);

                ++$nb;
                $importList .= ' '.$nb.') [['.$fiche['id_fiche'].' '. $fiche['bf_titre'].']]'."\n";
            }
            $output .= '<div class="alert alert-success">'. _t('BAZ_NOMBRE_FICHE_IMPORTE').' '.$nb.'</div>'."\n".
            $GLOBALS['wiki']->Format($importList);
            $GLOBALS['importdone'] = true;
        }
    } else {
        // Affichage par defaut
        //On choisit un type de fiches pour parser le csv en consequence
        //requete pour obtenir l'id et le label des types d'annonces
        $resultat = baz_valeurs_formulaire('');

        //s'il y a plus d'un choix possible, on propose
        if (count($resultat) >= 1) {
            $output .=
            '<div class="control-group form-group">'."\n".
            '<label class="control-label col-sm-3">'."\n"

            ._t('BAZ_TYPE_FICHE_IMPORT').' :</label>'."\n".
            '<div class="controls col-sm-9">';
            $output .= '<select class="form-control" name="id" '
            .'onchange="javascript:this.form.submit();">'."\n";

            //si l'on n'a pas deja choisi de fiche, on demarre sur l'option CHOISIR, vide
            if ($id == '') {
                $output .=
                '<option value="" selected="selected">'.
                _t('BAZ_CHOISIR').'</option>'."\n";
            }

            //on dresse la liste de types de fiches
            foreach ($resultat as $ligne) {
                $output .= '<option value="'.$ligne['bn_id_nature']
                .'"'
                .($id == $ligne['bn_id_nature'] ?
                    ' selected="selected"' : '')
                .'>'.$ligne['bn_label_nature'].'</option>'."\n";
            }
            $output .= '</select>'."\n".'</div>'."\n".'</div>'.
            "\n";
        } else {
            $output .= _t('BAZ_PAS_DE_FORMULAIRES_TROUVES')."\n";
        }

        if ($id != '') {
            $val_formulaire = baz_valeurs_formulaire($id);
            $output .=
            '<div class="control-group form-group">'."\n".
            '<label class="control-label col-sm-3">'."\n"
            ._t('BAZ_FICHIER_CSV_A_IMPORTER').' :</label>'."\n".
            '<div class="controls col-sm-9">';
            $output .=
            '<input type="file" class="form-control" name="fileimport" id="idfileimport" />'.
            "\n".'</div>'."\n".'</div>'."\n";
            $output .= '<div class="control-group form-group import-file">'."\n"
            .'<div class="controls col-sm-9 col-sm-offset-3">'."\n".
            '<input name="submit_file" type="submit" value="'
            ._t('BAZ_IMPORTER_CE_FICHIER').
            '" class="btn btn-primary" />'."\n".'</div>'."\n".
            '</div>'."\n";
            $output .= '<div class="alert alert-info">'."\n"
            .'<a data-dismiss="alert" class="close" type="button">&times;</a>'."\n"
            ._t('BAZ_ENCODAGE_CSV')."\n".'</div>'."\n";

            // TODO reprendre code ci apres
            //on parcourt le template du type de fiche pour fabriquer un csv pour l'exemple
            $tableau = $val_formulaire['template'];
            $nb = 0;
            $csv = '';
            foreach ($tableau as $ligne) {
                if ($ligne[0] != 'labelhtml') {
                    if ($ligne[0] == 'liste' || $ligne[0] == 'checkbox' || $ligne[0] == 'radio' ||
                        $ligne[0] == 'listefiche' || $ligne[0] ==
                        'checkboxfiche') {
                        $csv .= _convert(
                            '"'.str_replace('"', '""', $ligne[2]).((isset($ligne[8]) && $ligne[8] == 1) ? ' *' : '').'",',
                            YW_CHARSET
                        );
                    } elseif ($ligne[0] == 'carte_google') {
                        // cas de la carto
                        $csv .= _convert(
                            '"'.str_replace('"', '""', $ligne[1]).((isset($ligne[4]) && $ligne[4] == 1) ? ' *' : '').'",',
                            YW_CHARSET
                        );
                        $csv .= _convert(
                            '"'.str_replace('"', '""', $ligne[2]).((isset($ligne[4]) && $ligne[4] == 1) ? ' *' : '').'",',
                            YW_CHARSET
                        );
                        ++$nb;
                    } elseif ($ligne[0] == 'titre') {
                        // Champ titre aggregeant plusieurs champs
                        $csv .= _convert(
                            '"'.str_replace('"', '""', 'Titre calculé').((isset($ligne[8]) && $ligne[8] == 1) ? ' *' : '').'",',
                            YW_CHARSET
                        );
                    } elseif ($ligne[0] == 'utilisateur_wikini') {
                        // utilisateur et mot de passe
                        $csv .= _convert(
                            '"'.str_replace('"', '""', 'NomWiki').((isset($ligne[8]) && $ligne[8] == 1) ? ' *' : '').'",',
                            YW_CHARSET
                        );
                        $csv .= _convert(
                            '"'.str_replace('"', '""', 'Mot de passe').((isset($ligne[8]) && $ligne[8] == 1) ? ' *' : '').'",',
                            YW_CHARSET
                        );
                        ++$nb;
                    } elseif ($ligne[0] == 'inscriptionliste') {
                        // Nom de la liste et etat de l'abonnement
                        $csv .= _convert(
                            '"'.str_replace('"', '""', $ligne[1]).((isset($ligne[8]) && $ligne[8] == 1) ? ' *' : '').'",',
                            YW_CHARSET
                        );
                    } else {
                        $csv .= _convert(
                            '"'.str_replace('"', '""', $ligne[2]).((isset($ligne[8]) && $ligne[8] == 1) ? ' *': '').'",',
                            YW_CHARSET
                        );
                    }
                    ++$nb;
                }
            }
            $csv = substr(trim($csv), 0, -1)."\r\n";

            for ($i = 1; $i < 4; ++$i) {
                for ($j = 1; $j < ($nb + 1); ++$j) {
                    $csv .= '"ligne '.$i.' - champ '.$j.'", ';
                }
                $csv = substr(trim($csv), 0, -1)."\r\n";
            }
            $output .=
            '<em>'._t('BAZ_EXEMPLE_FICHIER_CSV').
            $val_formulaire['bn_label_nature'].'</em>'."\n";
            $output .= '<pre class="precsv">'."\n".$csv."\n".
            '</pre>'."\n";

            //on cree le lien vers ce fichier
            $output .=
            '<a href="#" onclick="downloadCSV($(\'.precsv\').text(), \'export-bazar-modele-'.$id.'.csv\');return false;" class="btn btn-neutral link-csv-file">'.
            '<i class="fa fa-download"></i>'.
            _t('BAZ_TELECHARGER_FICHIER_IMPORT_CSV').'</a>'."\n";
        }
    }
    $output .= '</form>'."\n";

    echo $output;
}