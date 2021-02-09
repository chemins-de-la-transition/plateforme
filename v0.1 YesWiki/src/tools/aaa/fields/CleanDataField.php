<?php

namespace YesWiki\Aaa\Field;

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
                    || substr_compare($key,"Vous pouvez",0,strlen("Vous pouvez")) == 0
                    || substr_compare($key,"Nous vous",0,strlen("Nous vous")) == 0
                    || substr_compare($key,"Une page",0,strlen("Une page")) == 0
                    || substr_compare($key,"Nous avons",0,strlen("Nous avons")) == 0
                    || substr_compare($key,"S'il",0,strlen("S'il")) == 0
                    ){
                    $fields_to_remove[] = $key;
                }
            }
        }
        return (count($fields_to_remove) >0) ?['fields-to-remove' => $fields_to_remove] : [];
    }
}
