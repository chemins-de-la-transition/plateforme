<?php

use YesWiki\Core\YesWikiAction;

class BazarPostAction extends YesWikiAction
{
    public function formatArguments($arg)
    {
        $activated = (($arg['calledBy'] ?? null) == 'bazar__');
        if ($activated){
            return [
                'vue' => $_GET[BazarAction::VARIABLE_VOIR] ?? $arg[BazarAction::VARIABLE_VOIR] ?? BazarAction::VOIR_DEFAUT ,
                'action' => $_GET[BazarAction::VARIABLE_ACTION] ?? $arg[BazarAction::VARIABLE_ACTION] ?? null ,
                'id' =>  explode(',',$_REQUEST['id_typeannonce'] ?? $arg['id'] ?? $arg['idtypeannonce'] ?? $_GET['id'] ?? null)[0] ?? null ,
                'activated' => $activated,
            ];
        }
        return ['activated' => $activated];
    }
    public function run()
    {
        
        if ($this->wiki->UserIsAdmin()){
            $pattern = '/(?<=\/)(tools\/bazar\/presentation\/javascripts\/form-edit-template\.js(?:\?v=[0-9-]*)?)(?="><\/script>)/';
            $replacement = '?' . $this->wiki->config['root_page'] . '/formEditTemplateCdlt';
            $GLOBALS['js'] = preg_replace($pattern,$replacement,$GLOBALS['js']);
        }

        if (!$this->arguments['activated']){
            return null;
        }

        if (    in_array($this->arguments['vue'],[BazarAction::VOIR_SAISIR,BazarAction::VOIR_FORMULAIRE]) 
                && $this->arguments['id'] == 5
                && in_array($this->arguments['action'],[BazarAction::ACTION_ENTRY_CREATE,BazarAction::ACTION_ENTRY_EDIT,null])){
            $pattern = '/(?<=\/)(tools\/bazar\/libs\/bazar\.js(?:\?v=[0-9-]*)?)(?="><\/script>)/';
            $replacement = '?' . $this->wiki->config['root_page'] . '/bazarForCdlT';
            $GLOBALS['js'] = preg_replace($pattern,$replacement,$GLOBALS['js']);
        }
    }
}
