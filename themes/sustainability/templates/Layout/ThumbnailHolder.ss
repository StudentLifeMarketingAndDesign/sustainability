
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


<% include SideNavigation %>


</div>
<div id="side-navigation-bottom"></div>

<% include SocialMedia %>



</div>

<div id="content" class="typography">

<h1>$Title</h1>

$Content

<% control ChildrenOf(Sustainabilty-at-UI) %>

<div class="type-b">
<div class="image-content$Pos">

<% if ThumbnailImage %> 
<div class="image-thumbnail">
<a href="$Link"><img src="<% control ThumbnailImage  %><% control SetWidth(155) %> $URL <% end_control %><% end_control %>" alt="$Title" /></a>
<p class="caption">$Title</p>
</div>
<% end_if %>

<h3><a href="$Link">$Title</a></h3>
<p>$Content.LimitWordCount(50)</p>
<span class="more">
<% if ExternalLink %><a href="$ExternalLink" class="external-link" target="_blank">Read More</a>
<% else %>
<a href="$Link" target="_blank">Read More</a>
<% end_if %>
</span> 
</div>
</div>



<% end_control %>
<div class="clear"></div>




</div>
</div>




<div class="clear"></div>
</div> <!--end home wrapper -->
<div id="interior-bottom-shadow"></div>









</div><!--/end middle-image div -->
</div><!--/end background graident div -->