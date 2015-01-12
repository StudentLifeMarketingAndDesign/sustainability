<div style="background-image: url($PagePhoto.URL);" class="mainimg-container">
	<div class="mainimg-content">
		<div class="container">
			<h1 class="maintitle">$Title</h1>

		</div>
	</div>
	<% if $URLSegment = energy-climate %>
		<span class="init-icon">
			<span>
				<img src="{$ThemeDir}/images/icon-energy-128.png" alt="Energy &amp; Climate" class="">
			</span>
		</span>
	<% end_if %>
	<% if $URLSegment = leed-building-at-ui %>
		<span class="init-icon">
			<span>
				<img src="{$ThemeDir}/images/icon-building-128.png" alt="LEED Building" class="init-img">
			</span>
		</span>
	<% end_if %>
	<% if $URLSegment = food %>
		<span class="init-icon">
			<span>
				<img src="{$ThemeDir}/images/icon-food-128.png" alt="Food" class="init-img">
			</span>
		</span>
	<% end_if %>
	<% if $URLSegment = transportation %>
		<span class="init-icon">
			<span>
				<img src="{$ThemeDir}/images/icon-transportation-128.png" alt="Alternative Transportation" class="init-img">
			</span>
		</span>
	<% end_if %>
	<% if $URLSegment = biomass-fuel-project %>
		<span class="init-icon">
			<span>
				<img src="{$ThemeDir}/images/icon-biomass.png" alt="Biomass" class="init-img">
			</span>
		</span>
	<% end_if %>
	<% if $URLSegment = recycling-and-waste-reduction %>
		<span class="init-icon">
			<span>
				<img src="{$ThemeDir}/images/icon-recycle-128.png" alt="Recycling" class="init-img">
			</span>
		</span>
	<% end_if %>
</div>

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
				$Content
				$Form
			</div>

			<!-- Loop Sub Pages -->
			<% include ChildPages %>


		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->