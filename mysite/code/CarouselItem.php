<?php

	class CarouselItem extends DataObject {

		private static $db = array(
			"Title" => "Varchar(155)",
			"SubTitle" => "Varchar(155)",
			"Content" => "HTMLText",
			"SortOrder"=>"Int",
			"ExternalLink" => "Text"

		);

		private static $has_one = array (
			"AssociatedPage" => "SiteTree",
			'Image' => 'Image'
		);

		// Summary fields
		public static $summary_fields = array(
			'Title' => 'Title',
			'SubTitle' => 'SubTitle'
		);

		private static $default_sort = "SortOrder";

		function getCMSFields() {
			$fields = new FieldList();

			$fields->push( new TextField( 'Title', 'Heading' ));
			$fields->push( new TextField( 'SubTitle', 'Subheading' ));
			$fields->push( new TreeDropdownField("AssociatedPageID", "Link to this page", "SiteTree"));
			$fields->push( new UploadField( 'Image', 'Image (width: 1200px, height: 600px' ));


			return $fields;
		}

	}