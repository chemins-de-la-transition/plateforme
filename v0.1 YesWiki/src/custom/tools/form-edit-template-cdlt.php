<?php


//error handler function
function customError($errno, $errstr) {
  echo "<b>Error:</b> [$errno] $errstr";
}

//set error handler
set_error_handler("customError");

// Lit une page web dans un tableau.
$file = file_get_contents('/home/leschemisi/www/plateforme/tools/bazar/presentation/javascripts/form-edit-template.js');

echo $file ;

// // Affiche toutes les lignes du tableau comme code HTML, avec les numéros de ligne
// foreach ($lines as $line_num => $line) {
    // echo $line . "\n";
// }
