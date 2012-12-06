<?php

class NewsItem extends Page {
	
	
		
	
	public static $db = array(
	
	
	
	
	
	);
	
	public static $has_one = array(
	
	
	);
	
	
	
function getCMSFields() {
	$fields = parent::getCMSFields();



	$fields->addFieldToTab('Root.Content.Main', new TextField('NewsLink', 'News Link'));



	
	
	
	
	
    return $fields;
	
   }	
	
}

class NewsItem_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		
	}
	
	
	
}

?>