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
						<% loop PaginatedNewsEntries(1) %>
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

<!-- ========= BEGIN FEATURED CONTENT ========= -->
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			$Breadcrumbs
			<h1>$Title</h1>
			$Content
			$Form

			<!-- Featured Events -->
			<div class="featured-articles">
				<% with LocalistCalendar %>
					<% if $FeaturedEvents %>
						<% loop $FeaturedEvents.Limit(3) %>
							<div class="row">
								<div class="col-md-6 col-md-push-6">
									<% if $Image %>
										<a href="$Link" class="featured-photo">
											<img src="$Image.URL" alt="$Title" style="width: 600px;">
										</a>
									<% end_if %>
								</div>
								<div class="col-md-6 col-md-pull-6">
									<div class="featured-content">
										<h2>Featured Events</h2>
										<h1><a href="$Link">$Title</a></h1>
										<!-- Venue -->
										<% if $Venue %>
											<p>$Venue.Title</p>
										<% end_if %>
										<!-- Dates -->
										<% if $Dates %>
											<% if $Dates.Count > "1" %>
													<p>multiple dates available</p>
												<% else %>
													<% loop $Dates %>
														<p class="date-time">
															<% with $StartDateTime %>
																<time itemprop="startDate" datetime="$Format(c)">
																	$Format(l), $Format(F) $Format(j)
																</time>
																 <br />$Format("g:i A")
															<% end_with %>
															<% if $EndTime %>
																<% with $EndTime %>
																	- $Format("g:i A")
																<% end_with %>
															<% end_if %>
															<% if $EndDate %>
																until
																<% with $EndDate %>
																	<time itemprop="endDate" datetime="$Format(c)">
																		$Format(l), $Format(F) $Format(j)
																	</time>
																	<br />$Format("g:i A")
																<% end_with %>
															<% end_if %>
														</p>
													<% end_loop %>
												<% end_if %>
										<% end_if %>

										<p><a href="$Link" class="continue">View Event</a></p>
									</div>
								</div>
							</div>
						<% end_loop %>
					<% end_if %>
				<% end_with %>
				<!-- loop featured news articles -->
				<% with Page(news) %>
					<% loop $Entries(8) %>
						<% if $IsFeatured %>
							<div class="row">
								<div class="col-md-6 col-md-push-6">
									<!-- display photo -->
									<% if $ExternalLink %>
										<a href="$ExternalLink" target="_blank" class="featured-photo"><img data-lazy="$Photo.CroppedImage(500,400).URL" alt="$Title"></a>
									<% else %>
										<a href="$Link" class="featured-photo"><img data-lazy="$Photo.CroppedImage(600,500).URL" alt="$Title"></a>
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
					<% end_loop %><!-- end loop children -->
				<% end_with %>

			</div>
		</div>
	</div><!-- END FEATURED CONTENT -->

	<div class="row">
		<!-- Side Bar -->
		<div class="col-lg-6">
			<h2 class="">Latest News <a href="{$BaseHref}news" class="all-link">View all news</a></h2>
			<% with Page(news) %>
			<!-- Loop News -->
			<div class="newsholder-entries">
				<% if $Entries %>
					<% loop $Entries(8) %>
						<div class="newsblock clearfix <% if $Photo %>withphoto<% end_if %>">
							<div class="newsblock-info">
								<% if $Photo %>
									<a href="$Link">
										<img src="$Photo.CroppedImage(120,120).URL" alt="$Title" class="right">
									</a>
								<% end_if %>
								<h5 class="newsblock-title"><a href="$Link">$Title</a></h5>
								<p>$Content.LimitCharacters(150)</p>
							</div>
						</div>
					<% end_loop %>
				<% end_if %>
			</div>
			<% end_with %>
		</div>



		<!-- Main Content -->
		<div class="col-lg-6">
				<h2>Upcoming Events <a href="{$BaseHref}events" class="all-link">View all events</a></h2>

				<!-- Loop Events -->
				<div class="newsholder-entries">
					<% loop $AllEvents.Limit(8) %>
						<div class="newsblock clearfix <% if $Photo %>withphoto<% end_if %>">
							<div class="newsblock-info">
								<% if $Image %>
									<a href="$Link">
										<img src="$Image.URL" alt="$Title" style="width: 120px;" class="right">
									</a>
								<% end_if %>
								<h5 class="newsblock-title"><a href="$Link">$Title</a></h5>
								<% loop $Dates %>
									<p class="date-time">
										<% with $StartDate %>
											<time itemprop="startDate" datetime="$Format(c)">
												$Format(l), $Format(F) $Format(j)
											</time>
										<% end_with %>
										<% with $StartTime %>
											 <br />$Format("g:i A")
										<% end_with %>
										<% if $EndTime %>
											<% with $EndTime %>
												- $Format("g:i A")
											<% end_with %>
										<% end_if %>
										<% if $EndDate %>
											until
											<% with $EndDate %>
												<time itemprop="endDate" datetime="$Format(c)">
													$Format(l), $Format(F) $Format(j)
												</time>
											<%-- 	<br />$Format("g:i A") --%>
											<% end_with %>
										<% end_if %>
									</p>
								<% end_loop %>
								<p>$Venue.Title</p>
							</div>
						</div>
					<% end_loop %>
				</div>
		</div>
	</div>
</div><!-- end .container -->
<% end_if %>
<br />