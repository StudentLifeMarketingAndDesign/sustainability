<div class="container">
	<div class="row">

		<!-- Main Content -->
		<div class="col-sm-12">
			<div class="article">
				$Breadcrumbs
				<h1>$Title</h1>
				<% if TagsCollection %>
					<div class="tags">
						<% _t('BlogSummary_ss.TAGS','Tags') %>:
						<% loop TagsCollection %>
							<a href="$Link" title="View all posts tagged '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
						<% end_loop %>
					</div>
				<% end_if %>
				$Content
				$Form

				<!-- Show news articles with similar tags -->
				<% if $RelatedNewsEntries %>
					<aside class="">
						<h3>Related News</h3>
						<ul class="">
							<% loop $RelatedNewsEntries(3) %>
								<li class="">
									<% if $Photo %>
										<a href="$Link">
											<img src="$Photo.CroppedImage(240,160).URL" alt="$Title">
										</a>
									<% end_if %>
									<h5><a href="$Link">$Title</a></h5>
								</li>
							<% end_loop %>
						</ul>
					</aside>
				<% end_if %>
				<!-- end related news -->

			</div>
		</div><!-- end .col -->
	</div><!-- end .row -->
</div><!-- end .container -->
<br />