
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

<% if HeaderImage %>
<div class="image">
<img src="<% loop HeaderImage %><% loop SetWidth(316) %> $URL <% end_loop %><% end_loop %>"/>
<% if ImageCaption %><p class="caption">$ImageCaption</p><% end_if %>
</div>
<% end_if %> 

<h1>$Title</h1>

<div class="events-holder">

<ul class="news">

<% loop getNews %>
	
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

<li>  <% if getNews.MoreThanOnePage %>
<p class="pageNumbers">
<% if getNews.NotFirstPage %>

<a href="$getNews.PrevLink"><< Prev</a> |
<% end_if %>

<% loop getNews.Pages %>
<% if CurrentBool %>
<strong>$PageNum</strong>
<% else %>
<a href="$Link" title="Go to page $PageNum">$PageNum</a>
<% end_if %>
<% end_loop %>

<% if getNews.NotLastPage %>
| <a href="$getNews.NextLink">Next >></a>
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