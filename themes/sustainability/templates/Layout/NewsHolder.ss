
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
<img src="<% control HeaderImage %><% control SetWidth(316) %> $URL <% end_control %><% end_control %>"/>
<% if ImageCaption %><p class="caption">$ImageCaption</p><% end_if %>
</div>
<% end_if %> 

<h1>$Title</h1>

<div class="events-holder">

<ul class="news">
<% control allNews %>
<li>

<% if NewsLink %><h4><a href="$NewsLink" target="_blank">$Title</a></h4>
<% else %>
<h4><a href="$Link">$Title</a></h4>
<% end_if %>
<p class="date">
<% if NewsDate %>$NewsDate.Format(F d&#44; Y)<% end_if %>
</p>
<p>$Content.LimitWordCount(20)</p>
<span class="more">
<% if NewsLink %><a href="$NewsLink" class="external-link" target="_blank">Read More</a>
<% else %>
<a href="$Link" target="_blank">Read More</a>
<% end_if %>
</span></li>
<% end_control %>

</ul>



<li>  <% if allNews.MoreThanOnePage %>
<p class="pageNumbers">
<% if allNews.PrevLink %>
<a href="$allNews.PrevLink"><< Prev</a> |
<% end_if %>

<% control allNews.Pages %>
<% if CurrentBool %>
<strong>$PageNum</strong>
<% else %>
<a href="$Link" title="Go to page $PageNum">$PageNum</a>
<% end_if %>
<% end_control %>

<% if allNews.NextLink %>
| <a href="$allNews.NextLink">Next >></a>
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