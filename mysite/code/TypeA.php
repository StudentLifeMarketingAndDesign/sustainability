<?php
/**
 * Defines the HomePage page type
 */
 
class TypeA extends Page {
   private static $db = array(


  
);
   private static $has_one = array(
   

 
   );
   
   function getCMSFields() {
   $fields = parent::getCMSFields();


	

    	

   return $fields;
}
}
 
class TypeA_Controller extends Page_Controller {
	
}
?>