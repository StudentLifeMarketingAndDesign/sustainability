<?php
/**
 * Defines the HomePage page type
 */
class NewsLetterFeature extends DataObject {
	private static $db = array(
   		"Title" => "varchar(255)",
   		"Link" => "Text",
   		"Content" => "HTMLText",
	);
	private static $has_one = array(
		"Newsletter" => "NewsLetter",
		"Image" => "Image"
	);
	
	public static $plural_name = 'News Letter Features';
 
	function getCMSFields() {
		$fields = parent::getCMSFields();

    	return $fields;
	}
	

}
?>