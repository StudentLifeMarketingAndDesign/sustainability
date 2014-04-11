<?php
global $project;
$project = 'mysite';
global $database;
$database = 'sustainability';
 
// Use _ss_environment.php file for configuration
require_once("conf/ConfigureFromEnv.php");
MySQLDatabase::set_connection_charset('latin1');

SSViewer::set_theme('sustainability');

include("recaptchaKeys.php");
/* Paste as Plain Text By Default */
HtmlEditorConfig::get('cms')->setOption('paste_text_sticky',true);
HtmlEditorConfig::get('cms')->setOption('paste_text_sticky_default',true);

SpamProtectorManager::set_spam_protector('RecaptchaProtector');

?>