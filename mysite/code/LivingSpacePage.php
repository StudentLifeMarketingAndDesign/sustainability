<?php
/**
 * Defines the HomePage page type
 */
 
class LivingSpacePage extends InteriorPage {
   private static $db = array();


	
  

   private static $has_one = array(
   

 
   );
   
   function getCMSFields() {
	   $fields = parent::getCMSFields();
	   
	
	   return $fields;
   }
}
 
class LivingSpacePage_Controller extends Page_Controller {
	
	
}
?>