
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

<% if HeaderImage %>
<div class="image">
<img src="<% loop HeaderImage %><% loop SetWidth(316) %> $URL <% end_loop %><% end_loop %>" alt="$Title"/>
<% if ImageCaption %><p class="caption">$ImageCaption</p><% end_if %> 
</div>
<% end_if %> 

<h1>$Title</h1>

$Content

<br />

<% loop Children %>
<div class="type-d">
<h2><a href="$Link">$Title</a></h2>
<p>$Content</p>


<% loop Children %>
<h5><a href="$Link">$Title</a></h5>

<% end_loop %>
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