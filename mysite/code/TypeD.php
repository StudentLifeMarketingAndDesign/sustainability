<?php
/**
 * Defines the HomePage page type
 */
 
class TypeD extends Page {
   private static $db = array(

  'ImageCaption' => 'Text',
  
);
   private static $has_one = array(
   
	'HeaderImage' => 'Image'
 
   );
   
   function getCMSFields() {
   $fields = parent::getCMSFields();


		$fields->addFieldToTab('Root.Images', new TextField('ImageCaption','ImageCaption'));
	$fields->addFieldToTab('Root.Images', new UploadField('HeaderImage', 'Header Image size should be 316x222 pixels'));

    	

   return $fields;
}
}
 
class TypeD_Controller extends Page_Controller {
	
}
?>