
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

<div id="media-column"> 
<% if HeaderImage %>
<div class="image">
<img src="<% loop HeaderImage %><% loop SetWidth(316) %> $URL <% end_loop %><% end_loop %>" alt="$Title"/>
<% if ImageCaption %>
<p class="caption">$ImageCaption</p>
<% end_if %> 
</div>
<% end_if %>

<% if FlickrSetnumber %>

<object class="interior-slideshow" width="316" height="300" type="application/x-shockwave-flash" data="http://www.flickr.com/apps/slideshow/show.swf?v=71649">
<param value="offsite=true&amp;lang=en-us&amp;page_show_url=%2Fphotos%2F{$FlickrUsername}%2Fsets%2F{$FlickrSetnumber}%2Fshow%2F&amp;page_show_back_url=%2Fphotos%2F{$FlickrUsername}%2Fsets%2F{$FlickrSetnumber}%2Fshow%2F&amp;set_id={$FlickrSetnumber}&amp;jump_to=" name="flashvars" />
<param value="true" name="allowFullScreen" />
<param value="http://www.flickr.com/apps/slideshow/show.swf?v=71649" name="src" />
<param value="true" name="allowfullscreen" /> </object>

<% end_if %> 

<% if SongFile %>
<div id="player">
<h3>Audio</h3>
<object type="application/x-shockwave-flash" data="$BaseHref/mysite/code/dewplayer/dewplayer.swf" width="300" height="20" id="dewplayer" name="dewplayer">
<param name="wmode" value="transparent" />
<param name="movie" value="$BaseHref/mysite/code/dewplayer/dewplayer.swf" />
<param name="flashvars" value="mp3={$SongFile.URL}&amp;showtime=1" />
</object>
<% if SongCaption %>
<p>$SongCaption</p>
<% end_if %> 
</div>
<% end_if %> 

<% if VideoLink %>
<div id="video">
<object id="video" width="315" height="255"><param name="movie" value="http://www.youtube.com/v/{$VideoLink}&hl=en_US&fs=1&"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/{$VideoLink}&hl=en_US&fs=1&"" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="315" height="255"></embed></object>
</div>
<% if VideoCaption %>
<p class="video-caption">$VideoCaption</p>
<% end_if %> 
<% end_if %> 

</div>

<p><strong>
<% if EventDate %>$EventDate.Format(F d&#44; Y)<% end_if %>
<% if EventDateRange %>$EventDateRange<% end_if %></strong>
<em>
<% if EventTime %>- $EventTime<% end_if %>
<% if EventLocation %>- $EventLocation<% end_if %></em></p>

<% if EventSponsorLink %>
<p class="sponsor"><a href="$EventSponsorLink" target="_blank">$EventSponsor</a></p>
	<% else %>
		<% if EventSponsor %>
			<p class="sponsor">$EventSponsor</p>
<% end_if %>
<% end_if %>
$Content




</div>
</div>




<div class="clear"></div>
</div> <!--end home wrapper -->
<div id="interior-bottom-shadow"></div>










</div><!--/end middle-image div -->
</div><!--/end background graident div -->