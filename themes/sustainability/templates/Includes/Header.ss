<!-- Header -->
<header class="header clearfix" role="banner">
	<div class="container clearfix">
		<h1 class="logo">
			<a href="{$BaseHref}">
				<img src="{$ThemeDir}/images/sustainability-logo.png" alt="Sustainability at Iowa" width="286">
			</a>
		</h1>
		<nav role="navigation" class="top-nav no-print">
			<ul>
				<li><a href="{$BaseHref}news-and-events/">News &amp; Events</a></li>
			</ul>
		</nav>
		<ul class="webicons no-print">
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
			<% if $SiteConfig.PinterestLink %>
			<li>
				<a href="$SiteConfig.PinterestLink" title="Pinterest" target="_blank">
					<svg class="icon-pinterest">
						<use xlink:href="#icon-pinterest"></use>
					</svg><span class="visuallyhidden">Pinterest</span>
				</a>
			</li>
			<% end_if %>
		</ul>
		<span class="shifter-handle">Menu</span>
	</div>
</header>

<!-- Navigation -->
<% include MainNav %>


