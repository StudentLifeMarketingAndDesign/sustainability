<?php
/**
 * Defines the HomePage page type
 */
 
class SlideshowPage extends Page {
 static $db = array(



	'FlickrUsername' => 'Text',
	'FlickrSetnumber' => 'Text',
	
  
);
   static $has_one = array(
   

 
   );
   
   function getCMSFields() {
   $fields = parent::getCMSFields();
   

	$fields->addFieldToTab('Root.Flickr', new TextField('FlickrUsername', 'Flickr username - yours is sustainabilityuiowa'));
	$fields->addFieldToTab('Root.Flickr', new TextField('FlickrSetnumber', 'Flickr set number - the number at the end of this url http://www.flickr.com/photos/sustainabilityuiowa/sets/72157624326037025/'));
	

    	

   return $fields;
}
}
 
class SlideshowPage_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		
	}
	
	
}
?>