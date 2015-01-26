<!-- Footer -->
<footer class="footer clearfix" role="contentinfo">
	<div class="footer-top">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<nav role="navigation" class="footer-nav">
						<ul class="clearfix">
							<% loop Menu(1) %>
								<li><a href="$Link">$MenuTitle</a></li>
							<% end_loop %>
						</ul>
					</nav>
				</div><!-- end col -->
				<div class="col-md-3">
					<!-- Social Media -->
					<ul class="webicons unstyled clearfix">
						<% if $SiteConfig.FacebookLink %>
						<li>
							<a href="$SiteConfig.FacebookLink" title="Facebook" target="_blank">
								<svg class="icon-facebook">
									<use xlink:href="#icon-facebook"></use>
								</svg><span class="visuallyhidden">Facebook</span>
							</a>
						</li>
						<% end_if %>
						<% if $SiteConfig.TwitterLink %>
						<li>
							<a href="$SiteConfig.TwitterLink" title="Twitter" target="_blank">
								<svg class="icon-twitter">
									<use xlink:href="#icon-twitter"></use>
								</svg><span class="visuallyhidden">Twitter</span>
							</a>
						</li>
						<% end_if %>
						<% if $SiteConfig.FlickrLink %>
						<li>
							<a href="$SiteConfig.FlickrLink" title="Flickr" target="_blank">
								<svg class="icon-flickr">
									<use xlink:href="#icon-flickr"></use>
								</svg><span class="visuallyhidden">Flickr</span>
							</a>
						</li>
						<% end_if %>
						<% if $SiteConfig.InstagramLink %>
						<li>
							<a href="$SiteConfig.InstagramLink" title="Instagram" target="_blank">
								<svg class="icon-instagram">
									<use xlink:href="#icon-instagram"></use>
								</svg><span class="visuallyhidden">Instagram</span>
							</a>
						</li>
						<% end_if %>
					</ul>
				</div><!-- end col -->
			</div><!-- end .row -->
		</div><!-- end .container -->
	</div>
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-5 col-md-push-7">
					<ul class="sponsors clearfix">
						<li><a href="https://stars.aashe.org/"><img src="{$ThemeDir}/images/stars.png" alt="AASHA Stars" width="75"></a></li>
						<li><a href="http://www.usgbc.org/" title="U.S. Green Building Council"><img src="{$ThemeDir}/images/usgbc.png" alt="U.S. Green Building Council" width="75"></a></li>
						<li><a href="http://www.appa.org/"><img src="{$ThemeDir}/images/aapa.png" alt="AAPA Logo" width="75"></a></li>
						<li><a href="http://www.aashe.org/"><img src="{$ThemeDir}/images/aashe.png" alt="Association for the Advancement of Sustainability in Higher Education" width="75"></a></li>
					</ul>
				</div><!-- end col -->
				<div class="col-xs-6 col-md-4 col-md-pull-5">
					<a href="http://uiowa.edu" class="dosl-logo">
						<img src="{$ThemeDir}/images/uiowaDome.png" alt="University of Iowa" width="266">
					</a>
				</div><!-- end col -->
				<div class="col-xs-6 col-md-3 col-md-pull-5">
					<div itemscope itemtype="http://schema.org/LocalBusiness" class="address">
						<div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
							<span itemprop="streetAddress">1680 University Capitol Centre<br>200 South Clinton St.</span><br/>
							<span itemprop="addressLocality">Iowa City</span>,
							<span itemprop="addressRegion">IA</span> <span itemprop="postalCode">52242</span>
						</div>
						<span itemprop="telephone">(319) 335-5516</span><br/>
						<a href="mailto:sustainability@uiowa.edu">Sustainability@uiowa.edu</a>
					</div>
				</div><!-- end col -->
			</div><!-- end .row -->
			<div class="row">
				<div class="col-xs-12">
					<hr>
					<p class="copyright">&copy; $Now.Year <a href="http://www.uiowa.edu/" target="_blank">The University of Iowa</a>. All Rights Reserved.</p>
				</div>
			</div>



		</div><!-- end .container -->
	</div>

</footer>