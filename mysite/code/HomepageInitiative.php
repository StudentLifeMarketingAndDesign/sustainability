<?php
/**
 * Defines the Minisite page type
 */
class HomepageInitiative extends DataObject {
	private static $defaults = array(
  		
	);
	
    private static $db = array(
   		'Label' => 'Text',
		'Link' => 'Text'
   );
   
    public static $plural_name = "Homepage Initiatives";
   
	private static $has_one = array(
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