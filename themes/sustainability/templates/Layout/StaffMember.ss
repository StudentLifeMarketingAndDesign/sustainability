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
				<img src="$Photo.SetWidth(400).URL" alt="$Name">
				<h2>$Position</h2>
				<ul>
					<li>Email: <a href="mailto:$EmailAddress">$EmailAddress</a></li>
					<li>Phone: $Phone</li>
				</ul>
				$Content
				$Form
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

		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->