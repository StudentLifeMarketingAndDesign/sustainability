<?php
/**
 * Defines the HomePage page type
 */
 
class InteriorPage extends Page {
 static $db = array(
   'ImageCaption' => 'Text',
   	'FlickrUsername' => 'Text',
	'FlickrSetnumber' => 'Text',
	'YouTubeID' => 'Text',



	
  
);
   static $has_one = array(
   
	'HeaderImage' => 'Image',

 
   );
   
   function getCMSFields() {
   $fields = parent::getCMSFields();
   
	$fields->addFieldToTab('Root.Content.Images', new TextField('ImageCaption','ImageCaption'));
	$fields->addFieldToTab('Root.Content.Images', new UploadField('HeaderImage', 'Header Image size should be 316x222 pixels'));
	$fields->addFieldToTab('Root.Content.Flickr', new TextField('FlickrUsername', 'Flickr username - yours is sustainabilityuiowa'));
	$fields->addFieldToTab('Root.Content.Flickr', new TextField('FlickrSetnumber', 'Flickr set number - the number at the end of this url http://www.flickr.com/photos/sustainabilityuiowa/sets/72157624326037025/'));
    $fields->addFieldToTab('Root.Content.Video', new TextField('YouTubeID', 'YouTube ID will embed a video on this page. The ID is at the end of the URL. Example: the last part beginning with q, here: http://www.youtube.com/watch?v=qec8hPzqHBk'));
	

   return $fields;
}
}
 
class InteriorPage_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		
	}
	
	
}
?>