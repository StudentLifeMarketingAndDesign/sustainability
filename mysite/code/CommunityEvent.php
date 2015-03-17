<?php

class CommunityEvent extends CalendarEvent {
	private static $db = array(
		'Location' => 'Text',
		'FirstStartDateTime' => 'SS_Datetime',
	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->addFieldToTab("Root.Main", new TextField("Location", "Location"), "Content");

		return $fields;
	}

	public function Dates() {
		return $this->DateTimes();
	}

	public function onBeforeWrite() {
		$firstDateTime = $this->DateTimes()->First()->StartDate;
		$this->FirstStartDateTime = $firstDateTime;
		parent::onBeforeWrite();
	}

}

class CommunityEvent_Controller extends Page_Controller {

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

	public function init() {
		parent::init();
		// You can include any CSS or JS required by your project here.
		// See: http://doc.silverstripe.org/framework/en/reference/requirements
	}

	public function index() {
		return $this->renderWith(array("CommunityEvent", "Page"));

	}

}
