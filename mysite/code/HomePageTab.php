<?php
/**
 * Defines the Minisite page type
 */
class HomePageTab extends Page {
	static $defaults = array(
  		
	);
	
   static $db = array(
		'HomeLink' => 'Text'
   );
   
   
   
	static $has_one = array(
	'FeatureImage' => 'SizedImage'
	);
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Content.Images', new ImageField('FeatureImage', 'Feature Box Image 486 x 323'));
		$fields->addFieldToTab('Root.Content.Main', new TextField('HomeLink', 'External Link'));
		#$fields->addFieldToTab('Root.Content.Main', new TextField('ExLink', 'External Link'));
		return $fields;
	}
   
}
 
class HomePageTab_Controller extends Page_Controller {

function init() {
		parent::init();
		
		
	
	}
 
}
class SizedImage extends Image {
	function generateNiceImage($gd) {
		$gd->SetQuality(90);
		return $gd->croppedResize(495,335);
	}
}
?>