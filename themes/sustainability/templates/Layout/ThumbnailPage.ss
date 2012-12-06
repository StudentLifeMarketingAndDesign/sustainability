
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

<% if ThumbnailImage %>
<div class="image">
<img src="<% control ThumbnailImage %><% control SetWidth(316) %> $URL <% end_control %><% end_control %>" alt="$Title"/>
<p class="caption">$ThumbnailCaption</p>
</div>
<% end_if %> 

<h1>$Title</h1>


$Content




</div>
</div>




<div class="clear"></div>
</div> <!--end home wrapper -->
<div id="interior-bottom-shadow"></div>










</div><!--/end middle-image div -->
</div><!--/end background graident div -->