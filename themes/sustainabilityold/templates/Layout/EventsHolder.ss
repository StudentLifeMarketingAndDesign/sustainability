
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

<% loop getEvents %>
	
	<% if canView %>
	
		<li>
		
		<% if NewsLink %><h4><a href="$NewsLink" target="_blank">$Title</a></h4>
		<% else %>
		<h4><a href="$Link">$Title</a></h4>
		<% end_if %>
		<% if EventDateRange %>
			<p>$EventDateRange</p>
		<% else %>
			<p class="eventDate">$EventDate.Format("F d&#44 Y")</p>
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

<li>  <% if getEvents.MoreThanOnePage %>
<p class="pageNumbers">
<% if getEvents.NotFirstPage %>

<a href="$getEvents.PrevLink"><< Prev</a> |
<% end_if %>

<% loop getEvents.Pages %>
<% if CurrentBool %>
<strong>$PageNum</strong>
<% else %>
<a href="$Link" title="Go to page $PageNum">$PageNum</a>
<% end_if %>
<% end_loop %>

<% if getEvents.NotLastPage %>
| <a href="$getEvents.NextLink">Next >></a>
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