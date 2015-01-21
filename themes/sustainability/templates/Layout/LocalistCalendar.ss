<article class="container main-container">
	<div class="row">

		<!-- Side Bar -->
		<div class="col-lg-4 col-lg-push-8 sidebar">
			<% include SideNav %>
		</div>

		<!-- Main Content -->
		<div class="col-lg-8 col-lg-pull-4">
			<div class="article">
				$Breadcrumbs
				<h1>$Title</h1>
				$Content
				$Form

				<!-- Loop Events -->
					<div class="newsholder-entries">
						<% loop $EventList %>
							<div class="newsblock clearfix <% if $Photo %>withphoto<% end_if %>">
								<div class="newsblock-info">
									<% if $Image %>
										<a href="$Link">
											<img src="$Image.URL" alt="$Title" style="width: 120px;" class="right">
										</a>
									<% end_if %>
									<h4 class="newsblock-title"><a href="$Link">$Title</a></h4>
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
									<p>$Venue.Title</p>
								</div>
							</div>
						<% end_loop %>
					</div>
			</div>
		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->