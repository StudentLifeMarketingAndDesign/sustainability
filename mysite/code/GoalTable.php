<?php

class GoalTable extends Page {
	
	private static $db = array(
		'Metric' => 'Text'
	);
	
	private static $has_one = array(
	);
	
	private static $allowed_children = array("GoalItemPage"
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab("Root.Main","Content");
		//$fields->addFieldToTab('Root.Main', new TextField('Metric'));
		return $fields;
   }
}

class GoalTable_Controller extends Page_Controller {
	public function init() {
		parent::init();
	}
	
}
?>