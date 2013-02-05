
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






<% loop Children %>


<% if ClassName = InteriorPage %>

    <% if FeaturedOnParent %>
        <h2><a href="$Link">$Title</a></h2>
        
        <% if HeaderImage %>
			<div class="image-box">
			<img class="right" src="<% loop HeaderImage %><% loop SetWidth(316) %> $URL <% end_loop %><% end_loop %>"/>
			 <% if ImageCaption %><p class="typeC-caption">$ImageCaption</p><% end_if %>
			</div>
        <% end_if %>
        
        
        <p>$Content.LimitWordCount(100)</p>
        
        <span class="more">
        <% if ExternalLink %>
        	<a href="$ExternalLink" class="external-link" target="_blank">Read More</a>
        <% else %>
        	<a href="$Link" target="_blank">Read More</a>
        <% end_if %>
        
        </span> <br />
        <div class="clear"></div>
        
	<% end_if %>
        
<% else_if ClassName = ThumbnailHolder %>
	<% if FeaturedOnParent %>
        <div class="thumbnail-holder">
            <h2 class="overview"><a href="$Link">$Title</a></h2>
            <br />
            <div class="thumbnail-background">
            <% loop Children %>
            <div class="image-content$Pos">
            
            <% if ThumbnailImage %> 
            <div class="image-thumbnail">
            <img src="<% loop ThumbnailImage  %><% loop SetWidth(155) %> $URL <% end_loop %><% end_loop %>" alt="$Title" />
            <% if ThumbnailCaption %> <p class="caption">$ThumbnailCaption</p><% end_if %>
            </div>
            <% end_if %>
            
            <% if ExternalLink %><h3><a href="$ExternalLink" target="_blank">$Title</a></h3>
            <% else %>
            <h3><a href="$Link">$Title</a></h3>
            <% end_if %>
            <p>$Content.LimitWordCount(11)</p>
            <span class="more">
            <% if ExternalLink %><a href="$ExternalLink" class="external-link" target="_blank">Read More</a>
            <% else %>
            <a href="$Link" target="_blank">Read More</a>
            <% end_if %>
            </span> 
            </div>
            <% end_loop %>
            <div class="clear"></div>
            </div>
        </div>
        
    <% end_if %>
    <% end_if %>

<% end_loop %>
<div class="clear"></div>




</div>
</div>




<div class="clear"></div>
</div> <!--end home wrapper -->
<div id="interior-bottom-shadow"></div>










</div><!--/end middle-image div -->
</div><!--/end background graident div -->