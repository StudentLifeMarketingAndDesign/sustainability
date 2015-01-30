<div class="relatednews-item">
	<% if $ExternalLink %>
		<h4><a href="$ExternalLink" target="_blank">$Title</a></h4>
	<% else %>
		<h4><a href="$Link">$Title</a></h4>
	<% end_if %>
	<p>$Content.LimitCharacters(180)</p>
	<% if $ExternalLink %>
		<p><a href="$ExternalLink" class="read external" target="_blank">Read Article</a></p>
	<% else %>
		<p><a href="$Link" class="read">Read Article</a></p>
	<% end_if %>
</div>