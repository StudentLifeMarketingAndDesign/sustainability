<?php 

	class GalleryImage extends Image{
		
		private static $db = array (
			'Sort' => 'Int',
			'Caption' => 'Text'

		);
		private static $default_sort = 'Sort ASC';
		
		public function getCMSFields(){
			$fields = parent::getCMSFields();
			$fields->addFieldToTab("Root.Main", new TextareaField("Caption", "Caption"));
			return $fields;


		}
	}