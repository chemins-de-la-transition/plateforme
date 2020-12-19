<?php

use YesWiki\Bazar\Service\FicheManager;

if (!defined("WIKINI_VERSION")) {
    die("acc&egrave;s direct interdit");
}

$params = $GLOBALS['wiki']->parameter;

if (!empty($params['datefield'])) { 

    $fiches = $GLOBALS['wiki']->services->get(FicheManager::class)->search([
        'queries'=> empty($params['query']) ? '' : $params['query'],
        'formsIds'=> empty($params['id']) ? '' : $params['id'],
        'keywords'=> empty($params['search']) ? '' : $params['search']
    ]);

    global $param_date_field ;
    $param_date_field = $params['datefield'] ;
    global $displayIfNoDate ;
    $displayIfNoDate = (!empty($params['displayIfNoDate']) && ($params['displayIfNoDate'] == "true"))  ;

    if (!function_exists('date_less_than_18')) {
       function date_less_than_18($fiche) {
          $nb_year = 18;
          $today_date = time();
          $datemin = $today_date - ($nb_year*365*24*60*60); // time in sec
          $datefiche = strtotime($fiche[$GLOBALS['param_date_field']]);
          if (($datefiche >=$datemin) || ($GLOBALS['displayIfNoDate'] && empty($fiche[$GLOBALS['param_date_field']]))) {
              return true;
              }
           else  {
               return  false;
          }
      }
    }
    
    $fiches = array_filter($fiches, "date_less_than_18");
    
    
    if (count($fiches) > 0) {
        $ids_fiches = implode(',',array_keys($fiches)) ;
        $query = isset($params['query']) ? $params['query'] .'|' : '' ;
        $query .= 'id_fiche=' . $ids_fiches ;
        $params['query'] = $query ;
        unset($ids_fiches) ;
        unset($query) ;
        
        echo $GLOBALS['wiki']->Action('bazarliste',0,$params) ;
    } else {
        echo '<div class="alert alert-info">Aucune fiche trouvée</div>' ;
    }
    unset($param_date_field) ;
    unset($displayIfNoDate) ;
} else {
    echo '<div class="alert alert-danger">L\'action "bazarlistlm" doit avoir le parametre "datefield" défini !</div>' ;
}

