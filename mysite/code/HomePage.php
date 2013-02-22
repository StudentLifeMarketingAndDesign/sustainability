<?php
/**
 * Defines the HomePage page type
 */
 
class HomePage extends Page {
	static $db = array(
	//'FeatureImage' => 'Image',
	'FeatureText' => 'HTMLText',
	'WhatYouCanDo' => 'HTMLText',
	'WhatYouCanDo2' => 'HTMLText',
	'WhatYouCanDoLabel' => 'Text',
	'WhatYouCanDoLabelRight' => 'Text',
	);
	
	static $has_one = array(
	'FeatureImage' => 'Image',
	);
   
   function getCMSFields() {
   
	  $fields = parent::getCMSFields();
	   
	  $fields->removeFieldFromTab("Root.Main","Content");
	   
	  $fields->addFieldToTab("Root.Main", new UploadField('FeatureImage', 'Feature Image'));
	  $fields->addFieldToTab("Root.Main", new HTMLEditorField('FeatureText', 'Feature Text'));
	  $fields->addFieldToTab("Root.Main", new TextField('WhatYouCanDoLabel', 'What You Can Do Label'));
	  $fields->addFieldToTab("Root.Main", new HTMLEditorField('WhatYouCanDo', 'What You Can Do'));
	  $fields->addFieldToTab("Root.Main", new TextField('WhatYouCanDoLabelRight', 'What You Can Do Label (Right Column)'));
	  $fields->addFieldToTab("Root.Main", new HTMLEditorField('WhatYouCanDo2', 'What You Can Do (Right Column)'));

	  return $fields;
   }
}
 
class HomePage_Controller extends Page_Controller {
	
		public function init() {
			parent::init();
			RSSFeed::linkToFeed($this->Link() . "rss", "RSS feed");
	}
	
	
		function rss() {
			$set = DataObject::get("NewsItem");
			
			$rss = new RSSFeed($set, $this->Link(), "Events News Feed", "Shows a list of the most recently updated news and events.", "Title", "Content", "Author");
			$rss->outputToBrowser();
	}	

}
?>