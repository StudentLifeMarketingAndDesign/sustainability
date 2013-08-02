
<div id="content-wrapper">
<div id="middle-image">

<div id="bodywrap">


<% include Navigation %>



<div class="clear"></div>

</div><!--/end bodywrap div -->

<div id="top-shadow"></div> 
<div id="interior-wrapper">
<div id="main-content-wrapper">


<div id="content-right-column">

<div id="side-navigation-top"></div>
<div id="side-navigation">

<% if InSection(students) %>

<style type="text/css" media="screen">
#side-navigation, #side-navigation-top, #side-navigation-bottom  {
	display:none;
}
</style>
<% end_if %>

<% if InSection(faculty-staff) %>

<style type="text/css" media="screen">
#side-navigation, #side-navigation-top, #side-navigation-bottom {
	display:none;
}
</style>
<% end_if %>

<% if InSection(outreach) %>

<style type="text/css" media="screen">
#side-navigation, #side-navigation-top, #side-navigation-bottom  {
	display:none;
}
</style>
<% end_if %>

<% include SideNavigation %>


</div>
<div id="side-navigation-bottom"></div>

<% include SocialMedia %>




</div>

<div id="content" class="typography">

<% if HeaderImage %>
<div class="image">
<img src="<% loop HeaderImage %><% loop SetWidth(316) %> $URL <% end_loop %><% end_loop %>" alt="$Title"/>
<% if ImageCaption %><p class="caption">$ImageCaption</p><% end_if %> 
<% if YouTubeID %>
<iframe width="316" height="217" src="http://www.youtube.com/embed/$YouTubeID" frameborder="0" allowfullscreen></iframe>
<% end_if %>

</div>
<% end_if %> 

<% if FlickrSetnumber %>

<object class="interior-slideshow" width="316" height="300" type="application/x-shockwave-flash" data="http://www.flickr.com/apps/slideshow/show.swf?v=71649">
<param value="offsite=true&amp;lang=en-us&amp;page_show_url=%2Fphotos%2F{$FlickrUsername}%2Fsets%2F{$FlickrSetnumber}%2Fshow%2F&amp;page_show_back_url=%2Fphotos%2F{$FlickrUsername}%2Fsets%2F{$FlickrSetnumber}%2Fshow%2F&amp;set_id={$FlickrSetnumber}&amp;jump_to=" name="flashvars" />
<param value="true" name="allowFullScreen" />
<param value="http://www.flickr.com/apps/slideshow/show.swf?v=71649" name="src" />
<param value="true" name="allowfullscreen" /> </object>

<% end_if %> 

<h1>$Title</h1>




$Content

<h3>Virtual Dorm Room</h3>
<iframe class="greendorm" src="{$BaseHref}/greendorm" width="728" height="700"></iframe>





<div class="clear"></div>
</div>
</div>




<div class="clear"></div>
</div> <!--end home wrapper -->
<div id="interior-bottom-shadow"></div>










</div><!--/end middle-image div -->
</div><!--/end background graident div -->