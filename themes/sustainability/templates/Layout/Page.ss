<% if $PagePhoto %>
	<div style="background-image: url($PagePhoto.URL);" class="mainimg-container"></div>
<% end_if %>
<article class="container">
	<div class="row">

		<!-- Side Bar -->
		<div class="col-lg-4 col-lg-push-8">
			<% include SideNav %>
		</div>

		<div class="col-lg-8 col-lg-pull-4">
			<div class="article">

				$Breadcrumbs

				<h1>$Title</h1>
				$Content
				$Form
				<% include Gallery %>
			</div>

			<!-- Loop Children -->
			<% if $Children %>
				<% loop $Children %>
					<section class="child-block ">
						<a href="$Link">
							<% if $SummaryPhoto %>
								<img src="$SummaryPhoto.CroppedImage(250,230).URL" alt="$Title">
							<% end_if %>
							<div class="wrapper">
								<h3>$Title</h3>
								<% if $Summary %>
									$Summary.LimitCharacters(120)
								<% else %>
									<p>$Content.LimitCharacters(120)</p>
									<span class="button bordered">Learn More</span>
								<% end_if %>
							</div>
						</a>
					</section>
				<% end_loop %>
			<% end_if %>
			<!-- end Loop Children -->

			<!-- Gallery -->
			<aside>
				<% if Gallerys %>
					<h2>Gallery</h2>
					<ul class="unstyled">
						<% loop Gallerys %>
							<li>
								<a href="">
									<img src="$Image.CroppedImage(250,220).URL" alt="$Title">
								</a>
							</li>
						<% end_loop %>
					</ul>
				<% end_if %>
			</aside>

		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->