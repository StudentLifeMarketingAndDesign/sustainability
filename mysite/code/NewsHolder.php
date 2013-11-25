<?php

class NewsHolder extends Page {
	
	private static $db = array(
	
	);
	
	private static $has_one = array(
	);

static $allowed_children = array('NewsPage');
	
	
function getCMSFields() {
	$fields = parent::getCMSFields();
	
	$fields->removeFieldFromTab("Root.Content","Content");
	
    return $fields;
	
   }	
	
}

class NewsHolder_Controller extends Page_Controller {
	private static $allowed_actions = array('rss');

		public function init() {
			parent::init();
			RSSFeed::linkToFeed($this->Link() . "rss", "RSS feed");
	}
	
	
		function rss() {
			$set = DataObject::get("NewsPage");
			
			$rss = new RSSFeed($set, $this->Link(), "News Feed", "Shows a list of the most recently updated news and events.", "Title", "Content", "Author");
			$rss->outputToBrowser();
	}	
	
	
	
	function allNews() {
	if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1) $_GET['start'] = 0;
		$SQL_start = (int)$_GET['start'];
		$doSet = Page::get(
		$callerClass = "NewsPage",
		$filter = "ShowInMenus = '1' and ParentID = '23'",
		$sort = "sort",
		$join = "",
		$limit = "{$SQL_start},6"
		
		
  	);
  	if (isset($doSet)){
  		$paginatedSet = new PaginatedList($doSet, $this->request);
  		$paginatedSet->setPageLength(10);
	}
	
	function newsTest(){
		$items = NewsPage::get();
		return $items;
	}
	

 
  return $paginatedSet ? $paginatedSet : false;
  
  
}



	
	
}

?>