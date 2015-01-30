<div class="container">
	<div class="row">

		<!-- Main Content -->
		<div class="col-sm-12">
			<div class="article newsentry">
				$Breadcrumbs
				<h1 class="entry-title">$Title</h1>
				<p class="entry-date">
					Posted on <time datetime="$Date.format(c)" itemprop="datePublished">$Date.format(F d Y)</time>
				</p>
				<hr />
				<% if $Photo %>
					<img src="$Photo.SetWidth(400).URL" alt="" class="right entryphoto">
				<% end_if %>

				$Content
				$Form

				<!-- Show Tags -->
				<% if TagsCollection %>
					<div class="tags">
						<% _t('BlogSummary_ss.TAGS','Tags') %>:
						<% loop TagsCollection %>
							<a href="$Link" title="View all posts tagged '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
						<% end_loop %>
					</div>
				<% end_if %>


			</div>
		</div><!-- end .col -->
	</div><!-- end .row -->

</div><!-- end .container -->

<!-- Show news articles with similar tags -->
<% if $RelatedNewsEntries %>
<div class="relatednews">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<aside>
					<h2>Related News</h2>
					<% loop $RelatedNewsEntries(3) %>
						<% include RelatedNewsContent %>
					<% end_loop %>
				</aside>
			</div>
		</div>
	</div>
</div>
<% end_if %><!-- end related news -->