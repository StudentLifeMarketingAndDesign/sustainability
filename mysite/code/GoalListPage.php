<?php

class GoalListPage extends Page {
	
	public static $db = array(
	);
	
	public static $has_one = array(
	);
	
	public static $allowed_children = array("GoalPage"
	);
	
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab("Root.Content.Main","Content");
		#$fields->removeFieldFromTab("Root.Content.Main","FeaturedOnParent");
		#$fields->addFieldToTab('Root.Content.Main', new HTMLEditorField('Description'));
		return $fields;
   }
}

class GoalListPage_Controller extends Page_Controller {
	public function init() {
		parent::init();
	}
	
	function index() {
		//$myaction = Director::urlParam('show');
        //var_dump($myaction);
		if (isset($_GET['show'])) {
			if ($_GET['show'] == 'all') {
				return $this->renderWith(array("GoalListSimple","GoalListPage"));
				//var_dump($_GET['show']);
				//return Array();
			} else {
				return Array();
			}
		} else {
			return Array();
		}
		/*if($myaction = "all") {
            return $this->renderWith("GoalListSimple");
        } else {
			return $this->renderWith("GoalListPage");
			//return Array();// execution as usual in this case...
        }*/
		return Array();
    }
	
}
?>