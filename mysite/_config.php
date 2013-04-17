<?php

global $project;
$project = 'mysite';

global $databaseConfig;

/*$databaseConfig = array(
	"type" => "MySQLDatabase",
	"server" => "watson.imu.uiowa.edu", 
	"username" => "mekalekaheineho", 
	"password" => 'g*^J#u$oPZnGh019Zj#@',
	"database" => "sustainability",
);*/


$databaseConfig = array(
	"type" => "MySQLDatabase",
	"server" => "localhost", 
	"username" => "sustain", 
	"password" => 'nimlok54', 
	"database" => "sustainability",
);

// Sites running on the following servers will be
// run in development mode. See
// http://doc.silverstripe.com/doku.php?id=devmode
// for a description of what dev mode does.
Director::set_dev_servers(array(
	'localhost',
	'127.0.0.1',
));

Director::set_environment_type("live");
Object::add_extension("LeftAndMain", "MyLeftAndMainDecorator");

// This line set's the current theme. More themes can be
// downloaded from http://www.silverstripe.com/themes/
SSViewer::set_theme('sustainabilityold');

Mollom::setPublicKey("a80de3eac6cf28fe533df3af0d4ac5a2");
Mollom::setPrivateKey("6d63606b380ef59e554468873dc71af8");

RecaptchaField::$public_api_key = '6Ld21QsAAAAAAOUxtwWidLHScTeTmW_JSvoC4o_O';
RecaptchaField::$private_api_key = '6Ld21QsAAAAAAHoOLaUzhT44CYWvPwNzUZVwW5xB';

SpamProtectorManager::set_spam_protector('RecaptchaProtector');

//SortableDataObject::add_sortable_class('NewsLetterFeature');

Security::setDefaultAdmin("drewmpark@gmail.com", "saussure");

?>
