<?php
class SidebarItemAdmin extends ModelAdmin {
  private static $managed_models = array('SidebarItem'); // Can manage multiple models
  static $url_segment = 'sidebar-items'; // Linked as /admin/products/
  static $menu_title = 'Sidebar Items';
}