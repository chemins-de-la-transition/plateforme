<?php
if (!defined("WIKINI_VERSION")) {
    die("acc&egrave;s direct interdit");
}

/**
* Remplacement du javascript par défaut
**/

if ($this->UserIsAdmin()){
    $GLOBALS['js'] = str_replace('/tools/bazar/presentation/javascripts/form-edit-template.js"></script>', '?' . $this->config['root_page'] . '/formEditTemplateCdlt"></script>', $GLOBALS['js']);
}