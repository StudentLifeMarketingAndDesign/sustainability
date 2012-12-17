<?php

class NewsEventsHolder extends Page {
	
	public static $db = array(
	
	  'TypeCCaption' => 'Text',
	);
	
	public static $has_one = array(
	 'TypeCImage' => 'Image'
	);


	
	
function getCMSFields() {
	$fields = parent::getCMSFields();
	
	$fields->addFieldToTab('Root.Content.Images', new TextField('TypeCCaption','ImageCaption'));
	$fields->addFieldToTab('Root.Content.Images', new ImageField('TypeCImage', 'HeaderImage size should be 695x180 pixels'));
	
    return $fields;
	
   }	
	
}

class NewsEventsHolder_Controller extends Page_Controller {
	
		public function init() {
			parent::init();
			RSSFeed::linkToFeed($this->Link() . "rss", "RSS feed");
	}
	
	
		function rss() {
			$set = DataObject::get("EventsPage");
			
			$rss = new RSSFeed($set, $this->Link(), "Events Feed", "Shows a list of the most recently updated news and events.", "Title", "Content", "Author");
			$rss->outputToBrowser();
	}	
	
		function allEvents() {
	if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1) $_GET['start'] = 0;
		$SQL_start = (int)$_GET['start'];
		$items = DataObject::get(
		$callerClass = "EventsPage",
		$filter = "ShowInMenus = '1' and ParentID = '27' and Expiry > NOW()",
		$sort = "EventDate",
		$join = "",
		$limit = "{$SQL_start},6"
  	);
 
  	 return $items ? $items : false;
}

	
		

	
	
}

?>