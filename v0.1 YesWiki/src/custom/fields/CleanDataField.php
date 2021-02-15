<?php

namespace YesWiki\Custom\Field;

use Psr\Container\ContainerInterface;
use YesWiki\Bazar\Field\BazarField;

/**
 * @Field({"cleandata"})
 */
class CleanDataField extends BazarField
{
    protected const PREFIX = "<" ;

    protected function renderStatic($entry)
    {
        return null;
    }
    
    protected function getValue($entry)
    {
        return null;
    }
    
    protected function render($templatePath, $data = [])
    {
        return null;
    }
    
    public function formatValuesBeforeSave($entry)
    {
        $fields_to_remove = [] ;
        if (isset($entry['id_fiche'])){
            foreach ($entry as $key => $val){
                if ($key[0] == self::PREFIX 
                    || $key == 'fields-to-remove' 
                    || $key == 'checkboxListeModerationbf_moderation' 
                    || $key == 'datastr' 
                    ){
                    $fields_to_remove[] = $key;
                }
            }
        }
        return (count($fields_to_remove) >0) ?['fields-to-remove' => $fields_to_remove] : [];
    }
}
