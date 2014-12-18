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

				<img src="$Photo.SetWidth(500).URL" alt="$Name">
				<h1>$Title</h1>
				<% if $Position %><h3>$Position</h3><% end_if %>
				<% if $EmailAddress || $PhoneNumber %>
				<ul>
					<% if $EmailAddress %><li>Email: <a href="mailto:$EmailAddress">$EmailAddress</a></li><% end_if %>
					<% if $PhoneNumber %><li>Phone: $PhoneNumber</li><% end_if %>
				</ul>
				<% end_if %>
				$Content
				$Form
			</div>

			<!-- Loop Sub Pages -->
			<% include ChildPages %>

		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->