<?php
/**
 * Defines the HomePage page type
 */
 
class LivingSpacePage extends InteriorPage {
 static $db = array();


	
  

   static $has_one = array(
   

 
   );
   
   function getCMSFields() {
	   $fields = parent::getCMSFields();
	   
	
	   return $fields;
   }
}
 
class LivingSpacePage_Controller extends Page_Controller {
	
	
}
?>