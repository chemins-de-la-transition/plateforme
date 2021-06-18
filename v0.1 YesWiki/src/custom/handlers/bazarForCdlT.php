<?php

if (!defined("WIKINI_VERSION")) {
    die("acc&egrave;s direct interdit");
}

// Lit une page web dans un tableau.
$file = file_get_contents(__DIR__ . '/../../tools/bazar/libs/bazar.js');

$newstr = "// zone personnalisée pour le formulaire 5
    // en phase de validation ?
    let validationCheckBox = $('#formulaire input[type=checkbox][name=accept_condition]');
    let estEnValidation = (validationCheckBox && validationCheckBox.length != 0) ? true : false;

    if (!estEnValidation){
        // modérateur ?
        let testModerateur = $('#formulaire #balise-de-test-moderation #text_test_moderateur') ;
        let estModerateur = (testModerateur && testModerateur.length != 0) ? true : false;
    
        // affichable ?
        let inputModeration = $('#formulaire input[type=radio][name=radioListeModerationbf_moderation]:checked') ;
        let estAffichable = (inputModeration && $(inputModeration).val() == \"affichable\") ? true : false;

        // erreur ?
        let ilYAErreur = (atleastonefieldnotvalid === true
            || atleastonemailfieldnotvalid === true
            || atleastoneurlfieldnotvalid === true
            || atleastoneradiofieldnotvalid=== true
            || atleastonecheckboxfieldnotvalid === true
            || atleastonetagfieldnotvalid === true
            ) ? true : false;

        var miniTestsRequired = false ; 
        if ( estModerateur && estAffichable && ilYAErreur) {
            let response = confirm(\"Certains champs sont nécessaires pour afficher cette fiche.\\n\"+
                \"Voulez-vous la sauvegarder telle quelle mais la rendre non-affichable ?\");
            if (response == true){
                $('#formulaire input[type=radio][name=radioListeModerationbf_moderation][value=a_moderer]').click();
                miniTestsRequired = true ;
            }
        } else if (!estAffichable && ilYAErreur) {
            miniTestsRequired = true ;
        }

        if (miniTestsRequired) {
            let bfTitre = $('#formulaire input[name=bf_titre]').val();
            let bfMail = $('#formulaire input[name=bf_mail]').val();
            if (bfTitre && bfTitre.length > 0 && bfMail && bfMail.length > 0) {
                return true ;
            }
        }
    }
\n    ";

$anchor = '/(\s*)(?=\/\/ affichage des erreurs de validation\s*'.
    'if \(atleastonefieldnotvalid === true\) \{)/';
$file = preg_replace($anchor,'$1'.$newstr,$file,1) ;

header('Content-Type: text/javascript');
echo $file ;