<?php
/**
 * Defines the Minisite page type
 */
class HomepageInitiative extends DataObject {
	static $defaults = array(
  		
	);
	
   static $db = array(
   		'Label' => 'Text',
		'Link' => 'Text'
   );
   
    public static $plural_name = "Homepage Initiatives";
   
	static $has_one = array(
	'Homepage' => 'HomePage'
	);
	
	public static $summary_fields = array('Label', 'Link');
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		
		$fields->removeByName("HomepageID");
		return $fields;
	}
   
}
 

?>