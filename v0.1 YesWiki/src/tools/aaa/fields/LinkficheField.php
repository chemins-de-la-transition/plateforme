<?php

namespace YesWiki\Aaa\Field;

use Psr\Container\ContainerInterface;
use YesWiki\Bazar\Field\BazarField;

/**
 * @Field({"linkfiche"})
 */
class LinkficheField extends BazarField
{
    protected function renderStatic($entry)
    {
        return $this->render("@custom/fields/link.twig", [
                'tag' => $entry['id_fiche'],
                'title' => $entry['bf_titre'],
            ]);
    }
    
    protected function renderInput($entry)
    {
        return null;
    } 
    
    protected function getValue($entry)
    {
        return null;
    }
    
    public function formatValuesBeforeSave($entry)
    {

        return  [];
    }
}
