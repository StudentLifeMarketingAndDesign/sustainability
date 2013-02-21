<?php

class GoalItemPage extends Page {
	
	public static $db = array(
		'Description' => 'HTMLText',
		'FY05' => 'Text',
		'FY06' => 'Text',
		'FY07' => 'Text',
		'FY08' => 'Text',
		'FY09' => 'Text'
	);
	
	public static $has_one = array(
		'GraphImage' => 'Image',
		'SupplementalImage' => 'Image'
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab("Root.Main","Content");
		$fields->removeFieldFromTab("Root.Main","FeaturedOnParent");
		$fields->addFieldToTab('Root.Main', new TextField('FY05'));
		$fields->addFieldToTab('Root.Main', new TextField('FY06'));
		$fields->addFieldToTab('Root.Main', new TextField('FY07'));
		$fields->addFieldToTab('Root.Main', new TextField('FY08'));
		$fields->addFieldToTab('Root.Main', new TextField('FY09'));
		$fields->addFieldToTab('Root.Main', new HTMLEditorField('Description'));
		$fields->addFieldToTab('Root.Images', new UploadField('GraphImage', 'Graph / Chart Image'));
		$fields->addFieldToTab('Root.Images', new UploadField('SupplementalImage', 'Supplemental Image'));
		return $fields;
   }
}

class GoalItemPage_Controller extends Page_Controller {
	public function init() {
		parent::init();
	}
	
}
?>