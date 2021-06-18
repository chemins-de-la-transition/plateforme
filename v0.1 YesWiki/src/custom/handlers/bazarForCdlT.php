<?php

if (!defined("WIKINI_VERSION")) {
    die("acc&egrave;s direct interdit");
}

// Lit une page web dans un tableau.
$file = file_get_contents(__DIR__ . '/../../tools/bazar/libs/bazar.js');

$newstr = "// commentaire de test\n    ";
$anchor = '/(\s*)(?=\/\/ affichage des erreurs de validation\s*'.
    'if \(atleastonefieldnotvalid === true\) \{)/';
$file = preg_replace($anchor,'$1'.$newstr,$file,1) ;

header('Content-Type: text/javascript');
echo $file ;