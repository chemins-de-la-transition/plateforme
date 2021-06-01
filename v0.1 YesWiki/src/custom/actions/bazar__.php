<?php
if (!defined("WIKINI_VERSION")) {
    die("acc&egrave;s direct interdit");
}

/**
* Remplacement du javascript par défaut
**/

if ($this->UserIsAdmin()){
    $pattern = '/(?<=\/)(tools\/bazar\/presentation\/javascripts\/form-edit-template\.js(?:\?v=[0-9-]*)?)(?="><\/script>)/';
    $replacement = '?' . $this->config['root_page'] . '/formEditTemplateCdlt';
    $GLOBALS['js'] = preg_replace($pattern,$replacement,$GLOBALS['js']);
}