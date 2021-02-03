<?php

use YesWiki\Core\YesWikiAction;

class BazarUserPageCDLTAction extends YesWikiAction
{
    public function formatArguments($arg)
    {
        $title = $arg["titre"] ?? null ;
        $title = ($title) ? (($title === "0") ? null : $title) : '' ;
        return([
                "filteruserasowner" => "true" ,
                "title" => $title
            ]);
    }
    public function run()
    {
        $output = '' ;
        if ($this->arguments['title']) {
            $titre = empty($this->arguments['title']) ? _t('BAZ_VOS_FICHES') : $this->arguments['title'] ;
            $output .= '<h2 class="titre_mes_fiches">'. $titre .'</h2>'."\n";
        }
        $output .= $this->callAction('bazarliste', $this->arguments);
        return $output ;
    }
}
