<?php

class EventsPage extends Page {
	
	
		
	
	public static $db = array(
	
	'EventLink' => 'Text',
	"EventDate" => "Date",
	"EventDateRange" => "Text",
	"EventLocation" => "Text",
	"EventTime" => "Text",
	"EventSponsor" => "Text",
	"EventSponsorLink" => "Text",
	"SongCaption" => "Text",
	"ImageCaption" => "Text",
	"VideoCaption" => "Text",
	"VideoLink" => "Text",
	'FlickrUsername' => 'Text',
	'FlickrSetnumber' => 'Text',
	'HomeLink' => 'Text'

	
	
	
	
	);
	
	public static $has_one = array(
		'HeaderImage' => 'Image',
		"SongFile" => "File"
	
	);
	
	
	
function getCMSFields() {
	$fields = parent::getCMSFields();

	
	$fields->addFieldToTab('Root.Main', new TextField('EventLink', 'Event Link - Entering a Url here will link the event directly to the url, not an interior page - even if there is content in the content area.'));
	
	$fields->addFieldToTab('Root.Main', $dateField = new DateField('EventDate', 'Event Date -  Day of Event or First day of event if more than one day.')); 
    $dateField->setConfig('showcalendar', true);
    $dateField->setConfig('dateformat', 'MM/dd/YYYY');
	
	//$fields->addFieldToTab('Root.Main', new CalendarDateField('EventDate', 'Event Date - Day of Event or First day of event if more than one day.'));
	$fields->addFieldToTab('Root.Main', new TextField('EventDateRange', 'Event Date Range - Use If Event Occurs on Multiple Dates in addition to entering Date above'));
	$fields->addFieldToTab('Root.Main', new TextField('EventLocation', 'Event Location'));
	$fields->addFieldToTab('Root.Main', new TextField('EventTime', 'Event Time'));
	$fields->addFieldToTab('Root.Main', new TextField('EventSponsor', 'Event Sponsor'));
    $fields->addFieldToTab('Root.Main', new TextField('EventSponsorLink', 'Event Sponsor Link'));
	$fields->addFieldToTab('Root.Images', new UploadField('HeaderImage', 'HeaderImage size should be 316x222 pixels'));
	$fields->addFieldToTab('Root.Images', new TextField('ImageCaption', 'Image Caption'));
	$fields->addFieldToTab('Root.Video', new TextField('VideoCaption', 'Video Caption'));
	$fields->addFieldToTab('Root.Video', new TextField('VideoLink', 'Youtube Video code: the numbers at the end of http://www.youtube.com/watch?v=XgOx8HOihWo so it would be XgOx8HOihWo in this example'));
	$fields->addFieldToTab('Root.Audio', new TextField('SongCaption', 'Audio Description'));
	
	
	$audioField = new UploadField('SongFile','Audio File (the file currently MUST be .mp3, NOT .m4a or anything else)');
	$audioField->setFolderName('Uploads/mp3');
	$fields->addFieldToTab('Root.Audio', $audioField);
	//$fields->addFieldToTab('Root.Audio', new FileIFrameField('SongFile','Audio File (the file currently MUST be .mp3, NOT .m4a or anything else)',null,null,null,'assets/Uploads/mp3s/'));
	
	
		$fields->addFieldToTab('Root.Flickr', new TextField('FlickrUsername', 'Flickr username - yours is sustainabilityuiowa'));
	//$fields->addFieldToTab('Root.Flickr', new TextField('FlickrSetnumber', 'Flickr set number - the number at the end of this url http://www.flickr.com/photos/sustainabilityuiowa/sets/72157624326037025/'));
	$fields->addFieldToTab('Root.Flickr', new TextField('FlickrSetnumber', 'Flickr set number - the number at the end of this url http://www.flickr.com/photos/sustainabilityuiowa/sets/72157629223461288/'));

	
	
	
	
	
    return $fields;
	
   }	
	
}

class EventsPage_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		
	}
	
	
	
}

?>