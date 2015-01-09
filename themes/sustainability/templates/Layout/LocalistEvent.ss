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

				<% loop $Venue %>
					$Title
				<% end_loop %>
				<% if $Location %>Location: $Location<% end_if %>
				<% if $URLSegment %><br />URL: $URLSegment<% end_if %>
				<% if $Cost %><br />Cost: $Cost<% end_if %>
				<% if $LocalistLink %><br />Locallist Link: $LocalistLink<% end_if %>
				<% if $MoreInfoLink %><br />More info: $MoreInfoLink<% end_if %>
				<% if $ContactName %>
					<br />
					<% if $ContactEmail %>
						<a href="mailto:$ContactEmail">$ContactName</a>
					<% else %>
						Contact: $ContactName
					<% end_if %>

				<% end_if %>
				<% if $Sponsor %><br />Sponsor: $Sponsor<% end_if %>
				<% if $Image %><br /><img src="$Image.URL" alt="$Title" style="width:80px;"><% end_if %>

				<% loop $Dates %>
					<li>
						<% with $StartDateTime %>
							<a href="$Up.Link" class="">
								<time itemprop="startDate" datetime="$Format(c)">
									$Format(l), $Format(F) $Format(j)
								</time>
							</a> $Format("g:i A")
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
								$Format("g:i A")
							<% end_with %>
						<% end_if %>
					</li>
				<% end_loop %>

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

				<% if $Content %>$Content<% end_if %>



			</div>
		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->