<!DOCTYPE html>
<!--[if lt IE 9]>         <html lang="en" class="lt-ie9 no-js"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
<% base_tag %>
<meta charset="utf-8">
<meta name="description" content="$Content.LimitCharacters(150)">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Home | Sustainability at Iowa</title>
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
   <script src="{$ThemeDir}/js/plugins/html5shiv.js"></script>
   <script src="{$ThemeDir}/js/plugins/respond.min.js"></script>
<![endif]-->

<!-- Nav Shifter -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<!-- <link href="{$ThemeDir}/css/jquery.fs.shifter.css" rel="stylesheet" type="text/css" media="all"> -->
<script src="{$ThemeDir}/js/jquery.fs.shifter.js"></script>
<script src="{$ThemeDir}/js/jquery.fs.naver.js"></script>

<script>
	$(document).ready(function() {
		// Shifter
		$.shifter({
			maxWidth: "767px"
		});

		// Naver
		$(".naver").naver();
	});
</script>

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
		<hr>
		<div class="address">

			<ul class="unstyled mobile-contact">
				<li>
					<a href="tel:3193355516" class="link phone">
						<svg class="icon-phone"><use xlink:href="#icon-phone"></use></svg>
						(319) 335-5516
					</a>
				</li>
				<li><a href="mailgo:sustainability@uiowa.edu">Sustainability@uiowa.edu</a></li>
				<li><a href="#">Directions</a></li>
			</ul>

		</div>
	</div>


	<!-- JS -->

	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="{$ThemeDir}/js/min/production-min.js"></script>
	<script src="division-bar/js/division-bar.js"></script>
	<% include GoogleAnalytics %>

</body>
</html>
