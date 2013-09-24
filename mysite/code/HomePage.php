<?php
/**
 * Defines the HomePage page type
 */
 
class HomePage extends Page {
	private static $db = array(
	//'FeatureImage' => 'Image',
	'FeatureText' => 'HTMLText',
	'WhatYouCanDo' => 'HTMLText',
	'WhatYouCanDo2' => 'HTMLText',
	'WhatYouCanDoLabel' => 'Text',
	'WhatYouCanDoLabelRight' => 'Text'


	);
	
	private static $has_one = array(
	'FeatureImage' => 'Image'
	);
	
	private static $has_many = array(
	'HomepageInitiatives' => 'HomepageInitiative' 
	);
	
	
   
   function getCMSFields() {
   
	  $fields = parent::getCMSFields();
	   
	  $fields->removeFieldFromTab("Root.Main","Content");
	   
	  $fields->addFieldToTab("Root.Main", new UploadField('FeatureImage', 'Feature Image'));
	  $fields->addFieldToTab("Root.Main", new HTMLEditorField('FeatureText', 'Feature Text'));
	  $fields->addFieldToTab("Root.Main", new TextField('WhatYouCanDoLabel', 'What You Can Do Label'));
	  $fields->addFieldToTab("Root.Main", new HTMLEditorField('WhatYouCanDo', 'What You Can Do'));
	  $fields->addFieldToTab("Root.Main", new TextField('WhatYouCanDoLabelRight', 'What You Can Do Label (Right Column)'));
	  $fields->addFieldToTab("Root.Main", new HTMLEditorField('WhatYouCanDo2', 'What You Can Do (Right Column)'));
	  /*
	  $fields->addFieldToTab("Root.Main", new TextField('Initiative1', 'Initiative Text (top-left)'));
	  $fields->addFieldToTab("Root.Main", new TextField('InitiativeLink1', 'Initiative Link (top-left)'));
	  $fields->addFieldToTab("Root.Main", new TextField('Initiative2', 'Initiative Text (top-right)'));	 
	  $fields->addFieldToTab("Root.Main", new TextField('InitiativeLink2', 'Initiative Link (top-right)'));   
	  $fields->addFieldToTab("Root.Main", new TextField('Initiative3', 'Initiative Text (bottom-left)'));    
	  $fields->addFieldToTab("Root.Main", new TextField('InitiativeLink3', 'Initiative Text (bottom-left)'));
	  $fields->addFieldToTab("Root.Main", new TextField('Initiative4', 'Initiative Text (bottom-right)'));
	  $fields->addFieldToTab("Root.Main", new TextField('InitiativeLink4', 'Initiative Text (bottom-right)'));*/
	  
	  $gridFieldConfig = GridFieldConfig_RelationEditor::create(); 
	  $gridfield = new GridField("HomepageInitiatives", "Homepage Initiatives", $this->HomepageInitiatives(), $gridFieldConfig);
	  $fields->addFieldToTab("Root.Main", $gridfield);
	  
	/*
		$gridFieldConfig = GridFieldConfig_RelationEditor::create();
		
		$gridField = new GridField('Features', 'Features', $this->Features(), $gridFieldConfig);
		$fields->addFieldToTab("Root.Main", $gridField);
	*/  

	  return $fields;
   }
}
 
class HomePage_Controller extends Page_Controller {
	
		public function init() {
			parent::init();
			RSSFeed::linkToFeed($this->Link() . "rss", "RSS feed");
	}
	
	
		function rss() {
			$set = DataObject::get("NewsItem");
			
			$rss = new RSSFeed($set, $this->Link(), "Events News Feed", "Shows a list of the most recently updated news and events.", "Title", "Content", "Author");
			$rss->outputToBrowser();
	}	
	

		function getTweets(){
			require_once("/Applications/MAMP/htdocs/sustainability/twitteroauth/twitteroauth/twitteroauth.php"); //Path to twitteroauth library
			 
			$twitteruser = "uisustainable";
			$notweets = 1;
			$consumerkey = "Cqm67WWEqpYSkJFqwlR0YQ";
			$consumersecret = "WOQ4N0idRnOM037ACKqQ45qq299G2x6dDXAYVX0C0";
			$accesstoken = "540355741-sifKOU9eM5D81vse3VFTOhSFy7YfbA7ybzBMCCJn";
			$accesstokensecret = "2PqUCLngXWcfQ6ief49nqB5e3afJxX2nfNvuliyT9xA";
			 
			
			 
			$connection = $this->getConnectionWithAccessToken($consumerkey, $consumersecret, $accesstoken, $accesstokensecret);
			 
			$tweets = $connection->get("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=".$twitteruser."&count=".$notweets);
			
			
			$text = $tweets[0]->text;

			
			return $text;
		}
		
		function getConnectionWithAccessToken($cons_key, $cons_secret, $oauth_token, $oauth_token_secret) {
			  $connection = new TwitterOAuth($cons_key, $cons_secret, $oauth_token, $oauth_token_secret);
			  return $connection;
		}

}
?>