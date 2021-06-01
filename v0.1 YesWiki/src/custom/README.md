# CustomSendMailField

## Aim

Be able to change the sendmail field for each entry.

## Files

/fields/CustomSendMailField.php
/lang/custom_fr.inc.php
/templates/custom/inputs/customSendMailRadio.twig
/templates/custom/inputs/customSendMailSelect.twig

## Use

In a form use a custom field

`customsendmail***name***label***linkedlabel***ASK FOR CURRENT SAVE***DEFAULT***NOT USED***LABEL FOR OPTION***FIELD_SEARCHABLE***FIELD_HINT***FIELD_READ_ACCESS***FIELD_WRITE_ACCESS***NOT USED***FIELD_SEMANTIC_PREDICATE`

where
`label` could be `Would you receive an e-mail on this adress at each change of this entry ?`
`linkedlabel` is the label of the email field which is controlled by this option. It is possible to define several labels separated by a coma.
`ASK FOR CURRENT SAVE` if is `yes` then ask if an e-mail shold be sent this time, whereas don't ask.
`DEFAULT` values are 'empty', `no` and `yes`.
`LABEL FOR OPTION` define the label for option for current value.

The value of the `linkedlabel` is supossed to be correct. Only empty string is tested.

# ArchiveAction

## Aim

Be able to archive pages/forms/entries/sql/website by downloading a zip file.

## Files

/actions/ArchiveAction.php
/lang/custom_fr.inc.php
/templates/custom/archive.twig.twig

## Use

In a page write `{{archive}}`.
All others parameters are asked by forms.

**Before using**, you need to define a parameter in wakka.congig.php with a table with authorized usernames.
Example of wakka.config.php
```
	...,
	'archive_authotized_users' => ['WikiAdmin','user1`],
	...,
```

To get data with curl call :
`https://yoursite.ext/?APageWithArchiveAction
with parameter in GET or POST : 
 - `export` with value `pages`,`forms`, `entries` (and soon `sql` or `site`)
with parameter in POST : 
 - `password_confirm` with md5 of password of the current user
with COOKIES containing :
 - `name` with name of the user
 - `password` with password of the user in md5
 
you will receive a zip file.
in case of error, it is return an html page with header and footer rendered and an alert message.


# Admintagcdlt

## Aim

Be able to use admintag for not admin users

## Files

/actions/admintagcdlt.php

## Use

In a page write `{{admintagcdlt}}`.
ADfine the ACL with `{{editactionsacls}}`

# formEditTemplateCdlt handler

## Aim

Dynamically update form-edit-template.js with custom options for read and write field's acl.

## Files

/actions/bazar__.php
/handlers/formEditTemplateCdlt.php

## Use

Nothing to do, it is automaticcaly when modifying a form.


# Bazarlistm18cdltAction

## Aim

Be able to filter entries with date lower than 18 years;

## Files

/actions/Bazarlistm18cdltAction.php

## Use

`{{Bazarlistm18cdlt datefield="NAME OF FIELD" displayIfNoDate="true"...}}` le reste comme BazarListeAction, `displayIfNoDate="true"` est optionnel.


# BazarUserPageCDLTAction

## Aim

Retrocompatibility with previous custom action. 
Add a title for bazarliste configured to display only owner entries.

## Files

/actions/BazarUserPageCDLTAction.php

## Use

`{{BazarUserPageCDLT titre="LE TITRE" ...}}` le reste comme BazarListeAction.

# CustomSendMailField

## Aim

Define a custom send mail option in an entry.

## Files

/fields/CustomSendMailField.php
/templates/custom/inputs/customSendMailRadio.twig
/templates/custom/inputs/customSendMailSelect.twig

## Use

In a form, use custom field with this code.

`customsendmail***custombfmail***Envoyer un message à cette adresse aux prochaines modifications de cette fiche ?***bf_mail***yes***no*** ***Envoyer un message cette fois ?*** *** *** ***% @moderateurs***% @moderateurs*** *** ***`

0 : customsendmail
1 : name (ex:'custombfmail')
2 : label (ex:'Envoyer un message à cette adresse aux prochaines modifications de cette fiche ?')
3 : associated field (ex:'bf_mail')
4 : FIELD_ASK_FOR_CURRENT_SAVE (yes = ask to send or not an email at the save whereas is the option sendmail ; no = do not ask, follow sendmail option)
5 : default (yes or no)
6 : not used
7 : FIELD_LABEL_FOR_OPTION only displayed when editing entry and FIELD_ASK_FOR_CURRENT_SAVE = yes (ex: Envoyer un message cette fois ?)
8 : required (ex: “empty”, or 0 or 1)
9 : searchable
10: hint
11: readAccess (ex: % @moderateurs)
12: writeAcces (ex: % @moderateurs)
13: not used
14: semantic predicate


# LinkficheField

## Aim

Display a link to the current entry (usefull in bazarcarto)

## Files

/fields/LinkficheField.php
/templates/custom/fields/link.twig

## Use

In a form, use custom field with this code.

`linkfiche***vide***vide*** *** *** *** *** *** *** *** *** *** *** *** ***`