<?php

class Page extends SiteTree {
	
	public static $db = array(
		'FeaturedOnParent' => 'Boolean'
	);
	
	public static $has_one = array(
	);
	

	function getCMSFields() {
		$fields = parent::getCMSFields();
   		if ($this->getParent()){
			if(($this->getParent()->ClassName) == "TypeA"){
				$fields->removeFieldFromTab('Root.Content.Main', 'Content');
				$fields->addFieldToTab('Root.Content.Main', new CheckboxField('FeaturedOnParent', 'Is this featured on the page \''.$this->getParent()->MenuTitle.'\'?'));
				$fields->addFieldToTab('Root.Content.Main', new HTMLEditorField('Content', 'Content'));
			}
			
		}return $fields;
	}
	
	  /*
   * limits words to a number, but tries to validate the code
   */
   public function getSummaryHTML ($limit = 40){
      $m = 0;
      $addEplisis = '';
      $returnstr = '';
      $returnArray = array();
      $html = array();
      $chars = preg_split('/(<[^>]*[^\/]>| )/i', $this->Content, -1, PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE);
      foreach ($chars as $elemnt) {
         // found start tag
         if(preg_match('/^<(p|h1|h2|h3|h4|h5|h6|q|b|i|strong|em)(.*)>$/', $elemnt)){
            preg_match('/^<(p|h1|h2|h3|h4|h5|h6|q|b|i|strong|em)(.*)>$/', $elemnt, $matches);
            array_push($html, $matches[1]);// convert <p class=""> to p
            array_push($returnArray, $elemnt);
            // found end tag
         } else if(preg_match('/^<\/(p|h1|h2|h3|h4|h5|h6|q|b|i|strong|em)(.*)>$/', $elemnt)){
            preg_match('/^<\/(p|h1|h2|h3|h4|h5|h6|q|b|i|strong|em)(.*)>$/', $elemnt, $matches);
            $testelement = array_pop ($html);
            // match (ie: <p>etc</p>)
            if($testelement==$elemnt[1]) array_pop($html);
            array_push($returnArray, $elemnt);
         } else {
            // done
            if($elemnt == ' ') continue;
            array_push($returnArray, $elemnt);
            $m++;
            if($m > $limit) {
               $addEplisis = '&hellip;';
               break;
            }
         }
      }
      // convert start tags to end tags
      $tmpr = '';
      foreach ($html as $elemnt) {
         $tmpr.='</'.$elemnt.'>';
      }
      return implode($returnArray, ' ') . $addEplisis . $tmpr;
   }
	
}

class Page_Controller extends ContentController {
	
	public function init() {
		parent::init();

		// Note: you should use SS template require tags inside your templates
		// instead of putting Requirements calls here.  However these are
		// included so that our older themes still work
		

	}
	
			function Home($limit=4) {
		$set = DataObject::get("HomePageTab", null, null, null, $limit);
		
		return $set;
	}
	
	function Events($limit=3) {
       //$items = DataObject::get("EventsPage", "Expiry > NOW()", "EventDate", null, $limit);
       $items = DataObject::get("EventsPage", 'EventDate > NOW()', 'EventDate', null, $limit);
		
		return $items ? $items : false;
	}
	
	function News($limit=3) {
		$set = DataObject::get("NewsPage", null, null, null, $limit);
		
		return $set;
	}
	
	function EventNews($limit=8){
		$items = DataObject::get("EventsPage", null, null, null, $limit);
		$set = DataObject::get("NewsPage", null, null, null, $limit);
		$newarray = new DataObjectSet();
		$newarray->merge($items);
		$newarray->merge($set);
		Debug::show($newarray);
		return $newarray;
		
	}
	
	
		function Siblings() {/* Control structure that allows us to grab a list of 
	"sibling" pages and display them in a template */
		if($this->ParentID){
			$whereStatement = "ParentID = ".$this->ParentID." and ShowInMenus = 1";
			return DataObject::get("InteriorPage", $whereStatement);
		}else{
			return false;
		}
 	}
	
	
	/**
	 * Site search form 
	 */ 
	function SearchForm() {
		$searchText = isset($_REQUEST['Search']) ? $_REQUEST['Search'] : 'Search';
		$fields = new FieldSet(
	      	new TextField("Search", "", $searchText)
	  	);
		$actions = new FieldSet(
	      	new FormAction('results', 'Search')
	  	);

	  	return new SearchForm($this, "SearchForm", $fields, $actions);
	}
	
	/**
	 * Process and render search results
	 */
	function results($data, $form){
	  	$data = array(
	     	'Results' => $form->getResults(),
	     	'Query' => $form->getSearchQuery(),
	      	'Title' => 'Search Results'
	  	);

	  	return $this->customise($data)->renderWith(array('Page_results', 'Page'));
	}
	/*
	function RSSFeedImport($numItems) {
			
		$feedURL= "feed://sustainability.uiowa.edu/blog/?feed=rss2";
	  $output = new ArrayList();
	  
	  include_once(Director::getAbsFile(FRAMEWORK_DIR . '/thirdparty/simplepie/simplepie.inc'));
	  
	  $t1 = microtime(true);


	  $feed = new SimplePie($feedURL, TEMP_FOLDER);
	  $feed->init();
	  if($items = $feed->get_items(0, $numItems)) {
		 foreach($items as $item) {
			
			// Cast the Date
			$date = new Date('Date');
			$date->setValue($item->get_date());
	
			// Cast the Title
			$title = new Text('Title');
			$title->setValue($item->get_title());
			
			// Cast the description and strip
			$desc = new Text('Description');
			$desc->setValue(strip_tags($item->get_description()));
	
			$output->push(new ArrayData(array(
			   'Title'         => $title,
			   'Date'         => $date,
			   'Link'         => $item->get_link(),
			   'Description'   => $desc
			)));
		 }
		 

		 return $output;
	  }
	  
}*/
	
}

?>