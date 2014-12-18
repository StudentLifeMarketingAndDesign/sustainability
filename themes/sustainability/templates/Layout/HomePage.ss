<div class="container">
	<div class="content">
		$Content
		$Form

		<!-- News -->
		<% with Page(news) %>
			<% if $Entries %>
				<h2>News</h2>
				<% loop $Entries(6) %>
					<h4><a href="$Link">$Title</a></h4>
					<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
					<% if TagsCollection %>
						<div class="tags">
							<% _t('BlogSummary_ss.TAGS','Tags') %>:
							<% loop TagsCollection %>
								<a href="$Link" title="View all posts tagged '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
							<% end_loop %>
						</div>
					<% end_if %>
				<% end_loop %>
				<a href="$Link">View all News</a>
			<% end_if %>
		<% end_with %>

		<!-- Events -->
		<h2>Events</h2>
		<% with LocalistCalendar %>
			<!-- Loop Events -->
			<% loop $EventList(6) %>
				<% if $Title %><a href="$Link">$Title</a><% end_if %>
				<% if $Location %><br />$Location<% end_if %>
				<% if $LocalistLink %><br />$LocalistLink<% end_if %>
				<% if $MoreInfoLink %><br />$MoreInfoLink<% end_if %>
				<% if $Image %><br /><img src="$Image.URL" alt="$Title" style="width:80px;"><% end_if %>
				<% if $Tags %>
					<br />
					Tags:
					<% loop $Tags %>
						<a href="$Link" class="">$Title</a>
					<% end_loop %></p>
				<% end_if %>
				<% if $Types %>
					<div>
						<p><strong>Categorized under:</strong>
						<% loop $Types %>
							<a href="$Link">$Title</a>
						<% end_loop %></p>
					</div>
				<% end_if %>
				<hr>
			<% end_loop %>
			<a href="$Link">View all Events</a>
			<!-- end Loop -->
		<% end_with %>
	</div>
</div><!-- end .container -->