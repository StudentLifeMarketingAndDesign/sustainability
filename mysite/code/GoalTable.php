<?php

class GoalTable extends Page {
	
	public static $db = array(
		'Metric' => 'Text'
	);
	
	public static $has_one = array(
	);
	
	public static $allowed_children = array("GoalItemPage"
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab("Root.Content.Main","Content");
		//$fields->addFieldToTab('Root.Content.Main', new TextField('Metric'));
		return $fields;
   }
}

class GoalTable_Controller extends Page_Controller {
	public function init() {
		parent::init();
	}
	
}
?>