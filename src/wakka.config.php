<?php
// wakka.config.php cr&eacute;&eacute;e Wed Aug  5 00:29:18 2020
// ne changez pas la yeswiki_version manuellement !

$wakkaConfig = array (
  'wakka_version' => '0.1.1',
  'wikini_version' => '0.5.0',
  'yeswiki_version' => 'doryphore',
  'yeswiki_release' => '2020-05-27-1',
  'debug' => 'no',
  'table_prefix' => 'yeswiki_plateforme_',
  'base_url' => 'https://lescheminsdelatransition.org/plateforme/?',
  'rewrite_mode' => '0',
  'meta_keywords' => 'transition, écologie, écolieux, formation, permaculture, alternatif, parcours, chemin, apprenant',
  'meta_description' => 'Plateforme des chemins de la transition',
  'action_path' => 'actions',
  'handler_path' => 'handlers',
  'header_action' => 'header',
  'footer_action' => 'footer',
  'navigation_links' => 'DerniersChangements :: DerniersCommentaires :: ParametresUtilisateur',
  'referrers_purge_time' => 24,
  'pages_purge_time' => 365,
  'default_write_acl' => '*',
  'default_read_acl' => '*',
  'default_comment_acl' => '@admins',
  'preview_before_save' => 0,
  'allow_raw_html' => '1',
  'disable_wiki_links' => false,
  'timezone' => 'GMT',
  'root_page' => 'AccueiL',
  'wakka_name' => 'Chemins de la transition',
  'template_directories' => 
  array (
    0 => 'custom/templates',
    1 => 'templates',
    2 => 'themes/tools',
  ),
  'formatter_path' => 'formatters',
  'default_language' => 'fr',
  'db_charset' => 'utf8mb4',
  'baz_map_zoom' => '6',
);
?>