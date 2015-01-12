<div class="container">
	<div class="row">

		<!-- Side Bar -->
		<div class="col-lg-4 col-lg-push-8">
			<% include SideNav %>
		</div>

		<!-- Main Content -->
		<div class="col-lg-8 col-lg-pull-4">
			<div class="article newsentry">
				$Breadcrumbs
				<h1 class="entry-title">$Title</h1>
				<p class="entry-date">
					Posted on <time datetime="$Date.format(c)" itemprop="datePublished">$Date.format(F d Y)</time>
				</p>
				<p><img src="$Photo.CroppedImage(800,500).URL" alt=""></p>

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

				<!-- Show news articles with similar tags -->
				<% if $RelatedNewsEntries %>
					<hr>
					<aside class="">
						<h3>Related News</h3>
						<ul class="unstyled">
							<% loop $RelatedNewsEntries(5) %>
								<li class="">
									<!--<% if $Photo %>
										<a href="$Link">
											<img src="$Photo.CroppedImage(240,160).URL" alt="$Title">
										</a>
									<% end_if %>
									-->
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