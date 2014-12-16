<article class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="article">

				$Breadcrumbs

				<h1>$Title</h1>
				$Content
				$Form
			</div>

			<!-- Loop Events -->
			<% loop $EventList(4) %>
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

		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->