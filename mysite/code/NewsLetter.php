<?php
/**
 * Defines the HomePage page type
 */
 
class NewsLetter extends Page {
	private static $db = array(
		'MainHeader' => 'Text',
		'MainStoryLink' => 'Text',
		'FeatureTitle' => 'Text',
		'FeatureStory' => 'HTMLText',
	);
	private static $has_one = array(
		'FeatureImage' => 'Image',
	);
   	private static $has_many = array (
		"Features" => "NewsLetterFeature",
	);
   
   function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab("Root.Main","Content");
		$fields->addFieldToTab('Root.Main', new TextField('MainHeader','Main Story Title'));
		$fields->addFieldToTab('Root.Main', new TextField('MainStoryLink','Main Story URL'));
		$fields->addFieldToTab('Root.Main', new HTMLEditorField('Content','Text for the main story.'));
		//$fields->addFieldToTab('Root.Main', new TextField('ImageCaption','ImageCaption'));
		$fields->addFieldToTab('Root.Main', new UploadField('FeatureImage', 'Main Image size should be 580w x 300t pixels'));
		
		
		/*
    	$fields->addFieldToTab("Root.Features", new DataObjectManager(
			$this,
			'NewsLetterFeature',
			'NewsLetterFeature',
			array('Title' => 'Title'),
			'getCMSFields_forPopup'
		));
		*/
		
		$gridFieldConfig = GridFieldConfig_RelationEditor::create();
		
		$gridField = new GridField('Features', 'Features', $this->Features(), $gridFieldConfig);
		$fields->addFieldToTab("Root.Main", $gridField);
		
		return $fields;
	}
}
class NewsLetter_Controller extends Page_Controller {
	public function init() {
		parent::init();	
	}
}
?>