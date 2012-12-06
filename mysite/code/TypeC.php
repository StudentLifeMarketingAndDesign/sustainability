<?php
/**
 * Defines the HomePage page type
 */
 
class TypeC extends Page {
 static $db = array(

  'TypeCCaption' => 'Text',
  
);
   static $has_one = array(
   
'TypeCImage' => 'Image'
 
   );
   
   function getCMSFields() {
   $fields = parent::getCMSFields();


	
$fields->addFieldToTab('Root.Content.Images', new TextField('TypeCCaption','ImageCaption'));
	$fields->addFieldToTab('Root.Content.Images', new ImageField('TypeCImage', 'Header Image size should be 695x180 pixels'));
	
    	

   return $fields;
}
}
 
class TypeC_Controller extends Page_Controller {
	
}
?>