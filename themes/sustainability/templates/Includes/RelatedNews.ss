<% if URLSegment = leed-building-at-ui %>
	<% with Page(news) %>
		<h2>Related News</h2>
		<% if $Entries('','leed') %>
			<% loop $Entries('3','leed') %>
				<h4><a href="$Link">$Title</a></h4>
				<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
			<% end_loop %>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if URLSegment = food %>
	<% with Page(news) %>
		<h2>Related News</h2>
		<% if $Entries('','food') %>
			<% loop $Entries('3','food') %>
				<h4><a href="$Link">$Title</a></h4>
				<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
			<% end_loop %>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if URLSegment = transportation %>
	<% with Page(news) %>
		<h2>Related News</h2>
		<% if $Entries('','transportation') %>
			<% loop $Entries('3','transportation') %>
				<h4><a href="$Link">$Title</a></h4>
				<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
			<% end_loop %>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if URLSegment = biomass-fuel-project %>
	<% with Page(news) %>
		<h2>Related News</h2>
		<% if $Entries('','biomass') %>
			<% loop $Entries('3','biomass') %>
				<h4><a href="$Link">$Title</a></h4>
				<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
			<% end_loop %>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if $URLSegment = energy-climate %>
	<% with Page(news) %>
		<h2>Related News</h2>
		<% if $Entries('','energy') %>
			<% loop $Entries('3','energy') %>
				<h4><a href="$Link">$Title</a></h4>
				<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
			<% end_loop %>
		<% end_if %>
	<% end_with %>
<% end_if %>

<% if $URLSegment = recycling-and-waste-reduction %>
	<% with Page(news) %>
		<h2>Related News</h2>
		<% if $Entries('','recycling') %>
			<% loop $Entries('3','recycling') %>
				<h4><a href="$Link">$Title</a></h4>
				<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
			<% end_loop %>
		<% end_if %>
	<% end_with %>
<% end_if %>