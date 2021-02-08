<?php

use YesWiki\Bazar\Service\EntryManager;
use YesWiki\Core\YesWikiAction;

class Bazarlistm18cdltAction extends YesWikiAction
{
    public function formatArguments($arg)
    {
        return([
            'query' => $arg['query'] ?? null,
            'id' => $arg['id'] ?? null,
            'search' => $arg['search'] ?? null,
            'datefield' => $arg['datefield'] ?? null,
            'displayIfNoDate' => (!empty($arg['displayIfNoDate']) && ($arg['displayIfNoDate'] == "true")) ,
        ]);
    }
    public function run()
    {
        if ($this->arguments['datefield']) {
            $fiches = $this->getService(EntryManager::class)->search([
                'queries'=> $this->arguments['query'] ?? '',
                'formsIds'=> $this->arguments['id'] ?? '',
                'keywords'=> $this->arguments['search'] ?? ''
            ]);
    
            $fiches = $this->filter_fiches($fiches) ;
    
            if (count($fiches) > 0) {
                $ids_fiches = implode(',',array_keys($fiches)) ;
                $query = ($this->arguments['query']) ? $this->arguments['query'] .'|' : '' ;
                $query .= 'id_fiche=' . $ids_fiches ;
                $this->arguments['query'] = $query ;
                
                $output = $this->callAction('bazarliste', $this->arguments);
            } else {
                $output = '<div class="alert alert-info">Aucune fiche trouvée</div>' ;
            }
        } else {
            $output = '<div class="alert alert-danger">L\'action "bazarlistlm" doit avoir le parametre "datefield" défini !</div>' ;
        }

        return $output ;
    }

    private function date_less_than_18(array $fiche):bool
    {
        $nb_year = 18;
        $today_date = time();
        $datemin = $today_date - ($nb_year*365*24*60*60); // time in sec
        $datefiche = strtotime($fiche[$this->arguments['param_date_field']]);
        if (($datefiche >=$datemin) || ($this->arguments['displayIfNoDate'] && empty($fiche[$this->arguments['param_date_field']]))) {
            return true;
            }
        else  {
             return  false;
        }
    }

    private function filter_fiches(array $fiches):array
    {
        $result = [] ;
        foreach($fiches as $fiche){
            if ($this->date_less_than_18($fiche)) {
                $result[] = $fiche ;
            }
        }
        return $result ;
    }
}
