<article class="container">
	<div class="row">

		<!-- Main Content -->
		<div class="col-sm-12">
			<div class="article">
				$Breadcrumbs
				<h1>$Title</h1>
				<hr>
				<% if $Image %>
					<img src="$Image.URL" alt="$Title" style="max-width:400px;" class="right">
				<% end_if %>

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

				<p><strong>Venue:</strong><br>$Venue.Title</p>

				<% if $Content %>
					$Content
				<% end_if %>


				<% if $Cost %><p><strong>Cost:</strong> $Cost </p><% end_if %>
				<% if $ContactName %>
					<p><strong>Contact Information:</strong><br>
					<% if $ContactEmail %>
						<a href="mailto:$ContactEmail">$ContactName</a>
					<% else %>
						$ContactName
					<% end_if %>
					</p>
				<% end_if %>
				<% if $Sponsor %>
					<p><strong>Sponsor:</strong><br> $Sponsor </p><% end_if %>
				<% if $MoreInfoLink %><a href="$MoreInfoLink" target="_blank">More information</a> <br /><% end_if %>

			</div>
		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->