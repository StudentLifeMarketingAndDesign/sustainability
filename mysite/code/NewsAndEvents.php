<?php
class NewsAndEvents extends Page {

	private static $db = array(

	);

	private static $has_one = array(

	);

	public function getCMSFields(){
		$fields = parent::getCMSFields();

		// $fields->removeByName("Content");
		$fields->removeByName("Metadata");
		$fields->removeByName("Gallery");
		$fields->removeByName("PageSummary");


		return $fields;

	}

}
class NewsAndEvents_Controller extends Page_Controller {

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
		
		$this->getEvents();
	}

	public function getEvents(){
		$communityEvents  = CommunityEvent::get();
		$localistEvents = LocalistEvent::get();
		$eventsList = ArrayList::create();
		print_r($localistEvents);

		foreach ($communityEvents as $CommunityEvent) {
			$eventsList->add($CommunityEvent);

	}
		foreach ($localListEvents as $localListEvent) {
 			$eventsList->add($localListEvent);
		}
		//print_r($eventsList);

		return $eventsList;
	}
	
}
