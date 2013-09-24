<?php
class Earthday extends Page {

	private static $db = array(
		'EventName' => 'Text',
		'EventSubheading' => 'Text',
		'EventDate' => 'Text',
		'EventType' => 'Text',
		'TopFeature' => 'HTMLText',
		'LeftColumn' => 'HTMLText',	
		'RightColumn' => 'HTMLText'
	);

	private static $has_one = array(
			'EventImage' => 'Image'
	);
	
		function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab("Root.Main", new TextField('EventName'));
		$fields->addFieldToTab("Root.Main", new TextField('EventSubheading'));

		$fields->addFieldToTab("Root.Main", new TextField('EventDate'));
		$fields->addFieldToTab("Root.Main", new TextField('EventType'));
		$fields->addFieldToTab("Root.Main", new HTMLEditorField('TopFeature'));
		
		$fields->removeFieldFromTab("Root.Main","Content");
		$fields->addFieldToTab("Root.Main", new UploadField('EventImage'));
		return $fields;
	}
	
	public static $allowed_children = array ("EarthdayEvent");


}
class Earthday_Controller extends Page_Controller {
	
	public function EarthdayEvents(){
	
	
		 if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1) $_GET['start'] = 0;
		 $SQL_start = (int)$_GET['start'];
		
		 
		//$events = DataObject::get("EarthdayEvent", null, null, null, $limit = 5);
		$events = DataObject::get("EarthdayEvent", "Date > NOW() OR Date IS NULL", "Sort ASC", null, $limit = "{$SQL_start},5");
	
		
		
		
		//return DataObject::get("EpisodePage", "ParentID = $this->ID", "Airdate DESC", Null, Null);
		return $events;
	}

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	private static $allowed_actions = array (
	);

	public function init() {
		parent::init();

		// Note: you should use SS template require tags inside your templates 
		// instead of putting Requirements calls here.  However these are 
		// included so that our older themes still work

	}
}