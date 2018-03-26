<?php
class SpecialEvent extends Page {

	private static $db = array(
		"EventTag" => "Text",
		"EventSearchTerm" => "Text"
	);

	private static $has_one = array(
		"PagePhoto" => "Image"
	);

	public function getCMSFields(){
		$fields = parent::getCMSFields();

		// $fields->removeByName("Content");
		$fields->removeByName("Metadata");

		$fields->addFieldToTab("Root.Main", new UploadField("PagePhoto", "Header Photo (width:1200px, height: 500px)"));
		$fields->addFieldToTab("Root.Main", new TextField("EventTag", "Tag used to show events"));
		$fields->addFieldToTab("Root.Main", new TextField("EventSearchTerm", "OR search term used to show events (overrides above)"));

		return $fields;

	}

}
class SpecialEvent_Controller extends Page_Controller {

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
