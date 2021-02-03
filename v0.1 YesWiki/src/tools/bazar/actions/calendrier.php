<?php
/**
* calendrier : programme affichant les evenements du bazar sous forme de Calendrier dans wikini
*
*/

use YesWiki\Bazar\Service\EntryManager;

// pour retro-compatibilité
$this->setParameter('template', 'calendar');

$entryManager = $this->services->get(EntryManager::class);

$this->AddJavascriptFile('tools/bazar/libs/bazar.js');

// Recuperation de tous les parametres
$GLOBALS['params'] = getAllParameters($this);
// tableau des fiches correspondantes aux critères
if (is_array($GLOBALS['params']['idtypeannonce'])) {
    $results = array();
    foreach ($GLOBALS['params']['idtypeannonce'] as $formId) {
        $results = array_merge(
            $results,
            $entryManager->search(['queries' => $GLOBALS['params']['query'], 'formsIds' => [$formId]])
        );
    }
} else {
    $results = $entryManager->search(['queries' => $GLOBALS['params']['query']]);
}

// a la place du choix par défaut, on affiche en calendrier
if ($GLOBALS['params']['template'] == $GLOBALS['wiki']->config['default_bazar_template']) {
    $GLOBALS['params']['template'] = 'calendar.tpl.html';
}


// affichage à l'écran
echo displayResultList($results, $GLOBALS['params'], false);
