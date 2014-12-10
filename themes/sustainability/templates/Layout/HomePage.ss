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



<% loop Home %>
	<div <% if First %>class="ui-tabs-panel" <% else %> class="ui-tabs-panel ui-tabs-hide"<% end_if %> id="tab$Pos">
		<div class="feature-image" style="background: url('$FeatureImage.URL') no-repeat 0px 0px;">
		<div class="feature-mask"></div></div>
		<h2><a href="$Link">$Title</a></h2><br />
		<div class="summary">$getSummaryHTML</div>
		<% if HomeLink %>
			<span class="more"><a href="$HomeLink" class="external-link" target="_blank">Read More</a></span>
		<% else %>
			<span class="more"><a href="$Link">Read More</a></span>
		<% end_if %>
	</div>
<% end_loop %>

<ul class="ui-tabs-nav" id="ui-tabs-navx">
<% loop Home %>
<li id="menu$Pos" <% if First %>class="ui-tabs-selected"<% end_if %>><a href="#tab$Pos">$Title</a></li>
<% end_loop %>
</ul>







</div></div>
</div><!--/end bodywrap div -->
 
<div id="home-wrapper"> 
  
<div id="events-column">


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
	
<% if HomepageInitiatives %>    
<!--<div id="sustainableInitiatives">-->
<div>
    <h3 class="sustain">Sustainable Initiatives</h3>
	<div id = "initiatives">
        <ul>
		<% loop HomepageInitiatives %>
			<!--<li><a class="initiative{$Pos} left" href="{$Link}">$Label</a></li>-->
			<li>
				<div class="initiative-image">
					<a class="initBlock{$Pos}" href="{$Link}">
						<img src="$ThemeDir/images/bike{$Pos}.png" alt="Initiative buttons" width="81" height="81"/>
					</a> 
				</div>
				<div class="initiative-label">
					<span><a href="{$Link}" class="init-{$Pos}">$Label</a></span>
				</div>
				<div class="clear"></div>
			</li>
		<% end_loop %>
		</ul>
	</div>
</div>
<!--<div id="social-media">

<ul>
<li><a href="http://twitter.com/uisustainable" target="_blank"><img src="$ThemeDir/images/twitter.png" alt="Twitter" width="91" height="81" title="Follow us on Twitter"/></a></li>
<li><a href="http://www.facebook.com/pages/The-University-of-Iowa-Office-of-Sustainability/251818755982" target="_blank"><img src="$ThemeDir/images/facebook.png" alt="Facebook" width="94" height="81" title="Find us on Facebook" /></a></li>
<li><a href="{$BaseHref}home/rss" target="_blank"><img src="$ThemeDir/images/rss.png" alt="RSS" width="94" height="81" title="View our RSS feed"/></a></li>
<li><a href="{$BaseHref}contact"><img src="$ThemeDir/images/email.png" alt="Email" width="92" height="81" title="Contact Us"/></a></li>
</ul>
</div>
-->


<% end_if %>
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
</div>
    
<div id="news-column">

<h3 class="news" title="News"><a href="{$BaseHref}news">News</a></h3>
<p class="view-all"><a href="{$BaseHref}news">View All</a></p>
<ul class="news">
<% loop News %>
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

<h3 class="blog" title="Blog"><a href="/climatenarrative">Climate Narrative Blog</a></h3>
<p class="view-all"><a href="/climatenarrative">View All</a></p>
<ul class="news">

<% loop RSSDisplay(3,"http://sustainability.uiowa.edu/climatenarrative/?feed=rss2") %>
<li>
	<h4><a href="$Link">$Title</a></h4>
	<p>$Description.LimitWordCount(10)</p>
	<span class="more"><a href="$Link">Read More</a></span>
</li>
<% end_loop %>

</ul>

<br /><br />

<h3 class="blog" title="Blog"><a href="/blog">Sustainability Blog</a></h3>
<p class="view-all"><a href="/blog">View All</a></p>
<ul class="news">

<% loop RSSDisplay(2,"http://sustainability.uiowa.edu/blog/feed/") %>
<li>
	<h4><a href="$Link">$Title</a></h4>
	<p>$Description.LimitWordCount(10)</p>
	<span class="more"><a href="$Link">Read More</a></span>
</li>
<% end_loop %>

</ul>



<div id = "twitFeed">
	<a class="twitter-timeline" href="https://twitter.com/UIsustainable" data-widget-id="382534614020927488">Tweets by @UIsustainable</a>
	<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</div>

<div id="social-media">

<ul>
<li><a href="http://twitter.com/uisustainable" target="_blank"><img src="$ThemeDir/images/twitter.png" alt="Twitter" width="91" height="81" title="Follow us on Twitter"/></a></li>
<li><a href="http://www.facebook.com/pages/The-University-of-Iowa-Office-of-Sustainability/251818755982" target="_blank"><img src="$ThemeDir/images/facebook.png" alt="Facebook" width="94" height="81" title="Find us on Facebook" /></a></li>
<li><a href="{$BaseHref}home/rss" target="_blank"><img src="$ThemeDir/images/rss.png" alt="RSS" width="94" height="81" title="View our RSS feed"/></a></li>
<li><a href="{$BaseHref}contact"><img src="$ThemeDir/images/email.png" alt="Email" width="92" height="81" title="Contact Us"/></a></li>
</ul>
</div>
    
</div>
<div class="clear"></div>
</div> <!--end home wrapper -->
<div class="clear"></div>
<div id="bottom-shadow"></div></div></div>


