<?php

class SiteConfigExtension extends DataExtension {

	static $db = array(
		'TwitterLink' => 'Text',
		'FacebookLink' =>'Text',
		'FlickrLink' =>'Text',
		'InstagramLink' =>'Text',
		'PinterestLink' =>'Text'
	);

	static $has_one = array(

	);

	public function updateCMSFields(FieldList $fields){

		$fields->addFieldToTab('Root.Main', new TextField('TwitterLink', 'Twitter Account URL'));
		$fields->addFieldToTab('Root.Main', new TextField('FacebookLink', 'Facebook Account URL'));
		$fields->addFieldToTab('Root.Main', new TextField('FlickrLink', 'Flickr Account URL'));
		$fields->addFieldToTab('Root.Main', new TextField('InstagramLink', 'Instagram Account URL'));
		$fields->addFieldToTab('Root.Main', new TextField('PinterestLink', 'Pinterest Account URL'));

		return $fields;

	}

}
class SiteConfigExtensionPage_Controller extends Page_Controller {

	public function init() {
		parent::init();
	}

}