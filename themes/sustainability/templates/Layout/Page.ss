<% if $PagePhoto %>
	<div style="background-image: url($PagePhoto.URL);" class="mainimg-container"></div>
<% end_if %>

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


<!-- Gallery Carousel -->
<% include Gallery %>

