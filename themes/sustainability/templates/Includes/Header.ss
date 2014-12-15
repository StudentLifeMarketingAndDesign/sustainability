<!-- Header -->
<header class="header clearfix" role="banner">
	<div class="container clearfix">
		<h1 class="logo">
			<a href="{$BaseHref}">
				<img src="{$ThemeDir}/images/sustainability-logo.png" alt="Sustainability at Iowa">
			</a>
		</h1>
		<nav role="navigation" class="top-nav">
			<ul>
				<li><a href="#">News &amp; Events</a></li>
				<li><a href="#">Blog</a></li>
			</ul>
		</nav>
		<ul class="webicons">
			<li>
				<a href="#" title="Facebook">
					<svg class="icon-facebook">
						<use xlink:href="#icon-facebook"></use>
					</svg><span class="visuallyhidden">Facebook</span>
				</a>
			</li>
			<li>
				<a href="#" title="Twitter">
					<svg class="icon-twitter">
						<use xlink:href="#icon-twitter"></use>
					</svg><span class="visuallyhidden">Twitter</span>
				</a>
			</li>
			<li>
				<a href="#" title="Flickr">
					<svg class="icon-flickr">
						<use xlink:href="#icon-flickr"></use>
					</svg><span class="visuallyhidden">Flickr</span>
				</a>
			</li>
			<li>
				<a href="#" title="Instagram">
					<svg class="icon-instagram">
						<use xlink:href="#icon-instagram"></use>
					</svg><span class="visuallyhidden">Instagram</span>
				</a>
			</li>
		</ul>
		<span class="shifter-handle">Menu</span>
	</div>

	<!-- <a class="menu-icon">
		<span>Menu</span>
	</a> -->
</header>

<!-- Navigation -->

<nav role="navigation" class="nav-wrapper">
	<div class="container">
		<ul class="main-nav clearfix">
			<% loop Menu(1) %>
				<li <% if $LinkOrSection = "section" %>class="active"<% end_if %>><a href="$Link">$MenuTitle</a>
					<!-- Dropdown Menu -->
					<% if Children %>
						<ul class="main-navdrop">
						<% loop Children %>
							<li <% if $LinkOrCurrent = "current" %>class="active"<% end_if %>><a href="$Link">$MenuTitle</a></li>
						<% end_loop %>
						</ul>
					<% end_if %>
					<!-- end dropdown menu -->
				</li>
			<% end_loop %>
		</ul>
	</div>
</nav>