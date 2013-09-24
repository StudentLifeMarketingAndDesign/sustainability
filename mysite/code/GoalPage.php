<?php

class GoalPage extends Page {
	
	private static $db = array(
		'LongName' => 'Text',
		'ImageCaption' => 'Text',
		'Description' => 'HTMLText'
	);
	
	private static $has_one = array(
		'HeaderImage' => 'Image'
	);
	
	private static $allowed_children = array("GoalTable"
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab("Root.Main","Content");
		#$fields->removeFieldFromTab("Root.Main","FeaturedOnParent");
		$fields->addFieldToTab('Root.Images', new TextField('ImageCaption','ImageCaption'));
		$fields->addFieldToTab('Root.Images', new UploadField('HeaderImage', 'Header Image size should be 316x222 pixels'));
		$fields->addFieldToTab('Root.Main', new TextField('LongName'));
		$fields->addFieldToTab('Root.Main', new HTMLEditorField('Description'));
		return $fields;
   }
}

class GoalPage_Controller extends Page_Controller {
	public function init() {
		parent::init();
	}
	
}
?>