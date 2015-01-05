<div class="your-class">
	<div style="background-image:url({$ThemeDir}/images/leed-hero.jpg);" class="hero-img">
		<div class="inner">
			<h3>Lorem ipsum dolor</h3>
			<p>Duis mollis, est non commodo luctus, nisi erat porttitor.</p>
		</div>
	</div>
	<div style="background-image:url({$ThemeDir}/images/hero-2.jpg);" class="hero-img">
		<div class="inner">
			<h3>Ornare Egestas Parturient</h3>
			<p>Duis mollis, est non commodo luctus, nisi erat porttitor.</p>
		</div>
	</div>
	<div style="background-image:url({$ThemeDir}/images/hero-3.jpg);" class="hero-img">
		<div class="inner">
			<h3>Vehicula Tellus Inceptos</h3>
			<p>Morbi leo risus, porta ac vestibulum at eros.</p>
		</div>
	</div>
</div>

<!-- Initiatives -->
<section class="home-initiatives">
	<div class="container">
		<h2 class="text-center">Explore Our Initiatives</h2>
		<p class="text-center">Just a few of the topics within sustainability are presented here. It's a dynamic list that we anticipate will evolve as the University community strives to be good stewards and advocates for sustainability.</p>
		<ul class="init-list justify clearfix">
			<li class="justify-item energy">
				<a href="#" class="init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-energy-128.png" alt="Energy &amp; Climate" class="init-img">
						</span>
					</span>
					<h4 class="init-title">Energy &amp; Climate</h4>
				</a>
			</li>
			<li class="justify-item recycling">
				<a href="#" class="init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-recycle-128.png" alt="Recycling" class="init-img">
						</span>
					</span>
					<h4 class="init-title">Recyling and Waste Reduction</h4>
				</a>
			</li>
			<li class="justify-item biomass">
				<a href="#" class="init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/energy-icon.png" alt="Biomass" class="init-img">
						</span>
					</span>
					<h4 class="init-title">Biomass Fuel Project</h4>
				</a>
			</li>
			<li class="justify-item leed">
				<a href="#" class="init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-building-128.png" alt="LEED Building" class="init-img">
						</span>
					</span>
					<h4 class="init-title">LEED Building at Uiowa</h4>
				</a>
			</li>
			<li class="justify-item transportation">
				<a href="#" class="justify-item init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-transportation-128.png" alt="Alternative Transportation" class="init-img">
						</span>
					</span>
					<h4 class="init-title">Alternative Transportation</h4>
				</a>
			</li>
			<li class="justify-item food">
				<a href="#" class="justify-item init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-food-128.png" alt="Food" class="init-img">
						</span>
					</span>
					<h4 class="init-title">Food</h4>
				</a>
			</li>
			<li class="justify-item filler"></li>
			<li class="justify-item filler"></li>
			<li class="justify-item filler"></li>
		</ul>
	</div>
</section>

<div class="container">

	<!-- $Content -->
	$Form

	<!-- News -->
	<% with Page(news) %>
		<% if $Entries %>
			<h2>News</h2>
			<% loop $Entries(6) %>
				<h4><a href="$Link">$Title</a></h4>
				<% if $Date %><small>$Date.Format('M. j')</small><% end_if %>
				<% if TagsCollection %>
					<div class="tags">
						<% _t('BlogSummary_ss.TAGS','Tags') %>:
						<% loop TagsCollection %>
							<a href="$Link" title="View all posts tagged '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
						<% end_loop %>
					</div>
				<% end_if %>
			<% end_loop %>
			<a href="$Link">View all News</a>
		<% end_if %>
	<% end_with %>

	<!-- Events -->
	<h2>Events</h2>
	<% with LocalistCalendar %>
		<!-- Loop Events -->
		<% loop $EventList(6) %>
			<% if $Title %><a href="$Link">$Title</a><% end_if %>
			<% if $Location %><br />$Location<% end_if %>
			<% if $LocalistLink %><br />$LocalistLink<% end_if %>
			<% if $MoreInfoLink %><br />$MoreInfoLink<% end_if %>
			<% if $Image %><br /><img src="$Image.URL" alt="$Title" style="width:80px;"><% end_if %>
			<% if $Tags %>
				<br />
				Tags:
				<% loop $Tags %>
					<a href="$Link" class="">$Title</a>
				<% end_loop %></p>
			<% end_if %>
			<% if $Types %>
				<div>
					<p><strong>Categorized under:</strong>
					<% loop $Types %>
						<a href="$Link">$Title</a>
					<% end_loop %></p>
				</div>
			<% end_if %>
			<hr>
		<% end_loop %>
		<a href="$Link">View all Events</a>
		<!-- end Loop -->
	<% end_with %>
</div><!-- end .container -->