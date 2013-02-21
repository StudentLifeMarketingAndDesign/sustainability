<?php
class EarthdayEvent extends Page {

	public static $db = array(
		'EventDate' => 'Text',
		'Date' => 'Date',
		'EventType' => 'Text',
		'ExLink' => 'Text',
		'TimeAndLocation' => 'HTMLText'
	);

	public static $has_one = array(
		'EventImage' => 'Image',					
		'ExternalLink' => 'Text'
	);
	
		function getCMSFields() {
		$fields = parent::getCMSFields();
		//$fields->removeByName("Content");
		$fields->addFieldToTab("Root.Main", new TextField('ExLink','Enter the URL of an external page with additional information.'));
		
		$fields->addFieldToTab("Root.Main", new TextField('EventDate','Date to be displayed.'));
		$datefield = new DateField('Date','Date to unpublish this event.');
		$datefield->setConfig('showcalendar', true);
		$fields->addFieldToTab("Root.Main", $datefield);
		$fields->addFieldToTab("Root.Main", new TextField('EventType'));
		$fields->addFieldToTab("Root.Main", new HTMLEditorField('Content','Enter a brief (2-3 sentence) description of the event here.'));
		$fields->addFieldToTab("Root.Main", new HTMLEditorField('TimeAndLocation','Enter time and location information here.'));
		$fields->addFieldToTab("Root.Main", new UploadField('EventImage'));
		
		
		return $fields;
	}


}
class EarthdayEvent_Controller extends Page_Controller {

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
	public static $allowed_actions = array (
	);

	public function init() {
		parent::init();

		// Note: you should use SS template require tags inside your templates 
		// instead of putting Requirements calls here.  However these are 
		// included so that our older themes still work

	}
}