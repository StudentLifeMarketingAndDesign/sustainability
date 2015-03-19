<% if $PagePhoto %>
	<% include MainPagePhoto %>
<% else %>
	<article class="container">
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
				</div>

				<!-- Loop Sub Pages -->
				<% include ChildPages %>

				<!-- show sidebar items if on table or mobile -->
				<div class="tablet-show">
					<% include SideBarItems %>
				</div>

			</div><!-- end .col -->
		</div><!-- end .row -->
	</article><!-- end .container -->
<% end_if %>

<!-- Tagged Events -->
	<div class="relatednews">
		<div class="container">
			<h2>Related Events</h2>
			<% loop $EventListBySearch %>
				<div class="relatednews-item">
					<h4><a href="$Link">$Title</a></h4>
					<% loop $Dates %>
						<p class="date-time">
							<% with $StartDateTime %>
								<time itemprop="startDate" datetime="$Format(c)">
									$Format(l), $Format(F) $Format(j)
								</time>
								 , $Format("g:i A")
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
									, $Format("g:i A")
								<% end_with %>
							<% end_if %>
						</p>
					<% end_loop %>
					<p>$Venue.Title</p>
				</div>
			<% end_loop %>
		</div>
	</div>

<!-- Gallery Carousel -->
<% include Gallery %>