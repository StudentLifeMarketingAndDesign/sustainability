<% if URLSegment = leed-building-at-ui %>
	<% with Page(news) %>
		<% if $Entries('','leed') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','leed') %>
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
							<!--<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>-->
						</div>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if URLSegment = food %>
	<% with Page(news) %>
		<% if $Entries('','food') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','food') %>
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
							<!--<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>-->
						</div>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if URLSegment = transportation %>
	<% with Page(news) %>
		<% if $Entries('','transportation') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','transportation') %>
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
							<!--<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>-->
						</div>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if URLSegment = biomass-fuel-project %>
	<% with Page(news) %>
		<% if $Entries('','biomass') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','biomass') %>
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
							<!--<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>-->
						</div>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if $URLSegment = energy-climate %>
	<% with Page(news) %>
		<% if $Entries('','energy') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','energy') %>
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
							<!--<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>-->
						</div>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if $URLSegment = recycling-and-waste-reduction %>
	<% with Page(news) %>
		<% if $Entries('','recycling') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','recycling') %>
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
							<!--<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>-->
						</div>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>



