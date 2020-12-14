<?php


//error handler function
function customError($errno, $errstr) {
  echo "<b>Error:</b> [$errno] $errstr";
}

//set error handler
set_error_handler("customError");

if (!defined("WIKINI_VERSION")) {
    die("acc&egrave;s direct interdit");
}

// Lit une page web dans un tableau.
$file = file_get_contents('/home/leschemisi/www/plateforme/tools/bazar/presentation/javascripts/form-edit-template.js');

header('Content-Type: text/javascript');
// Remplace les valeurs locales
$anchor_str = '"@admins": "Membre du groupe admin",'."\n"; 
$new_str  ='  "@moderateurs": "Membre du groupe moderateurs",'."\n" ;
$new_str .='  "!@moderateurs": "Non membre du groupe moderateurs",'."\n" ;
$new_str .='  "% @moderateurs": "Membre du groupe moderateurs, propriétaire et admins",'."\n" ;
$new_str .='  "@editeurs": "Membre du groupe éditeurs",'."\n" ;
$new_str .='  "@Lieux": "Membre du groupe Lieux",'."\n";
$file = str_replace($anchor_str,$anchor_str.$new_str,$file) ;
// if no coma
$anchor_str = '"@admins": "Membre du groupe admin"'."\n";
$new_str = ',' . $new_str ;
$file = str_replace($anchor_str,$anchor_str.$new_str,$file) ;
// keywords and query mapping
$anchor_str  = '  12: "write",'."\n";
$anchor_str .= '  14: "semantic",'."\n";
$new_str  = '  12: "write",'."\n";
$new_str .= '  13: "keywords",'."\n";
$new_str .= '  14: "semantic",'."\n";
$new_str .= '  15: "queries",'."\n";
$file = str_replace($anchor_str,$new_str,$file) ;
// resolve trouble for queries
$anchor_str  = '      fillingMode: {'."\n";
$anchor_str .= '        label: "Mode de saisie",'."\n";
$anchor_str .= '        options: {'."\n";
$anchor_str .= '          "": "Normal",'."\n";
$anchor_str .= '          tags: "En Tags",'."\n";
$anchor_str .= '        },'."\n";
$anchor_str .= '      },'."\n";
$new_str  = '      queries: {'."\n";
$new_str .= '        label: "Critères de filtre",'."\n";
$new_str .= '        placeholder: "radioListeOuiNonbf_officiel=oui",'."\n";
$new_str .= '      },'."\n";
$file = str_replace($anchor_str,$anchor_str.$new_str,$file) ;
// new choice
$anchor_str  = '      fillingMode: {'."\n";
$anchor_str .= '        label: "Mode de saisie",'."\n";
$anchor_str .= '        options: {'."\n";
$anchor_str .= '          " ": "Normal",'."\n";
$anchor_str .= '          tags: "En Tags",'."\n";
$anchor_str .= '          dragndrop: "Drag & drop",'."\n";
$anchor_str .= '        },'."\n";
$anchor_str .= '      },'."\n";
$file = str_replace($anchor_str,$anchor_str.$new_str,$file) ;
echo $file ;

