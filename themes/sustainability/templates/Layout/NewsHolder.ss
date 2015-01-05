<div class="container">
	<div class="row">

		<!-- Side Bar -->
		<div class="col-lg-4 col-lg-push-8">
			<% include SideNav %>
		</div>

		<!-- Main Content -->
		<div class="col-lg-8 col-lg-pull-4">
			<div class="article">
				$Breadcrumbs
				<h1>$Title</h1>
				$Content
				$Form

				<h2 class="">Latest News</h2>
				<!-- Loop News -->
				<% loop PaginatedNewsEntries(5) %>
					<% if $Photo %><img src="$Photo.CroppedImage(360,200).URL" alt="$Title"><% end_if %>
					<h3><a href="$Link">$Title</a></h3>
					<p>$Content</p>
				<% end_loop %>
				<% include NewsPagination %>
			</div>
			<hr>
			<h2>Upcoming Events</h2>
			<% with LocalistCalendar %>
				<!-- Loop Events -->
				<% loop $EventList(10) %>
					<% if $Title %><a href="$Link">$Title</a><% end_if %>
					<% if $Location %><br />$Location<% end_if %>
					<% if $URLSegment %><br />$URLSegment<% end_if %>
					<% if $Cost %><br />$Cost<% end_if %>
					<% if $LocalistLink %><br />$LocalistLink<% end_if %>
					<% if $MoreInfoLink %><br />$MoreInfoLink<% end_if %>
					<% if $ContactName %><br />$ContactName<% end_if %>
					<% if $ContactEmail %><br />$ContactEmail<% end_if %>
					<% if $Sponsor %><br />$Sponsor<% end_if %>
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
				<!-- end Loop -->
			<% end_with %>
		</div>
	</div>
</div><!-- end .container -->