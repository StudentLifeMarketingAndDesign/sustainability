<article class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="article">
				$Breadcrumbs
				<h1>$Title</h1>
				<% if $Location %>$Location<% end_if %>
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
				<% if $Content %>$Content<% end_if %>
				<% if $Dates.Count > 1 %>
					<h2>All Dates</h2>
						<ul>
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
						</ul>
				<% end_if %>

			</div>
		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->