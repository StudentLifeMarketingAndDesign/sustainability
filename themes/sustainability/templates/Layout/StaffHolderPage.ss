<article class="container">
	<div class="row">



		<div class="col-lg-12">
			<div class="article">
				$Breadcrumbs
				<h1>$Title</h1>
				$Content
				$Form

				<!-- Loop Staff Members -->
				<ul class="staffholder justify justify-4">
					<% loop $Children %>
						<li class="justify-item">
							<% if $Photo %>
								<a href="$Link"><img src="$Photo.CroppedImage(300,400).URL" alt="$Title"></a>
							<% end_if %>
							<h4 class="title"><a href="$Link">$Title</a></h4>
							<% if $Position %><em class="position">$Position</em><% end_if %>
						</li>
					<% end_loop %>
					<li class="justify-item filler"></li>
					<li class="justify-item filler"></li>
				</ul>
				<!-- end Loop Staff Members -->

			</div>

		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->