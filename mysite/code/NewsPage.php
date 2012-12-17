<?php

class NewsPage extends NewsItem {
	
	
		
	
	public static $db = array(
	

	'NewsLink' => 'Text',
	"NewsDate" => "Date",
	"SongCaption" => "Text",
	"ImageCaption" => "Text",
	"VideoCaption" => "Text",
	"VideoLink" => "Text",
	'FlickrUsername' => 'Text',
	'FlickrSetnumber' => 'Text',
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
	
	
	
	);
	
	public static $has_one = array(
		'HeaderImage' => 'Image',
		"SongFile" => "File",
		'FeatureImage' => 'SizedImage'

	
	);
	
	
	
function getCMSFields() {
	$fields = parent::getCMSFields();
	
	$fields->addFieldToTab('Root.Content.Main', new TextField('NewsLink', 'News Link - Enter a link here if you want to link to an exernal news event'));
	$fields->addFieldToTab('Root.Content.Main', new CalendarDateField('NewsDate', 'News Date - This date will show up on the news overview page, but not on the home page'));
	$fields->addFieldToTab('Root.Content.Images', new ImageField('HeaderImage', 'HeaderImage size should be 316x222 pixels'));
	$fields->addFieldToTab('Root.Content.Images', new TextField('ImageCaption', 'Image Caption'));
	$fields->addFieldToTab('Root.Content.Video', new TextField('VideoCaption', 'Video Caption'));
	$fields->addFieldToTab('Root.Content.Video', new TextField('VideoLink', 'Youtube Video code: the numbers at the end of http://www.youtube.com/watch?v=XgOx8HOihWo so it would be XgOx8HOihWo in this example'));
	$fields->addFieldToTab('Root.Content.Audio', new TextField('SongCaption', 'Audio Description'));
	$fields->addFieldToTab('Root.Content.Audio', new FileIFrameField('SongFile','Audio File (the file currently MUST be .mp3, NOT .m4a or anything else)',null,null,null,'assets/Uploads/mp3s/'));
	$fields->addFieldToTab('Root.Content.Flickr', new TextField('FlickrUsername', 'Flickr username - yours is sustainabilityuiowa'));
	$fields->addFieldToTab('Root.Content.Flickr', new TextField('FlickrSetnumber', 'Flickr set number - the number at the end of this url http://www.flickr.com/photos/sustainabilityuiowa/sets/72157624326037025/'));

	$fields->addFieldToTab('Root.Content.Main', new TextField('EventLink', 'Event Link - Entering a Url here will link the event directly to the url, not an interior page - even if there is content in the content area.'));
	$fields->addFieldToTab('Root.Content.Main', new CalendarDateField('EventDate', 'Event Date - Day of Event or First day of event if more than one day.'));
	$fields->addFieldToTab('Root.Content.Main', new TextField('EventDateRange', 'Event Date Range - Use If Event Occurs on Multiple Dates in addition to entering Date above'));
	$fields->addFieldToTab('Root.Content.Main', new TextField('EventLocation', 'Event Location'));
	$fields->addFieldToTab('Root.Content.Main', new TextField('EventTime', 'Event Time'));
	$fields->addFieldToTab('Root.Content.Main', new TextField('EventSponsor', 'Event Sponsor'));
    $fields->addFieldToTab('Root.Content.Main', new TextField('EventSponsorLink', 'Event Sponsor Link'));
	$fields->addFieldToTab('Root.Content.Images', new ImageField('HeaderImage', 'HeaderImage size should be 316x222 pixels'));
	$fields->addFieldToTab('Root.Content.Images', new TextField('ImageCaption', 'Image Caption'));
	$fields->addFieldToTab('Root.Content.Video', new TextField('VideoCaption', 'Video Caption'));
	$fields->addFieldToTab('Root.Content.Video', new TextField('VideoLink', 'Youtube Video code: the numbers at the end of http://www.youtube.com/watch?v=XgOx8HOihWo so it would be XgOx8HOihWo in this example'));
	$fields->addFieldToTab('Root.Content.Audio', new TextField('SongCaption', 'Audio Description'));
	$fields->addFieldToTab('Root.Content.Audio', new FileIFrameField('SongFile','Audio File (the file currently MUST be .mp3, NOT .m4a or anything else)',null,null,null,'assets/Uploads/mp3s/'));
		$fields->addFieldToTab('Root.Content.Flickr', new TextField('FlickrUsername', 'Flickr username - yours is sustainabilityuiowa'));
	$fields->addFieldToTab('Root.Content.Flickr', new TextField('FlickrSetnumber', 'Flickr set number - the number at the end of this url http://www.flickr.com/photos/sustainabilityuiowa/sets/72157624326037025/'));
	
	
	
    return $fields;
	
   }	
	
}

class NewsPage_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		
	}
	
	
	
}

?>