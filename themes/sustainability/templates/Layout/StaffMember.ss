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
				<div class="staffmember <% if $Position %>position<% end_if %>">
					<h1 class="title">$Title</h1>
					<!-- Position -->
					<% if $Position %>
						<h3 class="position">$Position</h3>
					<% end_if %>
					<hr />
					<img src="$Photo.SetWidth(400).URL" alt="$Name" class="staffmember-img">

					<!-- Email & Phone -->
					<% if $EmailAddress || $PhoneNumber %>
						<ul class="details">
							<% if $EmailAddress %><li><strong>Email:</strong> <a href="mailto:$EmailAddress">$EmailAddress</a></li><% end_if %>
							<% if $PhoneNumber %><li><strong>Phone:</strong> $PhoneNumber</li><% end_if %>
						</ul>

					<% end_if %>

					$Content
					$Form
				</div>
			</div>

			<!-- Loop Sub Pages -->
			<% include ChildPages %>

		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->
<br />