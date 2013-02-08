<!DOCTYPE html> 

<script src="$BaseHref/mysite/code/javascript/ui_002.js" type="text/javascript"></script>
<script src="$BaseHref/mysite/code/javascript/ui.js" type="text/javascript"></script>
<script type="text/javascript">
            $(function() {
               $('#ui-tabs-navx').tabs({ fx: { opacity: 'toggle' } }).tabs('rotate', 8000);
            });
			jQuery("#ui-tabs-navx").tabs().tabs("option", "disabled", false);
        </script>  

<script type="text/javascript" src="$BaseHref/mysite/code/javascript/ui.tabs.js"></script>   
    
      
<div id="content-wrapper">



<div id="middle-image">

<div id="menu-wrapper">

<% include Navigation %>

</div>

<div id="homepage-wrapper">

<div id="feature-wrapper">


<!--
<div class="clear"></div>
<div id="rotate">



<% control Home %>
	<div <% if First %>class="ui-tabs-panel" <% else %> class="ui-tabs-panel ui-tabs-hide"<% end_if %> id="tab$Pos">
		<div class="feature-image" style="background: url('$FeatureImage.NiceImage.URL') no-repeat 0px 0px;">
		<div class="feature-mask"></div></div>
		<h2><a href="$Link">$Title</a></h2><br />
		<div class="summary">$getSummaryHTML</div>
		<% if HomeLink %>
			<span class="more"><a href="$HomeLink" class="external-link" target="_blank">Read More</a></span>
		<% else %>
			<span class="more"><a href="$Link">Read More</a></span>
		<% end_if %>
	</div>
<% end_control %>

<ul class="ui-tabs-nav" id="ui-tabs-navx">
<% control Home %>
<li id="menu$Pos" <% if First %>class="ui-tabs-selected"<% end_if %>><a href="#tab$Pos">$Title</a></li>
<% end_control %>
</ul>






-->

<div id="slideshow">
  <ul>
    <li>
      <img src="assets/Images/Fall-2011/854-2-4-45-x-4-5-Radish-Ad.jpg" title="Lorem ipsum dolor sit amet" />
    </li>
    
    <li>
      <img src="assets/Images/Fall-2011/854-2-4-45-x-4-5-Radish-Ad.jpg" title="Lorem ipsum dolor sit amet" />
    </li>
    
    <li>           
      <img src="assets/Images/Fall-2011/854-2-4-45-x-4-5-Radish-Ad.jpg" title="Lorem ipsum dolor sit amet" />
    </li>	                         
  </ul>
</div>

</div></div>

<!--<img src="assets/Images/Fall-2011/854-2-4-45-x-4-5-Radish-Ad.jpg" width=100 height=100/> -->
<div id="home-wrapper"> 
  
<h3 class="newsSection" title="News"><a href="{$BaseHref}news" class="homepageSubhead">NEWS & EVENTS<span class="headerLine">-------------------------------------------------------------------------
	---------------------------------------------------------------------
</span></a></h3>  
  
<div id="events-column">

<!--
<h3 class="events" title="Events"><a href="{$BaseHref}events">Events</a></h3>
<p class="view-all"><a href="$BaseHref/events">View All</a></p>
<ul class="events">

<% loop Events %>


<li class="events$Pos">

<% if EventLink %>
	<h4><a href="$EventLink" target="_blank">$Title</a></h4>
<% else %>
	<% if Content %>
		<h4><a href="$Link">$Title</a></h4>
	<% else %>
		<h4>$Title</h4>

	<% end_if %>
<% end_if %>


<p class="date">
<% if EventDateRange %>
$EventDateRange
<% else_if EventDate %>
 $EventDate.Format("F d&#44 Y")
<% end_if %>
<% if EventTime %>- $EventTime,<% end_if %><br />
<% if EventLocation %>$EventLocation<% end_if %>

</p>

<% if EventSponsor %>
<p class="sponsor"><a href="$EventSponsorLink" target="_blank">$EventSponsor</a></p>
<% end_if %>
<span class="more">
<% if EventLink %><a href="$EventLink" class="external-link" target="_blank">Read More</a>
<% else %>
<% if Content %>
<a href="$Link">Read More</a>
<% end_if %>
<% end_if %>
</span></li>
<% end_loop %>

</ul>
-->

<div id="featurePic">
	<img id="featuredPicture" src="$FeatureImage.URL">
</div>
<div id="featureText">$FeatureText</div>

<div id="whatYouCanDo"> 

<h3 class="whatYouCanDo" title="What You Can Do"><a href="$BaseHref/what-you-can-do" class="homepageSubhead">WHAT YOU CAN DO</a></h3> 

	<div class="whatYouCanDoColumn">
		<div class="columnLabel">$WhatYouCanDoLabel</div>
		<div class="columnContent">$WhatYouCanDo</div>
	</div>
	<div class="whatYouCanDoColumn">
		<div class="columnLabel">$WhatYouCanDoLabelRight</div>
		<div class="columnContent">$WhatYouCanDo2</div>
	</div>
</div>

	

<script type="text/javascript" src="/mysite/code/javascript/tabs_ui_002.js"></script>
<script type="text/javascript" src="/mysite/code/javascript/tabs_ui.js"></script>
<script type="text/javascript">
	$(function() {
		//$("#tabs").tabs({
		//	event: 'mouseover'
		//});
		jQuery("#tabs").tabs();
	});
	</script>
   
  
