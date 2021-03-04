# _nav

## Aim

Activate the option "hideifnoaccess" for nav

## Files

/actions/__nav.php

## Use

Add the parameter "hideifnoaccess" in `{{nav hideifnoaccess="true" ...}}`

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
config.yml
/controllers/ArchiveController.php
/lang/custom_fr.inc.php
/handlers/ArchiveDownloadZipHandler.php
/templates/custom/alert-message.twig
/templates/custom/archive.twig.twig
wiki.php

## Use

In a page write `{{archive}}`.
All others parameters are asked by forms.

You can use the handler `/ArchiveDownloadZip` to do the same.

**Before using**, you need to define a parameter in wakka.congig.php with a table with authorized usernames.
Example of wakka.config.php
```
	...,
	'archive_authotized_users' => ['WikiAdmin','user1`],
	...,
```

To get data with curl call :
`https://yoursite.ext/?APage/ArchiveDownloadZip`
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
