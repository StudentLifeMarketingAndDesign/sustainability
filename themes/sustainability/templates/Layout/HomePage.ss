<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
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

<div id="feature-wrapper">

<div id="feature-container">


<% include Navigation %>

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







</div></div>
</div><!--/end bodywrap div -->
 
<div id="home-wrapper"> 
  
<div id="events-column">


<h3 class="events" title="Events"><a href="$BaseHref/events">Events</a></h3>
<p class="view-all"><a href="$BaseHref/events">View All</a></p>
<ul class="events">

<% control Events %>
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
<% else %>
 $EventDate.Format(F d&#44; Y)
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
<% end_control %>

</ul>




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
    
   
  <h3 class="what" title="What You Can Do"><a href="$BaseHref/what-you-can-do">What Can You Do?</a></h3> 
  <p class="view-all"><a href="$BaseHref/what-you-can-do">View All</a></p> 
<div id="what">
<div id="demo">



<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="tabs">
<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
<% control ChildrenOf(what-you-can-do) %>
<li id="list$Pos" <% if First %>class="ui-corner-top ui-tabs-selected ui-state-active" <% else %> class="ui-corner-top ui-state-default"<% end_if %>><a href="#tabs-$Pos">$MenuTitle</a></li>
<% end_control %>
</ul>


<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="tabs-1">
<div class="link-block1"> 
<ul>
<% control ChildrenOf(students) %>
<li><a href="$Link">$Title</a></li>
<% end_control %>
</ul>
</div></div>

<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="tabs-2">
<div class="link-block1"> 
<ul>
<% control ChildrenOf(faculty-staff) %>
<li><a href="$Link">$Title</a></li>
<% end_control %>
</ul>
</div></div>

<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="tabs-3">
<div class="link-block1"> 
<ul>
<% control ChildrenOf(outreach) %>
<li><a href="$Link">$Title</a></li>
<% end_control %>
</ul>
</div></div>


</div>
</div>
</div>
  
</div>
    
<div id="news-column">

<h3 class="news" title="News"><a href="$BaseHref/news">News</a></h3>
<p class="view-all"><a href="$BaseHref/news">View All</a></p>
<ul class="news">
<% control News %>
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
<% end_control %>
</ul>

<br /><br />
<h3 class="blog" title="Blog"><a href="$BaseHref/blog">Sustainability Blog</a></h3>
<p class="view-all"><a href="$BaseHref/blog">View All</a></p>
<ul class="news">
<% control RSSFeedImport(1) %>
<li>
<h4><a href="$Link">$Title</a></h4>
<p>$Description.LimitWordCount(10)</p>
<span class="more"><a href="$Link">Read More</a></span></li>
<% end_control %>

</ul>





<div id="social-media">


<div id="social-media-balloon">
<ul id="twitter_update_list"><li></li></ul>
</div>
<ul>
<li><a href="http://twitter.com/uisustainable" target="_blank"><img src="$ThemeDir/images/twitter.png" alt="Twitter" width="91" height="81" title="Follow us on Twitter"/></a></li>
<li><a href="http://www.facebook.com/pages/The-University-of-Iowa-Office-of-Sustainability/251818755982" target="_blank"><img src="$ThemeDir/images/facebook.png" alt="Facebook" width="94" height="81" title="Find us on Facebook" /></a></li>
<li><a href="$BaseHref/home/rss" target="_blank"><img src="$ThemeDir/images/rss.png" alt="RSS" width="94" height="81" title="View our RSS feed"/></a></li>
<li><a href="/contact"><img src="$ThemeDir/images/email.png" alt="Email" width="92" height="81" title="Contact Us"/></a></li>
</ul>
</div>
    
</div>
<div class="clear"></div>
</div> <!--end home wrapper -->
<div class="clear"></div>
<div id="bottom-shadow"></div></div></div>



<script type="text/javascript" src="http://twitter.com/javascripts/blogger.js"></script>

<script src="https://api.twitter.com/1/statuses/user_timeline.json?screen_name=uisustainable&amp;include_rts=true&amp;count=1&amp;callback=twitterCallback2"></script>

<!--<script type="text/javascript" src="http://twitter.com/statuses/user_timeline/UIsustainable.json?callback=twitterCallback2&amp;count=1"></script>-->