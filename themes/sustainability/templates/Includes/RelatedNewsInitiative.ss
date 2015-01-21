<% if URLSegment = leed-building-at-ui %>
	<% with Page(news-and-events) %>
		<% if $Entries('','leed') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','leed') %>
						<% include RelatedNewsContent %>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if URLSegment = food %>
	<% with Page(news-and-events) %>
		<% if $Entries('','food') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','food') %>
						<% include RelatedNewsContent %>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if URLSegment = transportation %>
	<% with Page(news-and-events) %>
		<% if $Entries('','transportation') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','transportation') %>
						<% include RelatedNewsContent %>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if URLSegment = biomass-fuel-project %>
	<% with Page(news-and-events) %>
		<% if $Entries('','biomass') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','biomass') %>
						<% include RelatedNewsContent %>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if $URLSegment = energy-climate %>
	<% with Page(news-and-events) %>
		<% if $Entries('','energy') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','energy') %>
						<% include RelatedNewsContent %>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if $URLSegment = recycling-and-waste-reduction %>
	<% with Page(news-and-events) %>
		<% if $Entries('','recycling') %>
			<div class="relatednews">
				<div class="container">
					<h2>Related News</h2>
					<% loop $Entries('3','recycling') %>
						<% include RelatedNewsContent %>
					<% end_loop %>
				</div>
			</div>
		<% end_if %>
	<% end_with %>
<% end_if %>



