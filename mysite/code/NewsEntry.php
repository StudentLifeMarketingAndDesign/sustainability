<?php
class NewsEntry extends BlogEntry {

	private static $db = array(
		'IsFeatured' => 'Boolean',
		'ExternalLink' => 'Text',
	);

	private static $has_one = array(
		"Photo" => "Image",
	);
	private static $belongs_many_many = array (
	);
	private static $has_many = array(
	);

	private static $allowed_children = array(

	);

	private static $singular_name = 'News Entry';

	private static $plural_name = 'News Entries';

	public function getCMSFields(){
		$fields = parent::getCMSFields();
		$fields->removeByName("SummaryPhoto");
		$fields->removeByName("Summary");
		$fields->removeByName("GalleryImages");
		$fields->removeByName("PagePhoto");
		$fields->removeByName("PageSummary");
		$fields->removeByName("Gallery");

		$fields->renameField("Tags", "Tags (biomass, energy, food, leed, recycling, transportation) comma sep.");
		$fields->addFieldToTab("Root.Main", new TextField("ExternalLink", "External Link - Enter a link here if you want to link to an exernal news article"));

		$fields->addFieldToTab("Root.Main", new UploadField("Photo", "Photo for News Article"));
		$fields->addFieldToTab('Root.Main', new CheckboxField('IsFeatured','Feature this Article? (Yes)'));

		return $fields;
	}


}
class NewsEntry_Controller extends BlogEntry_Controller {

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

	public function RelatedNewsEntries(){
		$holder = NewsHolder::get()->First();
		$tags = $this->TagsCollection()->sort("RAND()")->limit(6);
		$entries = new ArrayList();

		foreach($tags as $tag){
			$taggedEntries = $holder->Entries(5, $tag->Tag)->exclude(array("ID"=>$this->ID))->sort("RAND()")->First();
			if($taggedEntries){
				foreach($taggedEntries as $taggedEntry){
					if($taggedEntry->ID){
						$entries->push($taggedEntry);
					}
				}
			}

		}

		if($entries->count() > 1){
			$entries->removeDuplicates();
		}
		return $entries;
	}

	public function init() {
		parent::init();


	}

}