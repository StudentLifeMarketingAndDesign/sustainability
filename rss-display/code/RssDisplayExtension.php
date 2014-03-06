<?php
class RssDisplayExtension extends DataExtension{


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

	public function RSSDisplay($numItems = 30, $feedURL="feed://afterclass.uiowa.edu/events/") {

		$output = new ArrayList();
			//$output->setPageLength(3);
			include_once('simplepie.mini.php');
			$t1 = microtime(true);
			$feed = new SimplePie();
			$feed->set_feed_url($feedURL);
			$feed->enable_cache(false);
			$feed->init();
			
		  if($items = $feed->get_items(0, $numItems)) {
		  	
			 foreach($items as $item) {
			 	//do we need the simplepie rss2 namespace? test it. --actually... it isn't needed? idk why.
			 	//$custom_fields = $item->get_item_tags(SIMPLEPIE_NAMESPACE_RSS_20,'custom_fields');
			 	$custom_fields = $item->get_item_tags(null,'custom_fields');
				
				
				// Cast the Date
				$date = new Date('Date');
				$date->setValue($item->get_date());
				
				$dates = new Text('Dates');
				$dates->setValue($item->get_item_tags(null,'dates'));
				$dates->setValue($dates->value[0]['data']);
				
				$cost = new Text('Cost');
				$cost->setValue($item->get_item_tags(null,'cost'));
				$cost->setValue($cost->value[0]['data']);
				
				$location = new Text('Location');
				$location->setValue($item->get_item_tags(null,'location'));
				$location->setValue($location->value[0]['data']);

				$image = new Text('ImageURL');
				$image->setValue($item->get_item_tags(null,'image'));
				$image->setValue($image->value[0]['data']);	

				$smallimage = new Text('Smallimage');
				$smallimage->setValue($item->get_item_tags(null,'smallimage'));
				$smallimage->setValue($smallimage->value[0]['data']);
				
				
				// Cast the Title
				$title = new Text('Title');
				$title->setValue(html_entity_decode($item->get_title()));
				
				$author = new Text('Author');
				$item_author = $item->get_author();
				
				if(isset($item_author)){
					$author->setValue($item_author->get_name());}
				
				// Cast the description and strip
				$desc = new HTMLText('Description');
				$desc->setValue(strip_tags($item->get_description()));
								
				if($thumbnail_enclosure = $item->get_enclosure()){
					//Thumbnail
					$thumbnail_url = new Text('ImageURL');
					$thumbnail_url->setValue($thumbnail_enclosure->link);
				}else{
					$thumbnail_url = null;
				
				}
				
				$output->push(new ArrayData(array(
				   'Title'         => $title,
				   'Author'       =>$author,
				   'Date'         => $date,
				   'Dates'		=> $dates,
				   'Cost'		=> $cost,
				   'Location'	=> $location,
				   'Link'         => $item->get_link(),
				   'Description'   => $desc,
				   'Cost' => $cost,
				   "Location" => $location,
				   'Smallimage' => $smallimage,
				   "ImageURL" => $image
				)));
			 }
			
			 return $output;
		  } 

		}//end function HomeEventItems()

}