<% if SelectedTag %>
	<!-- ========= BEGIN SELECTED TAG CONTENT ========= -->
	<div class="container">
		<div class="row">
			<!-- Side Bar -->
			<div class="col-lg-4 col-lg-push-8">
				<% include SideNav %>
			</div>

			<!-- Main Content -->
			<div class="col-lg-8 col-lg-pull-4">
				<div class="article">
					<h2 class="cat-heading-title"><% _t('BlogHolder_ss.VIEWINGTAGGED', 'Viewing entries tagged with') %> '$SelectedTag'</h2>
					<!-- Loop News -->
					<div class="newsholder-entries">
						<% loop PaginatedNewsEntries(10) %>
							<div class="newsblock clearfix <% if $Photo %>withphoto<% end_if %>">
								<div class="newsblock-info">
									<h4 class="newsblock-title"><a href="$Link">$Title</a></h4>
									<p>$Content.LimitCharacters(100)</p>
								</div>
							</div>
						<% end_loop %>
					</div>
					<% include NewsPagination %>
				</div>
			</div>
		</div><!-- end .row -->
	</div><!-- END .container -->
<% else %>

<!-- ========= BEGIN REGULAR CONTENT ========= -->
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			$Breadcrumbs
			<h1>$Title</h1>
			$Content
			$Form
			<!-- Featured News Article -->
			<div class="featured-articles">
				<% loop $allChildren %>
					<% if $IsFeatured %>
						<div class="row">
							<div class="col-md-6 col-md-push-6">
								<!-- display photo -->
								<% if $ExternalLink %>
									<a href="$ExternalLink" target="_blank"><img data-lazy="$Photo.CroppedImage(500,400).URL" alt="$Title"></a>
								<% else %>
									<a href="$Link"><img data-lazy="$Photo.CroppedImage(600,500).URL" alt="$Title"></a>
								<% end_if %>
							</div>
							<div class="col-md-6 col-md-pull-6">
								<div class="featured-content">
									<h2>Featured News</h2>
									<% if $ExternalLink %>
										<h1><a href="$ExternalLink">$Title</a></h1>
									<% else %>
										<h1><a href="$Link">$Title</a></h1>
									<% end_if %>
									<p>$Content.LimitCharacters(100)</p>
									<% if $ExternalLink %>
										<p><a href="$ExternalLink" class="continue">Continue Reading</a></p>
									<% else %>
										<p><a href="$Link" class="continue">Continue Reading</a></p>
									<% end_if %>
								</div>
							</div>
						</div>
					<% end_if %>
				<% end_loop %>
			</div>
		</div>
	</div>

	<div class="row">
		<!-- Side Bar -->
		<div class="col-lg-4 col-lg-push-8">
			<% include SideNav %>
		</div>

		<!-- Main Content -->
		<div class="col-lg-8 col-lg-pull-4">
			<div class="article">

				<h2 class="">Latest News</h2>
				<!-- Loop News -->
				<div class="newsholder-entries">
					<% loop PaginatedNewsEntries(10) %>
						<div class="newsblock clearfix <% if $Photo %>withphoto<% end_if %>">
							<div class="newsblock-info">
								<h4 class="newsblock-title"><a href="$Link">$Title</a></h4>
								<p>$Content.LimitCharacters(100)</p>
							</div>
						</div>
					<% end_loop %>
				</div>
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
<% end_if %>