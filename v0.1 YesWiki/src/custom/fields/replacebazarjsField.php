<?php

namespace YesWiki\Custom\Field;

use Psr\Container\ContainerInterface;
use YesWiki\Bazar\Field\BazarField;
use YesWiki\Wiki;

/**
 * @Field({"replacebazarjs"})
 */
class replacebazarjsField extends BazarField
{
    protected function renderStatic($entry)
    {
        return null;
    }
    
    protected function renderInput($entry)
    {
        $pattern = '/(?<=\/)(tools\/bazar\/libs\/bazar\.js(?:\?v=[0-9-]*)?)(?="><\/script>)/';
        $replacement = '?' . $this->getService(Wiki::class)->config['root_page'] . '/bazarForCdlT';
        $GLOBALS['js'] = preg_replace($pattern, $replacement, $GLOBALS['js']);
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
