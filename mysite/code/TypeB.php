<?php
/**
 * Defines the HomePage page type
 */
 
class TypeB extends Page {
   private static $db = array(


  
);
   private static $has_one = array(
   

 
   );
   
   function getCMSFields() {
   $fields = parent::getCMSFields();


	

    	

   return $fields;
}
}
 
class TypeB_Controller extends Page_Controller {
	
}
?>