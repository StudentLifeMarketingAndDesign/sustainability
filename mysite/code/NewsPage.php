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
	
	
	);
	
	public static $has_one = array(
		'HeaderImage' => 'Image',
		"SongFile" => "File",
		'FeatureImage' => 'SizedImage'

	
	);
	
	
	
function getCMSFields() {
	$fields = parent::getCMSFields();
	
	$fields->addFieldToTab('Root.Main', new TextField('NewsLink', 'News Link - Enter a link here if you want to link to an exernal news event'));
	
	$fields->addFieldToTab('Root.Main', $dateField = new DateField('NewsDate', 'News Date - This date will show up on the news overview page, but not on the home page')); 
    $dateField->setConfig('showcalendar', true);
    $dateField->setConfig('dateformat', 'MM/dd/YYYY');
                 
	$fields->addFieldToTab('Root.Images', new UploadField('HeaderImage', 'HeaderImage size should be 316x222 pixels'));
	$fields->addFieldToTab('Root.Images', new TextField('ImageCaption', 'Image Caption'));
	$fields->addFieldToTab('Root.Video', new TextField('VideoCaption', 'Video Caption'));
	$fields->addFieldToTab('Root.Video', new TextField('VideoLink', 'Youtube Video code: the numbers at the end of http://www.youtube.com/watch?v=XgOx8HOihWo so it would be XgOx8HOihWo in this example'));
	$fields->addFieldToTab('Root.Audio', new TextField('SongCaption', 'Audio Description'));
	$fields->addFieldToTab('Root.Audio', new FileIFrameField('SongFile','Audio File (the file currently MUST be .mp3, NOT .m4a or anything else)',null,null,null,'assets/Uploads/mp3s/'));
	$fields->addFieldToTab('Root.Flickr', new TextField('FlickrUsername', 'Flickr username - yours is sustainabilityuiowa'));
	$fields->addFieldToTab('Root.Flickr', new TextField('FlickrSetnumber', 'Flickr set number - the number at the end of this url http://www.flickr.com/photos/sustainabilityuiowa/sets/72157624326037025/'));
	
		
    return $fields;
	
   }	
	
}

class NewsPage_Controller extends Page_Controller {
	
	public function init() {
		parent::init();
		
	}
	
	
	
}

?>