<div class="container">
	<div class="row">
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
			</div>
		</div><!-- end .col -->
	</div><!-- end .row -->
</div><!-- end .container -->