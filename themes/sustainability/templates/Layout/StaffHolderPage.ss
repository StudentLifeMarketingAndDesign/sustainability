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

				<!-- Loop Staff Members -->
				<ul class="unstyled">
					<% loop $Children %>
						<li class="clearfix ">
							<% if $Photo %>
								<div class="">
									<a href="$Link"><img class="" src="$Photo.SetWidth(200).URL" alt="$Title"></a>
								</div>
							<% end_if %>
							<div class="">
								<h4 class=""><a href="$Link">$Title</a></h4>
								<% if $EmailAddress %><a href="mailto:$EmailAddress">$EmailAddress</a><% end_if %>
								<% if $Position %><p class="">$Position</p><% end_if %>
								<% if $PhoneNumber %><p class="">$PhoneNumber</p><% end_if %>
							</div>
						</li>
					<% end_loop %>
				</ul>
			</div>

		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->