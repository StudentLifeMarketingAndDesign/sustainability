<?php

class NewsHolder extends Page {
	
	public static $db = array(
	
	);
	
	public static $has_one = array(
	);

static $allowed_children = array('NewsPage');
	
	
function getCMSFields() {
	$fields = parent::getCMSFields();
	
	$fields->removeFieldFromTab("Root.Main","Content");
	
    return $fields;
	
   }	
	
}

class NewsHolder_Controller extends Page_Controller {
	
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
	

 
  return $paginatedSet ? $paginatedSet : false;
  
  
}



	
	
}

?>