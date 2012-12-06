<?php
class MyLeftAndMainDecorator extends LeftAndMainDecorator {
   function init() {
       HtmlEditorConfig::get('cms')->setOption('theme_advanced_styles', 'External-Link=external;Small-Image-Left-155x107-pixels=small-image-left;Small-Image-Right-155x107-pixels=small-image-right;Large-Image-Left-316x222-pixels=large-image-left;Large-Image-Right-316x222-pixels=large-image-right;Vertical-Image-Right-222x296-pixels=vertical-image-right;Vertical-Image-Left-222x296-pixels=vertical-image-left;Lightbox=lightbox');
    }
}
?>