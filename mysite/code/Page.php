<?php
class Page extends SiteTree {

	private static $db = array(
		"Summary" => "Text",
	);

	private static $has_one = array(
		"SummaryPhoto" => "Image",
	);

	private static $many_many = array(
		"SidebarItems" => "SidebarItem",
		'GalleryImages' => 'GalleryImage',
	);

	private static $many_many_extraFields = array(
		'SidebarItems' => array(
			'SortOrder' => 'Int',
		),
	);

	private static $plural_name = "Pages";

	private static $defaults = array();

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeByName("Metadata");

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

		$gridFieldConfig = GridFieldConfig_RelationEditor::create();

		$row = "SortOrder";
		$gridFieldConfig->addComponent($sort = new GridFieldSortableRows(stripslashes($row)));

		$sort->table = 'Page_SidebarItems';
		$sort->parentField = 'PageID';
		$sort->componentField = 'SidebarItemID';

		$gridField = new GridField("SidebarItems", "Sidebar Items", $this->SidebarItems(), $gridFieldConfig);
		$fields->addFieldToTab("Root.Sidebar", new LabelField("SidebarLabel", "<h2>Add sidebar items below</h2>"));
		$fields->addFieldToTab("Root.Sidebar", new LiteralField("SidebarManageLabel", '<p><a href="admin/sidebar-items" target="_blank">View and Manage Sidebar Items &raquo;</a></p>'));
		$fields->addFieldToTab("Root.Sidebar", $gridField); // add the grid field to a tab in the CMS

		return $fields;
	}
	public function Breadcrumbs($maxDepth = 20, $unlinked = false, $stopAtPageType = false, $showHidden = false) {
		return parent::Breadcrumbs(20, false, false, true);
	}
	public function SidebarItems() {
		return $this->owner->getManyManyComponents('SidebarItems')->sort('SortOrder');
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
	private static $allowed_actions = array(
		'feed'
	);

	private static $url_handlers = array(
		'feed' => 'feed'
	);

    public function feed() {
        $rss = new RSSFeed(
            SiteTree::get(), 
            $this->Link(), 
            "Sustainability at Iowa pages", 
            "Feed of all Sustainability at Iowa pages"
        );

        return $rss->outputToBrowser();
    }


	public function getAllEvents() {
		$communityCalendar = CommunityCalendar::get()->First();
		$communityEventDateTimes = $communityCalendar->UpcomingEvents(0);
		$communityEvents = new ArrayList();

		foreach($communityEventDateTimes as $communityEventDateTime){
			$communityEvents->push($communityEventDateTime->Event());
		}

		//$communityEvents->removeDuplicates();


		$localistCalendar = LocalistCalendar::get()->First();
		$localistEvents = $localistCalendar->EventList();

		$eventsList = ArrayList::create();
		//print_r($localistEvents);

		foreach ($communityEvents as $CommunityEvent) {
			//print_r('community event '.$CommunityEvent->FirstStartDateTime.'<br />');
			$eventsList->add($CommunityEvent);

		}
		foreach ($localistEvents as $localListEvent) {
			//print_r('localistevent '.$localListEvent->FirstStartDateTime.'<br />');
			$eventsList->add($localListEvent);
		}

		$eventsListSorted = $eventsList->sort('FirstStartDateTime ASC');
		//print_r($eventsListSorted);

		return $eventsListSorted;
	}

	public function EventListByTag() {
		$calendar = LocalistCalendar::get()->First();

		if (isset($this->EventTag)) {
			$events = $calendar->EventListByTag($this->EventTag);
			return $events;
		} else {
			$events = $calendar->EventList();
		}

		return $events;
	}

	public function EventListBySearch() {
		$calendar = LocalistCalendar::get()->First();

		if (isset($this->EventSearchTerm)) {
			$events = $calendar->EventListBySearchTerm($this->EventSearchTerm);
			return $events;
		} else {
			$events = $calendar->EventList();
		}

		return $events;
	}

	public function EventList(){
		if($this->EventSearchTerm != ''){
			return $this->EventListBySearch();
		}elseif($this->EventTag != ''){
			return $this->EventListByTag();
		}
	}
	public function init() {
		parent::init();
		Requirements::block(THIRDPARTY_DIR . '/jquery/jquery.js');
		// Note: you should use SS template require tags inside your templates
		// instead of putting Requirements calls here.  However these are
		// included so that our older themes still work

	}

}