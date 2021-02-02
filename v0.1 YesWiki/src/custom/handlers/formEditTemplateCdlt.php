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
$file = file_get_contents(__DIR__ . '/../../tools/bazar/presentation/javascripts/form-edit-template.js');
$new_str  = '';
if ($this->userIsAdmin()) {
  $groupsNames = $this->GetGroupsList() ;
  foreach($groupsNames as $groupName) {
    if ($groupName != 'admins') {
        $new_str .= '  "@' . $groupName . '": "Membre du groupe ' . $groupName . '",'."\n";
        $new_str .= '  "% @' . $groupName . '": "Membre du groupe ' . $groupName . ', propriétaire et admins",'."\n";
    }
  }
  foreach($groupsNames as $groupName) {
    if ($groupName != 'admins') {
        $new_str .= '  "!@' . $groupName . '": "Non membre du groupe ' . $groupName . '",'."\n";
    }
  }
} 

header('Content-Type: text/javascript');
// Remplace les valeurs locales
$anchor_base_str = '"@admins": "Membre du groupe admin",';

$anchor_str = $anchor_base_str."\n"; 
$file = str_replace($anchor_str,$anchor_str.$new_str,$file) ;
$anchor_str = $anchor_base_str."\r\n"; 
$file = str_replace($anchor_str,$anchor_str.$new_str,$file) ;
// if no coma
$anchor_base_str = '"@admins": "Membre du groupe admin"';
$new_str = ',' . $new_str ;
$anchor_str = $anchor_base_str."\n"; 
$file = str_replace($anchor_str,$anchor_str.$new_str,$file) ;
$anchor_str = $anchor_base_str."\r\n"; 
$file = str_replace($anchor_str,$anchor_str.$new_str,$file) ;
// keywords and query mapping
$anchor_str  = '  12: "write",'."\n";
$anchor_str .= '  14: "semantic",'."\n";
$new_str  = '  12: "write",'."\n";
$new_str .= '  13: "keywords",'."\n";
$new_str .= '  14: "semantic",'."\n";
$new_str .= '  15: "queries",'."\n";
$file = str_replace($anchor_str,$new_str,$file) ;
// with \r\n
$anchor_str = str_replace("\n","\r\n",$anchor_str) ;
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
// with \r\n
$anchor_str = str_replace("\n","\r\n",$anchor_str) ;
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
// with \r\n
$anchor_str = str_replace("\n","\r\n",$anchor_str) ;
$file = str_replace($anchor_str,$anchor_str.$new_str,$file) ;
echo $file ;

