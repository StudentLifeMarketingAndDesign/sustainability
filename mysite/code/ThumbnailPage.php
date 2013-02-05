<?php

class ThumbnailPage extends Page {
	
	
		
	
	public static $db = array(

	"ThumbnailCaption" => "Text",
	'ExternalLink' => 'Text',
	
	
	
	
	);
	
	public static $has_one = array(
	
	   	'ThumbnailImage' => 'Image'
		
	);
	
	
	
function getCMSFields() {
	$fields = parent::getCMSFields();


	$fields->addFieldToTab('Root.Content.Main', new TextField('ExternalLink', 'ExternalLink'));
		$fields->addFieldToTab('Root.Content.Images', new TextField('ThumbnailCaption', 'thumbnail caption '));
	$fields->addFieldToTab('Root.Content.Images', new UploadField('ThumbnailImage', 'Thumbnail Image'));


	
	
	
	
	
    return $fields;
	
   }	
	
}

class ThumbnailPage_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		
	}
	
	
	
}

?>