
<div id="content-wrapper">
<div id="middle-image">

<div id="bodywrap">


<% include Navigation %>



<div class="clear"></div>

</div><!--/end bodywrap div -->

<div id="top-shadow"></div> 
<div id="interior-wrapper">
<div id="main-content-wrapper">
<!-- <p class="breadcrumbs">$Breadcrumbs</p> -->

<div id="content-right-column">

<div id="side-navigation-top"></div>
<div id="side-navigation">


<% include SideNavigation %>


</div>
<div id="side-navigation-bottom"></div>

<% include SocialMedia %>



</div>

<div id="content" class="typography">

<h1>$Title</h1>

$Content

<br />

<% loop Children %>
<div class="type-b">
<div class="image-content$Pos">

<% if HeaderImage %> 
<div class="image-thumbnail">
<img src="<% loop HeaderImage  %><% loop SetWidth(155) %> $URL <% end_loop %><% end_loop %>" alt="$Title" />
<p class="caption">$Title</p>
</div>
<% end_if %>

<% if ExternalLink %><h3><a href="$ExternalLink" target="_blank">$Title</a></h3>
<% else %>
<h3><a href="$Link">$Title</a></h3>
<% end_if %>
<p>$Content.LimitWordCount(50)</p>
<span class="more">
<% if ExternalLink %><a href="$ExternalLink" class="external-link" target="_blank">Read More</a>
<% else %>
<a href="$Link">Read More</a>
<% end_if %>
</span> 
</div>
</div>



<% end_loop %>
<div class="clear"></div>




</div>
</div>




<div class="clear"></div>
</div> <!--end home wrapper -->
<div id="interior-bottom-shadow"></div>










</div><!--/end middle-image div -->
</div><!--/end background graident div -->