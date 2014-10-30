<div class="container main-content">
	<div class="content">
		<div class="article">
			<h1 class="page-title">$Title</h1>
			$Content
			$Form
			<h3 class="category-events-title">Events</h3>
		</div>
		<% with $Category %>
			<div class="event-list">
				<% loop $CalendarEvents %>
					<div class="clearfix list-item">
						<% if $PagePhoto %>
							<a href="$Link" class="img">
								<img class="unveil" src="{$ThemeDir}/images/loader.gif" data-src="{$PagePhoto.CroppedImage(200,200).URL}" alt="$Title">
							</a>
						<% end_if %>
						<div class="list-content">
							<h2 class="title"><a href="$Link">$Title</a></h2>
							<p class="meta">
							<% loop DateTimes %>
								$DateRange<br>
								<% if AllDay %>
									<% _t('ALLDAY','All Day') %>
								<% else %>
								<% if StartTime %>
									$TimeRange<br>
									<% end_if %>
								<% end_if %>
							<% end_loop %>
								$EventLocation
							</p>
							<a href="$Link" class="btn btn-default"><span class="glyphicon glyphicon-circle-arrow-right"></span> View Event Information</a>
						</div>
					</div>
				<% end_loop %>
			</div>
		<% end_with %>

		<div class="sidebar">
			<% include EventsByDate %>
			<% include Announcements %>
		</div>
	</div>
	$Breadcrumbs
</div>
