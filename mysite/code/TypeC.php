<?php
/**
 * Defines the HomePage page type
 */
 
class TypeC extends Page {
   private static $db = array(

  'TypeCCaption' => 'Text',
  
);
   private static $has_one = array(
   
'TypeCImage' => 'Image'
 
   );
   
   function getCMSFields() {
   $fields = parent::getCMSFields();


	
$fields->addFieldToTab('Root.Images', new TextField('TypeCCaption','ImageCaption'));
	$fields->addFieldToTab('Root.Images', new UploadField('TypeCImage', 'Header Image size should be 695x180 pixels'));
	
    	

   return $fields;
}
}
 
class TypeC_Controller extends Page_Controller {
	
}
?>