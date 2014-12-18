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
			<% if URLSegment = leed-building-at-ui %>
				<% with Page(news) %>
					<h2>News about $Top.Title</h2>
					<% if $Entries('','leed') %>
						<% loop $Entries('3','leed') %>
							<h4><a href="$Link">$Title</a></h4>
							<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
						<% end_loop %>
					<% end_if %>
				<% end_with %>
			<% end_if %>

			<% if URLSegment = food %>
				<% with Page(news) %>
					<h2>News</h2>
					<% if $Entries('','food') %>
						<% loop $Entries('3','food') %>
							<h4><a href="$Link">$Title</a></h4>
							<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
						<% end_loop %>
					<% end_if %>
				<% end_with %>
			<% end_if %>

			<% if URLSegment = transportation %>
				<% with Page(news) %>
					<h2>News</h2>
					<% if $Entries('','transportation') %>
						<% loop $Entries('3','transportation') %>
							<h4><a href="$Link">$Title</a></h4>
							<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
						<% end_loop %>
					<% end_if %>
				<% end_with %>
			<% end_if %>

			<% if URLSegment = biomass-fuel-project %>
				<% with Page(news) %>
					<h2>News</h2>
					<% if $Entries('','biomass') %>
						<% loop $Entries('3','biomass') %>
							<h4><a href="$Link">$Title</a></h4>
							<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
						<% end_loop %>
					<% end_if %>
				<% end_with %>
			<% end_if %>

			<% if $URLSegment = energy-climate %>
				<% with Page(news) %>
					<h2>News</h2>
					<% if $Entries('','energy') %>
						<% loop $Entries('3','energy') %>
							<h4><a href="$Link">$Title</a></h4>
							<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
						<% end_loop %>
					<% end_if %>
				<% end_with %>
			<% end_if %>

			<% if $URLSegment = recycling-and-waste-reduction %>
				<% with Page(news) %>
					<h2>News</h2>
					<% if $Entries('','recycling') %>
						<% loop $Entries('3','recycling') %>
							<h4><a href="$Link">$Title</a></h4>
							<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
						<% end_loop %>
					<% end_if %>
				<% end_with %>
			<% end_if %>


		</div><!-- end .col -->
	</div><!-- end .row -->
</article><!-- end .container -->

<br />
<!-- Gallery Carousel -->
<% include Gallery %>