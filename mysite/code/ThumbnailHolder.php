<?php

class ThumbnailHolder extends Page {
	
	public static $db = array(
	
	);
	
	public static $has_one = array(
	);

static $allowed_children = array('ThumbnailPage');
	
	
function getCMSFields() {
	$fields = parent::getCMSFields();
	

	
    return $fields;
	
   }	
	
}

class ThumbnailHolder_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		
	}
	
	
	
}

?>