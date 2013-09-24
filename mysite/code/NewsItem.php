<?php

class NewsItem extends Page {
	
	
		
	
	private static $db = array(
	
	
	
	
	
	);
	
	private static $has_one = array(
	
	
	);
	
	
	
function getCMSFields() {
	$fields = parent::getCMSFields();



	$fields->addFieldToTab('Root.Main', new TextField('NewsLink', 'News Link'));



	
	
	
	
	
    return $fields;
	
   }	
	
}

class NewsItem_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		
	}
	
	
	
}

?>