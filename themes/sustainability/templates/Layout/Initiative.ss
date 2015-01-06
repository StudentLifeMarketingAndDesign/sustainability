<% if $PagePhoto %>
	<% include MainPagePhoto %>
<% else %>
	<article class="container">
		<div class="row">

			<!-- Side Bar -->
			<div class="col-lg-4 col-lg-push-8">
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

				<!-- Loop Sub Pages -->
				<% include ChildPages %>

				<!-- Show Related News -->
				<% include RelatedNews %>

			</div><!-- end .col -->
		</div><!-- end .row -->
	</article><!-- end .container -->
<% end_if %>


<br />
<!-- Gallery Carousel -->
<% include Gallery %>