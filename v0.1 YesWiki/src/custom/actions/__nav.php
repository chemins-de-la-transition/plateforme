<?php
if (!defined("WIKINI_VERSION")) {
    die("acc&egrave;s direct interdit");
}

// hideifnoaccess
$hideifnoaccess = $this->GetParameter('hideifnoaccess','');

if ($hideifnoaccess == "true"){
    // liens
    $links = $this->GetParameter('links');
    if (!empty($links)) {
        $links = explode(',', $links);
        $links = array_map('trim', $links);
    }

    // titre des liens
    $titles = $this->GetParameter('titles');
    if (!empty($titles)) {
        $titles = explode(',', $titles);
        $titles = array_map('trim', $titles);
    }
    
    if (count($links) == count($titles)) {
        $linksTitles = array_combine($links,$titles) ;
        $results = [] ;
        foreach($linksTitles as $link => $title) {
            if ($GLOBALS['wiki']->HasAccess('read', $link)) {
                $results[$link] = $title ;
            }
        }
        
        $this->setParameter('links',implode(',', array_keys($results)));
        $this->setParameter('titles',implode(',', array_values($results)));
    }
}