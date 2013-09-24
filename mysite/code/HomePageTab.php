<?php
/**
 * Defines the Minisite page type
 */
class HomePageTab extends Page {
	private static $defaults = array(
  		
	);
	
    private static $db = array(
		'HomeLink' => 'Text'
   );
   
   
   
	private static $has_one = array(
	'FeatureImage' => 'SizedImage'
	);
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab('Root.Images', new UploadField('FeatureImage', 'Feature Box Image 495 x 335'));
		$fields->addFieldToTab('Root.Main', new TextField('HomeLink', 'External Link'));
		#$fields->addFieldToTab('Root.Main', new TextField('ExLink', 'External Link'));
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
		return $gd->croppedResize(900,360);
	}
}
?>