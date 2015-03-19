<?php

class CommunityEvent extends CalendarEvent {
	private static $db = array(
		'Venue' => 'Text',
		'Sponsor' => 'Text',
		'ContactName' => 'Text',
		'ContactEmail' => 'Text',
		'MoreInfoLink' => 'Text',

		'FirstStartDateTime' => 'SS_Datetime',
	);

	private static $has_one = array (
		'Image' => 'Image'
	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->addFieldToTab("Root.Main", new TextField("Venue", "Venue"), "Content");
		$fields->addFieldToTab("Root.Main", new TextField("Sponsor", "Sponsor"), "Content");
		$fields->addFieldToTab("Root.Main", new TextField("ContactName", "Contact Name"), "Content");
		$fields->addFieldToTab("Root.Main", new TextField("ContactEmail", "Contact Email"), "Content");
		$fields->addFieldToTab("Root.Main", new TextField("MoreInfoLink", "More Info Link"), "Content");
		$fields->addFieldToTab('Root.Main', new UploadField('Image'), 'Content');
		return $fields;
	}

	public function Dates() {
		return $this->DateTimes();
	}

	public function onBeforeWrite() {
		$this->updateFirstStartDateTime();
		parent::onBeforeWrite();
	}

	public function updateFirstStartDateTime(){
		if($this->DateTimes()->First()){
			$firstDateTime = $this->DateTimes()->First()->StartDate;
			$this->FirstStartDateTime = $firstDateTime;
		}
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


}
