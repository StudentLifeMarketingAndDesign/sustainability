<article class="container main-container">
	<div class="row">

		<!-- Side Bar -->
		<div class="col-lg-4 col-lg-push-8 sidebar">
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
			<br />
			<!-- Loop Sub Pages -->
			<% include ChildPages %>

			<div class="tablet-show">
				<% include SideBarItems %>
			</div>

		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->

<!-- Related News -->
<% with Page(news) %>
	<% if $Entries('','academics') %>
		<div class="relatednews">
			<div class="container">
				<h2>Related News</h2>
				<% loop $Entries('3','academics') %>
					<% include RelatedNewsContent %>
				<% end_loop %>
			</div>
		</div>
	<% end_if %>
<% end_with %>

<!-- Gallery Carousel -->
<% include Gallery %>

