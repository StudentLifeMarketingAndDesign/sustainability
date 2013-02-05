
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


<% if Parent %>
<h3><a href="$Parent.Link">$Parent.Title</a></h3>
<% else %>
<h3>$Title</h3>
<% end_if %>



</div>
<div id="side-navigation-bottom"></div>

<% include SocialMedia %>



</div>

<div id="content" class="typography">


<h1>$Title</h1>

<% if TypeCImage %> 

<img src="<% loop TypeCImage %><% loop SetWidth(695) %> $URL <% end_loop %><% end_loop %>" alt="$Title" />
<% if TypeCCaption %> <p class="typeC-caption">$TypeCCaption</p><% end_if %>

<% end_if %>
$Content
<div class="events-holder">
<ul class="events">

<% loop allEvents %>
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

<% if EventSponsorLink %>
<p class="sponsor"><a href="$EventSponsorLink" target="_blank">$EventSponsor</a></p>
	<% else %>
		<% if EventSponsor %>
			<p class="sponsor">$EventSponsor</p>
<% end_if %>
<% end_if %>

<span class="more">
<% if EventLink %>
	<a href="$EventLink" class="external-link" target="_blank">Read More</a>
<% else %>
<% if Content %>
<a href="$Link">Read More</a>
<% end_if %>
<% end_if %>
</span>
</li>
<% end_loop %>
</ul>



<li>  <% if allEvents.MoreThanOnePage %>
<p class="pageNumbers">
<% if allEvents.PrevLink %>
<a href="$allEvents.PrevLink"><< Prev</a> |
<% end_if %>

<% loop allEvents.Pages %>
<% if CurrentBool %>
<strong>$PageNum</strong>
<% else %>
<a href="$Link" title="Go to page $PageNum">$PageNum</a>
<% end_if %>
<% end_loop %>

<% if allEvents.NextLink %>
| <a href="$allEvents.NextLink">Next >></a>
<% end_if %>
</p>
<% end_if %>  



</div></div>
</div>




<div class="clear"></div>
</div> <!--end home wrapper -->
<div id="interior-bottom-shadow"></div>










</div><!--/end middle-image div -->
</div><!--/end background graident div -->