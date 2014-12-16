<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="article">
				$Breadcrumbs
				<h1>$Title</h1>
				$Content
				$Form

				<h2 class="">Latest News</h2>
				<% loop PaginatedNewsEntries(5) %>

					<% if $Photo %><img src="$Photo.CroppedImage(360,200).URL" alt="$Title"><% end_if %>
					<h3><a href="$Link">$Title</a></h3>
					<p>$Content</p>

				<% end_loop %>
				<% include NewsPagination %>
			</div>
		</div><!-- end .col -->
	</div><!-- end .row -->
</div><!-- end .container -->