<!DOCTYPE html>
<!--[if lt IE 9]>         <html lang="en" class="lt-ie9 no-js"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
<% base_tag %>
<meta charset="utf-8">
<meta name="description" content="$Content.LimitCharacters(150)">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Home | Sustainability at Iowa</title>
<link rel="shortcut icon" href="{$BaseHref}favicon.ico" type="image/x-icon">
<link rel="icon" href="{$BaseHref}favicon.ico" type="image/x-icon">
<!--

MMMMMMMM               MMMMMMMM                               DDDDDDDDDDDDD
M:::::::M             M:::::::M                               D::::::::::::DDD
M::::::::M           M::::::::M                               D:::::::::::::::DD
M:::::::::M         M:::::::::M            +++++++            DDD:::::DDDDD:::::D
M::::::::::M       M::::::::::M            +:::::+              D:::::D    D:::::D
M:::::::::::M     M:::::::::::M            +:::::+              D:::::D     D:::::D
M:::::::M::::M   M::::M:::::::M      +++++++:::::+++++++        D:::::D     D:::::D
M::::::M M::::M M::::M M::::::M      +:::::::::::::::::+        D:::::D     D:::::D
M::::::M  M::::M::::M  M::::::M      +:::::::::::::::::+        D:::::D     D:::::D
M::::::M   M:::::::M   M::::::M      +++++++:::::+++++++        D:::::D     D:::::D
M::::::M    M:::::M    M::::::M            +:::::+              D:::::D     D:::::D
M::::::M     MMMMM     M::::::M            +:::::+              D:::::D    D:::::D
M::::::M               M::::::M            +++++++            DDD:::::DDDDD:::::D
M::::::M               M::::::M                               D:::::::::::::::DD
M::::::M               M::::::M                               D::::::::::::DDD
MMMMMMMM               MMMMMMMM                               DDDDDDDDDDDDD

                              http://studentlife.uiowa.edu/md/
-->

<!-- Typekit Fonts -->
<% include Typekit %>
<!-- CSS -->
<link rel="stylesheet" href="division-bar/css/_division-bar.css" />
<link rel="stylesheet" href="{$ThemeDir}/css/master.css">
<!-- JS -->
<!--[if lt IE 9]>
   <script src="{$ThemeDir}/js/html5shiv.js"></script>
<![endif]-->

</head>

<body class="$ClassName  $Level(2).URLSegment shifter">
	<% include Svg %>



	<div class="shifter-page">
		<% include DivisionBar %>
		<% include Header %>
		$Layout
		<% include Footer %>
	</div>

	<div class="shifter-navigation">
		<div class="mobile-navigation">
			<ul class="">
				<% loop Menu(1) %>
					<li <% if $LinkOrSection = "section" %>class="active"<% end_if %>><a href="$Link" class="link">$MenuTitle</a>
					</li>
				<% end_loop %>
			</ul>
		</div>
		<div class="consistent">
			<a href="#" class="link highlight">News &amp; Events</a>
			<a href="#" class="link highlight">Blog</a>
		</div>
		<hr />
		<div class="shifter-address">
			<div class="contain">
				<h3>Sustainability at Iowa</h3>
				<p>1680 University Capitol Centre<br />200 South Clinton St.<br />Iowa City, IA 52242</p>
			</div>
		</div>
		<hr />
		<div class="contact">
			<div>
				<a href="mailgo:sustainability@uiowa.edu" class="link">
					<svg class="icon-envelope"><use xlink:href="#icon-envelope"></use></svg>
					<span>Sustainability@uiowa.edu</span>
				</a>
			</div>
			<div>
				<svg class="icon-phone"><use xlink:href="#icon-phone"></use></svg>
				<span>(319) 335-5516</span>
			</div>
			<div>
				<a href="#" class="link">
					<svg class="icon-location"><use xlink:href="#icon-location"></use></svg>
					<span>Directions</span>
				</a>
			</div>
		</div>
	</div>


	<!-- JS -->

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<!-- <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
	<script src="{$ThemeDir}/js/build/production.min.js"></script>
	<script src="division-bar/js/division-bar.js"></script>
	<% include GoogleAnalytics %>

</body>
</html>



