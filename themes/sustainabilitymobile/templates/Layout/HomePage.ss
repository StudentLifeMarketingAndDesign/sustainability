<div class="typography">

<% if Events %>
	<h1>Upcoming Events</h1>
	<ul>
	<% control Events %>
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
	</li>
	<% end_control %>
	</ul>
<% end_if %>

	<h1>News</h1>
	<% control News %>
	<h2><a href="$Link">$Title</a></h2>
	<p>$Content.Summary(30)&nbsp;<a href="$Link">[read more]</a></p>
	
	<% end_control %>

</div>