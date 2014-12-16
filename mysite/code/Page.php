<?php
class Page extends SiteTree {

	private static $db = array(
		"Summary" => "Text",
	);

	private static $has_one = array(
		"PagePhoto" => "Image",
		"SummaryPhoto" => "Image"
	);


	private static $many_many = array (
		'GalleryImages' => 'GalleryImage'
	);

	private static $many_many_extraFields=array(
	);

	private static $plural_name = "Pages";

	private static $defaults = array ();


	public function getCMSFields(){
		$fields = parent::getCMSFields();
		$fields->removeByName("Metadata");

		$fields->addFieldToTab("Root.Main", new UploadField("PagePhoto", "Main Header Photo"));
		$fields->addFieldToTab('Root.PageSummary', $myEditorField = new TextareaField('Summary', 'Short Page Description'));
		$myEditorField->setRows(3);

		$fields->addFieldToTab("Root.PageSummary", new UploadField("SummaryPhoto", "Page Summary Photo"));

		// Gallery
		$fields->addFieldToTab(
		   'Root.Gallery',
			$uploadField = new SortableUploadField(
		       $name = 'GalleryImages',
		       $title = 'Upload one or more images (max 10 in total, drag and drop to sort)'
		   )
		);
		$uploadField->setFolderName($this->URLSegment);
		$uploadField->setConfig('allowedMaxFileNumber', 10);


		return $fields;
	}


}
class Page_Controller extends ContentController {

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