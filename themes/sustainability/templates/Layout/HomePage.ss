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

<div id="slider-wrapper">


<br>


<div id="feature-wrapper">


<div id="slideshow">
 <ul>
<% loop Home %>
	<% if HomeLink %>
	
		 <a href="$HomeLink" class="external-link" target="_blank">
	 	 	 <li>
		     	<img src="$FeatureImage.NiceImage.URL"  />
		      </li>
	 	 </a>  	 
	 <% else %>
	 	 <a href="$Link">
		  	 <li>
		      	<img src="$FeatureImage.NiceImage.URL"  />
		      </li>
	  	 </a>
	 <% end_if %>                    
<% end_loop  %>
</ul>
</div>

</div></div>

<!--<img src="assets/Images/Fall-2011/854-2-4-45-x-4-5-Radish-Ad.jpg" width=100 height=100/> -->
<div id="home-wrapper"> 
  
<div class="newsSection homepageSubhead" title="News"><h3><a href="{$BaseHref}news" class="homepageSubhead">NEWS & EVENTS<span class="headerLine">-------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------------------------------------------</span>
</a></h3></div>  

  
<div id="events-column">


<div id="featurePic">
	<img id="featuredPicture" src="$FeatureImage.URL">
</div>
<div id="featureText">$FeatureText</div>

<div id="whatYouCanDo"> 

<div class="whatYouCanDo homepageSubhead" title="What You Can Do"><a href="$BaseHref/what-you-can-do" class="homepageSubhead"><h3>WHAT YOU CAN DO<span class="headerLine">------------------------
--------------------------------------------------------------------</span>

</h3></a></div> 

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

	<div class="moreFromUISustainability homepageSubhead" title="News"><span class="homepageSubhead"><h3>MORE FROM UI SUSTAINABILITY<span class="headerLine">
	-------------------------------------------------------------------------------------------------------
	</span></h3></span></div>
		
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
  

    
<div id="news-column">

<!--<p class="view-all"><a href="{$BaseHref}news">View All</a></p>-->

<ul class="news">
<% loop EventNews(5) %>

	<% if ClassName == 'NewsPage' %>
	
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
			
	<% else_if ClassName == 'EventsPage' %>
			
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
		
		<p class="sponsor"><% if EventSponsor %><a href="$EventSponsorLink" target="_blank">$EventSponsor</a>
		<% end_if %></p>
		<span class="more">
		<% if EventLink %><a href="$EventLink" class="external-link" target="_blank">Read More</a>
		<% else %>
		<% if Content %>
		<a href="$Link">Read More</a>
		<% end_if %>
		<% end_if %>
		</span></li>
		
	<% end_if %>

<% end_loop %>	

</ul>

<div class="view-all"><a href="{$BaseHref}news">View All</a></div>
		
		<br /><br />
		<div class="newsSection homepageSubhead" title="Sustainability Blog"><h3><a href="$BaseHref/blog" class="homepageSubhead sustainabilitySubhead">SUSTAINABILITY BLOG<span class="headerLine">---------------------------------------------------------------------------------------------------</span></a></h3></div>
		<!--<p class="view-all"><a href="$BaseHref/blog">View All</a></p>-->
		
		
		
		<ul class="news">
		
<% loop RSSDisplay(2,"http://sustainability.uiowa.edu/blog/feed/") %>
<li>
<h4><a href="$Link">$Title</a></h4>
<p>$Description.LimitWordCount(10)</p>
<span class="more"><a href="$Link">Read More</a></span></li>

<% end_loop %>

	
</ul>

		<div class="view-all"><a href="{$BaseHref}blog">View All</a></div>



  
</div><div class="clear"></div>  
</div></div>
</div> 

<!--<div id="bottom-shadow"></div>--></div>


<script type="text/javascript" src="http://twitter.com/javascripts/blogger.js"></script>

<script src="https://api.twitter.com/1/statuses/user_timeline.json?screen_name=uisustainable&amp;include_rts=true&amp;count=1&amp;callback=twitterCallback2"></script>

 <script type="text/javascript">
		jQuery(document).ready(function($) {
		
			$("#slideshow").craftyslide({
			  'width': 900,
			  'height': 400,
			  'pagination': true,
			    'fadetime': 500,
			    'delay': 2500

			});
			
			//$('#slideshow').css = ("overflow", "hidden");
			
			//$('#slideshow img').each(function(){
				//$(this).css = ("height", "400px");
				
				//$(this).fadeOut();
			//});
			
			
		});

	</script>

<!--<script type="text/javascript" src="http://twitter.com/statuses/user_timeline/UIsustainable.json?callback=twitterCallback2&amp;count=1"></script>-->