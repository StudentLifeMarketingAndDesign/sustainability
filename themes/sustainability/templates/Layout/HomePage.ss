<% if CarouselItems %>
<div class="slickcarousel">
	<% loop CarouselItems %>
		<div class="hero-img">
			<picture>
				<!--[if IE 9]><video style="display: none;"><![endif]-->
				<source srcset="$Image.URL" media="(min-width: 768px)">
				<source srcset="$Image.SetWidth(768).URL" media="(min-width: 480px)">
				<!--[if IE 9]></video><![endif]-->
				<img srcset="$Image.SetWidth(480).URL" alt="$Title">
			</picture>
			<!-- <img data-lazy="$Image.URL" alt=""> -->
			<div class="inner">
				<h3>$Title</h3>
				<p>$SubTitle</p>
				<% if $AssociatedPageID %><a href="$AssociatedPage.Link" class="slickcarousel-btn">Learn More</a><% end_if %>
			</div>
		</div>
	<% end_loop %>
</div>
<% end_if %>



<!-- Initiatives -->
<section class="home-initiatives">
	<div class="container">
		<h2 class="text-center">Explore Our Initiatives</h2>
		<p class="text-center">Sustainability is a central priority of all aspects of our university enterprise &ndash; our operations, our academic mission, and our responsibilities to the greater society.</p>
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

	$Form

	<div class="pulse">
		<h2 class="pulse-title">Sustainability at Iowa</h2>

		<!-- Tab Menu Links -->
		<ul class="pulse-tabs clearfix" role="tablist">
			<li role="presentation" class="active">
				<a href="#news" aria-controls="news" role="tab" data-toggle="tab">News</a>
			</li>
			<li role="presentation">
				<a href="#events" aria-controls="events" role="tab" data-toggle="tab">Upcoming Events</a>
			</li>
			<li role="presentation">
				<a href="#blog" aria-controls="blog" role="tab" data-toggle="tab">Climate Narrative Blog</a>
			</li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane fade in active" id="news">
				<h3 class="mobiletitle">News</h3>
				<div class="pulse-panel">
					<% with Page(news) %>
						<% if $Entries %>
							<% loop $Entries(8) %>
								<div>
									<!-- Photo goes here -->
									<% if $Photo %>
										<div class="panel-photo">
											<% if $ExternalLink %>
												<a href="$ExternalLink" target="_blank">
													<img data-lazy="$Photo.CroppedImage(300,270).URL" alt="$Title">
												</a>
											<% else %>
												<a href="$Link">
													<img data-lazy="$Photo.CroppedImage(300,270).URL" alt="$Title">
												</a>
											<% end_if %>
											<!-- Display icon if tagged with initiative -->
											<% if TagsCollection %>
												<% loop TagsCollection %>
													<% if $Tag = leed %>
														<span class="tagicon leed"><img src="{$ThemeDir}/images/icon-building-128.png" alt="LEED Building" class="init-img"></span>
													<% end_if %>
													<% if $Tag = energy %>
														<span class="tagicon energy"><img src="{$ThemeDir}/images/icon-energy-128.png" alt="Energy &amp; Climate" class="init-img"></span>
													<% end_if %>
													<% if $Tag = recycling %>
														<span class="tagicon recycling"><img src="{$ThemeDir}/images/icon-recycle-128.png" alt="Recycling" class="init-img"></span>
													<% end_if %>
													<% if $Tag = biomass %>
														<span class="tagicon biomass"><img src="{$ThemeDir}/images/icon-biomass.png" alt="Biomass" class="init-img"></span>
													<% end_if %>
													<% if $Tag = transportation %>
														<span class="tagicon transportation"><img src="{$ThemeDir}/images/icon-transportation-128.png" alt="Alternative Transportation" class="init-img"></span>
													<% end_if %>
													<% if $Tag = food %>
														<span class="tagicon food"><img src="{$ThemeDir}/images/icon-food-128.png" alt="Food" class="init-img"></span>
													<% end_if %>
												<% end_loop %>
											<% end_if %>
											<!-- end tagged icons -->
										</div>
									<% end_if %>
									<!-- end Photo -->

									<div class="panel-content">
										<% if $ExternalLink %>
											<h4 class="panel-title"><a href="$ExternalLink" target="_blank">$Title</a></h4>
										<% else %>
											<h4 class="panel-title"><a href="$Link">$Title</a></h4>
										<% end_if %>
										<p>$Content.LimitCharacters(100)</p>
									</div>
									<% if $ExternalLink %>
										<a href="$ExternalLink" class="read external" target="_blank">Read More</a>
									<% else %>
										<a href="$Link" class="read">Read More</a>
									<% end_if %>
								</div>
							<% end_loop %>
						<% end_if %>
					<% end_with %>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="events">
				<h3 class="mobiletitle">Upcoming Events</h3>
				<div class="pulse-panel">
					<% with LocalistCalendar %>
						<!-- Loop Events -->
						<% loop $EventList.Limit(8) %>
							<div>
								<!-- Photo goes here -->
								<% if $Image %>
									<a href="$Link" class="panel-photo-event">
										<img data-lazy="$Image.URL" alt="$Title">
									</a>
								<% end_if %>
								<!-- end Photo -->
								<!-- begin content -->
								<div class="panel-content">
									<h4 class="panel-title"><a href="$Link">$Title</a></h4>
									<% loop $Dates %>
										<p class="date-time">
											<% with $StartDateTime %>
												<time itemprop="startDate" datetime="$Format(c)">
													$Format(l), $Format(F) $Format(j)
												</time>
												 <br />$Format("g:i A")
											<% end_with %>
											<% if $EndTime %>
												<% with $EndTime %>
													- $Format("g:i A")
												<% end_with %>
											<% end_if %>
											<% if $EndDate %>
												until
												<% with $EndDate %>
													<time itemprop="endDate" datetime="$Format(c)">
														$Format(l), $Format(F) $Format(j)
													</time>
													<br />$Format("g:i A")
												<% end_with %>
											<% end_if %>
										</p>
									<% end_loop %>
									<p>$Venue.Title</p>
									<!-- <p>$SummaryContent.ContextSummary(100)</p> -->
								</div>
								<a href="$Link" class="read">Read More</a>
							</div>
						<% end_loop %>
						<!-- end Loop Events -->
					<% end_with %>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="blog">
				<h3 class="mobiletitle">Climate Narrative Blog</h3>
				<div class="pulse-panel">
					<% loop $RSSDisplay("8", "http://sustainability.uiowa.edu/climatenarrative/?feed=rss2") %>
						<div>
							<% if $ThumbnailURL %>
								<div class="panel-photo">
									<a href="$Link" target="_blank">
										<img data-lazy="$ThumbnailURL" />
									</a>
								</div>
							<% end_if %>
							<div class="panel-content">
								<h4 class="panel-title"><a href="$Link" target="_blank">$Title</a></h4>
								<p>$Description.LimitCharacters(100)</p>
							</div>
							<a href="$Link" class="read" target="_blank">Read More</a>
						</div>
					<% end_loop %>
				</div>
			</div>
		</div>

	</div>







</div><!-- end .container -->