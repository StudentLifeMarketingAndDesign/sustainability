<?php 
	class SidebarItem extends DataObject {
		
		private static $db = array(
			"Title" => "Text",
			"Content" => "HTMLText",
			"UseExternalLink" => "Boolean",
			"ExternalLink" => "Text",
			"ShowHeading" => "Boolean"
			
		);
		
		private static $has_one = array (
			"Image" => "Image",
			"AssociatedPage" => "SiteTree",
		);
		
		
		private static $belongs_many_many = array (
			"Pages" => "Page"
		
		);
		
		private static $defaults = array(
			"ShowHeading" => 1,
		);
		
		
		private static $summary_fields = array (
			"Title",
		);
		private static $plural_name = "SidebarItems";
		
		function getCMSFields() { 
			$fields = new FieldList(); 
				
			$treeDropdown = new TreeDropdownField("AssociatedPageID", "Link to this page", "SiteTree");
			//$treeDropdown->setEmptyString('(None)');
			$fields->push( new TextField( 'Title', 'Title' ));
			$fields->push( new CheckboxField( 'ShowHeading', 'Show the Title overlapped with the Sidebar Item\'s content.' ));
			$fields->push($treeDropdown);
			$fields->push( new CheckboxField( 'UseExternalLink', 'Or use the external link below' ));
			$fields->push( new TextField( 'ExternalLink', 'External Link' ));
			$fields->push( new UploadField( 'Image', 'Image' ));
						
			$fields->push( new HTMLEditorField( 'Content', 'Content' ));
			
			$gridFieldConfig = GridFieldConfig_RelationEditor::create();
			$gridFieldConfig->removeComponentsByType('GridFieldAddNewButton');
			$gridField = new GridField("SidebarItems", "Pages that use this sidebar", $this->Pages(), $gridFieldConfig);
			
			$fields->push($gridField);
			return $fields; 
		}
		
		public function Link(){
			
			if($this->UseExternalLink){
				$link = $this->ExternalLink;
				return $link;
			}elseif($this->AssociatedPageID != 0){
				$associatedPage = $this->AssociatedPage();
				$link = $associatedPage->Link();
				return $link;
			}else{
				return false;
			}
			
		}
		
	}