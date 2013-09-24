<?php

class EarthDayForm extends UserDefinedForm {
	
	private static $db = array(
	);
	
	private static $has_one = array(
	
	);
	function getCMSFields() {
		$fields = parent::getCMSFields();
		return $fields;
	}
}

class EarthDayForm_Controller extends UserDefinedForm_Controller {
	public function init() {
		parent::init();
		
	}
}

?>