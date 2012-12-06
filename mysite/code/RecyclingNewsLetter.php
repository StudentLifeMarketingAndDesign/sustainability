<?php
/**
 * Defines the HomePage page type
 */
 
class RecyclingNewsLetter extends Page {
	static $db = array(
		'MainHeader' => 'Text',
		'MainStoryLink' => 'Text',
		'FeatureTitle' => 'Text',
		'FeatureStory' => 'HTMLText',
	);
	static $has_one = array(
		'FeatureImage' => 'Image',
	);
   	static $has_many = array (
		"Features" => "RecyclingNewsLetterFeature",
	);
   
   function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab("Root.Content.Main","Content");
		$fields->addFieldToTab('Root.Content.Main', new TextField('MainHeader','Main Story Title'));
		$fields->addFieldToTab('Root.Content.Main', new TextField('MainStoryLink','Main Story URL'));
		$fields->addFieldToTab('Root.Content.Main', new HTMLEditorField('Content','Text for the main story.'));
		//$fields->addFieldToTab('Root.Content.Main', new TextField('ImageCaption','ImageCaption'));
		$fields->addFieldToTab('Root.Content.Main', new ImageField('FeatureImage', 'Main Image size should be 580w x 300t pixels'));
    	$fields->addFieldToTab("Root.Content.Features", new DataObjectManager(
			$this,
			'RecyclingNewsLetterFeature',
			'RecyclingNewsLetterFeature',
			array('Title' => 'Title'),
			'getCMSFields_forPopup'
		));
		return $fields;
	}
}
class RecyclingNewsLetter_Controller extends Page_Controller {
	public function init() {
		parent::init();	
	}
}
?>