<div id="moreFromUISustainability">

	<h3 class="moreFromUISustainability" title="News"><a href="{$BaseHref}news" class="homepageSubhead">MORE FROM UI SUSTAINABILITY</a></h3>
		
	<div id="social-media">
	
		<ul>
		<li><a href="http://twitter.com/uisustainable" target="_blank"><img src="$ThemeDir/images/twitter.png" alt="Twitter" width="91" height="81" title="Follow us on Twitter"/></a></li>
		<li><a href="http://www.facebook.com/pages/The-University-of-Iowa-Office-of-Sustainability/251818755982" target="_blank"><img src="$ThemeDir/images/facebook.png" alt="Facebook" width="94" height="81" title="Find us on Facebook" /></a></li>
		<li><a href="{$BaseHref}home/rss" target="_blank"><img src="$ThemeDir/images/rss.png" alt="RSS" width="94" height="81" title="View our RSS feed"/></a></li>
		<li><a href="{$BaseHref}contact"><img src="$ThemeDir/images/email.png" alt="Email" width="92" height="81" title="Contact Us"/></a></li>
		</ul>
			
	</div>
	
	<div class="bubble"><ul id="twitter_update_list"><li></li></ul></div>

</div>


</div>
  
<!--
<div id="what">
<div id="demo">



<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="tabs">
<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
<% loop ChildrenOf(what-you-can-do) %>
<li id="list$Pos" <% if First %>class="ui-corner-top ui-tabs-selected ui-state-active" <% else %> class="ui-corner-top ui-state-default"<% end_if %>><a href="#tabs-$Pos">$MenuTitle</a></li>
<% end_loop %>
</ul>


<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="tabs-1">
<div class="link-block1"> 
<ul>
<% loop ChildrenOf(students) %>
<li><a href="$Link">$Title</a></li>
<% end_loop %>
</ul>
</div></div>

<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="tabs-2">
<div class="link-block1"> 
<ul>
<% loop ChildrenOf(faculty-staff) %>
<li><a href="$Link">$Title</a></li>
<% end_loop %>
</ul>
</div></div>

<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="tabs-3">
<div class="link-block1"> 
<ul>
<% loop ChildrenOf(outreach) %>
<li><a href="$Link">$Title</a></li>
<% end_loop %>
</ul>
</div></div>


</div>
</div>
</div>
-->
    
<div id="news-column">

<!--<p class="view-all"><a href="{$BaseHref}news">View All</a></p>-->
<ul class="news">
<% loop EventNews(3) %>
<% if canView %>
<li>

<% if NewsLink %><h4><a href="$NewsLink" target="_blank">$Title</a></h4>
<% else %>
<h4><a href="$Link">$Title</a></h4>
<% end_if %>

<p>$Content.LimitWordCount(20)</p>
<span class="more">
<% if NewsLink %><a href="$NewsLink" class="external-link" target="_blank">Read More</a>
<% else %>
<a href="$Link">Read More</a>
<% end_if %>
</span></li>
<% end_if %>
<% end_loop %>
</ul>

<br /><br />
<h3 class="siteBlog" title="Blog"><a href="$BaseHref/blog" class="homepageSubhead">SUSTAINABILITY BLOG</a></h3>
<p class="view-all"><a href="$BaseHref/blog">View All</a></p>
<ul class="news">

<% loop RSSBlogPosts(1) %>
<li>
<h4><a href="$Link">$Title</a></h4>
<p>$Description.LimitWordCount(10)</p>
<span class="more"><a href="$Link">Read More</a></span></li>
<% end_loop %>

</ul>




<!--
<div id="social-media">


<div id="social-media-balloon">
<ul id="twitter_update_list"><li></li></ul>
</div>
<ul>
<li><a href="http://twitter.com/uisustainable" target="_blank"><img src="$ThemeDir/images/twitter.png" alt="Twitter" width="91" height="81" title="Follow us on Twitter"/></a></li>
<li><a href="http://www.facebook.com/pages/The-University-of-Iowa-Office-of-Sustainability/251818755982" target="_blank"><img src="$ThemeDir/images/facebook.png" alt="Facebook" width="94" height="81" title="Find us on Facebook" /></a></li>
<li><a href="{$BaseHref}home/rss" target="_blank"><img src="$ThemeDir/images/rss.png" alt="RSS" width="94" height="81" title="View our RSS feed"/></a></li>
<li><a href="{$BaseHref}contact"><img src="$ThemeDir/images/email.png" alt="Email" width="92" height="81" title="Contact Us"/></a></li>
</ul>
</div>-->
  
</div><div class="clear"></div>  
</div></div>
</div> 

<!--<div id="bottom-shadow"></div>--></div>


<script type="text/javascript" src="http://twitter.com/javascripts/blogger.js"></script>

<script src="https://api.twitter.com/1/statuses/user_timeline.json?screen_name=uisustainable&amp;include_rts=true&amp;count=1&amp;callback=twitterCallback2"></script>

 <script type="text/javascript">
		jQuery(document).ready(function($) {
			
			$('news-column').fadeOut();
			 $("#slideshow").craftyslide();
			//jQuery('#slider').anythingSlider();
			$('#slideshow img').each(function(){
				$(this).css = ("visibility", "hidden");
				
				//$(this).fadeOut();
			}
			
			);
		});

	</script>

<!--<script type="text/javascript" src="http://twitter.com/statuses/user_timeline/UIsustainable.json?callback=twitterCallback2&amp;count=1"></script>-->