<link rel="stylesheet" type="text/css" href="$ThemeDir/css/earthstyles.css" />
<!--[if IE 7]>

<![endif]-->


<div id="middle-image"><% include Navigation %>
<div id="top-shadow"></div>
<div id="earthwrapper">
<div id="feature">
               
        	<img src="$EventImage.URL" width="500"  />
        <div id="featuretext">
        	<h2>$EventName</h2>
			<h3>$EventSubheading</h3>
            <h3>$EventDate | $EventType</h3>
			<div style="clear: left;"></div>
            $TopFeature 
           <div style="clear: left;"></div> 
        </div>
             <div style="clear: left;"></div> 
    </div> <!-- end feature div-->
<div id="earthcontent">

    
    
    
    <div id="leftcolumn">
    		<div id="earthtagline">
              <h1>Earth Month Events</h1>
              <p>Protect the environment in which we live, learn and work.</p>
              </div>
           <ul><% loop EarthdayEvents %>
           
           
           
           		<% if EventImage %>
                <li>
                <% else %>
                <li class="no-image">
                <% end_if %>
                <h2>
					<% if ExLink %>
						<a href="$ExLink">$Title</a>
					<% else %>
						$Title
					<% end_if %>
					<span class="color"> $EventDate</span>
				</h2>
                <h3>$EventType</h3>
				<div class="time">
				$TimeAndLocation
				</div>
				<div style="clear: left;"></div>
                <div class="earthcontent">
				$Content
				<% if ExLink %>
					<p>
						<br />
						<a href="$ExLink">Read More</a>
					</p>
				<% end_if %>
				</div>
                <% if EventImage %>
					<% if ExLink %>
						<a href="$ExLink"><img src="$EventImage.URL" width="207" border="0" alt="$Title" /></a>
					<% else %>
						<img src="$EventImage.URL" width="207" border="0" alt="$Title" />
					<% end_if %>
				<% end_if %>
                <div style="clear: left;"></div> 
                </li> 
                <% end_loop %>
    		</ul> 
    	<div class="clear" style="clear:left;"></div>
<% if EarthDayEvents.MoreThanOnePage %>
  <p class="pagination">
  <% if EarthDayEvents.PrevLink %>
    <a href="$EarthDayEvents.PrevLink">&laquo; Prev</a> | 
  <% end_if %>
  <% loop EarthDayEvents.Pages %>
    <% if CurrentBool %>
      <strong>$PageNum</strong> 
    <% else %>
      <a href="$Link" title="Go to page $PageNum">$PageNum</a> 
    <% end_if %>
  <% end_loop %>
  <% if EarthDayEvents.NextLink %>
    | <a href="$EarthDayEvents.NextLink">Next &raquo;</a>
  <% end_if %>
  </p>
<% end_if %>

    </div><!-- end left column -->
        <div id="rightcolumn">
            <h3>Upcoming Events</h3>
            <p><a href="http://sustainability.uiowa.edu/event-submission/" class="submit">Submit your event</a></p>
                <ul>
                <% loop Children %>
                <li>
				<span class="color">$EventDate</span><br />
				<% if ExLink %>
					<a href="$ExLink">$Title</a>
				<% else %>
					$Title
				<% end_if %>
                </li>
                <% end_loop %>
                </ul>  
       </div><!-- end right column image div -->
           
           <div class="clear" style="clear:left;"></div>

</div> <!-- end earthcontent div -->
 </div><!-- end earthwrapper div-->
<div id="bottom-shadow"> 
</div>

</div> <!-- end middle image div-->
       <div class="clear" style="clear:left;"></div>

