<% if CarouselItems %>
<div class="your-class">
	<% loop CarouselItems %>
		<div style="background-image:url($Image.URL);" class="hero-img">
			<div class="inner">
				<h3>$Title</h3>
				<p>$SubTitle</p>
				<% if $AssociatedPageID %><a href="$AssociatedPage.Link" class="your-class-btn">Learn More</a><% end_if %>
			</div>
		</div>
	<% end_loop %>
</div>
<% end_if %>



<!-- Initiatives -->
<section class="home-initiatives">
	<div class="container">
		<h2 class="text-center">Explore Our Initiatives</h2>
		<p class="text-center">Just a few of the topics within sustainability are presented here. It's a dynamic list that we anticipate will evolve as the University community strives to be good stewards and advocates for sustainability.</p>
		<ul class="init-list justify clearfix">
			<li class="justify-item energy">
				<a href="{$BaseHref}initiatives/energy-climate/" class="init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-energy-128.png" alt="Energy &amp; Climate" class="init-img">
						</span>
					</span>
					<h4 class="init-title">Energy &amp; Climate</h4>
				</a>
			</li>
			<li class="justify-item recycling">
				<a href="{$BaseHref}initiatives/recycling-and-waste-reduction/" class="init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-recycle-128.png" alt="Recycling" class="init-img">
						</span>
					</span>
					<h4 class="init-title">Recyling and Waste Reduction</h4>
				</a>
			</li>
			<li class="justify-item biomass">
				<a href="{$BaseHref}initiatives/biomass-fuel-project/" class="init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-biomass.png" alt="Biomass" class="init-img">
						</span>
					</span>
					<h4 class="init-title">Biomass Fuel Project</h4>
				</a>
			</li>
			<li class="justify-item leed">
				<a href="{$BaseHref}initiatives/leed-building-at-ui/" class="init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-building-128.png" alt="LEED Building" class="init-img">
						</span>
					</span>
					<h4 class="init-title">LEED Building at Uiowa</h4>
				</a>
			</li>
			<li class="justify-item transportation">
				<a href="{$BaseHref}initiatives/transportation/" class="justify-item init-link">
					<span class="init-imgwrapper">
						<span>
							<img src="{$ThemeDir}/images/icon-transportation-128.png" alt="Alternative Transportation" class="init-img">
						</span>
					</span>
					<h4 class="init-title">Alternative Transportation</h4>
				</a>
			</li>
			<li class="justify-item food">
				<a href="{$BaseHref}initiatives/food/" class="justify-item init-link">
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

	<!-- Tabs -->
	<h2 class="tabber-title">Sustainability At UI</h2>
	<div class="tabbed">
		<menu class="tabber-menu clearfix">
			<a href="#tab-1" class="tabber-handle">News</a>
			<a href="#tab-2" class="tabber-handle">Upcoming Events</a>
			<a href="#tab-3" class="tabber-handle">Climate Narative Blog</a>
			<a href="#tab-4" class="tabber-handle">Videos</a>
		</menu>
		<div class="tabber-tab" id="tab-1">
			<div class="tabber-tab-inner">
				<ul class="clearfix">
					<!-- News -->
					<% with Page(news) %>
						<% if $Entries %>
							<% loop $Entries(4) %>
								<li>
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
								</li>
							<% end_loop %>
						<% end_if %>
					<% end_with %>
				</ul>
			</div>
		</div>
		<div class="tabber-tab" id="tab-2">
			<div class="tabber-tab-inner">
				<!-- Events -->
				<% with LocalistCalendar %>
					<!-- Loop Events -->
					<% loop $EventList(4) %>
						<% if $Title %><a href="$Link">$Title</a><% end_if %>
						<% if $Location %><br />$Location<% end_if %>
						<% if $LocalistLink %><br />$LocalistLink<% end_if %>
						<% if $MoreInfoLink %><br />$MoreInfoLink<% end_if %>
						<% if $Image %><br /><img src="$Image.URL" alt="$Title" style="width:180px;"><% end_if %>
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
			</div>
		</div>
		<div class="tabber-tab" id="tab-3">
			<div class="tabber-tab-inner">
				<!-- Blog -->
				<% loop $RSSDisplay("4", "http://sustainability.uiowa.edu/climatenarrative/?feed=rss2") %>
					<article class="news-entry $EvenOdd">
						<% if $ThumbnailURL %><a href="$Link"><img class="" src="$ThumbnailURL" /></a><% end_if %>
						<h3><a href="$Link" target="_blank">$Title</a></h3>
						<div class="news-text">
							<p>$Description.Summary(30) <a href="$Link">Continue Reading</a></p>
						</div>
					</article>
					<!-- end news-entry -->
				<% end_loop %>
			</div>
		</div>
		<div class="tabber-tab" id="tab-4">
			<div class="tabber-tab-inner">
				<p>Maecenas faucibus mollis interdum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
			</div>
		</div>
	</div>
	<!-- end Tabs -->









</div><!-- end .container -->