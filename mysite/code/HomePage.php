<?php
/**
 * Defines the HomePage page type
 */
 
class HomePage extends Page {
	static $db = array(
	);
	static $has_one = array(
	);
   
   function getCMSFields() {
   $fields = parent::getCMSFields();
   $fields->removeFieldFromTab("Root.Content.Main","Content");
   
   return $fields;
   }
}
 
class HomePage_Controller extends RSSBlogPostsPage_Controller {
	
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